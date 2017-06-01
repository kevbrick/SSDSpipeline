#!/usr/bin/perl
use strict; 
use Getopt::Long; 
use File::Temp qw/ tempfile tempdir /;
use List::Util qw/max min/;
use Math::Round;
use SSDS_pipeline;

GetOptions ('fa=s' 		=> \(my $fa),
            'name=s'  	=> \(my $name),
            'g=s'  		=> \(my $assembly),
            'h+'  		=> \(my $help),
            'help+'  	=> \(my $helpMe),
            's=s'  		=> \(my $species));

my $curdir = `pwd`;
chomp $curdir; 
my $prevdir = $curdir; $prevdir =~ s/^(.+)\/.+$/$1/;

## Ensure we have full path names
$fa =~ s/^\.\//$curdir."\/"/e;
$fa =~ s/^\..\//$prevdir."\/"/e;

my ($PicardPath,$GenomePath,$samtoolsPath,$TmpPath,$ssPipelinePath) = genPaths($name,'noGenome');

my $gFolder = "$GenomePath$name";
my $fa2use  = "$GenomePath$name/genome.fa";
my $fai2use = "$GenomePath$name/genome.fa.fai";
my $faDict  = "$GenomePath$name/genome.dict";

my $idxFolder  = "$GenomePath$name/BWAIndex";
my $idx7Folder = "$GenomePath$name/BWAIndex/version0.7.10";
my $idx6Folder = "$GenomePath$name/BWAIndex/version0.6.x";
my $idx5Folder = "$GenomePath$name/BWAIndex/version0.5.x";

my $idx7fa     = "$GenomePath$name/BWAIndex/version0.7.10/genome.fa";
my $idx6fa     = "$GenomePath$name/BWAIndex/version0.6.x/genome.fa";
my $idx5fa     = "$GenomePath$name/BWAIndex/version0.5.x/genome.fa";

my $errMsg; 
$errMsg .= 'Must provide fasta file (--fa)'."\n" 		unless ($fa);
$errMsg .= 'Must provide genome name (--name)'."\n" 		unless ($name);
$errMsg .= 'Must provide genome assembly version (--g)'."\n" 	unless ($assembly);
$errMsg .= 'Must provide species name (--s)'."\n" 		unless ($species);

$errMsg .= 'Fasta file does not exist (--fa '.$fa.')'."\n" unless (-e $fa);
$errMsg .= 'Invalid fasta file extension (--fa '.$fa.') - must be .fa OR .fasta'."\n" unless ($fa =~ /(fa|fasta)$/);

$errMsg .= 'Name is already in use (--name '.$name." --> $gFolder)\n" if (-d $gFolder);

if ($help || $helpMe){
	die ("\nUsage: \n\nperl addGenome.pl --fa (fasta file - reqd) --name (reqd) --g (genome assembly - reqd) --s (species - reqd)\n\n");
}

if ($errMsg){
	die ("\nINVALID ARGUMENTS\n\n*****************************************************\n\n$errMsg\n*****************************************************\n\nUsage: \n\nperl addGenome.pl --fa (fasta file - reqd) --name (reqd) --g (genome assembly - reqd) --s (species - reqd)\n\n");
}

my $noRun = 0; 

## Make folder
sysAndPrint("mkdir $gFolder",1,$noRun);
sysAndPrint("mkdir $idxFolder",1,$noRun);
sysAndPrint("mkdir $idx5Folder",1,$noRun);
#sysAndPrint("mkdir $idx6Folder",1,$noRun);
sysAndPrint("mkdir $idx7Folder",1,$noRun);

## Move fasta file to folder
sysAndPrint("cp $fa $fa2use",1,$noRun);
sysAndPrint($samtoolsPath.'/samtools faidx '.$fa2use,1,$noRun);
sysAndPrint("java -jar ".$PicardPath.'\picard.jar CreateSequenceDictionary R='.$fa2use." O=$faDict GENOME_ASSEMBLY=$assembly SPECIES=$species VALIDATION_STRINGENCY=LENIENT",1,$noRun);

die ('Dictionary was not created ... try giving the interactive session more memory (~6Gb for a large mammalian genome\n') unless (-e $faDict);

## soft links to .fa, .fai and .dict files in each BWA folder
sysAndPrint("ln -s $fa2use $idx5Folder",1,$noRun);
#sysAndPrint("ln -s $fa2use $idx6Folder",1,$noRun);
sysAndPrint("ln -s $fa2use $idx7Folder",1,$noRun);

sysAndPrint("ln -s $fai2use $idx5Folder",1,$noRun);
#sysAndPrint("ln -s $fai2use $idx6Folder",1,$noRun);
sysAndPrint("ln -s $fai2use $idx7Folder",1,$noRun);

sysAndPrint("ln -s $faDict $idx5Folder",1,$noRun);
#sysAndPrint("ln -s $faDict $idx6Folder",1,$noRun);
sysAndPrint("ln -s $faDict $idx7Folder",1,$noRun);

## Make BWA indexes
my $swRand   = "swKB_".int(rand()*100000000000000);
my $swFolder = $curdir.'/.'.$swRand;
my $swFile = $swFolder.'/script_'.$swRand.'.sh';
system("mkdir $swFolder");

my $sz    = genomeSizeFromFai($fai2use);
my $aType = ($sz > 10000000)?"bwtsw":"is";

open SWARMFILE, ">", $swFile ;
print SWARMFILE $ssPipelinePath.'/bwa_0.5.9  index -a '.$aType.' '.$idx5fa."\n";
print SWARMFILE $ssPipelinePath.'/bwa_0.7.12 index -a '.$aType.' '.$idx7fa."\n";
close SWARMFILE;

sysAndPrint("sh $swFile",1,$noRun);
#my $swAll = `swarm --logdir $swFolder -t 8 -g 12 --gres=lscratch:50 -f $swFile`;
#chomp $swAll; 
#print STDERR "Genome indexes being created ... \n";
#print STDERR "Swarm jobs : \n$swAll\n";




