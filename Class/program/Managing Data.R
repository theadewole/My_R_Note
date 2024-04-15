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

#################################
#Checking location of missing data
##################################
summary(custdata[is.na(custdata$housing.type),
                 c("recent.move","num.vehicles")])

summary(custdata[c("housing.type","recent.move","num.vehicles","is.employed")])
summary(custdata$is.employed)

distinct(custdata,is.employed)
################################################################################
#MISSING DATA IN CATEGORICAL VARIABLES
################################################################################
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

custdata$income.lt.20K <- custdata$income < 20000
summary(custdata$income.lt.20K)
###################################
#Select the age ranges of interest. 
#The upper and lower bounds should encompass the full range of the data
##################################
brks <- c(0, 25, 65, Inf)

#################################
#Cut the data into age ranges. The include.lowest=T argument makes sure that zero age data is
#included in the lowest age range category. By default it would be excluded
################################
custdata$age.range <- cut(custdata$age,
                          breaks=brks, include.lowest=T)
#The output of cut() is a factor variable
summary(custdata$age.range)

#NORMALIZATION AND RESCALING
#Centering on mean age
summary(custdata$age)
meanage <- mean(custdata$age)
custdata$age.normalized <- custdata$age/meanage
summary(custdata$age.normalized)

#Summarizing age
summary(custdata$age)
# Take the mean 
meanage <- mean(custdata$age)
# Take the Sd
stdage <- sd(custdata$age)
########################################
#Use the mean value as the origin (or reference point) and rescale 
#the distance from the mean by the standard deviation
########################################
custdata$age.normalized <- (custdata$age-meanage)/stdage

summary(custdata$age.normalized)

###############################
signedlog10 <- function(x) {
  ifelse(abs(x) <= 1, 0, sign(x)*log10(abs(x)))
}

signedlog10(10)

###########################


#Creating a sample group column
##########################
#Splitting into test and training using a random group mark Splitting into test 
#and training using a random group mark
##########################

##########################
#dim(custdata) returns the number of rows  and columns of the data frame as a vector, 
 #so dim(custdata)[1] returns the number of rows.
############################
custdata$gp <- runif(dim(custdata)[1])

#########################
#Here we generate a test set of about
#10% of the data (93 customers—a little over 9%, actually) and train on the remaining 90%.
########################
testSet <- subset(custdata, custdata$gp <= 0.1)

########################
#Here we generate a training using the remaining data
#######################
trainingSet <- subset(custdata, custdata$gp > 0.1)

dim(testSet)[1]
dim(trainingSet)[1]

#Ensuring test/train split doesn’t split inside a household
#####################
#Get all unique household IDs from your data frame
####################
hh <- unique(hhdata$household_id)

#########################
#Create a temporary data frame of household IDs and a uniformly random number from 0 to 1
#########################
households <- data.frame(household_id = hh, gp = runif(length(hh)))

########################
#Merge new random sample group column back into original data frame
########################
hhdata <- merge(hhdata, households, by="household_id")




                  