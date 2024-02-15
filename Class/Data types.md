****Levels**** <br>
Refers to the unique values that a categorical variable can take. 
When you have a categorical variable, R automatically assigns levels to it, which are the distinct categories or groups within that variable.

```
library(tidyverse)
library(nycflights13)

flights %>%
  mutate(delayed = arr_delay > 0) %>%
  select(arr_delay, delayed)

~ Use flights to create delayed, the variable that displays whether a flight was delayed (arr_delay > 0). Then, remove all rows that contain an NA in delayed. 
~ Finally, create a summary table that shows: 
  How many flights were delayed 
  What proportion of flights were delayed

flights %>%
  mutate(delayed = arr_delay > 0) %>%
  drop_na(delayed) %>%
  summarise(total = sum(delayed), prop = mean(delayed))
```
