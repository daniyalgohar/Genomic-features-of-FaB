#!/bin/bash
#The name of the job is assembly_job 
#SBATCH -p long
#SBATCH -J Busco
#The job requires 1 task per node
#SBATCH --mem=100GB
#The maximum walltime of the job is 7 days
#SBATCH -t 170:00:00

uname -a


source activate buscoQC

busco -i /path/to/dir/sample_data/2757320534.fna -l bacteria_odb10 -o 534qc -m genome


