# Intro

Teaching material used during the High Performance Computing session of the EMBL Software Carpentry course.

# Commands

Below are most of the commands used during the practical, so they can be copy/pasted, but I highly recommend typing along if you can.

## Identifying our computer

```
hostname
```

## Our first SLURM job

```
srun hostname
```

## Exploring our example program

```
cd $HOME/embl_swc_hpc/exercises
./hpc_example.py -t 10 -l 100
```

## Running example program on on the cluster

```
srun ./hpc_example.py -t 10 -l 100
```

## Running in the background

```
sbatch ./hpc_example.py -t 10 -l 100
```

## Redirecting output

```
sbatch --output=output.txt ./hpc_example.py -t 20 -l 100
```

## Creating a larger list

```
sbatch --output=output.txt ./hpc_example.py -t 30 -l 5000000
```

## Displaying details of our cluster queue

```
scontrol show partition
```

## Requesting more resources

```
sbatch --mem=250 \
--output=output.txt \
./hpc_example.py -t 30 -l 5000000
```

## Requesting a lot more resources

```
sbatch --mem=8000 \
--output=output.txt \
./hpc_example.py -t 120 -l 5000000
```

## Running interactive jobs
```
srun --pty bash
```

## Interactive job with more memory
```
srun --mem=250 --pty bash
```

## Using `sbatch` instead

```
sbatch batch_jobs.sh
```

## Using job dependencies to build pipelines

```
jid=$(sbatch --parsable batch_job.sh)

sbatch --dependency=afterok:$jid batch_job.sh
```
