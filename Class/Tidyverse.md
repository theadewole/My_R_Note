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

