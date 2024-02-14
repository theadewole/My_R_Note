readr functions are
- ~ 10 times faster
- Return tibbles
- Have more intuitive defaults. No row names, no strings as factors

# Function reads
- ****read_csv()**** Comma separated values
- ****read_csv2()**** Semi-colon separated values
- ****read_delim()**** General delimited files
- ****read_fwf()**** Fixed width files
- ****read_log()**** Apache log files
- ****read_table()**** Space separated
- ****read_tsv()**** Tab delimited values <br>

```df <- read_csv("path/to/file.csv", …)```

```
nimbus <- read_csv("C:\\Users\\AFSS-Student\\Documents\\R\\Dataset\\nimbus.csv")
```
# tibbles
A tibble is a more modern and enhanced version of a traditional data frame, offering some advantages in terms of usability and consistency. 
Tibbles are designed to work well with the tidyverse ecosystem of packages for data manipulation and visualization. <br>
Tibbles enhance data frames in three ways: 
- Subsetting - [ always returns a new tibble, [[ and $ always return a new vector 
- No partial matching - You must use full column names when subsetting 
- Display - When you print a tibble, R provides a concise view of the data that fits on one screen

## tibble helpers
- as_tibble() - convert a data frame to a tibble
- as.data.frame() - convert a tibble to a data frame
- tribble() - make a tibble (transverse)

```
Name <- c("Fred","Magalie","Ajua")
cars <- c("v4","v6","v8")
color <- c("Sky blue","Volcanoe red","Champage")
year <- c(1:5)
 
cars <- expand.grid(Name=Name,Engine=cars,Colors=color,Year=year)

~ Converting Dataframe to tibble
car <- as_tibble(cars)

~ make a tibble (transversed)
car1 <- tibble(car)

~ convert a tibble to a data frame
car3 <- as.data.frame(car)
```
# Parsing
The process of converting a character string into a data structure that R can work with. 
This can include converting strings to numeric values, dates, factors, or other data types, as well as splitting strings into substrings based on specific delimiters or patterns.
## . = NA
Used to convert . to  na in a tribble <br>
```nimbus <- read_csv("nimbus.csv", na = ".")``` <br>
- na=".": Value(s) to convert to NA <br>
```nimbus <- read_csv("C:\\Users\\AFSS-Student\\Documents\\R\\Dataset\\nimbus.csv",na=".")```
## type function data type
- col_character() character
- col_date() Date
- col_datetime() POSIXct (date-time)
- col_double() double (numeric)
- col_factor() factor
- col_guess() let readr guess (default)
- col_integer() integer
- col_logical() logical
- col_number() numbers mixed with non-number characters
- col_numeric() double or integer
- col_skip() do not read
- col_time() time

```nimbus <- read_csv("nimbus.csv", na = "."), col_types = list(ozone = col_double()))```
