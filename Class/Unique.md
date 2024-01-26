# unique ()
is used to extract the unique elements from a vector or data frame. 
It returns a vector, data frame, or array with duplicate values removed <br>
```unique(x, incomparables = FALSE, ...)``` <br>
- x: The object from which to remove duplicate elements. <br>
This is the input object from which you want to extract unique elements. It can be a vector,
data frame, array, or a factor
- incomparables: A logical value indicating whether to treat NaN and NA values as equal (default is FALSE).
- This parameter is used to specify how NaN and NA values should be treated. <br>
If set to FALSE (default), NaN and NA values are treated as distinct and are considered unique. 
If set to TRUE, NaN and NA values are treated as equal and only the first occurrence is considered unique.

- ...: Additional arguments, currently ignored.<br>
## For Vector
```
~ Create a vector with duplicate elements
vector_with_duplicates <- c(1, 2, 2, 3, 4, 4, 5, 6)
~ Use unique() to get unique elements
unique_vector <- unique(vector_with_duplicates)
~ Print the result
print(unique_vector)
```
## For Data Frame
```
~ Create a data frame with duplicate rows
data_frame_with_duplicates <- data.frame(
  ID = c(1, 2, 3, 2, 1),
  Name = c("Alice", "Bob", "Charlie", "Bob", "Alice"))
~ Use unique() on data frame to get unique rows
unique_data_frame <- unique(data_frame_with_duplicates)
~ Print the result
print(unique_data_frame)
```
## For Factors
```
~ Create a factor with duplicate levels
factor_with_duplicates <- factor(c("A", "B", "B", "C", "A"))
~ Use unique() on a factor to get unique levels
unique_factor <- unique(factor_with_duplicates)
~ Print the result
print(unique_factor)
```
## Arrays
```
~ Create a matrix with duplicate elements
matrix_with_duplicates <- matrix(c(1, 2, 2, 3, 4, 4, 5, 6), nrow = 2)
~ Use unique() on a matrix to get unique elements
unique_matrix <- unique(matrix_with_duplicates)
~ Print the result
print(unique_matrix)
```



