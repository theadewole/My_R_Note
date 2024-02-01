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
***Filtering for conditions***
```
counties_selected <- counties %>%
  select(state, county, population)

~ Filter for counties with a population above 1000000
counties_selected %>%
filter(population >= 1000000)

~ Filter for counties with a population above 1000000
counties_selected %>%
  filter(population>=1000000,state=="California")
```
***Filtering and arranging***
```
counties_selected <- counties %>%
  select(state, county, population, private_work, public_work, self_employed)

~ Filter for Texas and more than 10000 people; sort in descending order of private_work
counties_selected %>%
~ Filter for Texas and more than 10000 people
  filter(state=="Texas",population>=10000) %>%
~ Sort in descending order of private_work
  arrange(desc(private_work))
```
###  The mutate() verb
We can use the mutate() verb to add new variables or change existing variables.
- Specifying dot-keep equals "none" means that any column not included in mutate() is discarded (...., .keep="none"), and at such the mutate function works as a select statement
```
counties_selected <- counties %>%
  select(state, county, population, public_work)

~ Add a new column public_workers with the number of people employed in public work
counties_selected %>%
mutate(public_workers=public_work*population/100)%>%
~ Sort in descending order of the public_workers column
  arrange(desc(public_workers))

~ Select the columns state, county, population, men, and women
counties_selected <- counties %>%
  select(state, county, population, men,women)

~ Calculate proportion_women as the fraction of the population made up of women
counties_selected %>%
  mutate(proportion_women=women/population)
```
***Using the .keep=none with the mutate function***
```
counties %>%
~ Keep state, county and add proportion_men
  mutate(state, county,population,proportion_men=men/population,.keep="none")%>%
~ Filter for population of at least 10,000
  filter(population>=10000)%>%
~ Arrange proportion of men in descending order 
  arrange(desc(proportion_men))
```
# Aggregating Data
