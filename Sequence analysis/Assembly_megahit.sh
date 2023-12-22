#!/bin/bash
#The job requires 1 compute node
#SBATCH -N 1
#The job requires 1 task per node
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=100000
#The maximum walltime of the job is 7 days
#SBATCH -t 170:00:00
uname -a
module load python-3.7.1
module --ignore-cache load megahit
megahit --k-min 15 --k-max 255 --k-step 2 -1 /path/to/dir/LM37/LM37_forward_paired.fq -2 /path/to/dir/LM37/LM37_reverse_paired.fq -r /path/to/dir/LM37/LM37_forward_unpaired.fq -r /path/to/dir//LM37/LM37_reverse_unpaired.fq -o /path/to/dir/LM37/LM37_megahit -t 16
