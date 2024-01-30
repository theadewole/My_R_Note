# Cleaning Data
```
~ Importing the rdata file containing the datasets to be used 
load("C:\\Users\\Adewole\\Documents\\AFSS\\R\\Dataset\\exampleData.rData")
```
## Treating missing values (NAs)
Fundamentally, there are two things you can do with these variables: drop the rows with missing values, or convert the missing values to a meaningful value
This poses a question of *To Drop or Not to Drop*
- Checking locations of missing data
```
summary(custdata[is.na(custdata$housing.type),       >- Restrict to the rows where housing.type is NA.
                 c("recent.move","num.vehicles")])    >- Look only at the columns recent.move and num.vehicles

summary(custdata[c("housing.type","recent.move","num.vehicles","is.employed")])
```
### Missing Data in categorical variable (Character)
```
custdata$is.employed.fix <- ifelse(is.na(custdata$is.employed),     >- If is.employed value is missing
      "missing",                                                    >-..assign the value "missing". Otherwise..
         ifelse(custdata$is.employed==T,                            >- ...if is.employed==TRUE, assign the value "employed"...
             "employed",
                   "not employed"))                                 >-..or the value "not employed"

~ The transformation has turned the variable type from factor to string.
             You can change it back with the as.factor() function
summary(as.factor(custdata$is.employed.fix))
```
##### Remapping NA to a level as "not in active workforce"
```
custdata$is.employed.fix <- ifelse(is.na(custdata$is.employed),
                                   "not in active workforce",
                                   ifelse(custdata$is.employed==T,
                                          "employed",
                                          "not employed"))
```
In the above, the corrected column was assigned to a new column (employed.fix) so as not to alter the dataset

### Missing Values in Numeric data
Suppose your income variable is missing substantial data

