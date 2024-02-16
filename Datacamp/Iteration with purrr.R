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

mean(exams)


list(student1 = mean(exams$student1),
     student2 = mean(exams$student2),
     student3 = mean(exams$student3),
     student4 = mean(exams$student4),
     student5 = mean(exams$student5))


################################################################################
#                                     purrr                                    #
################################################################################

##############################################
#map_dbl()
##############################################
map(exams, mean)

#mean of the list 
exams %>% map(mean)

#var of the list
exams %>% map(var)

##############################################
#map_dbl()
##############################################
exams %>%
  map_dbl(mean)

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



