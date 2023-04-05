#!/bin/bash
#The name of the job is assembly_job 
#SBATCH -p amd
#SBATCH -J UBCG
#The job requires 1 task per node
#SBATCH --mem=700000
#SBATCH --ntasks=64
#The maximum walltime of the job is 7 days
#SBATCH -t 7-00:00:00
#SBATCH --mail-user=daniyal.gohar@ut.ee
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

module load hmmer
module load prodigal
module load mafft
module load fasttree
module load raxml
module load openjdk/1.8.0_265-b01

for file in /gpfs/space/home/gohar/pyANI/1206_assemblies/*{.fna,.fa}; do
java -jar UBCG.jar extract -bcg_dir bcg -i $file -label $file -taxon $file

done

