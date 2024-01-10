# Vectors 
```
x <- c(4,7,2, 10.5,1,0)
y <- c(1,2,3,9,8,7)
z <- c("A","jan","Dec")
```
# Referencing vector/scalar of positions to reference elements of a vector
```
x[3]                 #referencing the 3rd element in a vector
x[1:3]              #ref 1st to 3rd
x[c(1,4,6)]         #ref the elements 1,4,6 of x
x[x>4]              #ref the element greater than 4
x[x<4]              #ref the element greater than 4
x[3] <- 99          #replacing the 3rd element with 99
```
# Mathematical operation
```
x^2                 #square
x*y                 #multiplication
log(x)              #log
x-y
x/y
y+y
exp(x)
sqrt(x)             #square root
sin(x)
sum(x)
cumsum(x) #cumulative sum
min(x)
max(y)
length(x)   #Number of elements in x
mean(x)
var(x)
which(x>4)    #Array positions where the arguments are true
x[which(x>4)]
seq(y)    #Creating vector sequences
rep(y)    #Creating vector sequences
```







