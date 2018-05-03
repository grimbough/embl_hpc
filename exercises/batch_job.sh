#!/bin/bash
#SBATCH --mem=150

srun ./hpc_example.py -t 40 -l 2000

srun --mem=3000 ./hpc_example.py -t 30 -l 80000000

