allgenes_hyp_ecocat=function(genes,Map){
  
  # For habitats individually, the function was modified by replacing "Fungi" with the some other habitat vice versa
  N.fa <- sum(genes[ Map$Ecosystem.Category == "Fungi", ])
  N.nfa <- sum(genes[ Map$Ecosystem.Category != "Fungi", ])
  
  Res <- NULL
  for(gene in 1:ncol(genes)){
    
    gene.id <- colnames(genes)[gene]
    Map$gene <- genes[,gene]
    
    
    # Enrichment- binary version
    pval <- phyper(q = nrow(subset(Map, Ecosystem.Category == "Fungi" & gene > 0)) - 1,
                   m = sum(Map$gene > 0),
                   n = nrow(subset(Map,gene == 0)),
                   k = nrow(subset(Map, Ecosystem.Category == "Fungi")),lower.tail=FALSE)
    #pval <- 1 - pval
    #pval[ pval == 0 ] <- 1e-16
    score <- -log10(pval)
    
    pval2 <- phyper(q = sum(subset(Map, Ecosystem.Category == "Fungi")$gene) - 1, 
                    m = N.pa, n = N.npa, k = sum(Map$gene),lower.tail=FALSE)
    
    
    # Depletion- binary version 
    pval_dep <- phyper(q = nrow(subset(Map, Ecosystem.Category == "Fungi" & gene > 0)),
                       m = sum(Map$gene > 0),
                       n = nrow(subset(Map,gene == 0)),
                       k = nrow(subset(Map, Ecosystem.Category == "Fungi")),
                       lower.tail=TRUE)
    
    score_dep<--log10(pval_dep)
    
    #Test for depletion Raw counts version 
    pval2_dep <- phyper(q = sum(subset(Map, Ecosystem.Category == "Fungi")$gene),
                        m = N.pa, n = N.npa, k = sum(Map$gene),lower.tail=TRUE)
    #pval2_dep[ pval2_dep == 0 ] <- 1e-16
    score2_dep<--log10(pval2_dep)
    
    
    
    #res <- data.frame(gene.id = gene.id, score = score, p.value = pval,
    #                  full.score = -log10(pval2), full.p.value = pval2)
    res <- data.frame(gene.id = gene.id, score_enriched_binary = score, p.value_enriched_binary = pval,
                      score_depletion_binary=score_dep,p.value_depletion_binary=pval_dep,
                      score_enriched_rawcounts = -log10(pval2), p.value_enriched_rawcounts = pval2,
                      score_depletion_rawcounts=score2_dep,p.value_depletion_rawcounts=pval2_dep)
    
    Map$gene <- NULL
    Res <- rbind(Res,res)
  }
  
  Res<-data.frame(gene.id=Res$gene.id,score_enriched_binary=Res$score_enriched_binary,
                  z.score_enriched_binary= (Res$score_enriched_binary - mean(Res$score_enriched_binary)) / sd(Res$score_enriched_binary),
                  p.value_enriched_binary=Res$p.value_enriched_binary,
                  score_depletion_binary=Res$score_depletion_binary,
                  z.score_depletion_binary=(Res$score_depletion_binary - mean(Res$score_depletion_binary)) / sd(Res$score_depletion_binary),
                  p.value_depletion_binary=Res$p.value_depletion_binary,
                  score_enriched_rawcounts=Res$score_enriched_rawcounts,
                  z.score_enriched_rawcounts=(Res$score_enriched_rawcounts - mean(Res$score_enriched_rawcounts)) / sd(Res$score_enriched_rawcounts),
                  p.value_enriched_rawcounts=Res$p.value_enriched_rawcounts,
                  score_depletion_rawcounts=Res$score_depletion_rawcounts,
                  z.score_depletion_rawcounts=(Res$score_depletion_rawcounts - mean(Res$score_depletion_rawcounts)) / sd(Res$score_depletion_rawcounts),
                  p.value_depletion_rawcounts=Res$p.value_depletion_rawcounts)
  
  
  
  #Res <- data.frame(gene.id = Res$gene.id, score = Res$score,
  #                  z.score = (Res$score - mean(Res$score)) / sd(Res$score),
  #                  p.value = Res$p.value,
  #                  full.score = Res$full.score,
  #                  full.z.score = (Res$full.score - mean(Res$full.score)) / sd(Res$full.score),
  #                  full.p.value = Res$full.p.value)
  return(Res)
}

fungi=allgenes_hyp_ecocat(RPS_cogs_table, Metadata_F)
