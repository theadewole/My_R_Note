# Importing dataset
```
Note: the dataset does not have the column header
Biodata <- read.table("C:\\Users\\AFSS-Student\\Documents\\DATA\\class.txt",
                      sep=" ",header=F)
biodata <- read.table("C:\\Users\\AFSS-Student\\Documents\\DATA\\class.txt",
                      sep=" ",header=F)
```
# Adding column headers to the data
```
colnames (Biodata) <- c('Name','sex','Age','Weight')
colnames (biodata) <- c('Name','sex','Age','Weight')
```
# Rename the column sex with ifelse
```
Biodata$sex <- ifelse(Biodata$sex=="F",'Female','Male')
```
# Converting vector to factor
```
Creating a vector 
sex<-c("female", "male", "shemal", "female") 
Using as.factor() Function
as.factor(sex)
```
## Applying as factor to a dataset 
```
- method 1
At  the point of applying the rename to the sex column with the ifelse statement and creating a new column called gender which is a factor
biodata$Gender <- as.factor(ifelse(biodata$sex=="F",'Female','Male'))
Checking the structure of the dataset
str(biodata)
- Method 2
Biodata$sex <- as.factor(Biodata$sex)
str(Biodata)
```
# Creating a new column with ifelse statement for more than one condition
```
library(readxl)
exe <-read_excel("C:\\Users\\AFSS-Student\\Documents\\Base-guide-practise-data\\cert\\exercise.xlsx",
                 sheet=1)
exe$Sex <- as.factor(exe$Sex)
exe$age_grp <- as.factor(ifelse(exe$Age<30,"Young",ifelse(exe$Age>30 & exe$Age<=50,"Middle Age","Old")))
str(exe)
```
