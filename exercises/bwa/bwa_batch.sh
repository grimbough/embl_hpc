#!/bin/bash
#SBATCH -t 00:06:00
#SBATCH --mem=150
#SBATCH --nodes=1

## load required modules
module load SAMtools BWA

## copy data to /scratch and change directory
cp /g/huber/users/msmith/embl_hpc/Ecoli_genome.fa.gz /g/huber/users/msmith/embl_hpc/reads_*.fq.gz $SCRATCHDIR 
cd $SCRATCHDIR

## create an index
bwa index -p ecoli Ecoli_genome.fa.gz 

## perform alignment
bwa mem ecoli reads_1.fq.gz reads_2.fq.gz > aligned.sam

## create a compressed BAM file
samtools view -b aligned.sam > aligned.bam

## copy results back
cp aligned.bam $HOME/embl_hpc/exercises/bwa/
