# Bioinformatics Analysis Scripts
The scripts presented in this resposotry were used for bioinformatic analysis including:
### Quality filtering
Trimmomtic
### Genome assembly
"Assembly_megahit.sh"

### Completeness and contamination
"BUSO_Assembly quality.sh"

"checkM_Completeness and contamination.sh"

### Genome similarity comparison to remove the redundant genomes from analysis

"Average nucleotide identity_pyANI.sh"

### Annotation
Initially, we utilized the Eggnog pipeline to annotate the 51 isolates in our study. However, to ensure a homogeneous method of genome annotation, we subsequently employed DOE-JGI Microbial Genome Annotation Pipeline (MGAP) pipeline,which is integrated in JGI/IMG, for annotating all of the genomes.

"download_eggnog_db.sh"

"create_eggnog_db.sh"

"Eggnogmapper_annotation.sh"

and

"RPS_methods_readme.txt" (Read for detailed methods to run the RPS blast and to edit the output files)

"rpsblast_parallel.sh"

"edit_RPS_output_files.sh"

and

"dbcan_CAZyme.sh" (Carbohydrate active enzyme analysis using the dbcan pipeline)

### Phylogenetic analysis
"Phylogenetic_UBCG_pipeline.sh"

"muscle_ Seq alignment.sh"



