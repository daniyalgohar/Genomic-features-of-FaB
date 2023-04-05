#!/bin/bash
#The name of the job is assembly_job 
#SBATCH -p amd
#SBATCH -J CheckM_MIB
#The job requires 1 task per node
#SBATCH --mem=200GB
#The maximum walltime of the job is 7 days
#SBATCH -t 170:00:00
#SBATCH --mail-user=daniyal.gohar@ut.ee
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --ntasks=64
uname -a


source activate checkm

checkm lineage_wf /path/to/directory/gohar/Metagenome/Filtered_Assemblies/ -x .fa /path/to/directory/gohar/CheckM/MIB_results/ -t 32

