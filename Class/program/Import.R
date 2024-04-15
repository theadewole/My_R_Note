################################################################################
#Reading CSV file 
################################################################################
#Adding the head function to the importing statement display row specified in console
#TRUE/1:indicates that the first row of the file contains column names.
#FALSE/0:indicates that the first row of the file does not contains column names.
Simulated <-read.csv("C:\\Users\\AFSS-Student\\Documents\\Internship\\Week 5-6\\Simulated_9-4-23.csv", 
           header = TRUE)
head(Simulated,10)
#another method, the sep function specifies the kind of delimiter used
Simulated <-read.csv("C:\\Users\\AFSS-Student\\Documents\\Internship\\Week 5-6\\Simulated_9-4-23.csv", 
                     sep=",",header=0)
################################################################################
#Text file
################################################################################
cencus <-read.delim("C:\\Users\\AFSS-Student\\Downloads\\DATA\\census.txt",sep = " ",
                  header = F)
################################################################################
#Excel file 
################################################################################
library(readxl)
boot <- read_excel("C:\\Users\\AFSS-Student\\Documents\\Base-guide-practise-data\\cert\\boots.xlsx",
                   sheet=1)

bike <- read_excel("C:\\Users\\AFSS-Student\\Downloads\\Excel Project Dataset.xlsx",
                   sheet ="bike_buyers")
################################################################################
#Importing SAS dataset
################################################################################
library(haven)
Dm <- read_sas("C:\\Users\\AFSS-Student\\Documents\\Internship Series\\03.QC of SDTM Datasets Development (Demography and Disposition)\\Work\\07Output\\dm.sas7bdat")

################################################################################
#Read Table option for CSV and TXT file 
################################################################################
co2 <- read.table("C:\\Users\\AFSS-Student\\Documents\\R\\Material From Dr\\Ending Jan 12 (Part 1) - Lecture 2 - Introduction to R\\CO2.csv",
           sep=',', header = T)
bio <- read.table("C:\\Users\\AFSS-Student\\Documents\\DATA\\class.txt",
                      sep=" ",header=F)
################################################################################
# Loading an rdata
################################################################################
load("exampleData.rData")
# the above method is usfel whwn the location of the rdata is in the working drive
load("C:\\Users\\AFSS-Student\\Documents\\R\\Dataset\\exampleData.rData")

