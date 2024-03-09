# Matrix
Basic syntax  <br>
```matrix(data, nrow, ncol, byrow = FALSE, dimnames = NULL)``` <br>
```matrix(data, nrow, ncol, byrow = FALSE, dimnames = list(rows=c(),cols=c()))```
- data: A vector or a matrix-like object containing the elements to be arranged into a matrix. If data is a vector, it will be filled column-wise into the matrix.
- nrow: An integer specifying the number of rows in the matrix.
- ncol: An integer specifying the number of columns in the matrix.
- byrow: A logical value indicating whether the matrix should be filled by rows (TRUE) or by columns (FALSE). The default is FALSE, meaning the matrix is filled by columns.
- dimnames: An optional list of length 2, providing names for the rows and columns of the matrix.

```
x <- matrix(c(5,0,6,1,3,5,9,5,7,1,5,3),nrow=3,ncol=4, byrow=TRUE,
            dimnames = list(rows=c("r.1", "r.2", "r.3"),
                            cols=c("c.1", "c.2", "c.3", "c.4")))
when byrow=T
1  2  3  4
5  6  7  8
9  10 11 12

when byrow=F
1 4 7 10
2 5 8 11
3 6 9 12

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
# List
```
x <- list(num=c(1,2,3), name="Nick", identity=diag(2),solution=solve(A))
x

y <- list(matrix=matrix(c(1,2,4,5), nrow = 2, ncol = 2),name="Ayo", lenght=length(x))
y
- Referencing elements in a list
- Element name ’num’
x$num
- Second element in the list
x[[2]] 
- First row, of the third element in the list
x[[3]][1,]
```

```
