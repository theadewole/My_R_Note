#transform() is a base R function used to add new variables or modify existing variables in a data frame
# Create a sample data frame
data <- data.frame(
  x = c(1, 2, 3, 4, 5),
  y = c(6, 7, 8, 9, 10)
)

# Add a new variable z, which is the sum of variables x and y
data <- transform(data, z = x + y)

#Using within dplyr
library(dplyr)

data <- data %>%
  transform(z = x + y)

