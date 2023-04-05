#!/bin/bash
#The name of the job is assembly_job 
#SBATCH -p amd
#SBATCH -J ANI_ALL_1328
#The job requires 1 task per node
#SBATCH --mem=1000000
#SBATCH --ntasks=64
#The maximum walltime of the job is 7 days
#SBATCH -t 7-00:00:00
#SBATCH --mail-user=daniyal.gohar@ut.ee
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
uname -a

export OPENBLAS_NUM_THREADS=1
export JOB_CACHE=/tmp/$SLURM_JOB_ID

mkdir $JOB_CACHE
chmod 700 $JOB_CACHE
rsync -a /gpfs/space/home/gohar/pyANI/Assemblies_all/ $JOB_CACHE #Repeat for all the larger datasets

module --ignore-cache load python/3.6.3/virtenv
source activate pyani_env
mkdir /gpfs/space/home/gohar/pyANI/ANI_opti_output/$SLURM_JOB_ID 
average_nucleotide_identity.py -i $JOB_CACHE -o /gpfs/space/home/gohar/pyANI/ANI_output_1328/$SLURM_JOB_ID -f --noclobber -m ANIb -g --gformat png,pdf,eps

rm -rf $JOB_CACHE  #Clean data after run
