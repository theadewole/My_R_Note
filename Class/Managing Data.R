################################################################################
#importing the dataset 
################################################################################
custdata <- read.table("C:\\Users\\AFSS-Student\\Documents\\R\\Dataset\\custdata.tsv",
           header = T, sep = "\t")
#or
load("C:\\Users\\AFSS-Student\\Documents\\R\\Dataset\\exampleData.rData")
################################################################################
#Cleaning data
################################################################################
summary(custdata[is.na(custdata$housing.type),
                 c("recent.move","num.vehicles")])

summary(custdata[c("housing.type","recent.move","num.vehicles","is.employed")])
summary(custdata$is.employed)

#MISSING DATA IN CATEGORICAL VARIABLES
custdata$is.employed.fix <- ifelse(is.na(custdata$is.employed),
                                   "missing",
                                   ifelse(custdata$is.employed==T,
                                          "employed",
                                          "not employed"))

summary(as.factor(custdata$is.employed.fix))
#Remapping NA to a level as "not in active workforce"
custdata$is.employed.fix <- ifelse(is.na(custdata$is.employed),
                                   "not in active workforce",
                                   ifelse(custdata$is.employed==T,
                                          "employed",
                                          "not employed"))

summary(as.factor(custdata$is.employed.fix))

#MISSING VALUES IN NUMERIC DATA
summary(custdata$Income)
#WHEN VALUES ARE MISSING RANDOMLY
#na.rm = TRUE instructs the mean() function to exclude the NA values when calculating the mean
meanIncome <- mean(custdata$Income, na.rm=T)

Income.fix <- ifelse(is.na(custdata$Income),
                     meanIncome,
                     custdata$Income)
summary(Income.fix)

#WHEN VALUES ARE MISSING SYSTEMATICALLY
# Converting missing numeric data to a level
#Select some income ranges of interest. To use the cut() function, the upper and 
  #lower bounds should encompass the full income range of the data.
breaks <-c(0, 10000, 50000, 100000, 250000, 1000000)

#Cut the data into income ranges. The include.lowest=T argument makes sure that zero
  #income data is included in the lowest income range category. By default it would be excluded.
Income.groups <-
  cut(custdata$Income,
      breaks=breaks, include.lowest=T) 

#The cut() function produces factor variables. Note the NAs are preserved.
summary(Income.groups)

#To preserve the category  names before adding a  new category, convert  the variables to strings.
Income.groups <- as.character(Income.groups)

#Add the "no income" category to replace the NAs.
Income.groups <- ifelse(is.na(Income.groups),
                          "no income", Income.groups)

summary(as.factor(Income.groups))

#Tracking original NAs with an extra categorical variable
#The missingIncome variable lets you differentiate the two kinds of zeros in the data: 
  #the ones that you are about to add, and the ones that were already there
missingIncome <- is.na(custdata$Income)
#Replace the NAs with zeros
Income.fix <- ifelse(is.na(custdata$Income), 0, custdata$Income)

################################################################################
#Data transformations
################################################################################
#Normalizing income by state
#Suppose medianincome is a data frame of median income by state
summary(medianincome)
#Merge median income information into the custdata data frame by matching the column 
  ##custdata$state.of.res to the column medianincome$State
custdata <- merge(custdata, medianincome,
                  by.x="state.of.res", by.y="State")

#Median.Income is now part of custdata.
summary(custdata[c("state.of.res", "income", "Median.Income.x")])
#Normalize  income by  Median.Income
custdata$income.norm <- with(custdata, income/Median.Income.x)

summary(custdata$income.norm)



