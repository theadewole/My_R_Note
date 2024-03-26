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



