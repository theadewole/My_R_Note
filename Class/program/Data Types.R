library(tidyverse)
library(nycflights13)

View(flights)

flights %>%
  mutate(delayed = arr_delay > 0) %>%
  select(arr_delay, delayed)

###################################
#Use flights to create delayed, the variable that displays whether a flight was 
#delayed (arr_delay > 0). Then, remove all rows that contain an NA in delayed. 
#Finally, create a summary table that shows: 
#How many flights were delayed 
#What proportion of flights were delayed
###################################

flights %>%
  mutate(delayed = arr_delay > 0) %>%
  drop_na(delayed) %>%
  summarise(total = sum(delayed), prop = mean(delayed))

################################################################################
#                           stringr                                            #
################################################################################
#########################
#str_extract
########################
# Sample vector of email addresses
emails <- c("john@example.com", "jane@example.org", "smith@example.net")

# Extract the domain part from each email address
domains <- str_extract(emails, "@\\w+\\.\\w+")

#########################
#str_detect
########################
# Check if each email address contains ".com"
contains_com <- str_detect(emails, ".com")

#########################
#str_subset()
########################
# Sample vector of file names
file_names <- c("document1.txt", "image.png", "data.csv", "document2.txt")

# Extract file names that end with ".txt"
txt_files <- str_subset(file_names, "\\.txt$")

############################
#str_sub()
###########################
g <- "Garrett"
#extract the 1 and 2 string
str_sub(g,1,2)

#extract only the 1st string 
str_sub(g,1,1)

#extraction start from the 2nd till the last character in the string 
str_sub(g,2)

#extract the last 3 character of the string
str_sub(g,-3)

#extract the last 3 string and replace with another
str_sub(g, -3) <- "eth"
g

################################
#Isolate the last letter of every name 
#and create a logical variable that displays whether the last letter is one of 
  #"a", "e", "i", "o", "u", or "y". 
#Use a weighted mean to calculate the proportion of children whose name ends 
  #in a vowel (by year and sex) 
#and then display the results as a line plot
###############################

library(babynames)
babynames %>%
  mutate(last = str_sub(name, -1), 
         vowel = last %in% c("a", "e", "i", "o", "u", "y")) %>%
  group_by(year, sex) %>%
  summarise(p_vowel = weighted.mean(vowel, n))%>%
  ggplot() +
  geom_line(mapping = aes(year, p_vowel, color = sex))

#help docuumentation
help(package = stringr)
################################################################################
#                             forcats                                          #
################################################################################
help(package = forcats)
eyes <- factor(x = c("blue", "green", "green"), 
               levels = c("blue", "brown", "green"))
eyes
unclass(eyes)

View(gss_cat)

gss_cat %>%
  drop_na(tvhours) %>%
  group_by(relig) %>%
  summarise(tvhours = mean(tvhours)) %>%
  ggplot(aes(tvhours, relig)) +
  geom_point()


##########################
#fct_reorder()
#########################
#average TV consumption by religion
gss_cat %>%
  drop_na(tvhours) %>%
  group_by(relig) %>%
  summarise(tvhours = mean(tvhours)) %>%
  ggplot(aes(tvhours, fct_reorder(relig, tvhours))) +
  geom_point()

#average TV consumption by marital status
gss_cat %>%
  drop_na(tvhours) %>%
  group_by(marital) %>%
  summarise(tvhours = mean(tvhours)) %>%
  ggplot(aes(tvhours, fct_reorder(marital, tvhours))) +
  geom_point()

#average tv hours by party ID an then plot the results
gss_cat %>%
  drop_na(tvhours) %>%
  group_by(partyid) %>%
  summarise(tvhours = mean(tvhours)) %>%
  ggplot(aes(tvhours, fct_reorder(partyid, tvhours))) +
  geom_point() +
  labs(y = "partyid")

######################################
#fct_recode
######################################
gss_cat %>%
  drop_na(tvhours) %>%
  mutate(partyid = fct_recode(partyid,
                              "Republican, strong" = "Strong republican",
                              "Republican, weak" = "Not str republican",
                              "Independent, near rep" = "Ind,near rep",
                              "Independent, near dem" = "Ind,near dem",
                              "Democrat, weak" = "Not str democrat",
                              "Democrat, strong" = "Strong democrat")) %>% 
  group_by(partyid) %>%
  summarise(tvhours = mean(tvhours)) %>%
  ggplot(aes(tvhours, fct_reorder(partyid, tvhours))) +
  geom_point() + labs(y = "partyid")

##########################
#fct_infreq
#########################
gss_cat %>%
  ggplot(aes(fct_infreq(marital))) + geom_bar()

##########################
#fct_rev
#########################
gss_cat %>%
  ggplot(aes(fct_rev(fct_infreq(marital)))) + geom_bar()

##########################
#fct_collapse()
#########################
gss_cat %>%
  drop_na(tvhours) %>%
  mutate(partyid = fct_collapse(partyid,
                                conservative = c("Strong republican", 
                                                 "Not str republican", 
                                                 "Ind,near rep"),
                                liberal = c("Strong democrat", 
                                            "Not str democrat", 
                                            "Ind,near dem"))) %>% 
  group_by(partyid) %>%
  summarise(tvhours = mean(tvhours)) %>%
  ggplot(aes(tvhours, fct_reorder(partyid, tvhours))) +
  geom_point() + labs(y = "partyid")

##########################
#fct_lump()
#########################
gss_cat %>%
  drop_na(tvhours) %>%
  mutate(partyid = partyid %>%
           fct_collapse(
             conservative = c("Strong republican", 
                              "Not str republican", "Ind,near rep"),
             liberal = c("Strong democrat", "Not str democrat", 
                         "Ind,near dem")) %>%
           fct_lump()
  ) %>%
  group_by(partyid) %>%
  summarise(tvhours = mean(tvhours)) %>%
  ggplot(aes(tvhours, fct_reorder(partyid, tvhours))) +
  geom_point() + labs(y = "partyid")

gss_cat %>%
  drop_na(tvhours) %>%
  mutate(partyid = partyid %>%
           fct_collapse(
             conservative = c("Strong republican", 
                              "Not str republican", "Ind,near rep"),
             liberal = c("Strong democrat", "Not str democrat", 
                         "Ind,near dem")) %>%
           fct_lump()
  ) %>%
  group_by(partyid) %>%
  summarise(tvhours = mean(tvhours)) %>%
  ggplot(aes(fct_reorder(partyid, tvhours), tvhours)) +
  geom_col() + labs(x = "partyid") + coord_flip()

################################################################################
#                             Dates                                            #
################################################################################
  current_date <- Sys.Date()
current_time <- Sys.time()

flights %>% select(c(1, 2, 3, 17, 18, 5, 19))

flights %>% 
  ggplot(mapping = aes(x = sched_dep_time, y = arr_delay)) + 
  geom_point(alpha = 0.2) + geom_smooth()

##########################
#hms
#########################
library(hms)
hms(seconds = 56, min = 34, hour = 12)
hms(56,34,12)
hms(h=56,m=23,s=30)

unclass(hms(56, 34, 12))

#######################
#What is the best time of day to fly? 
#Use the hour and minute variables in flights to compute the time of day for each
#flight as an hms. 
#Then use a smooth line to plot the relationship between time of day and arr_delay.
#######################################
flights %>% 
  mutate(time = hms(hour = hour, minute = minute)) %>% 
  ggplot(aes(time, arr_delay)) + 
  geom_point(alpha = 0.2) + geom_smooth()

################################################
#lubridate                                     #
################################################
library(lubridate)

################################
#Parsing dates and times
###############################
#Parse a date in the format YYYY-MM-DD
date_string <- "2024-02-19"
parsed_date <- ymd(date_string)
print(parsed_date)

#Parse a date-time in the format YYYY-MM-DD HH:MM:SS
datetime_string <- "2024-02-19 15:30:00"
parsed_datetime <- ymd_hms(datetime_string)
print(parsed_datetime)

#Parse a date-time with a specific timezone
datetime_string <- "2024-02-19 15:30:00"
parsed_datetime <- with_tz(ymd_hms(datetime_string), tz = "America/New_York")
print(parsed_datetime)

############################
#Accessing Component
############################
datetime <- ymd_hms("2024-02-19 15:30:00")
year(datetime)  
month(datetime) 
day(datetime)   
hour(datetime)  
minute(datetime)
second(datetime) 

# Accessing weekday
wday(datetime)  
wday(datetime, label = TRUE)

# Manipulating dates
date <- ymd("2024-02-19")
date + months(3)

# Interval arithmetic
interval <- interval(ymd("2024-01-01"), ymd("2024-12-31"))
as.period(interval)

# Time zone handling
with_tz(date, "America/New_York")
#######################################################################


ymd("2017/01/11")
mdy("January 11, 2017")
ymd_hms("2017-01-11 01:30:55")


##########################
#Accessing and changing components
#########################
date <- ymd("2017-01-11")
year(date)

#replacing date 
year(date) <- 1999
date

#day of week
wday(ymd("2017-01-11"))

#returns the day of the week (abbreviated) and show the level 
wday(ymd("2017-01-11"), label = TRUE)

#returns the day of the week (not abbreviated) and show the level 
wday(ymd("2017-01-11"), label = TRUE,abbr=F)

############################
#Extract the day of the week of each flight (as a full name) from time_hour. 
#Calculate the average arr_delay by day of the week. 
#Plot the results as a column chart (bar chart) with geom_col().
###########################
flights %>% 
  mutate(weekday=wday(time_hour,label=T,abbr=F)) %>% 
  group_by(weekday) %>% 
  drop_na(arr_delay) %>% 
  summarize(avg_delay=mean(arr_delay)) %>% 
  ggplot()+
  geom_col(mapping = aes(x=weekday,y=avg_delay))

hms::hms(seconds = 3, hours = 5)