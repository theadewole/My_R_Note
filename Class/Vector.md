# Vectors 
- Vector is a collection of scalar in one dimension  i.e N by 1 or 1 by n
- Vectors are one-dimensional arrays that can hold numeric data, character data, or logical data. In other words, a vector is a simple tool to store data
#### Function c() 
- The ‘c’ has to be lowercase
- Numeric_vector<- c(1, 2, 3)
- Character_vector<- c("a", "b", "c")
- Booleaan_vector<- c(TRUE,FALSE,TRUE)
##### name ()
Used to assign name to element of a vector
```
 poker <- c(10,25,30)
names(poker) <- c("paul", "Mike","steph")
```
# Referencing vector/scalar of positions to reference elements of a vector
```
x <- c(4,7,2, 10.5,1,0)
y <- c(1,2,3,9,8,7)
z <- c("A","jan","Dec")
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

# Expanding on seq () 
#### Syntax:  seq(from, to, by, length.out, along.with)
Where, 
- From = beginning number of the sequence.
- To = Terminating the number of the sequence.
- by = It is the increment of the given sequence. It is calculated as ((to-from) /(length.out-1)).
- length.out = Decides the total length of the sequence
- along.with = Outputs a sequence of the same length as the input vector.

```
- From 1 to 10
seq(1,10)
seq(from=1,to=10)
- Decimal numbers
seq(1.0,10.0) 
- Negative numbers 
seq(-1,-10)  
- With by argument
seq(from=1,to=10,by=2) 
seq(1,10,2)
seq(3,30,3) 
# Determines the length of the sequence
seq.int(from=3,to=30,length.out=10)   
seq(-3,-30,length.out= 10)
- Along with 
y<-c(5,10,15,20)        
seq(1,25,along.with = y)

df<-c(-1,-5,-10,-2,-4)
seq(-5,10,along.with = df)
- Direct argument passing 
seq_len(5)
seq.int(-5,5)
seq.int(2,10)
```
# Example with mean ()
```
COS.data<-read.csv("C:\\Users\\AFSS-Student\\Documents\\R\\Material From Dr\\Ending Jan 12 (Part 1) - Lecture 2 - Introduction to R\\CO2.csv",
                   header = T)
- mean of all row and column 1
mean(COS.data[,1])
- mean of column called year
mean(COS.data$Year) 
- finding the mean of all row for column 1 to 5 separately in a single code 
data.test<-c(mean(COS.data[,1]),mean(COS.data[,2]),mean(COS.data[,3]),mean(COS.data[,4]),mean(COS.data[,5]))
```





