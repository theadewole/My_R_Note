################################################################################
#table ()
################################################################################
# Example data
gender <- c("Male", "Female", "Male", "Male", "Female", "Female", "Male", "Female")
education <- c("High School", "College", "College", "High School", 
               "College", "High School", "College", "High School")

# Create a data frame
data <- data.frame(Gender = gender, Education = education)

# Create a cross-tabulation using table()
cross_table <- table(data$Gender, data$Education)

# Print the result
print(cross_table)

################################################################################
#xtab ()
################################################################################
# Example data
gender <- c("Male", "Female", "Male", "Male", "Female", "Female", "Male", "Female")
education <- c("High School", "College", "College", "High School",
               "College", "High School", "College", "High School")

# Create a data frame
data <- data.frame(Gender = gender, Education = education)

# Create a cross-tabulation using xtabs()
cross_table <- xtabs(~ Gender + Education, data = data)

# Print the result
print(cross_table)
