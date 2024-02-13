It provides functions for tidying up and reshaping data, making it easier to work with in downstream analysis and visualization
```
library(tidyverse)

View(table1)
View(table2)
View(table3)
View(table4a)
View(table4b)
View(table5)
View(Toy)


# What are the variables in this data set
str(table1)

table2$count[c(1,3,5,7,9,11)] 
table2$count[c(2,4,6,8,10,12)]
```

# gather ()
Is used to transform wide data into long data. 
This is particularly useful when you have multiple columns representing different categories or measurements, and you want to stack them into a single column while creating a new column to identify the original source of each value <br>
```gather(df, key =" " , value =" " , -ID)``` <br>
- key: argument specifies the name of the new column that will contain the column names of the original data
- value: argument specifies the name of the new column that will contain the corresponding values
- -ID: argument indicates that the ID column should be kept as an identifier column without being gathered
```
~ numeric indexes of columns to collapse (or names)
cases %>% 
  gather(key = "year", value = "n", 2:4)

~ "2011", "2012", "2013": Listing the collapse column name 
cases %>% 
  gather("year","n", "2011", "2012", "2013")

~ country:country column as identifier column without being gathered
cases %>% 
  gather("year","n", -country)

~ Use gather() to reorganize table4a into three columns: country, year, and cases.
table4a %>% 
  gather(key="year",value="n",-country,convert =T)

table4a %>% 
  gather(key = "year", value = "n", 2:3, convert = TRUE)
```

# spread ()
Is used to convert data from long format to wide format. It takes a key-value pair and spreads the values associated with unique keys into separate columns <br>
```spread(df_long, key = , value = )```
- key: argument specifies the column containing the unique identifiers 
- value: argument specifies the column containing the values to be spread
```
pollution <- tribble(
  ~city,  ~size, ~amount, 
  "New York", "large",      23,
  "New York", "small",      14,
  "London", "large",      22,
  "London", "small",      16,
  "Beijing", "large",      121,
  "Beijing", "small",      56
)

pollution %>% spread(key = size, value = amount)

pollution %>% spread(size, amount)

~ Use spread() to reorganize table2 into four columns: country, year, cases, and population
table2 %>% 
  spread(key = type, value = count)
```

# separate ()
Is used to split a single character column into multiple columns based on a delimiter. 
This is often useful when you have a column containing combined information that you want to split into separate components. <br>
```separate(codes, into = c("new", "type", "sexage"), sep = "_")```
- code:a column to split
- into: names of new columns to make
- sep: string to split on (Defaults to any non_alpha_numeric character

```
View(who)

who %>%
  gather("codes", "n", 5:60) %>%
  select(-iso2, -iso3) %>% 
  separate(codes, into = c("new", "type", "sexage"), sep = "_") %>% 
  select(-new)

~ split by character:locations to split at (Split atfer 4th and 7th characters)
who %>%
  gather("codes", "n", 5:60) %>%
  select(-iso2, -iso3) %>%
  separate(codes, c("new", "type", "sexage"), sep = c(4, 7))

~ Separate the sexage column into sex and age columns
age <- who %>%
  gather("codes", "n", 5:60) %>%
  select(-iso2, -iso3) %>%
  separate(codes, c("new", "type", "sexage"), sep = "_") %>%
  select(-new) %>%
  separate(sexage, into = c("sex", "age"), sep = 1)
```
# unite ()
 is used to concatenate multiple columns into a single column, creating a new column that combines the information from the original columns. 
 This is useful when you want to combine different pieces of information into a single variable for further analysis or visualization <br>
 ```unite(data, col, …, sep = "")```
 - data: data frame to reshape
 - col: name of new column to make (in quotes)
 - ....: two or more columns to combine
 - sep: separator to place between elements in new column (Defaults to an underscore)

```
df <- data.frame(
  ID = 1:3,
  Name = c("John", "Alice", "Bob"),
  Age = c(25, 30, 40)
)

~ Unite the 'Name' and 'Age' columns into a single column called 'Name_Age', 
#separated by underscore (_)
df_united <- unite(df, col = Name_Age, c("Name", "Age"), sep = "-")

~ Display the data frame after uniting
View(df_united)


who %>%
  gather("codes", "n", 5:60) %>%
  separate(codes, c("new", "type", "sexage"), sep = "_") %>%
  select(-new, -iso2, -iso3) %>%
  separate(sexage, c("sex", "age"), sep = 1) %>%
  drop_na(n) %>% 
  unite("age_sex",sex,age,sep="_")
```
##  drop_na()
 Drops rows that contain NA’s in the specified columns.
 
 ```
who %>%
  gather("codes", "n", 5:60) %>%
  separate(codes, c("new", "type", "sexage"), sep = "_") %>%
  select(-new, -iso2, -iso3) %>%
  separate(sexage, c("sex", "age"), sep = 2) %>%
  drop_na(n)
```
