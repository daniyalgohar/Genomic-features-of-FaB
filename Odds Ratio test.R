
# Odds ratio


kegg_table2=cbind(data.frame(taxon_oid=rownames(RPS_cogs_table)),RPS_cogs_table)

merged_df <- merge(Metadata_F[,c(2,11)],kegg_table2,  by= "taxon_oid")
# Change matrix to presence absence data
metacols=merged_df %>% mutate(Aquatic = ifelse(Ecosystem.Category == "Aquatic", 1, 0), 
                              Fungi = ifelse(Ecosystem.Category == "Fungi", 1, 0),
                              Soil = ifelse(Ecosystem.Category == "Soil", 1, 0),
                              Plants = ifelse(Ecosystem.Category == "Plants", 1, 0),
                              Human = ifelse(Ecosystem.Category == "Human", 1, 0)) %>% 
  select(Aquatic, Fungi, Soil, Plants, Human)

metacols=as.data.frame(metacols)
merged_df=cbind(metacols,merged_df)

rownames(merged_df)=merged_df$taxon_oid
merged_df=merged_df[,-c(6,7)]


library(epiR)
library(epitools)


# Create an empty list to store the results
results_df_p <- data.frame(gene = character(), odds_ratio = numeric(), p_value = numeric(), env=character())

# Loop through each gene column in the data
for (i in 6:ncol(merged_df)) {
  # Extract the gene name and binary variable for the gene
  for (j in colnames(merged_df[,1:5])) {
    
    
    gene <- colnames(merged_df)[i]
    gene_var <- merged_df[,i]
    envo=merged_df[,j]
    
    # Calculate the odds ratio for the gene
    odds_ratio <- oddsratio(gene_var, envo, method = "fisher")
    
    # Extract the odds ratio and p-value from the results
    
    p_value <- odds_ratio$p.value[2, "fisher.exact"]
    odds=odds_ratio$measure[2, "estimate"]
    env=j
    # Store the results in a list
    
    results_df_p <- rbind(results_df_p, data.frame(gene, odds, p_value, env))
  }
}
# apply FDR  on p values and filter only significant
results_df_p= results_df_p %>% filter(!odds=="Inf", ) %>% 
  mutate(fdr_P_val=p.adjust(p_value, method = "fdr")) %>% 
  filter(fdr_P_val<0.05) %>% 
  group_by(gene) %>% 
  mutate(num_env =n()) %>% 
  arrange(desc(num_env))
