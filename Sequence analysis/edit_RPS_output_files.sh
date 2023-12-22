#!/bin/bash
#The name of the job is assembly_job 
#SBATCH -p amd
#SBATCH -J edifiles
#The job requires 1 task per node
#SBATCH --ntasks=8
#SBATCH --mem=80000
#The maximum walltime of the job is 7 days
#SBATCH -t 170:00:00


# tag proteins with their origin/sample names
#Add $filename string to the first column

	#Run in the folder where all you *.out files are located
	# ./edit_out_files.sh
	#Output file name is $file.edit.txt in the 'edited_outs' folder


#make directory for outputs
mkdir -p edited_RPS_results

#loop through *.tsv files and add filename sting at the beginning of each file
for file in *.tsv; do
	filename=$(basename $file | sed -e 's/.genes.tsv//g')
	sed -e "s/^/$filename\./" $file > edited_RPS_results/$filename.edit.tsv
done


