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

#################
#SELECT ()
################
select(babynames,name,prop)

#Alter the code to select just the n column
select(babynames,n)

#Selecting range of columns
select(team,W:AB)

#Selecting every column but
select(team,-c(W,AB,H))

#starts_with() - Selecting columns that start with
select(team,starts_with("W"))

#ends_with() - Selecting columns that end with…
select(team,ends_with("D"))

#contains() - Selecting columns whose names contain
select(team,contains("A"))

#matches() - Selecting columns whose names match regular expression
select(team,matches("ID"))

#one_of() - Selecting columns whose names are one of a set
select(team,one_of("AB","G"))

#num_range() - Selecting columns named in prefix, number style
  #Create a sample data frame
df <- data.frame(x_1 = 1:5,x_2 = 6:10,y_1 = 11:15, y_2 = 16:20)
  #Use num_range() to select columns with names matching the pattern
  select(df,num_range("x_", range = c(2, 2)))

####################
#     FILTER ()    #
####################
filter(babynames, name == "Garrett")

#All of the names where prop is greater than or equal to 0.08
filter(babynames,prop>=0.08)

#All of the children named “Sea”
filter(babynames,name=="Sea")

#All of the names that have a missing value for n
filter(babynames,is.na(n))

#Filtering more than one variable
filter(babynames, name == "Garrett", year == 1880)

###################################
#Filter with logical and 
  #boolean operator
##################################

#With 'and' operator 
filter(babynames, name == "Garrett" & year == 1880)

#Girls named Sea
filter(babynames,name=="Sea",sex=="F")

#Names that were used by exactly 5 'or' 6 children in 1880
filter(babynames,n==5 | n==6 ,year==1880)

#Names that are one of Acura, Lexus, or Yugo
filter(babynames,name %in% c("Acura", "Lexus", "Yugo"))

#####################
#     ARRANGE       #
#####################

#Order rows from smallest to largest values.
arrange(babynames, n)

#Arrange babynames by n. Add prop as a second (tie breaking) variable to arrange on.
arrange(babynames,n,prop)

Changes ordering to largest to smallest.
arrange(babynames, desc(n))

#Use desc() to find the names with the highest prop.
arrange(babynames,desc(prop))

#Then, use desc() to find the names with the highest n
arrange(babynames,desc(n))

#Combining filter arrange and select
boys_2015 <- filter(babynames, year == 2015, sex == "M")
boys_2015 <- select(boys_2015, name, n)
boys_2015 <- arrange(boys_2015, desc(n))
boys_2015

combine <- arrange(select(filter(babynames, year == 2015, 
                      sex == "M"), name, n), desc(n))

##################################
#     The pipe operator %>%      #
##################################
filter(babynames, n == 99680)
babynames %>% filter(n == 99680)

#using pipe to combine filter select and arrange
babynames %>%
  filter(year == 2015, sex == "M") %>%
  select(name, n) %>%
  arrange(desc(n))

###############
#Filter babynames to just the girls that were born in 2015 
  #Select the name and n columns 
    #Arrange the results so that the most popular names are near the top.
##############
babynames %>% 
  filter(sex=="F",year==2015) %>% 
  select(name,n) %>% 
  arrange(desc(n))

###################
#Trim babynames to just the rows that contain your name and your sex
    #Trim the result to just the columns that will appear in 
      ##your graph (not strictly necessary, but useful practice)
        #Plot the results as a line graph with year on the x axis and prop on the y axis
####################
babynames %>% 
  filter(name=="Garrett",sex=="M") %>% 
  select(year,prop) %>% 
  ggplot()+
  geom_line(mapping = aes(year,prop))

##########################
#        summarise()     #
##########################
babynames %>% summarise(total = sum(n), max = max(n))

#######################
# The first (minimum) year in the dataset
# The last (maximum) year in the dataset
# The total number of children represented in the data
##################

babynames %>% summarise(first=min(year),
        last=max(year),
        total=sum(n))
##########################################
#Extract the rows where name == "Khaleesi". Then use  summarise() and a summary functions to find: 
#The total number of children named Khaleesi 
#The first year Khaleesi appeared in the data
############################################
babynames %>% 
  filter(name=="Khaleesi") %>% 
  summarise(total=sum(n),first_year=min(year))

#n(): The number of rows in a dataset/group
babynames %>% summarise(n = n())

#n_distinct(): The number of distinct values in a variable
babynames %>% summarise(n = n(), nname = n_distinct(name))

#showing total obs,country and continent in the dataset 
gapminder %>% summarise(obs=n(),country=n_distinct(country),
                        continent=n_distinct(continent))

##############################
#     Grouping cases         #
##############################
babynames %>% 
  group_by(sex)

#group_by and summarise
babynames %>% 
  group_by(sex) %>%
  summarise(total = sum(n))

################################
#Use group_by(), summarise(), and arrange() to display the ten most popular names. 
#Compute popularity as the total number of children of a single gender given a name
##############################
babynames %>% group_by(name,sex) %>%
  summarise(total=sum(n)) %>% 
  arrange(desc(total))

#Use grouping to calculate and then plot the number of children born each year over time.
babynames %>% 
  group_by(year) %>% 
  summarise(n_children=sum(n)) %>% 
  ggplot()+
  geom_line(mapping = aes(x=year, y= n_children))

#ungroup():Removes grouping criteria from a data frame
babynames %>%
  group_by(name, sex) %>% 
  ungroup() %>%
  summarise(total = sum(n)) %>% 
  arrange(desc(total))



##############################
#             Mutate         #
##############################
babynames %>%
  mutate(percent = round(prop*100, 2))

babynames %>%
  mutate(percent = round(prop*100, 2), nper = round(percent))

#min_rank
min_rank(c(50,100,1000))

min_rank(desc(c(50, 100, 1000)))

# Create a data frame
df <- data.frame(
  ID = c(1, 2, 3, 4),
  Value = c(10, 15, 10, 20)
)

# Use min_rank() to calculate the ranks of 'Value'
df <- mutate(df, Rank = min_rank(Value))

##############################
#      Joining Dataset       #
##############################
install.packages("nycflights13")
library(nycflights13)
View(flights)
View(airlines)

band <- tribble(
  ~name,     ~band,
  "Mick",  "Stones",
  "John", "Beatles",
  "Paul", "Beatles"
)

instrument <- tribble(
  ~name,   ~plays,
  "John", "guitar",
  "Paul",   "bass",
  "Keith", "guitar"
)

instrument2 <- tribble(
  ~artist,   ~plays,
  "John", "guitar",
  "Paul",   "bass",
  "Keith", "guitar"
)

# left join
band %>% left_join(instrument, by = "name")

# right join
band %>% right_join(instrument, by = "name")

# full join 
band %>% full_join(instrument, by = "name")

# inner join
band %>% inner_join(instrument, by = "name")


#Which airlines had the largest arrival delays? Work in groups to complete the code below
library(tidyverse)
flights %>% 
  drop_na(arr_delay) %>%
  left_join(airlines, by = "carrier") %>%
  group_by(name) %>%
  summarise(delay = mean(arr_delay)) %>%
  arrange(delay)

#Use a named vector to match on variables with different names.
band %>% left_join(instrument2, by = c("name" = "artist"))
airports %>% left_join(flights, by = c("faa" = "dest"))

airports %>% select(1:3)
flights %>% select(14:15)

#Filtering Joins
#semi Join: is a type of join operation that returns only the rows from the left data frame 
 #(or table) where there is a match with the right data frame based on a specified condition.
band %>% semi_join(instrument, by = "name")

#Anti Join:is a type of join operation that returns only the rows from the left data 
 #frame (or table) where there is no match with the right data frame based on a specified condition
band %>% anti_join(instrument, by = "name")

#How many airports in airports are serviced by flights 
    ## originating in New York (i.e. flights in our dataset?)
airports %>%
  semi_join(flights, by = c("faa" = "dest")) %>%
  distinct(faa)

# distinct(): Removes rows with duplicate values (in a column)
distinct(babynames,name)

