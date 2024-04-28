### Construct a matrix with 3 rows that contain the numbers 1 up to 9
Matrix is a collection of elements of the same data type (numeric, character, or logical) arranged into a fixed number of rows and columns. Since you are only working with rows and columns, a matrix is called two-dimensional.
```
matrix (1:9,byrow=T,nrow=3)
```
### Analyze matrices

```
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

- box_office <- c(new_hope,empire_strikes,return_jedi)
star_wars_matrix <- matrix(box_office,byrow=T,nrow=3)

- Combining both step as one
star_wars_matrix <- matrix(c(new_hope, empire_strikes, return_jedi),
nrow = 3, byrow = TRUE)
```
### Naming a matrix

```
Vectors region and titles, used for naming
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")

-Name the columns with region
colnames(star_wars_matrix) <- region

-Name the rows with titles
rownames(star_wars_matrix) <- titles

- The whole can by written once as
star_wars_matrix <- matrix(box_office, 
                      nrow = 3, byrow = TRUE,
                      dimnames = list(titles, region))

-Print out star_wars_matrix
print(star_wars_matrix)

```
### rowSums () Function
In R, the function rowSums() conveniently calculates the totals for each row of a matrix
```
worldwide_vector <- rowSums(star_wars_matrix)
```
### cbind () Function
You can add a column or multiple columns to a matrix with the cbind() function, which merges matrices and/or vectors together by column. For example:
--- big_matrix <- cbind(matrix1, matrix2, vector1 ...)
```
-Bind the new variable worldwide_vector as a column to star_wars_matrix
all_wars_matrix <- cbind(star_wars_matrix,worldwide_vector)
```
### rbind () Function
You can add a row or multiple rows to a matrix with the rbind() function, which merges matrices and/or vectors by column. For example:
--- big_matrix <- rbind(matrix1, matrix2, vector1 ...)
```
- Combine both Star Wars trilogies in one matrix
all_wars_matrix <- rbind(star_wars_matrix,star_wars_matrix2)
```
### Selecting matrix element
Similar to vectors, you can use the square brackets [ ] to select one or multiple elements from a matrix. Whereas vectors have one dimension, matrices have two dimensions. You should therefore use a comma to separate the rows you want to select from the columns. For example:
- my_matrix[1,2] selects the element at the first row and second column.
- my_matrix[1:3,2:4] results in a matrix with the data on the rows 1, 2, 3 and columns 2, 3, 4.
##### If you want to select all elements of a row or a column, no number is needed before or after the comma, respectively:
- my_matrix[,1] selects all elements of the first column.
- my_matrix[1,] selects all elements of the first row.
```
- all_wars_matrix is available in your workspace
all_wars_matrix

- Select the non-US revenue for all movies
non_us_all <- c(all_wars_matrix[,2])
non_us_all

- Average non-US revenue
mean(non_us_all)
  
- Select the non-US revenue for first two movies
non_us_some <- c(all_wars_matrix[1:2,2])
non_us_some
  
- Average non-US revenue for first two movies
mean(non_us_some)
```

# Arimthmetic with matrices 
Similar to what you have learned with vectors, the standard operators like +, -, /, *, etc. work in an element-wise way on matrices in R.
- For example, 2 * my_matrix multiplies each element of my_matrix by two.
```
- all_wars_matrix is available in your workspace
all_wars_matrix

- Estimate the visitors
visitors <- all_wars_matrix/5

all_wars_matrix and ticket_prices_matrix are available in your workspace
all_wars_matrix
ticket_prices_matrix

- Estimated number of visitors
visitors <- all_wars_matrix/ticket_prices_matrix

- US visitors
us_visitors <- c(visitors[,1])

- Average number of US visitors
mean(us_visitors)
```

