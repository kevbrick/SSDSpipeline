mkdir /tmp//SSDSpl_tmp_65787784785
mkdir /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome
mkdir /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex
mkdir /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.5.x
mkdir /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10
cp SSDSdemoRegion.fasta /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/genome.fa
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools faidx /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/genome.fa
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar CreateSequenceDictionary R=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/genome.fa O=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/genome.dict GENOME_ASSEMBLY=tg1 SPECIES=MusMusculusChr10_92581444_92756444 VALIDATION_STRINGENCY=LENIENT
[Thu Jun 01 18:26:57 EDT 2017] picard.sam.CreateSequenceDictionary REFERENCE=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/genome.fa OUTPUT=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/genome.dict GENOME_ASSEMBLY=tg1 SPECIES=MusMusculusChr10_92581444_92756444 VALIDATION_STRINGENCY=LENIENT    TRUNCATE_NAMES_AT_WHITESPACE=true NUM_SEQUENCES=2147483647 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:26:57 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
[Thu Jun 01 18:26:57 EDT 2017] picard.sam.CreateSequenceDictionary done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
ln -s /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/genome.fa /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.5.x
ln -s /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/genome.fa /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10
ln -s /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/genome.fa.fai /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.5.x
ln -s /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/genome.fa.fai /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10
ln -s /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/genome.dict /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.5.x
ln -s /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/genome.dict /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10
sh /home/kevbrick/data/SSDS_Pipeline/git/unitTest/.swKB_88245594557108/script_swKB_88245594557108.sh
[bwa_index] Pack FASTA... 0.00 sec
[bwa_index] Reverse the packed sequence... 0.00 sec
[bwa_index] Construct BWT for the packed sequence...
[bwa_index] 0.02 seconds elapse.
[bwa_index] Construct BWT for the reverse packed sequence...
[bwa_index] 0.02 seconds elapse.
[bwa_index] Update BWT... 0.00 sec
[bwa_index] Update reverse BWT... 0.00 sec
[bwa_index] Construct SA from BWT and Occ... 0.01 sec
[bwa_index] Construct SA from reverse BWT and Occ... 0.01 sec
[bwa_index] Pack FASTA... 0.00 sec
[bwa_index] Construct BWT for the packed sequence...
[bwa_index] 0.05 seconds elapse.
[bwa_index] Update BWT... 0.00 sec
[bwa_index] Pack forward-only FASTA... 0.00 sec
[bwa_index] Construct SA from BWT and Occ... 0.02 sec
[main] Version: 0.7.12-r1039
[main] CMD: /home/kevbrick/data/SSDS_Pipeline/git//bwa_0.7.12 index -a is /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[main] Real time: 0.408 sec; CPU: 0.076 sec
mkdir /tmp//SSDSpl_tmp_24605303754
mkdir /tmp//SSDSpl_tmp_33234730393
rm /tmp//SSDSpl_tmp_33234730393/*
rm: cannot remove '/tmp//SSDSpl_tmp_33234730393/*': No such file or directory
/home/kevbrick/data/SSDS_Pipeline/git/fastx_trimmer -f 1 -l 36 -i /home/kevbrick/data/SSDS_Pipeline/git/unitTest/SSDSdemo.R1.fastq >/tmp//SSDSpl_tmp_33234730393/SSDSdemo.trim.R1.fq
/home/kevbrick/data/SSDS_Pipeline/git/fastx_trimmer -f 1 -l 40 -i /home/kevbrick/data/SSDS_Pipeline/git/unitTest/SSDSdemo.R2.fastq >/tmp//SSDSpl_tmp_33234730393/SSDSdemo.trim.R2.fq
/home/kevbrick/data/SSDS_Pipeline/git//bwa_0.7.12 aln -t 1 /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_33234730393/SSDSdemo.trim.R1.fq >/tmp//SSDSpl_tmp_33234730393/SSDSdemo.R1.sai
[bwa_aln] 17bp reads: max_diff = 2
[bwa_aln] 38bp reads: max_diff = 3
[bwa_aln] 64bp reads: max_diff = 4
[bwa_aln] 93bp reads: max_diff = 5
[bwa_aln] 124bp reads: max_diff = 6
[bwa_aln] 157bp reads: max_diff = 7
[bwa_aln] 190bp reads: max_diff = 8
[bwa_aln] 225bp reads: max_diff = 9
[bwa_aln_core] calculate SA coordinate... 0.09 sec
[bwa_aln_core] write to the disk... 0.00 sec
[bwa_aln_core] 3673 sequences have been processed.
[main] Version: 0.7.12-r1039
[main] CMD: /home/kevbrick/data/SSDS_Pipeline/git//bwa_0.7.12 aln -t 1 /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_33234730393/SSDSdemo.trim.R1.fq
[main] Real time: 0.153 sec; CPU: 0.092 sec
/home/kevbrick/data/SSDS_Pipeline/git//bwa_ra_0.7.12 aln -t 1 /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_33234730393/SSDSdemo.trim.R2.fq >/tmp//SSDSpl_tmp_33234730393/SSDSdemo.R2.sai
[bwa_aln] 17bp reads: max_diff = 2
[bwa_aln] 38bp reads: max_diff = 3
[bwa_aln] 64bp reads: max_diff = 4
[bwa_aln] 93bp reads: max_diff = 5
[bwa_aln] 124bp reads: max_diff = 6
[bwa_aln] 157bp reads: max_diff = 7
[bwa_aln] 190bp reads: max_diff = 8
[bwa_aln] 225bp reads: max_diff = 9
[bwa_aln_core] calculate SA coordinate... 2.00 sec
[bwa_aln_core] write to the disk... 0.00 sec
[bwa_aln_core] 3673 sequences have been processed.
[main] Version: 0.7.12-r1039
[main] CMD: /home/kevbrick/data/SSDS_Pipeline/git//bwa_ra_0.7.12 aln -t 1 /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_33234730393/SSDSdemo.trim.R2.fq
[main] Real time: 2.056 sec; CPU: 2.004 sec
/home/kevbrick/data/SSDS_Pipeline/git//bwa_0.7.12 sampe  /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_33234730393/SSDSdemo.R1.sai /tmp//SSDSpl_tmp_33234730393/SSDSdemo.R2.sai /tmp//SSDSpl_tmp_33234730393/SSDSdemo.trim.R1.fq /tmp//SSDSpl_tmp_33234730393/SSDSdemo.trim.R2.fq | java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar SamFormatConverter VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_33234730393 I=/dev/stdin O=/tmp//SSDSpl_tmp_33234730393/SSDSdemo.bwa_testgenome.bam
[bwa_sai2sam_pe_core] convert to sequence coordinate... 
[infer_isize] (25, 50, 75) percentile: (61, 76, 99)
[infer_isize] low and high boundaries: 40 and 175 for estimating avg and std
[infer_isize] inferred external isize from 3345 pairs: 82.809 +/- 27.796
[infer_isize] skewness: 1.017; kurtosis: 0.706; ap_prior: 8.81e-05
[infer_isize] inferred maximum insert size: 237 (5.56 sigma)
[bwa_sai2sam_pe_core] time elapses: 0.04 sec
[bwa_sai2sam_pe_core] changing coordinates of 0 alignments.
[bwa_sai2sam_pe_core] align unmapped mate...
[bwa_paired_sw] 9 out of 38 Q17 singletons are mated.
[bwa_paired_sw] 0 out of 306 Q17 discordant pairs are fixed.
[bwa_sai2sam_pe_core] time elapses: 0.01 sec
[bwa_sai2sam_pe_core] refine gapped alignments... 0.01 sec
[bwa_sai2sam_pe_core] print alignments... [Thu Jun 01 18:27:01 EDT 2017] picard.sam.SamFormatConverter INPUT=/dev/stdin OUTPUT=/tmp/SSDSpl_tmp_33234730393/SSDSdemo.bwa_testgenome.bam TMP_DIR=[/tmp/SSDSpl_tmp_33234730393] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:01 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
0.03 sec
[bwa_sai2sam_pe_core] 3673 sequences have been processed.
[main] Version: 0.7.12-r1039
[main] CMD: /home/kevbrick/data/SSDS_Pipeline/git//bwa_0.7.12 sampe /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_33234730393/SSDSdemo.R1.sai /tmp//SSDSpl_tmp_33234730393/SSDSdemo.R2.sai /tmp//SSDSpl_tmp_33234730393/SSDSdemo.trim.R1.fq /tmp//SSDSpl_tmp_33234730393/SSDSdemo.trim.R2.fq
[main] Real time: 0.866 sec; CPU: 0.100 sec
[Thu Jun 01 18:27:01 EDT 2017] picard.sam.SamFormatConverter done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --v --g  testgenome /tmp//SSDSpl_tmp_33234730393/SSDSdemo.bwa_testgenome.bam
mkdir /tmp//SSDSpl_tmp_76212225535
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_76212225535 I=/tmp//SSDSpl_tmp_33234730393/SSDSdemo.bwa_testgenome.bam O=/tmp//SSDSpl_tmp_33234730393/SSDSdemo.bwa_testgenome.SSbam SO=coordinate
[Thu Jun 01 18:27:02 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_33234730393/SSDSdemo.bwa_testgenome.bam OUTPUT=/tmp/SSDSpl_tmp_33234730393/SSDSdemo.bwa_testgenome.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_76212225535] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:02 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:02	SortSam	Finished reading inputs, merging and writing to output now.
[Thu Jun 01 18:27:02 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_76212225535 I= /tmp//SSDSpl_tmp_33234730393/SSDSdemo.bwa_testgenome.SSbam O= /tmp//SSDSpl_tmp_33234730393/SSDSdemo.bwa_testgenome.sorted.bam R= /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Thu Jun 01 18:27:03 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_33234730393/SSDSdemo.bwa_testgenome.SSbam OUTPUT=/tmp/SSDSpl_tmp_33234730393/SSDSdemo.bwa_testgenome.sorted.bam REFERENCE=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_76212225535] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:03 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:03	ReorderSam	SAM/BAM file
INFO	2017-06-01 18:27:03	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:27:03	ReorderSam	Reference
INFO	2017-06-01 18:27:03	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:27:03	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-01 18:27:03	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-01 18:27:03	ReorderSam	Writing reads...
INFO	2017-06-01 18:27:03	ReorderSam	  Processing All reads
INFO	2017-06-01 18:27:03	ReorderSam	Wrote 7346 reads
[Thu Jun 01 18:27:03 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_33234730393/SSDSdemo.bwa_testgenome.SSbam 
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools view -f 2 -bh  /tmp//SSDSpl_tmp_33234730393/SSDSdemo.bwa_testgenome.sorted.bam >/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ//SSDSdemo.sortedAln.testgenome.bam
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ//SSDSdemo.sortedAln.testgenome.bam
perl /home/kevbrick/data/SSDS_Pipeline/git//parseITRs.pl --temp /tmp//SSDSpl_tmp_33234730393 --bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ//SSDSdemo.sortedAln.testgenome.bam --output bedbam --outdir /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/ --splitSz 1000 --g testgenome --gOK >/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ//SSDSdemo.ITRId.OUT 2>/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ//SSDSdemo.ITRId.ERR
open: No such file or directory
[main_samview] fail to open "SSDSdemo.sortedAln.testgenome.bam" for reading.
mkdir /tmp//SSDSpl_tmp_33234730393/KB_addRG_80573169942/ ;
cp /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type1.bam /tmp//SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.bam ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder  /tmp//SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.bam ;
mkdir /tmp//SSDSpl_tmp_41155958322
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_41155958322 I=/tmp//SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.bam O=/tmp//SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.SSbam SO=coordinate
[Thu Jun 01 18:27:26 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.bam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_41155958322] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:26 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:27	SortSam	Finished reading inputs, merging and writing to output now.
[Thu Jun 01 18:27:27 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_41155958322 I= /tmp//SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.SSbam O= /tmp//SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.sorted.bam R= /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Thu Jun 01 18:27:27 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.SSbam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.sorted.bam REFERENCE=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_41155958322] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:27 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:27	ReorderSam	SAM/BAM file
INFO	2017-06-01 18:27:27	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:27:27	ReorderSam	Reference
INFO	2017-06-01 18:27:27	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:27:27	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-01 18:27:27	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-01 18:27:27	ReorderSam	Writing reads...
INFO	2017-06-01 18:27:27	ReorderSam	  Processing All reads
INFO	2017-06-01 18:27:27	ReorderSam	Wrote 6338 reads
[Thu Jun 01 18:27:27 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.SSbam 
mv /tmp//SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.sorted.bam /tmp//SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.srt.bam ; 
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar AddOrReplaceReadGroups I=/tmp//SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.srt.bam O=/tmp//SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.RG.bam RGID=RG_311215_99_ssDNA_type1 RGSM=demo RGPU=na RGLB=demo RGPL=illumina RGCN=NIDDK_Genomics_Core  TMP_DIR=/tmp//SSDSpl_tmp_33234730393 ;
[Thu Jun 01 18:27:28 EDT 2017] picard.sam.AddOrReplaceReadGroups INPUT=/tmp//SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.srt.bam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.RG.bam RGID=RG_311215_99_ssDNA_type1 RGLB=demo RGPL=illumina RGPU=na RGSM=demo RGCN=NIDDK_Genomics_Core TMP_DIR=[/tmp/SSDSpl_tmp_33234730393]    VERBOSITY=INFO QUIET=false VALIDATION_STRINGENCY=STRICT COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:28 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:28	AddOrReplaceReadGroups	Created read group ID=RG_311215_99_ssDNA_type1 PL=illumina LB=demo SM=demo

[Thu Jun 01 18:27:28 EDT 2017] picard.sam.AddOrReplaceReadGroups done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder /tmp//SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.RG.bam ;
mkdir /tmp//SSDSpl_tmp_90546910704
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_90546910704 I=/tmp//SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.RG.bam O=/tmp//SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.RG.SSbam SO=coordinate
[Thu Jun 01 18:27:29 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.RG.bam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.RG.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_90546910704] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:29 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:29	SortSam	Finished reading inputs, merging and writing to output now.
[Thu Jun 01 18:27:29 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_90546910704 I= /tmp//SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.RG.SSbam O= /tmp//SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.RG.sorted.bam R= /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Thu Jun 01 18:27:30 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.RG.SSbam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.RG.sorted.bam REFERENCE=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_90546910704] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:30 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:30	ReorderSam	SAM/BAM file
INFO	2017-06-01 18:27:30	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:27:30	ReorderSam	Reference
INFO	2017-06-01 18:27:30	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:27:30	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-01 18:27:30	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-01 18:27:30	ReorderSam	Writing reads...
INFO	2017-06-01 18:27:30	ReorderSam	  Processing All reads
INFO	2017-06-01 18:27:30	ReorderSam	Wrote 6338 reads
[Thu Jun 01 18:27:30 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.RG.SSbam 
java -Xmx4g -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar MarkDuplicates I=/tmp//SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.RG.sorted.bam O=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type1.final.bam M=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type1.MDmetrics.tab VALIDATION_STRINGENCY=LENIENT AS=true TMP_DIR=/tmp//SSDSpl_tmp_33234730393 ;
[Thu Jun 01 18:27:31 EDT 2017] picard.sam.markduplicates.MarkDuplicates INPUT=[/tmp//SSDSpl_tmp_33234730393/KB_addRG_80573169942/SSDSdemo.testgenome.ssDNA_type1.RG.sorted.bam] OUTPUT=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type1.final.bam METRICS_FILE=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type1.MDmetrics.tab ASSUME_SORTED=true TMP_DIR=[/tmp/SSDSpl_tmp_33234730393] VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag REMOVE_DUPLICATES=false DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:31 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:31	MarkDuplicates	Start of doWork freeMemory: 376497176; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-01 18:27:31	MarkDuplicates	Reading input file and constructing read end information.
INFO	2017-06-01 18:27:31	MarkDuplicates	Will retain up to 14684096 data points before spilling to disk.
INFO	2017-06-01 18:27:31	MarkDuplicates	Read 6338 records. 0 pairs never matched.
INFO	2017-06-01 18:27:32	MarkDuplicates	After buildSortedReadEndLists freeMemory: 257905840; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-01 18:27:32	MarkDuplicates	Will retain up to 119308288 duplicate indices before spilling to disk.
INFO	2017-06-01 18:27:34	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2017-06-01 18:27:34	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2017-06-01 18:27:34	MarkDuplicates	Sorting list of duplicate records.
INFO	2017-06-01 18:27:35	MarkDuplicates	After generateDuplicateIndexes freeMemory: 376462456; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-01 18:27:35	MarkDuplicates	Marking 2180 records as duplicates.
INFO	2017-06-01 18:27:35	MarkDuplicates	Found 2 optical duplicate clusters.
INFO	2017-06-01 18:27:35	MarkDuplicates	Reads are assumed to be ordered by: coordinate
INFO	2017-06-01 18:27:35	MarkDuplicates	Before output close freeMemory: 1330322992; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-01 18:27:35	MarkDuplicates	After output close freeMemory: 1330322128; totalMemory: 1334837248; maxMemory: 3817865216
[Thu Jun 01 18:27:35 EDT 2017] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 0.07 minutes.
Runtime.totalMemory()=1334837248
mv /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type1.final.bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type1.bam ;
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type1.bam ;
rm -rf /tmp//SSDSpl_tmp_33234730393/KB_addRG_80573169942/ ;

mkdir /tmp//SSDSpl_tmp_33234730393/KB_addRG_92754463901/ ;
cp /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type2.bam /tmp//SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.bam ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder  /tmp//SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.bam ;
mkdir /tmp//SSDSpl_tmp_97559831834
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_97559831834 I=/tmp//SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.bam O=/tmp//SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.SSbam SO=coordinate
[Thu Jun 01 18:27:36 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.bam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_97559831834] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:36 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:36	SortSam	Finished reading inputs, merging and writing to output now.
[Thu Jun 01 18:27:36 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_97559831834 I= /tmp//SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.SSbam O= /tmp//SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.sorted.bam R= /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Thu Jun 01 18:27:36 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.SSbam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.sorted.bam REFERENCE=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_97559831834] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:36 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:36	ReorderSam	SAM/BAM file
INFO	2017-06-01 18:27:36	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:27:36	ReorderSam	Reference
INFO	2017-06-01 18:27:36	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:27:36	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-01 18:27:36	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-01 18:27:36	ReorderSam	Writing reads...
INFO	2017-06-01 18:27:36	ReorderSam	  Processing All reads
INFO	2017-06-01 18:27:36	ReorderSam	Wrote 300 reads
[Thu Jun 01 18:27:36 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.SSbam 
mv /tmp//SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.sorted.bam /tmp//SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.srt.bam ; 
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar AddOrReplaceReadGroups I=/tmp//SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.srt.bam O=/tmp//SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.RG.bam RGID=RG_311215_99_ssDNA_type2 RGSM=demo RGPU=na RGLB=demo RGPL=illumina RGCN=NIDDK_Genomics_Core  TMP_DIR=/tmp//SSDSpl_tmp_33234730393 ;
[Thu Jun 01 18:27:37 EDT 2017] picard.sam.AddOrReplaceReadGroups INPUT=/tmp//SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.srt.bam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.RG.bam RGID=RG_311215_99_ssDNA_type2 RGLB=demo RGPL=illumina RGPU=na RGSM=demo RGCN=NIDDK_Genomics_Core TMP_DIR=[/tmp/SSDSpl_tmp_33234730393]    VERBOSITY=INFO QUIET=false VALIDATION_STRINGENCY=STRICT COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:37 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:37	AddOrReplaceReadGroups	Created read group ID=RG_311215_99_ssDNA_type2 PL=illumina LB=demo SM=demo

[Thu Jun 01 18:27:37 EDT 2017] picard.sam.AddOrReplaceReadGroups done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder /tmp//SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.RG.bam ;
mkdir /tmp//SSDSpl_tmp_2717970039
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_2717970039 I=/tmp//SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.RG.bam O=/tmp//SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.RG.SSbam SO=coordinate
[Thu Jun 01 18:27:37 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.RG.bam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.RG.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_2717970039] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:37 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:37	SortSam	Finished reading inputs, merging and writing to output now.
[Thu Jun 01 18:27:37 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_2717970039 I= /tmp//SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.RG.SSbam O= /tmp//SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.RG.sorted.bam R= /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Thu Jun 01 18:27:38 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.RG.SSbam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.RG.sorted.bam REFERENCE=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_2717970039] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:38 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:38	ReorderSam	SAM/BAM file
INFO	2017-06-01 18:27:38	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:27:38	ReorderSam	Reference
INFO	2017-06-01 18:27:38	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:27:38	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-01 18:27:38	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-01 18:27:38	ReorderSam	Writing reads...
INFO	2017-06-01 18:27:38	ReorderSam	  Processing All reads
INFO	2017-06-01 18:27:38	ReorderSam	Wrote 300 reads
[Thu Jun 01 18:27:38 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.RG.SSbam 
java -Xmx4g -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar MarkDuplicates I=/tmp//SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.RG.sorted.bam O=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type2.final.bam M=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type2.MDmetrics.tab VALIDATION_STRINGENCY=LENIENT AS=true TMP_DIR=/tmp//SSDSpl_tmp_33234730393 ;
[Thu Jun 01 18:27:38 EDT 2017] picard.sam.markduplicates.MarkDuplicates INPUT=[/tmp//SSDSpl_tmp_33234730393/KB_addRG_92754463901/SSDSdemo.testgenome.ssDNA_type2.RG.sorted.bam] OUTPUT=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type2.final.bam METRICS_FILE=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type2.MDmetrics.tab ASSUME_SORTED=true TMP_DIR=[/tmp/SSDSpl_tmp_33234730393] VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag REMOVE_DUPLICATES=false DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:38 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:38	MarkDuplicates	Start of doWork freeMemory: 376497096; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-01 18:27:38	MarkDuplicates	Reading input file and constructing read end information.
INFO	2017-06-01 18:27:38	MarkDuplicates	Will retain up to 14684096 data points before spilling to disk.
INFO	2017-06-01 18:27:39	MarkDuplicates	Read 300 records. 0 pairs never matched.
INFO	2017-06-01 18:27:39	MarkDuplicates	After buildSortedReadEndLists freeMemory: 258578544; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-01 18:27:39	MarkDuplicates	Will retain up to 119308288 duplicate indices before spilling to disk.
INFO	2017-06-01 18:27:41	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2017-06-01 18:27:41	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2017-06-01 18:27:41	MarkDuplicates	Sorting list of duplicate records.
INFO	2017-06-01 18:27:42	MarkDuplicates	After generateDuplicateIndexes freeMemory: 376483864; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-01 18:27:42	MarkDuplicates	Marking 112 records as duplicates.
INFO	2017-06-01 18:27:42	MarkDuplicates	Found 0 optical duplicate clusters.
INFO	2017-06-01 18:27:42	MarkDuplicates	Reads are assumed to be ordered by: coordinate
INFO	2017-06-01 18:27:42	MarkDuplicates	Before output close freeMemory: 1330339376; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-01 18:27:42	MarkDuplicates	After output close freeMemory: 1330404384; totalMemory: 1334837248; maxMemory: 3817865216
[Thu Jun 01 18:27:42 EDT 2017] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 0.06 minutes.
Runtime.totalMemory()=1334837248
mv /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type2.final.bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type2.bam ;
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type2.bam ;
rm -rf /tmp//SSDSpl_tmp_33234730393/KB_addRG_92754463901/ ;

mkdir /tmp//SSDSpl_tmp_33234730393/KB_addRG_58000605073/ ;
cp /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA.bam /tmp//SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.bam ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder  /tmp//SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.bam ;
mkdir /tmp//SSDSpl_tmp_28317962221
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_28317962221 I=/tmp//SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.bam O=/tmp//SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.SSbam SO=coordinate
[Thu Jun 01 18:27:43 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.bam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_28317962221] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:43 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:43	SortSam	Finished reading inputs, merging and writing to output now.
[Thu Jun 01 18:27:43 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_28317962221 I= /tmp//SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.SSbam O= /tmp//SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.sorted.bam R= /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Thu Jun 01 18:27:43 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.SSbam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.sorted.bam REFERENCE=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_28317962221] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:43 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:43	ReorderSam	SAM/BAM file
INFO	2017-06-01 18:27:43	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:27:43	ReorderSam	Reference
INFO	2017-06-01 18:27:43	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:27:43	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-01 18:27:43	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-01 18:27:43	ReorderSam	Writing reads...
INFO	2017-06-01 18:27:43	ReorderSam	  Processing All reads
INFO	2017-06-01 18:27:43	ReorderSam	Wrote 12 reads
[Thu Jun 01 18:27:43 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.SSbam 
mv /tmp//SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.sorted.bam /tmp//SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.srt.bam ; 
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar AddOrReplaceReadGroups I=/tmp//SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.srt.bam O=/tmp//SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.RG.bam RGID=RG_311215_99_dsDNA RGSM=demo RGPU=na RGLB=demo RGPL=illumina RGCN=NIDDK_Genomics_Core  TMP_DIR=/tmp//SSDSpl_tmp_33234730393 ;
[Thu Jun 01 18:27:44 EDT 2017] picard.sam.AddOrReplaceReadGroups INPUT=/tmp//SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.srt.bam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.RG.bam RGID=RG_311215_99_dsDNA RGLB=demo RGPL=illumina RGPU=na RGSM=demo RGCN=NIDDK_Genomics_Core TMP_DIR=[/tmp/SSDSpl_tmp_33234730393]    VERBOSITY=INFO QUIET=false VALIDATION_STRINGENCY=STRICT COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:44 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:44	AddOrReplaceReadGroups	Created read group ID=RG_311215_99_dsDNA PL=illumina LB=demo SM=demo

[Thu Jun 01 18:27:44 EDT 2017] picard.sam.AddOrReplaceReadGroups done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder /tmp//SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.RG.bam ;
mkdir /tmp//SSDSpl_tmp_98724858889
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_98724858889 I=/tmp//SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.RG.bam O=/tmp//SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.RG.SSbam SO=coordinate
[Thu Jun 01 18:27:44 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.RG.bam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.RG.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_98724858889] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:44 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:44	SortSam	Finished reading inputs, merging and writing to output now.
[Thu Jun 01 18:27:44 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_98724858889 I= /tmp//SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.RG.SSbam O= /tmp//SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.RG.sorted.bam R= /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Thu Jun 01 18:27:45 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.RG.SSbam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.RG.sorted.bam REFERENCE=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_98724858889] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:45 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:45	ReorderSam	SAM/BAM file
INFO	2017-06-01 18:27:45	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:27:45	ReorderSam	Reference
INFO	2017-06-01 18:27:45	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:27:45	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-01 18:27:45	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-01 18:27:45	ReorderSam	Writing reads...
INFO	2017-06-01 18:27:45	ReorderSam	  Processing All reads
INFO	2017-06-01 18:27:45	ReorderSam	Wrote 12 reads
[Thu Jun 01 18:27:45 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.RG.SSbam 
java -Xmx4g -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar MarkDuplicates I=/tmp//SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.RG.sorted.bam O=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA.final.bam M=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA.MDmetrics.tab VALIDATION_STRINGENCY=LENIENT AS=true TMP_DIR=/tmp//SSDSpl_tmp_33234730393 ;
[Thu Jun 01 18:27:45 EDT 2017] picard.sam.markduplicates.MarkDuplicates INPUT=[/tmp//SSDSpl_tmp_33234730393/KB_addRG_58000605073/SSDSdemo.testgenome.dsDNA.RG.sorted.bam] OUTPUT=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA.final.bam METRICS_FILE=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA.MDmetrics.tab ASSUME_SORTED=true TMP_DIR=[/tmp/SSDSpl_tmp_33234730393] VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag REMOVE_DUPLICATES=false DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:45 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:45	MarkDuplicates	Start of doWork freeMemory: 376497728; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-01 18:27:45	MarkDuplicates	Reading input file and constructing read end information.
INFO	2017-06-01 18:27:45	MarkDuplicates	Will retain up to 14684096 data points before spilling to disk.
INFO	2017-06-01 18:27:45	MarkDuplicates	Read 12 records. 0 pairs never matched.
INFO	2017-06-01 18:27:46	MarkDuplicates	After buildSortedReadEndLists freeMemory: 258615816; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-01 18:27:46	MarkDuplicates	Will retain up to 119308288 duplicate indices before spilling to disk.
INFO	2017-06-01 18:27:48	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2017-06-01 18:27:48	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2017-06-01 18:27:48	MarkDuplicates	Sorting list of duplicate records.
INFO	2017-06-01 18:27:49	MarkDuplicates	After generateDuplicateIndexes freeMemory: 376490032; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-01 18:27:49	MarkDuplicates	Marking 0 records as duplicates.
INFO	2017-06-01 18:27:49	MarkDuplicates	Found 0 optical duplicate clusters.
INFO	2017-06-01 18:27:49	MarkDuplicates	Reads are assumed to be ordered by: coordinate
INFO	2017-06-01 18:27:49	MarkDuplicates	Before output close freeMemory: 1330350912; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-01 18:27:49	MarkDuplicates	After output close freeMemory: 1330415680; totalMemory: 1334837248; maxMemory: 3817865216
[Thu Jun 01 18:27:49 EDT 2017] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 0.06 minutes.
Runtime.totalMemory()=1334837248
mv /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA.final.bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA.bam ;
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA.bam ;
rm -rf /tmp//SSDSpl_tmp_33234730393/KB_addRG_58000605073/ ;

mkdir /tmp//SSDSpl_tmp_33234730393/KB_addRG_54734722304/ ;
cp /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA_strict.bam /tmp//SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.bam ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder  /tmp//SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.bam ;
mkdir /tmp//SSDSpl_tmp_89323734988
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_89323734988 I=/tmp//SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.bam O=/tmp//SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.SSbam SO=coordinate
[Thu Jun 01 18:27:49 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.bam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_89323734988] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:49 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:49	SortSam	Finished reading inputs, merging and writing to output now.
[Thu Jun 01 18:27:49 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_89323734988 I= /tmp//SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.SSbam O= /tmp//SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.sorted.bam R= /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Thu Jun 01 18:27:50 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.SSbam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.sorted.bam REFERENCE=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_89323734988] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:50 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:50	ReorderSam	SAM/BAM file
INFO	2017-06-01 18:27:50	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:27:50	ReorderSam	Reference
INFO	2017-06-01 18:27:50	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:27:50	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-01 18:27:50	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-01 18:27:50	ReorderSam	Writing reads...
INFO	2017-06-01 18:27:50	ReorderSam	  Processing All reads
INFO	2017-06-01 18:27:50	ReorderSam	Wrote 8 reads
[Thu Jun 01 18:27:50 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.SSbam 
mv /tmp//SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.sorted.bam /tmp//SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.srt.bam ; 
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar AddOrReplaceReadGroups I=/tmp//SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.srt.bam O=/tmp//SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.RG.bam RGID=RG_311215_99_dsDNA_strict RGSM=demo RGPU=na RGLB=demo RGPL=illumina RGCN=NIDDK_Genomics_Core  TMP_DIR=/tmp//SSDSpl_tmp_33234730393 ;
[Thu Jun 01 18:27:50 EDT 2017] picard.sam.AddOrReplaceReadGroups INPUT=/tmp//SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.srt.bam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.RG.bam RGID=RG_311215_99_dsDNA_strict RGLB=demo RGPL=illumina RGPU=na RGSM=demo RGCN=NIDDK_Genomics_Core TMP_DIR=[/tmp/SSDSpl_tmp_33234730393]    VERBOSITY=INFO QUIET=false VALIDATION_STRINGENCY=STRICT COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:50 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:50	AddOrReplaceReadGroups	Created read group ID=RG_311215_99_dsDNA_strict PL=illumina LB=demo SM=demo

[Thu Jun 01 18:27:50 EDT 2017] picard.sam.AddOrReplaceReadGroups done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder /tmp//SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.RG.bam ;
mkdir /tmp//SSDSpl_tmp_38451266738
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_38451266738 I=/tmp//SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.RG.bam O=/tmp//SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.RG.SSbam SO=coordinate
[Thu Jun 01 18:27:51 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.RG.bam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.RG.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_38451266738] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:51 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:51	SortSam	Finished reading inputs, merging and writing to output now.
[Thu Jun 01 18:27:51 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_38451266738 I= /tmp//SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.RG.SSbam O= /tmp//SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.RG.sorted.bam R= /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Thu Jun 01 18:27:51 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.RG.SSbam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.RG.sorted.bam REFERENCE=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_38451266738] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:51 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:51	ReorderSam	SAM/BAM file
INFO	2017-06-01 18:27:51	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:27:51	ReorderSam	Reference
INFO	2017-06-01 18:27:51	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:27:51	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-01 18:27:51	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-01 18:27:51	ReorderSam	Writing reads...
INFO	2017-06-01 18:27:51	ReorderSam	  Processing All reads
INFO	2017-06-01 18:27:51	ReorderSam	Wrote 8 reads
[Thu Jun 01 18:27:51 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.RG.SSbam 
java -Xmx4g -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar MarkDuplicates I=/tmp//SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.RG.sorted.bam O=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA_strict.final.bam M=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA_strict.MDmetrics.tab VALIDATION_STRINGENCY=LENIENT AS=true TMP_DIR=/tmp//SSDSpl_tmp_33234730393 ;
[Thu Jun 01 18:27:52 EDT 2017] picard.sam.markduplicates.MarkDuplicates INPUT=[/tmp//SSDSpl_tmp_33234730393/KB_addRG_54734722304/SSDSdemo.testgenome.dsDNA_strict.RG.sorted.bam] OUTPUT=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA_strict.final.bam METRICS_FILE=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA_strict.MDmetrics.tab ASSUME_SORTED=true TMP_DIR=[/tmp/SSDSpl_tmp_33234730393] VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag REMOVE_DUPLICATES=false DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:52 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:52	MarkDuplicates	Start of doWork freeMemory: 376497928; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-01 18:27:52	MarkDuplicates	Reading input file and constructing read end information.
INFO	2017-06-01 18:27:52	MarkDuplicates	Will retain up to 14684096 data points before spilling to disk.
INFO	2017-06-01 18:27:52	MarkDuplicates	Read 8 records. 0 pairs never matched.
INFO	2017-06-01 18:27:53	MarkDuplicates	After buildSortedReadEndLists freeMemory: 258615048; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-01 18:27:53	MarkDuplicates	Will retain up to 119308288 duplicate indices before spilling to disk.
INFO	2017-06-01 18:27:55	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2017-06-01 18:27:55	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2017-06-01 18:27:55	MarkDuplicates	Sorting list of duplicate records.
INFO	2017-06-01 18:27:55	MarkDuplicates	After generateDuplicateIndexes freeMemory: 376488832; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-01 18:27:55	MarkDuplicates	Marking 0 records as duplicates.
INFO	2017-06-01 18:27:55	MarkDuplicates	Found 0 optical duplicate clusters.
INFO	2017-06-01 18:27:55	MarkDuplicates	Reads are assumed to be ordered by: coordinate
INFO	2017-06-01 18:27:55	MarkDuplicates	Before output close freeMemory: 1330350104; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-01 18:27:55	MarkDuplicates	After output close freeMemory: 1330414840; totalMemory: 1334837248; maxMemory: 3817865216
[Thu Jun 01 18:27:55 EDT 2017] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 0.06 minutes.
Runtime.totalMemory()=1334837248
mv /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA_strict.final.bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA_strict.bam ;
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA_strict.bam ;
rm -rf /tmp//SSDSpl_tmp_33234730393/KB_addRG_54734722304/ ;

mkdir /tmp//SSDSpl_tmp_33234730393/KB_addRG_41277803269/ ;
cp /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.unclassified.bam /tmp//SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.bam ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder  /tmp//SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.bam ;
mkdir /tmp//SSDSpl_tmp_46975692205
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_46975692205 I=/tmp//SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.bam O=/tmp//SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.SSbam SO=coordinate
[Thu Jun 01 18:27:56 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.bam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_46975692205] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:56 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:56	SortSam	Finished reading inputs, merging and writing to output now.
[Thu Jun 01 18:27:56 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_46975692205 I= /tmp//SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.SSbam O= /tmp//SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.sorted.bam R= /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Thu Jun 01 18:27:56 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.SSbam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.sorted.bam REFERENCE=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_46975692205] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:56 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:56	ReorderSam	SAM/BAM file
INFO	2017-06-01 18:27:56	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:27:56	ReorderSam	Reference
INFO	2017-06-01 18:27:56	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:27:56	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-01 18:27:56	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-01 18:27:56	ReorderSam	Writing reads...
INFO	2017-06-01 18:27:56	ReorderSam	  Processing All reads
INFO	2017-06-01 18:27:56	ReorderSam	Wrote 26 reads
[Thu Jun 01 18:27:56 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.SSbam 
mv /tmp//SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.sorted.bam /tmp//SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.srt.bam ; 
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar AddOrReplaceReadGroups I=/tmp//SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.srt.bam O=/tmp//SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.RG.bam RGID=RG_311215_99_unclassified RGSM=demo RGPU=na RGLB=demo RGPL=illumina RGCN=NIDDK_Genomics_Core  TMP_DIR=/tmp//SSDSpl_tmp_33234730393 ;
[Thu Jun 01 18:27:57 EDT 2017] picard.sam.AddOrReplaceReadGroups INPUT=/tmp//SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.srt.bam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.RG.bam RGID=RG_311215_99_unclassified RGLB=demo RGPL=illumina RGPU=na RGSM=demo RGCN=NIDDK_Genomics_Core TMP_DIR=[/tmp/SSDSpl_tmp_33234730393]    VERBOSITY=INFO QUIET=false VALIDATION_STRINGENCY=STRICT COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:57 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:57	AddOrReplaceReadGroups	Created read group ID=RG_311215_99_unclassified PL=illumina LB=demo SM=demo

[Thu Jun 01 18:27:57 EDT 2017] picard.sam.AddOrReplaceReadGroups done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder /tmp//SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.RG.bam ;
mkdir /tmp//SSDSpl_tmp_71108276986
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_71108276986 I=/tmp//SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.RG.bam O=/tmp//SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.RG.SSbam SO=coordinate
[Thu Jun 01 18:27:57 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.RG.bam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.RG.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_71108276986] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:57 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:58	SortSam	Finished reading inputs, merging and writing to output now.
[Thu Jun 01 18:27:58 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_71108276986 I= /tmp//SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.RG.SSbam O= /tmp//SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.RG.sorted.bam R= /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Thu Jun 01 18:27:58 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.RG.SSbam OUTPUT=/tmp/SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.RG.sorted.bam REFERENCE=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_71108276986] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:58 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:58	ReorderSam	SAM/BAM file
INFO	2017-06-01 18:27:58	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:27:58	ReorderSam	Reference
INFO	2017-06-01 18:27:58	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:27:58	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-01 18:27:58	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-01 18:27:58	ReorderSam	Writing reads...
INFO	2017-06-01 18:27:58	ReorderSam	  Processing All reads
INFO	2017-06-01 18:27:58	ReorderSam	Wrote 26 reads
[Thu Jun 01 18:27:58 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.RG.SSbam 
java -Xmx4g -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar MarkDuplicates I=/tmp//SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.RG.sorted.bam O=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.unclassified.final.bam M=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.unclassified.MDmetrics.tab VALIDATION_STRINGENCY=LENIENT AS=true TMP_DIR=/tmp//SSDSpl_tmp_33234730393 ;
[Thu Jun 01 18:27:58 EDT 2017] picard.sam.markduplicates.MarkDuplicates INPUT=[/tmp//SSDSpl_tmp_33234730393/KB_addRG_41277803269/SSDSdemo.testgenome.unclassified.RG.sorted.bam] OUTPUT=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.unclassified.final.bam METRICS_FILE=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.unclassified.MDmetrics.tab ASSUME_SORTED=true TMP_DIR=[/tmp/SSDSpl_tmp_33234730393] VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag REMOVE_DUPLICATES=false DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:27:58 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:27:58	MarkDuplicates	Start of doWork freeMemory: 376498280; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-01 18:27:58	MarkDuplicates	Reading input file and constructing read end information.
INFO	2017-06-01 18:27:58	MarkDuplicates	Will retain up to 14684096 data points before spilling to disk.
INFO	2017-06-01 18:27:59	MarkDuplicates	Read 26 records. 0 pairs never matched.
INFO	2017-06-01 18:27:59	MarkDuplicates	After buildSortedReadEndLists freeMemory: 258613296; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-01 18:27:59	MarkDuplicates	Will retain up to 119308288 duplicate indices before spilling to disk.
INFO	2017-06-01 18:28:01	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2017-06-01 18:28:01	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2017-06-01 18:28:01	MarkDuplicates	Sorting list of duplicate records.
INFO	2017-06-01 18:28:02	MarkDuplicates	After generateDuplicateIndexes freeMemory: 376489024; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-01 18:28:02	MarkDuplicates	Marking 4 records as duplicates.
INFO	2017-06-01 18:28:02	MarkDuplicates	Found 0 optical duplicate clusters.
INFO	2017-06-01 18:28:02	MarkDuplicates	Reads are assumed to be ordered by: coordinate
INFO	2017-06-01 18:28:02	MarkDuplicates	Before output close freeMemory: 1330348736; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-01 18:28:02	MarkDuplicates	After output close freeMemory: 1330413760; totalMemory: 1334837248; maxMemory: 3817865216
[Thu Jun 01 18:28:02 EDT 2017] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 0.06 minutes.
Runtime.totalMemory()=1334837248
mv /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.unclassified.final.bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.unclassified.bam ;
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.unclassified.bam ;
rm -rf /tmp//SSDSpl_tmp_33234730393/KB_addRG_41277803269/ ;

rm -rf /tmp//SSDSpl_tmp_33234730393
mkdir /tmp//SSDSpl_tmp_53821219860
mkdir /tmp//SSDSpl_tmp_86099423941
rm /tmp//SSDSpl_tmp_86099423941/*
rm: cannot remove '/tmp//SSDSpl_tmp_86099423941/*': No such file or directory
gunzip -c /home/kevbrick/data/SSDS_Pipeline/git/unitTest/SSDSdemo.R1.fastq.gz >/tmp//SSDSpl_tmp_86099423941/SSDSdemo.R1.fastq
gunzip -c /home/kevbrick/data/SSDS_Pipeline/git/unitTest/SSDSdemo.R2.fastq.gz >/tmp//SSDSpl_tmp_86099423941/SSDSdemo.R2.fastq
/home/kevbrick/data/SSDS_Pipeline/git/fastx_trimmer -f 1 -l 36 -i /tmp//SSDSpl_tmp_86099423941/SSDSdemo.R1.fastq >/tmp//SSDSpl_tmp_86099423941/SSDSdemo.trim.R1.fq
/home/kevbrick/data/SSDS_Pipeline/git/fastx_trimmer -f 1 -l 40 -i /tmp//SSDSpl_tmp_86099423941/SSDSdemo.R2.fastq >/tmp//SSDSpl_tmp_86099423941/SSDSdemo.trim.R2.fq
/home/kevbrick/data/SSDS_Pipeline/git//bwa_0.7.12 aln -t 1 /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_86099423941/SSDSdemo.trim.R1.fq >/tmp//SSDSpl_tmp_86099423941/SSDSdemo.R1.sai
[bwa_aln] 17bp reads: max_diff = 2
[bwa_aln] 38bp reads: max_diff = 3
[bwa_aln] 64bp reads: max_diff = 4
[bwa_aln] 93bp reads: max_diff = 5
[bwa_aln] 124bp reads: max_diff = 6
[bwa_aln] 157bp reads: max_diff = 7
[bwa_aln] 190bp reads: max_diff = 8
[bwa_aln] 225bp reads: max_diff = 9
[bwa_aln_core] calculate SA coordinate... 0.09 sec
[bwa_aln_core] write to the disk... 0.00 sec
[bwa_aln_core] 3673 sequences have been processed.
[main] Version: 0.7.12-r1039
[main] CMD: /home/kevbrick/data/SSDS_Pipeline/git//bwa_0.7.12 aln -t 1 /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_86099423941/SSDSdemo.trim.R1.fq
[main] Real time: 0.151 sec; CPU: 0.092 sec
/home/kevbrick/data/SSDS_Pipeline/git//bwa_ra_0.7.12 aln -t 1 /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_86099423941/SSDSdemo.trim.R2.fq >/tmp//SSDSpl_tmp_86099423941/SSDSdemo.R2.sai
[bwa_aln] 17bp reads: max_diff = 2
[bwa_aln] 38bp reads: max_diff = 3
[bwa_aln] 64bp reads: max_diff = 4
[bwa_aln] 93bp reads: max_diff = 5
[bwa_aln] 124bp reads: max_diff = 6
[bwa_aln] 157bp reads: max_diff = 7
[bwa_aln] 190bp reads: max_diff = 8
[bwa_aln] 225bp reads: max_diff = 9
[bwa_aln_core] calculate SA coordinate... 2.00 sec
[bwa_aln_core] write to the disk... 0.00 sec
[bwa_aln_core] 3673 sequences have been processed.
[main] Version: 0.7.12-r1039
[main] CMD: /home/kevbrick/data/SSDS_Pipeline/git//bwa_ra_0.7.12 aln -t 1 /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_86099423941/SSDSdemo.trim.R2.fq
[main] Real time: 2.039 sec; CPU: 2.004 sec
/home/kevbrick/data/SSDS_Pipeline/git//bwa_0.7.12 sampe  /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_86099423941/SSDSdemo.R1.sai /tmp//SSDSpl_tmp_86099423941/SSDSdemo.R2.sai /tmp//SSDSpl_tmp_86099423941/SSDSdemo.trim.R1.fq /tmp//SSDSpl_tmp_86099423941/SSDSdemo.trim.R2.fq | java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar SamFormatConverter VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_86099423941 I=/dev/stdin O=/tmp//SSDSpl_tmp_86099423941/SSDSdemo.bwa_testgenome.bam
[bwa_sai2sam_pe_core] convert to sequence coordinate... 
[infer_isize] (25, 50, 75) percentile: (61, 76, 99)
[infer_isize] low and high boundaries: 40 and 175 for estimating avg and std
[infer_isize] inferred external isize from 3345 pairs: 82.809 +/- 27.796
[infer_isize] skewness: 1.017; kurtosis: 0.706; ap_prior: 8.81e-05
[infer_isize] inferred maximum insert size: 237 (5.56 sigma)
[bwa_sai2sam_pe_core] time elapses: 0.04 sec
[bwa_sai2sam_pe_core] changing coordinates of 0 alignments.
[bwa_sai2sam_pe_core] align unmapped mate...
[bwa_paired_sw] 9 out of 38 Q17 singletons are mated.
[bwa_paired_sw] 0 out of 306 Q17 discordant pairs are fixed.
[bwa_sai2sam_pe_core] time elapses: 0.01 sec
[bwa_sai2sam_pe_core] refine gapped alignments... 0.01 sec
[bwa_sai2sam_pe_core] print alignments... [Thu Jun 01 18:28:05 EDT 2017] picard.sam.SamFormatConverter INPUT=/dev/stdin OUTPUT=/tmp/SSDSpl_tmp_86099423941/SSDSdemo.bwa_testgenome.bam TMP_DIR=[/tmp/SSDSpl_tmp_86099423941] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:05 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
0.03 sec
[bwa_sai2sam_pe_core] 3673 sequences have been processed.
[main] Version: 0.7.12-r1039
[main] CMD: /home/kevbrick/data/SSDS_Pipeline/git//bwa_0.7.12 sampe /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_86099423941/SSDSdemo.R1.sai /tmp//SSDSpl_tmp_86099423941/SSDSdemo.R2.sai /tmp//SSDSpl_tmp_86099423941/SSDSdemo.trim.R1.fq /tmp//SSDSpl_tmp_86099423941/SSDSdemo.trim.R2.fq
[main] Real time: 0.813 sec; CPU: 0.104 sec
[Thu Jun 01 18:28:06 EDT 2017] picard.sam.SamFormatConverter done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --v --g  testgenome /tmp//SSDSpl_tmp_86099423941/SSDSdemo.bwa_testgenome.bam
mkdir /tmp//SSDSpl_tmp_78639608535
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_78639608535 I=/tmp//SSDSpl_tmp_86099423941/SSDSdemo.bwa_testgenome.bam O=/tmp//SSDSpl_tmp_86099423941/SSDSdemo.bwa_testgenome.SSbam SO=coordinate
[Thu Jun 01 18:28:06 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_86099423941/SSDSdemo.bwa_testgenome.bam OUTPUT=/tmp/SSDSpl_tmp_86099423941/SSDSdemo.bwa_testgenome.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_78639608535] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:06 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:06	SortSam	Finished reading inputs, merging and writing to output now.
[Thu Jun 01 18:28:07 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_78639608535 I= /tmp//SSDSpl_tmp_86099423941/SSDSdemo.bwa_testgenome.SSbam O= /tmp//SSDSpl_tmp_86099423941/SSDSdemo.bwa_testgenome.sorted.bam R= /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Thu Jun 01 18:28:07 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_86099423941/SSDSdemo.bwa_testgenome.SSbam OUTPUT=/tmp/SSDSpl_tmp_86099423941/SSDSdemo.bwa_testgenome.sorted.bam REFERENCE=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_78639608535] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:07 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:07	ReorderSam	SAM/BAM file
INFO	2017-06-01 18:28:07	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:28:07	ReorderSam	Reference
INFO	2017-06-01 18:28:07	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:28:07	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-01 18:28:07	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-01 18:28:07	ReorderSam	Writing reads...
INFO	2017-06-01 18:28:07	ReorderSam	  Processing All reads
INFO	2017-06-01 18:28:07	ReorderSam	Wrote 7346 reads
[Thu Jun 01 18:28:07 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_86099423941/SSDSdemo.bwa_testgenome.SSbam 
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools view -f 2 -bh  /tmp//SSDSpl_tmp_86099423941/SSDSdemo.bwa_testgenome.sorted.bam >/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz//SSDSdemo.sortedAln.testgenome.bam
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz//SSDSdemo.sortedAln.testgenome.bam
perl /home/kevbrick/data/SSDS_Pipeline/git//parseITRs.pl --temp /tmp//SSDSpl_tmp_86099423941 --bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz//SSDSdemo.sortedAln.testgenome.bam --output bedbam --outdir /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/ --splitSz 1000 --g testgenome --gOK >/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz//SSDSdemo.ITRId.OUT 2>/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz//SSDSdemo.ITRId.ERR
open: No such file or directory
[main_samview] fail to open "SSDSdemo.sortedAln.testgenome.bam" for reading.
mkdir /tmp//SSDSpl_tmp_86099423941/KB_addRG_84932265276/ ;
cp /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type1.bam /tmp//SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.bam ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder  /tmp//SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.bam ;
mkdir /tmp//SSDSpl_tmp_44699643885
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_44699643885 I=/tmp//SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.bam O=/tmp//SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.SSbam SO=coordinate
[Thu Jun 01 18:28:30 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.bam OUTPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_44699643885] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:30 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:31	SortSam	Finished reading inputs, merging and writing to output now.
[Thu Jun 01 18:28:31 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_44699643885 I= /tmp//SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.SSbam O= /tmp//SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.sorted.bam R= /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Thu Jun 01 18:28:31 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.SSbam OUTPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.sorted.bam REFERENCE=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_44699643885] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:31 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:31	ReorderSam	SAM/BAM file
INFO	2017-06-01 18:28:31	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:28:31	ReorderSam	Reference
INFO	2017-06-01 18:28:31	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:28:31	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-01 18:28:31	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-01 18:28:31	ReorderSam	Writing reads...
INFO	2017-06-01 18:28:31	ReorderSam	  Processing All reads
INFO	2017-06-01 18:28:31	ReorderSam	Wrote 6338 reads
[Thu Jun 01 18:28:31 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.SSbam 
mv /tmp//SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.sorted.bam /tmp//SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.srt.bam ; 
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar AddOrReplaceReadGroups I=/tmp//SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.srt.bam O=/tmp//SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.RG.bam RGID=RG_311215_99_ssDNA_type1 RGSM=demo RGPU=na RGLB=demo RGPL=illumina RGCN=NIDDK_Genomics_Core  TMP_DIR=/tmp//SSDSpl_tmp_86099423941 ;
[Thu Jun 01 18:28:32 EDT 2017] picard.sam.AddOrReplaceReadGroups INPUT=/tmp//SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.srt.bam OUTPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.RG.bam RGID=RG_311215_99_ssDNA_type1 RGLB=demo RGPL=illumina RGPU=na RGSM=demo RGCN=NIDDK_Genomics_Core TMP_DIR=[/tmp/SSDSpl_tmp_86099423941]    VERBOSITY=INFO QUIET=false VALIDATION_STRINGENCY=STRICT COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:32 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:32	AddOrReplaceReadGroups	Created read group ID=RG_311215_99_ssDNA_type1 PL=illumina LB=demo SM=demo

[Thu Jun 01 18:28:32 EDT 2017] picard.sam.AddOrReplaceReadGroups done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder /tmp//SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.RG.bam ;
mkdir /tmp//SSDSpl_tmp_44552751707
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_44552751707 I=/tmp//SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.RG.bam O=/tmp//SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.RG.SSbam SO=coordinate
[Thu Jun 01 18:28:33 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.RG.bam OUTPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.RG.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_44552751707] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:33 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:33	SortSam	Finished reading inputs, merging and writing to output now.
[Thu Jun 01 18:28:33 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_44552751707 I= /tmp//SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.RG.SSbam O= /tmp//SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.RG.sorted.bam R= /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Thu Jun 01 18:28:34 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.RG.SSbam OUTPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.RG.sorted.bam REFERENCE=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_44552751707] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:34 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:34	ReorderSam	SAM/BAM file
INFO	2017-06-01 18:28:34	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:28:34	ReorderSam	Reference
INFO	2017-06-01 18:28:34	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:28:34	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-01 18:28:34	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-01 18:28:34	ReorderSam	Writing reads...
INFO	2017-06-01 18:28:34	ReorderSam	  Processing All reads
INFO	2017-06-01 18:28:34	ReorderSam	Wrote 6338 reads
[Thu Jun 01 18:28:34 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.RG.SSbam 
java -Xmx4g -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar MarkDuplicates I=/tmp//SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.RG.sorted.bam O=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type1.final.bam M=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type1.MDmetrics.tab VALIDATION_STRINGENCY=LENIENT AS=true TMP_DIR=/tmp//SSDSpl_tmp_86099423941 ;
[Thu Jun 01 18:28:35 EDT 2017] picard.sam.markduplicates.MarkDuplicates INPUT=[/tmp//SSDSpl_tmp_86099423941/KB_addRG_84932265276/SSDSdemo.testgenome.ssDNA_type1.RG.sorted.bam] OUTPUT=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type1.final.bam METRICS_FILE=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type1.MDmetrics.tab ASSUME_SORTED=true TMP_DIR=[/tmp/SSDSpl_tmp_86099423941] VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag REMOVE_DUPLICATES=false DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:35 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:35	MarkDuplicates	Start of doWork freeMemory: 376497456; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-01 18:28:35	MarkDuplicates	Reading input file and constructing read end information.
INFO	2017-06-01 18:28:35	MarkDuplicates	Will retain up to 14684096 data points before spilling to disk.
INFO	2017-06-01 18:28:35	MarkDuplicates	Read 6338 records. 0 pairs never matched.
INFO	2017-06-01 18:28:36	MarkDuplicates	After buildSortedReadEndLists freeMemory: 257906392; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-01 18:28:36	MarkDuplicates	Will retain up to 119308288 duplicate indices before spilling to disk.
INFO	2017-06-01 18:28:38	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2017-06-01 18:28:38	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2017-06-01 18:28:38	MarkDuplicates	Sorting list of duplicate records.
INFO	2017-06-01 18:28:38	MarkDuplicates	After generateDuplicateIndexes freeMemory: 376463008; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-01 18:28:38	MarkDuplicates	Marking 2180 records as duplicates.
INFO	2017-06-01 18:28:38	MarkDuplicates	Found 2 optical duplicate clusters.
INFO	2017-06-01 18:28:38	MarkDuplicates	Reads are assumed to be ordered by: coordinate
INFO	2017-06-01 18:28:39	MarkDuplicates	Before output close freeMemory: 1330323504; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-01 18:28:39	MarkDuplicates	After output close freeMemory: 1330322928; totalMemory: 1334837248; maxMemory: 3817865216
[Thu Jun 01 18:28:39 EDT 2017] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 0.07 minutes.
Runtime.totalMemory()=1334837248
mv /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type1.final.bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type1.bam ;
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type1.bam ;
rm -rf /tmp//SSDSpl_tmp_86099423941/KB_addRG_84932265276/ ;

mkdir /tmp//SSDSpl_tmp_86099423941/KB_addRG_6508471378/ ;
cp /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type2.bam /tmp//SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.bam ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder  /tmp//SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.bam ;
mkdir /tmp//SSDSpl_tmp_36702997780
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_36702997780 I=/tmp//SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.bam O=/tmp//SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.SSbam SO=coordinate
[Thu Jun 01 18:28:40 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.bam OUTPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_36702997780] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:40 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:40	SortSam	Finished reading inputs, merging and writing to output now.
[Thu Jun 01 18:28:40 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_36702997780 I= /tmp//SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.SSbam O= /tmp//SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.sorted.bam R= /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Thu Jun 01 18:28:40 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.SSbam OUTPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.sorted.bam REFERENCE=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_36702997780] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:40 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:40	ReorderSam	SAM/BAM file
INFO	2017-06-01 18:28:40	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:28:40	ReorderSam	Reference
INFO	2017-06-01 18:28:40	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:28:40	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-01 18:28:40	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-01 18:28:40	ReorderSam	Writing reads...
INFO	2017-06-01 18:28:40	ReorderSam	  Processing All reads
INFO	2017-06-01 18:28:40	ReorderSam	Wrote 300 reads
[Thu Jun 01 18:28:40 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.SSbam 
mv /tmp//SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.sorted.bam /tmp//SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.srt.bam ; 
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar AddOrReplaceReadGroups I=/tmp//SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.srt.bam O=/tmp//SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.RG.bam RGID=RG_311215_99_ssDNA_type2 RGSM=demo RGPU=na RGLB=demo RGPL=illumina RGCN=NIDDK_Genomics_Core  TMP_DIR=/tmp//SSDSpl_tmp_86099423941 ;
[Thu Jun 01 18:28:41 EDT 2017] picard.sam.AddOrReplaceReadGroups INPUT=/tmp//SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.srt.bam OUTPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.RG.bam RGID=RG_311215_99_ssDNA_type2 RGLB=demo RGPL=illumina RGPU=na RGSM=demo RGCN=NIDDK_Genomics_Core TMP_DIR=[/tmp/SSDSpl_tmp_86099423941]    VERBOSITY=INFO QUIET=false VALIDATION_STRINGENCY=STRICT COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:41 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:41	AddOrReplaceReadGroups	Created read group ID=RG_311215_99_ssDNA_type2 PL=illumina LB=demo SM=demo

[Thu Jun 01 18:28:41 EDT 2017] picard.sam.AddOrReplaceReadGroups done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder /tmp//SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.RG.bam ;
mkdir /tmp//SSDSpl_tmp_86089257810
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_86089257810 I=/tmp//SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.RG.bam O=/tmp//SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.RG.SSbam SO=coordinate
[Thu Jun 01 18:28:41 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.RG.bam OUTPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.RG.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_86089257810] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:41 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:41	SortSam	Finished reading inputs, merging and writing to output now.
[Thu Jun 01 18:28:41 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_86089257810 I= /tmp//SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.RG.SSbam O= /tmp//SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.RG.sorted.bam R= /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Thu Jun 01 18:28:42 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.RG.SSbam OUTPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.RG.sorted.bam REFERENCE=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_86089257810] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:42 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:42	ReorderSam	SAM/BAM file
INFO	2017-06-01 18:28:42	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:28:42	ReorderSam	Reference
INFO	2017-06-01 18:28:42	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:28:42	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-01 18:28:42	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-01 18:28:42	ReorderSam	Writing reads...
INFO	2017-06-01 18:28:42	ReorderSam	  Processing All reads
INFO	2017-06-01 18:28:42	ReorderSam	Wrote 300 reads
[Thu Jun 01 18:28:42 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.RG.SSbam 
java -Xmx4g -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar MarkDuplicates I=/tmp//SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.RG.sorted.bam O=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type2.final.bam M=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type2.MDmetrics.tab VALIDATION_STRINGENCY=LENIENT AS=true TMP_DIR=/tmp//SSDSpl_tmp_86099423941 ;
[Thu Jun 01 18:28:42 EDT 2017] picard.sam.markduplicates.MarkDuplicates INPUT=[/tmp//SSDSpl_tmp_86099423941/KB_addRG_6508471378/SSDSdemo.testgenome.ssDNA_type2.RG.sorted.bam] OUTPUT=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type2.final.bam METRICS_FILE=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type2.MDmetrics.tab ASSUME_SORTED=true TMP_DIR=[/tmp/SSDSpl_tmp_86099423941] VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag REMOVE_DUPLICATES=false DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:42 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:42	MarkDuplicates	Start of doWork freeMemory: 376497872; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-01 18:28:42	MarkDuplicates	Reading input file and constructing read end information.
INFO	2017-06-01 18:28:42	MarkDuplicates	Will retain up to 14684096 data points before spilling to disk.
INFO	2017-06-01 18:28:43	MarkDuplicates	Read 300 records. 0 pairs never matched.
INFO	2017-06-01 18:28:44	MarkDuplicates	After buildSortedReadEndLists freeMemory: 258579368; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-01 18:28:44	MarkDuplicates	Will retain up to 119308288 duplicate indices before spilling to disk.
INFO	2017-06-01 18:28:46	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2017-06-01 18:28:46	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2017-06-01 18:28:46	MarkDuplicates	Sorting list of duplicate records.
INFO	2017-06-01 18:28:46	MarkDuplicates	After generateDuplicateIndexes freeMemory: 376484688; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-01 18:28:46	MarkDuplicates	Marking 112 records as duplicates.
INFO	2017-06-01 18:28:46	MarkDuplicates	Found 0 optical duplicate clusters.
INFO	2017-06-01 18:28:46	MarkDuplicates	Reads are assumed to be ordered by: coordinate
INFO	2017-06-01 18:28:46	MarkDuplicates	Before output close freeMemory: 1330339984; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-01 18:28:47	MarkDuplicates	After output close freeMemory: 1330404992; totalMemory: 1334837248; maxMemory: 3817865216
[Thu Jun 01 18:28:47 EDT 2017] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 0.07 minutes.
Runtime.totalMemory()=1334837248
mv /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type2.final.bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type2.bam ;
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type2.bam ;
rm -rf /tmp//SSDSpl_tmp_86099423941/KB_addRG_6508471378/ ;

mkdir /tmp//SSDSpl_tmp_86099423941/KB_addRG_48671311009/ ;
cp /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA.bam /tmp//SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.bam ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder  /tmp//SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.bam ;
mkdir /tmp//SSDSpl_tmp_13298286458
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_13298286458 I=/tmp//SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.bam O=/tmp//SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.SSbam SO=coordinate
[Thu Jun 01 18:28:47 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.bam OUTPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_13298286458] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:47 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:47	SortSam	Finished reading inputs, merging and writing to output now.
[Thu Jun 01 18:28:47 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_13298286458 I= /tmp//SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.SSbam O= /tmp//SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.sorted.bam R= /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Thu Jun 01 18:28:48 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.SSbam OUTPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.sorted.bam REFERENCE=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_13298286458] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:48 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:48	ReorderSam	SAM/BAM file
INFO	2017-06-01 18:28:48	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:28:48	ReorderSam	Reference
INFO	2017-06-01 18:28:48	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:28:48	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-01 18:28:48	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-01 18:28:48	ReorderSam	Writing reads...
INFO	2017-06-01 18:28:48	ReorderSam	  Processing All reads
INFO	2017-06-01 18:28:48	ReorderSam	Wrote 12 reads
[Thu Jun 01 18:28:48 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.SSbam 
mv /tmp//SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.sorted.bam /tmp//SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.srt.bam ; 
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar AddOrReplaceReadGroups I=/tmp//SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.srt.bam O=/tmp//SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.RG.bam RGID=RG_311215_99_dsDNA RGSM=demo RGPU=na RGLB=demo RGPL=illumina RGCN=NIDDK_Genomics_Core  TMP_DIR=/tmp//SSDSpl_tmp_86099423941 ;
[Thu Jun 01 18:28:48 EDT 2017] picard.sam.AddOrReplaceReadGroups INPUT=/tmp//SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.srt.bam OUTPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.RG.bam RGID=RG_311215_99_dsDNA RGLB=demo RGPL=illumina RGPU=na RGSM=demo RGCN=NIDDK_Genomics_Core TMP_DIR=[/tmp/SSDSpl_tmp_86099423941]    VERBOSITY=INFO QUIET=false VALIDATION_STRINGENCY=STRICT COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:48 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:48	AddOrReplaceReadGroups	Created read group ID=RG_311215_99_dsDNA PL=illumina LB=demo SM=demo

[Thu Jun 01 18:28:48 EDT 2017] picard.sam.AddOrReplaceReadGroups done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder /tmp//SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.RG.bam ;
mkdir /tmp//SSDSpl_tmp_96221279546
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_96221279546 I=/tmp//SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.RG.bam O=/tmp//SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.RG.SSbam SO=coordinate
[Thu Jun 01 18:28:49 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.RG.bam OUTPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.RG.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_96221279546] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:49 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:49	SortSam	Finished reading inputs, merging and writing to output now.
[Thu Jun 01 18:28:49 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_96221279546 I= /tmp//SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.RG.SSbam O= /tmp//SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.RG.sorted.bam R= /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Thu Jun 01 18:28:49 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.RG.SSbam OUTPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.RG.sorted.bam REFERENCE=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_96221279546] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:49 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:49	ReorderSam	SAM/BAM file
INFO	2017-06-01 18:28:49	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:28:49	ReorderSam	Reference
INFO	2017-06-01 18:28:49	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:28:49	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-01 18:28:49	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-01 18:28:49	ReorderSam	Writing reads...
INFO	2017-06-01 18:28:49	ReorderSam	  Processing All reads
INFO	2017-06-01 18:28:49	ReorderSam	Wrote 12 reads
[Thu Jun 01 18:28:49 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.RG.SSbam 
java -Xmx4g -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar MarkDuplicates I=/tmp//SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.RG.sorted.bam O=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA.final.bam M=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA.MDmetrics.tab VALIDATION_STRINGENCY=LENIENT AS=true TMP_DIR=/tmp//SSDSpl_tmp_86099423941 ;
[Thu Jun 01 18:28:50 EDT 2017] picard.sam.markduplicates.MarkDuplicates INPUT=[/tmp//SSDSpl_tmp_86099423941/KB_addRG_48671311009/SSDSdemo.testgenome.dsDNA.RG.sorted.bam] OUTPUT=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA.final.bam METRICS_FILE=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA.MDmetrics.tab ASSUME_SORTED=true TMP_DIR=[/tmp/SSDSpl_tmp_86099423941] VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag REMOVE_DUPLICATES=false DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:50 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:50	MarkDuplicates	Start of doWork freeMemory: 376498240; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-01 18:28:50	MarkDuplicates	Reading input file and constructing read end information.
INFO	2017-06-01 18:28:50	MarkDuplicates	Will retain up to 14684096 data points before spilling to disk.
INFO	2017-06-01 18:28:50	MarkDuplicates	Read 12 records. 0 pairs never matched.
INFO	2017-06-01 18:28:51	MarkDuplicates	After buildSortedReadEndLists freeMemory: 258615144; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-01 18:28:51	MarkDuplicates	Will retain up to 119308288 duplicate indices before spilling to disk.
INFO	2017-06-01 18:28:53	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2017-06-01 18:28:53	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2017-06-01 18:28:53	MarkDuplicates	Sorting list of duplicate records.
INFO	2017-06-01 18:28:53	MarkDuplicates	After generateDuplicateIndexes freeMemory: 376489360; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-01 18:28:53	MarkDuplicates	Marking 0 records as duplicates.
INFO	2017-06-01 18:28:53	MarkDuplicates	Found 0 optical duplicate clusters.
INFO	2017-06-01 18:28:53	MarkDuplicates	Reads are assumed to be ordered by: coordinate
INFO	2017-06-01 18:28:53	MarkDuplicates	Before output close freeMemory: 1330350208; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-01 18:28:53	MarkDuplicates	After output close freeMemory: 1330415024; totalMemory: 1334837248; maxMemory: 3817865216
[Thu Jun 01 18:28:53 EDT 2017] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 0.06 minutes.
Runtime.totalMemory()=1334837248
mv /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA.final.bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA.bam ;
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA.bam ;
rm -rf /tmp//SSDSpl_tmp_86099423941/KB_addRG_48671311009/ ;

mkdir /tmp//SSDSpl_tmp_86099423941/KB_addRG_15463474987/ ;
cp /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA_strict.bam /tmp//SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.bam ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder  /tmp//SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.bam ;
mkdir /tmp//SSDSpl_tmp_5735725171
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_5735725171 I=/tmp//SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.bam O=/tmp//SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.SSbam SO=coordinate
[Thu Jun 01 18:28:54 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.bam OUTPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_5735725171] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:54 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:54	SortSam	Finished reading inputs, merging and writing to output now.
[Thu Jun 01 18:28:54 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_5735725171 I= /tmp//SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.SSbam O= /tmp//SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.sorted.bam R= /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Thu Jun 01 18:28:54 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.SSbam OUTPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.sorted.bam REFERENCE=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_5735725171] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:54 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:55	ReorderSam	SAM/BAM file
INFO	2017-06-01 18:28:55	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:28:55	ReorderSam	Reference
INFO	2017-06-01 18:28:55	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:28:55	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-01 18:28:55	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-01 18:28:55	ReorderSam	Writing reads...
INFO	2017-06-01 18:28:55	ReorderSam	  Processing All reads
INFO	2017-06-01 18:28:55	ReorderSam	Wrote 8 reads
[Thu Jun 01 18:28:55 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.SSbam 
mv /tmp//SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.sorted.bam /tmp//SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.srt.bam ; 
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar AddOrReplaceReadGroups I=/tmp//SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.srt.bam O=/tmp//SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.RG.bam RGID=RG_311215_99_dsDNA_strict RGSM=demo RGPU=na RGLB=demo RGPL=illumina RGCN=NIDDK_Genomics_Core  TMP_DIR=/tmp//SSDSpl_tmp_86099423941 ;
[Thu Jun 01 18:28:55 EDT 2017] picard.sam.AddOrReplaceReadGroups INPUT=/tmp//SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.srt.bam OUTPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.RG.bam RGID=RG_311215_99_dsDNA_strict RGLB=demo RGPL=illumina RGPU=na RGSM=demo RGCN=NIDDK_Genomics_Core TMP_DIR=[/tmp/SSDSpl_tmp_86099423941]    VERBOSITY=INFO QUIET=false VALIDATION_STRINGENCY=STRICT COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:55 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:55	AddOrReplaceReadGroups	Created read group ID=RG_311215_99_dsDNA_strict PL=illumina LB=demo SM=demo

[Thu Jun 01 18:28:55 EDT 2017] picard.sam.AddOrReplaceReadGroups done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder /tmp//SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.RG.bam ;
mkdir /tmp//SSDSpl_tmp_69888500736
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_69888500736 I=/tmp//SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.RG.bam O=/tmp//SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.RG.SSbam SO=coordinate
[Thu Jun 01 18:28:56 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.RG.bam OUTPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.RG.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_69888500736] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:56 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:56	SortSam	Finished reading inputs, merging and writing to output now.
[Thu Jun 01 18:28:56 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_69888500736 I= /tmp//SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.RG.SSbam O= /tmp//SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.RG.sorted.bam R= /home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Thu Jun 01 18:28:56 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.RG.SSbam OUTPUT=/tmp/SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.RG.sorted.bam REFERENCE=/home/kevbrick/data/SSDS_Pipeline/git/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_69888500736] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:56 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:56	ReorderSam	SAM/BAM file
INFO	2017-06-01 18:28:56	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:28:56	ReorderSam	Reference
INFO	2017-06-01 18:28:56	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-01 18:28:56	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-01 18:28:56	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-01 18:28:56	ReorderSam	Writing reads...
INFO	2017-06-01 18:28:56	ReorderSam	  Processing All reads
INFO	2017-06-01 18:28:56	ReorderSam	Wrote 8 reads
[Thu Jun 01 18:28:56 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.RG.SSbam 
java -Xmx4g -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar MarkDuplicates I=/tmp//SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.RG.sorted.bam O=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA_strict.final.bam M=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA_strict.MDmetrics.tab VALIDATION_STRINGENCY=LENIENT AS=true TMP_DIR=/tmp//SSDSpl_tmp_86099423941 ;
[Thu Jun 01 18:28:56 EDT 2017] picard.sam.markduplicates.MarkDuplicates INPUT=[/tmp//SSDSpl_tmp_86099423941/KB_addRG_15463474987/SSDSdemo.testgenome.dsDNA_strict.RG.sorted.bam] OUTPUT=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA_strict.final.bam METRICS_FILE=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA_strict.MDmetrics.tab ASSUME_SORTED=true TMP_DIR=[/tmp/SSDSpl_tmp_86099423941] VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag REMOVE_DUPLICATES=false DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Thu Jun 01 18:28:56 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-01 18:28:57	MarkDuplicates	Start of doWork freeMemory: 376497440; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-01 18:28:57	MarkDuplicates	Reading input file and constructing read end information.
INFO	2017-06-01 18:28:57	MarkDuplicates	Will retain up to 14684096 data points before spilling to disk.
INFO	2017-06-01 18:28:57	MarkDuplicates	Read 8 records. 0 pairs never matched.
INFO	2017-06-01 18:28:57	MarkDuplicates	After buildSortedReadEndLists freeMemory: 258615016; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-01 18:28:57	MarkDuplicates	Will retain up to 119308288 duplicate indices before spilling to disk.
mv /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA_strict.final.bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA_strict.bam ;
mv: cannot stat '/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA_strict.final.bam': No such file or directory
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA_strict.bam ;
rm -rf /tmp//SSDSpl_tmp_86099423941/KB_addRG_15463474987/ ;

mkdir /tmp//SSDSpl_tmp_86099423941/KB_addRG_40281388115/ ;
cp /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.unclassified.bam /tmp//SSDSpl_tmp_86099423941/KB_addRG_40281388115/SSDSdemo.testgenome.unclassified.bam ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder  /tmp//SSDSpl_tmp_86099423941/KB_addRG_40281388115/SSDSdemo.testgenome.unclassified.bam ;
mv /tmp//SSDSpl_tmp_86099423941/KB_addRG_40281388115/SSDSdemo.testgenome.unclassified.sorted.bam /tmp//SSDSpl_tmp_86099423941/KB_addRG_40281388115/SSDSdemo.testgenome.unclassified.srt.bam ; 
mv: cannot stat '/tmp//SSDSpl_tmp_86099423941/KB_addRG_40281388115/SSDSdemo.testgenome.unclassified.sorted.bam': No such file or directory
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar AddOrReplaceReadGroups I=/tmp//SSDSpl_tmp_86099423941/KB_addRG_40281388115/SSDSdemo.testgenome.unclassified.srt.bam O=/tmp//SSDSpl_tmp_86099423941/KB_addRG_40281388115/SSDSdemo.testgenome.unclassified.RG.bam RGID=RG_311215_99_unclassified RGSM=demo RGPU=na RGLB=demo RGPL=illumina RGCN=NIDDK_Genomics_Core  TMP_DIR=/tmp//SSDSpl_tmp_86099423941 ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder /tmp//SSDSpl_tmp_86099423941/KB_addRG_40281388115/SSDSdemo.testgenome.unclassified.RG.bam ;
java -Xmx4g -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar MarkDuplicates I=/tmp//SSDSpl_tmp_86099423941/KB_addRG_40281388115/SSDSdemo.testgenome.unclassified.RG.sorted.bam O=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.unclassified.final.bam M=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.unclassified.MDmetrics.tab VALIDATION_STRINGENCY=LENIENT AS=true TMP_DIR=/tmp//SSDSpl_tmp_86099423941 ;
mv /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.unclassified.final.bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.unclassified.bam ;
mv: cannot stat '/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.unclassified.final.bam': No such file or directory
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.unclassified.bam ;
rm -rf /tmp//SSDSpl_tmp_86099423941/KB_addRG_40281388115/ ;

rm -rf /tmp//SSDSpl_tmp_86099423941
