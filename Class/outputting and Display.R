#Saving  data frame or matrix
################################################################################
y <- matrix(c("A","B","C","D","E","F","G","H","I","J","K","L"),nrow=3,ncol=4, byrow=TRUE,
            dimnames = list(rows=c("Cat", "Rat", "Dog"),
                          cols=c("Meat", "Fish", "Crap", "Pork")))
################################################################################
#Using the Write. option
################################################################################
#saving as text file 
write.table(y, file ="C:\\Users\\AFSS-Student\\Documents\\R\\Output\\matrix.txt",
            sep=" ")

#To export a dataset to a tab-delimited file, set the sep argument to "\t" (which denotes the tab symbol)
write.table(y, file = "C:\\Users\\AFSS-Student\\Documents\\R\\output\\matrixtab.txt", sep = "\t")

#By default, the write.csv and write.table functions create an extra column in the 
#file containing the observation numbers. To prevent this, set the row.names argument to F.
write.table(y, file ="C:\\Users\\AFSS-Student\\Documents\\R\\Output\\matrix.txt",sep="\t",
            row.names=F)

#You can also prevent variable names from being placed in the first line of the file with the col.names argument.
write.table(y, file = "C:\\Users\\AFSS-Student\\Documents\\R\\output\\matrixtab.txt", 
            sep = "\t", col.names=F)

#To remove both row and col names
write.table(y, file = "C:\\Users\\AFSS-Student\\Documents\\R\\output\\matrixtab.txt", 
            sep = "\t", row.names=F, col.names=F)

################################################################################
#Saving Csv file 
################################################################################
write.csv(df,"C:\\Users\\AFSS-Student\\Documents\\R\\output\\df.csv")
print(y)
################################################################################
#to view dataframe in script
################################################################################
View(Dm)
################################################################################
#Sink 
################################################################################
sink("C:\\Users\\AFSS-Student\\Documents\\R\\data.txt",append=F,split =F)
#define data frame to write to file
df <- data.frame(player=c('A', 'B', 'C', 'D','E'),
                 points=c(12, 29, 24, 30, 19),
                 assists=c(5, 5, 7, 4, 10))

print(df)

#close the external connection
sink()
