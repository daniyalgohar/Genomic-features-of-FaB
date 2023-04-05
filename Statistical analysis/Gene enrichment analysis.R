#Phyloglm enrichment analysis.
Tab=RPS_cogs_table
Tab$taxon_oid=rownames(Tab)
Tab=data.table(Tab)
datl <- melt(data = Tab, id.vars = "taxon_oid", variable.name = "GeneID", value.name = "GeneCopyNum")

datl[ , GeneCopyNumStd := scale(GeneCopyNum), by = "GeneID" ]

datl <- merge(x = datl, y = Metadata_F, by = "taxon_oid", all.x = T)

fit_model <- function(x, output){
  # x <- datl[ GeneID %in% "COG0001" ]
  
  setDF(x)
  rownames(x) <- x$taxon_oid
  
  cat(as.character(x$GeneID[1]), " ", as.character(x$Taxa[1]), "\n")
  
  md <- try(
    phylolm(formula = GeneCopyNumStd ~ Ecosystem.Category,
            data = x,
            phy = tree ))
  
  ecocat <- unique(x$Ecosystem.Category)
  preds <- data.frame(Ecosystem.Category = ecocat)
  
  if(!"try-error" %in% class(md)){
    res <- data.frame(preds, Estimate = predict(object = md, newdata = preds))
  } else {
    res <- data.frame(preds, Estimate = NA)
  }
  return(res)
}


RES <- ddply(.data = datl, .variables =c( "Taxa","GeneID" ), .fun = fit_model, .progress = "text")