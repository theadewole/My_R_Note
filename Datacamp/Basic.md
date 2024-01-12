## Adding comment 
R makes use of the # sign to add comments, so that you and others can understand what the R code is about. 
```
- Calculate 3 + 4
3 + 4
- Calculate 6 + 12
6 + 12
```
## Arithmetic with R
In its most basic form, R can be used as a simple calculator. Consider the following arithmetic operators:
- Addition: +
- Subtraction: -
- Multiplication: *
- Division: /
- Exponentiation: ^
- Modulo: %%
```
- An addition
5 + 5 
- A subtraction
5 - 5 
- A multiplication
3 * 5
- A division
(5 + 5) / 2 
- Exponentiation
2^5
- Modulo
28 %% 6
```

## Variable assignment
A basic concept in (statistical) programming is called a variable.
A variable allows you to store a value (e.g. 4) or an object (e.g. a function description) in R. You can then later use this variable's name to easily access the value or the object that is stored within this variable.
You can assign a value 4 to a variable my_var with the command
* my_var <- 4
```
- Assign the value 42 to x
x <- 42
- Print out the value of the variable x
x
Examples
my_apples <- 5
my_oranges <- 6
- Add these two variables together
my_apples+my_oranges
Create the variable my_fruit
my_fruit <- my_apples+my_oranges
```
## Basic data types in R
R works with numerous data types. Some of the most basic types to get started are:
* Decimal values like 4.5 are called numerics.
* Whole numbers like 4 are called integers. Integers are also numerics.
* Boolean values (TRUE or FALSE) are called logical.
*Text (or string) values are called characters.
```
- Change my_numeric to be 42
my_numeric <- 42
- Change my_character to be "universe"
my_character <- "universe"
- Change my_logical to be FALSE
my_logical <- FALSE
```
### class () function
Can be used to check the data type of a variable 
```
Declare variables of different types
my_numeric <- 42
my_character <- "universe"
my_logical <- FALSE 

-Check class of my_numeric
class(my_numeric)

- Check class of my_character
class (my_character)

- Check class of my_logical
class (my_logical)
```
