use strict;
use Bio::DB::Sam;
use Getopt::Long;
use SSDS_pipeline;

GetOptions ('bam=s' 		=> \(my $in_bam),
	    'fasta=s'			=> \(my $in_fa),
	    'g=s'				=> \(my $g),
	    'gOK+'				=> \(my $gOK),
	    'temp=s'			=> \(my $TmpPath2Use),
	    'ITR_mismatch=i'	=> \(my $nMM = 1),
	    'noQC=i'			=> \(my $noQC = 0), # disable BWA/SAM QC MAP_PAIR & quality check?
	    'min_qual=i'		=> \(my $MIN_QUAL = 30), # min quality for each match, -10logP;
	    'diagnostic=i'		=> \(my $DIAG = 0), # output extended diag information?
	    'output=s'			=> \(my $output), # ssDNA TypeI/ssDNA Type I+II/dsDNA/all (with end correction)/len-ITR-uH stat #	    'outtype=s'		=> \(my $outtype), ## bed or sam
	    'outdir=s'			=> \(my $outdir),
	    'uH=i'				=> \(my $uH = 1), # uH or ITR length in bed?,
	    'splitSz=i'			=> \(my $ssZ = 5000000), # size of file chunks to process,
	    'max_reads=i'		=> \(my $max_reads = 1E9), # number of reads to output
	    'date=s'			=> \(my $clearDate),
	    'rmInit+'			=> \(my $rmInitialBAM)
	   );	

#if ($clearDate){
#	$clearDate =~ s/_/ /g;
#	system('find ! -newermt "'.$clearDate.'" |xargs rm');
#	system('clearscratch');
#}

## No longer used - biowulf2: KB 08/16/15
#system('clearscratch');

#implement qual_filtering, better bed /name/score/, F/R checking, QC flag checking here;
$gOK = $gOK?$g:checkSpecies($in_bam);
$g = ($g?$g:$gOK);

$outdir = $outdir?$outdir.'/':$in_bam;
$outdir =~ s/^(.+\/).*/$1/;
$outdir =~ s/\/\//\//;

die ("EXITING: BAM genome doesn't match genome provided [$g ... v ... $gOK].\n") unless ($g eq $gOK);

my ($PicardPath,$GenomesPath,$samtoolsPath,$TmpPath,$ssPipelinePath,$in_fa,$idx) = genPaths($g);
$TmpPath = $TmpPath2Use?$TmpPath2Use:$TmpPath; 
$TmpPath .= '/' unless ($TmpPath =~ /\/$/);

print STDERR "TEMP FOLDER = $TmpPath ... all other messages overridden !!\n";

## SET DEFAULT OUTPUT FOLDER UNLESS ONE IS SPECIFIED
$outdir = $outdir?$outdir:$ssPipelinePath.'/output';
die ("EXITING: Output folder [$outdir] does not exist.\n") unless (-d $outdir);

die ("EXITING: Sorry, genome [$g] NOT supported ... update the SSDS_pipeline.pm module.\n") unless (-e $in_fa);

my $nameStub = $in_bam; 
$nameStub =~ s/^.+\///;
$nameStub =~ s/^(.+?)\..+/$1/;
$nameStub .= '.'.$g;

my $full_bam = $in_bam; 
my $samHead  = `$samtoolsPath/samtools view -H $in_bam`;

$in_bam =~ s/^.+\///;

## CREATE OUTPUT FILES
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

my $doneFile	= $outdir.$nameStub.'.ssPipeline.done';
my $errFile	= $outdir.$nameStub.'.ssPipeline.FAILED';

die if ($outBEDss1 eq $in_bam);
die if ($outBEDss2 eq $in_bam);
die if ($outBEDds  eq $in_bam);
die if ($outBEDdsS eq $in_bam);
die if ($outBEDunC eq $in_bam);
die if ($outBAMss1 eq $in_bam);
die if ($outBAMss2 eq $in_bam);
die if ($outBAMds  eq $in_bam);
die if ($outBAMdsS eq $in_bam);
die if ($outBAMunC eq $in_bam);
die if ($doneFile  eq $in_bam);

my (@bamArray);

my ($tf,$tfH) = $TmpPath."/ITRid_TF_".int(rand()*100000000000).".tf";

splitBAM($PicardPath,$ssPipelinePath,$full_bam,$ssZ,$tf,$TmpPath,\@bamArray);

my $bamCount = $#bamArray+1;
print STDERR "BAM split complete: $full_bam split to $bamCount files\n";

my $fileCount = 0;

for my $in_bam(@bamArray){
	print STDERR "Parse ssDNA: $in_bam [File ".(++$fileCount)." of $bamCount]\n";

	(my $outname = $in_bam) =~ s/\.bam//;

	## SET UP TEMP FILES FOR EACH SPLIT BAM
	my $splitBEDss1 	= $outname.'.ssDNA_type1.bed';
	my $splitBEDss2		= $outname.'.ssDNA_type2.bed';
	my $splitBEDds		= $outname.'.dsDNA.bed';
	my $splitBEDdsS		= $outname.'.dsDNA_strict.bed';
	my $splitBEDunC		= $outname.'.unclassified.bed';

	my $splitBEDSORTss1	= $outname.'.ssDNA_type1.sorted.bed';
	my $splitBEDSORTss2	= $outname.'.ssDNA_type2.sorted.bed';
	my $splitBEDSORTds	= $outname.'.dsDNA.sorted.bed';
	my $splitBEDSORTdsS	= $outname.'.dsDNA_strict.sorted.bed';
	my $splitBEDSORTunC	= $outname.'.unclassified.sorted.bed';

	my $splitSAMss1		= $outname.'.ssDNA_type1.sam';
	my $splitSAMss2		= $outname.'.ssDNA_type2.sam';
	my $splitSAMds		= $outname.'.dsDNA.sam';
	my $splitSAMdsS		= $outname.'.dsDNA_strict.sam';
	my $splitSAMunC		= $outname.'.unclassified.sam';

	#my $splitBAMss1		= $outname.'.ssDNA_type1.tmp';
	#my $splitBAMss2		= $outname.'.ssDNA_type2.tmp';
	#my $splitBAMds		= $outname.'.dsDNA.tmp';
	#my $splitBAMdsS		= $outname.'.dsDNA_strict.tmp';
	#my $splitBAMunC		= $outname.'.unclassified.tmp';
	
	my $splitBAMss1		= $outname.'.ssDNA_type1.bam';
	my $splitBAMss2		= $outname.'.ssDNA_type2.bam';
	my $splitBAMds		= $outname.'.dsDNA.bam';
	my $splitBAMdsS		= $outname.'.dsDNA_strict.bam';
	my $splitBAMunC		= $outname.'.unclassified.bam';

	if ($output =~ /(sam|all|bedbam)/){
		open (OUT_BEDss1, ">", $splitBEDss1) or die  " unable to open output file!\n";
		open (OUT_BEDss2, ">", $splitBEDss2) or die  " unable to open output file!\n";
		open (OUT_BEDds,  ">", $splitBEDds)  or die  " unable to open output file!\n";
		open (OUT_BEDdsS, ">", $splitBEDdsS) or die  " unable to open output file!\n";
		open (OUT_BEDunC, ">", $splitBEDunC) or die  " unable to open output file!\n";
		open (OUT_SAMss1, ">", $splitSAMss1) or die  " unable to open output file!\n";
		open (OUT_SAMss2, ">", $splitSAMss2) or die  " unable to open output file!\n";
		open (OUT_SAMds,  ">", $splitSAMds)  or die  " unable to open output file!\n";
		open (OUT_SAMdsS, ">", $splitSAMdsS) or die  " unable to open output file!\n";
		open (OUT_SAMunC, ">", $splitSAMunC) or die  " unable to open output file!\n";

		print OUT_SAMss1 $samHead;
		print OUT_SAMss2 $samHead;
		print OUT_SAMds  $samHead;
		print OUT_SAMdsS $samHead;
		print OUT_SAMunC $samHead;
	}

	my $sam = Bio::DB::Sam->new(
			-bam  => $in_bam, 
			-fasta=>$in_fa,
			-autoindex  => 1,
			-expand_flags => 1,
			) or die " unable to open input bam file '$in_bam'!\n";


## NOT NEEDED: KB 02-04-16
#	if ($output =~ /(sam|all|bedbam)/){
#		my $header = $sam->header();
#		die " no header in input bam file!!!\n" unless ($header);	
#		print OUT_SAM $header->text;
#	}

	my $i = 0;
	for my $tid (0 .. $sam->n_targets - 1)  {
		my $seq_id = $sam->target_name($tid);
		my $iter_pair = $sam->features(
				'-type'     => 'read_pair',
				'-iterator' => 1,
				'-seq_id'   => $seq_id);

		while (my $pair = $iter_pair->next_seq() ) {
		
			my ($left,$right) = $pair->get_SeqFeatures;
		
	
			last if $i > $max_reads ;
			next if !defined($left) || !defined($right)|| $left->unmapped || $right->unmapped;
			next if !$noQC && (!$left->proper_pair || $left->seq_id ne $right->seq_id || ($right->end - $left->start >10000));
			
			my $first_mate; my $second_mate;
		
			if ($left->get_tag_values('FIRST_MATE')) {
				$first_mate = $left; $second_mate = $right; 
			} else {
				$first_mate = $right; $second_mate = $left;
			}
		
			if ($DIAG) {
				my $f_start = $first_mate->start;
				my $f_end = $first_mate->end;
				my $f_strand = $first_mate->strand;
				my $f_name = $first_mate->query->name;
				my $f_cigar = $first_mate->cigar_str;
				my $f_dna = $first_mate->query->dna;
				my $f_read = $f_strand == +1 ? $first_mate->query->dna : $first_mate->query->seq->revcom->seq;
				my $f_chrom= $first_mate->seq_id;
				my $f_qual = $first_mate->qual;
			
				my $s_start = $second_mate->start;
				my $s_end = $second_mate->end;
				my $s_strand = $second_mate->strand;
				my $s_name = $second_mate->query->name;
				my $s_dna = $second_mate->query->dna;
				my $s_cigar = $second_mate->cigar_str;
				my $s_read = $s_strand == +1 ? $second_mate->query->dna : $second_mate->query->seq->revcom->seq;
				my $s_chrom= $second_mate->seq_id;
				my $s_qual = $second_mate->qual;
			
				my $p_length = $pair->length;
				print "alignment # $i\n";
				print "$f_name\t$f_chrom\t$f_start\t$f_end\t$f_strand\t$s_name\t$s_chrom\t$s_start\t$s_end\t$s_strand\t$p_length\n";
				print $f_qual, "\t", $f_cigar,"\t", $s_qual, "\t", $s_cigar,"\n";
			}

		
			#next if $p_length > 400;
			#next if !$noQC && ($f_qual < $MIN_QUAL  || $s_qual < $MIN_QUAL);
		
			my ($ref_2,$matches_2,$query_2) = $second_mate->padded_alignment;
			my ($ref_1,$matches_1,$query_1) = $first_mate->padded_alignment;
		
			my ($ITR_len, $aln_offset, $uH_len, $aln_correction) = find_offset($ref_2,$query_2,$first_mate->target->dna,$second_mate->strand,$nMM);
			print $ITR_len, "\t", $aln_offset, "\t",$uH_len,"\t",$aln_correction,"\n" if ($DIAG);
		
			# adjust coord/adjust offset in seq_coord; # deal with soft-clipping? - incorporate "super-strict" filtering
			# 5' of read 2 must be shifted for fill-in part
		
			# generate output;
			my ($strand,$start,$end,$chrom,$f_qual,$s_qual);
		
			$strand = ($first_mate->strand == 1)? "+": "-";
			$start  = ($first_mate->strand == 1)? $left->start - 1 : $left->start + $aln_correction - 1;
			$end    = ($first_mate->strand == 1)? $right->end - $aln_correction: $right->end;
			$chrom  = $first_mate->seq_id;
			$f_qual = $first_mate->qual;
			$s_qual = $second_mate->qual;
		
			next if ($left->get_tag_values('QC_FAILED') || $right->get_tag_values('QC_FAILED')); ## KB
		
			if ($output eq "ssDNA_Type1"){
				# possible update definition
				next unless ($ITR_len > 5 && $aln_offset > 2 && $uH_len >= 0);
			}
		
			if ($output eq "ssDNA_Type2"){
				next unless ($ITR_len > 5 && $aln_offset < 3 && $uH_len >= 0);
			}
		
			if ($output eq "ssDNA_Type12"){
				next unless ($ITR_len > 5 && $uH_len >= 0);
			}

			if ($output eq "dsDNA"){
				next unless $ITR_len < 3;
			}
		
			if ($output eq "stat"){
				next;
			}

#			if ($output =~ /(all|bedbam)/){
#				print OUT_T1  join("\t", ($chrom,$start,$end,$f_qual."_".$s_qual,$ITR_len."_".$uH_len."_".$aln_offset,$strand)), "\n" if ($ITR_len > 5 && $aln_offset > 2 && $uH_len >= 0);
#				print OUT_T2  join("\t", ($chrom,$start,$end,$f_qual."_".$s_qual,$ITR_len."_".$uH_len."_".$aln_offset,$strand)), "\n" if ($ITR_len > 5 && $aln_offset < 3 && $uH_len >= 0);
#				print OUT_DS  join("\t", ($chrom,$start,$end,$f_qual."_".$s_qual,$ITR_len."_".$uH_len."_".$aln_offset,$strand)), "\n" if ($ITR_len < 3);
#			}
#			
#			if ($outtype eq 'bed'){
#				print join("\t", ($chrom,$start,$end,$f_qual."_".$s_qual,$ITR_len."_".$uH_len,$strand)), "\n";
#			}
		
			if ($output =~ /bedbam/){
				## Kevin 11/17/11 - output to SAM
				my @s_tam = split(/\t/,$second_mate->tam_line());
				my @f_tam = split(/\t/,$first_mate->tam_line());
			
				$f_tam[7] = $second_mate->start;
				$s_tam[7] = $first_mate->start;
						
				my ($s_line,$nI,$nD,$nS) = generateSAMline(2,\@s_tam,$ITR_len-$uH_len,$second_mate->strand);
				my ($f_line,$nA,$nD,$nS) = generateSAMline(1,\@f_tam,$ITR_len-$uH_len,$first_mate->strand,$nI,$nD,$nS);
			
				if ($f_line && $s_line){
					my $lineOut; 

					if ($ITR_len > 5 && $aln_offset > 2 && $uH_len >= 0){
						print OUT_BEDss1  join("\t", ($chrom,$start,$end,$f_qual."_".$s_qual,$ITR_len."_".$uH_len."_".$aln_offset,$strand)), "\n" ;
						print OUT_SAMss1 $f_line."\tit:i:$ITR_len\tuh:i:$uH_len\tos:i:$aln_offset\tmm:i:$nMM\n";
						print OUT_SAMss1 $s_line."\tit:i:$ITR_len\tuh:i:$uH_len\tos:i:$aln_offset\tmm:i:$nMM\n";
						$lineOut++;
					}
					
					if ($ITR_len > 5 && $aln_offset < 3 && $uH_len >= 0){
						print OUT_BEDss2  join("\t", ($chrom,$start,$end,$f_qual."_".$s_qual,$ITR_len."_".$uH_len."_".$aln_offset,$strand)), "\n" ;
						print OUT_SAMss2 $f_line."\tit:i:$ITR_len\tuh:i:$uH_len\tos:i:$aln_offset\tmm:i:$nMM\n";
						print OUT_SAMss2 $s_line."\tit:i:$ITR_len\tuh:i:$uH_len\tos:i:$aln_offset\tmm:i:$nMM\n";   
						$lineOut++;
					}

					if ($ITR_len < 3){
						print OUT_BEDds   join("\t", ($chrom,$start,$end,$f_qual."_".$s_qual,$ITR_len."_".$uH_len."_".$aln_offset,$strand)), "\n" ;
						print OUT_SAMds  $f_line."\tit:i:$ITR_len\tuh:i:$uH_len\tos:i:$aln_offset\tmm:i:$nMM\n";
						print OUT_SAMds  $s_line."\tit:i:$ITR_len\tuh:i:$uH_len\tos:i:$aln_offset\tmm:i:$nMM\n";
						$lineOut++;
					}

					if ($ITR_len < 1 && $uH_len < 1){
						print OUT_BEDdsS   join("\t", ($chrom,$start,$end,$f_qual."_".$s_qual,$ITR_len."_".$uH_len."_".$aln_offset,$strand)), "\n" ;
						print OUT_SAMdsS  $f_line."\tit:i:$ITR_len\tuh:i:$uH_len\tos:i:$aln_offset\tmm:i:$nMM\n";
						print OUT_SAMdsS  $s_line."\tit:i:$ITR_len\tuh:i:$uH_len\tos:i:$aln_offset\tmm:i:$nMM\n";
						$lineOut++;
					}

					unless ($lineOut){
						print OUT_BEDunC  join("\t", ($chrom,$start,$end,$f_qual."_".$s_qual,$ITR_len."_".$uH_len."_".$aln_offset,$strand)), "\n" ;
						print OUT_SAMunC  $f_line."\tit:i:$ITR_len\tuh:i:$uH_len\tos:i:$aln_offset\tmm:i:$nMM\n";
						print OUT_SAMunC  $s_line."\tit:i:$ITR_len\tuh:i:$uH_len\tos:i:$aln_offset\tmm:i:$nMM\n";
						$lineOut++;
					}

				}
			}			
		
			$i++;
		}
	}

	close OUT_BEDss1;
	close OUT_BEDss2;
	close OUT_BEDds;
	close OUT_BEDdsS;
	close OUT_BEDunC;
	close OUT_SAM;
	close OUT_SAMss1;
	close OUT_SAMss2;
	close OUT_SAMds;
	close OUT_SAMdsS;
	close OUT_SAMunC;
	
	## SAM -> BAM 
	print STDERR "SAM -> BAM: $splitBAMss1 [File $fileCount of $bamCount]\n";
	sysAndPrint($samtoolsPath.'/samtools view -Shb '.$splitSAMss1.' >'.$splitBAMss1,1);
	#sysAndPrint($ssPipelinePath.'/sortBAM --g '.$g.' --v '.$splitTMPBAMss1.' --out '.$splitBAMss1,1);

	print STDERR "SAM -> BAM: $splitBAMss2 [File $fileCount of $bamCount]\n";
	sysAndPrint($samtoolsPath.'/samtools view -Shb '.$splitSAMss2.' >'.$splitBAMss2,1);
	#sysAndPrint($ssPipelinePath.'/sortBAM --g '.$g.' --v '.$splitTMPBAMss2.' --out '.$splitBAMss2,1);

	print STDERR "SAM -> BAM: $splitBAMds [File $fileCount of $bamCount]\n";
	sysAndPrint($samtoolsPath.'/samtools view -Shb '.$splitSAMds.' >'.$splitBAMds,1);
	#sysAndPrint($ssPipelinePath.'/sortBAM --g '.$g.' --v '.$splitTMPBAMds.' --out '.$splitBAMds,1);

	print STDERR "SAM -> BAM: $splitBAMdsS [File $fileCount of $bamCount]\n";
	sysAndPrint($samtoolsPath.'/samtools view -Shb '.$splitSAMdsS.' >'.$splitBAMdsS,1);
	#sysAndPrint($ssPipelinePath.'/sortBAM --g '.$g.' --v '.$splitTMPBAMdsS.' --out '.$splitBAMdsS,1);

	print STDERR "SAM -> BAM: $splitBAMunC [File $fileCount of $bamCount]\n";
	sysAndPrint($samtoolsPath.'/samtools view -Shb '.$splitSAMunC.' >'.$splitBAMunC,1);
	#sysAndPrint($ssPipelinePath.'/sortBAM --g '.$g.' --v '.$splitTMPBAMunC.' --out '.$splitBAMunC,1);
	
	## SORT BED FILES 
	print STDERR "Sort ssDNA bed: $splitBEDss1 [File $fileCount of $bamCount]\n";
	sysAndPrint('sort -k1,1 -k2n,2n '.$splitBEDss1.' >'.$splitBEDSORTss1,1);

	print STDERR "Sort ssDNA bed: $splitBEDss2 [File $fileCount of $bamCount]\n";
	sysAndPrint('sort -k1,1 -k2n,2n '.$splitBEDss2.' >'.$splitBEDSORTss2,1);

	print STDERR "Sort ssDNA bed: $splitBEDds [File $fileCount of $bamCount]\n";
	sysAndPrint('sort -k1,1 -k2n,2n '.$splitBEDds.' >'.$splitBEDSORTds,1);

	print STDERR "Sort ssDNA bed: $splitBEDdsS [File $fileCount of $bamCount]\n";
	sysAndPrint('sort -k1,1 -k2n,2n '.$splitBEDdsS.' >'.$splitBEDSORTdsS,1);

	print STDERR "Sort ssDNA bed: $splitBEDunC [File $fileCount of $bamCount]\n";
	sysAndPrint('sort -k1,1 -k2n,2n '.$splitBEDunC.' >'.$splitBEDSORTunC,1);
}

print STDERR "\n";
print STDERR "*********************************************************************\n";
print STDERR "TMP FOLDER ($TmpPath) Contents :\n";
print STDERR "---------------------------------------------------------------------\n";
print STDERR "\n";
print STDERR `ls -l $TmpPath`;
print STDERR "\n";
print STDERR "*********************************************************************\n\n";

sysAndPrint("sort -k1,1 -k2n,2n -m $TmpPath\/*ssDNA_type1.sorted.bed >".$outBEDss1,1);
sysAndPrint("sort -k1,1 -k2n,2n -m $TmpPath\/*ssDNA_type2.sorted.bed >".$outBEDss2,1);
sysAndPrint("sort -k1,1 -k2n,2n -m $TmpPath\/*dsDNA.sorted.bed >".$outBEDds,1);
sysAndPrint("sort -k1,1 -k2n,2n -m $TmpPath\/*dsDNA_strict.sorted.bed >".$outBEDdsS,1);
sysAndPrint("sort -k1,1 -k2n,2n -m $TmpPath\/*unclassified.sorted.bed >".$outBEDunC,1);

sysAndPrint("$ssPipelinePath\/mergeBAMfiles --v --mh --sort --g $g $outBAMss1 $TmpPath\/*ssDNA_type1.bam",1);
sysAndPrint("$ssPipelinePath\/mergeBAMfiles --v --mh --sort --g $g $outBAMss2 $TmpPath\/*ssDNA_type2.bam",1);
sysAndPrint("$ssPipelinePath\/mergeBAMfiles --v --mh --sort --g $g $outBAMds  $TmpPath\/*dsDNA.bam",1);
sysAndPrint("$ssPipelinePath\/mergeBAMfiles --v --mh --sort --g $g $outBAMdsS $TmpPath\/*dsDNA_strict.bam",1);
sysAndPrint("$ssPipelinePath\/mergeBAMfiles --v --mh --sort --g $g $outBAMunC $TmpPath\/*unclassified.bam",1);

sysAndPrint($samtoolsPath.'/samtools index '.$outBAMss1,1);
sysAndPrint($samtoolsPath.'/samtools index '.$outBAMss2,1);
sysAndPrint($samtoolsPath.'/samtools index '.$outBAMds,1);
sysAndPrint($samtoolsPath.'/samtools index '.$outBAMdsS,1);
sysAndPrint($samtoolsPath.'/samtools index '.$outBAMunC,1);

if (allOK($outBEDss1,$outBEDss2,$outBEDds,$outBEDdsS,$outBEDunC,$outBAMss1,$outBAMss2,$outBAMds,$outBAMdsS,$outBAMunC)){
	sysAndPrint("touch $doneFile",1);
}else{
	sysAndPrint("touch $errFile",1);			
}
sysAndPrint("rm $full_bam",1) if ($rmInitialBAM);

################################################################################
sub allOK{
		my ($bed1,$bed2,$bedDS,$bedDSS,$bedUnC,$bam1,$bam2,$bamDS,$bamDSS,$bamUnC) = @_;
		
		unless ($bed1 && $bed2 && $bedDS && $bedDSS && $bedUnC && $bam1 && $bam2 && $bamDS && $bamDSS && $bamUnC){
			print STDERR "Some output filenames are missing ... ABORT !!\n";
			return 0;
		}

		unless (-e $bed1 && -e $bed2 && -e $bedDS && -e $bedDSS && -e $bedUnC && -e $bam1 && -e $bam2 && -e $bamDS && -e $bamDSS && -e $bamUnC){
			print STDERR "Some output files are missing ... ABORT !!\n";
			return 0;
		}

		unless (-s $bed1 || -s $bed2 || -s $bedDS || -s $bedDS || -s $bedUnC){
			print STDERR "All BED files have ZERO size ... ABORT !!\n";
			return 0;
		}

		unless (-s $bam1 || -s $bam2 || -s $bamDS || -s $bamDSS || -s $bamUnC){
			print STDERR "All BAM files have ZERO size ... ABORT !!\n";
			return 0;
		}
								
		return 1;
		
}

################################################################################
sub find_offset {
# $ref_2,$query_2
my ($seqA, $seqB, $f_read, $strand,$max_mm)=@_;

	if ($strand == -1) {
		$seqA = scalar reverse $seqA;
		$seqB = scalar reverse $seqB;
		$f_read =~ tr/ATGC/TACG/;
	}
	
	my @arrA = split(//,$seqA);
	my @arrB = split(//,$seqB);
	my @arrT = split(//,$f_read);
	my @arrC;
	my $j = 0;
	my $i = 0;
	while ($i<=$#arrT && $j <= $#arrB ) {
		if ($arrB[$i] eq "-") {
			$arrC[$i] = $arrB[$i];
		} else {
			$arrC[$i] = $arrT[$j]; $j++;
		}
		$i++;
	}
	
	$j = 0; my $mm = 0; my $n_gap = 0;
	
	while ($mm <= $max_mm && $j <= $#arrC) {
		$mm++ if $arrB[$j] ne $arrC[$j];
		$n_gap++ if $arrB[$j] eq "-";
		$j++;
	}
	
	my $aln_offset = $j-1;
	
	while ($arrB[$aln_offset] ne $arrC[$aln_offset]) {$aln_offset--;}
	
	my $seq_offset = $aln_offset - $n_gap + 1;
	
	$seq_offset = 0 if $seq_offset < 0;
	
	my @cmpAB; my @match_pat; my %score; my %rev_score;  my $max_score = 0;
	
	for my $i(0..$#arrA){ 
		$cmpAB[$i] = ($arrA[$i] eq $arrB[$i] || $arrA[$i] eq "N" || $arrB[$i] eq "N") ? 1 : -1; 
		$cmpAB[$i] = -2 if ($arrA[$i] ne $arrB[$i] && $arrB[$i] eq $arrC[$i]);
	}
	
	my $min_i = 0;      while ($min_i < $#arrA && $cmpAB[$min_i+1] == -1) {$min_i++;} # min start of offset 0-based
	my $max_i = $#arrA; while ($max_i > 0      && $cmpAB[$max_i-1] ==  1) {$max_i--;}
	
	for my $i(0..$#arrA){ $match_pat[$i] = $i >= $min_i ? 1 : -1;} # 
	foreach my $offset ($min_i..$max_i) {
		foreach my $i ($min_i..$max_i) {$score{$offset}+=$cmpAB[$i]*$match_pat[$i];}
		push @{$rev_score{$score{$offset}}}, $offset;
		$max_score = $score{$offset} if $score{$offset}>$max_score;
		$match_pat[$offset] = -1;
	}
	
	my $max_offset = 0;
	
	foreach my $offset (@{$rev_score{$max_score}}) {$max_offset = $max_offset<$offset? $offset : $max_offset;}
	my $aln_correction = $max_offset; 
	
	for my $i(0..$max_offset){$aln_correction-- if $arrA[$i] eq "-";}
	
	if ($DIAG) {
		my $a_string =""; my $m_string = ""; my $i_string = "";
		foreach my $i (0..$j)     {$i_string .= ($arrB[$i] ne "-" && $arrC[$i] eq $arrB[$i])? "|" : " ";}
		foreach my $i (0..$#arrA) {$a_string .= ($i >=$max_offset && $arrA[$i] eq $arrB[$i])? "|" : " ";}
		print $seqA, "\n",$a_string, "\n", $seqB, "\n", $i_string, "\n", $f_read, "\n" ;
	}
	
	# ITR length, aln offset, uH
	my $uH_len = $aln_offset-$max_offset+1; $uH_len = 0 if $uH_len < 0;
	return $seq_offset, $max_offset, $uH_len ,$aln_correction;
}

################################################################################
sub parseSAMflag{
	my $flag =shift;
	
	my $B = dec2bin($flag);
	
	while (length($B) < 11){$B = '0'.$B}
	
	$B = reverse($B);

	my %r1;
	
	($r1{'Read_Paired'}, $r1{'Pair_OK'}, $r1{'R1Unmapped'}, $r1{'R2Unmapped'},
	 $r1{'R1RC'}, $r1{'R2RC'}, $r1{'R1'}, $r1{'R2'}, $r1{'SecondaryAln'}, $r1{'QCfail'}, $r1{'Duplicate'}) = split(//,$B);
	
	return %r1;
	
}

################################################################################
sub SAMstrand{
    my $ss = shift;
    my %f  = parseSAMflag($ss);
    my $strand = 1;
    $strand = -1 if ($f{'R1RC'} && $f{'R1'});
    $strand = -1 if ($f{'R1RC'} && $f{'R2'});
    
    return $strand;
}

################################################################################
sub generateSAMline{
    my ($nRead,$rln,$itrLen,$iStrand,$numI,$numD,$numS) = @_;
        
    my ($Ibefore,$Iafter) = (0,0);
    my ($Dbefore,$Dafter) = (0,0);
    my ($Sbefore,$Safter) = (0,0);
    
    if ($nRead == 2){
	
	$Ibefore += $1 while($$rln[5] =~ /(\d+)I/g);
	$Dbefore += $1 while($$rln[5] =~ /(\d+)D/g);
        $Sbefore += $1 while($$rln[5] =~ /(\d+)S/g);
	
	if ($iStrand<0){
            $$rln[5] = trimCigar($$rln[5],$itrLen,'right');
            
            my $regex = '(\S+)\S{'.$itrLen.'}';
            $$rln[9]  =~ s/$regex/$1/;
            $$rln[10] =~ s/$regex/$1/;
             
            # Deprecated syntax           
            #$$rln[9] =~ s/(\S+)\S{$itrLen}/$1/;
            #$$rln[10] =~ s/(\S+)\S{$itrLen}/$1/;
        }else{
            $$rln[5] = trimCigar($$rln[5],$itrLen,'left');
            
			my $regex = '\S{'.$itrLen.'}(\S+)';
            $$rln[9]  =~ s/$regex/$1/;
            $$rln[10] =~ s/$regex/$1/;
            
            # Deprecated syntax           
            #$$rln[9] =~ s/\S{$itrLen}(\S+)/$1/;
            #$$rln[10] =~ s/\S{$itrLen}(\S+)/$1/;
        }
	
	$Iafter += $1 while($$rln[5] =~ /(\d+)I/g);
	$Dafter += $1 while($$rln[5] =~ /(\d+)D/g);
	$Safter += $1 while($$rln[5] =~ /(\d+)S/g);
    }

    my $nD = $numD?$numD:($Dbefore - $Dafter);
    my $nI = $numI?$numI:($Ibefore - $Iafter);
    my $nS = $numS?$numS:($Sbefore - $Safter);
    
    return '' if ($$rln[5] !~ /[MIDN]/);

    if ($iStrand < 0 && $nRead == 1){
        $$rln[7] += $itrLen-$nI+$nD-$nS;
        $$rln[8] += $itrLen-$nI+$nD-$nS;
    }

    if ($iStrand > 0 && $nRead == 2){
        $$rln[3] += $itrLen-$nI+$nD-$nS;
        $$rln[8] -= $itrLen-$nI+$nD-$nS;
    }
    
    my $retLn;
    
    for my $v(@{$rln}){
        my $vOLD = $v;
        
        if ($nRead == 2){
            next if ($v =~ /NM:i:/);
            
            my ($NM,$MDtrim);
            
            if ($v =~ s/(MD:\S+:)(\S+)/$1/){
                my $txt = $1;
                $MDtrim = trimXM($2,$itrLen-$nI+$nD-$nS,'left')  if ($iStrand > 0);
                $MDtrim = trimXM($2,$itrLen-$nI+$nD-$nS,'right') if ($iStrand < 0);
                $v = $txt.$MDtrim;
                $NM++ while ($MDtrim =~ /[GATC]/g); 
                $vOLD =~ s/MD/YK/;
                $v = join("\t","NM:i:".($NM?$NM:"0"),$v,$vOLD);
            }
        }
        $retLn .= $v."\t";
    }
    
    chop($retLn);
    
    return ($retLn,$nI,$nD,$nS);    
}

################################################################################
sub cigar2str{
    my ($cigSTR) = shift;
    my $s;
    while ($cigSTR =~ s/(\d+)(\S)//){
        $s .= "$2" x $1;
    }
    return $s;
}

################################################################################
sub str2cigar{
    my ($STR) = shift;
    my ($s,$cig);
    my $prev = '';
    
    while ($STR =~ s/^(\S)//){
        if ($1 eq $prev){
            $cig .= $1;
        }else{
            $s .= length($cig).$prev if ($prev);
            $cig = $1;
        }
        $prev = $1;
    }
    
    $s .= length($cig).$prev if ($prev);
    return $s;
}

################################################################################
sub trimCigar{
    my ($cigarString,$nTrim,$side) = @_;
    
    my $cigStr = cigar2str($cigarString);
    my @cigArr = split(//,$cigStr);
    my $retStr;
    
    @cigArr = reverse(@cigArr) if ($side eq 'right');
    
    for my $cS(@cigArr){
	$nTrim-- unless ($cS eq 'D');
	$retStr .= $cS if ($nTrim < 0);
    }
    
    $retStr = reverse($retStr) if ($side eq 'right');
    
    return str2cigar($retStr);
}


################################################################################
sub XM2str{
    my ($xmSTR) = shift;
    my $s;
    while ($xmSTR =~ s/(\d+|[GATC]|\^[GATC]+)//){
        my $n = $1;
        next if ($n eq '0');
	if ($n =~ /\d+/){$s .= "M" x $n; next}
	$s .= $n;
        
    }
    return $s;
}

################################################################################
sub str2XM{
    my ($STR) = shift;
    my ($s,$xm);
    my $prev = '';
    
    my $cnt = 0;
    while ($STR =~ s/^(M|[GATC]|\^[GATC]+)//){
        my $x = $1;
	
	if ($x eq 'M'){
            $cnt++; next;
        }else{
            $s .= ($cnt>0?$cnt:'0').$x;
            $cnt = 0;
        }
    }        
    
    $s .= $cnt if ($cnt > 0);
    
    return $s;
}

################################################################################
sub trimXM{
    my ($xmString,$nTrim,$side) = @_;
    
    my $xmStr = XM2str($xmString);
    my @XMArr = split(//,$xmStr);
    my $retStr;
    
    @XMArr = reverse(@XMArr) if ($side eq 'left');
    
    my $XMdel = 0;
    
    $XMdel += (length($1)+1) while ($xmStr =~ /\^([GATC]+)/g);
    my $XMLen = length($xmStr) - $XMdel;
    my $XMOKsz = $XMLen - $nTrim;
    
    my ($noTrim,$nGood);
    
    for my $cS(@XMArr){
	$noTrim = 1 if ($cS eq '^');
	$noTrim = 0 if ($cS eq 'M');
	$nGood++ unless ($noTrim);
	$retStr .= $cS ;
	last if ($nGood == $XMOKsz);
    }
    
    $retStr = reverse($retStr) if ($side eq 'left');
    
    return str2XM($retStr);
}

################################################################################
sub bin2dec {
	return unpack("N", pack("B32", substr("0" x 32 . shift, -32)));
}

################################################################################
sub dec2bin {
	my $str = unpack("B32", pack("N", shift));
	$str =~ s/^0+(?=\d)//; # otherwise you'll get leading zeros
	return $str;
}
