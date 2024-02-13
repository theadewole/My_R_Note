library(tidyverse)

View(table1)
View(table2)
View(table3)
View(table4a)
View(table4b)
View(table5)
View(Toy)


# What are the variables in this data set
str(table1)

table2$count[c(1,3,5,7,9,11)] 
table2$count[c(2,4,6,8,10,12)]

cases <- tribble(
  ~"country",~"2011",~"2012",~"2013",
  "FR",   7000,   6900,   7000,
  "DE",   5800,   6000,   6200,
  "US",  15000,  14000,  13000
)

################################################################################
#                             gather()                                         #
################################################################################
#2:4:numeric indexes of columns to collapse (or names)
cases %>% 
  gather(key = "year", value = "n", 2:4)

#"2011", "2012", "2013": Listing the collapse column name 
cases %>% 
  gather("year","n", "2011", "2012", "2013")

#-country:country column as identifier column without being gathered
cases %>% 
  gather("year","n", -country)

###########################
#Use gather() to reorganize table4a into three columns: country, year, and cases.
##########################
table4a %>% 
  gather(key="year",value="n",-country)

table4a %>% 
  gather(key = "year", value = "n", 2:3, convert = TRUE)

################################################################################
#                             spread ()                                        #
################################################################################
pollution <- tribble(
  ~city,  ~size, ~amount, 
  "New York", "large",      23,
  "New York", "small",      14,
  "London", "large",      22,
  "London", "small",      16,
  "Beijing", "large",      121,
  "Beijing", "small",      56
)

pollution %>% spread(key = size, value = amount)

pollution %>% spread(size, amount)

##################################
#Use spread() to reorganize table2 into four columns: country, year, 
#cases, and population
#################################
table2 %>% 
  spread(key = type, value = count)

#Application
wh <- select(who,-c(starts_with("i")))

me<-wh %>% 
 gather(key = "test",value="Value",3:58,-year) %>% 
  filter(!is.na(Value)) 

################################################################################
#                             separate ()                                      #
################################################################################
View(who)

who %>%
  gather("codes", "n", 5:60) %>%
  select(-iso2, -iso3) %>% 
  separate(codes, into = c("new", "type", "sexage"), sep = "_") %>% 
  select(-new)

#split by character:locations to split at (Split atfer 4th and 7th characters)
who %>%
  gather("codes", "n", 5:60) %>%
  select(-iso2, -iso3) %>%
  separate(codes, c("new", "type", "sexage"), sep = c(4, 7))

#########################
#Separate the sexage column into sex and age columns
########################
age <- who %>%
  gather("codes", "n", 5:60) %>%
  select(-iso2, -iso3) %>%
  separate(codes, c("new", "type", "sexage"), sep = "_") %>%
  select(-new) %>%
  separate(sexage, into = c("sex", "age"), sep = 1)

################################################################################
#                             unite ()                                         #
################################################################################
df <- data.frame(
  ID = 1:3,
  Name = c("John", "Alice", "Bob"),
  Age = c(25, 30, 40)
)


#Unite the 'Name' and 'Age' columns into a single column called 'Name_Age', 
#separated by underscore (_)
df_united <- unite(df, col = Name_Age, c("Name", "Age"), sep = "-")

# Display the data frame after uniting
View(df_united)


who %>%
  gather("codes", "n", 5:60) %>%
  separate(codes, c("new", "type", "sexage"), sep = "_") %>%
  select(-new, -iso2, -iso3) %>%
  separate(sexage, c("sex", "age"), sep = 1) %>%
  drop_na(n) %>% 
  unite("age_sex",sex,age,sep="_")


##############################
#drop_na()
#############################
who %>%
  gather("codes", "n", 5:60) %>%
  separate(codes, c("new", "type", "sexage"), sep = "_") %>%
  select(-new, -iso2, -iso3) %>%
  separate(sexage, c("sex", "age"), sep = 2) %>%
  drop_na(n)


################################################################################
library(babynames)
babynames %>%
  group_by(year, sex) %>% 
  summarise(n = sum(n))

better_layout <- babynames %>% 
  spread(key=sex,value=n) %>% 
  select(-prop)

#Reshape the layout of this data. Calculate the percent of male 
#(or female) children by year. Then plot the percent over tim
babynames %>%
  group_by(year, sex) %>% 
  summarise(n = sum(n)) %>%
  spread(sex, n) %>%
  mutate(percent_male = M / (M + F) * 100) %>%
  ggplot(aes(year, percent_male)) + geom_line()

