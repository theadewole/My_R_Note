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
## rpois (poisson)
The Poisson distribution is a probability distribution that describes the number of events that occur within a fixed interval of time or space. It is often used when dealing with rare events that happen independently of each other. <br>
It's important to note that the Poisson distribution is often used in situations where events are rare and occur independently, and the average rate of occurrence (λ) is known. <br>
![Screenshot 2024-01-15 110827](https://github.com/theadewole/My_R_Note/assets/108795960/0f7b48a9-a620-413a-acf8-d8295d906257)
<br>
rpois(n,lambda) <br>
* n: The number of random values to generate
- lambda: Represents the average rate at which events occur in a Poisson distribution
```
~ Compute 5 random number at lambda of 5
rpois(5,3)
~ Compute 100 random number at lambda of 15 and plotting a scatter diagram 
set.seed(1000)
pat <- 100
y<-rpois(pat,15)
plot(y)
```
## rnorm ()
function is used to generate n random values from a normal distribution with a specific mean and standard deviation.<br>
rnorm(n,mean,sd)
```
rnorm(10,5,2)
round(rnorm(10,3,4))
~ with set.seed ()
set.seed(5)
n<-c(2000:2009)
m<-round(rnorm(10,3,4),3)
plot(m,n,"o",col="red",)
```
## rbinom()
Function which randomly generates numbers which follow a binomial distribution <br>
rbinom(n,size,prob)
- size:sample size
- prob=prob of success
```
rbinom(10,100,0.3)
~ Application
p <- round(runif(n=1000, min=1, max=1000),0)
set.seed(200)
rbinom(7,p,0.5)
```
## rgamma ()
In R, the rgamma function is used to generate random numbers from a gamma distribution. The gamma distribution is a two-parameter family of continuous probability distributions <br>
rgamma(n,shape,rate,scale) <br>
- n: Number of random deviates to generate.
- shape: The shape parameter of the gamma distribution.
- rate: The rate parameter of the gamma distribution. If omitted, the default value is 1. <br>
```
rgamma(10,1,1)
rgamma(val,1,1)
~ Application
x_dgamma <- seq(0, 2, by = 0.04)    
y_dgamma <- dgamma(x_dgamma, shape = 6)  
plot(y_dgamma) 
```
specify 'rate' or 'scale' but not both <br>
## rbeta()
In R, the rbeta function is used to generate random numbers from a beta distribution. The beta distribution is a continuous probability distribution defined on the interval [0, 1] <br>
rbeta(n,shape1,shape2,ncp) 
* n: Number of random deviates to generate.
* shape1: The first shape parameter of the beta distribution. It must be a positive number.
* shape2: The second shape parameter of the beta distribution. It must be a positive number. <br>
Here's a brief explanation of the parameters: <br>
Shape parameter 1 (shape1): This parameter determines the shape of the beta distribution. It must be a positive number.<br>
Shape parameter 2 (shape2): This parameter is the second shape parameter of the beta distribution. It must be a positive number. <br>
- Note <br>
the ncp parameter is not directly applicable. The ncp parameter stands for "non-centrality parameter," and it is commonly used in the context of distributions that have both a null hypothesis (central) and an alternative hypothesis (non-central). However, the beta distribution itself does not have a concept of a non-centrality parameter.
```
rbeta(10,2,4)
~ Application
set.seed(13579)
N <- 10000  
y_rbeta <- rbeta(N, shape1 = 1, shape2 = 5)   
y_rbeta
plot(density(y_rbeta), 
     main = "beta Distribution in R")
```
##### Excercise
```
~ Generate 100 numbers ~ N(0, 1)
rnorm(100,0,1)
~ Generate 50 numbers ~ N(10, 5)
rbeta(50,10,5)
~ Generate 1000 numbers ~ Poisson(50)
rpois(1000,50)
~ Generate 10 numbers ~ Beta(0.1, 0.1)
rbeta(10,0.1,0.1
~ Generate 30 numbers ~ Uniform(0, 10)
runif(30,0,10)
```
## replicate ()
The replicate() function in R is used to replicate the execution of an expression multiple times. It simplifies the process of running the same code multiple times and collecting the results. <br>
replicate(n, expr, simplify = "array") <br>
* n: The number of replications, i.e., how many times to repeat the expression.
* expr: The expression to be replicated.
* simplify: A logical or character string specifying whether to simplify the result.<br>
n: This is an integer specifying the number of times to replicate the expression. For example, if you want to run a simulation 100 times, you would set n = 100.<br>
expr: This is the expression to be replicated. It can be any valid R expression or function call. For instance, if you want to replicate the sampling of 10 random numbers from a normal distribution, your expression might be rnorm(10).<br>
simplify: This parameter controls whether the result should be simplified. The default is "array," which means that the result is simplified to an array if possible. Other possible values include "vector" and FALSE to prevent simplification <br>

```
replicate(n=10, 3)
replicate(n=7, 'A')
~ generate 3 values that follow normal distribution (replicate this 4 times)
set.seed(2)
replicate(n=4, rnorm(3, mean=0, sd=1))
~ generate 3 values that follow normal distribution (replicate this 6 times)
set.seed(78)
replicate(n=6, rnorm(3, mean=0, sd=1))
~ Using replicate() to Simulate Data create 5 samples each of size n=10
set.seed(1)
data <- replicate(n=5, rnorm(10, mean=0, sd=1))
colMeans(data)
~ replicate with plot
replicate(10, mean(rnorm(100)))
qplot(replicate(100, mean(rnorm(10))),
        type="histogram")
```
#### Excercise
```
~ 100 x mean of 10 N(0,1)
qplot(replicate(100,mean(rnorm(10))),type="histogram")
~ 1000 x mean of 10 Unif(0, 10)
qplot(replicate(10,mean(rnorm(10))),type="histogram")
~ 1000 x mean of 100 Unif(0, 10)
qplot(replicate(1000,mean(rnorm(10))),type="histogram")
~ 10000 x mean of 1000 Unif(0, 10)
qplot(replicate(10000,mean(rnorm(10))),type="histogram")
```
