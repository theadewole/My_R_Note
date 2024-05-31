#Checking for the element of the vector that has "a"
text <- c("apple", "banana", "cherry", "date")
pattern <- "a"

result <- grepl(pattern, text)
print(result)

# applying  case insensivity
text <- c("Apple", "banana", "Cherry", "Date")
pattern <- "a"

result <- grepl(pattern, text, ignore.case = TRUE)
print(result)

#Filtering Data Frame Rows 
data <- data.frame(
  fruit = c("apple", "banana", "cherry", "date"),
  quantity = c(10, 20, 30, 40)
)

    #Filter rows where the fruit name contains the letter "a"
filtered_data <- data[grepl("a", data$fruit), ]
print(filtered_data)

# Using Fixed Pattern
text <- c("a.b", "a*b", "a?b")
pattern <- "a.b"

result <- grepl(pattern, text, fixed = TRUE)
print(result)

#Combining with Other Functions
  # Check if any elements contain the pattern
any_match <- any(grepl("a", text))
print(any_match)

  # Count how many elements contain the pattern
count_match <- sum(grepl("a", text))
print(count_match)


df <- data.frame(
  name = c("Alice", "Bob", "Charlie", "David"),
  city = c("New York", "Los Angeles", "Chicago", "Houston"))

# Filter rows where the city name contains the letter "o"
filtered_df <- df[grepl("o", df$city), ]
print(filtered_df)

