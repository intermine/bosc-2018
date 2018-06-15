library(InterMineR)
# 1.show all mines
listMines()

# 2.show all templates
im<-initInterMine(listMines()["HumanMine"])
getTemplates(im)

# 3.display given template
queryGeneOrth <- getTemplateQuery(
  im = im,
  name = "Gene_Orth")
queryGeneOrth

# 4. run it
resGeneOrth <- runQuery(im, queryGeneOrth)
resGeneOrth

# 5 Update the gene constraint and run the template again
queryGeneOrth$where = setConstraints(
  modifyQueryConstraints = queryGeneOrth,
  m.index = 1,
  values = list("ABO")
)

resGeneOrth <- runQuery(im, queryGeneOrth)
resGeneOrth

# 6 add a new constraint
newConstraint <- list(
  path=c("Gene.homologues.homologue.organism.shortName"),
  op=c("!="), 
  value=c("H. sapiens"), 
  code=c("B")
)
queryGeneOrth$where[[2]] <- newConstraint
queryGeneOrth$where
resGeneOrth <- runQuery(im, queryGeneOrth)
resGeneOrth

#. 7 add a new column
queryGeneOrth.InterMineR = setQuery(
  inheritQuery = queryGeneOrth,
  select = c(queryGeneOrth$select, 
             "Gene.homologues.dataSets.name")
)

getSelect(queryGeneOrth.InterMineR)
resGeneOrth <- runQuery(im, queryGeneOrth.InterMineR)
resGeneOrth

