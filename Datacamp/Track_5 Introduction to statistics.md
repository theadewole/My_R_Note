# Summary Statistics 
[chapter1.pdf](https://github.com/theadewole/My_R_Note/files/14434412/chapter1.pdf)
```
- Create two data frames: one that holds the rows of food_consumption for "Belgium" and the another that holds rows for "USA". Call these belgium_consumption and usa_consumption.
- Calculate the mean and median of kilograms of food consumed per person per year for both countries.

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

- Filter food_consumption to get the rows where food_category is "rice".
- Create a histogram using ggplot2 of co2_emission for rice.

food_consumption %>%
  # Filter for rice food category
  filter(food_category=="rice") %>%
  # Create histogram of co2_emission
  ggplot(aes(x = co2_emission)) +
    geom_histogram()
```

# Random Numbers and Probability
[chapter2.pdf](https://github.com/theadewole/My_R_Note/files/14434528/chapter2.pdf)

# More Distributions and the Central Limit Theorem
[chapter3.pdf](https://github.com/theadewole/My_R_Note/files/14435703/chapter3.pdf)

# Correlation and Experimental Design

[chapter 4.pdf](https://github.com/theadewole/My_R_Note/files/14445160/chapter.4.pdf) <br>
- Using log transformation and other (square root etc) to attain better correlation between two variables when the distribution is skewed
- Correlation does not imply causation. This means that if x and y are correlated, x doesn't necessarily cause y.
A phenomenon called confounding can lead to spurious correlations (when a correlation between x and y does not lead to causation). A cofounding is a hidden variable. <br>
A correlation result shows that coffee causes cancer however there is a cofounding at play called smoking
