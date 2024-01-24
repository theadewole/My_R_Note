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

#MISSING DATA IN CATEGORICAL VARIABLES
custdata$is.employed.fix <- ifelse(is.na(custdata$is.employed),
                                   "missing",
                                   ifelse(custdata$is.employed==T,
                                          "employed",
                                          "not employed"))

summary(as.factor(custdata$is.employed.fix))
#Remapping NA to a level
custdata$is.employed.fix <- ifelse(is.na(custdata$is.employed),
                                   "not in active workforce",
                                   ifelse(custdata$is.employed==T,
                                          "employed",
                                          "not employed"))

summary(as.factor(custdata$is.employed.fix))

#MISSING VALUES IN NUMERIC DATA
summary(custdata$Income)
meanIncome <- mean(custdata$Income, na.rm=T)
Income.fix <- ifelse(is.na(custdata$Income),
                     meanIncome,
                     custdata$Income)
summary(Income.fix)

#WHEN VALUES ARE MISSING SYSTEMATICALLY
# Converting missing numeric data to a level
breaks <-c(0, 10000, 50000, 100000, 250000, 1000000)
Income.groups <-
  cut(custdata$Income,
      breaks=breaks, include.lowest=T)

summary(Income.groups)

Income.groups <- as.character(Income.groups)

Income.groups <- ifelse(is.na(Income.groups),
                          "no income", Income.groups)

summary(as.factor(Income.groups))


missingIncome <- is.na(custdata$Income)

Income.fix <- ifelse(is.na(custdata$Income), 0, custdata$Income)

################################################################################
#Data transformations
################################################################################
#Normalizing income by state
summary(medianincome)
custdata <- merge(custdata, medianincome,
                  by.x="state.of.res", by.y="State")

summary(custdata[c("state.of.res", "income", "Median.Income.x")])

custdata$income.norm <- with(custdata, income/Median.Income.x)

summary(custdata$income.norm)



