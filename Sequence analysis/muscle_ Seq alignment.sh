#!/bin/bash
#The name of the job is assembly_job 
#SBATCH -p amd
#SBATCH -J UBCG
#The job requires 1 task per node
#SBATCH --mem 500GB
#SBATCH --ntasks=64
#The maximum walltime of the job is 7 days
#SBATCH -t 7-00:00:00


chmod +x muscle5.1.linux_intel64

./muscle5.1.linux_intel64 -align ./concat_codon.fasta -output aligned_codon_seqs.afa 
