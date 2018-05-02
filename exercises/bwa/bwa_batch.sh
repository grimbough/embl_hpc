#!/bin/bash
#SBATCH -t 00:15:00
#SBATCH --mem=150
#SBATCH --nodes=1

## copy data to /scratch and change directory
cp reference.fa reads.txt $SCRATCHDIR && cd $SCRATCHDIR

## create an index
bwa index reference.fa

## perform alignment
bwa aln -I reference.fa reads.txt > out.sai

## create SAM file
bwa samse reference.fa out.sai reads.txt > out.sam

## copy results back
cp out.sam $HOME/embl_hpc/exercises/bwa/
