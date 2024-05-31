# grepl
 Used for pattern matching. 
 It searches for patterns within text and returns a logical vector indicating whether the pattern was found. 
 It's part of the base package and is commonly used for tasks such as filtering or subsetting data based on string patterns. <br>
 **Usage** <br>
 ``` grepl(pattern, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)``` <br>
- pattern: The regular expression pattern to search for.
- x: A character vector where the search is performed.
- ignore.case: If TRUE, the pattern matching is case-insensitive.
- perl: If TRUE, uses Perl-compatible regex.
- fixed: If TRUE, the pattern is a fixed string and not a regular expression.
- useBytes: If TRUE, the matching is done byte-by-byte rather than character-by-character.
```
- Checking for the element of the vector that has "a"
text <- c("apple", "banana", "cherry", "date")
pattern <- "a"

result <- grepl(pattern, text)
```
 ## Case-Insensitive Search
```
text <- c("Apple", "banana", "Cherry", "Date")
pattern <- "a"

result <- grepl(pattern, text, ignore.case = TRUE)
print(result)
```

## Filtering Data Frame Rows 
```
data <- data.frame(
  fruit = c("apple", "banana", "cherry", "date"),
  quantity = c(10, 20, 30, 40))

-  Filter rows where the fruit name contains the letter "a"
filtered_data <- data[grepl("a", data$fruit), ]
print(filtered_data)
```
## Using Fixed Pattern
```
text <- c("a.b", "a*b", "a?b")
pattern <- "a.b"

result <- grepl(pattern, text, fixed = TRUE)
print(result)
```
## Combining with Other Functions
```
- Check if any elements contain the pattern
any_match <- any(grepl("a", text))
print(any_match)

- Count how many elements contain the pattern
count_match <- sum(grepl("a", text))
print(count_match)
```
```
df <- data.frame(
  name = c("Alice", "Bob", "Charlie", "David"),
  city = c("New York", "Los Angeles", "Chicago", "Houston"))

# Filter rows where the city name contains the letter "o"
filtered_df <- df[grepl("o", df$city), ]
print(filtered_df)
```


``
