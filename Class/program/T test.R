################################################################################
# One Sample T test 
################################################################################
set.seed(0)
sample_1 <- c(rnorm(50, mean = 140, sd = 5))
sample_1
# mu=The hypothesized mean difference between the two groups.
t.test(sample_1, mu = 150)
################################################################################
# Two Sample T test 
################################################################################
set.seed(0)
shopOne <- rnorm(50, mean = 140, sd = 4.5)
shopTwo <- rnorm(50, mean = 150, sd = 4)

t.test(shopOne, shopTwo, var.equal = TRUE)

################################################################################
# Two Sample T test 
################################################################################
set.seed(2820)
sweetOne <- c(rnorm(100, mean = 14, sd = 0.3))
sweetTwo <- c(rnorm(100, mean = 13, sd = 0.2))
t.test(sweetOne, sweetTwo, paired = TRUE)

################################################################################
# Extracting values from t test  
################################################################################
jet_1 <- replicate(100,mean(rnorm(20)))
jet_2 <- replicate(100,mean(rnorm(40)))
#Selecting the p value from the test
str(t.test(jet_1,jet_2,c(alternative="two.sided")
              ,r.equal = T)$p.value)

#Selecting the mean values from the test
str(t.test(jet_1,jet_2,c(alternative="two.sided")
           ,r.equal = T)$estimate)

#Selecting the standard error value from the test
str(t.test(jet_1,jet_2,c(alternative="two.sided")
           ,r.equal = T)$stderr)

  
              
              