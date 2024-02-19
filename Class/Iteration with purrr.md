```
lm(price ~ carat + cut + color + clarity, data = diamonds)

a_list <- list(num = c(8, 9),
               log = TRUE,
               cha = c("a", "b", "c"))

a_list["num"]
a_list$num

vec <- c(-2, -1, 0, 1, 2)
abs(vec)

lst <- list(-2, -1, 0, 1, 2)
abs(lst)

set.seed(1000)
exams <- list(
student1 <- round(runif(10,50,100)),
student2 <- round(runif(10,50,100)),
student3 <- round(runif(10,50,100)),
student4 <- round(runif(10,50,100)),
student5 <- round(runif(10,50,100))
)

mean(exams)


list(student1 = mean(exams$student1),
     student2 = mean(exams$student2),
     student3 = mean(exams$student3),
     student4 = mean(exams$student4),
     student5 = mean(exams$student5))
```
# purrr
purrr is particularly useful for tasks involving iteration, data transformation, and working with complex data structures like lists. 
It promotes a concise and expressive coding style, especially when working with functions and data manipulation tasks. 
It's a powerful tool for data wrangling and analysis
- Functional Programming: purrr provides a set of functions for functional programming, including mapping, reducing, filtering, and more.
- Mapping Functions: map(), map2(), pmap(), imap(), etc., allow you to apply a function to each element of a list or multiple lists.
- Mapping Shortcuts: There are versions of mapping functions that automatically select the appropriate variant based on the type of output: map_lgl(), map_int(), map_dbl(), map_chr().
- List Utilities: set_names(), flatten(), transpose(), modify(), etc., provide utilities for manipulating and working with lists.
- Predicate Functions: every(), some(), detect(), keep(), etc., help with predicate functions and logical operations.
- Functional Operators: compose(), %<%, %T>%, etc., provide functional operators for composing functions.
- Error Handling: safely(), possibly(), quietly(), etc., provide tools for handling errors in functional programming.
- Vectors: reduce(), accumulate(), compact(), etc., work with vectors, providing operations similar to those for lists.
## map()
```map(.x, .f, …)``` <br>
- x:A list
- f:A function to apply to each element of the list (element become first argument)
- ...: Other arguments to pass to the function

```
~ using the map function to calculate the mean of the exams list
map(exams, mean)

exams %>%
map(mean)

~ var of the list
exams %>%
map(var)
```
****function returns results as:***** <br>
- map() list
- map_chr(): character vector
- map_dbl(): double vector (numeric)
- map_int(): integer vector
- map_lgl(): logical vector
- map_df(): data frame
### map_dbl()
 It is used to apply a function to each element of a list or vector and simplify the results into a numeric vector <br>
```map_dbl(.x, .f, ...)``` 
- .x: A list or vector.
- .f: A function to apply to each element of .x.
- ...: Additional arguments passed to the function .f.
```
~ mean of exams 
exams %>%
  map_dbl(mean)
~ 90th percentile score
exams %>%
  map_dbl(quantile, prob = 0.9)
~ Calculate the max grade (max())for each student. Return theresult as a vector
exams %>%
  map_dbl(max)
```
### map_lgl()
It is used to apply a function to each element of a list or vector and simplify the results into a logical vector <br>
```map_lgl(.x, .f, ...)```
- .x: A list or vector.
- .f: A function to apply to each element of .x.
- ...: Additional arguments passed to the function .f.
```
exams %>%
  map(length) %>%
  map_lgl(all.equal, 10)
```
## function()
```
set.seed(1000)
exams <- list(
  student1 = round(runif(10,50,100)),
  student2 = round(runif(10,50,100)),
  student3 = round(runif(10,50,100)),
  student4 = round(runif(10,50,100)),
  student5 = round(runif(10,50,100)))

~ Write code that solves the problem for a real object
vec <- exams$student1
(sum(vec) - min(vec)) / (length(vec) - 1)
vec <- exams$student2
(sum(vec) - min(vec)) / (length(vec) - 1)
vec <- exams$student3
(sum(vec) - min(vec)) / (length(vec) - 1)
vec <- exams$student4
(sum(vec) - min(vec)) / (length(vec) - 1)
vec <- exams$student5
(sum(vec) - min(vec)) / (length(vec) - 1)

~ Wrap the code in function(){} to save it
vec <- exams[[1]]
grade <- function(vec) {
  (sum(vec) - min(vec)) / (length(vec) - 1)
}

grade(exams[[1]])

~ Write code that solves the problem for a real object Wrap the code in function(){} to save it 
~ Add the name of the real object as the function argument 
~ To run the function, call the object followed by parentheses. Supply new values to use for each of the arguments

grade <- function(vec) {
  (sum(vec) - min(vec)) / (length(vec) - 1)
}
exams %>%
  map_dbl(grade)
                                Another method
grade <- function(x) (sum(x) - min(x)) / (length(x) - 1)
exams %>%
  map_dbl(grade)

~ Write code that solves the problem for a real object 
~ Wrap the code in function(){} to save it 
~ Add the name of the real object as the function argument
grade <- function(x){
  (sum(x)+max(x))/(length(x)+1)
}

exams %>% 
  map_dbl(grade)

                                Another method
exams %>%
  map_dbl(function(x) (sum(x) + max(x)) / (length(x) + 1))
```
## map2()
![Screenshot 2024-02-19 154647](https://github.com/theadewole/My_R_Note/assets/108795960/77ba0c7b-f689-43cd-868e-bc5b2c6a0a0d)
It is used to apply a function with two arguments to corresponding elements of two lists or vectors
```map2(.x, .y, .f, ...)```
- .x: The first list or vector.
- .y: The second list or vector.
- .f: A function to apply to corresponding elements of .x and .y.
- ...: Additional arguments passed to the function .f.
```
~ Compute a final grade for each student, where the final grade is the average test score plus any extra credit assigned to the student. 
~ Return the results as a double (i.e. numeric) vector
extra_credit <- list(0,0,10,10,15)
exams %>% 
  map2_dbl(extra_credit, function(x, y) mean(x) + y)
```
