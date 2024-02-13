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
```gather(df, key = , value = , -ID)``` <br>
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

