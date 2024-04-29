# Summary Statistics 
[chapter1.pdf](https://github.com/theadewole/My_R_Note/files/14434412/chapter1.pdf)

## Measures of center
- Create two data frames: one that holds the rows of food_consumption for "Belgium" and the another that holds rows for "USA". Call these belgium_consumption and usa_consumption.
- Calculate the mean and median of kilograms of food consumed per person per year for both countries.
```
# Filter for Belgium
belgium_consumption <- food_consumption %>%
  filter(country=="Belgium")

# Filter for USA
usa_consumption <- food_consumption %>%
filter(country=="USA")

# Calculate mean and median consumption in Belgium
mean(belgium_consumption$consumption)
median(belgium_consumption$consumption)

# Calculate mean and median consumption in USA
mean(usa_consumption$consumption)
median(usa_consumption$consumption)
```

- Filter food_consumption to get the rows where food_category is "rice".
- Create a histogram using ggplot2 of co2_emission for rice.
```
food_consumption %>%
  # Filter for rice food category
  filter(food_category=="rice") %>%
  # Create histogram of co2_emission
  ggplot(aes(x = co2_emission)) +
    geom_histogram()
```
- Filter food_consumption to get the rows where food_category is "rice".
- Create a histogram using ggplot2 of co2_emission for rice.
```
food_consumption %>%
  # Filter for rice food category
  filter(food_category=="rice") %>%
  # Create histogram of co2_emission
  ggplot(aes(x = co2_emission)) +
    geom_histogram()
```
## Measures of center

****Quartiles, quantiles, and quintiles****
- Calculate the quartiles of the co2_emission column of food_consumption.
```
# Calculate the quartiles of co2_emission
quantile(food_consumption$co2_emission)
```
****Variance and standard deviation****
- Calculate the variance and standard deviation of co2_emission for each food_category by grouping by and summarizing variance as var_co2 and standard deviation as sd_co2.
- Create a histogram of co2_emission for each food_category using facet_wrap().
```
# Calculate variance and sd of co2_emission for each food_category
food_consumption %>% 
  group_by(food_category) %>% 
  summarize(var_co2 = var(co2_emission),
           sd_co2 = sd(co2_emission))

# Create subgraphs for each food_category: histogram of co2_emission
ggplot(food_consumption, aes(co2_emission)) +
  # Create a histogram
  geom_histogram() +
  # Create a separate sub-graph for each food_category
  facet_wrap(~ food_category)
```
****Finding outliers using IQR****
- Calculate the total co2_emission per country by grouping by country and taking the sum of co2_emission. Call the sum total_emission and store the resulting data frame as emissions_by_country.
```
# Calculate total co2_emission per country: emissions_by_country
emissions_by_country <- food_consumption %>%
  group_by(country) %>%
  summarise(total_emission = sum(co2_emission))

emissions_by_country
```
# Random Numbers and Probability
[chapter2.pdf](https://github.com/theadewole/My_R_Note/files/14434528/chapter2.pdf)  <br>
****Calculating probabilities****
- Count the number of deals Amir worked on for each product type.
```
# Count the deals for each product
amir_deals %>%
count(product)
```
****Sampling deals****
- Set the random seed to 31.
- Take a sample of 5 deals without replacement.
```
# Set random seed to 31
set.seed(31)
# Sample 5 deals without replacement
amir_deals %>%
sample_n(5)
```
## Discrete distributions
****Creating a probability distribution****
- Create a histogram of the group_size column of restaurant_groups, setting the number of bins to 5.
```
# Create a histogram of group_size
ggplot(restaurant_groups,aes(group_size)) +
 geom_histogram(bins=5)
```
- Count the number of each group_size in restaurant_groups, then add a column called probability that contains the probability of randomly selecting a group of each size. Store this in a new data frame called size_distribution.
```
# Create probability distribution
size_distribution <- restaurant_groups %>%
  # Count number of each group size
 count(group_size) %>%
  # Calculate probability
  mutate(probability = n/ sum(n))

size_distribution
```
- Calculate the expected value of the size_distribution, which represents the expected group size.
```
# Create probability distribution
size_distribution <- restaurant_groups %>%
  count(group_size) %>%
  mutate(probability = n / sum(n))

# Calculate expected group size
expected_val <- sum(size_distribution$group_size *
                    size_distribution$probability)
expected_val
```
- Calculate the probability of randomly picking a group of 4 or more people by filtering and summarizing.
```
# Create probability distribution
size_distribution <- restaurant_groups %>%
  count(group_size) %>%
  mutate(probability = n / sum(n))

# Calculate probability of picking group of 4 or more
size_distribution %>%
  # Filter for groups of 4 or larger
 filter(group_size>=4) %>%
  # Calculate prob_4_or_more by taking sum of probabilities
  summarise(prob_4_or_more = sum(probability))
```
# More Distributions and the Central Limit Theorem
[chapter3.pdf](https://github.com/theadewole/My_R_Note/files/14435703/chapter3.pdf) <br>
## Continuous distributions
- To model how long Amir will wait for a back-up using a continuous uniform distribution, save his lowest possible wait time as min and his longest possible wait time as max. Remember that back-ups happen every 30 minutes.
```
# Min and max wait times for back-up that happens every 30 min
min <- 0
max <- 30
```
- Calculate the probability that Amir has to wait less than 5 minutes, and store in a variable called prob_less_than_5.
```
# Min and max wait times for back-up that happens every 30 min
min <- 0
max <- 30

# Calculate probability of waiting less than 5 mins
prob_less_than_5 <- punif(5,min,max)
prob_less_than_5
```
- Calculate the probability that Amir has to wait more than 5 minutes, and store in a variable called prob_greater_than_5.
```
# Min and max wait times for back-up that happens every 30 min
min <- 0
max <- 30

# Calculate probability of waiting more than 5 mins
prob_greater_than_5 <- punif(5,min,max,lower.tail=F)
prob_greater_than_5
```
- Calculate the probability that Amir has to wait between 10 and 20 minutes, and store in a variable called prob_between_10_and_20.
```
# Min and max wait times for back-up that happens every 30 min
min <- 0
max <- 30

# Calculate probability of waiting 10-20 mins
prob_between_10_and_20 <- punif(10,min,max,lower.tail=T)
prob_between_10_and_20
```
****Simulating wait times****
- Set the random seed to 334.
```
# Set random seed to 334
set.seed(334)
```
- Generate 1000 wait times from the continuous uniform distribution that models Amir's wait time. Add this as a new column called time in the wait_times data frame.
```
# Set random seed to 334
set.seed(334)

# Generate 1000 wait times between 0 and 30 mins, save in time column
wait_times %>%
  mutate(time = runif(1000,0,30))
```
- Create a histogram of the simulated wait times with 30 bins.
```
# Set random seed to 334
set.seed(334)

# Generate 1000 wait times between 0 and 30 mins, save in time column
wait_times %>%
  mutate(time = runif(1000, min = 0, max = 30)) %>%
  # Create a histogram of simulated times
  ggplot(aes(x=time))+
  geom_histogram()
```
## The binomial distribution
- Set the random seed to 10 and simulate a single deal.
```
# Set random seed to 10
set.seed(10)

# Simulate a single deal
rbinom(1,1,0.3)
```
- Simulate a typical week of Amir's deals, or one week of 3 deals.
```
# Set random seed to 10
set.seed(10)

# Simulate 1 week of 3 deals
rbinom(1,3,0.3)
```
- Simulate a year's worth of Amir's deals, or 52 weeks of 3 deals each, and store in deals. <br>
Calculate the mean number of deals he won per week.
```
# Set random seed to 10
set.seed(10)

# Simulate 52 weeks of 3 deals
deals <- rbinom(52,3,0.3)

# Calculate mean deals won per week
mean(deals)
```
- What's the probability that Amir closes all 3 deals in a week?
```
# Probability of closing 3 out of 3 deals
dbinom(3,3,0.3)
```
- What's the probability that Amir closes 1 or fewer deals in a week?
```
# Probability of closing <= 1 deal out of 3 deals
pbinom(1,3,0.3)
```
- What's the probability that Amir closes more than 1 deal?
```
# Probability of closing > 1 deal out of 3 deals
pbinom(1,3,0.3,lower.tail=F)
```
- Calculate the expected number of sales out of the 3 he works on that Amir will win each week if he maintains his 30% win rate.
- Calculate the expected number of sales out of the 3 he works on that he'll win if his win rate drops to 25%.
- Calculate the expected number of sales out of the 3 he works on that he'll win if his win rate rises to 35%.
```
# Expected number won with 30% win rate
won_30pct <- 3 * 0.3
won_30pct

# Expected number won with 25% win rate
won_25pct <- 3*0.25
won_25pct

# Expected number won with 35% win rate
won_35pct <- 3*0.35
won_35pct
```
# Correlation and Experimental Design

[chapter 4.pdf](https://github.com/theadewole/My_R_Note/files/14445160/chapter.4.pdf) <br>
- Using log transformation and other (square root etc) to attain better correlation between two variables when the distribution is skewed
- Correlation does not imply causation. This means that if x and y are correlated, x doesn't necessarily cause y.
A phenomenon called confounding can lead to spurious correlations (when a correlation between x and y does not lead to causation). A cofounding is a hidden variable. <br>
A correlation result shows that coffee causes cancer however there is a cofounding at play called smoking
