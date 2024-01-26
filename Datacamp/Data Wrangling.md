## Loading the gapminder and dplyr packages
Before you can work with the gapminder dataset, you'll need to load two R packages that contain the tools for working with it, then display the gapminder dataset so that you can see what it contains.

To your right, you'll see two windows inside which you can enter code: The script.R window, and the R Console. All of your code to solve each exercise must go inside script.R.
```
~ Load the gapminder package
library(gapminder)
~ Load the dplyr package
library(dplyr)
~ Look at the gapminder dataset
gapminder
```
## Filter ()
The filter verb extracts particular observations based on a condition. <br>
In R, the filter() function is often associated with the dplyr package, which is part of the tidyverse collection of packages <br>
```filter(data, condition)``` <br>
- data: The data frame you want to filter.
- condition: The filtering condition, specifying which rows to keep. <br>
*Some Important note*
- %>%: is called a pipe, takes the output from the left-hand side and passes it as the first argument to the function on the right-hand side. This allows you to chain together multiple operations in a way that mirrors the natural flow of data
- Use " " to filter characters while numeric variables don't require " ".
Multiple filters can be applied by separation with (,).
```
~ Filter the gapminder dataset for the year 1957
gapminder %>%
  filter (year==1957)
~ Filter for China in 2002
gapminder %>%
  filter(country=="China",year==2002)
```
