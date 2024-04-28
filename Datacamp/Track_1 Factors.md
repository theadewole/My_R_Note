The term factor refers to a statistical data type used to store categorical variables. <br>
The difference between a categorical variable and a continuous variable is that a categorical variable can belong to a limited number of categories. <br>
A continuous variable, on the other hand, can correspond to an infinite number of values.<br>
- x: A vector of values to be converted to a factor.
- levels: An optional argument specifying the levels of the factor. If not provided, the unique values in x are used as levels.
- labels: An optional argument specifying labels for the levels.
- ordered: An optional logical argument indicating whether the factor should be treated as an ordered factor.
```
factor(x, levels, labels, ordered = FALSE)
```
## Applying the factor function 
```
Sex vector
sex_vector <- c("Male", "Female", "Female", "Male", "Male")
~ Convert sex_vector to a factor
factor_sex_vector <-factor(sex_vector)
```
## Types of categorical variable  
- Nominal categorical variable <br>
A nominal variable is a categorical variable without an implied order. <br>
This means that it is impossible to say that 'one is worth more than the other'
```
animals_vector <- c("Elephant", "Giraffe", "Donkey", "Horse")
factor_animals_vector <- factor(animals_vector)
```
- Ordinal categorical variable.
ordinal variables do have a natural ordering
```
temperature_vector <- c("High", "Low", "High","Low", "Medium")
factor_temperature_vector <- factor(temperature_vector, order = TRUE, levels = c("Low", "Medium", "High"))
```
## Factor Levels 
When you first get a dataset, you will often notice that it contains factors with specific factor levels. However, sometimes you will want to change the names of these levels for clarity or other reasons. R allows you to do this with the function levels() <br>
This helps to modify the default level for clarity 
```
levels(factor_vector) <- c("name1", "name2",...)
```
```
~ Code to build factor_survey_vector
survey_vector <- c("M", "F", "F", "M", "M")
factor_survey_vector <- factor(survey_vector)
~ Specify the levels of factor_survey_vector
levels(factor_survey_vector) <- factor(survey_vector)
levels(factor_survey_vector) <- c("Female", "Male")
```
## Summarizing a factor
After finishing this course, one of your favorite functions in R will be summary(). This will give you a quick overview of the contents of a variable: <br>
              summary(my_var)
```
~Generate summary for survey_vector
summary(survey_vector)
~Generate summary for factor_survey_vector
summary(factor_survey_vector)
```
### Comparing factors 
You might wonder what happens when you try to compare elements of a factor. In factor_survey_vector you have a factor with two levels: "Male" and "Female". But how does R value these relative to each other?
```
~Male
male <- factor_survey_vector[1]
~Female
female <- factor_survey_vector[2]
~ Battle of the sexes: Male 'larger' than female?
male > female
~ Response
"Warning message: ‘>’ not meaningful for factors
[1] NA"
```
## Ordered factors
Since "Male" and "Female" are unordered (or nominal) factor levels, R returns a warning message, telling you that the greater than operator is not meaningful. As seen before, R attaches an equal value to the levels for such factors. <br>
But this is not always the case! Sometimes you will also deal with factors that do have a natural ordering between its categories.
```
~ Create speed_vector
speed_vector <- c("medium","slow","slow","medium","fast"
~ Convert speed_vector to ordered factor vector
factor_speed_vector <- factor(speed_vector,ordered=T,
 levels=c("slow", "medium", "fast"))
~ Print factor_speed_vector
factor_speed_vector
summary(factor_speed_vector)
```
Comparing ordered factors
```
~Factor value for second data analyst
da2 <- factor_speed_vector[2]
~Factor value for fifth data analyst
da5 <- factor_speed_vector[5]
~Is data analyst 2 faster than data analyst 5?
da2 > da5
Response
da2 > da5
[1] FALSE
```
