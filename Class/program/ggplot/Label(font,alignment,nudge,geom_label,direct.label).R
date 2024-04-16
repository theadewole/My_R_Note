library(tidyverse)
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
