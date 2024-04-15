library(ggplot2)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(mpg,aes(x = displ, y = hwy))+
  geom_point()

#Aesthetics
#This Automatically adds the legend
#color
ggplot(mpg) + geom_point(aes(x = displ, y = hwy, color = class))
#size
ggplot(mpg) + geom_point(aes(x = displ, y = hwy, size = class))
#shape
ggplot(mpg) + geom_point(aes(x = displ, y = hwy, shape = class))
#alpha
ggplot(mpg) + geom_point(aes(x = displ, y = hwy, alpha = class))

################################################################################
#mappig aes outside aes() vs inside
################################################################################
#Set the aes () to a varaible 
ggplot(mpg) + geom_point(aes(x = displ, y = hwy, color = class))
#Set the aes() to a value 
ggplot(mpg) + geom_point(aes(x = displ, y = hwy), color = "blue")

#####
#When color is set to value inside aes(), it will not resolve. Other to sustain the specify
## place outside aes()
ggplot(mpg) + geom_point(aes(x = displ, y = hwy, color = "blue"))
ggplot(mpg) + geom_point(aes(x = displ, y = hwy), color = "blue")

################################################################################
#The first command maps the constant value "blue" to the color aesthetic, resulting in all points being colored with the same blue color.
#The second command specifies the constant color "blue" for all points, regardless of their data attributes.
################################################################################

#Geoms
#boxplot
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = class, y = hwy))

ggplot(data = mpg) +
  geom_histogram(mapping = aes(x = hwy))
#adding bandwidth 
ggplot(data = mpg) +
  geom_histogram(mapping = aes(x = hwy), binwidth = 2)

ggplot(data = mpg) +
  geom_density(mapping = aes(x = hwy, color = class))


ggplot(data = mpg) +
  geom_bar(mapping = aes(x = class, color = class))

ggplot(data = mpg) +
  geom_bar(mapping = aes(x = class, fill = class))

#Adding a new layer
ggplot(mpg) + 
  geom_point(aes(displ, hwy)) +
  geom_smooth(aes(displ, hwy))


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

#Global vs Local
######################
#Mappings (and data) that appear in ggplot() will apply globally to every layer
#####################
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() + 
  geom_smooth()

################
#Mappings (and data) that appear in a geom_ function will add to or override the 
#global mappings for that layer only
##############
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = drv)) + 
  geom_smooth()

#Saving Plot 
#this will save the last plot 
ggsave("C:\\Users\\AFSS-Student\\Documents\\R\\Output\\my-plot.pdf", width = 6, height = 6)
