lm(price ~ carat + cut + color + clarity, data = diamonds)

a_list <- list(num = c(8, 9),
               log = TRUE,
               cha = c("a", "b", "c"))

a_list["num"]
a_list$num

vec <- c(-2, -1, 0, 1, 2)
abs(vec)

lst <- list(-2, -1, 0, 1, 2)
abs(lst)

set.seed(1000)
exams <- list(
student1 <- round(runif(10,50,100)),
student2 <- round(runif(10,50,100)),
student3 <- round(runif(10,50,100)),
student4 <- round(runif(10,50,100)),
student5 <- round(runif(10,50,100))
)

#compute the mean grade for each student
mean(exams)


list(student1 = mean(exams$student1),
     student2 = mean(exams$student2),
     student3 = mean(exams$student3),
     student4 = mean(exams$student4),
     student5 = mean(exams$student5))


################################################################################
#                                     purrr                                    #
################################################################################
library(purrr)

##############################################
#map()
##############################################
#using the map function to calculate the mean of the exams list
map(exams, mean)

#mean of the list 
exams %>% map(mean)

#var of the list
exams %>% map(var)

##############################################
#map_dbl()
##############################################
#mean of exams 
exams %>%
  map_dbl(mean)

#90th percentile score
exams %>%
  map_dbl(quantile, prob = 0.9)

#Calculate the max grade (max())for each student. Return theresult as a vector
exams %>%
  map_dbl(max)

##############################################
#map_lgl()
##############################################
exams %>%
  map(length) %>%
  map_lgl(all.equal, 10)

###############################################################################
#                           Functions                                         #
###############################################################################
set.seed(1000)
exams <- list(
  student1 = round(runif(10,50,100)),
  student2 = round(runif(10,50,100)),
  student3 = round(runif(10,50,100)),
  student4 = round(runif(10,50,100)),
  student5 = round(runif(10,50,100)))

#Write code that solves the problem for a real object
vec <- exams$student1
(sum(vec) - min(vec)) / (length(vec) - 1)
vec <- exams$student2
(sum(vec) - min(vec)) / (length(vec) - 1)
vec <- exams$student3
(sum(vec) - min(vec)) / (length(vec) - 1)
vec <- exams$student4
(sum(vec) - min(vec)) / (length(vec) - 1)
vec <- exams$student5
(sum(vec) - min(vec)) / (length(vec) - 1)

#Wrap the code in function(){} to save it
vec <- exams[[1]]
grade <- function(vec) {
  (sum(vec) - min(vec)) / (length(vec) - 1)
}

grade(exams[[2]])

#########################################
#Write code that solves the problem for a real object 
#Wrap the code in function(){} to save it 
#Add the name of the real object as the function argument 
#To run the function, call the object followed by parentheses.
  #Supply new values to use for each of the arguments
#########################################
grade <- function(vec) {
  (sum(vec) - min(vec)) / (length(vec) - 1)
}
exams %>%
  map_dbl(grade)

############  Another method ############
grade <- function(x) (sum(x) - min(x)) / (length(x) - 1)
exams %>%
  map_dbl(grade)


##################################
#Write code that solves the problem for a real object 
#Wrap the code in function(){} to save it 
#Add the name of the real object as the function argument
##################################
grade <- function(x){
  (sum(x)+max(x))/(length(x)+1)
}

exams %>% 
  map_dbl(grade)

##################### Another method #######################
exams %>%
  map_dbl(function(x) (sum(x) + max(x)) / (length(x) + 1))

##############################
#map2
#############################
#Define two lists
list1 <- list(1, 2, 3)
list2 <- list(10, 20, 30)

# Use map2() to add corresponding elements from list1 and list2
result <- map2(list1, list2, `+`)

print(result)
########################################
#Compute a final grade for each student, where the final grade is the average 
##test score plus any extra credit assigned to the student. 
#Return the results as a double (i.e. numeric) vector
####################################
extra_credit <- list(0,0,10,10,15)

exams %>% 
  map2_dbl(extra_credit, function(x, y) mean(x) + y)

##############################
#pmap()
#############################

