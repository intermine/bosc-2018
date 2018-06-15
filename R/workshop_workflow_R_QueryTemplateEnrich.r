
library(InterMineR)

im <- initInterMine(mine=listMines()["HumanMine"], token="S106G3rfG927hfu3E3D3")

expressedAdipose = newQuery()

adiposeConstraint1 = setConstraints(
  paths = c("AtlasExpression.condition",
            "AtlasExpression.pValue", "AtlasExpression.expression"),
  operators = c("=", "<=", "="),
  values = list(c("adipose tissue"), "0.01", "UP")
)


expressedAdipose = setQuery(
  select = c("AtlasExpression.gene.symbol",
             "AtlasExpression.condition", 
             "AtlasExpression.expression", 
             "AtlasExpression.pValue", 
             "AtlasExpression.tStatistic", 
             "AtlasExpression.dataSets.name"
  ),
  orderBy = list(c(AtlasExpression.gene.symbol = "ASC")),
  where = adiposeConstraint1
)


query_results <-  runQuery(im = im, qry = expressedAdipose)

head(query_results)

genes <- query_results[,"AtlasExpression.gene.symbol"]

head(genes)

q = getTemplateQuery(im, 'geneInteractiongene')

interactAdiposeConstraint = setConstraints(
  paths = c("Gene",
            "Gene.interactions.participant2.symbol", "Gene.interactions.participant2.organism.shortName", "Gene.organism.shortName"),
  operators = c("LOOKUP", "=", "=", "="),
  values = list(c("PPARG"), c(genes), c("H. sapiens"), c("H. sapiens"))
) 


interactAdiposeQuery = setQuery(
  select = q$select,
  where = interactAdiposeConstraint
) 


query_results2 <- runQuery(im = im, qry = interactAdiposeQuery)

head(query_results2) 

interactors <- query_results2[, "Gene.interactions.participant2.symbol"]

human.widgets = as.data.frame(getWidgets(im))
head(human.widgets)

subset(human.widgets, widgetType == 'enrichment' & targets == "Gene")

GO_enrichResult = doEnrichment(
  im = im,
  ids = interactors,
  widget = "go_enrichment_for_gene"
  # organism = "Homo sapiens" # optional if results from more than one organism are retrieved
)


head(GO_enrichResult$data)

library(GeneAnswers)

geneanswer_object = convertToGeneAnswers(
  enrichmentResult = GO_enrichResult, 
  geneInput = data.frame(GeneID = as.character(interactors), 
                             stringsAsFactors = FALSE),
  geneInputType = "Gene.symbol",
  annLib = 'org.Hs.eg.db',
  categoryType = "GO.MF"
  #enrichCategoryChildName = "Gene.goAnnotation.ontologyTerm.parents.identifier"
)


summary(geneanswer_object)

geneAnswersChartPlots(geneanswer_object, 
                      chartType='pieChart',
                      sortBy = 'correctedPvalue',
                      top = 5)

geneAnswersChartPlots(geneanswer_object, 
                      chartType='barPlot',
                      sortBy = 'correctedPvalue',
                      top = 5)


geneAnswersConceptNet(geneanswer_object, 
                      colorValueColumn=NULL,
                      centroidSize='correctedPvalue', 
                      output='interactive',
                      catTerm = FALSE,
                      catID = FALSE,
                      showCats = 1:3)

