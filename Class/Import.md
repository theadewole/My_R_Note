# Reading CSV file 
```
Adding the head function to the importing statement display row specified in the console
TRUE/1:indicates that the first row of the file contains column names.
ALSE/0:indicates that the first row of the file does not contains column names.
Simulated <-read.csv("C:\\Users\\AFSS-Student\\Documents\\Internship\\Week 5-6\\Simulated_9-4-23.csv", 
           header = TRUE)
head(Simulated,10)
- Another method, the sep function specifies the kind of delimiter used
Simulated <-read.csv("C:\\Users\\AFSS-Student\\Documents\\Internship\\Week 5-6\\Simulated_9-4-23.csv", 
                     sep=",",header=0)
```
# Text file
```
cencus <-read.delim("C:\\Users\\AFSS-Student\\Downloads\\DATA\\census.txt",sep = " ",
                  header = F)
```
# Excel file 
```
library(readxl)
boot <- read_excel("C:\\Users\\AFSS-Student\\Documents\\Base-guide-practise-data\\cert\\boots.xlsx",
                   sheet=1)

bike <- read_excel("C:\\Users\\AFSS-Student\\Downloads\\Excel Project Dataset.xlsx",
                   sheet ="bike_buyers")
```

# Importing SAS dataset
```
library(haven)
Dm <- read_sas("C:\\Users\\AFSS-Student\\Documents\\Internship Series\\03.QC of SDTM Datasets Development (Demography and Disposition)\\Work\\07Output\\dm.sas7bdat")
```