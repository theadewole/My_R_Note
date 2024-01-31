The dplyr package is one of several packages included in the Tidyverse collection. 
dplyr provides a ton of functionality to quickly manipulate and transform datasets.
# Transforming Data with dplyr
## glimpse ()
The glimpse() function can be used to view the first few values from each variable, along with the data type,
which is a useful first step in understanding the data <br>
**Creating a new table** <br>
Sometimes, we want to keep the data we've selected for use further down the line. We can use assignment to store 
this new table. Recall that we assign objects to variables using the arrow operator, written as "less than dash".
```
~ Take a look at the counties dataset, What is the first value in the income variable
glimpse(counties)
~ Select the columns
counties %>%
  select(state,county,population,poverty)
```
### The filter and arrange verbs
***Arranging observations***
```
counties_selected <- counties %>%
  select(state, county, population, private_work, public_work, self_employed)

~ Add a verb to sort in descending order of public_work
counties_selected %>%
  arrange(desc(public_work))
```
