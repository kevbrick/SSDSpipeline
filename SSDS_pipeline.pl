use strict; 
use Switch;
use Getopt::Long;
use SSDS_pipeline;

GetOptions ('g=s'       	=> \(my $genome),
            'bam=s'     	=> \(my $bam),
            'bamAligned+'   => \(my $bamAligned),
			'fq1=s'			=> \(my $fastqR1),
			'fq2=s'			=> \(my $fastqR2),
            'n=i'       	=> \(my $nCores = 4),
			'r1BP=i'		=> \(my $read1BP = 36),
			'r2BP=i'		=> \(my $read2BP = 40),
			'splitSz=s' 	=> \(my $splitSize = 20000000),
            'outdir=s'  	=> \(my $outdir),
            'sample=s'  	=> \(my $sampleID),
            'date=s'    	=> \(my $sampleDate),
            'lane=s'    	=> \(my $sampleLane),
            'outname=s' 	=> \(my $outname),
            'bwaVers=s' 	=> \(my $BWAversion = '0.5'), ## alternative is 0.7
            'v+'        	=> \(my $verbose),
            'f+'        	=> \(my $force),
            'run+'      	=> \(my $run));

die ("BWA_RA is only available for --bwaVers 0.5 or 0.7 [not $BWAversion]\n") 		  unless ($BWAversion !~ s/^(0.[57]).+$/$1/);
die ("Please specify full path to BAM file [$bam]\n") 					  if     ($bam && $bam !~ /\//);
die ("BAM file [$bam] does not exist\n")			 			  if     ($bam && not (-e $bam));
die ("Must provide --outname with aligned BAM file\n")		 			  if     ($bamAligned && not ($outname));
die ("Must provide --outDir with aligned BAM file\n")		 			  if     ($bamAligned && not ($outdir));
die ("Please specify full path to Read1 FastQ file [$fastqR1]\n") 			  if     ($fastqR1 && $fastqR1!~ /\//);
die ("Read1 FastQ file [$fastqR1] does not exist\n")					  if     ($fastqR1 && not (-e $fastqR1));
die ("Please specify full path to Read2 FastQ file [$fastqR2]\n") 			  if     ($fastqR2 && $fastqR2 !~ /\//);
die ("Read2 FastQ file [$fastqR2] does not exist\n")					  if     ($fastqR2 && not (-e $fastqR2));
die ("No valid inputs ... specify --bam or --fq1\n")					  unless (-e $fastqR1 || -e $bam);
die ("Please specify read group data (--sample --date --lane)\n") 			  unless ($sampleID && $sampleDate && $sampleLane);

die ("Please set the correct FASTXTOOLKIT path \n") 			  		  unless (-e $ENV{'SSDSFASTXPATH'}.'/fastx_trimmer');

$outdir = $outdir?$outdir.'/':($bam?$bam:$fastqR1);
$outdir =~ s/^(.+\/).*/$1/;
$outdir =~ s/\/\//\//;
die ("EXITING: Output folder [$outdir] does not exist.\n") unless (-d $outdir);

my $gOK = $genome?$genome:checkSpecies($bam?$bam:$fastqR1);
$genome = ($genome?$genome:$gOK);
die ("EXITING: BAM genome doesn't match genome provided [$genome ... v ... $gOK].\n") unless ($genome eq $gOK);

my ($PicardPath,$GenomesPath,$samtoolsPath,$TmpPath,$ssPipelinePath,$genome_fa,$idx) = genPaths($genome,$BWAversion);
die ("EXITING: Sorry, genome [$genome] NOT supported ... update the ssPipeline.pm module.\n") unless (-e $genome_fa);

## Set noRun
my $noRun = $run?0:1;
#sysAndPrint('find /tmp -user "brickkm" 2>e.e |xargs rm -rf',$verbose,$noRun);
sysAndPrint('rm '.$TmpPath.'/*',$verbose,$noRun);

## Gunzip fastq.gz files
if ($fastqR1 =~ /gz$/){
	my $tmpFastqR1 = $fastqR1; $tmpFastqR1 =~ s/^.*\/(.+)\.gz/$1/; $tmpFastqR1 = $TmpPath.'/'.$tmpFastqR1;
	my $tmpFastqR2 = $fastqR2; $tmpFastqR2 =~ s/^.*\/(.+)\.gz/$1/; $tmpFastqR2 = $TmpPath.'/'.$tmpFastqR2;
	sysAndPrint("gunzip -c $fastqR1 >$tmpFastqR1",$verbose,$noRun);
	sysAndPrint("gunzip -c $fastqR2 >$tmpFastqR2",$verbose,$noRun);
	($fastqR1,$fastqR2) = ($tmpFastqR1,$tmpFastqR2);
}

my $nameStub; 

if ($outname){
	$nameStub = $outname;
}else{
	$nameStub 	 = $bam?$bam:$fastqR1;
	$nameStub 	 =~ s/^.*\///;
	$nameStub 	 =~ s/^(.+)\.\S+/$1/;
	$nameStub    =~ s/[\.\_]R[12]//;
#	$nameStub        = "rand_".int(1000000*rand()) unless ($nameStub);
}

die if ($nameStub eq $fastqR1 || $nameStub eq $bam);

$genome = lc($genome);

my $oFile = "$outdir\/$nameStub\.ITRId.OUT"; 
my $eFile = "$outdir\/$nameStub\.ITRId.ERR"; 

## Establish which BWA to use
my ($bwa_binary,$bwaRA_binary);

if ($BWAversion eq '0.5'){
	$bwa_binary   = $ssPipelinePath.'/bwa_0.5.9';
	$bwaRA_binary = $ssPipelinePath.'/bwa_ra_0.5.9';
}

if ($BWAversion eq '0.7'){
	$bwa_binary   = $ssPipelinePath.'/bwa_0.7.12';
	$bwaRA_binary = $ssPipelinePath.'/bwa_ra_0.7.12';
}

# Initial filename preparation
my $outBAM_unsorted = "$TmpPath\/$nameStub\.bwa_$genome.bam";
my $outBAM_sorted   = "$TmpPath\/$nameStub\.bwa_$genome.sorted.bam";
my $outBAM_Aln 	    = "$outdir\/$nameStub\.sortedAln.$genome\.bam";
my $outBAM_Aln_ERR  = "$outdir\/$nameStub\.sortedAln.$genome\.ERR";
my $outBAM_Aln_OUT  = "$outdir\/$nameStub\.sortedAln.$genome\.OUT";

my $fixedBam = "$TmpPath\/$nameStub\.fixed.$genome\.bam";
my $TRIMFQ1	 = "$TmpPath\/$nameStub\.trim.R1.fq";
my $TRIMFQ2	 = "$TmpPath\/$nameStub\.trim.R2.fq";
my $FQR1	 = "$TmpPath\/$nameStub\.R1.fq";
my $FQR2	 = "$TmpPath\/$nameStub\.R2.fq";
my $SAI_R1	 = "$TmpPath\/$nameStub\.R1.sai";
my $SAI_R2	 = "$TmpPath\/$nameStub\.R2.sai";

my @cmd;

if (not (-e "$outBAM_Aln\.bai") || $force){
	#1. Prepare FastQ files if necessary. (Picard)
	unless ($fastqR1 && -e ($fastqR1) && $fastqR2 && -e ($fastqR2)){
		## KB 01-18-2017: Modified to use newer PICARD version. 
		#  Picard 1.85 dies in rare cases when bwa splits a PE alignment such that there is >1 line entries for a given read in the bam
		#  I honestly don't know why it does that, but newer versions of PICARD seem to deal with this without killing the process. 
		#push @cmd, 'java -jar '.$PicardPath.'FixMateInformation.jar I='.$bam.' O='.$fixedBam.' SORT_ORDER=queryname VALIDATION_STRINGENCY=LENIENT TMP_DIR='.$TmpPath;
		#push @cmd, 'java -jar '.$PicardPath.'SamToFastq.jar READ1_MAX_BASES_TO_WRITE='.$read1BP.' READ2_MAX_BASES_TO_WRITE='.$read2BP.' I='.$fixedBam.' F='.$FQR1.' F2='.$FQR2.' VALIDATION_STRINGENCY=SILENT TMP_DIR='.$TmpPath;
		push @cmd, 'java -jar '.$PicardPath.'/picard.jar FixMateInformation I='.$bam.' O='.$fixedBam.' SORT_ORDER=queryname VALIDATION_STRINGENCY=LENIENT TMP_DIR='.$TmpPath;
		push @cmd, 'java -jar '.$PicardPath.'/picard.jar SamToFastq READ1_MAX_BASES_TO_WRITE='.$read1BP.' READ2_MAX_BASES_TO_WRITE='.$read2BP.' I='.$fixedBam.' F='.$FQR1.' F2='.$FQR2.' VALIDATION_STRINGENCY=SILENT TMP_DIR='.$TmpPath;
	}else{
		$FQR1 = trimFastq($fastqR1,$TRIMFQ1,$read1BP);
		$FQR2 = trimFastq($fastqR2,$TRIMFQ2,$read2BP);
		die ("FASTQ trimming failed ($FQR1)\n") unless ($FQR1);
		die ("FASTQ trimming failed ($FQR2)\n") unless ($FQR2);
		die ("Trimmed FASTQ does not exist ($FQR1)\n") unless (-e $FQR1);
		die ("Trimmed FASTQ does not exist ($FQR2)\n") unless (-e $FQR2);

	}
	
	#2. Alignment to genome:
	#   BWA align first read/ BWA_RA align second read:
	push @cmd, join(" ",$bwa_binary.' aln -t',$nCores,$genome_fa,$FQR1,'>'.$SAI_R1); 
	push @cmd, join(" ",$bwaRA_binary.' aln -t',$nCores,$genome_fa,$FQR2,'>'.$SAI_R2); 
	
	#3. Pair reads using BWA
	push @cmd, join(" ",$bwa_binary.' sampe ',$genome_fa,$SAI_R1,$SAI_R2,$FQR1,$FQR2,'| java -jar '.$PicardPath.'/picard.jar SamFormatConverter VALIDATION_STRINGENCY=LENIENT TMP_DIR='.$TmpPath.' I=/dev/stdin O='.$outBAM_unsorted);
	#4. Sort BAM
	
	push @cmd, join(" ",$ssPipelinePath.'/sortBAM --v --g ',$genome,$outBAM_unsorted);
	push @cmd, join(" ",$samtoolsPath.'/samtools view -f 2 -bh ',$outBAM_sorted,'>'.$outBAM_Aln);
	push @cmd, $samtoolsPath.'/samtools index '.$outBAM_Aln;
	
}

my $dateCmd = 'date +%Y-%m-%H\ %R';
my $disDate = `$dateCmd`; chomp $disDate;

#5. ITR_id & ssDNA type1/type2/dsDNA bed files creation. Field 4 is "read1_match_Q"_"read2_match_Q", where read1/2_match_Q is Phred Q value for alignment quality. Can be used to extract high quality non-repetitive matches. Field 5 is "ITR_length"_"uH_length";
push @cmd, "perl $ssPipelinePath\/parseITRs.pl --temp $TmpPath --bam $outBAM_Aln --output bedbam --outdir $outdir --splitSz $splitSize --g $genome --gOK >$oFile 2>$eFile";

for my $cmd(@cmd){
print $cmd."\n";
    sysAndPrint($cmd,$verbose,$noRun);
}

my @RGcmd;
my %nameHash;
my $filesMissing = getNames($outBAM_Aln,$outdir,\%nameHash,$genome);

die ("ERROR !!! Cannot complete addRGs ... some files not found !! ... \n") if ($filesMissing);

addRGs($nameHash{'type1'}->{'bam'},$sampleID,$sampleDate,$sampleLane,'ssDNA_type1',$genome,$outdir,\@RGcmd);
addRGs($nameHash{'type2'}->{'bam'},$sampleID,$sampleDate,$sampleLane,'ssDNA_type2',$genome,$outdir,\@RGcmd);
addRGs($nameHash{'ds'}->{'bam'},$sampleID,$sampleDate,$sampleLane,'dsDNA',$genome,$outdir,\@RGcmd);
addRGs($nameHash{'dsS'}->{'bam'},$sampleID,$sampleDate,$sampleLane,'dsDNA_strict',$genome,$outdir,\@RGcmd);
addRGs($nameHash{'unC'}->{'bam'},$sampleID,$sampleDate,$sampleLane,'unclassified',$genome,$outdir,\@RGcmd);

for my $cmd(@RGcmd){
    sysAndPrint($cmd,$verbose,$noRun);
}

sysAndPrint("rm -rf $TmpPath",$verbose,$noRun);

######################################################################################################
sub addRGs{
	
	my ($RGbam,$sample,$date,$lane,$type,$RGgenome,$outputDir,$cmdArr) = @_;
	
	die ('Not enough arguments') unless ($#_ == 7);
	#die unless (-e $RGbam);
	
	$RGbam =~ s/(.+\/)(.+bam)/$2/;
	my $folder = $1;
	
	die join("\t","addRGs :",$RGbam,$sample,$date,$lane,$type,$RGgenome,$outputDir,$cmdArr."\n") unless (-d $folder);
	#my $tfDir = '/lscratch/'.$ENV{SLURM_JOBID}.'/KB_addRG_'.int(rand()*100000000000).'/';
	my $tfDir = $TmpPath.'/KB_addRG_'.int(rand()*100000000000).'/';
	
	my $RGbaminTmp     = $RGbam; $RGbaminTmp 	= addFolder($RGbaminTmp,$tfDir);
	my $RGsortedBam    = $RGbam; $RGsortedBam    =~ s/bam/sorted.bam/;   	$RGsortedBam 	= addFolder($RGsortedBam,$tfDir);
	my $RGsortedTmp    = $RGbam; $RGsortedTmp    =~ s/bam/srt.bam/;		$RGsortedTmp 	= addFolder($RGsortedTmp,$tfDir);
	my $RGsortedRG     = $RGbam; $RGsortedRG     =~ s/bam/RG.bam/;		$RGsortedRG 	= addFolder($RGsortedRG,$tfDir);
	my $RGsortedRGsort = $RGbam; $RGsortedRGsort =~ s/bam/RG.sorted.bam/;	$RGsortedRGsort = addFolder($RGsortedRGsort,$tfDir);
	my $RGfinalBam     = $RGbam; $RGfinalBam     =~ s/bam/final.bam/;	$RGfinalBam 	= addFolder($RGfinalBam,$outputDir);
	my $RGMDmetrics    = $RGbam; $RGMDmetrics    =~ s/bam/MDmetrics.tab/;	$RGMDmetrics 	= addFolder($RGMDmetrics,$outputDir);
	
	$RGbam 	= addFolder($RGbam,$outputDir);

	push @{$cmdArr}, "mkdir $tfDir ;" ;
	push @{$cmdArr}, "cp $RGbam $RGbaminTmp ;";
	push @{$cmdArr}, "$ssPipelinePath/sortBAM --g $RGgenome --v --forceSort --forceReorder  $RGbaminTmp ;";
	push @{$cmdArr}, "mv $RGsortedBam $RGsortedTmp ; ";
	push @{$cmdArr}, "java -jar ".$PicardPath.'/picard.jar AddOrReplaceReadGroups '."I=$RGsortedTmp O=$RGsortedRG RGID=RG_$date\_$lane\_$type RGSM=$sample RGPU=na RGLB=$sample RGPL=illumina RGCN=NIDDK_Genomics_Core  TMP_DIR=$TmpPath ;";
	push @{$cmdArr}, "$ssPipelinePath/sortBAM --g $RGgenome --v --forceSort --forceReorder $RGsortedRG ;";
	push @{$cmdArr}, "java -Xmx4g -jar ".$PicardPath.'/picard.jar MarkDuplicates '."I=$RGsortedRGsort O=$RGfinalBam M=$RGMDmetrics VALIDATION_STRINGENCY=LENIENT AS=true TMP_DIR=$TmpPath ;";
	push @{$cmdArr}, "mv $RGfinalBam $RGbam ;";
	push @{$cmdArr}, $samtoolsPath."/samtools index $RGbam ;";
	push @{$cmdArr}, "rm -rf $tfDir ;\n";
}		

######################################################################################################
sub addFolder{
	my ($afFile,$afFolder) = @_;
	
	$afFile =~ s/^.+\/(.+)/$1/;
	$afFolder =~ s/\/$//;
	
	return "$afFolder\/$afFile";
}
######################################################################################################
sub getNames{
	my ($gnBAM,$gnDir,$gnNames,$gnGenome) = @_;

	$gnBAM =~ s/^.+\///;

	$gnDir = $gnDir?$gnDir.'/':$gnBAM;
	$gnDir =~ s/^(.+\/).*/$1/;
	$gnDir =~ s/\/\//\//;
	
	my $nameStub = $gnBAM; 
	$nameStub =~ s/^.+\///;
	$nameStub =~ s/^(.+?)\..+/$1/;
	$nameStub .= '.'.$gnGenome;

	my $full_bam = $gnBAM; 
	my $samHead  = `$ENV{'SSDSSAMTOOLSPATH'}/samtools view -H $gnBAM`;
	
	$gnBAM =~ s/^.+\///;
	
	my $outBEDss1 	= $outdir.$nameStub.'.ssDNA_type1.bed';
	my $outBEDss2	= $outdir.$nameStub.'.ssDNA_type2.bed';
	my $outBEDds	= $outdir.$nameStub.'.dsDNA.bed';
	my $outBEDdsS	= $outdir.$nameStub.'.dsDNA_strict.bed';
	my $outBEDunC	= $outdir.$nameStub.'.unclassified.bed';
	
	my $outBAMss1	= $outdir.$nameStub.'.ssDNA_type1.bam';
	my $outBAMss2	= $outdir.$nameStub.'.ssDNA_type2.bam';
	my $outBAMds	= $outdir.$nameStub.'.dsDNA.bam';
	my $outBAMdsS	= $outdir.$nameStub.'.dsDNA_strict.bam';
	my $outBAMunC	= $outdir.$nameStub.'.unclassified.bam';
	
	$$gnNames{'type1'}->{'bam'} = $outBAMss1;
	$$gnNames{'type2'}->{'bam'} = $outBAMss2;
	$$gnNames{'ds'}->{'bam'}    = $outBAMds;
	$$gnNames{'dsS'}->{'bam'}   = $outBAMdsS;
	$$gnNames{'unC'}->{'bam'}   = $outBAMunC;

	$$gnNames{'type1'}->{'bed'} = $outBEDss1;
	$$gnNames{'type2'}->{'bed'} = $outBEDss2;
	$$gnNames{'ds'}->{'bed'}    = $outBEDds;
	$$gnNames{'dsS'}->{'bed'}   = $outBEDdsS;
	$$gnNames{'unC'}->{'bed'}   = $outBEDunC;

	my $nRet = 0;

	for my $type (keys %{$gnNames}){
		for my $ext ('bed','bam'){
			my $chkFile = $$gnNames{$type}->{$ext};
			if (not (-e $chkFile)){
				print STDERR "Cannot FIND $type ".uc($ext)." file [$chkFile] : RGadd will FAIL !!\n";
				$nRet = 1;
			}
		}
	}

	return $nRet; 
}
