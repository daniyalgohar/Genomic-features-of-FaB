#!/bin/bash
#The name of the job is assembly_job 
#SBATCH -p amd
#SBATCH -J dbcan
#The job requires 1 task per node
#SBATCH --ntasks=64
#SBATCH --mem=80000
#The maximum walltime of the job is 7 days
#SBATCH -t 170:00:00
#SBATCH --mail-user=daniyal.gohar@ut.ee
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

#CONDA_PATH=$(conda info | grep -i 'base environment' | awk '{print $4}')
#source $CONDA_PATH/etc/profile.d/conda.sh
#
#conda init bash
#module load python/3.8

module load any/python/3.8.3-conda
module load parallel
conda activate run_dbcan
run_dbcan 2802429606.genes.faa protein --out_dir output_p4 
