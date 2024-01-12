The term factor refers to a statistical data type used to store categorical variables. <br>
The difference between a categorical variable and a continuous variable is that a categorical variable can belong to a limited number of categories. <br>
A continuous variable, on the other hand, can correspond to an infinite number of values.<br>
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
