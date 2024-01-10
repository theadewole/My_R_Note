# Matrix
```
x <- matrix(c(5,0,6,1,3,5,9,5,7,1,5,3),nrow=3,ncol=4, byrow=TRUE,
            dimnames = list(rows=c("r.1", "r.2", "r.3"),
                            cols=c("c.1", "c.2", "c.3", "c.4")))

y <- matrix(c("A","B","C","D","E","F","G","H","I","J","K","L"),nrow=3,ncol=4, byrow=TRUE,
            dimnames = list(rows=c("Cat", "Rat", "Dog"),
                            cols=c("Meat", "Fish", "Crap", "Pork")))

m <- matrix(c(1,2,3,4,5,6,7,8,9),nrow=3,ncol=3,byrow=FALSE)
```

# Referencing a matrix
- x y m
```
- Row 2, Column 3
x[2,3] 
- Row 1
y[1]
- Column 2
x[,2]
- Row 1 and 3, all Columns
x[c(1,3),] 
```
# Multiplication of matrix
```
A <- matrix(c(5,0,6,1), nrow=2, ncol=2)
B <- matrix(c(1,3,5,9), nrow=2, ncol=2)
A
B
Simple Arithmetic operation
A*B
B*A
Matrix operation 
A%*%B
B%*%A
```
# Other Matrix operation
```
t(A)         #Transpose of A
det(A)        #Determinate of A
solve(A)      #Matrix inverse of A
solve(A,B)   #Solves the equation Ax = b for x
dim(A)        #Dimension of A
diag(A)       #Creates a n × n identity matrix
eigen(A)      #Eigenvalues and eigenvectors of A
diag(A)       #Returns the diagonal elements of A
```
