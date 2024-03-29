# Loading the gapminder and dplyr packages
Before you can work with the gapminder dataset, you'll need to load two R packages that contain the tools for working with it, then display the gapminder dataset so that you can see what it contains.

To your right, you'll see two windows inside which you can enter code: The script.R window, and the R Console. All of your code to solve each exercise must go inside script.R.
```
~ Load the gapminder package
library(gapminder)
~ Load the dplyr package
library(dplyr)
~ Look at the gapminder dataset
gapminder
```
## Filter ()
The filter verb extracts particular observations based on a condition. <br>
In R, the filter() function is often associated with the dplyr package, which is part of the tidyverse collection of packages <br>
```filter(data, condition)``` <br>
- data: The data frame you want to filter.
- condition: The filtering condition, specifying which rows to keep. <br>
*Some Important note*
- %>%: is called a pipe, takes the output from the left-hand side and passes it as the first argument to the function on the right-hand side. This allows you to chain together multiple operations in a way that mirrors the natural flow of data
- Use " " to filter characters while numeric variables don't require " ".
Multiple filters can be applied by separation with (,).
```
~ Filter the gapminder dataset for the year 1957
gapminder %>%
  filter (year==1957)
~ Filter for China in 2002
gapminder %>%
  filter(country=="China",year==2002)
```
## Arrange () 
The arrange() function is commonly used in the context of the dplyr package in R. It is used to reorder rows in a data frame based on one or more columns. The arrange() function sorts the data frame in ascending order by default, but you can specify the order using the desc() function for descending order.<br>
```arrange(data_frame, column1, column2, ...)``` <br>
- data_frame: The data frame you want to arrange.
- column1, column2, ...: Columns by which the data frame should be arranged. You can specify multiple columns, and the data frame will be sorted first by the first column, then by the second column, and so on. <br>
```
~ Example data frame
data <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David", "Eva"),
  Age = c(25, 30, 22, 35, 28),
  Salary = c(50000, 60000, 45000, 70000, 55000))
~ Arrange the data frame by Age in ascending order
arranged_data <- arrange(data, Age)
~ Print the result
print(arranged_data)

~ Arrange the data frame by Age in descending order
arranged_data_desc <- arrange(data, desc(Age))
~  Print the result
print(arranged_data_desc)
```

```
~ Sort in ascending order of lifeExp
gapminder %>%
arrange(lifeExp)
~ Sort in descending order of lifeExp
gapminder %>%
arrange(desc(lifeExp))
~ Filter for the year 1957, then arrange in descending order of population
gapminder %>%
filter(year==1957) %>%
arrange(desc(pop))
```
## mutate ()  
The mutate() function is part of the dplyr package in R, and it is used for creating or modifying columns (variables) in a data frame. It is particularly useful for adding new variables based on the existing ones or modifying existing variables. <br>
```mutate(data_frame, new_column = expression, ...)``` <br>
- data_frame: The data frame you want to mutate.
- new_column: The name of the new column you want to create or the existing column you want to modify.
- expression: The expression that defines how the new column should be created or how the existing column should be modified.
...: Additional columns to create or modify.
```
~ Example data frame
data <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David", "Eva"),
  Age = c(25, 30, 22, 35, 28),
  Salary = c(50000, 60000, 45000, 70000, 55000))
~ Use mutate to create a new column 'SalaryAfterBonus'
data_mutated <- mutate(data, SalaryAfterBonus = Salary * 1.1)
~ Print the result
print(data_mutated)

~ Use mutate to create a new column 'AgeGroup'
data_mutated <- mutate(data, AgeGroup = ifelse(Age < 30, "Young", "Old"))

~ Print the result
print(data_mutated)
```
```
~ Use mutate to change lifeExp to be in months
gapminder %>%
mutate(lifeExp=12*lifeExp)
~ Use mutate to create a new column called lifeExpMonths
gapminder %>%
mutate(lifeExpMonths=12*lifeExp)
~ Filter, mutate, and arrange the gapminder dataset
gapminder %>%
filter(year==2007)%>%
mutate(lifeExpMonths=12*lifeExp)%>%
arrange(desc(lifeExpMonths))
```
# Data Visualization 
## ggplot
Before creating a plot, you need to load your data into R and possibly perform some data wrangling. Make sure your data is in a format suitable for the plot you want to create.
Basic syntax <br>
```ggplot(data = your_data_frame, mapping = aes(x = x_variable, y = y_variable))``` <br>
- data: The data frame containing your data.
- mapping: The aesthetic mapping, specifying which variables represent the x and y axes.
#### Geometric Objects (Geoms):
Geoms are the graphical representations of the data points in your plot. Common geoms include points, lines, bars, and more. 
You add them to your plot using the + operator <br>
``` ggplot(data = your_data_frame, mapping = aes(x = x_variable, y = y_variable))+geom_point()```
#### Aesthetics (aes)
define how variables in your data are mapped to visual properties. In the aes() function, you specify which variables correspond to the x-axis (x), y-axis (y), color (color), size (size), shape (shape), and more <br>
```ggplot(data = your_data_frame, mapping = aes(x = x_variable, y = y_variable, color = category_variable)) + geom_point()``` 
#### Faceting
Faceting allows you to create multiple plots based on the levels of a categorical variable. You can use facet_grid() or facet_wrap(). <br>
``` ggplot(data = your_data_frame, mapping = aes(x = x_variable, y = y_variable)) + geom_point() + facet_wrap(~category_variable) ```
#### Themes and Labels:
You can customize the appearance of your plot using themes and add labels to axes, titles, and more <br>
```ggplot(data = your_data_frame, mapping = aes(x = x_variable, y = y_variable)) + geom_point() + labs(title = "My Plot Title", x = "X-axis Label", y = "Y-axis Label") + theme_minimal()```

```
~ Load the ggplot2 package as well
library(ggplot2)
~ Create gapminder_1952
gapminder_1952 <- gapminder %>%
  filter(year==1952)
~ Change to put pop on the x-axis and gdpPercap on the y-axis
ggplot(gapminder_1952, aes(x = pop, y = gdpPercap)) +
  geom_point()
~ Create a scatter plot with pop on the x-axis and lifeExp on the y-axis
ggplot(gapminder_1952,aes(x=pop,y=lifeExp)) +
  geom_point()
```
## Log scale
scale - that is, a scale where each fixed distance represents a multiplication of the value. This is what the scatter plot looks like when x is on a log scale. To apppy this you add + after the geom plot of choice <br>
```scale_x_log10()``` for xaxis <br>
```scale_y_log10()``` for yaxis
## Additional Aesthetic
Used to add additional details to the plot and legend to the plot
- The color aesthetic
```....aes(x=,y=,color=)```
- Size aesthetic
```....aes(x=,y=,size=)```

```
~ Scatter plot comparing pop and lifeExp, with color representing continent
ggplot(gapminder_1952,aes(x=pop,y=lifeExp,color=continent))+
  geom_point()+
  scale_x_log10()
~ Add the size aesthetic to represent a country's gdpPercap
ggplot(gapminder_1952, aes(x = pop, y = lifeExp, 
  color = continent, size=gdpPercap)) +
    geom_point() +
scale_x_log10()
```
## Faceting 
It helps to divide our plot into sub plots <br>
```.....+geom_point()+facet_wrap(~)```
```
~ Scatter plot comparing pop and lifeExp, faceted by continent
ggplot(gapminder_1952,aes(x=pop,y=lifeExp))+
  geom_point()+
  scale_x_log10()+
  facet_wrap(~continent)
~ Scatter plot comparing gdpPercap and lifeExp, with color representing continent and size representing population, faceted by year
ggplot(gapminder,aes(x=gdpPercap,y=lifeExp,
  color=continent,color=pop))+
  geom_point()+
  scale_x_log10()+
  facet_wrap(~year)
```

# Grouping and Summarization
## Summarization
Summarizing will always give one output <br>
can be used to evaluate average (mean), median, min, max <br>
```
~ Summarize to find the median life expectancy
gapminder %>%
  summarize(medianLifeExp=median(lifeExp))
~ Filter for 1957 then summarize the median life expectancy
gapminder %>%
filter(year==1957)%>%
summarize(medianLifeExp=median(lifeExp))
~Filter for 1957 then summarize the median life expectancy and the maximum GDP per capita
~ Filter for 1957 then summarize the median life expectancy
gapminder %>%
filter(year==1957)%>%
summarize(medianLifeExp=median(lifeExp),maxGdpPercap=max(gdpPercap))
```
## Group_by 
Used to group one or more variable 
```
~ Find median life expectancy and maximum GDP per capita in each year
gapminder %>%
group_by(year)%>%
summarize(medianLifeExp=median(lifeExp),maxGdpPercap=max(gdpPercap))
~ Find median life expectancy and maximum GDP per capita in each continent in 1957
gapminder %>%
filter(year==1957)%>%
group_by(continent)%>%
summarize(medianLifeExp=median(lifeExp),maxGdpPercap=max(gdpPercap))
~ Find median life expectancy and maximum GDP per capita in each continent/year combination
gapminder %>%
  group_by(year,continent)%>%
  summarize(medianLifeExp=median(lifeExp),maxGdpPercap=max(gdpPercap))
```
## Visualizing summarized data
Note: graphs don't usually start at zero, we add + expant_limit(y=0) or x=0 after geom_point() to better make meaning of our visuals
```
by_year <- gapminder %>%
  group_by(year) %>%
  summarize(medianLifeExp = median(lifeExp),
            maxGdpPercap = max(gdpPercap))
~ Create a scatter plot showing the change in medianLifeExp over time
ggplot(by_year,aes(x=year,y=medianLifeExp))+
geom_point()+
expand_limits(y=0)
~ Plot the change in medianGdpPercap in each continent over time
ggplot(by_year_continent,aes(y=medianGdpPercap,x=year,color=continent))+
geom_point()+
 facet_wrap(~continent)+
expand_limits(y = 0)

~ Summarize the median GDP and median life expectancy per continent in 2007
by_continent_2007 <- gapminder%>%
filter(year==2007)%>%
group_by(continent)%>%
summarize(medianLifeExp=median(lifeExp),
medianGdpPercap=median(gdpPercap))
~Use a scatter plot to compare the median GDP and median life expectancy
ggplot(by_continent_2007,aes(x=medianGdpPercap,
y=medianLifeExp,color=continent))+
geom_point()
```
# Types of visualizations
## Line plot
Line plots, which are useful for showing change over time.
```
~ Summarize the median gdpPercap by year, then save it as by_year
by_year <- gapminder %>%
  group_by(year)%>%
  summarize(medianGdpPercap=median(gdpPercap))
~ Create a line plot showing the change in medianGdpPercap over time
ggplot(by_year,aes(y=medianGdpPercap,x=year))+
geom_line()+
expand_limits(y = 0)

~ Summarize the median gdpPercap by year & continent, save as by_year_continent
by_year_continent <- gapminder %>%
  group_by(year,continent)%>%
  summarize(medianGdpPercap=median(gdpPercap))
~ Create a line plot showing the change in medianGdpPercap by continent over time
ggplot(by_year_continent,aes(y=medianGdpPercap,x=year,color=continent))+
geom_line()+
expand_limits(y = 0)
```
## Bar Plot
Bar plots, which are good at comparing statistics for each of several categories.<br>
for aes x is the categorical variable why y determines the height of the bar <br>
Bar plot always starts at zero 
```
~ Summarize the median gdpPercap by continent in 1952
by_continent <- gapminder %>%
filter(year==1952)%>%
  group_by(continent)%>%
  summarize(medianGdpPercap=median(gdpPercap))
~ Create a bar plot showing medianGdp by continent
ggplot(by_continent,aes(x=continent,y=medianGdpPercap))+
geom_col()

~ Filter for observations in the Oceania continent in 1952
oceania_1952 <- gapminder %>%
  filter(continent=="Oceania",year==1952)
~ Create a bar plot of gdpPercap by country
ggplot(oceania_1952,aes(x=country,y=gdpPercap))+
  geom_col()
```
## Histogram 
Histograms, which describe the distribution of a one-dimensional numeric variable.
- It has only one aesthetic: the x-axis, the variable whose distribution you are examining
- Width is chosen automatically and has a large effect on how the histogram communicates the distribution by editing the geom_point(bins=)
```
gapminder_1952 <- gapminder %>%
  filter(year == 1952) %>%
  mutate(pop_by_mil = pop / 1000000)
~ Create a histogram of population (pop_by_mil)
ggplot(gapminder_1952,aes(x=pop_by_mil))+
geom_histogram(bins=50)

~ Create a histogram of population (pop), with x on a log scale
ggplot(gapminder_1952,aes(x=pop))+
geom_histogram()+
scale_x_log10()
```
## Box Plot 
Box plots, which compare the distribution of a numeric variable among several categories.
- it has two aesthetics- x is the category, and y is the values that we're comparing
- The top and bottom of each box represent the 75th percentile and the 25th percentile of that group, meaning half of the distribution lies within that box.
- The lines going up and down from the box, called "whiskers"\
```
gapminder_1952 <- gapminder %>%
  filter(year == 1952)
~ Create a boxplot comparing gdpPercap among continents
ggplot(gapminder_1952,aes(x=continent,y=gdpPercap))+
geom_boxplot()+
scale_y_log10()

~ Add a title to this graph: "Comparing GDP per capita across continents"
ggplot(gapminder_1952, aes(x = continent, y = gdpPercap)) +
  geom_boxplot() +
  scale_y_log10()+
  ggtitle("Comparing GDP per capita across continents")
```
