library(tidyverse)
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
