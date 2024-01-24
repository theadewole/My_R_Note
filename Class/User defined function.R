################################################################################
# How UDF works 
# the last argument is what is been executed 
################################################################################
my_first_function <- function(x) {
  y <- 3*x
  y + 1
}
my_first_function(2)

#UDF to calculate change in radius 
circumference <- function(r){
  2*pi*r
}
print(circumference(5))

# calculate the interest when principal changes with fixed rate (25) and year (2)
interest <- function(p){
  m <-p*25*2
  m/100
}
interest(10000)

# when the function has null argument ()
hello_world <- function(){
  'Hello, World!'
}
print(hello_world())

test <- function(){
  3*5
}
test ()

################################################################################                              
#specifying more than 1 argument
################################################################################
sum_two_nums <- function(x, y){
  x + y
}
print(sum_two_nums(1, 2))
###############################or#########################################
sum_two_nums <- function(x, y) x + y
print(sum_two_nums(1, 2))

# Complete formula for simple interest
interest_formula <- function(p,r,t){
  m <-p*r*t
  m/100
}
interest_formula(10000,25,2)
################################################################################
#using the return statement in the function body
################################################################################
# With vector
mean_median <- function(vector){
  mean <- mean(vector)
  median <- median(vector)
  return(c(mean, median))
}
print(mean_median(c(1, 1, 1, 2, 3)))
# With matrix
mean_median_sd <- function(matrix){
  mean <- mean(matrix)
  median <- median(matrix)
  sd <- sd(matrix)
  return(c(mean, median,sd))
}
mean_median_sd(matrix(c(5,0,6,1,3,5,9,5,7,1,5,3),nrow=3,ncol=4, byrow=TRUE,
                      dimnames = list(rows=c("r.1", "r.2", "r.3"),
                                      cols=c("c.1", "c.2", "c.3", "c.4"))))
################################################################################
#Calling a Function
################################################################################
#passing argument by name when calling 
subtract_two_nums <- function(x, y){
  x - y
}
print(subtract_two_nums(x=3, y=1))
print(subtract_two_nums(y=1, x=3))
###############################################
#BMR (basal metabolic rate), or daily consumption of calories, for women based on their 
#weight (in kg), height (in cm), and age (in years)
##############################################
# Passing argument by name and position
calculate_calories_women <- function(weight, height, age){
  (10 * weight) + (6.25 * height) - (5 * age) - 161
}
print(calculate_calories_women(age=30, 60, 165))
print(calculate_calories_women(age=30, weight=60, height=165))
################################################################################
#Using Functions Inside Other Functions
################################################################################
mean_median <- function(vector){
  mean <- mean(vector)
  median <- median(vector)
  return(c(mean, median))
}
mean_median(round(rnorm(10,3,4),3))
# calc circumference 
radius_from_diameter <- function(d){
  d/2
}

circumference <- function(r){
  2*pi*r
}

print(circumference(radius_from_diameter(4)))

sum_circle_ares <- function(r1, r2, r3){
  circle_area <- function(r){
    pi*r^2
  }
  circle_area(r1) + circle_area(r2) + circle_area(r3)
}

print(sum_circle_ares(1, 2, 3))
#####################################
#If we want to be able to use the function independent of the bigger function, 
#We should create it outside the bigger function instead of nesting these functions.
####################################
circle_area <- function(r){
  pi*r^2
}

sum_circle_ares <- function(r1, r2, r3){
  circle_area(r1) + circle_area(r2) + circle_area(r3)
}

print(sum_circle_ares(1, 2, 3))
print(circle_area(10))

