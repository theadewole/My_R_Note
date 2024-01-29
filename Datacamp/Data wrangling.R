################################################################################
#Data Wrangling
################################################################################

#Loading the gapminder and dplyr packages
# Load the gapminder package
library(gapminder)
# Load the dplyr package
library(dplyr)
# Look at the gapminder dataset
gapminder

################################################################################
#Filter ()
################################################################################
# Filter the gapminder dataset for the year 1957
gapminder %>%
  filter (year==1957)

# Filter for China in 2002
gapminder %>%
  filter(country=="China",year==2002)

################################################################################
# Arrange()
################################################################################
library(dplyr)

# Example data frame
data <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David", "Eva"),
  Age = c(25, 30, 22, 35, 28),
  Salary = c(50000, 60000, 45000, 70000, 55000))

# Arrange the data frame by Age in ascending order
arranged_data <- arrange(data, Age)

# Print the result
print(arranged_data)

# Arrange the data frame by Age in descending order
arranged_data_desc <- arrange(data, desc(Age))

# Print the result
print(arranged_data_desc)

#######################
#Datacamp Example 
#######################
# Sort in ascending order of lifeExp
gapminder %>%
  arrange(lifeExp)

# Sort in descending order of lifeExp
gapminder %>%
  arrange(desc(lifeExp))

#Filter for the year 1957, then arrange in descending order of population
gapminder %>%
  filter(year==1957) %>%
  arrange(desc(pop))

################################################################################
#mutate ()
################################################################################
# Example data frame
data <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David", "Eva"),
  Age = c(25, 30, 22, 35, 28),
  Salary = c(50000, 60000, 45000, 70000, 55000))

# Use mutate to create a new column 'SalaryAfterBonus'
data_mutated <- mutate(data, SalaryAfterBonus = Salary * 1.1)

# Print the result
print(data_mutated)

# Use mutate to create a new column 'AgeGroup'
data_mutated <- mutate(data, AgeGroup = ifelse(Age < 30, "Young", "Old"))

# Print the result
print(data_mutated)

# Use mutate to create a new column 'AgeGroup'
data_mutated <- mutate(data, AgeGroup = ifelse(Age < 30, "Young", "Old"))

# Print the result
print(data_mutated)

##########################
#Datacamp example 
#########################
# Use mutate to change lifeExp to be in months
gapminder %>%
  mutate(lifeExp=12*lifeExp)

# Use mutate to create a new column called lifeExpMonths
gapminder %>%
  mutate(lifeExpMonths=12*lifeExp)

# Filter, mutate, and arrange the gapminder dataset
gapminder %>%
  filter(year==2007)%>%
  mutate(lifeExpMonths=12*lifeExp)%>%
  arrange(desc(lifeExpMonths))

################################################################################
# Data Visualization
################################################################################
# Load the ggplot2 package as well
library(gapminder)
library(dplyr)
library(ggplot2)

# Create gapminder_1952
gapminder_1952 <- gapminder %>%
  filter(year==1952)

# Change to put pop on the x-axis and gdpPercap on the y-axis
ggplot(gapminder_1952, aes(x = pop, y = gdpPercap)) +
  geom_point()

# Load the ggplot2 package as well
library(gapminder)
library(dplyr)
library(ggplot2)

# Create gapminder_1952
gapminder_1952 <- gapminder %>%
  filter(year==1952)

# Change to put pop on the x-axis and gdpPercap on the y-axis
ggplot(gapminder_1952, aes(x = pop, y = gdpPercap)) +
  geom_point()

# Create a scatter plot with pop on the x-axis and lifeExp on the y-axis
ggplot(gapminder_1952,aes(x=pop,y=lifeExp)) +
  geom_point()
########################
#Log Scale
#######################
# Change this plot to put the x-axis on a log scale
ggplot(gapminder_1952, aes(x = pop, y = lifeExp)) +
  geom_point() + 
  scale_x_log10()

# Scatter plot comparing pop and gdpPercap, with both axes on a log scale
ggplot(gapminder_1952,aes(x=pop,y=gdpPercap))+geom_point()+
  scale_x_log10()+scale_y_log10()

########################################
#Additional Aesthetic
#######################################
# Scatter plot comparing pop and lifeExp, with color representing continent
ggplot(gapminder_1952,aes(x=pop,y=lifeExp,color=continent))+
  geom_point()+
  scale_x_log10()

# Add the size aesthetic to represent a country's gdpPercap
ggplot(gapminder_1952, aes(x = pop, y = lifeExp, 
  color = continent, size=gdpPercap)) +
    geom_point() +
scale_x_log10()

##################################
# Facet
#################################
# Scatter plot comparing pop and lifeExp, faceted by continent
ggplot(gapminder_1952,aes(x=pop,y=lifeExp))+
  geom_point()+
  scale_x_log10()+
  facet_wrap(~continent)
#Scatter plot comparing gdpPercap and lifeExp, with color representing continent
 ##and size representing population, faceted by year
ggplot(gapminder,aes(x=gdpPercap,y=lifeExp,
  color=continent,color=pop))+
  geom_point()+
  scale_x_log10()+
  facet_wrap(~year)