library(ggplot2)
library(tidyverse)  
mpg <- mpg
################################################################################
# Basic
################################################################################
ggplot(mpg,aes(x=displ,y=hwy))+
  #geom_point is used to create scatterplot
  geom_point()+
  geom_text(aes(label=drv))

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


################################ CHAPTER 3######################################

######################################################
#Basic Plot types
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
p + geom_polygon() + ggtitle("polygon")+
  
  
  ###########################################
#Labels
###########################################
df <- data.frame(x = 1, y = 3:1, 
                 family = c("sans", "serif", "arial"))

##################################
#Applying font family
##################################
ggplot(df, aes(x, y)) +
  geom_text(aes(label = family, family = family))

###################
##Applying a single font type to the entire plot 
###################
#loading the extrafont package
#install.packages('extrafont')
library(extrafont)

#Importing the system font into r, its a one time process
font_import()

#Show entire table
fonttable()

#To load the installed font into the current working session
loadfonts()

#Check names of all available fonts 
fonts()
#########Using#########
install.packages("showtext")
library(showtext)
## Loading Google fonts (https://fonts.google.com/)
##The first part is the font name while the second is the given name
font_add_google("Gochi Hand", "gochi")
font_add_google("Schoolbell", "bell")
font_add_google("Covered By Your Grace", "grace")
font_add_google("Rock Salt", "rock")

## Automatically use showtext to render text for future devices
showtext_auto()

#using extratext option 
ggplot(df, aes(x, y)) +
  geom_text(aes(label = family, family = "Castellar"))

#using showtext option 
ggplot(df, aes(x, y)) +
  geom_text(aes(label = family, family = "gochi"))

##################################
#Applying font face (default "plain","bold","italic")
##################################
df <- data.frame(x = 1, y = 3:1, 
                 face = c("plain", "bold", "italic"))

ggplot(df, aes(x, y)) +
  geom_text(aes(label = face, fontface = face))

#Applying to all the same to all values 
ggplot(df, aes(x, y)) +
  geom_text(aes(label = face, fontface = "bold"))

##################################
#Alignment: hjust (“left”, “center”,“right”, “inward”, “outward”)
#vjust (“bottom”, “middle”, “top”, “inward”, “outward”) aesthetics. 
#The default alignment is centered. 
#One ofthe most useful alignments is “inward”: it aligns text towards the middle of the plot
##################################
df <- data.frame(
  x = c(1, 1, 2, 2, 1.5),
  y = c(1, 2, 1, 2, 1.5),
  text = c(
    "bottom-left", "bottom-right",
    "top-left", "top-right", "center"))

ggplot(df, aes(x, y)) +
  geom_text(aes(label = text))

ggplot(df, aes(x, y)) +
  geom_text(aes(label = text), vjust = "inward", hjust = "inward")

#applying label as count and alignmnet
ggplot(mpg,aes(y=manufacturer))+
  geom_bar(fill="blue")+
  geom_text(stat = "count", aes(label = ..count..), hjust =-2,color="red",vjust="inward")

#Rearrange the bar in ascending order
mpg_sorted <- mpg |> 
  group_by(manufacturer) |> 
  summarise(order=table(manufacturer)) |> 
  arrange(order) |> 
  mutate(manufacturer=factor(manufacturer,levels=manufacturer))

ggplot(mpg_sorted,aes(y=manufacturer,x=order))+
  geom_bar(stat="identity",fill="blue")+
  geom_text(aes(label =order), hjust =-0.25,color="red")

##################################
#Nudging text (nudge_x and nudge_y)
##################################
df <- data.frame(trt = c("a", "b", "c"), 
                 resp = c(1.2, 3.4, 2.5))

ggplot(df, aes(resp, trt)) +
  geom_point(color="blue",shape=8) +
  geom_text(aes(label = paste0("(", resp, ")")), nudge_y = -0.25,color="red") +
  xlim(1, 3.6)

mpg |> 
  group_by(manufacturer) |> 
  summarise(order=table(manufacturer)) |> 
  arrange(order) |> 
  mutate(manufacturer=factor(manufacturer,levels=manufacturer))


mpg_sorted <- mpg |> 
  group_by(manufacturer,class) |> 
  summarise(order=table(manufacturer))

ggplot(head(mpg_sorted),aes(y=order,x=manufacturer))+
  geom_point()+
  geom_text(aes(label=class),nudge_y = -0.5,vjust="middle",hjust="inward",
            color="blue")
#applying check_overlap to remove overlapping label
ggplot(mpg, aes(displ, hwy)) +
  geom_text(aes(label = model)) +
  xlim(1, 8)

ggplot(mpg, aes(displ, hwy)) +
  geom_text(aes(label = model), check_overlap = TRUE) +
  xlim(1, 8)

ggplot(mpg_sorted,aes(x=order,y=manufacturer))+
  geom_point(shape=7)+
  geom_text(aes(label=class),nudge_y = -0.5,vjust="middle",hjust="inward",
            color="blue",check_overlap =T)

#geom_label
label <- data.frame(
  waiting = c(55, 80),
  eruptions = c(2, 4.3),
  label = c("peak one", "peak two"))

ggplot(faithfuld, aes(waiting, eruptions)) +
  geom_tile(aes(fill = density)) +
  geom_label(data = label, aes(label = label))

#using directlabels to map all the label incase of overlapping
#Documentation  https://github.com/tdhock/directlabels
## Install required dependencies:
install.packages(c("reshape2","mlmRev","lars","latticeExtra"))
mlmRev::Chem97
## Install directlabels:
install.packages("directlabels")
library(directlabels)
library(latticeExtra)

data(Chem97,package="mlmRev")
p <- densityplot(~gcsescore|gender,Chem97,
                 groups=factor(score),layout=c(1,2),
                 n=500,plot.points=FALSE)
direct.label(p,"top.bumptwice")

data(mpg,package="ggplot2")
m <- lm(cty~displ,data=mpg)
mpgf <- fortify(m,mpg)
p <- xyplot(cty~hwy|manufacturer,mpgf,groups=class,aspect="iso",
            main="City and highway fuel efficiency by car class and manufacturer")+
  layer_(panel.abline(0,1,col="grey90"))
direct.label(p,"smart.grid")


ggplot(mpg, aes(displ, hwy, colour = class)) +
  geom_point(show.legend = FALSE) +
  directlabels::geom_dl(aes(label = class), method = "smart.grid")

#########################################
# Annotations
##geom text() to add text descriptions or to label points Most plots will not benefit from 
#adding text to every single observation on the plot, but labelling outliers and other important 
#points is very useful.

##geom rect() to highlight interesting rectangular regions of the plot. geom rect() has 
#aesthetics xmin, xmax, ymin and ymax.

##geom line(), geom path() and geom segment() to add lines. All these geoms have an arrow parameter, 
#which allows you to place an arrowhead on the line. Create arrowheads with arrow(), 
#which has arguments angle, length, ends and type.

##geom vline(), geom hline() and geom abline() allow you to add reference lines 
#(sometimes called rules), that span the full range of the plot.
#########################################
ggplot(economics, aes(date, unemploy)) +
  geom_line()

#Annotating the above to the president in power
eco <- economics
pre <-presidential
presidential <- subset(presidential, start > economics$date[1])

#geom_rect
data <- data.frame(
  x = c(1, 3),
  y = c(2, 4),
  label = c("Rectangle 1", "Rectangle 2"))

ggplot() +
  geom_rect(
    aes(xmin = x - 0.5, xmax = x + 0.5, ymin = y - 0.5, ymax = y + 0.5),
    fill = "lightblue", color = "blue", alpha = 0.5,
    data = data) +
  geom_text(aes(x = x, y = y, label = label),
            data = data,
            vjust = 0.5 ) +
  xlim(0, 5) +
  ylim(0, 5) +
  labs(title = "Using geom_rect() in ggplot2",x = "X-axis",y = "Y-axis")

#geom_vline and hline application
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


ggplot(economics) +
  geom_rect(
    aes(xmin = start, xmax = end, fill = party),
    ymin = -Inf, ymax = Inf, alpha = 0.2,
    data = presidential
  ) +
  geom_vline(
    aes(xintercept = as.numeric(start)),
    data = presidential,
    colour = "grey50", alpha = 0.5
  ) +
  geom_text(
    aes(x = start, y = 2500, label = name),
    data = presidential,
    size = 3, vjust = 0, hjust = 0, nudge_x = 50
  ) +
  geom_line(aes(date, unemploy)) +
  scale_fill_manual(values = c("blue", "red"))





