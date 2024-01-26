In R, you can perform cross-tabulation (also known as contingency table analysis) using the table() function or the xtabs() function. 
These functions are useful for summarizing the distribution of categorical variables and examining the relationships between them.
# Table ()  
```table(..., exclude = if (useNA == "no") c(NA, NaN))``` <br>
- ...: One or more categorical variables or factors separated by commas.
These variables will be used to create the contingency table.
- exclude: An optional argument specifying which levels to exclude when creating the table.
By default, it excludes NA and NaN values. You can customize this argument based on your needs.
```
~ Example data
gender <- c("Male", "Female", "Male", "Male",
"Female", "Female", "Male", "Female")
education <- c("High School", "College", "College", "High School",
 "College", "High School", "College", "High School")
~ Create a data frame
data <- data.frame(Gender = gender, Education = education)
~ Create a cross-tabulation using table()
cross_table <- table(data$Gender, data$Education)
~ Print the result
print(cross_table)
```
# xtab ()
```xtabs(formula, data = NULL, sparse = FALSE, ...)``` <br>
- formula: A formula of the form response ~ predictor1 + predictor2 + ....It defines the variables to be cross-tabulated.
- data: An optional data frame containing the variables in the formula.
sparse: A logical value indicating whether the result should be a sparse matrix. Default is FALSE.
- ...: Additional arguments. <br>
```
~ Example data
gender <- c("Male", "Female", "Male", "Male", "Female",
"Female", "Male", "Female")
education <- c("High School", "College", "College", "High School",
"College", "High School", "College", "High School")
~ Create a data frame
data <- data.frame(Gender = gender, Education = education)
~ Create a cross-tabulation using xtabs()
cross_table <- xtabs(~ Gender + Education, data = data)
~ Print the result
print(cross_table)
```
