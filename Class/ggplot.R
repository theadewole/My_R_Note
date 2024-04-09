library(ggplot2)
library(tidyverse)  
mpg <- mpg
################################################################################
# Basic
################################################################################
ggplot(mpg,aes(x=displ,y=hwy))+
  #geom_point is used to create scatterplot
  geom_point()

ggplot(mpg,aes(model,manufacturer))+
  geom_point()


ggplot(mpg,aes(cty,hwy))+
  geom_point()

ggplot(diamonds,aes(carat,price))+
  geom_point()

ggplot(economics,aes(date,unemploy))+
  geom_line()

ggplot(mpg,aes(cty))+
  geom_histogram()


################################################################################
# Colour, Size, Shape and Other Aesthetic Attributes
################################################################################
#################
#Colour
################
ggplot(mpg,aes(displ,hwy,colour=class))+
  geom_point()

ggplot(mpg,aes(displ,cty,colour=class))+
  geom_point()

#changing the color to a fixed value
ggplot(mpg,aes(displ,hwy))+
  geom_point(aes(colour="blue"))

ggplot(mpg,aes(displ,hwy))+
  geom_point(colour="blue")

#vignette("ggplot2-specs"): to see value needed for color and aesthetics

####################
#Shape
####################
ggplot(mpg,aes(displ,hwy,shape=drv))+
  geom_point()

####################
#Size
####################
ggplot(mpg,aes(displ,hwy,size=cyl))+
  geom_point()



################################################################################
# Facetting 
################################################################################

#facet_wrap:
ggplot(mpg,aes(displ,hwy))+
  geom_point()+
  facet_wrap(~class)

ggplot(mpg,aes(displ,hwy))+
  geom_point()+
  facet_wrap(~cyl)

ggplot(mpg,aes(displ,fl))+
  geom_point()+
  facet_wrap(~cyl)

#You can facet by multiple variables
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(vars(cyl, drv))

# Use vars() to supply faceting variables:
ggplot(mpg, aes(displ, hwy)) + 
  geom_point()+ 
  facet_wrap(vars(class))

# Control the number of rows and columns with nrow and ncol
ggplot(mpg, aes(displ, hwy)) + 
  geom_point()+ 
  facet_wrap(vars(class), nrow = 4,ncol=2)
  
# Use the `labeller` option to control how labels are printed:
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(vars(cyl, drv), labeller = "label_both")

# To change the order in which the panels appear, change the levels of the underlying factor.
mpg$class2 <- reorder(mpg$class, mpg$displ)
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(vars(class2))

# By default, the same scales are used for all panels. You can allow scales to vary across the panels with the `scales` argument.
## Free scales make it easier to see patterns within each panel, but harder to compare across panels.
### by default its fixed
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(vars(class), scales = "free")

#To repeat the same data in every panel, simply construct a data frame that does not contain the faceting variable.
ggplot(mpg, aes(displ, hwy)) +
  geom_point(data = transform(mpg, class = NULL), colour = "grey85") +
  geom_point() +
  facet_wrap(vars(class))

# Use `strip.position` to display the facet labels at the side of your
# choice. Setting it to `bottom` makes it act as a subtitle for the axis.
# This is typically used with free scales and a theme without boxes around
# strip labels.
ggplot(economics_long, aes(date, value)) +
  geom_line() +
  facet_wrap(vars(variable), scales = "free_y", nrow = 2, strip.position = "top") +
  theme(strip.background = element_blank(), strip.placement = "outside")

ggplot(economics_long, aes(date, value)) +
  geom_line() +
  facet_wrap(vars(variable), scales = "free_y", nrow = 2, strip.position = "top",
             shrink = TRUE)
####################################################### 
#facet_grid
#######################################################
ggplot(mpg,aes(displ,hwy))+
  geom_point()+
  facet_grid(~class)

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


####################################################### 
#Modifying the Axes
#######################################################
####################################
# xlab() and ylab()
###################################
ggplot(mpg, aes(cty, hwy)) +
  geom_point(alpha = 1 / 3)

#Adding the axis labels 
ggplot(mpg, aes(cty, hwy)) +
  geom_point(alpha = 1 / 3) +
  xlab("city driving (mpg)") +
  ylab("highway driving (mpg)")

#Removing the axis label 
ggplot(mpg, aes(cty, hwy)) +
  geom_point(alpha = 1 / 3) +
  xlab(NULL) +
  ylab(NULL)

####################################
# xlim() and ylim()
###################################
ggplot(mpg, aes(drv, hwy)) +
  geom_jitter(width = 0.25)

ggplot(mpg, aes(drv, hwy)) +
  geom_jitter(width = 0.25) +
  xlim("f", "r") +
  ylim(20, 30)

# For continuous scales, use NA to set only one limit
ggplot(mpg, aes(drv, hwy)) +
  geom_jitter(width = 0.25, na.rm = TRUE) +
  ylim(NA, 30)

####################################################### 
#Output
#######################################################
#Rendering to screen
p <- ggplot(mpg, aes(displ, hwy, colour = factor(cyl))) +
  geom_point()

summary(p)
print (p)

#saving to the current work drive
#ggsave save the latest created plot
getwd()
ggsave("plot.png", width = 5, height = 5)

#Saving to a directed location
ggsave("C:\\Users\\AFSS-Student\\Documents\\R\\Output\\my-plot.pdf", width = 6, height = 6)

#Saving to disk 
saveRDS(p, "plot.rds")
q <- readRDS("plot.rds")
