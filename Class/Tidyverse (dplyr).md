![image](https://github.com/theadewole/My_R_Note/assets/108795960/41a1f833-9e28-4c2b-bdfc-e3404d13d167)
![image](https://github.com/theadewole/My_R_Note/assets/108795960/839f7b56-526c-4ef8-8a63-794398500a9f)
![image](https://github.com/theadewole/My_R_Note/assets/108795960/7c1165eb-eebb-4962-aeb8-290b67d3501f)
![image](https://github.com/theadewole/My_R_Note/assets/108795960/7fe24194-92bf-4a30-bf7c-021a4bf3c0a3)
<br>
A collection of modern R packages that share common  philosophies, embed best practices, and are designed to work together <br>
``` install.packages("tidyverse")``` <br>
```library("tidyverse")``` <br>
The above R package that serves as a short cut for installing and loading the components of the tidyverse
# Transform Data with dplyr
A package that transforms data. dplyr implements a grammar for transforming tabular data
## Isolating data
- select() - extract variables
- filter() - extract cases
- arrange() - reorder cases
### select ()
```select(.data, …,!!!)``` <br>
- data: The data frame or tibble.
- ...: Columns to select. You can use variable names, ranges, functions, etc.
- !!!: Used for unquoting and splicing (allows you to pass a list of column names)
```
install.packages("tidyverse")
install.packages("babynames")
install.packages("gapminder")
install.packages("Lahman")

library(babynames)
library(dplyr)
library(gapminder)
library(Lahman)

gap <- gapminder
baby <- babynames
team <- Teams

select(babynames,name,prop)
~ Alter the code to select just the n column
select(babynames,n)
```
##### Selecting range of columns
```select(team,W:AB)```
##### Selecting every column but
```select(team,-c(W,AB,H))```
##### starts_with() - Selecting columns that start with
```starts_with(prefix, ignore.case = FALSE, vars = tidyselect::all_of(names(.)))```
- prefix: A character string representing the prefix of the column names to be selected.
- ignore.case: A logical value indicating whether the matching should be case-insensitive (default is FALSE).
- vars: Variables to consider. By default, it considers all variables in the data frame. <br>
```select(team,starts_with("W"))```
##### ends_with() - Selecting columns that end with…
```end_with(prefix, ignore.case = FALSE, vars = tidyselect::all_of(names(.)))```
- prefix: A character string representing the prefix of the column names to be selected.
- ignore.case: A logical value indicating whether the matching should be case-insensitive (default is FALSE).
- vars: Variables to consider. By default, it considers all variables in the data frame. <br>
```select(team,ends_with("D"))```
##### contains() - Selecting columns whose names contain
```contains(substring, ignore.case = FALSE, vars = tidyselect::all_of(names(.)))```
- substring: A character string representing the substring to look for in the column names.
- ignore.case: A logical value indicating whether the matching should be case-insensitive (default is FALSE).
- vars: Variables to consider. By default, it considers all variables in the data frame. <br>
```select(team,contains("A"))```
##### matches() - Selecting columns whose names match regular expression
```matches(regular_expression, ignore.case = FALSE, vars = tidyselect::all_of(names(.)))```
- regular_expression: A character string representing the regular expression pattern to match against the column names.
- ignore.case: A logical value indicating whether the matching should be case-insensitive (default is FALSE).
- vars: Variables to consider. By default, it considers all variables in the data frame. <br>
```select(team,matches("ID"))```
##### one_of() - Selecting columns whose names are one of a set
```one_of(..., vars = tidyselect::all_of(names(.)))```
- ...: A set of character vectors representing the column names to match.
- vars: Variables to consider. By default, it considers all variables in the data frame.<br>
```select(team,one_of("AB","G"))```
##### num_range() - Selecting columns named in prefix, number style
```num_range(prefix, range, width = NULL, vars = tidyselect::all_of(names(.)))```
- prefix: A character string that forms the prefix of the column names.
- range: A numeric range specified as a vector of two values.
- width: An optional argument specifying the width of numeric padding (if any).
- vars: Variables to consider. By default, it considers all variables in the data frame
```
~ Create a sample data frame
df <- data.frame(x_1 = 1:5, x_2 = 6:10, y_1 = 11:15, y_2 = 16:20)
~ Use num_range() to select columns with names matching the pattern
  select(df,num_range("x_", range = c(2, 2)))
```
### filter ()
Extract rows that meet logical criteria.
```filtered_data <- filter(data_frame, condition)``` <br>
- data_frame: The name of the data frame from which you want to filter observations.
- condition: The logical condition based on which the observations are selected.
```
filter(babynames, name == "Garrett")
```
***Logical comparism operator***
- x < y               >- Less than
- x > y               >- Greater than
- x == y              >-Equal to  
- x <= y              >-Less than or equal to
- x >= y              >-Greater than or equal to
- x != y              >- Not equal to
- x %in% y            >-Group membership
- is.na(x)            >-Is NA
- !is.na(x)           >-s not NA

```
~ All of the names where prop is greater than or equal to 0.08
filter(babynames,prop>=0.08)

~ All of the children named “Sea”
filter(babynames,name=="Sea")

~ All of the names that have a missing value for n
filter(babynames,is.na(n))

~ Filtering more than one variable
filter(babynames, name == "Garrett", year == 1880)
```
***Boolean operators***
- a & b  >- and
- a | b  >-or
- xor(a,b) >-exactly or
- !a >- not
```
~ With hand operator 
filter(babynames, name == "Garrett" & year == 1880)

~ Girls named Sea
filter(babynames,name=="Sea",sex=="F")

~ Names that were used by exactly 5 or 6 children in 1880
filter(babynames,n==5 | n==6 ,year==1880)

~ Names that are one of Acura, Lexus, or Yugo
filter(babynames,name %in% c("Acura", "Lexus", "Yugo"))
```

***Common mistakes***
```
~ Using = instead of ==
filter(babynames, name = "Sea")
filter(babynames, name == "Sea")

~ Forgetting quotes
filter(babynames, name == Sea)
filter(babynames, name == "Sea")

~ Collapsing multiple tests into one
filter(babynames, 10 < n < 20)
filter(babynames, 10 < n, n < 20)

~ Stringing together many tests (when you could use %in%)
filter(babynames, n == 5 | n == 6 | n == 7 | n == 8)
filter(babynames, n %in% c(5, 6, 7, 8))
```
### arrange ()
Order rows from smallest to largest values
```arranged_data <- arrange(data_frame, column1, column2, ...)```
```
~ Order rows from smallest to largest values.
arrange(babynames, n)

~ Arrange babynames by n. Add prop as a second (tie breaking) variable to arrange on.
arrange(babynames,n,prop)

~ Changes ordering to largest to smallest.
arrange(babynames, desc(n))

~ Use desc() to find the names with the highest prop.
arrange(babynames,desc(prop))

~ Then, use desc() to find the names with the highest n
arrange(babynames,desc(n))
```
***Combining filter arrange and select***
- Filter babynames to just boys born in 2015 
- Select the name and n columns from the result 
- Arrange those columns so that the most popular names appear near the top
```
boys_2015 <- filter(babynames, year == 2015, sex == "M")
boys_2015 <- select(boys_2015, name, n)
boys_2015 <- arrange(boys_2015, desc(n))

~ Combining
combine <- arrange(select(filter(babynames, year == 2015, 
                      sex == "M"), name, n), desc(n))
```

### The pipe operator %>%
Passes result on lef into first argument of function on right. 
```
~ the output will produce same result
filter(babynames, n == 99680)
babynames %>% filter(n == 99680)

~ using pipe to combine filter select and arrange
babynames %>%
  filter(year == 2015, sex == "M") %>%
  select(name, n) %>%
  arrange(desc(n))
```
Ctrl + Shift + M <br>
Shortcut to type %>% <br>
***1. Filter babynames to just the girls that were born in 2015 <br>
2. Select the name and n columns <br>
3. Arrange the results so that the most popular names are 
near the top***
```
babynames %>% 
  filter(sex=="F",year==2015) %>% 
  select(name,n) %>% 
  arrange(desc(n))
```
***1. Trim babynames to just the rows that contain your name
and your sex <br>
2. Trim the result to just the columns that will appear in 
your graph (not strictly necessary, but useful practice)<br>
3. Plot the results as a line graph with year on the x axis 
and prop on the y axis***
```
babynames %>% 
  filter(name=="Garrett",sex=="M") %>% 
  select(year,prop) %>% 
  ggplot()+
  geom_line(mapping = aes(year,prop))
```

## Deriving information
### summarise() 
summarise variables. Deriving information

```
babynames %>% summarise(total = sum(n), max = max(n))

~ The first (minimum) year in the dataset
~ The last (maximum) year in the dataset
~ The total number of children represented in the data
babynames %>% summarise(first=min(year),
        last=max(year),
        total=sum(n))

~ Extract the rows where name == "Khaleesi". Then use  summarise() and a summary functions to find: 
 The total number of children named Khaleesi 
 The first year Khaleesi appeared in the data ~
babynames %>% 
  filter(name=="Khaleesi") %>% 
  summarise(total=sum(n),first_year=min(year))
```
***n(): The number of rows in a dataset/group***
***n_distinct(): The number of distinct values in a variable***
```
babynames %>% summarise(n = n())
babynames %>% summarise(n = n(), nname = n_distinct(name))
~ showing total obs,country and continent in the dataset 
gapminder %>% summarise(obs=n(),country=n_distinct(country),
                        continent=n_distinct(continent))
```

### Grouping cases
Groups cases by common values of one or more columns
```
babynames %>% 
  group_by(sex)
~ group_by and summarise
babynames %>% 
  group_by(sex) %>%
  summarise(total = sum(n))

~ Use group_by(), summarise(), and arrange() to display the ten most popular names. 
Compute popularity as the total number of children of a single gender given a name ~
babynames %>% group_by(name,sex) %>%
  summarise(total=sum(n)) %>% 
  arrange(desc(total))

~ Use grouping to calculate and then plot the number of children born each year over time.
babynames %>% 
  group_by(year) %>% 
  summarise(n_children=sum(n)) %>% 
  ggplot()+
  geom_line(mapping = aes(x=year, y= n_children))
```
***ungroup()*** <br>
Removes grouping criteria from a data frame
```
babynames %>%
  group_by(name, sex) %>% 
  ungroup() %>%
  summarise(total = sum(n)) %>% 
  arrange(desc(total))
```

### Mutate
The mutate() function in the dplyr package in R is used to create new variables or modify existing ones in a data frame. The basic syntax for mutate() <br>
```mutate(.data, new_variable = expression, ...)``` <br>
- data: The data frame to be modified.
- new_variable: The name of the new variable to be created or an existing variable to be modified.
- expression: The operation or calculation to perform on the variable.
```
babynames %>%
  mutate(percent = round(prop*100, 2))

babynames %>%
  mutate(percent = round(prop*100, 2), nper = round(percent))
```
****mini_rank()**** <br>
min_rank() function is used to calculate the ranks of values within a variable, returning the rank as a numeric vector. 
It assigns the smallest rank to the smallest element, and ties are handled by assigning the minimum rank to all tied values. <br>
```min_rank(x, ties.method = c("average", "first", "last", "random"))```
- x: The variable for which you want to calculate the ranks.
- ties.method: A character string specifying how ties should be handled. Options include "average" (default), "first" (ties get the minimum rank), "last" (ties get the maximum rank), and "random" (ties get a random rank)
```
min_rank(c(50,100,1000))
min_rank(desc(c(50, 100, 1000)))
library(dplyr)

~  Create a data frame
df <- data.frame(
  ID = c(1, 2, 3, 4),
  Value = c(10, 15, 10, 20)
)

~ Use min_rank() to calculate the ranks of 'Value'
df <- mutate(df, Rank = min_rank(Value))
```
## Joining Dataset 
Each join function returns a data frame / tibble. <br>
```left_join(x, y, by = NULL, … )``` <br>
- x and y: data frames to join
- null: names of columns to join on <br>

****Working dataset****
```
install.packages("nycflights13")
library(nycflights13)
View(flights)
View(airlines)

band <- tribble(
  ~name,     ~band,
  "Mick",  "Stones",
  "John", "Beatles",
  "Paul", "Beatles"
)

instrument <- tribble(
  ~name,   ~plays,
  "John", "guitar",
  "Paul",   "bass",
  "Keith", "guitar"
)

instrument2 <- tribble(
  ~artist,   ~plays,
  "John", "guitar",
  "Paul",   "bass",
  "Keith", "guitar"
)

```
### Mutating Joins
****left join**** <br>
![Screenshot 2024-02-06 104200](https://github.com/theadewole/My_R_Note/assets/108795960/a2713c69-528c-45d1-aa62-42ee75a64e94) <br>
```band %>% left_join(instrument, by = "name")``` <bfr>

****right join**** <br>
![Screenshot 2024-02-06 104200_1](https://github.com/theadewole/My_R_Note/assets/108795960/a943097c-b635-418a-ad38-c5808cc3b44c) <br>
```band %>% right_join(instrument, by = "name")``` <br>

****full join**** <br>

```band %>% full_join(instrument, by = "name")``` <br>
![Screenshot 2024-02-06 104200_2](https://github.com/theadewole/My_R_Note/assets/108795960/10f79899-16f1-4174-8ca6-790ab8e9819e) <br>
****inner join**** <br>
![Screenshot 2024-02-06 104200_3](https://github.com/theadewole/My_R_Note/assets/108795960/f49377db-4740-4869-ae4a-43c342ead643) <br>
```band %>% inner_join(instrument, by = "name")``` <br>

```
  ~ Which airlines had the largest arrival delays? Work in groups to complete the code below
library(tidyverse)
flights %>% 
  drop_na(arr_delay) %>%
  left_join(airlines, by = "carrier") %>%
  group_by(name) %>%
  summarise(delay = mean(arr_delay)) %>%
  arrange(delay)
```
#### Use a named vector to match variables with different names.
This is most useful in situations where  'merging columns' in the different datasets have different names 
```
band %>% left_join(instrument2, by = c("name" = "artist"))
airports %>% left_join(flights, by = c("faa" = "dest"))
*********************************************************
airports %>% select(1:3)
flights %>% select(14:15)
```
### Filtering Joins
****semi Join**** <br>
is a type of join operation that returns only the rows from the left data frame  (or table) where there is a match with the right data frame based on a specified condition. <br>
![Screenshot 2024-02-06 104200_4](https://github.com/theadewole/My_R_Note/assets/108795960/08e079e4-f50b-4409-9c5a-7537fb0b5782) <br>
```band %>% semi_join(instrument, by = "name")`` <br>

****Anti Join**** <br>
is a type of join operation that returns only the rows from the left data  frame (or table) where there is no match with the right data frame based on a specified condition <br>
![Screenshot 2024-02-06 104200_5](https://github.com/theadewole/My_R_Note/assets/108795960/6d5595f4-490b-490f-a183-24f0237e97c0) <br>
```band %>% anti_join(instrument, by = "name")``` <br>

****distinct()**** <br>
Removes rows with duplicate values (in a column) <br>
```distinct(babynames,name)``` <br>

```
  ~ How many airports in airports are serviced by flights originating in New York (i.e. flights in our dataset?)
airports %>%
  semi_join(flights, by = c("faa" = "dest")) %>%
  distinct(faa)
```







