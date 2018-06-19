#setlibrary
library(InterMineR)
# 1.show all mines
listMines()
im<-initInterMine(listMines()["HumanMine"])
listDatasets(im)
getRelease(im)

# 2.show all templates
getTemplates(im)

# 3.display given template
template <- getTemplateQuery(im, "Gene_Orth")
template

# 4. run it
head(runQuery(im, template))

# 5 Update the gene constraint and run the template again
template$where = setConstraints(
  modifyQueryConstraints = template,
  m.index = 1,
  values = list("ABO")
)
head(runQuery(im, template))
# OR modify directly the value of the first constraint from the list query
# template$where[[1]]$value="ABO"


# 6 add a new constraint
newConstraint <- list(
  path=c("Gene.homologues.homologue.organism.shortName"),
  op=c("!="), 
  value=c("H. sapiens"), 
  code=c("B")
)
template$where[[2]] <- newConstraint
head(runQuery(im, template))

#. 7 add a new column
query = setQuery(
  inheritQuery = template,
  select = c(template$select, 
             "Gene.homologues.dataSets.name")
)

getSelect(query)
head(runQuery(im, query))

#OR
template$select[[6]] <- "Gene.homologues.dataSets.name"
template$select[[7]] <- "Gene.homologues.dataSets.url"
template$select
head(runQuery(im, template))
