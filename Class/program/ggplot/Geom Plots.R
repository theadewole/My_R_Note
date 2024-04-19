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

######################################################
#Plot types
######################################################
df <- data.frame(
  x = c(3, 1, 5),
  y = c(2, 4, 6),
  label = c("a","b","c"))

#Assigning the plot to an object
p <- ggplot(df, aes(x, y, label = label)) +
  labs(x = NULL, y = NULL) + # Hide axis label
  theme(plot.title = element_text(size = 12)) # Shrink plot title

#Adding Scatterplot
p + geom_point() + ggtitle("point")

#Adding text on inside each corresponding point of the plot
p + geom_text() + ggtitle("text")

#Adding Stacked bar
p + geom_bar(stat = "identity") + ggtitle("bar")

#Adding tiles
p + geom_tile() + ggtitle("raster")

#Adding line
p + geom_line() + ggtitle("line")

#Adding area plot
p + geom_area() + ggtitle("area")

#Adding Path plot
p + geom_path() + ggtitle("path")

#Adding polygon plot
p + geom_polygon() + ggtitle("polygon")

#######################
#geom_rect
#######################
data <- data.frame(
  x = c(1, 3),
  y = c(2, 4),
  label = c("Rectangle 1", "Rectangle 2"))

ggplot() +
  geom_rect(
    aes(xmin = x - 0.5, xmax = x + 0.5, ymin = y - 0.5, ymax = y + 0.5),
    fill = "lightblue", color = "blue", alpha = 0.5,
    data = data) +
  geom_text(aes(x = x, y = y, label = label),data = data,vjust = 0.5 ) +
  xlim(0, 5) +
  ylim(0, 5) +
  labs(title = "Using geom_rect() in ggplot2",x = "X-axis",y = "Y-axis")

#####################
#geom_vline and hline application
#######################
data <- data.frame(
  x = 1:10,
  y = rnorm(10))

# Calculate the median of y
median_y <- median(data$y)
mean_x <- mean(data$x)

# Plot
ggplot(data, aes(x = x, y = y)) +
  geom_point() +  # Adding some points for context
  geom_vline(xintercept = median_y, color = "red", linetype = "dashed") + 
  geom_hline(yintercept = mean_x, color = "blue", linetype = "dashed") +
  geom_text(aes(x = median_y, y = mean_x, 
                label = paste("(", round(median_y, 2), ",", round(mean_x, 2), ")")),
            color = "black", vjust = "inward", hjust = "inward") +
  labs(title = "Using geom_vline() and hline in ggplot2",x = "X-axis",y = "Y-axis")

#geom_abline
data <- data.frame(x = 1:10, y = 2 * (1:10) + 3)

ggplot(data, aes(x, y)) +
  geom_point() +  # Add points
  labs(x = "X Axis", y = "Y Axis") +  # Add axis labels
  ggtitle("Scatter Plot with Abline")+
  geom_abline(slope = 1, intercept = 3, color = "red", linetype = "dashed")


################################################################################
#Collective Geoms
#page 46 of the ggplot Elegant Graphics
################################################################################
data(Oxboys, package = "nlme")
head(Oxboys)

#########################################
#Multiple Groups, One Aesthetic
########################################
#########
#When you specify a group aesthetic inside the aes() function, ggplot2 uses that information to 
#group the data points accordingly. This is particularly useful when you have multiple observations
#that should be connected in a plot, but they don't necessarily follow a 
#sequential order in the dataset.
##########
ggplot(Oxboys, aes(age, height, group = Subject)) +
  geom_point() +
  geom_line()


ggplot(Oxboys, aes(age, height)) +
  geom_point() +
  geom_line()

ggplot(Oxboys, aes(age, height, group =interaction(school_id, student_id))) +
  geom_point() +
  geom_line()

##########################################
#Different Groups on Different Layers
##########################################
#Adding a smooth line on the previous to all boys 
ggplot(Oxboys, aes(age, height, group = Subject)) +
  geom_line() +
  geom_smooth(method = "lm", se = FALSE)

#instead of putting the group in ggplot we put it in the line plot to apply to the line plot alone
ggplot(Oxboys, aes(age, height)) +
  geom_line(aes(group = Subject)) +
  geom_smooth(method = "lm", size = 2, se = FALSE)

#####################################
# Overriding the Default Grouping
#####################################
ggplot(Oxboys, aes(Occasion, height)) +
  geom_boxplot()

ggplot(Oxboys, aes(Occasion, height)) +
  geom_boxplot() +
  geom_line(colour = "#3366FF", alpha = 0.5)

ggplot(Oxboys, aes(Occasion, height)) +
  geom_boxplot() +
  geom_line(aes(group = Subject), colour = "#3366FF", alpha = 0.5)


###########################################
# Matching Aesthetics to Graphic Objects
###########################################
df <- data.frame(x = 1:3, y = 1:3, colour = c(1,3,5))

ggplot(df, aes(x, y, colour = factor(colour))) +
  geom_line(aes(group = 1), size = 2) +
  geom_point(size = 5)

ggplot(df, aes(x, y, colour = colour)) +
  geom_line(aes(group = 1), size = 2) +
  geom_point(size = 5)

xgrid <- with(df, seq(min(x), max(x), length = 50))
interp <- data.frame(
  x = xgrid,
  y = approx(df$x, df$y, xout = xgrid)$y,
  colour = approx(df$x, df$colour, xout = xgrid)$y)


ggplot(interp, aes(x, y, colour = colour)) +
  geom_line(size = 2) +
  geom_point(data = df, size = 5)


################################################################################
# Surface Plots
################################################################################
#contour plot
ggplot(faithfuld, aes(eruptions, waiting)) +
  geom_contour(aes(z = density, colour = ..level..))

#Raster Plot 
ggplot(faithfuld, aes(eruptions, waiting)) +
  geom_raster(aes(fill = density))

#Bubble plot
small <- faithfuld[seq(1, nrow(faithfuld), by = 10), ]
ggplot(small, aes(eruptions, waiting)) +
  geom_point(aes(size = density), alpha = 1/3) +
  scale_size_area()

