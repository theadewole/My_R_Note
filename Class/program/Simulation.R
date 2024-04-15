################################################################################
Fixed Levels and Sequences
################################################################################
################################
The rep() function
each can also be used as times
###############################
rep(c("m","F"),times=10)
factor(rep(c("m","F"),each=10))
gl(n=2,k=10,labels = c("M","F"))
gl(n=2,k=10,labels = c("M","F"),length = 3*10,ordered = FALSE)
##########################
expand.grid()
#########################
# Create vectors for factors
colors <- c("Red", "Green", "Blue")
sizes <- c("Small", "Medium", "Large")
shapes <- c("Circle", "Square")
combinations <- expand.grid(Color = colors, Size = sizes, Shape = shapes)
# 
x1 <- c("abc","cde","def") 
x2 <- c(1,2,3,4,6) 
x3 <- c("M","F") 
expand.grid(x1, x2, x3)
################################################################################
Generating random numbers for uniform distribution  
###############################################################################
############################
runif()
###########################
runif(10,1,20)
#Adding Round functions to reduce decimal place 1 decimal place (whole number)
round(runif(20,10,300),0)
#1 decimal place 
round(runif(n=10, min=50, max=100), 1)
#Applying with histogram generation 
##generate 1,000 random values from uniform distribution
value <- runif(n=1000, min=50, max=100)
hist(value)
################################################################################
To make the random number reproducible set.seed () what in the bracket can be 
anything you like 
set.seed()
################################################################################
set.seed(5)
val<- runif(10,1,20)
val
# using an already assigned variable length in place of n in the runif syntax
x <- c(1:7)
runif(x,7,15)
##############################
rpois (poisson)
#############################
################################################################################
Lambda:represents the average rate at which events occur in a 
Poisson distribution
################################################################################
#Compute 5 random number at lambda of 5
rpois(5,3)
rpois(n=6,lambda = 3)
#Compute 100 random number at lambda of 15 and plotting a scatter diagram 
set.seed(1000)
pat <- 100
y<-rpois(pat,15)
plot(y)
###############################
rnorm ()
###############################
rnorm(10,5,2)
round(rnorm(10,3,4))
# with set.seed ()
set.seed(5)
n<-c(2000:2009)
m<-round(rnorm(10,3,4),3)
plot(m,n,"o",col="red",)
##########################
rbinom()
Function which randomly generates numbers which follow a binomial 
distribution size:sample size, prob=prob of success
#########################
rbinom(10,100,0.3)
#Application
p <- round(runif(n=1000, min=1, max=1000),0)
set.seed(200)
rbinom(7,p,0.5)
########################## 
rgamma()
shape,rate,scale:must be +ve,specify 'rate' or 'scale' but not both
##########################
rgamma(10,1,1)
rgamma(val,1,1)
# Application
x_dgamma <- seq(0, 2, by = 0.04)    
y_dgamma <- dgamma(x_dgamma, shape = 6)  
plot(y_dgamma) 
#############################                                
rbeta()
In R, the rbeta function is used to generate random numbers from a beta distribution. 
The beta distribution is a continuous probability distribution defined on the interval [0, 1]
############################
rbeta(10,2,4)
#Application
set.seed(13579)
N <- 10000  
y_rbeta <- rbeta(N, shape1 = 1, shape2 = 5)   
y_rbeta
plot(density(y_rbeta), 
     main = "beta Distribution in R")
################################################################################
Excercise
################################################################################
#Generate 100 numbers ~ N(0, 1)
rnorm(100,0,1)
# Generate 50 numbers ~ N(10, 5)
rbeta(50,10,5)
#Generate 1000 numbers ~ Poisson(50)
rpois(1000,50)
# Generate 10 numbers ~ Beta(0.1, 0.1)
rbeta(10,0.1,0.1)
# Generate 30 numbers ~ Uniform(0, 10)
runif(30,0,10)
#################################                             
replicate()
You can use the replicate() function to repeatedly evaluate some 
expression in R a certain number of times, the possible value of simplify
"array","vector","FALSE". Note that array is the default
#################################
replicate(n=10, 3)
replicate(n=7, 'A')
#generate 3 values that follow normal distribution (replicate this 4 times)
set.seed(2)
replicate(n=4, rnorm(3, mean=0, sd=1))
#generate 3 values that follow normal distribution (replicate this 6 times)
set.seed(78)
replicate(n=6, rnorm(3, mean=0, sd=1))
# Using replicate() to Simulate Data
    ##create 5 samples each of size n=10
set.seed(1)
data <- replicate(n=5, rnorm(10, mean=0, sd=1))
colMeans(data)

# replicate with plot
replicate(10, mean(rnorm(100)))
qplot(replicate(100, mean(rnorm(10))),
        type="histogram")

################################################################################
Excercise
################################################################################
#100 x mean of 10 N(0,1)
qplot(replicate(100,mean(rnorm(10))),type="histogram")
#1000 x mean of 10 Unif(0, 10)
qplot(replicate(10,mean(rnorm(10))),type="histogram")
#1000 x mean of 100 Unif(0, 10)
qplot(replicate(1000,mean(rnorm(10))),type="histogram")
#10000 x mean of 1000 Unif(0, 10)
qplot(replicate(10000,mean(rnorm(10))),type="histogram")

################################################################################
Dry (Do not repeat yourself)
################################################################################
simulation <-function(rp,nrm){
  y <- replicate(rp,mean(rnorm(nrm)))
               qplot(y,type="histogram")
              
}
simulation(100,10)

##############################################################################
Excercise
##############################################################################
#Generate 100 numbers ∼ N(0, 1)
rnorm(100,0,1)
#Generate 100 numbers ∼ N(10, 3)
rnorm(100,10,3)
#Generate 100 numbers ∼ Poisson(10)
rpois(100,10)
#Generate 100 numbers ∼ Uniform(10, 40)
runif(100,10,40)
######################################
Check our simulation by plots:
#####################################
hist(rnorm(100, mean=10, sd=3))
barplot(rpois(100, 10))
hist(runif(100, 10, 40))
########################
Replicate example
########################
#40 x mean of 10 Poi(1)
replicate(40,mean(rpois(10,1)))
#40 x mean of 10 Normal(mean=10, sd=0.002)
replicate(40,mean(rnorm(10,0,0.002)))
#40 x mean of 10 Unif(0, 10)
replicate(40,mean(runif(10,0,10)))

################################################################################
Class Exercise: Building functions
################################################################################
#1. Create a function that computes n to the y
pow <- function(n,y){
n^y
}
pow(2,3)
                            #OR#
powr <- function(n,y){
M<-n^y
return(M)
}
powr(4,3)
#2. Create a function that computes n to the y for a sequence of values (vector)
vec_pow <- function(a,b){
  a^b  
}
vec_pow(2,seq(1,10,2))
#3. Create a function that computes the length and mean of a vector
leng_mean <- function(n){
  leng <- length(n)
  men <- mean(n)
  lm <- c(leng,men)
  return(lm)

  }
leng_mean(seq(1,10,2))
#4. Create a function that calls the function in 1 and adds 30 to each element of the vector
pow30plus <- function(n,y){
  pow30 <- pow(n,y)+30
  return(pow30)
}
pow30plus(4,seq(1,10,2))

#Create a function that draws a histogram of n draws of mean(rnorm(100))
histn <- function(n){
  hist(replicate(n,mean(rnorm(100))))
}
histn(1000)
#Modify your function to draw a histogram of n draws of mean(rnorm(m))
histn_rnorm <- function(n,m){
hist(replicate(n,mean(rnorm(m))))  
}
histn_rnorm(100,150)
#Modify your function to allow the user to choose which distribution function, r, to use
hist_dist <- function(p,x,q){
hist(replicate(p,mean(x(q))))
}
hist_dist(1000,rnorm,100)


################################################################################
#Write a function to generate two vectors of  n random normals, 
#compare them with a t.test and return the p-value
################################################################################
# manual approach
vec_1 <- rnorm(20)
vec_2 <- rnorm(20)
t.test(vec_1,vec_2)$p.value

# placing into a function
ttest <- function(a_n,a_mean,a_sd,b_n,b_mean,b_sd){
  vec1 <- rnorm(a_n,a_mean,a_sd)
  vec2 <- rnorm(b_n,b_mean,b_sd)
  test <- t.test(vec1,vec2)$p.value
  return(test)
}
ttest(a_n=10, a_mean=5, a_sd=2,
      b_n=10, b_mean=3,b_sd=2)

# With poisson data
ttest_non_normal <- function(a_n,a_lambda,b_n,b_lambda){
  xx <- rpois(a_n,a_lambda)
  yy <- rpois(b_n,b_lambda)
  test2 <- t.test(xx,yy)$p.value
  return(test2)
}
ttest_non_normal(a_n=40,a_lambda=10,
                 b_n= 40,b_lambda=15)
