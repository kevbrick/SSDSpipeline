package SSDS_pipeline;

use strict;
use warnings;

use File::Temp qw/ tempfile tempdir /;
use Getopt::Long;
use Statistics::Descriptive;

require Exporter;

our @ISA = qw(Exporter);

# EXPORTING FUNCTION NAMES ##
our %EXPORT_TAGS = ( 'all' => [ qw() ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
    genTempFile
    genPaths
    splitBAM
    checkSpecies
    sysAndPrint
    isBAMsorted
    getPWD
    fnDateTime
    csSort
    chromosomeSortFunction
    trimFastq
    fastqLen
    genomeSizeFromFai
    checkfreeNodes 
    guessGenomeFromBAM
    getGenomePaths
);

our $VERSION = '0.01';

################################################################################
######################## START OF MODULE METHODS ###############################
################################################################################


#####################################################################################################
# genTempFile.pl - make a temp file 
sub genTempFile{
	my ($t,$tmpdir) = @_;

	$tmpdir = $tmpdir?$tmpdir:$ENV{SSDSTMPPATH}.'/SSDSpl_r'.(int(rand()*1000000000000));

	system("mkdir $tmpdir");

	my $template = (($tmpdir eq '.')?'':$tmpdir.'/').(defined($t)?$t:'tmp_SSDSpl_XXXXXXXXX');
	my ($fh, $clNm) = tempfile($template);

	return ($clNm,$tmpdir,$fh);
}

#####################################################################################################
# genPaths.pl - generate data file paths for ssDNA pipeline
sub genPaths{
	my ($genome,$vBWA,$emptyTmpOK) = @_;
	$genome = lc($genome);
	
	my $randomName      = 'SSDSpl_tmp_'.int(rand()*100000000000);
	my $PicardPath  	= $ENV{SSDSPICARDPATH};		$PicardPath  	=~ s/^(.+[^\/])$/$1\//;
	my $GenomesPath 	= $ENV{SSDSGENOMESPATH};	$GenomesPath 	=~ s/^(.+[^\/])$/$1\//;
	my $ssPipelinePath  = $ENV{SSDSPIPELINEPATH};	$ssPipelinePath =~ s/^(.+[^\/])$/$1\//;
	my $samtoolsPath    = $ENV{SSDSSAMTOOLSPATH};	$samtoolsPath   =~ s/^(.+[^\/])$/$1\//; ## NOT USED (BUT NOT CLEANED)
	my $TmpPath     	= $ENV{SSDSTMPPATH}.'/'.$randomName;
	
	sysAndPrint('mkdir '.$TmpPath,1,0);
	
	my ($genomeFA,$genomeIDX);

	if ($vBWA && $vBWA eq 'noGenome'){		
		$genomeFA  = '';
		$genomeIDX = '';
	}else{
		$vBWA = 'bwa0.7' unless ($vBWA);
		$vBWA = 'bwa0.5' if ($vBWA =~ /0\.5/);
		$vBWA = 'bwa0.7' if ($vBWA =~ /0\.7/);
	
		my (%allG,%allI,@cmd);
	
		getGenomePaths(\%allG,\%allI);

		$genomeFA  = $allG{$vBWA}->{$genome};
		$genomeIDX = $allI{$vBWA}->{$genome};

		die ("\n## ERROR ##\nGenome required (--g)\n") if (not ($genome));
		die ("\n## ERROR ##\nPicard index file not found for ".$genome."\n") if (not ($genomeFA)  || not (-e $genomeFA));
		die ("\n## ERROR ##\nGenome index file not found for ".$genome."\n") if (not ($genomeIDX) || not (-e $genomeIDX));

	}

	die ("\n## ERROR ##\nSSDSPIPELINEPATH environment variable NOT set. \n") if (not ($ssPipelinePath));
	die ("\n## ERROR ##\nInvalid SSDSPIPELINEPATH environment variable ($ssPipelinePath) \n") if (not (-e ($ssPipelinePath.'/SSDS_pipeline.pm')));
	
	die ("\n## ERROR ##\nSSDSPICARDPATH environment variable NOT set. \n") if (not ($PicardPath));
	die ("\n## ERROR ##\nInvalid SSDSPICARDPATH environment variable ($PicardPath) \n") if (not (-e ($PicardPath.'/picard.jar')));

	die ("\n## ERROR ##\nSSDSSAMTOOLSPATH environment variable NOT set. \n") if (not ($samtoolsPath));
	die ("\n## ERROR ##\nInvalid SSDSSAMTOOLSPATH environment variable ($samtoolsPath) \n") if (not (-e ($samtoolsPath.'/samtools')));
	
	die ("\n## ERROR ##\nSSDSGENOMESPATH environment variable NOT set. \n") if (not ($GenomesPath));
	die ("\n## ERROR ##\nInvalid SSDSGENOMESPATH environment variable ($GenomesPath) \n") if (not (-d ($GenomesPath)));

	unless ($emptyTmpOK){
		die ("\n## ERROR ##\nSSDSTMPPATH environment variable NOT set. \n") if (not ($TmpPath));
		die ("\n## ERROR ##\nInvalid SSDSTMPPATH environment variable ($TmpPath) \n") if (not (-d ($TmpPath)));
	
		die ("\n## ERROR ##\nSSDSTMPPATH folder not created ($TmpPath) \n") if (not (-d ($TmpPath)));
	}else{
		die ("\n## ERROR ##\nSSDSTMPPATH folder not created ($TmpPath) \n") if (not (-d ($TmpPath)));
	}
		
	return ($PicardPath,$GenomesPath,$samtoolsPath,$TmpPath,$ssPipelinePath,$genomeFA,$genomeIDX);
}

#####################################################################################################
# splitBAM.pl - splits an SR or PE bam file by # of lines
sub splitBAM{
	my ($pathToPicard,$ssPLPath,$bam,$stepSz,$tempFile,$tempdir,$bamArray,$newHeaderLine,$noSort) = @_;

	my $Qsorted_bam = $bam; 
	$Qsorted_bam =~ s/^.+\///;
	$Qsorted_bam =~ s/\.bam//;
	$Qsorted_bam = $tempdir.$Qsorted_bam.'sorted.QS.bam';

	## Step 1: sort by query ... allow easy BAM split by # of lines
	if (isBAMsorted($bam) =~ /queryname/){
		sysAndPrint ("ln -s $bam $Qsorted_bam",1);
		print STDERR "BAM is already queryname sorted ... using soft link to $bam\n";
	}else{
		sysAndPrint('java -jar '.$pathToPicard.'/picard.jar SortSam I='.$bam.' O='.$Qsorted_bam.' SO=queryname TMP_DIR='.$tempdir.' VALIDATION_STRINGENCY=LENIENT',1);
		print STDERR "Sorting BAM by queryname: $Qsorted_bam\n";
	}	
	
	## Step 2: Parse header 
	my $headerFile = $tempdir.'/header_'.int(rand()*100000000).'.txt';
	sysAndPrint($ENV{'SSDSSAMTOOLSPATH'}.'/samtools view -H '.$Qsorted_bam.' | grep -v scaffold >'.$headerFile,1);
	sysAndPrint('echo "'.$newHeaderLine.'" >>'.$headerFile,1) if ($newHeaderLine);

	## Step 3: Split BAM by # lines - note must be a multiple of 2
	my $prefix = ($tempFile?$tempFile:$Qsorted_bam); $prefix =~ s/\.bam/_part/;
	my $splitFiles = ($ENV{'SSDSSAMTOOLSPATH'}.'/samtools view '.$Qsorted_bam.' |split - -l '.$stepSz.' -d --verbose '.$prefix);
	my $sF = `$ENV{'SSDSSAMTOOLSPATH'}/samtools view $Qsorted_bam |split - -l $stepSz -d --verbose $prefix`;
	my @nSF = `ls -rt $prefix*`; for my $i(0..$#nSF){chomp $nSF[$i]}; 
#	my @nSF = sort {$a <=> $b} @tmpSF;	

	my @bamArray;

	print STDERR "Splitting BAM ($stepSz rows per new file): $Qsorted_bam\n";
	for my $sf(@nSF){	
		chomp $sf;

		my $sfSam = $sf.'.sam';

## KB change 12-05-15
#		system('grep -P \'\schr[0123456789XYIVM]+\s\' '.$sf.' | grep -v scaffold >'.$sfSam);
		system("cp $sf $sfSam");

		print STDERR "Converting $sfSam -> $sf\.unS.bam\n";
		system('cat '.$headerFile.' '.$sfSam.' | '.$ENV{'SSDSSAMTOOLSPATH'}.'/samtools view -Sbh - >'.$sf.'.unS.bam');
		system("rm $sfSam");
		
		if ($noSort){
			push @{$bamArray}, $sf.'.unS.bam';
		}else{
			print STDERR "Sorting BAM ($sf\.unS.bam)\n";
			sysAndPrint($ENV{'SSDSSAMTOOLSPATH'}.'/samtools sort '.$sf.'.unS.bam '.$sf,1);
	
			print STDERR "Indexing BAM ($sf\.unS.bam)\n";
			sysAndPrint($ENV{'SSDSSAMTOOLSPATH'}.'/samtools index '.$sf.'.bam',1);

			sysAndPrint('rm '.$sf.' '.$sf.'.unS.bam',1);
			push @{$bamArray}, $sf.'.bam';
		}
	}

	my $seqcnt = 0;
}

#####################################################################################################
# checkSpecies
sub checkSpecies {
	my $bamFl = shift;
	
	my %files;	

	my %s2g;
	$s2g{'chicken_galGal2'} 	= 'galgal2';
	$s2g{'Gallus_gallus'} 		= 'galgal2';
	$s2g{'dog'} 			= 'canfam2';
	$s2g{'dog_canFam2'} 		= 'canfam2';
	$s2g{'Homo_sapiens'} 		= 'hg19';
	$s2g{'Human'}	 		= 'hg19';
	$s2g{'Human'}	 		= 'hg38';
	$s2g{'Mixed_/_Unknown'} 	= 'unknown';
	$s2g{'Monodelphis_domesticus'} 	= 'mondom';
	$s2g{'Mus_musculus'} 		= 'mm9';
	$s2g{'Mouse'}	 		= 'mm9';
	$s2g{'mm10'} 			= 'mm10';
	$s2g{'mm10cast'} 		= 'mm10cast';
	$s2g{'mm10c3h'} 		= 'mm10c3h';
	$s2g{'mm10pwk'} 		= 'mm10pwk';
	$s2g{'mm10pwd'} 		= 'mm10pwk';
	$s2g{'Pan_troglodytes'} 	= 'unknown';
	$s2g{'Phi_X_174'} 		= 'unknown';
	$s2g{'Rattus_norvegicus'} 	= 'rn4';
	$s2g{'Saccharomyces_cerevisae'} = 'unknown';

	my $specFile = '/data/brickkm/ssPipeline/AllLanes.info.March2013.csv';
	
	my $g = guessGenomeFromBAM($bamFl);
	return $g if ($g);
	return "" unless (-e $specFile);

	open IN, $specFile;
	
	while(<IN>){
		chomp;
		my @F = split(/\t/,$_);
		if ($_ =~ /^(\d{6})_\S+?_(\d+)\S*?,(\d),(\S*?),.+?,(\S+)/){
			my ($dt,$num,$ln,$barcode,$species) = ($1,$2,$3,$4,$5);
			$num =~ s/^0+//g;
			$barcode = $barcode?$barcode:"NoIDX";
			$files{$dt}->{$num}->{$ln}->{$barcode}->{'species'} 	= $species;
			$files{$dt}->{$num}->{$ln}->{$barcode}->{'g'} 		= $s2g{$species};
			$files{$dt}->{$ln}->{$barcode}->{'species'} 		= $species;
			$files{$dt}->{$ln}->{$barcode}->{'g'} 			= $s2g{$species};
		}else{
#			print $_."\n";
		}
	}

	$bamFl =~ s/^.+\///;
	my ($dt,$num,$ln,$barcode);
	if ($bamFl =~ /(\d{6})_(\d+)_s_(\d)_(qc|AS|PE|bwa|[GATC]+)_/){
		($dt,$num,$ln,$barcode) = ($1,$2,$3,$4);
	}else{
		if ($bamFl =~ /(\d{6})_s_(\d)_(qc|AS|PE|bwa|[GATC]+)_/){
			($dt,$num,$ln,$barcode) = ($1,9999999,$2,$3,$4);
		}
	}
	$barcode = ($barcode !~ /qc/)?$barcode:"NoIDX";
	
	if ($files{$dt}->{$num}->{$ln}->{$barcode}->{'g'}){
		return $files{$dt}->{$num}->{$ln}->{$barcode}->{'g'};
	}else{
		if ($files{$dt}->{$ln}->{$barcode}->{'g'}){
			return $files{$dt}->{$ln}->{$barcode}->{'g'};
		}else{
#			die ("Species cannot be determined for file $bamFl \n");
			my $g = guessGenomeFromBAM($bamFl);
			return $g?$g:"";
		}
	}
}

################################################################################
sub sysAndPrint {
	my ($cmd,$printMe,$noRun) = @_;
	print STDERR "$cmd\n" if ($printMe);
	system($cmd) unless ($noRun);
}

################################################################################
sub getPWD {
	my $PWD = `pwd`;
	chomp $PWD;
	$PWD =~ s/\s//g;
	return $PWD;
}

################################################################################
sub isBAMsorted {
	my ($bam) = @_;
	my $SOline = `$ENV{'SSDSSAMTOOLSPATH'}/samtools view -H $bam |grep SO:`;
	return '' unless ($SOline);
	$SOline =~ /\@HD.+SO:(\S+)/;
	my $SO = $1?$1:''; 
	return $SO;
}

################################################################################
sub fnDateTime{
	my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
	$year += 1900;
	$year =~ s/\d\d(\d\d)/$1/;
	$mon+=1;
	$mon = "0$mon" if (length($mon) == 1);
	$mday = "0$mday" if (length($mday) == 1);

	return ($year.$mon.$mday.'_'.$hour.$min.$sec);
}

####################################################################
sub csSort {
    my @toSort = @_;

    my @noRandSort;
    for my $tsC(@toSort){
        next unless ($tsC =~ /^chr(\d+|X|Y)$/);
        push @noRandSort, $tsC;
    }

    my @aSorted = sort chromosomeSortFunction @noRandSort;

    return @aSorted;
}

####################################################################
sub chromosomeSortFunction {
  # sort chromosomes

  my ($valA,$valB) = ($a,$b);

  $valA =~ s/chrX/chr200/;
  $valA =~ s/chrY/chr201/;
  $valA =~ s/chrM/chr202/;
  $valA =~ s/chr(\d+)_random/"chr".($1+300)/e;

  $valB =~ s/chrX/chr200/;
  $valB =~ s/chrY/chr201/;
  $valB =~ s/chrM/chr202/;
  $valB =~ s/chr(\d+)_random/"chr".($1+300)/e;

  # Extract the digits following the first comma
  $valA =~ s/chr(\d+)/$1/;
  $valB =~ s/chr(\d+)/$1/;

  # Extract the letter following those digits
  #$valA =~ s/chr(A-Z)/$1/e unless ($valA);
  #$valB =~ s/chr(A-Z)/$1/e unless ($valB);

  # Compare and return
  return $valA <=> $valB;
}

####################################################################
sub trimFastq {
	my ($fqIn,$fqOut,$fqLen) = @_;
	return 0 unless (-e $ENV{'SSDSFASTXPATH'}.'/fastx_trimmer');

	if (fastqLen($fqIn) > $fqLen){
#		my $fqOut = $fqIn; $fqOut =~ s/^(.+)\.(fastq|fq)/$1.".TRIM$fqLen\.".$2/e;
		sysAndPrint($ENV{'SSDSFASTXPATH'}.'/fastx_trimmer -f 1 -l '.$fqLen.' -i '.$fqIn.' >'.$fqOut,1);
		return $fqOut;
	}else{
		return $fqIn;
	}
}

####################################################################
sub genomeSizeFromFai {
	my ($pFai) = shift;
	
	my $genomeSize;

	open IN, $pFai; 
	while (<IN>){
		chomp; 
		my @F = split(/\t/,$_);
		$genomeSize += $F[1];
	}
	return $genomeSize;
}

####################################################################
sub fastqLen{
	my ($fqIN) = shift; 
	my $cnt = 0;
	my @len;

	for my $i(`head -n 40000 $fqIN`){
		chomp $i;
		if (++$cnt eq 2){
			next unless ($i);
			my $lMe  = length($i);
			my $lPre = $len[$#len];
			push @len, $lMe;
			print STDERR 'Unequal length reads in FASTQ ['.$lMe.' bp v '.$lPre.' bp] !!! Returning max length !!!'."\n" if ($lPre && $lMe ne $lPre);
		}	
		$cnt = 0 if ($cnt eq 4);
	}
		
	my $stat = Statistics::Descriptive::Full->new();
	$stat->add_data(@len);
	return $stat->max; 
}

####################################################################
sub checkfreeNodes{
	my $cmd = 'freen';

	my ($niddkFree,$normFree);

	open my $PIPE, '-|', $cmd; 
	while (<$PIPE>){
		chomp; 
		if ($_ =~ /norm.+?\s(\d+)\/(\d+)/){
			$normFree = $1;
		}		

		if ($_ =~ /niddk.+?\s(\d+)\/(\d+)/){
			$niddkFree = $1;
		}
	}
	
	return 'niddk' if ($niddkFree > 0);
}

####################################################################
sub guessGenomeFromBAM{
	my $bamID = shift;
	
	$bamID =~ s/sorted\.//;

	$bamID =~ /\.(\S+)\.bam/;
	my $gID = $1;
	
	my %s2g;
	$s2g{'chicken_galGal2'} 	= 'galgal2';
	$s2g{'Gallus_gallus'} 		= 'galgal2';
	$s2g{'dog'} 			= 'canfam2';
	$s2g{'dog_canFam2'} 		= 'canfam2';
	$s2g{'Homo_sapiens'} 		= 'hg19';
	$s2g{'Human'}	 		= 'hg19';
	$s2g{'Human'}	 		= 'hg38';
	$s2g{'Mixed_/_Unknown'} 	= 'unknown';
	$s2g{'Monodelphis_domesticus'} 	= 'mondom';
	$s2g{'Mus_musculus'} 		= 'mm9';
	$s2g{'Mouse'}	 		= 'mm9';
	$s2g{'mm10'} 			= 'mm10';
	$s2g{'mm10cast'} 		= 'mm10cast';
	$s2g{'mm10c3h'} 		= 'mm10c3h';
	$s2g{'mm10pwk'} 		= 'mm10pwk';
	$s2g{'mm10pwd'} 		= 'mm10pwk';
	$s2g{'Pan_troglodytes'} 	= 'unknown';
	$s2g{'Phi_X_174'} 		= 'unknown';
	$s2g{'Rattus_norvegicus'} 	= 'rn4';
	$s2g{'Saccharomyces_cerevisae'} = 'unknown';

	return $s2g{$gID} if ($s2g{$gID});

	return 'mm10_tc1r'  if ($gID =~ /(mm10_tc1r)/i);
	return 'mm10_tc1nr' if ($gID =~ /(mm10_tc1nr|tc1)/i);
	return 'mm10'       if ($gID =~ /(mouse_mm10|mm10|mouse|mm)/i);
	return 'hg38'       if ($gID =~ /(hg38)/i);
	return 'hg19'       if ($gID =~ /(human|hs|hg19)/i);
	return 'canfam3'    if ($gID =~ /(canFam3|dog|canfam)/i);
	return 'bsub'       if ($gID =~ /(Bacillus|bsub|subtilis)/i);
	return 'ecoli'      if ($gID =~ /(ecoli|coli|K12)/i);
	return 'mondom5'    if ($gID =~ /(monodelphis|mondom|opossum)/i);
	return 'rn5'        if ($gID =~ /(rn5|rat)$/i);
	return 'sacCer3'    if ($gID =~ /(yeast|cerevisae|saccer3|saccer)/i);

	return "";
}

####################################################################
sub getGenomePaths{
	my ($hG,$hI) = @_;

	my $gPath = $ENV{'SSDSGENOMESPATH'}.'/'; $gPath =~ s/\/\//\//; 

	opendir(DIR,$gPath);
	while (my $l = readdir(DIR)){
		next if ($l =~ /^(\.|\.\.)$/);
		if (-d $gPath.$l){
			my $genome = lc($l);
			my $fIDX5 = $gPath.$l.'/BWAIndex/version0.5.x/genome.fa';
			my $iIDX5 = $gPath.$l.'/BWAIndex/version0.5.x/genome.fa.fai';
	
			if (-e $fIDX5 && -e $iIDX5){
				$$hG{'bwa0.5'}->{$genome} = $fIDX5;
				$$hI{'bwa0.5'}->{$genome} = $iIDX5;
			}
	
			my $fIDX7 = $gPath.$l.'/BWAIndex/version0.7.10/genome.fa';
			my $iIDX7 = $gPath.$l.'/BWAIndex/version0.7.10/genome.fa.fai';
			if (-e $fIDX7 && -e $iIDX7){
				$$hG{'bwa0.7'}->{$genome} = $fIDX7;
				$$hI{'bwa0.7'}->{$genome} = $iIDX7;
			}
		}
	}
}
