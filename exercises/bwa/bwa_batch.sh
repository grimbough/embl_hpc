#!/bin/bash
#SBATCH --mem 150
#SBATCH --nodes 8

## create an index
bwa index reference.fa

## perform alignment
bwa aln -I reference.fa reads.txt > out.sai

## create SAM file
bwa samse reference.fa out.sai reads.txt > out.sam
