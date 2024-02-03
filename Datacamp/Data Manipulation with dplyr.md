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
### The count verb
One way we can aggregate data is to count it: to find out the number of observations. 
The dplyr verb for this is count(). <br>
The sort function: Sort=TRUE can be added to the count function to sort the aggregated data in descending order. <br>
The weight function: wt=var means that the n column will be weighted by the var specified
```
counties_selected <- counties %>%
  select(county, region, state, population, citizens)
~ Use count to find the number of counties in each region
counties_selected %>%
count(region,sort=TRUE)

~ Find number of counties per state, weighted by citizens, sorted in descending order
counties_selected %>%
  count(state,wt=citizens,sort=TRUE)

~ Add population_walk containing the total number of people who walk to work 
mutate (population_walk=(population*walk)/100)%>%
~ Count weighted by the new column, sort in descending order.
Use a (weighted and sorted) count() to find the total number of people who walk to work in each state.
  count(state,wt=population_walk,sort=TRUE)
```
### The group_by, summarize, and ungroup verbs
****summarise ()**** <br>
The summarize verb takes many observations and turns them into one observation <br>
Functions we can use in summarize(), such as median(), min() for minimum, max() for maximum, and n() for the size of the group. <br>
****group_by ()**** <br>
Groups cases by common values of one or more columns<br>
****ungroup()****<br>
Removes grouping criteria from a data frame
```
counties_selected <- counties %>%
  select(county, population, income, unemployment)
counties_selected %>%

~ Summarize to find minimum population, maximum unemployment, and average income
  summarise(min_population=min(population), max_unemployment=max(unemployment),average_income=mean(income))

~ Group the data by state, and summarize to create the columns total_area (the total land_area in square miles) and total_population (with total population)
counties_selected <- counties %>%
  select(state, county, population, land_area)

counties_selected %>%
~ Group by state 
  group_by(state)%>%
~ Find the total area and population
  summarize(total_area=sum(land_area),total_population=sum(population))

~ Add a density column containing the total population per square mile, using the columns you already created, then arrange in descending order.
~ Add a density column
  mutate(density=total_population/total_area)%>%
~ Sort by density in descending order
  arrange(desc(density))

counties_selected <- counties %>%
  select(region, state, county, population)

~ Summarize to find the total population, as a column called total_pop, in each combination of region and state, grouped in that order.
counties_selected %>%
~ Group and summarize to find the total population
group_by(region,state)%>%
summarize(total_pop=sum(population))

~ Notice the tibble is still grouped by region; use another summarize() step to calculate two new columns: the average state population in each region (average_pop) and the median state population in each region (median_pop)

 group_by(region, state) %>%
  summarize(total_pop = sum(population)) %>%
~ Calculate the average_pop and median_pop columns 
  summarize(average_pop=mean(total_pop),
  median_pop=median(total_pop))
```

### The slice_min and slice_max verbs
dplyr's slice_min and slice_max verbs allow us to extract the most extreme observations from each group <br>
****slice_max()**** <br>
operates on a grouped table, and returns the largest observations in each group. <br>
```slice_max(var,n)``` <br>
- var:the column we want to base the ordering on
- n: number of observation  to extract <br>
****slice_min()****  <br>
returns the smallest observations in each group <br>
```slice_min(var,n)``` <br>
- var:the column we want to base the ordering on
- n: number of observation  to extract <br>

```
counties_selected <- counties %>%
  select(region, state, county, metro, population, walk)

~ Find the county in each region with the highest percentage of citizens who walk to work
counties_selected %>%
~ Group by region
group_by(region)%>%
~ Find the county with the highest percentage of people who walk to work
  slice_max(walk,n=1)

counties_selected <- counties %>%
  select(region, state, county, population, income)

~Calculate the average income (as average_income) of counties within each region and state.
Find the state with the lowest average income in each region.
counties_selected %>%
  group_by(region, state) %>%
~ Calculate average income
  summarize(average_income=mean(income))%>%
~ Find the lowest income state in each region
  slice_min(average_income,n=1)

counties_selected <- counties %>%
  select(state, metro, population)
~ For each combination of state and metro, find the total population as total_pop
counties_selected %>%
    ~ Find the total population for each combination of state and metro
  group_by(state,metro)%>%
  summarize(total_pop=sum(population))


~ Extract the most populated row from each state, which will be either Metro or Nonmetro.
   ~ Extract the most populated row for each state
%>% from above
  slice_max(total_pop,n=1)

~ Ungroup, then count how often Metro or Nonmetro appears to see how many states have more people living in those areas.
%>% from above
    ~ Count the states with more people in Metro or Nonmetro areas
  ungroup()%>%
  count(metro)
```
# Selecting and Transforming Data
The select function helps to select columns from a dataset <br>
To discover more about select helpers, check out the dplyr select helpers documentation, using question mark-select_helpers 
- Select a range  <br>
Can be used to select range of columns using the: between-the-column ranges <br>
### Select helpers
select helpers take strings, which must be specified using quotes <br>
- Contain  <br>
Used for selecting columns that a particular word <br>
- starts_with <br>
to select only the columns that start with a particular prefix 
- ends_with <br>
which finds columns ending in a string
- last_col <br>
which grabs the last column 
- matches <br>
which selects columns that have a specified pattern.
```
- Use glimpse() to examine all the variables in the counties table.
- Select the columns for state, county, population, and (using a colon) all five of those
industry-related variables; there are five consecutive variables in the table related to the
industry of people's work: professional, service, office, construction, and production.
- Arrange the table in descending order of service to find which counties have the highest rates of working in the service industry.

~ Glimpse the counties table
glimpse(counties)

counties %>%
~ Select state, county, population, and industry-related columns
  select(state,county,population,professional:production)%>%
~ Arrange service in descending order 
  arrange(desc(service))

- Select the columns state, county, population, and all those that end with work.
- Filter just for the counties where at least 50% of the population is engaged in public work.
counties %>%
~ Select the state, county, population, and those ending with "work"
  select(state, county, population,ends_with("work"))%>%
~ Filter for counties that have at least 50% of people engaged in public work
filter(public_work >=50)
```
### The rename verb
rename () is used to rename the variable to a desired name. <br>
The new column name goes on the left, and the old column name goes on the right. <br>
<br>
****Renaming from select statement**** <br>
this is done after the original name on the dataset is called with the select statement and an = sign is placed in front to apply  the new name e.g unemployment=unemployement_rate
*The difference between select and rename. In select we need to name all the columns you want to keep along with renaming one or more of them. With rename, we can just pick one column whose name you want to change*

```
-Use count() to determine how many counties are in each state
counties %>%
~ Count the number of counties in each state
    count(state)
-Notice the n column in the output; use rename() to rename that to num_counties
%>% from above
~ Rename the n column to num_counties
  rename(num_counties=n)

~ Select the columns state, county, and poverty from the counties dataset; in the same step, rename the poverty column to poverty_rate

counties %>%
  select(state, county,poverty_rate=poverty)
```

### The relocate verb
The relocate verb is used to change column positions using a quick and efficient syntax
- ****Relocating to .before**** <br>
To specify the column we wish to move as the first argument
-  *****Relocating to .after**** <br>
relocate also has a dot-after argument for specifying that a column should be moved to after another column
#### relocate() + select helpers
We can also combine relocate with the select helpers
```
- Move the density column to the end of the tibble.
- Move the population column to before the land_area column.

counties_selected %>%
  ~ Move the density column to the end
  relocate(density,.after=last_col())%>%
  ~ Move the population column to before land_area
  relocate(population,.before=land_area)

~ Change the name of the unemployment column
counties %>%
  rename(unemployment_rate = unemployment)

~ Keep the state and county columns, and the columns containing poverty
counties %>%
  select(state, county, contains("poverty"))

~ Calculate the fraction_women column without dropping the other columns
counties %>%
  mutate(fraction_women = women / population)

~ Move the region column to before state
counties %>%
relocate(region, .before = state)
```

# Babyname Dataset Exploration
### Filter for multiple
To apply filter for multiple observation within a column use %in% and pass the conditions
```
babynames %>%
  ~ Filter for the year 1990
  filter(year==1990)%>%
  ~ Sort the number column in descending order 
  arrange(desc(number))

~ Find the most common name in each year
  group_by(year)%>%
  slice_max(number,n=1)

~ Filter for the names Steven, Thomas, and Matthew 
selected_names <- babynames %>%
  filter(name %in% c("Steven", "Thomas", "Matthew"))
  ~ Plot the names using a different color for each name
ggplot(selected_names, aes(x =year , y = number, color =name)) +
  geom_line()

```

### Group mutate 
The group_by is applied first after which the argument is passed to a mutate to create a new variable based on the grouping variable (s)
- *****ungroup**** <br>
is applied after a group_by to remove the grouping condition for further usage of the dataset for other manipulation

```
- First, calculate the total number of people born in that year in this dataset as year_total.
- Next, use year_total to calculate the fraction of people born in each year that have each name.

~ Calculate the fraction of people born each year with the same name
babynames %>%
  group_by(year) %>%
  mutate(year_total=sum(number)) %>%
  ungroup() %>%
  mutate(fraction = number/year_total)

- Now use your newly calculated fraction column, in combination with slice_max(), to identify the year each name was most common.
%>% from  above
  ~ Find the year each name is most common
 group_by(name) %>%
  slice_max(fraction, n = 1)

Use a grouped mutate to add two columns:
- name_total: the sum of the number of babies born with that name in the entire dataset.
- name_max: the maximum number of babies born with that name in any year.

babynames %>%
  ~ Add columns name_total and name_max for each name
  group_by(name)%>%
  mutate(name_total=sum(number), name_max=max(number))

- Add another step to ungroup the table.
- Add a column called fraction_max containing the number in the year divided by name_max.
%>% from above
 ~ Ungroup the table 
ungroup%>%
  ~ Add the fraction_max column containing the number by the name maximum 
 mutate(fraction_max=number/name_max)


- Filter the names_normalized table to limit it to the three names Steven, Thomas, and Matthew.
- Create a line plot from names_filtered to visualize fraction_max over time, colored by name

names_normalized <- babynames %>%
                     group_by(name) %>%
                     mutate(name_total = sum(number),
                            name_max = max(number)) %>%
                     ungroup() %>%
                     mutate(fraction_max = number / name_max)

names_filtered <- names_normalized %>%
  ~ Filter for the names Steven, Thomas, and Matthew
 filter(name %in% c("Steven","Thomas","Matthew"))

~ Visualize the names in names_filtered over time
ggplot(names_filtered,aes(x=year,y=fraction_max,color=name))+
geom_line()
````

### Window functions
The window function. A window function takes a vector, and returns another vector of the same length.
##### lag ()
 A window function takes a vector, and returns another vector of the same length
```
v <- c(1,3,6,14)
lag(v)
output NA 1 3 6
```
Now the first item is NA, meaning it's missing, but it's followed by 1, 3, and 6: the item just prior to it in the original vector.

#### Comparing consecutive steps 
By lining up each item in the vector with the item directly before it, we can compare consecutive steps and calculate the changes
```
v-lag(v)
output
NA  2  3  8
```

```
babynames_fraction %>%
  ~ Arrange the data in order of name, then year 
arrange(name,year) %>%
  ~ Group the data by name
group_by(name)%>%
  ~ Add a ratio column that contains the ratio of fractions between each year 
 mutate(ratio=fraction/lag(fraction))


babynames_ratios_filtered <- babynames_fraction %>%
                     arrange(name, year) %>%
                     group_by(name) %>%
                     mutate(ratio = fraction / lag(fraction)) %>%
                     filter(fraction >= 0.00001)
babynames_ratios_filtered %>%
  ~ Extract the largest ratio from each name 
  slice_max(ratio,n=1)%>%
  ~ Sort the ratio column in descending order 
  arrange(desc(ratio))%>%
  ~ Filter for fractions greater than or equal to 0.001
  filter(fraction>=0.001)
```



