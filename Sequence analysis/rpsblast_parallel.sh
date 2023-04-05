#!/bin/bash
#The name of the job is assembly_job 
#SBATCH -p amd
#SBATCH -J rps_testRun
#The job requires 1 task per node
#SBATCH --ntasks=64
#SBATCH --mem=200000
#The maximum walltime of the job is 7 days
#SBATCH -t 170:00:00
#SBATCH --mail-user=daniyal.gohar@ut.ee
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
module load parallel

ls *.faa | parallel -a - /path/to/directory/gohar/RPS_Blast/ncbi-blast-2.12.0+/bin/rpsblast -query {} -db /path/to/directory/gohar/RPS_Blast/ncbi-blast-2.12.0+/Cog_db/Cog -evalue 0.01 -qcov_hsp_perc 70 -outfmt 6 -out {.}.tsv -num_threads 8
