df1 <- data.frame(ID = c(1, 2, 3, 4),
                  Name = c("A", "B", "C", "D"),
                  Age = c(25, 30, 35, 40))

df2 <- data.frame(ID = c(2, 3, 4, 5),
                  Occupation = c("Engineer", "Teacher", "Doctor", "Lawyer"),
                  Salary = c(5000, 4000, 6000, 7000))
#Inner join (default behavior)
inner_join <- merge(df1, df2, by = "ID")
print(inner_join)

#Left join(‘all.x=TRUE’)
left_join <- merge(df1, df2, by = "ID", all.x = TRUE)
print (left_join)

#Right join (‘all.y=TRUE’)
right_join <- merge(df1, df2, by = "ID", all.y = TRUE)
print(right_join)

#Full outer join(‘all =TRUE’)
full_join <- merge(df1, df2, by = "ID", all = TRUE)
print(full_join)

################################################################################
#Using ‘dplyr’ package
################################################################################
#Inner join 
library(dplyr)
inner_join <- inner_join(df1, df2, by = "ID")
print(inner_join)

# Left join
left_join <- left_join(df1, df2, by = "ID")
print(left_join)

# Right Join
right_join <- right_join(df1, df2, by = "ID")
print(right_join)

#Full Join
full_join <- full_join(df1, df2, by = "ID")
print(full_join)

################################################################################
#data.table()
################################################################################
# Inner Join
library(data.table)
inner_join <- merge(df1, df2, by = "ID")
print(inner_join)

#Left join( ‘all.x = TRUE’)
left_join <- merge(df1, df2, by = "ID", all.x = TRUE)
print(left_join)

#Right join( ‘all.y = TRUE’)
right_join <- merge(df1, df2, by = "ID", all.y = TRUE)
print(right_join)

# Full outer join( ‘all = TRUE’)
full_join <- merge(df1, df2, by = "ID", all = TRUE)
print(full_join)




