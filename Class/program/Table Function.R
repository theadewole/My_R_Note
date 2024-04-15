df <- data.frame(player = c('AJ', 'Bob', 'Chad', 'Dan', 'Eric', 'Frank'),
                 position = c('A', 'B', 'B', 'B', 'B', 'A'),
                 points = c(1, 2, 2, 1, 0, 0))

table(df$position)

#calculate frequency table of proportions for position variable
prop.table(table(df$position))

#calculate frequency table for position and points variable
table(df$position, df$points)

#calculate frequency table of proportions for position and points variable
prop.table(table(df$position, df$points))

#determining the number of decimal 
options(digits=1)

#calculate frequency table of proportions for position and points variable
prop.table(table(df$position, df$points))

##Creating a relative frequencuy table 
#define data
data <- c('A', 'A', 'B', 'B', 'B', 'C', 'C', 'C', 'C', 'C')

#create relative frequency table
table(data)/length(data)

#define data frame
df <- data.frame(team=c('A', 'A', 'A', 'A', 'A', 'B', 'B', 'C'),
                 wins=c(2, 9, 11, 12, 15, 17, 18, 19),
                 points=c(1, 2, 2, 2, 3, 3, 3, 3))

#calculate relative frequency table for 'team' column
table(df$team)/length(df$team)

#calculate relative frequency table for each column
sapply(df, function(x) table(x)/nrow(df))