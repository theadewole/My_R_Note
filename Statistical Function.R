x <- c(4,7,2, 10.5,1,0)
y <- c(1,2,3,9,8,7)

library(readxl)
exe <-read_excel("C:\\Users\\AFSS-Student\\Documents\\Base-guide-practise-data\\cert\\exercise.xlsx",
                 sheet=1)

summary(x)          #Summary statistics
table(x)             #Tabulate data by factor
cor(x,y)               #Correlation
t.test(x)            #One-sample and Two-sample t-test
chisq.test(x)        #Pearson’s chi-square test
power.t.test(x)      #Power for one-sample and two-sample t-tests
lm(x,y)                #Linear model
aov(x)               #Analysis of variance
glm(x)               #Generalized linear models (logit, Poisson models)
library(survival)     Survival package needed for survival models

#Others
class(x)            #what kind of object is it (high-level)?
typeof(y)           # what is the object?s data type (low-level)?
length(y)           #how long is it? What about two dimensional objects?
attributes(exe)       #does it have any metadata?
