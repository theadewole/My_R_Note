# Using ‘merge()’ from base R
The merge() function in base R helps us to combine two or more data frames based on common columns. 
It performs various types of joins such as inner join, left join, right join, and full join. <br>
```merged_df <- merge(x,y,by = "common_column",..)``` <br>
*‘x’ and ‘y’ are the data frames that you want to merge.* <br>
*‘by’ specifies the common columns on which the merge will be performed.* <br>
*Additional arguments like ‘all.x’,all.y’ and ‘all’ control the type of join that is to be performed.* <br>
```
df1 <- data.frame(ID = c(1, 2, 3, 4),
				Name = c("A", "B", "C", "D"),
				Age = c(25, 30, 35, 40))
df2 <- data.frame(ID = c(2, 3, 4, 5),
				Occupation = c("Engineer", "Teacher", "Doctor", "Lawyer"),
				Salary = c(5000, 4000, 6000, 7000))
```
##  Inner join (default behavior)
The resulting ‘inner_join’ dataframe will only include the common rows where ‘ID’ is present in both ‘df1’ and ‘df2’
```
inner_join <- merge(df1, df2, by = "ID")
print(inner_join)
```
## Left join(‘all.x=TRUE’)
The resulting ‘left_join’ data frame will include all rows from ‘df1’ and the matching rows from ‘df2’. 
Non-matching rows from ‘df2’ will have an ‘NA’ value
```
left_join <- merge(df1, df2, by = "ID", all.x = TRUE)
print (left_join)
```
## Right join (‘all.y=TRUE’)
The resulting ‘right_join’ data frame will include all rows from ‘df2’ and the matching rows from ‘df1’. 
Non-matching rows from ‘df1’ will have ‘NA’ values.
```
right_join <- merge(df1, df2, by = "ID", all.y = TRUE)
print(right_join)
```
##  Full outer join(‘all =TRUE’)
The resulting ‘full_join’ data frame will include all rows from both ‘df1’ and ‘df2’. 
Non-matching values will have ‘NA’ values.
```
full_join <- merge(df1, df2, by = "ID", all = TRUE)
print(full_join)
```
# Using ‘dplyr’ package
The ‘dplyr’ package provides a set of functions for data manipulation, including merging data frames.
The primary function for merging in ‘dplyr’ is ‘join()’, which supports various types of joins. <br>
```merged_df<- join(x,y,by="common_column",type="type_of_join")``` <br>
- ‘x’ and ‘y’ are the data frames to be merged.
- ‘by’ specifies the common columns on which the merge is to be performed
- ‘type_of_join’ can be ‘inner’, ‘left’,’ right’ or ‘full’ to specify the type of join.
## Inner Join 
```
library(dplyr)
inner_join <- inner_join(df1, df2, by = "ID")
print(inner_join)
```
## Left join

```
left_join <- left_join(df1, df2, by = "ID")
print(left_join)
```
## Right join

```
right_join <- right_join(df1, df2, by = "ID")
print(right_join)
```
## Full Join 
```
full_join <- full_join(df1, df2, by = "ID")
print(full_join)
```

# Using ‘data.table’ package:
The ‘data.table’ package offers an efficient and fast approach to data manipulation. It provides the ‘merge()’ function. It is similar to the one in base R but optimized for speed.<br>
```merged_dt <- merge(x, y, by = "common_column", ...)``` <br>
- ‘x’ and ‘y’ are the data frames that are to be merged.
- ‘by’ specifies the common columns on which the merge will be performed.
- Additional arguments like ‘all.x’, ‘all.y’ and ‘all’ that controls the type of join.
## Inner Join
```
library(data.table)
inner_join <- merge(df1, df2, by = "ID")
print(inner_join)
```
## Left join( ‘all.x = TRUE’)
```
left_join <- merge(df1, df2, by = "ID", all.x = TRUE)
print(left_join)
```
## Right join( ‘all.y = TRUE’)
```
right_join <- merge(df1, df2, by = "ID", all.y = TRUE)
print(right_join)
````
## Full outer join( ‘all = TRUE’)
```
full_join <- merge(df1, df2, by = "ID", all = TRUE)
print(full_join)
```
- ‘merge()’ provides a general-purpose function for merging data frames.
- ‘dplyr’ focuses on merging with a focus on readability and ease of use.
- ‘data. table’ provides a fast and efficient way to handle large datasets with optimized performance. <br>
*We should choose the approach based on the complexity of the task, and performing requirements.*

