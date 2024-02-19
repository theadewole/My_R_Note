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
# stringr
This function is used for various string operations, including pattern matching, manipulation, and extraction
 ## Pattern Matching and Extraction Functions
- str_detect(): Checks if a pattern is present in each element of a character vector. <br>
```str_detect(string, pattern)``` <br>
```
~ Sample vector of email addresses
emails <- c("john@example.com", "jane@example.org", "smith@example.net")
contains_com <- str_detect(emails, ".com")
```
- str_subset(): Extracts the elements of a character vector that contain a pattern. <br>
```str_subset(string, pattern)```
```
~ Sample vector of file names
file_names <- c("document1.txt", "image.png", "data.csv", "document2.txt")

~ Extract file names that end with ".txt"
txt_files <- str_subset(file_names, "\\.txt$")
```
- str_extract(): Extracts the first occurrence of a pattern from each element of a character vector. <br>
```str_extract(string, pattern)```
```
~ Sample vector of email addresses
emails <- c("john@example.com", "jane@example.org", "smith@example.net")

~ Extract the domain part from each email address
domains <- str_extract(emails, "@\\w+\\.\\w+")
```
- str_extract_all(): Extracts all occurrences of a pattern from each element of a character vector.
- str_match(): Extracts the first occurrence of a pattern along with its capture groups from each element of a character vector.
- str_match_all(): Extracts all occurrences of a pattern along with their capture groups from each element of a character vector.
- str_locate(): Returns the start and end positions of the first occurrence of a pattern in each element of a character vector.
- str_locate_all(): Returns the start and end positions of all occurrences of a pattern in each element of a character vector.
## Replacement Functions:
- str_replace(): Replaces the first occurrence of a pattern with a replacement string in each element of a character vector.
- str_replace_all(): Replaces all occurrences of a pattern with a replacement string in each element of a character vector.
- str_replace_na(): Replaces missing values with a specified replacement string in a character vector.
## Splitting and Joining Functions:
- str_split(): Splits each element of a character vector into substrings based on a specified pattern.
- str_split_fixed(): Splits each element of a character vector into a fixed number of substrings based on a specified pattern.
- str_split_n(): Splits each element of a character vector into up to n substrings based on a specified pattern.
- str_c(): Concatenates multiple strings into a single string.
- str_flatten(): Flattens a list of character vectors into a single character vector.
## Case Conversion Functions:
- str_to_lower(): Converts strings to lowercase.
- str_to_upper(): Converts strings to uppercase.
- str_to_title(): Converts strings to title case (capitalizes the first letter of each word).
## Whitespace Handling Functions:
- str_trim(): Removes leading and trailing whitespace from strings.
- str_pad(): Pads strings with additional characters to a specified width.

## str_sub()
Extract or replace portions of a string with str_sub() <br>
```str_sub(string, start = 1, end = -1)```
- string:string(s) to manipulate
- start: position of first character to extract within each string
- end: position of last character to extract within each string
```
g <- "Garrett"
~ extract the 1 and 2 string
str_sub(g,1,2)

~ extract only the 1st string 
str_sub(g,1,1)

~ extraction start from the 2nd till the last character in the string 
str_sub(g,2)

~ extract the last 3 character of the string
str_sub(g,-3)

~ extract the last 3 string and replace with another
str_sub(g, -3) <- "eth"
g

~ Isolate the last letter of every name and create a logical variable that displays whether the last letter is one of "a", "e", "i", "o", "u", or "y". 
~ Use a weighted mean to calculate the proportion of children whose name ends in a vowel (by year and sex) and then display the results as a line plot

library(babynames)
babynames %>%
  mutate(last = str_sub(name, -1), 
         vowel = last %in% c("a", "e", "i", "o", "u", "y")) %>%
  group_by(year, sex) %>%
  summarise(p_vowel = weighted.mean(vowel, n))%>%
  ggplot() +
  geom_line(mapping = aes(year, p_vowel, color = sex))
```
****for documentation**** <br>
```help(package = stringr)```

# forcats 
Provides a set of tools for working with categorical variables (factors) in R. It's designed to complement the functionality provided by base R's base package and the stringr package for string manipulation. <br>
****gss_cat**** <br>
A sample of data from the General Social Survey, a long-running US survey conducted by NORC at the University of Chicago <br>
The forcats package provides functions to: <br>
```
library(forcats)
gss_cat %>%
  drop_na(tvhours) %>%
  group_by(relig) %>%
  summarise(tvhours = mean(tvhours)) %>%
  ggplot(aes(tvhours, relig)) +
  geom_point()
```
## Reorder levels
allow you to reorder levels of a factor based on values of another variable or on their frequency.
- fct_reorder(): Reorders the levels of a factor based on the result of fun(x) applied to each group of cases (grouped by level) <br>
```fct_reorder(f, x, fun = median, …, .desc = FALSE)``` <br>
f: factor to reorder, x: variable to reorder by (in conjunction with fun),fun=median: function to reorder by (in conjunction with x), desc: put in descending 
order
- fct_relevel()
- fct_relevel2()
```
~ average TV consumption by religion
gss_cat %>%
  drop_na(tvhours) %>%
  group_by(relig) %>%
  summarise(tvhours = mean(tvhours)) %>%
  ggplot(aes(tvhours, fct_reorder(relig, tvhours))) +
  geom_point()

~ average TV consumption by marital status
gss_cat %>%
  drop_na(tvhours) %>%
  group_by(marital) %>%
  summarise(tvhours = mean(tvhours)) %>%
  ggplot(aes(tvhours, fct_reorder(marital, tvhours))) +
  geom_point()

~ average tv hours by party ID an then plot the results
gss_cat %>%
  drop_na(tvhours) %>%
  group_by(partyid) %>%
  summarise(tvhours = mean(tvhours)) %>%
  ggplot(aes(tvhours, fct_reorder(partyid, tvhours))) +
  geom_point() +
  labs(y = "partyid")
```
## Manipulate factor levels
- fct_inorder(): ensures that factor levels are in the order they appear in the data.
- fct_infreq(): reorders factor levels by frequency.
```
gss_cat %>%
  ggplot(aes(fct_infreq(marital))) + geom_bar()

gss_cat %>%
  ggplot(aes(fct_rev(fct_infreq(marital)))) + geom_bar()
```
## Change factor level names
- fct_recode(): allows you to recode factor levels. <br>
```fct_recode(f, …)``` <br>
f: factor with levels, ...:new level = old level pairs (as a named character vector)
```
gss_cat %>%
  drop_na(tvhours) %>%
  mutate(partyid = fct_recode(partyid,
                              "Republican, strong" = "Strong republican",
                              "Republican, weak" = "Not str republican",
                              "Independent, near rep" = "Ind,near rep",
                              "Independent, near dem" = "Ind,near dem",
                              "Democrat, weak" = "Not str democrat",
                              "Democrat, strong" = "Strong democrat")) %>% 
  group_by(partyid) %>%
  summarise(tvhours = mean(tvhours)) %>%
  ggplot(aes(tvhours, fct_reorder(partyid, tvhours))) +
  geom_point() + labs(y = "partyid")

```
## Collapse levels: 
- fct_collapse() collapses levels of a factor into groups. <br>
``fct_collapse(f, …)``` <br>
f:factor with levels, ...: named arguments set to a character vector (levels in the vector will be collapsed to the name of the argument)
```
gss_cat %>%
  drop_na(tvhours) %>%
  mutate(partyid = fct_collapse(partyid,
                                conservative = c("Strong republican", 
                                                 "Not str republican", 
                                                 "Ind,near rep"),
                                liberal = c("Strong democrat", 
                                            "Not str democrat", 
                                            "Ind,near dem"))) %>% 
  group_by(partyid) %>%
  summarise(tvhours = mean(tvhours)) %>%
  ggplot(aes(tvhours, fct_reorder(partyid, tvhours))) +
  geom_point() + labs(y = "partyid")
```
## Detect and handle missing values
- fct_explicit_na(): converts missing values to a factor level.
## Deal with factor contrasts
lump or label rare levels.
- fct_other()
- fct_lump() <br>
```fct_lump(f, other_level = "Other", …)``` <br>
f:factor with levels, other_level = "Other": name of new level

```
gss_cat %>%
  drop_na(tvhours) %>%
  mutate(partyid = partyid %>%
           fct_collapse(
             conservative = c("Strong republican", 
                              "Not str republican", "Ind,near rep"),
             liberal = c("Strong democrat", "Not str democrat", 
                         "Ind,near dem")) %>%
           fct_lump()
  ) %>%
  group_by(partyid) %>%
  summarise(tvhours = mean(tvhours)) %>%
  ggplot(aes(tvhours, fct_reorder(partyid, tvhours))) +
  geom_point() + labs(y = "partyid")


gss_cat %>%
  drop_na(tvhours) %>%
  mutate(partyid = partyid %>%
           fct_collapse(
             conservative = c("Strong republican", 
                              "Not str republican", "Ind,near rep"),
             liberal = c("Strong democrat", "Not str democrat", 
                         "Ind,near dem")) %>%
           fct_lump()
  ) %>%
  group_by(partyid) %>%
  summarise(tvhours = mean(tvhours)) %>%
  ggplot(aes(fct_reorder(partyid, tvhours), tvhours)) +
  geom_col() + labs(x = "partyid") + coord_flip()
```

# Date Time 
To check the current date <br>
```current_date <- Sys.Date()``` <br>
To check current time <br>
```current_time <- Sys.time()```

```
flights %>% select(c(1, 2, 3, 17, 18, 5, 19))

flights %>% 
  ggplot(mapping = aes(x = sched_dep_time, y = arr_delay)) + 
  geom_point(alpha = 0.2) + geom_smooth()
```
## hms ()
Is a function used to create a time object representing hours, minutes, and seconds. It is part of the hms package, which provides tools for working with time-of-day data.
```
library(hms)
hms(seconds = 56, min = 34, hour = 12)
hms(56,34,12)
hms(h=56,m=23,s=30)

What is the best time of day to fly? 
Use the hour and minute variables in flights to compute the time of day for each flight as an hms.
Then use a smooth line to plot the relationship between time of day and arr_delay.
flights %>% 
  mutate(time = hms(hour = hour, minute = minute)) %>% 
  ggplot(aes(time, arr_delay)) + 
  geom_point(alpha = 0.2) + geom_smooth()
```
## lubridate
It provides functions to parse, manipulate, and do arithmetic with dates and times. <br>
Here are some key features and functions provided by lubridate:
- Parsing dates and times: ymd(), mdy(), dmy(), ymd_hms(), etc. These functions parse character vectors into Date or POSIXct objects.
- Accessing components: Functions like year(), month(), day(), hour(), minute(), and second() allow you to extract specific components of dates and times.
- Manipulating dates and times: ymd() + months(3) would add 3 months to a date, for example.
- Time zone handling: with_tz() and force_tz() functions help with managing time zones.
- Interval arithmetic: interval() creates a time interval, and you can perform arithmetic with intervals and dates/times.
- Periods: The period class represents a time span in human units, such as "2 days and 5 hours".
- Date-time arithmetic: You can add or subtract durations, periods, and intervals from date-time objects.
- Handling leap years, daylight saving time, and time zones: lubridate provides tools to manage these complexities
```
- Parsing dates
date <- ymd("2024-02-19")
- Extracting components
year(date)
month(date)
day(date)
- Manipulating dates
date + months(3)
- Interval arithmetic
interval <- interval(ymd("2024-01-01"), ymd("2024-12-31"))
as.period(interval)
- Time zone handling
with_tz(date, "America/New_York")
```
****Accessing and changing components*****
```
ymd("2017/01/11")
mdy("January 11, 2017")
ymd_hms("2017-01-11 01:30:55")

date <- ymd("2017-01-11")
year(date)
~ replacing date 
year(date) <- 1999
date
~ day of week
wday(ymd("2017-01-11"))

~ returns the day of the week (abbreviated) and show the level 
wday(ymd("2017-01-11"), label = TRUE)

~ returns the day of the week (not abbreviated) and show the level 
wday(ymd("2017-01-11"), label = TRUE,abbr=F)

~ Extract the day of the week of each flight (as a full name) from time_hour. 
~ Calculate the average arr_delay by day of the week. 
~ Plot the results as a column chart (bar chart) with geom_col().
flights %>% 
  mutate(weekday=wday(time_hour,label=T,abbr=F)) %>% 
  group_by(weekday) %>% 
  drop_na(arr_delay) %>% 
  summarize(avg_delay=mean(arr_delay)) %>% 
  ggplot()+
  geom_col(mapping = aes(x=weekday,y=avg_delay))
```
<details><summary>Parsing functions</summary> 
![Screenshot 2024-02-19 132447](https://github.com/theadewole/My_R_Note/assets/108795960/5507585f-f4c6-4e58-be1a-7d5c7b4de8cb)
</details>

<details><summary>Accessing date time components</summary> 
![Screenshot 2024-02-19 132734](https://github.com/theadewole/My_R_Note/assets/108795960/fcd55b80-bd2f-48ad-ae4a-9cbc76d4547f)
</details>
