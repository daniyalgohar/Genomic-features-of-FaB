#!/bin/bash

# Set the input directory and output directory
input_directory="/Path/to/fasta/files/"
output_directory="/Path/to/output/directory/"
output_file="$output_directory/Genome_stats.txt"

# Create an empty output file with header
echo -e "Genome_id\tGene_counts\tGenome_size_bp\tGenome_size_MB\tGC_content" > "$output_file"

# Loop through all fasta files in the input directory
for input_file in "$input_directory"/*.fasta; do
    # Get the genome ID (filename without extension)
    genome_id=$(basename "$input_file" .fasta)

    # Run Prodigal and count the genes
    prodigal_output="temp_output.gbk"


    # Redirect Prodigal output to a temporary file and capture information
    prodigal -i "$input_file" -o "$prodigal_output" 

    # Count the genes
    num_genes=$(grep -c "^\s*CDS\s" "$prodigal_output")
   # Calculate genome size (number of base pairs)
    genome_size=$(grep -v '>' "$input_file" | tr -cd 'ATGC' | wc -m)

    # Calculate GC content
    gc_content=$(grep -v '>' "$input_file" | tr -cd 'GC' | wc -m)

    # Calculate genome size in megabasepairs
    genome_size_mb=$(awk "BEGIN { printf \"%.2f\", $genome_size / 1000000 }")

    # Calculate and print the percentage of GC content
    if [ "$genome_size" -gt 0 ]; then
        gc_percentage=$(awk "BEGIN { printf \"%.1f\", ($gc_content / $genome_size) * 100 }")
    else
        gc_percentage=0
    fi
   
    # Append the result to the output file
    echo -e "$genome_id\t$num_genes\t$genome_size\t$genome_size_mb\t$gc_content\t$gc_percentage" >> "$output_file"

    # Remove the temporary Prodigal output file
    rm "$prodigal_output" 

    # Print a message indicating the completion of the process for each genome
    echo "Gene counting and statistics completed for $genome_id."
done

# Print a message indicating the completion of the loop
echo "All gene counting and statistics completed. Results saved in $output_file."




