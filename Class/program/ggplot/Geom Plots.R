library(tidyverse)
####################################################### 
#Plot Geoms
#######################################################

######################################
#Adding smoother to a plot
######################################
ggplot(mpg,aes(displ,hwy))+
  geom_point()+
  geom_smooth()

#applying span
ggplot(mpg,aes(displ,hwy))+
  geom_point()+
  geom_smooth(span=0.2)

#applying method 
library(mgcv)
ggplot(mpg,aes(displ,hwy))+
  geom_point()+
  geom_smooth(method="gam",formula=y~ s(x))

#applying method=lm(linear model)
ggplot(mpg,aes(displ,hwy))+
  geom_point()+
  geom_smooth(method="lm")

#applying more argument 
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(method = "loess", 
              color = "blue", 
              fill = "lightblue", 
              linetype = "dashed", 
              size = 1.5, 
              alpha = 0.5)

####################################
#Boxplots and jittered points
##################################
#geom jitter
ggplot(mpg, aes(drv,hwy)) +
  geom_jitter()

#boxplot
ggplot(mpg, aes(drv,hwy)) +
  geom_boxplot()

#violin plot
ggplot(mpg, aes(drv,hwy)) +
  geom_violin()

####################################
# Histograms and Frequency Polygons
###################################
#histogram
ggplot(mpg, aes(hwy)) + geom_histogram()

#freqpoly
ggplot(mpg, aes(hwy)) + geom_freqpoly()
## Controlling the bin 
ggplot(mpg, aes(hwy)) +
  geom_freqpoly(binwidth = 1)

#Mapping with categorical data 
ggplot(mpg, aes(displ, colour = drv)) +
  geom_freqpoly(binwidth = 0.5)

ggplot(mpg, aes(displ, fill = drv)) +
  geom_histogram(binwidth = 0.5) +
  facet_wrap(~drv, ncol = 1)

####################################
# Bar Charts 
###################################
#Summarized data
ggplot(mpg, aes(manufacturer)) +
  geom_bar()

#pre-summarized data
drugs <- data.frame(
  drug = c("a", "b", "c"),
  effect = c(4.2, 9.7, 6.1))

ggplot(drugs, aes(drug, effect)) + geom_bar(stat = "identity")

####################################
# Time Series with Line and Path Plots
###################################
#line plot 
ggplot(economics, aes(date, unemploy / pop)) +
  geom_line()

ggplot(economics, aes(date, uempmed)) +
  geom_line()

#path plot 
ggplot(economics, aes(unemploy / pop, uempmed)) +
  geom_path() +
  geom_point()

year <- function(x) as.POSIXlt(x)$year + 1900

ggplot(economics, aes(unemploy / pop, uempmed)) +
  geom_path(colour = "grey50") +
  geom_point(aes(colour = year(date)))
