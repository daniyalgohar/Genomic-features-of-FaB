#!/bin/bash
#The job should run on the main partition
#SBATCH -p amd
#The name of the job is assembly_job
#SBATCH -J db
#The job requires 1 compute node
#SBATCH -N 1
#The job requires 1 task per node
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10000
#The maximum walltime of the job is 7 days
#SBATCH -t 170:00:00
uname -a
module load any/python/3.8.3-conda
./eggnogmapperMain/create_dbs.py --dbname eggnog_proteins.bact --taxids 2 --data_dir ./eggnogmapperMain/data -y