# Load the reshape2 package
library(reshape2)

# Create a sample data frame in wide format
wide_data <- data.frame(
  ID = c(1, 2, 3),
  Age = c(25, 30, 35),
  Sex = c("Male", "Female", "Male")
)

# Print the wide format data
print(wide_data)

# Reshape the data from wide to long format using melt()
long_data <- melt(wide_data, id.vars = "ID")

# Print the long format data
print(long_data)
