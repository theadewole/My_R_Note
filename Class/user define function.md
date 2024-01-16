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
