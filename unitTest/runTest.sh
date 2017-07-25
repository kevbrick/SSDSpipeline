#!/bin/bash

## Ensure that we've cleaned up first
rm -rf $SSDSGENOMESPATH/testGenome/
rm $SSDSPIPELINEPATH/unitTest/output/fromFASTQ/*
rm $SSDSPIPELINEPATH/unitTest/output/fromFASTQgz/*
rm $SSDSPIPELINEPATH/unitTest/output/fromBAM/*

## Add the test genome
perl $SSDSPIPELINEPATH/addGenome.pl \
 --fa SSDSdemoRegion.fasta \
 --name testGenome \
 --g tg1 \
 --s MusMusculusChr10_92581444_92756444 \
 >runTest.o \
 2>runTest.e

if [ -f $SSDSGENOMESPATH/testGenome/BWAIndex/version0.7.10/genome.fa.bwt ]; then
    echo "Test genome was added and indexed successfully !!"
else
	echo "**** FAIL **** Test genome was NOT added correctly !!" 
	exit 99
fi

## TEST 1: Using FASTQ files as input
$SSDSPIPELINEPATH/run_ssDNAPipeline \
 --g testGenome \
 --n 1 \
 --fq1 $SSDSPIPELINEPATH/unitTest/SSDSdemo.R1.fastq \
 --fq2 $SSDSPIPELINEPATH/unitTest/SSDSdemo.R2.fastq \
 --sample demo \
 --splitSz 1000 \
 --lane 99 \
 --date 311215 \
 --outdir $SSDSPIPELINEPATH/unitTest/output/fromFASTQ \
 >>$SSDSPIPELINEPATH/unitTest/runTest.o \
 2>>$SSDSPIPELINEPATH/unitTest/runTest.e

if [ -f $SSDSPIPELINEPATH/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssPipeline.done ]; then
    echo "SSDS pipeline from FASTQ successful !!" 
else
	echo "**** FAIL **** SSDS pipeline from FASTQ did not run correctly !!" 
	exit 99
fi

## TEST 2: Using FASTQ.GZ files as input
$SSDSPIPELINEPATH/run_ssDNAPipeline \
 --g testGenome \
 --n 1 \
 --fq1 $SSDSPIPELINEPATH/unitTest/SSDSdemo.R1.fastq.gz \
 --fq2 $SSDSPIPELINEPATH/unitTest/SSDSdemo.R2.fastq.gz \
 --sample demo \
 --splitSz 1000 \
 --lane 99 \
 --date 311215 \
 --outdir $SSDSPIPELINEPATH/unitTest/output/fromFASTQgz \
 >>$SSDSPIPELINEPATH/unitTest/runTest.o \
 2>>$SSDSPIPELINEPATH/unitTest/runTest.e

if [ -f $SSDSPIPELINEPATH/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssPipeline.done ]; then
    echo "SSDS pipeline from FASTQ.GZ successful !!"
else
	echo "**** FAIL **** SSDS pipeline from FASTQ.GZ did not run correctly !!" 
	exit 99
fi

## TEST 3: Using paired-end BAM file as input
$SSDSPIPELINEPATH/run_ssDNAPipeline \
 --g testGenome \
 --n 1 \
 --bam $SSDSPIPELINEPATH/unitTest/SSDSdemo.bam \
 --sample demo \
 --splitSz 1000 \
 --lane 99 \
 --date 311215 \
 --outdir $SSDSPIPELINEPATH/unitTest/output/fromBAM \
 >>$SSDSPIPELINEPATH/unitTest/runTest.o \
 2>>$SSDSPIPELINEPATH/unitTest/runTest.e

if [ -f $SSDSPIPELINEPATH/unitTest/output/fromFASTQ/SSDSdemo.testgenome.ssPipeline.done ]; then
    echo "SSDS pipeline from BAM successful !!"  
else
	echo "**** FAIL **** SSDS pipeline from BAM did not run correctly !!"  
	exit 99
fi
