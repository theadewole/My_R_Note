#Vectors 
x <- c(4,7,2, 10.5,1,0)
y <- c(1,2,3,9,8,7)
z <- c("A","jan","Dec")
################################################################################
#Referencing vector/scalar of positions to reference elements of a vector
################################################################################
x[3]                 #referencing the 3rd element in a vector
x[1:3]              #ref 1st to 3rd
x[c(1,4,6)]         #ref the elements 1,4,6 of x
x[x>4]              #ref the element greater than 4
x[x<4]              #ref the element greater than 4
x[3] <- 99          #replacing the 3rd element with 99

################################################################################
#mathematical operation
################################################################################
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

#Expanding on the seq () function 
# seq(from, to, by, length.out, along.with)
seq(1,10) #from 1 to 10
seq(from=1,to=10)

seq(1.0,10.0)  #decimal numbers 

seq(-1,-10)    #negative numbers 

seq(from=1,to=10,by=2) #with by argument 
seq(1,10,2)
seq(3,30,3) 

seq.int(from=3,to=30,length.out=10)  #determines the length of the sequence 
seq(-3,-30,length.out= 10)

y<-c(5,10,15,20)        #Along with 
seq(1,25,along.with = y)
df<-c(-1,-5,-10,-2,-4)
seq(-5,10,along.with = df)

seq_len(5) #direct argument passing 
seq.int(-5,5)
seq.int(2,10)
################################################################################
#Example with mean ()
################################################################################
COS.data<-read.csv("C:\\Users\\AFSS-Student\\Documents\\R\\Material From Dr\\Ending Jan 12 (Part 1) - Lecture 2 - Introduction to R\\CO2.csv",
                   header = T)
mean(COS.data[,1]) #mean of all row and column 1
mean(COS.data$Year) #mean of column called year
#finding the mean of all row for column 1 to 5 separately in a single code 
data.test<-c(mean(COS.data[,1]),mean(COS.data[,2]),mean(COS.data[,3]),
             mean(COS.data[,4]),mean(COS.data[,5]))
