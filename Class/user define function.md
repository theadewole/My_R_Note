## Automation 
While applying built-in functions facilitates many common tasks, often we need to create our own function to automate the performance of a particular task. 
To declare a user-defined function in R, we use the keyword function.
```
function_name <- function(argument_1, argument_2) {  
  function body
  return (output)
}
````
- Function name. To create a UDF, first you have to assign it a name and save it as a new object. You just have to call the name whenever you want to use the function. 
- Arguments. The function arguments (also known as parameters) are provided within the parentheses. Arguments are key for the function to know what data to take as input and/or how to modify the behavior of the function. 
- Function body. Within curly brackets comes the body of the function, that is, the instructions to solve a specific task based on the information provided by the arguments. 
- Return statement. The return statement is required if you want the function to save as variables the result or results following the operations in the function body.<br>
Note: the last argument is what is been executed <br>
### Function without argument 
It's possible, even though rarely useful, for a function to have no parameters
```
hello_world <- function(){
  'Hello, World!'
}
print(hello_world())
______________________________________________________________________________________________
test <- function(){
  3*5
}
test ()
```
### Function with argument 
```
my_first_function <- function(x) {
  y <- 3*x
  y + 1
}
my_first_function(2)
______________________________________________________________________________________________________________________
Calculating change in radius 
circumference <- function(r){
  2*pi*r
}
print(circumference(5))
_________________________________________________________________________________________________________________________
Calculate the interest when principal changes with a fixed rate (25) and year (2)
interest <- function(p){
  m <-p*25*2
  m/100
}
interest(10000)
```

### Specifying more than 1 argument
```
sum_two_nums <- function(x, y){
  x + y
}
print(sum_two_nums(1, 2))
                                                                              OR
It's possible to drop the curly braces if the function body contains a single statement
sum_two_nums <- function(x, y) x + y
print(sum_two_nums(1, 2))
_______________________________________________________________________________________________________________________
Complete formula for simple interest
interest_formula <- function(p,r,t){
  m <-p*r*t
  m/100
}
interest_formula(10000,25,2)
````
### Using the return statement in the function body 
As we saw from all the above examples, in R, it usually isn't necessary to explicitly include the return statement when defining a function since an R function just automatically returns the last evaluated expression in the function body. However, we still can add the return statement inside the function body using the syntax return(expression_to_be_returned). This becomes inevitable if we need to return more than one result from a function
```
With vector
mean_median <- function(vector){
  mean <- mean(vector)
  median <- median(vector)
  return(c(mean, median))
}
print(mean_median(c(1, 1, 1, 2, 3)))
___________________________________________________________________________________________________________________________
With matrix
mean_median_sd <- function(matrix){
  mean <- mean(matrix)
  median <- median(matrix)
  sd <- sd(matrix)
  return(c(mean, median,sd))
}
mean_median_sd(matrix(c(5,0,6,1,3,5,9,5,7,1,5,3),nrow=3,ncol=4, byrow=TRUE,
                      dimnames = list(rows=c("r.1", "r.2", "r.3"),
                                      cols=c("c.1", "c.2", "c.3", "c.4"))))
```
### Calling a Function
In all the above examples, we actually already called the created functions many times. To do so, we just put the punction name and added the necessary arguments inside the parenthesis. In R, function arguments can be passed by position, by name (so-called named arguments), by mixing position-based and name-based matching, or by omitting the arguments at all.
```
passing argument by name when calling 
subtract_two_nums <- function(x, y){
  x - y
}
print(subtract_two_nums(x=3, y=1))
print(subtract_two_nums(y=1, x=3))
____________________________________________________________________________________________________________________
BMR (basal metabolic rate), or daily consumption of calories, for women based on their
weight (in kg), height (in cm), and age (in years)
calculate_calories_women <- function(weight, height, age){
  (10 * weight) + (6.25 * height) - (5 * age) - 161
}
Passing argument by name and position
print(calculate_calories_women(age=30, 60, 165))
print(calculate_calories_women(age=30, weight=60, height=165))
```
### Using Functions Inside Other Functions (Nesting)
```
mean_median <- function(vector){
  mean <- mean(vector)
  median <- median(vector)
  return(c(mean, median))
}
mean_median(round(rnorm(10,3,4),3))
```
In the below piece of code, we created two simple functions first: for calculating the radius of a circle given its diameter and for calculating the circumference of a circle given its radius. Since originally we knew only the diameter of a circle (equal to 4), we called the radius_from_diameter function inside the circumference function to calculate first the radius from the provided value of diameter and then calculate the circumference of the circle. While this approach can be useful in many cases, we should be careful with it and avoid passing too many functions as arguments to other functions since it can affect the code readability.
```
calc circumference 
radius_from_diameter <- function(d){
  d/2
}

circumference <- function(r){
  2*pi*r
}
print(circumference(radius_from_diameter(4)))
______________________________________________________________________________________________________
sum_circle_ares <- function(r1, r2, r3){
  circle_area <- function(r){
    pi*r^2
  }
  circle_area(r1) + circle_area(r2) + circle_area(r3)
}

print(sum_circle_ares(1, 2, 3))
```

When nesting functions, we have to keep in mind two things <br>
- Similar to creating any function, the inner function is supposed to be used at least 3 times inside the outer function. Otherwise, it isn't viable to create it.
- If we want to be able to use the function independent of the bigger function, we should create it outside the bigger function instead of nesting these functions.
```
If we want to be able to use the function independent of the bigger function 
circle_area <- function(r){
  pi*r^2
}

sum_circle_ares <- function(r1, r2, r3){
  circle_area(r1) + circle_area(r2) + circle_area(r3)
}

print(sum_circle_ares(1, 2, 3))
print(circle_area(10))
```
