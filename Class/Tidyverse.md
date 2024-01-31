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
- vars: Variables to consider. By default, it considers all variables in the data frame.
```select(team,starts_with("W"))```
##### ends_with() - Selecting columns that end with…
```end_with(prefix, ignore.case = FALSE, vars = tidyselect::all_of(names(.)))```
- prefix: A character string representing the prefix of the column names to be selected.
- ignore.case: A logical value indicating whether the matching should be case-insensitive (default is FALSE).
- vars: Variables to consider. By default, it considers all variables in the data frame.
```select(team,ends_with("D"))```
##### contains() - Selecting columns whose names contain
```contains(substring, ignore.case = FALSE, vars = tidyselect::all_of(names(.)))```
- substring: A character string representing the substring to look for in the column names.
- ignore.case: A logical value indicating whether the matching should be case-insensitive (default is FALSE).
- vars: Variables to consider. By default, it considers all variables in the data frame.
```select(team,contains("A"))```
##### matches() - Selecting columns whose names match regular expression
```matches(regular_expression, ignore.case = FALSE, vars = tidyselect::all_of(names(.)))```
- regular_expression: A character string representing the regular expression pattern to match against the column names.
- ignore.case: A logical value indicating whether the matching should be case-insensitive (default is FALSE).
- vars: Variables to consider. By default, it considers all variables in the data frame.
```select(team,matches("ID"))```
##### one_of() - Selecting columns whose names are one of a set
```one_of(..., vars = tidyselect::all_of(names(.)))```
- ...: A set of character vectors representing the column names to match.
- vars: Variables to consider. By default, it considers all variables in the data frame.
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
