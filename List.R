################################################################################
#List
################################################################################
x <- list(num=c(1,2,3), name="Nick", identity=diag(2),solution=solve(A))
x

y <- list(matrix=matrix(c(1,2,4,5), nrow = 2, ncol = 2),name="Ayo", 
          lenght=length(x))
y
################################################################################
#Referencing element in a list
################################################################################
# Element name ’num’
x$num
# Second element in the list
x[[2]] 
# First row, of the third element in the list
x[[3]][1,]
