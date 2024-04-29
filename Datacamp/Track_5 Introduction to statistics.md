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
****Calculating binomial probabilities**** <br>
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

# More Distributions and the Central Limit Theorem
[chapter3.pdf](https://github.com/theadewole/My_R_Note/files/14435703/chapter3.pdf) <br>
## The normal distribution
- Create a histogram with 10 bins to visualize the distribution of the amount.
```
# Histogram of amount with 10 bins
ggplot(amir_deals,aes(x=amount))+
geom_histogram(bins=10)
```
****Probabilities from the normal distribution**** <br>
- What's the probability of Amir closing a deal worth less than $7500?
```
# Probability of deal < 7500
pnorm(7500, mean = 5000, sd = 2000)
```
- What's the probability of Amir closing a deal worth more than $1000?
```
# Probability of deal > 1000
pnorm(1000,mean=5000,sd=2000,lower.tail=F)
```
- What's the probability of Amir closing a deal worth between $3000 and $7000?
```
# Probability of deal between 3000 and 7000
pnorm(7000,5000,2000)-pnorm(3000,5000,2000)
```
- What amount will 75% of Amir's sales be more than?
```
# Calculate amount that 75% of deals will be more than
qnorm(0.75, mean = 5000, sd = 2000, lower.tail = FALSE)
```
- Currently, Amir's average sale amount is $5000. Calculate what his new average amount will be if it increases by 20% and store this in new_mean.
- Amir's current standard deviation is $2000. Calculate what his new standard deviation will be if it increases by 30% and store this in new_sd.
- Add a new column called amount to the data frame new_sales, which contains 36 simulated amounts from a normal distribution with a mean of new_mean and a standard deviation of new_sd.
- Plot the distribution of the new_sales amounts using a histogram with 10 bins.
```
# Calculate new average amount
new_mean <- 5000*1.2

# Calculate new standard deviation
new_sd <- 2000*1.3

# Simulate 36 sales
new_sales <- new_sales %>% 
  mutate(amount = rnorm(36,mean=new_mean,sd=new_sd))

# Create histogram with 10 bins
ggplot(new_sales,aes(x=amount))+
geom_histogram(bins=10)
```
## The central limit theorem
- Create a histogram of the num_users column of amir_deals. Use 10 bins.
```
# Create a histogram of num_users
ggplot(amir_deals,aes(x=num_users))+
geom_histogram(bins=10)
```
- Set the seed to 104.
- Take a sample of size 20 with replacement from the num_users column of amir_deals, and take the mean.
```
# Set seed to 104
set.seed(104)

# Sample 20 num_users with replacement from amir_deals
sample(amir_deals$num_users, 20,replace=T) %>%
  # Take mean
  mean()
```
- Repeat this 100 times and store as sample_means. This will take 100 different samples and calculate the mean of each.
```
# Set seed to 104
set.seed(104)

# Sample 20 num_users from amir_deals and take mean
sample(amir_deals$num_users, size = 20, replace = TRUE) %>%
  mean()

# Repeat the above 100 times
sample_means <- replicate(100, sample(amir_deals$num_users, size = 20, replace = TRUE) %>% mean())
```
- A data frame called samples has been created for you with a column mean, which contains the values from sample_means. Create a histogram of the mean column with 10 bins.
```
# Set seed to 104
set.seed(104)

# Sample 20 num_users from amir_deals and take mean
sample(amir_deals$num_users, size = 20, replace = TRUE) %>%
  mean()

# Repeat the above 100 times
sample_means <- replicate(100, sample(amir_deals$num_users, size = 20, replace = TRUE) %>% mean())

# Create data frame for plotting
samples <- data.frame(mean = sample_means)

# Histogram of sample means
ggplot(samples,aes(mean)) +
  geom_histogram(bins=10)
```
****The mean of means**** <br>
- Set the random seed to 321.
- Take 30 samples of size 20 from all_deals$num_users and take the mean of each sample. Store the sample means in sample_means.
- Take the mean of sample_means.
- Take the mean of the num_users column of amir_deals.
```
# Set seed to 321
set.seed(321)

# Take 30 samples of 20 values of num_users, take mean of each sample
sample_means <- replicate(30, sample(all_deals$num_users, 20) %>% mean())

# Calculate mean of sample_means
mean(sample_means)

# Calculate mean of num_users in amir_deals
mean(amir_deals$num_users)
```
## The Poisson distribution
- What's the probability that Amir responds to 5 leads in a day, given that he responds to an average of 4?
```
# Probability of 5 responses
dpois(5,4)
```
- Amir's coworker responds to an average of 5.5 leads per day. What is the probability that she answers 5 leads in a day?
```
# Probability of 5 responses from coworker
dpois(5,5.5)
```
- What's the probability that Amir responds to 2 or fewer leads in a day?
```
# Probability of 2 or fewer responses
ppois(2,4,lower.tail=T)
```
- What's the probability that Amir responds to more than 10 leads in a day?
```
# Probability of > 10 responses
ppois(10,4,lower.tail=F)
```
- What's the probability it takes Amir less than an hour to respond to a lead?
```
# Probability response takes < 1 hour
pexp(1, rate = 1/2.5)
```
- What's the probability it takes Amir more than 4 hours to respond to a lead?
```
# Probability response takes > 4 hours
pexp(4,rate=1/2.5,lower.tail=F)
```
- What's the probability it takes Amir 3-4 hours to respond to a lead?
```
# Probability response takes 3-4 hours
pexp(4,rate=1/2.5)-pexp(3,rate=1/2.5)
```
# Correlation and Experimental Design
[chapter 4.pdf](https://github.com/theadewole/My_R_Note/files/14445160/chapter.4.pdf) <br>
##   Correlation
- Using log transformation and other (square root etc) to attain better correlation between two variables when the distribution is skewed
- Correlation does not imply causation. This means that if x and y are correlated, x doesn't necessarily cause y.
A phenomenon called confounding can lead to spurious correlations (when a correlation between x and y does not lead to causation). A cofounding is a hidden variable. <br>
A correlation result shows that coffee causes cancer however there is a cofounding at play called smoking
****Relationships between variables**** <br>
- Create a scatterplot of happiness_score vs. life_exp using ggplot2
```
# Create a scatterplot of happiness_score vs. life_exp
ggplot(world_happiness,aes(y=happiness_score,x=life_exp))+
geom_point()
```
- Add a linear trendline to the scatterplot, setting se to FALSE.
```
# Add a linear trendline to scatterplot
ggplot(world_happiness, aes(life_exp, happiness_score)) +
  geom_point() +
  geom_smooth(method="lm",se=F)
```
- Calculate the correlation between life_exp and happiness_score.
```
# Add a linear trendline to scatterplot
ggplot(world_happiness, aes(life_exp, happiness_score)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

# Correlation between life_exp and happiness_score
cor(world_happiness$life_exp,world_happiness$happiness_score)
```
****Correlation caveats**** <br>
****What can't correlation measure?**** <br>
- Create a scatterplot showing the relationship between gdp_per_cap (on the x-axis) and life_exp (on the y-axis).
```
# Scatterplot of gdp_per_cap and life_exp
ggplot(world_happiness,aes(x=gdp_per_cap,y=life_exp))+
geom_point()
```
- Calculate the correlation between gdp_per_cap and life_exp.
```
# Scatterplot of gdp_per_cap and life_exp
ggplot(world_happiness, aes(gdp_per_cap, life_exp)) +
  geom_point()

# Correlation between gdp_per_cap and life_exp
cor(world_happiness$gdp_per_cap,world_happiness$life_exp)
```
****Transforming variables**** <br>
- Create a scatterplot of happiness_score versus gdp_per_cap.
- Calculate the correlation between happiness_score and gdp_per_cap.
```
# Scatterplot of happiness_score vs. gdp_per_cap
ggplot(world_happiness, aes(x=gdp_per_cap, y=happiness_score)) +
  geom_point()

# Calculate correlation
cor(world_happiness$gdp_per_cap,world_happiness$happiness_score)
```
- Add a new column to world_happiness called log_gdp_per_cap that contains the log of gdp_per_cap.
- Create a scatterplot of happiness_score versus log_gdp_per_cap.
- Calculate the correlation between happiness_score and log_gdp_per_cap.
```
# Create log_gdp_per_cap column
world_happiness <- world_happiness %>%
  mutate(log_gdp_per_cap = log(gdp_per_cap))

# Scatterplot of happiness_score vs. log_gdp_per_cap
ggplot(world_happiness, aes(log_gdp_per_cap, happiness_score)) +
  geom_point()

# Calculate correlation
cor(world_happiness$log_gdp_per_cap, world_happiness$happiness_score)
```
- Create a scatterplot showing the relationship between grams_sugar_per_day (on the x-axis) and happiness_score (on the y-axis).
- Calculate the correlation between grams_sugar_per_day and happiness_score.
```
# Scatterplot of grams_sugar_per_day and happiness_score
ggplot(world_happiness,aes(grams_sugar_per_day,happiness_score))+
geom_point()

# Correlation between grams_sugar_per_day and happiness_score
cor(world_happiness$grams_sugar_per_day,world_happiness$happiness_score)
```
## Design of experiments
- **Vocabulary**
Experiments generally aim to answer a question in the form, "What is the effect of the treatment on the response?" In this setting, treatment refers to the explanatory or independent variable, and response refers to the response or dependent variable. For example, what is the effect of an advertisement on the number of products purchased? In this case, the treatment is an advertisement, and the response is the number of products purchased.
- **Controlled experiments**
In a controlled experiment, participants are randomly assigned to either the treatment group or the control group, where the treatment group receives the treatment and the control group does not. In our example, the treatment group will see an advertisement, and the control group will not. Other than this difference, the groups should be comparable so that we can determine if seeing an advertisement causes people to buy more. If the groups aren't comparable, this could lead to confounding, or bias. If the average age of participants in the treatment group is 25 and the average age of participants in the control group is 50, age could be a potential confounder if younger people are more likely to purchase more, and this will make the experiment biased towards the treatment.
- **Observational studies**
The other kind of study we'll discuss is the observational study. In an observational study, participants are not randomly assigned to groups. Instead, participants assign themselves, usually based on pre-existing characteristics. This is useful for answering questions that aren't conducive to a controlled experiment. If you want to study the effect of smoking on cancer, you can't force people to start smoking. Similarly, if you want to study how past purchasing behavior affects whether someone will buy a product, you can't force people to have certain past purchasing behavior. Because assignment isn't random, there's no way to guarantee that the groups will be comparable in every aspect, so observational studies can't establish causation, only association. The effects of the treatment may be confounded by factors that got certain people into the control group and certain people into the treatment group. However, there are ways to control for confounders, which can help strengthen the reliability of conclusions about association.
- **Longitudinal vs. cross-sectional studies**
The final important distinction to make is between longitudinal and cross-sectional studies. In a longitudinal study, the same participants are followed over a period of time to examine the effect of treatment on the response. In a cross-sectional study, data is collected from a single snapshot in time. If you wanted to investigate the effect of age on height, a cross-sectional study would measure the heights of people of different ages and compare them. However, the results will be confounded by birth year and lifestyle since it's possible that each generation is getting taller. In a longitudinal study,the same people would have their heights recorded at different points in their lives, so the confounding is eliminated. It's important to note that longitudinal studies are more expensive, and take longer to perform, while cross-sectional studies are cheaper, faster, and more convenient.
