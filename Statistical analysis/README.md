## Gene enrichment patterns across habitats
### PhyloLM
The "Gene enrichment analysis.R" script is an R script designed to analyze gene gene enrichment patterns. It takes as input a gene count matrix,
a metadata table, and a phylogenetic tree. The script first applies a scaling transformation to the gene counts. The script then runs a model for 
each gene against each habitat, automatically processing the enrichments across habitats. It predicts the enrichment scores of each gene for each
habitat which can further be used to visualize the patterns.

## Habitat associated genes
### Hypergeometric tests
The "Hypergeometric test.R" script takes as input a gene matrix (including both gene copy number and presence/absence data) and a metadata table. The script compares the association of individual genes based on their copy number or presence/absence across different habitats. Users can define the two groups for comparison, such as fungi-associated vs. all others, for each habitat individually (also described in the script). The script analyzes whether certain genes are significantly associated with fungi or other habitats combined. However, in this case, the script is only provided for fungi-associated genes. It provides a table as output that shows each gene's enrichment or depletion scores based on both copy number and binary versions, as well as their corresponding p-values. 

### Odds Ratio test
The "Odds Ratio test.R" script uses both metadata and gene copy number data to assess the association between gene occurrence and different habitats. The script first converts the gene copy number matrix into a presence/absence data format. It then calculates the odds of a gene occurring in one habitat while considering its presence or absence in other habitats. The script generates a table that shows the  Fisher exact's estimates and p-values for each gene and habitat combination. The p-values are further corrected using the False Discovery Rate (FDR) correction method.
