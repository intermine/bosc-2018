# Practical exercises

## Getting started

 - [Workshop workflow](https://mybinder.org/v2/gh/yochannah/intermine-ws-python-docs/empty-tutorial?filepath=unsolved-exercises/Workshop_Workflow1.ipynb) - replicate the UI usecase via the API. [![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/yochannah/intermine-ws-python-docs/empty-tutorial?filepath=unsolved-exercises/Workshop_Workflow1.ipynb)

## Exercises: Looking at ways to:
1. Find which InterMine has _your_ preferred organisms [![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/yochannah/intermine-ws-python-docs/empty-tutorial?filepath=00-tutorial.ipynb)
2. Create queries [![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/yochannah/intermine-ws-python-docs/empty-tutorial?filepath=01-tutorial.ipynb)
3. Constrain queries [![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/yochannah/intermine-ws-python-docs/empty-tutorial?filepath=02-tutorial.ipynb)
4. Save lists to the server [![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/yochannah/intermine-ws-python-docs/empty-tutorial?filepath=09-tutorial.ipynb)
5. Get enrichment statistics over lists [![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/yochannah/intermine-ws-python-docs/empty-tutorial?filepath=10-tutorial.ipynb)
6. Use templates - canned queries - to answer common questions quickly. [![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/yochannah/intermine-ws-python-docs/empty-tutorial?filepath=07-tutorial.ipynb)



## Advanced things to try

These are optional challenges that can be attempted if you complete the tutorials ahead of everyone else!

Can you...

- Coax [disease expression data](https://github.com/intermine/intermine-ws-python-docs/blob/master/Workshop_Workflow1.ipynb) into a pandas dataframe, and then into a bar chart that plots the expression?
  - notes: `query.rows()` returns an iterator - you'll need to add all the results to a dictionary or list first, and _then_ create the dataframe
