#  Saving  data frame or matrix
```
y <- matrix(c("A","B","C","D","E","F","G","H","I","J","K","L"),nrow=3,ncol=4, byrow=TRUE,
            dimnames = list(rows=c("Cat", "Rat", "Dog"),
                            cols=c("Meat", "Fish", "Crap", "Pork")))

write.table(y, file = "C:\\Users\\AFSS-Student\\Documents\\R\\matrix.txt",sep=" ")
```
# To view to console 
```
print(y)
```
# To view dataframe in script
```
view(Dm)
```
# Sink 
```
sink("C:\\Users\\AFSS-Student\\Documents\\R\\data.txt",append=F,split =F)

define data frame to write to file
df <- data.frame(player=c('A', 'B', 'C', 'D','E'),
                 points=c(12, 29, 24, 30, 19),
                 assists=c(5, 5, 7, 4, 10))

print(df)

#close the external connection
sink()
```
