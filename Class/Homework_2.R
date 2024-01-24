################################################################################
# No.1 For the first year, Fred, Magalie and Ajua have a collection of cars.
# The cars are of different engine sizes, V4, V6 and V8. The cars only
# have 3 colors, Sky Blue, Volcanoe Red and Champage. Each owner has
# every type of car, in every type of color. They buy the same cars every
# year for 5 years. Hint 3*3*3*5.
################################################################################
#Creating vector for the name,car engine,car colors and numbers of years
Name <- c("Fred","Magalie","Ajua")
cars <- c("v4","v6","v8")
color <- c("Sky blue","Volcanoe red","Champage")
year <- c(1:5)
#Evaluating possibilities 
cars <- expand.grid(Name=Name,Engine=cars,Colors=color,Year=year)
#outputting to csv
write.csv(cars,file="cars.csv",row.names = T)

################################################################################
# No.2 Generate random numbers from the Normal, Poisson and Uniform distributions
# of length equal to that of the data set from (1).Combine the datasets from 
# (1) with the dataset of random numbers into one final dataset.
################################################################################
#Generating Random Numbers
normal <- rnorm(135)
Poiss <- rpois(135,3)
Uniform <-runif(135)
#Combining the datasets into a single file and exporting into csv
#Combining the random number distribution as a single object
random <- cbind(normal,Poiss,Uniform)
#Combining all from from question and the combined generated random numbers
final <- cbind(cars,random)
write.csv(final,"C:\\Users\\AFSS-Student\\Documents\\R\\Output\\No_2.csv")

hist(normal)

################################################################################
#No.3 Create a function that draws a histogram of n draws of mean(rnorm(100))
################################################################################
#Create a function that draws a histogram of n draws of mean(rnorm(100))
histn <- function(n){
  hist(replicate(n,mean(rnorm(100))))
}
histn(1000)

#Modify your function to draw a histogram of n draws of mean(rnorm(m))
histn_rnorm <- function(n,m){
  hist(replicate(n,mean(rnorm(m))))  
}
histn_rnorm(1000,100)

#Modify your function to allow the user to choose which distribution function, r, to use
hist_dist <- function(p,x,q){
  hist(replicate(p,mean(x(q))))
}
hist_dist(1000,rnorm,100)
################################################################################
#Optional
################################################################################
Team_data <- read.csv("C:\\Users\\AFSS-Student\\Documents\\Internship\\Week 3\\Teams_data.csv")

avgwinnings <- function(A=character){
  Team_data$avgwinnings <- c(Team_data$W/(Team_data$W+Team_data$L))
  Team <- round(mean(subset(Team_data$avgwinnings,Team_data$teamID==A)),4)
  return(Team)
}

avgwinnings("ANA")

#Another method
library(Lahman)
teamavg <- data.frame(Teams)

Avgwinnings <- function(T=character){
  teamavg$avg <- c(teamavg$W/(teamavg$W+teamavg$L))
  mn <- mean(subset(teamavg$avg,teamavg$teamID==T))
  return(mn)
}

Avgwinnings("BOS")

