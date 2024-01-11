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





