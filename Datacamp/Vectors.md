## Creating vector
- c() combine/concatenation Function .<br>
You create a vector with the combine function c(). You place the vector el``ements separated by a comma between the parentheses
```
~ numeric_vector <- c(1, 10, 49)
~ character_vector <- c("a", "b", "c")
~ boolean_vector <-c(TRUE,FALSE,TRUE)
```
- Creating Vector
```
poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <-  c(-24, -50, 100, -350, 10)
```
## Naming a vector 
names ()
```
- Method 1
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <-  days_vector 
names(roulette_vector) <- days_vector
- Method 2
names(poker_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
```
## Performing calculation in vector
Summing  two vectors in R, it takes the element-wise sum; <br>
c(1, 2, 3) + c(4, 5, 6) <br>
c(1 + 4, 2 + 5, 3 + 6) <br>
c(5, 7, 9) <br>
```
A_vector <- c(1, 2, 3)
B_vector <- c(4, 5, 6)
Take the sum of A_vector and B_vector
total_vector <- A_vector+B_vector
```
- sum ()
It calculates the sum of all elements of a vector
```
- Total winnings with poker
total_poker <- sum(poker_vector)
- Total winnings with roulette
total_roulette <- sum(roulette_vector) 
- Total winnings overall
total_week <- sum(poker_vector + roulette_vector)
```
- Comparing two vectors
```
total_poker <- sum(poker_vector)
total_roulette <- sum(roulette_vector)
~ Check if you realized higher total gains in poker than in roulette
total_poker > total_roulette
```
## Vector Selection 
To select the first element of the vector, vector [1] <br>
To select the second element of the vector, vector [2] <br>
```
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
~ Define a new variable based on a selection
poker_wednesday <- poker_vector[3]
~ Selecting more than one variable 
poker_midweek <- poker_vector [c(2,3,4)]
roulette_selection_vector <- roulette_vector[c(2:5)]
```
## Selection by Logical operators
The (logical) comparison operators known to R are:
- < for less than
- > for greater than
- <= for less than or equal to
- >= for greater than or equal to
- == for equal to each other
- != not equal to each other <br>
e.g 6 > 5 returns TRUE <br>
c(4, 5, 6) > 5 <br>
Returns [1] FALSE FALSE TRUE <br>
```
~ Which days did you make money on poker
selection_vector <- poker_vector [c(1:5)] > 0
~ Which days did you make money on poker?
selection_vector <- poker_vector > 0
```
