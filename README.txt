INSTALLATION:
The easiest way to install the SSDS alignment pipeline is to simply run the configuration script located in the folder downloaded from github: 
>cd ssdsPipeline

On debian-based linux systems, the configure script will install the SSDS alignment pipeline to /home/$USER/SSDS_pipeline_1.0.0. 

To install the pipeline to the default locations:
>sudo ./configure.sh

Alternatively, you can specify the installation and / or genomes folders:
>sudo ./configure.sh -i /mnt/share/SSDS -g /mnt/share/SSDSgenomes

The configuration script will install all of the required dependencies and test the pipeline. 

If the configuration process successfully completes, the pipeline has been installed. Please skip sections A-C below. If the configuration process fails, please follow the manual instructions outlined in sections A-C below. These instructions also serve as a guide for users of other operating systems. 

MANUAL INSTALLATION: 
A. ------------------------------------------------------------
Set environment variables:

SSDSPIPELINEPATH : location of run_SSDS_pipeline binary
SSDSPICARDPATH : picard location (recommend: $SSPIPELINEPATH/picard-tools-2.3.0)
SSDSFASTXPATH : path to fastx_trimmer binary (recommend: $SSPIPELINEPATH)
SSDSSAMTOOLSPATH : path to samtools binary (recommend: $SSPIPELINEPATH)
SSDSGENOMESPATH : genomes top level folder 
SSDSTMPPATH : temporary folder location
PERL5LIB : $SSDSPIPELINEPATH must be added to the perl path

It is best to define these environment variables in your user configuration file (ie. ~/.bashrc). Add the following lines to ~/.bashrc: 
export SSDSPIPELINEPATH=/XXX/YYY/ssdsPipeline
export SSDSPICARDPATH=/XXX/YYY/ssdsPipeline/picard-tools-2.3.0
export SSDSFASTXPATH=/XXX/YYY/ssdsPipeline
export SSDSSAMTOOLSPATH=/XXX/YYY/ssdsPipeline
export SSDSGENOMESPATH=/XXX/YYY/ssdsPipeline/genomes
export SSDSTMPPATH=/tmp
export PERL5LIB=$PERL5LIB:$SSDSPIPELINEPATH

Initialize variables in .bashrc file
>source ~/.bashrc

B. ------------------------------------------------------------
Install dependencies: 

The following programs are required for the SSDS pipeline:
Java run-time

Get java runtime (root privileges required):
>sudo apt-get install default-jre

The following perl packages are required for the SSDS pipeline: 

Bio::DB::Sam
File::Temp
Getopt::Long
Math::Round
Statistics::Descriptive
Switch
Make::Build

Install perl modules as follows (root privileges required):
>export PERL_MM_USE_DEFAULT=1
>sudo cpan File::Temp
>sudo cpan Getopt::Long
>sudo cpan Math::Round
>sudo cpan Statistics::Descriptive
>sudo cpan Switch

>sudo apt-get install zlib1g-dev
>sudo apt-get install bioperl
>cd $SSDSPIPELINEPATH/Bio-SamTools-1.43
>perl INSTALL.pl

C. ------------------------------------------------------------
Run the unit tests:

>cd $SSDSPIPELINEPATH/unitTest/
>sh runTest.sh

This will test the addGenome.pl script and the SSDS pipeline using either fastq, fastq.gz or bam files as input. Successful completion of the tests will result in the following output: 

Test genome was added and indexed successfully !!
SSDS pipeline from FASTQ successful !!
SSDS pipeline from FASTQ.GZ successful !!

The SSDS pipeline has been installed successfully and can be run.

INSTALLATION NOTES:
The SSDS pipeline has been tested and used on UCSC genomes. Therefore, chromosome names in the genome.fa file should follow the “chr##” nomenclature. Chromosome names that lack a “chr” preface or that use letter-based designations may not work. 

Specific versions of picard, samtools and fastx_trimmer are included in the SSDS pipeline repository. We recommend using these versions as other versions may not be compatible with the SSDS pipeline. Expert users can tweak the pipeline scripts to use different versions of these programs if desired.

========================================================================================================================
RUNNING THE SSDS ALIGNMENT PIPELINE
A. PREPARING GENOMES FOR THE SSDS ALIGNMENT PIPELINE: 

The genomes folder is used for both alignment and for sorting BAM files. Each reference genome must be located in a unique sub-folder.

The $SSDSPIPELINEPATH/addGenome.pl script will add a genome and generate all of the required files. It takes a genome fasta file as input.

>perl $SSDSPIPELINEPATH/addGenome.pl --fa (genome FASTA file) --name (genome name; ie. mm10) --g (genome assembly; ie. mm10) --s (species; ie. mus_musculus)

This will create index the genome and create a folder structure in  $SSDSGENOMESPATH. The name provided to the addGenome.pl script is the genome name that will be used for running the pipeline (--g argument). 

Alternatively, the genome folder can be populated manually using steps 1-4 below:

1. Create the folder. The folder name will be used as the genome name when running the SSDS pipeline:
>mkdir $SSDSGENOMESPATH/genome_name/ 

2. Copy the genome fasta file to the genomes folder:
>cp genome.fa $SSDSGENOMESPATH/genome_name/genome.fa

3. Create the genome fasta file index (makes fasta.fai file):
>samtools faidx $SSDSGENOMESPATH/genome_name/genome.fa

4. Index the genome for the bwa version required:

The genome folders structure is as follows (folder names must be exact):

>mkdir $SSDSGENOMESPATH/genome_name/BWAIndex
>mkdir $SSDSGENOMESPATH/genome_name/BWAIndex/version0.5.x
>mkdir $SSDSGENOMESPATH/genome_name/BWAIndex/version0.7.10

Once this structure has been built, index the genome:

>cd $SSDSGENOMESPATH/genome2use/BWAIndex/version0.5.x
>ln -s ../../genome.fa .
>$SSDSPIPELINEPATH/bwa_0.5.x index -a bwtsw genome.fa

>cd $SSDSGENOMESPATH/genome2use/BWAIndex/version0.7.10
>ln -s ../../genome.fa .
>$SSDSPIPELINEPATH/bwa_0.7.12 index -a bwtsw genome.fa

Create genome dictionary file:
>java -jar $SSDSPICARDPATH/picard.jar CreateSequenceDictionary R=$SSDSGENOMESPATH/genome_name/genome.fa O=$SSDSGENOMESPATH/genome_name/genome.dict GENOME_ASSEMBLY=XXXX SPECIES=mySpecies VALIDATION_STRINGENCY=LENIENT

B. ALIGNING READS WITH THE SSDS PIPELINE:

Starting from fastq / fastq.gz files, the pipeline can be run with the following command: 

>$SSDSPIPELINEPATH/run_ssDNAPipeline \
 --g {genome name} \
 --n {number of threads} \
 --fq1 {path to fastq / fastq.gz for read 1} \
 --fq2 {path to fastq / fastq.gz for read 2} \
 --sample {sample name} \
 --lane {lane number; or ANY number} \
 --date {date in DDMMYY format} \
 --outdir {output folder} 

Starting from a paired-end BAM file, the pipeline can be run with the following command: 

>$SSDSPIPELINEPATH/run_ssDNAPipeline \
 --g {genome name} \
 --n {number of threads} \
 --bam {path to paired end bam file} \
 --sample {sample name} \
 --lane {lane number; or ANY number} \
 --date {date in DDMMYY format} \
 --outdir {output folder} 

The arguments for the SSDS pipeline can be accessed from the command line:

>$SSDSPIPELINEPATH/run_ssDNAPipeline -h

Alternatively, they are listed below. 

ARG            Synopsis (* = required)                          Detail
--g            *Genome name                                     Name must match a folder in $SSDSGENOMESPATH

NOTE (*): Either --bam OR --fq1 & --fq2 arguments are required
--bam          *Input BAM file                                  Full path to a paired-end BAM file
--fq1          *Input fastq for read 1                          Full path to a fastq / fastq.gz file for read 1
--fq2          *Input fastq for read 2                          Full path to a fastq / fastq.gz file for read 2
--n            Number of threads (for alignment step)           Default = 12
--r1BP         Trim size for read 1 (bp)                        Integer value (default = 36)
--r1BP         Trim size for read 1 (bp)                        Integer value (default = 36)
--splitSz      Large BAM files are split for ssDNA detection.   A lower value reduces the memory footprint (default = 20000000)
--outdir       Output folder                                    Defaults to BAM / FASTQ folder
--sample       Sample name for read group
--date         Date for read group                              Date in DDMMYY format
--lane         Lane for read group
--bwaVers      Bwa version to use                               0.5 or 0.7 [default]
--v            Use verbose mode
--h/help       Show help

OUTPUT FILES FROM THE SSDS PIPELINE:
The SSDS pipeline aligns Illumina sequencing reads to a reference genome and then generates output files for each of five sub-categories of DNA types (Fig. X): 

ssDNA type 1 : high confidence ssDNA
ssDNA type 2 : low confidence ssDNA
dsDNA: low confidence dsDNA
dsDNA strict : higher confidence dsDNA
unclassified : other ambiguous DNA

Importantly, these designations represent the most likely source of DNA, given the alignment and detectable inverted terminal repeat structure. These designations are not 100% correct: for example, ssDNA with perfect short homology between the start and end of a fragment will be classified as dsDNA. It is very unlikely that dsDNA will ever be classified as ssDNA type 1. 

Sequencing reads of each type are output to BAM files. In ssDNA BAM files, the ITRs have been removed, but details of the ITR structure are retained as tag fields:

Microhomology length : uh:i:{number}
Mismatches within microhomology: mm:i:{number}
Distance of microhomology to fragment end (offset): os:i:{number}
ITR length : it:i:{number} 

Fragments, representing the entire sequence from the start of the first-end read to the end of the second-end read, are output to BED files. Columns of the BED files correspond to: 

Chromosome
Fragment start
Fragment end 
Read 1 Quality Score _ Read 2 Quality Score
ITR length _ Microhomology length _ Offset length
Fragment strand
