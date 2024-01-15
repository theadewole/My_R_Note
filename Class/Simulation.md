## Runif Function 
You can use the runif() function to generate random values from a uniform distribution in R. <br>
runif(n, min=0, max=1). <br>
* n: The number of random values to generate
* min: The minimum value of the distribution (default is 0)
* max: The maximum value of the distribution (default is 1) <br>
```
~ Generating 10 random number between 1-20 
runif(10,1,20)
~ Adding Round functions to reduce decimal place 1 decimal place (whole number)
round(runif(20,10,300),0)
~ 1 decimal place 
round(runif(n=10, min=50, max=100), 1)
~ Applying with histogram generation. 
generate 1,000 random values from uniform distribution
value <- runif(n=1000, min=50, max=100)
hist(value)
~ using an already assigned variable length in place of n in the runif syntax
x <- c(1:7)
runif(x,7,15)
```
### set.seed()
To make the random number reproducible set.seed () what in the bracket can be  anything you like
```
set.seed(5)
val<- runif(10,1,20)
val
```
