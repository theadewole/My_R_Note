install.packages("tidyverse")
install.packages("babynames")
install.packages("gapminder")
install.packages("Lahman")
################################################################################
#Transforming Data with dplyr
################################################################################
library(babynames)
library(dplyr)
library(gapminder)
library(Lahman)

gap <- gapminder
baby <- babynames
team <- Teams

#####################################################
#Isolating data
    #select() - extract variables
    #filter() - extract cases
    #arrange() - reorder cases
######################################################
#Select ()
select(babynames,name,prop)
#Alter the code to select just the n column
select(babynames,n)

#Select range of columns
select(team,W:AB)

#Select every column but
select(team,-c(W,AB,H))

#starts_with() - Select columns that start with
select(team,starts_with("W"))

#ends_with() - Select columns that end with…
select(team,ends_with("D"))

#contains() - Select columns whose names contain
select(team,contains("A"))

#matches() - Select columns whose names match regular expression
select(team,matches("ID"))

#one_of() - Select columns whose names are one of a set
select(team,one_of("AB","ab"))

#num_range() - Select columns named in prefix, number style

