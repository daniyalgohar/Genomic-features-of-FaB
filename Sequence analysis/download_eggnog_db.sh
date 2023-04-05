#!/bin/bash
#The job should run on the main partition
#SBATCH -p amd
#The name of the job is assembly_job
#SBATCH -J down
#The job requires 1 compute node
#SBATCH -N 1
#The job requires 1 task per node
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10000
#The maximum walltime of the job is 7 days
#SBATCH -t 170:00:00
chmod g+x 
uname -a
module load any/python/3.8.3-conda
/gpfs/space/home/gohar/Metagenome/Annotation/eggnogmapperMain/download_eggnog_data.py -P -M -H -d 2 -y -f -q