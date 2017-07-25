mkdir /tmp//SSDSpl_tmp_41304843670
mkdir /share/genomes/testGenome
mkdir /share/genomes/testGenome/BWAIndex
mkdir /share/genomes/testGenome/BWAIndex/version0.5.x
mkdir /share/genomes/testGenome/BWAIndex/version0.7.10
cp SSDSdemoRegion.fasta /share/genomes/testGenome/genome.fa
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools faidx /share/genomes/testGenome/genome.fa
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar CreateSequenceDictionary R=/share/genomes/testGenome/genome.fa O=/share/genomes/testGenome/genome.dict GENOME_ASSEMBLY=tg1 SPECIES=MusMusculusChr10_92581444_92756444 VALIDATION_STRINGENCY=LENIENT
[Fri Jun 02 18:14:04 EDT 2017] picard.sam.CreateSequenceDictionary REFERENCE=/share/genomes/testGenome/genome.fa OUTPUT=/share/genomes/testGenome/genome.dict GENOME_ASSEMBLY=tg1 SPECIES=MusMusculusChr10_92581444_92756444 VALIDATION_STRINGENCY=LENIENT    TRUNCATE_NAMES_AT_WHITESPACE=true NUM_SEQUENCES=2147483647 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:14:04 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
[Fri Jun 02 18:14:04 EDT 2017] picard.sam.CreateSequenceDictionary done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
ln -s /share/genomes/testGenome/genome.fa /share/genomes/testGenome/BWAIndex/version0.5.x
ln -s /share/genomes/testGenome/genome.fa /share/genomes/testGenome/BWAIndex/version0.7.10
ln -s /share/genomes/testGenome/genome.fa.fai /share/genomes/testGenome/BWAIndex/version0.5.x
ln -s /share/genomes/testGenome/genome.fa.fai /share/genomes/testGenome/BWAIndex/version0.7.10
ln -s /share/genomes/testGenome/genome.dict /share/genomes/testGenome/BWAIndex/version0.5.x
ln -s /share/genomes/testGenome/genome.dict /share/genomes/testGenome/BWAIndex/version0.7.10
sh /home/kevbrick/data/SSDS_Pipeline/git/unitTest/.swKB_61017008879886/script_swKB_61017008879886.sh
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
[main] CMD: /home/kevbrick/data/SSDS_Pipeline/git//bwa_0.7.12 index -a is /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[main] Real time: 0.216 sec; CPU: 0.076 sec
mkdir /tmp//SSDSpl_tmp_33571032116
mkdir /tmp//SSDSpl_tmp_72794803402
rm /tmp//SSDSpl_tmp_72794803402/*
rm: cannot remove '/tmp//SSDSpl_tmp_72794803402/*': No such file or directory
/home/kevbrick/data/SSDS_Pipeline/git/fastx_trimmer -f 1 -l 36 -i /home/kevbrick/data/SSDS_Pipeline/git/unitTest/SSDSdemo.R1.fastq >/tmp//SSDSpl_tmp_72794803402/SSDSdemo.trim.R1.fq
/home/kevbrick/data/SSDS_Pipeline/git/fastx_trimmer -f 1 -l 40 -i /home/kevbrick/data/SSDS_Pipeline/git/unitTest/SSDSdemo.R2.fastq >/tmp//SSDSpl_tmp_72794803402/SSDSdemo.trim.R2.fq
/home/kevbrick/data/SSDS_Pipeline/git//bwa_0.7.12 aln -t 1 /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_72794803402/SSDSdemo.trim.R1.fq >/tmp//SSDSpl_tmp_72794803402/SSDSdemo.R1.sai
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
[main] CMD: /home/kevbrick/data/SSDS_Pipeline/git//bwa_0.7.12 aln -t 1 /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_72794803402/SSDSdemo.trim.R1.fq
[main] Real time: 0.141 sec; CPU: 0.092 sec
/home/kevbrick/data/SSDS_Pipeline/git//bwa_ra_0.7.12 aln -t 1 /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_72794803402/SSDSdemo.trim.R2.fq >/tmp//SSDSpl_tmp_72794803402/SSDSdemo.R2.sai
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
[main] CMD: /home/kevbrick/data/SSDS_Pipeline/git//bwa_ra_0.7.12 aln -t 1 /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_72794803402/SSDSdemo.trim.R2.fq
[main] Real time: 2.063 sec; CPU: 2.008 sec
/home/kevbrick/data/SSDS_Pipeline/git//bwa_0.7.12 sampe  /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_72794803402/SSDSdemo.R1.sai /tmp//SSDSpl_tmp_72794803402/SSDSdemo.R2.sai /tmp//SSDSpl_tmp_72794803402/SSDSdemo.trim.R1.fq /tmp//SSDSpl_tmp_72794803402/SSDSdemo.trim.R2.fq | java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar SamFormatConverter VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_72794803402 I=/dev/stdin O=/tmp//SSDSpl_tmp_72794803402/SSDSdemo.bwa_testgenome.bam
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
[bwa_sai2sam_pe_core] print alignments... [Fri Jun 02 18:14:08 EDT 2017] picard.sam.SamFormatConverter INPUT=/dev/stdin OUTPUT=/tmp/SSDSpl_tmp_72794803402/SSDSdemo.bwa_testgenome.bam TMP_DIR=[/tmp/SSDSpl_tmp_72794803402] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:14:08 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
0.03 sec
[bwa_sai2sam_pe_core] 3673 sequences have been processed.
[main] Version: 0.7.12-r1039
[main] CMD: /home/kevbrick/data/SSDS_Pipeline/git//bwa_0.7.12 sampe /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_72794803402/SSDSdemo.R1.sai /tmp//SSDSpl_tmp_72794803402/SSDSdemo.R2.sai /tmp//SSDSpl_tmp_72794803402/SSDSdemo.trim.R1.fq /tmp//SSDSpl_tmp_72794803402/SSDSdemo.trim.R2.fq
[main] Real time: 2.063 sec; CPU: 0.100 sec
[Fri Jun 02 18:14:09 EDT 2017] picard.sam.SamFormatConverter done. Elapsed time: 0.02 minutes.
Runtime.totalMemory()=380108800
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --v --g  testgenome /tmp//SSDSpl_tmp_72794803402/SSDSdemo.bwa_testgenome.bam
mkdir /tmp//SSDSpl_tmp_2658042691
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_2658042691 I=/tmp//SSDSpl_tmp_72794803402/SSDSdemo.bwa_testgenome.bam O=/tmp//SSDSpl_tmp_72794803402/SSDSdemo.bwa_testgenome.SSbam SO=coordinate
[Fri Jun 02 18:14:10 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_72794803402/SSDSdemo.bwa_testgenome.bam OUTPUT=/tmp/SSDSpl_tmp_72794803402/SSDSdemo.bwa_testgenome.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_2658042691] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:14:10 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:14:10	SortSam	Finished reading inputs, merging and writing to output now.
[Fri Jun 02 18:14:10 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_2658042691 I= /tmp//SSDSpl_tmp_72794803402/SSDSdemo.bwa_testgenome.SSbam O= /tmp//SSDSpl_tmp_72794803402/SSDSdemo.bwa_testgenome.sorted.bam R= /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Fri Jun 02 18:14:10 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_72794803402/SSDSdemo.bwa_testgenome.SSbam OUTPUT=/tmp/SSDSpl_tmp_72794803402/SSDSdemo.bwa_testgenome.sorted.bam REFERENCE=/share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_2658042691] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:14:10 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:14:10	ReorderSam	SAM/BAM file
INFO	2017-06-02 18:14:10	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:14:10	ReorderSam	Reference
INFO	2017-06-02 18:14:10	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:14:10	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-02 18:14:10	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-02 18:14:10	ReorderSam	Writing reads...
INFO	2017-06-02 18:14:10	ReorderSam	  Processing All reads
INFO	2017-06-02 18:14:11	ReorderSam	Wrote 7346 reads
[Fri Jun 02 18:14:11 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_72794803402/SSDSdemo.bwa_testgenome.SSbam 
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools view -f 2 -bh  /tmp//SSDSpl_tmp_72794803402/SSDSdemo.bwa_testgenome.sorted.bam >/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ//SSDSdemo.sortedAln.testgenome.bam
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ//SSDSdemo.sortedAln.testgenome.bam
perl /home/kevbrick/data/SSDS_Pipeline/git//parseITRs.pl --temp /tmp//SSDSpl_tmp_72794803402 --bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ//SSDSdemo.sortedAln.testgenome.bam --output bedbam --outdir /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/ --splitSz 1000 --g testgenome --gOK >/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ//SSDSdemo.ITRId.OUT 2>/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ//SSDSdemo.ITRId.ERR
open: No such file or directory
[main_samview] fail to open "SSDSdemo.sortedAln.testgenome.bam" for reading.
mkdir /tmp//SSDSpl_tmp_72794803402/KB_addRG_45982090765/ ;
cp /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type1.bam /tmp//SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.bam ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder  /tmp//SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.bam ;
mkdir /tmp//SSDSpl_tmp_96743933188
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_96743933188 I=/tmp//SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.bam O=/tmp//SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.SSbam SO=coordinate
[Fri Jun 02 18:14:56 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.bam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_96743933188] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:14:56 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:14:57	SortSam	Finished reading inputs, merging and writing to output now.
[Fri Jun 02 18:14:57 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_96743933188 I= /tmp//SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.SSbam O= /tmp//SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.sorted.bam R= /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Fri Jun 02 18:14:58 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.SSbam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.sorted.bam REFERENCE=/share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_96743933188] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:14:58 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:14:58	ReorderSam	SAM/BAM file
INFO	2017-06-02 18:14:58	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:14:58	ReorderSam	Reference
INFO	2017-06-02 18:14:58	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:14:58	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-02 18:14:58	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-02 18:14:58	ReorderSam	Writing reads...
INFO	2017-06-02 18:14:58	ReorderSam	  Processing All reads
INFO	2017-06-02 18:14:58	ReorderSam	Wrote 6338 reads
[Fri Jun 02 18:14:58 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.SSbam 
mv /tmp//SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.sorted.bam /tmp//SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.srt.bam ; 
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar AddOrReplaceReadGroups I=/tmp//SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.srt.bam O=/tmp//SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.RG.bam RGID=RG_311215_99_ssDNA_type1 RGSM=demo RGPU=na RGLB=demo RGPL=illumina RGCN=NIDDK_Genomics_Core  TMP_DIR=/tmp//SSDSpl_tmp_72794803402 ;
[Fri Jun 02 18:14:59 EDT 2017] picard.sam.AddOrReplaceReadGroups INPUT=/tmp//SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.srt.bam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.RG.bam RGID=RG_311215_99_ssDNA_type1 RGLB=demo RGPL=illumina RGPU=na RGSM=demo RGCN=NIDDK_Genomics_Core TMP_DIR=[/tmp/SSDSpl_tmp_72794803402]    VERBOSITY=INFO QUIET=false VALIDATION_STRINGENCY=STRICT COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:14:59 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:14:59	AddOrReplaceReadGroups	Created read group ID=RG_311215_99_ssDNA_type1 PL=illumina LB=demo SM=demo

[Fri Jun 02 18:15:00 EDT 2017] picard.sam.AddOrReplaceReadGroups done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder /tmp//SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.RG.bam ;
mkdir /tmp//SSDSpl_tmp_92166684761
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_92166684761 I=/tmp//SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.RG.bam O=/tmp//SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.RG.SSbam SO=coordinate
[Fri Jun 02 18:15:01 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.RG.bam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.RG.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_92166684761] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:15:01 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:15:02	SortSam	Finished reading inputs, merging and writing to output now.
[Fri Jun 02 18:15:02 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_92166684761 I= /tmp//SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.RG.SSbam O= /tmp//SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.RG.sorted.bam R= /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Fri Jun 02 18:15:03 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.RG.SSbam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.RG.sorted.bam REFERENCE=/share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_92166684761] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:15:03 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:15:03	ReorderSam	SAM/BAM file
INFO	2017-06-02 18:15:03	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:15:03	ReorderSam	Reference
INFO	2017-06-02 18:15:03	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:15:03	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-02 18:15:03	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-02 18:15:03	ReorderSam	Writing reads...
INFO	2017-06-02 18:15:03	ReorderSam	  Processing All reads
INFO	2017-06-02 18:15:03	ReorderSam	Wrote 6338 reads
[Fri Jun 02 18:15:03 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.RG.SSbam 
java -Xmx4g -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar MarkDuplicates I=/tmp//SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.RG.sorted.bam O=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type1.final.bam M=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type1.MDmetrics.tab VALIDATION_STRINGENCY=LENIENT AS=true TMP_DIR=/tmp//SSDSpl_tmp_72794803402 ;
[Fri Jun 02 18:15:04 EDT 2017] picard.sam.markduplicates.MarkDuplicates INPUT=[/tmp//SSDSpl_tmp_72794803402/KB_addRG_45982090765/SSDSdemo.testgenome.ssDNA_type1.RG.sorted.bam] OUTPUT=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type1.final.bam METRICS_FILE=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type1.MDmetrics.tab ASSUME_SORTED=true TMP_DIR=[/tmp/SSDSpl_tmp_72794803402] VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag REMOVE_DUPLICATES=false DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:15:04 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:15:05	MarkDuplicates	Start of doWork freeMemory: 376497944; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-02 18:15:05	MarkDuplicates	Reading input file and constructing read end information.
INFO	2017-06-02 18:15:05	MarkDuplicates	Will retain up to 14684096 data points before spilling to disk.
INFO	2017-06-02 18:15:08	MarkDuplicates	Read 6338 records. 0 pairs never matched.
INFO	2017-06-02 18:15:09	MarkDuplicates	After buildSortedReadEndLists freeMemory: 257906936; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-02 18:15:09	MarkDuplicates	Will retain up to 119308288 duplicate indices before spilling to disk.
INFO	2017-06-02 18:15:26	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2017-06-02 18:15:26	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2017-06-02 18:15:26	MarkDuplicates	Sorting list of duplicate records.
INFO	2017-06-02 18:15:28	MarkDuplicates	After generateDuplicateIndexes freeMemory: 376463552; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-02 18:15:28	MarkDuplicates	Marking 2180 records as duplicates.
INFO	2017-06-02 18:15:28	MarkDuplicates	Found 2 optical duplicate clusters.
INFO	2017-06-02 18:15:28	MarkDuplicates	Reads are assumed to be ordered by: coordinate
INFO	2017-06-02 18:15:28	MarkDuplicates	Before output close freeMemory: 1330324112; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-02 18:15:28	MarkDuplicates	After output close freeMemory: 1330389200; totalMemory: 1334837248; maxMemory: 3817865216
[Fri Jun 02 18:15:28 EDT 2017] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 0.40 minutes.
Runtime.totalMemory()=1334837248
mv /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type1.final.bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type1.bam ;
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type1.bam ;
rm -rf /tmp//SSDSpl_tmp_72794803402/KB_addRG_45982090765/ ;

mkdir /tmp//SSDSpl_tmp_72794803402/KB_addRG_50915438499/ ;
cp /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type2.bam /tmp//SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.bam ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder  /tmp//SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.bam ;
mkdir /tmp//SSDSpl_tmp_91870295752
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_91870295752 I=/tmp//SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.bam O=/tmp//SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.SSbam SO=coordinate
[Fri Jun 02 18:15:30 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.bam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_91870295752] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:15:30 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:15:30	SortSam	Finished reading inputs, merging and writing to output now.
[Fri Jun 02 18:15:30 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_91870295752 I= /tmp//SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.SSbam O= /tmp//SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.sorted.bam R= /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Fri Jun 02 18:15:31 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.SSbam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.sorted.bam REFERENCE=/share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_91870295752] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:15:31 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:15:31	ReorderSam	SAM/BAM file
INFO	2017-06-02 18:15:31	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:15:31	ReorderSam	Reference
INFO	2017-06-02 18:15:31	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:15:31	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-02 18:15:31	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-02 18:15:31	ReorderSam	Writing reads...
INFO	2017-06-02 18:15:31	ReorderSam	  Processing All reads
INFO	2017-06-02 18:15:31	ReorderSam	Wrote 300 reads
[Fri Jun 02 18:15:31 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.SSbam 
mv /tmp//SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.sorted.bam /tmp//SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.srt.bam ; 
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar AddOrReplaceReadGroups I=/tmp//SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.srt.bam O=/tmp//SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.RG.bam RGID=RG_311215_99_ssDNA_type2 RGSM=demo RGPU=na RGLB=demo RGPL=illumina RGCN=NIDDK_Genomics_Core  TMP_DIR=/tmp//SSDSpl_tmp_72794803402 ;
[Fri Jun 02 18:15:31 EDT 2017] picard.sam.AddOrReplaceReadGroups INPUT=/tmp//SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.srt.bam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.RG.bam RGID=RG_311215_99_ssDNA_type2 RGLB=demo RGPL=illumina RGPU=na RGSM=demo RGCN=NIDDK_Genomics_Core TMP_DIR=[/tmp/SSDSpl_tmp_72794803402]    VERBOSITY=INFO QUIET=false VALIDATION_STRINGENCY=STRICT COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:15:31 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:15:31	AddOrReplaceReadGroups	Created read group ID=RG_311215_99_ssDNA_type2 PL=illumina LB=demo SM=demo

[Fri Jun 02 18:15:32 EDT 2017] picard.sam.AddOrReplaceReadGroups done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder /tmp//SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.RG.bam ;
mkdir /tmp//SSDSpl_tmp_81320191508
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_81320191508 I=/tmp//SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.RG.bam O=/tmp//SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.RG.SSbam SO=coordinate
[Fri Jun 02 18:15:32 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.RG.bam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.RG.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_81320191508] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:15:32 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:15:32	SortSam	Finished reading inputs, merging and writing to output now.
[Fri Jun 02 18:15:32 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_81320191508 I= /tmp//SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.RG.SSbam O= /tmp//SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.RG.sorted.bam R= /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Fri Jun 02 18:15:32 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.RG.SSbam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.RG.sorted.bam REFERENCE=/share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_81320191508] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:15:32 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:15:33	ReorderSam	SAM/BAM file
INFO	2017-06-02 18:15:33	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:15:33	ReorderSam	Reference
INFO	2017-06-02 18:15:33	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:15:33	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-02 18:15:33	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-02 18:15:33	ReorderSam	Writing reads...
INFO	2017-06-02 18:15:33	ReorderSam	  Processing All reads
INFO	2017-06-02 18:15:33	ReorderSam	Wrote 300 reads
[Fri Jun 02 18:15:33 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.RG.SSbam 
java -Xmx4g -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar MarkDuplicates I=/tmp//SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.RG.sorted.bam O=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type2.final.bam M=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type2.MDmetrics.tab VALIDATION_STRINGENCY=LENIENT AS=true TMP_DIR=/tmp//SSDSpl_tmp_72794803402 ;
[Fri Jun 02 18:15:33 EDT 2017] picard.sam.markduplicates.MarkDuplicates INPUT=[/tmp//SSDSpl_tmp_72794803402/KB_addRG_50915438499/SSDSdemo.testgenome.ssDNA_type2.RG.sorted.bam] OUTPUT=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type2.final.bam METRICS_FILE=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type2.MDmetrics.tab ASSUME_SORTED=true TMP_DIR=[/tmp/SSDSpl_tmp_72794803402] VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag REMOVE_DUPLICATES=false DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:15:33 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:15:33	MarkDuplicates	Start of doWork freeMemory: 376497512; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-02 18:15:33	MarkDuplicates	Reading input file and constructing read end information.
INFO	2017-06-02 18:15:33	MarkDuplicates	Will retain up to 14684096 data points before spilling to disk.
INFO	2017-06-02 18:15:35	MarkDuplicates	Read 300 records. 0 pairs never matched.
INFO	2017-06-02 18:15:35	MarkDuplicates	After buildSortedReadEndLists freeMemory: 258580600; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-02 18:15:35	MarkDuplicates	Will retain up to 119308288 duplicate indices before spilling to disk.
INFO	2017-06-02 18:15:41	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2017-06-02 18:15:41	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2017-06-02 18:15:41	MarkDuplicates	Sorting list of duplicate records.
INFO	2017-06-02 18:15:42	MarkDuplicates	After generateDuplicateIndexes freeMemory: 376485920; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-02 18:15:42	MarkDuplicates	Marking 112 records as duplicates.
INFO	2017-06-02 18:15:42	MarkDuplicates	Found 0 optical duplicate clusters.
INFO	2017-06-02 18:15:42	MarkDuplicates	Reads are assumed to be ordered by: coordinate
INFO	2017-06-02 18:15:42	MarkDuplicates	Before output close freeMemory: 1330339344; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-02 18:15:42	MarkDuplicates	After output close freeMemory: 1330338112; totalMemory: 1334837248; maxMemory: 3817865216
[Fri Jun 02 18:15:42 EDT 2017] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 0.15 minutes.
Runtime.totalMemory()=1334837248
mv /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type2.final.bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type2.bam ;
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssDNA_type2.bam ;
rm -rf /tmp//SSDSpl_tmp_72794803402/KB_addRG_50915438499/ ;

mkdir /tmp//SSDSpl_tmp_72794803402/KB_addRG_54512878725/ ;
cp /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA.bam /tmp//SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.bam ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder  /tmp//SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.bam ;
mkdir /tmp//SSDSpl_tmp_75218621788
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_75218621788 I=/tmp//SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.bam O=/tmp//SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.SSbam SO=coordinate
[Fri Jun 02 18:15:42 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.bam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_75218621788] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:15:42 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:15:42	SortSam	Finished reading inputs, merging and writing to output now.
[Fri Jun 02 18:15:42 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_75218621788 I= /tmp//SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.SSbam O= /tmp//SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.sorted.bam R= /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Fri Jun 02 18:15:43 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.SSbam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.sorted.bam REFERENCE=/share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_75218621788] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:15:43 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:15:43	ReorderSam	SAM/BAM file
INFO	2017-06-02 18:15:43	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:15:43	ReorderSam	Reference
INFO	2017-06-02 18:15:43	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:15:43	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-02 18:15:43	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-02 18:15:43	ReorderSam	Writing reads...
INFO	2017-06-02 18:15:43	ReorderSam	  Processing All reads
INFO	2017-06-02 18:15:43	ReorderSam	Wrote 12 reads
[Fri Jun 02 18:15:43 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.SSbam 
mv /tmp//SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.sorted.bam /tmp//SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.srt.bam ; 
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar AddOrReplaceReadGroups I=/tmp//SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.srt.bam O=/tmp//SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.RG.bam RGID=RG_311215_99_dsDNA RGSM=demo RGPU=na RGLB=demo RGPL=illumina RGCN=NIDDK_Genomics_Core  TMP_DIR=/tmp//SSDSpl_tmp_72794803402 ;
[Fri Jun 02 18:15:43 EDT 2017] picard.sam.AddOrReplaceReadGroups INPUT=/tmp//SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.srt.bam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.RG.bam RGID=RG_311215_99_dsDNA RGLB=demo RGPL=illumina RGPU=na RGSM=demo RGCN=NIDDK_Genomics_Core TMP_DIR=[/tmp/SSDSpl_tmp_72794803402]    VERBOSITY=INFO QUIET=false VALIDATION_STRINGENCY=STRICT COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:15:43 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:15:43	AddOrReplaceReadGroups	Created read group ID=RG_311215_99_dsDNA PL=illumina LB=demo SM=demo

[Fri Jun 02 18:15:43 EDT 2017] picard.sam.AddOrReplaceReadGroups done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder /tmp//SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.RG.bam ;
mkdir /tmp//SSDSpl_tmp_78935902433
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_78935902433 I=/tmp//SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.RG.bam O=/tmp//SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.RG.SSbam SO=coordinate
[Fri Jun 02 18:15:44 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.RG.bam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.RG.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_78935902433] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:15:44 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:15:44	SortSam	Finished reading inputs, merging and writing to output now.
[Fri Jun 02 18:15:44 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_78935902433 I= /tmp//SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.RG.SSbam O= /tmp//SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.RG.sorted.bam R= /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Fri Jun 02 18:15:44 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.RG.SSbam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.RG.sorted.bam REFERENCE=/share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_78935902433] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:15:44 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:15:44	ReorderSam	SAM/BAM file
INFO	2017-06-02 18:15:44	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:15:44	ReorderSam	Reference
INFO	2017-06-02 18:15:44	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:15:44	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-02 18:15:44	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-02 18:15:44	ReorderSam	Writing reads...
INFO	2017-06-02 18:15:44	ReorderSam	  Processing All reads
INFO	2017-06-02 18:15:44	ReorderSam	Wrote 12 reads
[Fri Jun 02 18:15:44 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.RG.SSbam 
java -Xmx4g -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar MarkDuplicates I=/tmp//SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.RG.sorted.bam O=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA.final.bam M=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA.MDmetrics.tab VALIDATION_STRINGENCY=LENIENT AS=true TMP_DIR=/tmp//SSDSpl_tmp_72794803402 ;
[Fri Jun 02 18:15:45 EDT 2017] picard.sam.markduplicates.MarkDuplicates INPUT=[/tmp//SSDSpl_tmp_72794803402/KB_addRG_54512878725/SSDSdemo.testgenome.dsDNA.RG.sorted.bam] OUTPUT=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA.final.bam METRICS_FILE=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA.MDmetrics.tab ASSUME_SORTED=true TMP_DIR=[/tmp/SSDSpl_tmp_72794803402] VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag REMOVE_DUPLICATES=false DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:15:45 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:15:45	MarkDuplicates	Start of doWork freeMemory: 376496928; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-02 18:15:45	MarkDuplicates	Reading input file and constructing read end information.
INFO	2017-06-02 18:15:45	MarkDuplicates	Will retain up to 14684096 data points before spilling to disk.
INFO	2017-06-02 18:15:46	MarkDuplicates	Read 12 records. 0 pairs never matched.
INFO	2017-06-02 18:15:47	MarkDuplicates	After buildSortedReadEndLists freeMemory: 258615096; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-02 18:15:47	MarkDuplicates	Will retain up to 119308288 duplicate indices before spilling to disk.
INFO	2017-06-02 18:15:54	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2017-06-02 18:15:54	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2017-06-02 18:15:54	MarkDuplicates	Sorting list of duplicate records.
INFO	2017-06-02 18:15:54	MarkDuplicates	After generateDuplicateIndexes freeMemory: 376489312; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-02 18:15:54	MarkDuplicates	Marking 0 records as duplicates.
INFO	2017-06-02 18:15:54	MarkDuplicates	Found 0 optical duplicate clusters.
INFO	2017-06-02 18:15:54	MarkDuplicates	Reads are assumed to be ordered by: coordinate
INFO	2017-06-02 18:15:54	MarkDuplicates	Before output close freeMemory: 1330350200; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-02 18:15:54	MarkDuplicates	After output close freeMemory: 1330415016; totalMemory: 1334837248; maxMemory: 3817865216
[Fri Jun 02 18:15:54 EDT 2017] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 0.16 minutes.
Runtime.totalMemory()=1334837248
mv /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA.final.bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA.bam ;
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA.bam ;
rm -rf /tmp//SSDSpl_tmp_72794803402/KB_addRG_54512878725/ ;

mkdir /tmp//SSDSpl_tmp_72794803402/KB_addRG_13204681047/ ;
cp /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA_strict.bam /tmp//SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.bam ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder  /tmp//SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.bam ;
mkdir /tmp//SSDSpl_tmp_3319183767
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_3319183767 I=/tmp//SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.bam O=/tmp//SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.SSbam SO=coordinate
[Fri Jun 02 18:15:55 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.bam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_3319183767] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:15:55 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:15:55	SortSam	Finished reading inputs, merging and writing to output now.
[Fri Jun 02 18:15:55 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_3319183767 I= /tmp//SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.SSbam O= /tmp//SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.sorted.bam R= /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Fri Jun 02 18:15:55 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.SSbam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.sorted.bam REFERENCE=/share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_3319183767] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:15:55 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:15:55	ReorderSam	SAM/BAM file
INFO	2017-06-02 18:15:55	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:15:55	ReorderSam	Reference
INFO	2017-06-02 18:15:55	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:15:55	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-02 18:15:55	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-02 18:15:55	ReorderSam	Writing reads...
INFO	2017-06-02 18:15:55	ReorderSam	  Processing All reads
INFO	2017-06-02 18:15:55	ReorderSam	Wrote 8 reads
[Fri Jun 02 18:15:55 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.SSbam 
mv /tmp//SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.sorted.bam /tmp//SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.srt.bam ; 
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar AddOrReplaceReadGroups I=/tmp//SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.srt.bam O=/tmp//SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.RG.bam RGID=RG_311215_99_dsDNA_strict RGSM=demo RGPU=na RGLB=demo RGPL=illumina RGCN=NIDDK_Genomics_Core  TMP_DIR=/tmp//SSDSpl_tmp_72794803402 ;
[Fri Jun 02 18:15:56 EDT 2017] picard.sam.AddOrReplaceReadGroups INPUT=/tmp//SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.srt.bam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.RG.bam RGID=RG_311215_99_dsDNA_strict RGLB=demo RGPL=illumina RGPU=na RGSM=demo RGCN=NIDDK_Genomics_Core TMP_DIR=[/tmp/SSDSpl_tmp_72794803402]    VERBOSITY=INFO QUIET=false VALIDATION_STRINGENCY=STRICT COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:15:56 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:15:56	AddOrReplaceReadGroups	Created read group ID=RG_311215_99_dsDNA_strict PL=illumina LB=demo SM=demo

[Fri Jun 02 18:15:56 EDT 2017] picard.sam.AddOrReplaceReadGroups done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder /tmp//SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.RG.bam ;
mkdir /tmp//SSDSpl_tmp_82335456561
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_82335456561 I=/tmp//SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.RG.bam O=/tmp//SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.RG.SSbam SO=coordinate
[Fri Jun 02 18:15:56 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.RG.bam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.RG.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_82335456561] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:15:56 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:15:56	SortSam	Finished reading inputs, merging and writing to output now.
[Fri Jun 02 18:15:56 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_82335456561 I= /tmp//SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.RG.SSbam O= /tmp//SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.RG.sorted.bam R= /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Fri Jun 02 18:15:57 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.RG.SSbam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.RG.sorted.bam REFERENCE=/share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_82335456561] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:15:57 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:15:57	ReorderSam	SAM/BAM file
INFO	2017-06-02 18:15:57	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:15:57	ReorderSam	Reference
INFO	2017-06-02 18:15:57	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:15:57	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-02 18:15:57	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-02 18:15:57	ReorderSam	Writing reads...
INFO	2017-06-02 18:15:57	ReorderSam	  Processing All reads
INFO	2017-06-02 18:15:57	ReorderSam	Wrote 8 reads
[Fri Jun 02 18:15:57 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.RG.SSbam 
java -Xmx4g -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar MarkDuplicates I=/tmp//SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.RG.sorted.bam O=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA_strict.final.bam M=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA_strict.MDmetrics.tab VALIDATION_STRINGENCY=LENIENT AS=true TMP_DIR=/tmp//SSDSpl_tmp_72794803402 ;
[Fri Jun 02 18:15:57 EDT 2017] picard.sam.markduplicates.MarkDuplicates INPUT=[/tmp//SSDSpl_tmp_72794803402/KB_addRG_13204681047/SSDSdemo.testgenome.dsDNA_strict.RG.sorted.bam] OUTPUT=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA_strict.final.bam METRICS_FILE=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA_strict.MDmetrics.tab ASSUME_SORTED=true TMP_DIR=[/tmp/SSDSpl_tmp_72794803402] VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag REMOVE_DUPLICATES=false DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:15:57 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:15:57	MarkDuplicates	Start of doWork freeMemory: 376496624; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-02 18:15:57	MarkDuplicates	Reading input file and constructing read end information.
INFO	2017-06-02 18:15:57	MarkDuplicates	Will retain up to 14684096 data points before spilling to disk.
INFO	2017-06-02 18:15:59	MarkDuplicates	Read 8 records. 0 pairs never matched.
INFO	2017-06-02 18:15:59	MarkDuplicates	After buildSortedReadEndLists freeMemory: 258615304; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-02 18:15:59	MarkDuplicates	Will retain up to 119308288 duplicate indices before spilling to disk.
INFO	2017-06-02 18:16:04	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2017-06-02 18:16:04	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2017-06-02 18:16:04	MarkDuplicates	Sorting list of duplicate records.
INFO	2017-06-02 18:16:05	MarkDuplicates	After generateDuplicateIndexes freeMemory: 376489088; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-02 18:16:05	MarkDuplicates	Marking 0 records as duplicates.
INFO	2017-06-02 18:16:05	MarkDuplicates	Found 0 optical duplicate clusters.
INFO	2017-06-02 18:16:05	MarkDuplicates	Reads are assumed to be ordered by: coordinate
INFO	2017-06-02 18:16:05	MarkDuplicates	Before output close freeMemory: 1330350392; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-02 18:16:05	MarkDuplicates	After output close freeMemory: 1330415416; totalMemory: 1334837248; maxMemory: 3817865216
[Fri Jun 02 18:16:05 EDT 2017] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 0.13 minutes.
Runtime.totalMemory()=1334837248
mv /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA_strict.final.bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA_strict.bam ;
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.dsDNA_strict.bam ;
rm -rf /tmp//SSDSpl_tmp_72794803402/KB_addRG_13204681047/ ;

mkdir /tmp//SSDSpl_tmp_72794803402/KB_addRG_79006618376/ ;
cp /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.unclassified.bam /tmp//SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.bam ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder  /tmp//SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.bam ;
mkdir /tmp//SSDSpl_tmp_25848527702
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_25848527702 I=/tmp//SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.bam O=/tmp//SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.SSbam SO=coordinate
[Fri Jun 02 18:16:06 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.bam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_25848527702] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:16:06 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:16:06	SortSam	Finished reading inputs, merging and writing to output now.
[Fri Jun 02 18:16:06 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_25848527702 I= /tmp//SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.SSbam O= /tmp//SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.sorted.bam R= /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Fri Jun 02 18:16:06 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.SSbam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.sorted.bam REFERENCE=/share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_25848527702] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:16:06 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:16:06	ReorderSam	SAM/BAM file
INFO	2017-06-02 18:16:06	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:16:06	ReorderSam	Reference
INFO	2017-06-02 18:16:06	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:16:06	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-02 18:16:06	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-02 18:16:06	ReorderSam	Writing reads...
INFO	2017-06-02 18:16:06	ReorderSam	  Processing All reads
INFO	2017-06-02 18:16:06	ReorderSam	Wrote 26 reads
[Fri Jun 02 18:16:06 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.SSbam 
mv /tmp//SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.sorted.bam /tmp//SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.srt.bam ; 
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar AddOrReplaceReadGroups I=/tmp//SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.srt.bam O=/tmp//SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.RG.bam RGID=RG_311215_99_unclassified RGSM=demo RGPU=na RGLB=demo RGPL=illumina RGCN=NIDDK_Genomics_Core  TMP_DIR=/tmp//SSDSpl_tmp_72794803402 ;
[Fri Jun 02 18:16:06 EDT 2017] picard.sam.AddOrReplaceReadGroups INPUT=/tmp//SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.srt.bam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.RG.bam RGID=RG_311215_99_unclassified RGLB=demo RGPL=illumina RGPU=na RGSM=demo RGCN=NIDDK_Genomics_Core TMP_DIR=[/tmp/SSDSpl_tmp_72794803402]    VERBOSITY=INFO QUIET=false VALIDATION_STRINGENCY=STRICT COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:16:06 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:16:06	AddOrReplaceReadGroups	Created read group ID=RG_311215_99_unclassified PL=illumina LB=demo SM=demo

[Fri Jun 02 18:16:07 EDT 2017] picard.sam.AddOrReplaceReadGroups done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder /tmp//SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.RG.bam ;
mkdir /tmp//SSDSpl_tmp_51607063443
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_51607063443 I=/tmp//SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.RG.bam O=/tmp//SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.RG.SSbam SO=coordinate
[Fri Jun 02 18:16:07 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.RG.bam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.RG.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_51607063443] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:16:07 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:16:07	SortSam	Finished reading inputs, merging and writing to output now.
[Fri Jun 02 18:16:07 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_51607063443 I= /tmp//SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.RG.SSbam O= /tmp//SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.RG.sorted.bam R= /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Fri Jun 02 18:16:07 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.RG.SSbam OUTPUT=/tmp/SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.RG.sorted.bam REFERENCE=/share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_51607063443] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:16:07 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:16:08	ReorderSam	SAM/BAM file
INFO	2017-06-02 18:16:08	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:16:08	ReorderSam	Reference
INFO	2017-06-02 18:16:08	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:16:08	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-02 18:16:08	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-02 18:16:08	ReorderSam	Writing reads...
INFO	2017-06-02 18:16:08	ReorderSam	  Processing All reads
INFO	2017-06-02 18:16:08	ReorderSam	Wrote 26 reads
[Fri Jun 02 18:16:08 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.RG.SSbam 
java -Xmx4g -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar MarkDuplicates I=/tmp//SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.RG.sorted.bam O=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.unclassified.final.bam M=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.unclassified.MDmetrics.tab VALIDATION_STRINGENCY=LENIENT AS=true TMP_DIR=/tmp//SSDSpl_tmp_72794803402 ;
[Fri Jun 02 18:16:08 EDT 2017] picard.sam.markduplicates.MarkDuplicates INPUT=[/tmp//SSDSpl_tmp_72794803402/KB_addRG_79006618376/SSDSdemo.testgenome.unclassified.RG.sorted.bam] OUTPUT=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.unclassified.final.bam METRICS_FILE=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.unclassified.MDmetrics.tab ASSUME_SORTED=true TMP_DIR=[/tmp/SSDSpl_tmp_72794803402] VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag REMOVE_DUPLICATES=false DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:16:08 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:16:08	MarkDuplicates	Start of doWork freeMemory: 376497472; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-02 18:16:08	MarkDuplicates	Reading input file and constructing read end information.
INFO	2017-06-02 18:16:08	MarkDuplicates	Will retain up to 14684096 data points before spilling to disk.
INFO	2017-06-02 18:16:09	MarkDuplicates	Read 26 records. 0 pairs never matched.
INFO	2017-06-02 18:16:10	MarkDuplicates	After buildSortedReadEndLists freeMemory: 258613232; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-02 18:16:10	MarkDuplicates	Will retain up to 119308288 duplicate indices before spilling to disk.
INFO	2017-06-02 18:16:15	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2017-06-02 18:16:15	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2017-06-02 18:16:15	MarkDuplicates	Sorting list of duplicate records.
INFO	2017-06-02 18:16:15	MarkDuplicates	After generateDuplicateIndexes freeMemory: 376488960; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-02 18:16:15	MarkDuplicates	Marking 4 records as duplicates.
INFO	2017-06-02 18:16:15	MarkDuplicates	Found 0 optical duplicate clusters.
INFO	2017-06-02 18:16:15	MarkDuplicates	Reads are assumed to be ordered by: coordinate
INFO	2017-06-02 18:16:15	MarkDuplicates	Before output close freeMemory: 1330349008; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-02 18:16:15	MarkDuplicates	After output close freeMemory: 1330413880; totalMemory: 1334837248; maxMemory: 3817865216
[Fri Jun 02 18:16:15 EDT 2017] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 0.12 minutes.
Runtime.totalMemory()=1334837248
mv /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.unclassified.final.bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.unclassified.bam ;
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQ/SSDSdemo.testgenome.unclassified.bam ;
rm -rf /tmp//SSDSpl_tmp_72794803402/KB_addRG_79006618376/ ;

rm -rf /tmp//SSDSpl_tmp_72794803402
mkdir /tmp//SSDSpl_tmp_78123828566
mkdir /tmp//SSDSpl_tmp_96674847051
rm /tmp//SSDSpl_tmp_96674847051/*
rm: cannot remove '/tmp//SSDSpl_tmp_96674847051/*': No such file or directory
gunzip -c /home/kevbrick/data/SSDS_Pipeline/git/unitTest/SSDSdemo.R1.fastq.gz >/tmp//SSDSpl_tmp_96674847051/SSDSdemo.R1.fastq
gunzip -c /home/kevbrick/data/SSDS_Pipeline/git/unitTest/SSDSdemo.R2.fastq.gz >/tmp//SSDSpl_tmp_96674847051/SSDSdemo.R2.fastq
/home/kevbrick/data/SSDS_Pipeline/git/fastx_trimmer -f 1 -l 36 -i /tmp//SSDSpl_tmp_96674847051/SSDSdemo.R1.fastq >/tmp//SSDSpl_tmp_96674847051/SSDSdemo.trim.R1.fq
/home/kevbrick/data/SSDS_Pipeline/git/fastx_trimmer -f 1 -l 40 -i /tmp//SSDSpl_tmp_96674847051/SSDSdemo.R2.fastq >/tmp//SSDSpl_tmp_96674847051/SSDSdemo.trim.R2.fq
/home/kevbrick/data/SSDS_Pipeline/git//bwa_0.7.12 aln -t 1 /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_96674847051/SSDSdemo.trim.R1.fq >/tmp//SSDSpl_tmp_96674847051/SSDSdemo.R1.sai
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
[main] CMD: /home/kevbrick/data/SSDS_Pipeline/git//bwa_0.7.12 aln -t 1 /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_96674847051/SSDSdemo.trim.R1.fq
[main] Real time: 0.152 sec; CPU: 0.092 sec
/home/kevbrick/data/SSDS_Pipeline/git//bwa_ra_0.7.12 aln -t 1 /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_96674847051/SSDSdemo.trim.R2.fq >/tmp//SSDSpl_tmp_96674847051/SSDSdemo.R2.sai
[bwa_aln] 17bp reads: max_diff = 2
[bwa_aln] 38bp reads: max_diff = 3
[bwa_aln] 64bp reads: max_diff = 4
[bwa_aln] 93bp reads: max_diff = 5
[bwa_aln] 124bp reads: max_diff = 6
[bwa_aln] 157bp reads: max_diff = 7
[bwa_aln] 190bp reads: max_diff = 8
[bwa_aln] 225bp reads: max_diff = 9
[bwa_aln_core] calculate SA coordinate... 2.02 sec
[bwa_aln_core] write to the disk... 0.00 sec
[bwa_aln_core] 3673 sequences have been processed.
[main] Version: 0.7.12-r1039
[main] CMD: /home/kevbrick/data/SSDS_Pipeline/git//bwa_ra_0.7.12 aln -t 1 /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_96674847051/SSDSdemo.trim.R2.fq
[main] Real time: 2.079 sec; CPU: 2.020 sec
/home/kevbrick/data/SSDS_Pipeline/git//bwa_0.7.12 sampe  /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_96674847051/SSDSdemo.R1.sai /tmp//SSDSpl_tmp_96674847051/SSDSdemo.R2.sai /tmp//SSDSpl_tmp_96674847051/SSDSdemo.trim.R1.fq /tmp//SSDSpl_tmp_96674847051/SSDSdemo.trim.R2.fq | java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar SamFormatConverter VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_96674847051 I=/dev/stdin O=/tmp//SSDSpl_tmp_96674847051/SSDSdemo.bwa_testgenome.bam
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
[bwa_sai2sam_pe_core] print alignments... [Fri Jun 02 18:16:18 EDT 2017] picard.sam.SamFormatConverter INPUT=/dev/stdin OUTPUT=/tmp/SSDSpl_tmp_96674847051/SSDSdemo.bwa_testgenome.bam TMP_DIR=[/tmp/SSDSpl_tmp_96674847051] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:16:18 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
0.03 sec
[bwa_sai2sam_pe_core] 3673 sequences have been processed.
[main] Version: 0.7.12-r1039
[main] CMD: /home/kevbrick/data/SSDS_Pipeline/git//bwa_0.7.12 sampe /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa /tmp//SSDSpl_tmp_96674847051/SSDSdemo.R1.sai /tmp//SSDSpl_tmp_96674847051/SSDSdemo.R2.sai /tmp//SSDSpl_tmp_96674847051/SSDSdemo.trim.R1.fq /tmp//SSDSpl_tmp_96674847051/SSDSdemo.trim.R2.fq
[main] Real time: 1.215 sec; CPU: 0.100 sec
[Fri Jun 02 18:16:19 EDT 2017] picard.sam.SamFormatConverter done. Elapsed time: 0.02 minutes.
Runtime.totalMemory()=380108800
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --v --g  testgenome /tmp//SSDSpl_tmp_96674847051/SSDSdemo.bwa_testgenome.bam
mkdir /tmp//SSDSpl_tmp_30903383980
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_30903383980 I=/tmp//SSDSpl_tmp_96674847051/SSDSdemo.bwa_testgenome.bam O=/tmp//SSDSpl_tmp_96674847051/SSDSdemo.bwa_testgenome.SSbam SO=coordinate
[Fri Jun 02 18:16:20 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_96674847051/SSDSdemo.bwa_testgenome.bam OUTPUT=/tmp/SSDSpl_tmp_96674847051/SSDSdemo.bwa_testgenome.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_30903383980] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:16:20 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:16:20	SortSam	Finished reading inputs, merging and writing to output now.
[Fri Jun 02 18:16:20 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_30903383980 I= /tmp//SSDSpl_tmp_96674847051/SSDSdemo.bwa_testgenome.SSbam O= /tmp//SSDSpl_tmp_96674847051/SSDSdemo.bwa_testgenome.sorted.bam R= /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Fri Jun 02 18:16:21 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_96674847051/SSDSdemo.bwa_testgenome.SSbam OUTPUT=/tmp/SSDSpl_tmp_96674847051/SSDSdemo.bwa_testgenome.sorted.bam REFERENCE=/share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_30903383980] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:16:21 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:16:21	ReorderSam	SAM/BAM file
INFO	2017-06-02 18:16:21	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:16:21	ReorderSam	Reference
INFO	2017-06-02 18:16:21	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:16:21	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-02 18:16:21	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-02 18:16:21	ReorderSam	Writing reads...
INFO	2017-06-02 18:16:21	ReorderSam	  Processing All reads
INFO	2017-06-02 18:16:21	ReorderSam	Wrote 7346 reads
[Fri Jun 02 18:16:21 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_96674847051/SSDSdemo.bwa_testgenome.SSbam 
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools view -f 2 -bh  /tmp//SSDSpl_tmp_96674847051/SSDSdemo.bwa_testgenome.sorted.bam >/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz//SSDSdemo.sortedAln.testgenome.bam
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz//SSDSdemo.sortedAln.testgenome.bam
perl /home/kevbrick/data/SSDS_Pipeline/git//parseITRs.pl --temp /tmp//SSDSpl_tmp_96674847051 --bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz//SSDSdemo.sortedAln.testgenome.bam --output bedbam --outdir /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/ --splitSz 1000 --g testgenome --gOK >/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz//SSDSdemo.ITRId.OUT 2>/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz//SSDSdemo.ITRId.ERR
open: No such file or directory
[main_samview] fail to open "SSDSdemo.sortedAln.testgenome.bam" for reading.
mkdir /tmp//SSDSpl_tmp_96674847051/KB_addRG_92174515812/ ;
cp /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type1.bam /tmp//SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.bam ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder  /tmp//SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.bam ;
mkdir /tmp//SSDSpl_tmp_78273333919
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_78273333919 I=/tmp//SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.bam O=/tmp//SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.SSbam SO=coordinate
[Fri Jun 02 18:16:47 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.bam OUTPUT=/tmp/SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_78273333919] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:16:47 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:16:48	SortSam	Finished reading inputs, merging and writing to output now.
[Fri Jun 02 18:16:48 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_78273333919 I= /tmp//SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.SSbam O= /tmp//SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.sorted.bam R= /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Fri Jun 02 18:16:48 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.SSbam OUTPUT=/tmp/SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.sorted.bam REFERENCE=/share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_78273333919] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:16:48 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:16:48	ReorderSam	SAM/BAM file
INFO	2017-06-02 18:16:48	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:16:48	ReorderSam	Reference
INFO	2017-06-02 18:16:48	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:16:48	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-02 18:16:48	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-02 18:16:48	ReorderSam	Writing reads...
INFO	2017-06-02 18:16:48	ReorderSam	  Processing All reads
INFO	2017-06-02 18:16:49	ReorderSam	Wrote 6338 reads
[Fri Jun 02 18:16:49 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.SSbam 
mv /tmp//SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.sorted.bam /tmp//SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.srt.bam ; 
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar AddOrReplaceReadGroups I=/tmp//SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.srt.bam O=/tmp//SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.RG.bam RGID=RG_311215_99_ssDNA_type1 RGSM=demo RGPU=na RGLB=demo RGPL=illumina RGCN=NIDDK_Genomics_Core  TMP_DIR=/tmp//SSDSpl_tmp_96674847051 ;
[Fri Jun 02 18:16:49 EDT 2017] picard.sam.AddOrReplaceReadGroups INPUT=/tmp//SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.srt.bam OUTPUT=/tmp/SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.RG.bam RGID=RG_311215_99_ssDNA_type1 RGLB=demo RGPL=illumina RGPU=na RGSM=demo RGCN=NIDDK_Genomics_Core TMP_DIR=[/tmp/SSDSpl_tmp_96674847051]    VERBOSITY=INFO QUIET=false VALIDATION_STRINGENCY=STRICT COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:16:49 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:16:49	AddOrReplaceReadGroups	Created read group ID=RG_311215_99_ssDNA_type1 PL=illumina LB=demo SM=demo

[Fri Jun 02 18:16:50 EDT 2017] picard.sam.AddOrReplaceReadGroups done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder /tmp//SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.RG.bam ;
mkdir /tmp//SSDSpl_tmp_54570113432
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_54570113432 I=/tmp//SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.RG.bam O=/tmp//SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.RG.SSbam SO=coordinate
[Fri Jun 02 18:16:51 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.RG.bam OUTPUT=/tmp/SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.RG.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_54570113432] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:16:51 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:16:51	SortSam	Finished reading inputs, merging and writing to output now.
[Fri Jun 02 18:16:51 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_54570113432 I= /tmp//SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.RG.SSbam O= /tmp//SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.RG.sorted.bam R= /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Fri Jun 02 18:16:52 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.RG.SSbam OUTPUT=/tmp/SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.RG.sorted.bam REFERENCE=/share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_54570113432] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:16:52 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:16:52	ReorderSam	SAM/BAM file
INFO	2017-06-02 18:16:52	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:16:52	ReorderSam	Reference
INFO	2017-06-02 18:16:52	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:16:52	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-02 18:16:52	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-02 18:16:52	ReorderSam	Writing reads...
INFO	2017-06-02 18:16:52	ReorderSam	  Processing All reads
INFO	2017-06-02 18:16:52	ReorderSam	Wrote 6338 reads
[Fri Jun 02 18:16:52 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.01 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.RG.SSbam 
java -Xmx4g -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar MarkDuplicates I=/tmp//SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.RG.sorted.bam O=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type1.final.bam M=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type1.MDmetrics.tab VALIDATION_STRINGENCY=LENIENT AS=true TMP_DIR=/tmp//SSDSpl_tmp_96674847051 ;
[Fri Jun 02 18:16:53 EDT 2017] picard.sam.markduplicates.MarkDuplicates INPUT=[/tmp//SSDSpl_tmp_96674847051/KB_addRG_92174515812/SSDSdemo.testgenome.ssDNA_type1.RG.sorted.bam] OUTPUT=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type1.final.bam METRICS_FILE=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type1.MDmetrics.tab ASSUME_SORTED=true TMP_DIR=[/tmp/SSDSpl_tmp_96674847051] VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag REMOVE_DUPLICATES=false DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:16:53 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:16:53	MarkDuplicates	Start of doWork freeMemory: 376497912; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-02 18:16:53	MarkDuplicates	Reading input file and constructing read end information.
INFO	2017-06-02 18:16:53	MarkDuplicates	Will retain up to 14684096 data points before spilling to disk.
INFO	2017-06-02 18:16:55	MarkDuplicates	Read 6338 records. 0 pairs never matched.
INFO	2017-06-02 18:16:55	MarkDuplicates	After buildSortedReadEndLists freeMemory: 257907280; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-02 18:16:55	MarkDuplicates	Will retain up to 119308288 duplicate indices before spilling to disk.
INFO	2017-06-02 18:17:00	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2017-06-02 18:17:00	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2017-06-02 18:17:00	MarkDuplicates	Sorting list of duplicate records.
INFO	2017-06-02 18:17:01	MarkDuplicates	After generateDuplicateIndexes freeMemory: 376463896; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-02 18:17:01	MarkDuplicates	Marking 2180 records as duplicates.
INFO	2017-06-02 18:17:01	MarkDuplicates	Found 2 optical duplicate clusters.
INFO	2017-06-02 18:17:01	MarkDuplicates	Reads are assumed to be ordered by: coordinate
INFO	2017-06-02 18:17:01	MarkDuplicates	Before output close freeMemory: 1330324576; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-02 18:17:01	MarkDuplicates	After output close freeMemory: 1330389664; totalMemory: 1334837248; maxMemory: 3817865216
[Fri Jun 02 18:17:01 EDT 2017] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 0.14 minutes.
Runtime.totalMemory()=1334837248
mv /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type1.final.bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type1.bam ;
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type1.bam ;
rm -rf /tmp//SSDSpl_tmp_96674847051/KB_addRG_92174515812/ ;

mkdir /tmp//SSDSpl_tmp_96674847051/KB_addRG_5440747764/ ;
cp /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type2.bam /tmp//SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.bam ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder  /tmp//SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.bam ;
mkdir /tmp//SSDSpl_tmp_12789677393
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_12789677393 I=/tmp//SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.bam O=/tmp//SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.SSbam SO=coordinate
[Fri Jun 02 18:17:02 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.bam OUTPUT=/tmp/SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_12789677393] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:17:02 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:17:02	SortSam	Finished reading inputs, merging and writing to output now.
[Fri Jun 02 18:17:02 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_12789677393 I= /tmp//SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.SSbam O= /tmp//SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.sorted.bam R= /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Fri Jun 02 18:17:03 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.SSbam OUTPUT=/tmp/SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.sorted.bam REFERENCE=/share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_12789677393] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:17:03 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:17:03	ReorderSam	SAM/BAM file
INFO	2017-06-02 18:17:03	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:17:03	ReorderSam	Reference
INFO	2017-06-02 18:17:03	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:17:03	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-02 18:17:03	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-02 18:17:03	ReorderSam	Writing reads...
INFO	2017-06-02 18:17:03	ReorderSam	  Processing All reads
INFO	2017-06-02 18:17:03	ReorderSam	Wrote 300 reads
[Fri Jun 02 18:17:03 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.SSbam 
mv /tmp//SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.sorted.bam /tmp//SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.srt.bam ; 
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar AddOrReplaceReadGroups I=/tmp//SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.srt.bam O=/tmp//SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.RG.bam RGID=RG_311215_99_ssDNA_type2 RGSM=demo RGPU=na RGLB=demo RGPL=illumina RGCN=NIDDK_Genomics_Core  TMP_DIR=/tmp//SSDSpl_tmp_96674847051 ;
[Fri Jun 02 18:17:03 EDT 2017] picard.sam.AddOrReplaceReadGroups INPUT=/tmp//SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.srt.bam OUTPUT=/tmp/SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.RG.bam RGID=RG_311215_99_ssDNA_type2 RGLB=demo RGPL=illumina RGPU=na RGSM=demo RGCN=NIDDK_Genomics_Core TMP_DIR=[/tmp/SSDSpl_tmp_96674847051]    VERBOSITY=INFO QUIET=false VALIDATION_STRINGENCY=STRICT COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:17:03 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:17:03	AddOrReplaceReadGroups	Created read group ID=RG_311215_99_ssDNA_type2 PL=illumina LB=demo SM=demo

[Fri Jun 02 18:17:03 EDT 2017] picard.sam.AddOrReplaceReadGroups done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder /tmp//SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.RG.bam ;
mkdir /tmp//SSDSpl_tmp_97149264284
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar SortSam VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_97149264284 I=/tmp//SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.RG.bam O=/tmp//SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.RG.SSbam SO=coordinate
[Fri Jun 02 18:17:04 EDT 2017] picard.sam.SortSam INPUT=/tmp/SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.RG.bam OUTPUT=/tmp/SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.RG.SSbam SORT_ORDER=coordinate TMP_DIR=[/tmp/SSDSpl_tmp_97149264284] VALIDATION_STRINGENCY=LENIENT    VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:17:04 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:17:04	SortSam	Finished reading inputs, merging and writing to output now.
[Fri Jun 02 18:17:04 EDT 2017] picard.sam.SortSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0/\picard.jar ReorderSam ALLOW_INCOMPLETE_DICT_CONCORDANCE=true VALIDATION_STRINGENCY=LENIENT TMP_DIR=/tmp//SSDSpl_tmp_97149264284 I= /tmp//SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.RG.SSbam O= /tmp//SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.RG.sorted.bam R= /share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa
[Fri Jun 02 18:17:05 EDT 2017] picard.sam.ReorderSam INPUT=/tmp/SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.RG.SSbam OUTPUT=/tmp/SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.RG.sorted.bam REFERENCE=/share/genomes/testGenome/BWAIndex/version0.7.10/genome.fa ALLOW_INCOMPLETE_DICT_CONCORDANCE=true TMP_DIR=[/tmp/SSDSpl_tmp_97149264284] VALIDATION_STRINGENCY=LENIENT    ALLOW_CONTIG_LENGTH_DISCORDANCE=false VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:17:05 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:17:05	ReorderSam	SAM/BAM file
INFO	2017-06-02 18:17:05	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:17:05	ReorderSam	Reference
INFO	2017-06-02 18:17:05	ReorderSam	  SN=%s LN=%d%nchr1175001
INFO	2017-06-02 18:17:05	ReorderSam	Reordering SAM/BAM file:
INFO	2017-06-02 18:17:05	ReorderSam	  Reordering read contig chr1 [index=0] to => ref contig chr1 [index=0]

INFO	2017-06-02 18:17:05	ReorderSam	Writing reads...
INFO	2017-06-02 18:17:05	ReorderSam	  Processing All reads
INFO	2017-06-02 18:17:05	ReorderSam	Wrote 300 reads
[Fri Jun 02 18:17:05 EDT 2017] picard.sam.ReorderSam done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
rm /tmp//SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.RG.SSbam 
java -Xmx4g -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar MarkDuplicates I=/tmp//SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.RG.sorted.bam O=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type2.final.bam M=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type2.MDmetrics.tab VALIDATION_STRINGENCY=LENIENT AS=true TMP_DIR=/tmp//SSDSpl_tmp_96674847051 ;
[Fri Jun 02 18:17:05 EDT 2017] picard.sam.markduplicates.MarkDuplicates INPUT=[/tmp//SSDSpl_tmp_96674847051/KB_addRG_5440747764/SSDSdemo.testgenome.ssDNA_type2.RG.sorted.bam] OUTPUT=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type2.final.bam METRICS_FILE=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type2.MDmetrics.tab ASSUME_SORTED=true TMP_DIR=[/tmp/SSDSpl_tmp_96674847051] VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag REMOVE_DUPLICATES=false DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:17:05 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
INFO	2017-06-02 18:17:05	MarkDuplicates	Start of doWork freeMemory: 376497072; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-02 18:17:05	MarkDuplicates	Reading input file and constructing read end information.
INFO	2017-06-02 18:17:05	MarkDuplicates	Will retain up to 14684096 data points before spilling to disk.
INFO	2017-06-02 18:17:07	MarkDuplicates	Read 300 records. 0 pairs never matched.
INFO	2017-06-02 18:17:08	MarkDuplicates	After buildSortedReadEndLists freeMemory: 258577864; totalMemory: 380108800; maxMemory: 3817865216
INFO	2017-06-02 18:17:08	MarkDuplicates	Will retain up to 119308288 duplicate indices before spilling to disk.
INFO	2017-06-02 18:17:12	MarkDuplicates	Traversing read pair information and detecting duplicates.
INFO	2017-06-02 18:17:12	MarkDuplicates	Traversing fragment information and detecting duplicates.
INFO	2017-06-02 18:17:12	MarkDuplicates	Sorting list of duplicate records.
INFO	2017-06-02 18:17:12	MarkDuplicates	After generateDuplicateIndexes freeMemory: 376483184; totalMemory: 1334837248; maxMemory: 3817865216
INFO	2017-06-02 18:17:12	MarkDuplicates	Marking 112 records as duplicates.
INFO	2017-06-02 18:17:12	MarkDuplicates	Found 0 optical duplicate clusters.
INFO	2017-06-02 18:17:12	MarkDuplicates	Reads are assumed to be ordered by: coordinate
mv /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type2.final.bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type2.bam ;
mv: cannot stat '/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type2.final.bam': No such file or directory
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.ssDNA_type2.bam ;
rm -rf /tmp//SSDSpl_tmp_96674847051/KB_addRG_5440747764/ ;

mkdir /tmp//SSDSpl_tmp_96674847051/KB_addRG_31104925982/ ;
cp /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA.bam /tmp//SSDSpl_tmp_96674847051/KB_addRG_31104925982/SSDSdemo.testgenome.dsDNA.bam ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder  /tmp//SSDSpl_tmp_96674847051/KB_addRG_31104925982/SSDSdemo.testgenome.dsDNA.bam ;
mkdir /tmp//SSDSpl_tmp_57849951771
mv /tmp//SSDSpl_tmp_96674847051/KB_addRG_31104925982/SSDSdemo.testgenome.dsDNA.sorted.bam /tmp//SSDSpl_tmp_96674847051/KB_addRG_31104925982/SSDSdemo.testgenome.dsDNA.srt.bam ; 
mv: cannot stat '/tmp//SSDSpl_tmp_96674847051/KB_addRG_31104925982/SSDSdemo.testgenome.dsDNA.sorted.bam': No such file or directory
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar AddOrReplaceReadGroups I=/tmp//SSDSpl_tmp_96674847051/KB_addRG_31104925982/SSDSdemo.testgenome.dsDNA.srt.bam O=/tmp//SSDSpl_tmp_96674847051/KB_addRG_31104925982/SSDSdemo.testgenome.dsDNA.RG.bam RGID=RG_311215_99_dsDNA RGSM=demo RGPU=na RGLB=demo RGPL=illumina RGCN=NIDDK_Genomics_Core  TMP_DIR=/tmp//SSDSpl_tmp_96674847051 ;
[Fri Jun 02 18:17:13 EDT 2017] picard.sam.AddOrReplaceReadGroups INPUT=/tmp//SSDSpl_tmp_96674847051/KB_addRG_31104925982/SSDSdemo.testgenome.dsDNA.srt.bam OUTPUT=/tmp/SSDSpl_tmp_96674847051/KB_addRG_31104925982/SSDSdemo.testgenome.dsDNA.RG.bam RGID=RG_311215_99_dsDNA RGLB=demo RGPL=illumina RGPU=na RGSM=demo RGCN=NIDDK_Genomics_Core TMP_DIR=[/tmp/SSDSpl_tmp_96674847051]    VERBOSITY=INFO QUIET=false VALIDATION_STRINGENCY=STRICT COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:17:13 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
[Fri Jun 02 18:17:13 EDT 2017] picard.sam.AddOrReplaceReadGroups done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
To get help, see http://broadinstitute.github.io/picard/index.html#GettingHelp
Exception in thread "main" htsjdk.samtools.SAMException: Cannot read non-existent file: /tmp/SSDSpl_tmp_96674847051/KB_addRG_31104925982/SSDSdemo.testgenome.dsDNA.srt.bam
	at htsjdk.samtools.util.IOUtil.assertFileIsReadable(IOUtil.java:338)
	at htsjdk.samtools.util.IOUtil.assertFileIsReadable(IOUtil.java:325)
	at htsjdk.samtools.util.IOUtil.assertInputIsValid(IOUtil.java:301)
	at picard.sam.AddOrReplaceReadGroups.doWork(AddOrReplaceReadGroups.java:107)
	at picard.cmdline.CommandLineProgram.instanceMain(CommandLineProgram.java:209)
	at picard.cmdline.PicardCommandLine.instanceMain(PicardCommandLine.java:95)
	at picard.cmdline.PicardCommandLine.main(PicardCommandLine.java:105)
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder /tmp//SSDSpl_tmp_96674847051/KB_addRG_31104925982/SSDSdemo.testgenome.dsDNA.RG.bam ;
java -Xmx4g -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar MarkDuplicates I=/tmp//SSDSpl_tmp_96674847051/KB_addRG_31104925982/SSDSdemo.testgenome.dsDNA.RG.sorted.bam O=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA.final.bam M=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA.MDmetrics.tab VALIDATION_STRINGENCY=LENIENT AS=true TMP_DIR=/tmp//SSDSpl_tmp_96674847051 ;
[Fri Jun 02 18:17:13 EDT 2017] picard.sam.markduplicates.MarkDuplicates INPUT=[/tmp//SSDSpl_tmp_96674847051/KB_addRG_31104925982/SSDSdemo.testgenome.dsDNA.RG.sorted.bam] OUTPUT=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA.final.bam METRICS_FILE=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA.MDmetrics.tab ASSUME_SORTED=true TMP_DIR=[/tmp/SSDSpl_tmp_96674847051] VALIDATION_STRINGENCY=LENIENT    MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP=50000 MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=8000 SORTING_COLLECTION_SIZE_RATIO=0.25 REMOVE_SEQUENCING_DUPLICATES=false TAGGING_POLICY=DontTag REMOVE_DUPLICATES=false DUPLICATE_SCORING_STRATEGY=SUM_OF_BASE_QUALITIES PROGRAM_RECORD_ID=MarkDuplicates PROGRAM_GROUP_NAME=MarkDuplicates READ_NAME_REGEX=<optimized capture of last three ':' separated fields as numeric values> OPTICAL_DUPLICATE_PIXEL_DISTANCE=100 VERBOSITY=INFO QUIET=false COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false GA4GH_CLIENT_SECRETS=client_secrets.json
[Fri Jun 02 18:17:13 EDT 2017] Executing as kevbrick@kb5r205 on Linux 4.4.0-63-generic amd64; OpenJDK 64-Bit Server VM 1.8.0_121-8u121-b13-0ubuntu1.16.04.2-b13; Picard version: 2.3.0(9a00c87b7ffdb01cfb5a0d6e76556146196babb8_1463071327) IntelDeflater
[Fri Jun 02 18:17:13 EDT 2017] picard.sam.markduplicates.MarkDuplicates done. Elapsed time: 0.00 minutes.
Runtime.totalMemory()=380108800
To get help, see http://broadinstitute.github.io/picard/index.html#GettingHelp
Exception in thread "main" htsjdk.samtools.SAMException: Cannot read non-existent file: /tmp/SSDSpl_tmp_96674847051/KB_addRG_31104925982/SSDSdemo.testgenome.dsDNA.RG.sorted.bam
	at htsjdk.samtools.util.IOUtil.assertFileIsReadable(IOUtil.java:338)
	at htsjdk.samtools.util.IOUtil.assertFileIsReadable(IOUtil.java:325)
	at htsjdk.samtools.util.IOUtil.assertInputIsValid(IOUtil.java:301)
	at htsjdk.samtools.util.IOUtil.assertInputsAreValid(IOUtil.java:366)
	at picard.sam.markduplicates.MarkDuplicates.doWork(MarkDuplicates.java:185)
	at picard.cmdline.CommandLineProgram.instanceMain(CommandLineProgram.java:209)
	at picard.cmdline.PicardCommandLine.instanceMain(PicardCommandLine.java:95)
	at picard.cmdline.PicardCommandLine.main(PicardCommandLine.java:105)
mv /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA.final.bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA.bam ;
mv: cannot stat '/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA.final.bam': No such file or directory
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA.bam ;
rm -rf /tmp//SSDSpl_tmp_96674847051/KB_addRG_31104925982/ ;

mkdir /tmp//SSDSpl_tmp_96674847051/KB_addRG_90097233223/ ;
cp /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA_strict.bam /tmp//SSDSpl_tmp_96674847051/KB_addRG_90097233223/SSDSdemo.testgenome.dsDNA_strict.bam ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder  /tmp//SSDSpl_tmp_96674847051/KB_addRG_90097233223/SSDSdemo.testgenome.dsDNA_strict.bam ;
mv /tmp//SSDSpl_tmp_96674847051/KB_addRG_90097233223/SSDSdemo.testgenome.dsDNA_strict.sorted.bam /tmp//SSDSpl_tmp_96674847051/KB_addRG_90097233223/SSDSdemo.testgenome.dsDNA_strict.srt.bam ; 
mv: cannot stat '/tmp//SSDSpl_tmp_96674847051/KB_addRG_90097233223/SSDSdemo.testgenome.dsDNA_strict.sorted.bam': No such file or directory
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar AddOrReplaceReadGroups I=/tmp//SSDSpl_tmp_96674847051/KB_addRG_90097233223/SSDSdemo.testgenome.dsDNA_strict.srt.bam O=/tmp//SSDSpl_tmp_96674847051/KB_addRG_90097233223/SSDSdemo.testgenome.dsDNA_strict.RG.bam RGID=RG_311215_99_dsDNA_strict RGSM=demo RGPU=na RGLB=demo RGPL=illumina RGCN=NIDDK_Genomics_Core  TMP_DIR=/tmp//SSDSpl_tmp_96674847051 ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder /tmp//SSDSpl_tmp_96674847051/KB_addRG_90097233223/SSDSdemo.testgenome.dsDNA_strict.RG.bam ;
java -Xmx4g -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar MarkDuplicates I=/tmp//SSDSpl_tmp_96674847051/KB_addRG_90097233223/SSDSdemo.testgenome.dsDNA_strict.RG.sorted.bam O=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA_strict.final.bam M=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA_strict.MDmetrics.tab VALIDATION_STRINGENCY=LENIENT AS=true TMP_DIR=/tmp//SSDSpl_tmp_96674847051 ;
mv /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA_strict.final.bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA_strict.bam ;
mv: cannot stat '/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA_strict.final.bam': No such file or directory
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.dsDNA_strict.bam ;
rm -rf /tmp//SSDSpl_tmp_96674847051/KB_addRG_90097233223/ ;

mkdir /tmp//SSDSpl_tmp_96674847051/KB_addRG_18638728604/ ;
cp /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.unclassified.bam /tmp//SSDSpl_tmp_96674847051/KB_addRG_18638728604/SSDSdemo.testgenome.unclassified.bam ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder  /tmp//SSDSpl_tmp_96674847051/KB_addRG_18638728604/SSDSdemo.testgenome.unclassified.bam ;
mv /tmp//SSDSpl_tmp_96674847051/KB_addRG_18638728604/SSDSdemo.testgenome.unclassified.sorted.bam /tmp//SSDSpl_tmp_96674847051/KB_addRG_18638728604/SSDSdemo.testgenome.unclassified.srt.bam ; 
mv: cannot stat '/tmp//SSDSpl_tmp_96674847051/KB_addRG_18638728604/SSDSdemo.testgenome.unclassified.sorted.bam': No such file or directory
java -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar AddOrReplaceReadGroups I=/tmp//SSDSpl_tmp_96674847051/KB_addRG_18638728604/SSDSdemo.testgenome.unclassified.srt.bam O=/tmp//SSDSpl_tmp_96674847051/KB_addRG_18638728604/SSDSdemo.testgenome.unclassified.RG.bam RGID=RG_311215_99_unclassified RGSM=demo RGPU=na RGLB=demo RGPL=illumina RGCN=NIDDK_Genomics_Core  TMP_DIR=/tmp//SSDSpl_tmp_96674847051 ;
/home/kevbrick/data/SSDS_Pipeline/git//sortBAM --g testgenome --v --forceSort --forceReorder /tmp//SSDSpl_tmp_96674847051/KB_addRG_18638728604/SSDSdemo.testgenome.unclassified.RG.bam ;
java -Xmx4g -jar /home/kevbrick/data/SSDS_Pipeline/git/picard-tools-2.3.0//picard.jar MarkDuplicates I=/tmp//SSDSpl_tmp_96674847051/KB_addRG_18638728604/SSDSdemo.testgenome.unclassified.RG.sorted.bam O=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.unclassified.final.bam M=/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.unclassified.MDmetrics.tab VALIDATION_STRINGENCY=LENIENT AS=true TMP_DIR=/tmp//SSDSpl_tmp_96674847051 ;
mv /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.unclassified.final.bam /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.unclassified.bam ;
mv: cannot stat '/home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.unclassified.final.bam': No such file or directory
/home/kevbrick/data/SSDS_Pipeline/git/samtools-0.1.17//samtools index /home/kevbrick/data/SSDS_Pipeline/git/unitTest/output/fromFASTQgz/SSDSdemo.testgenome.unclassified.bam ;
rm -rf /tmp//SSDSpl_tmp_96674847051/KB_addRG_18638728604/ ;

rm -rf /tmp//SSDSpl_tmp_96674847051
