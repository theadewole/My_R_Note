A data frame has the variables of a dataset as columns and the observations as rows <br>
Dataframes can store different types of data, such as numeric, character, and factor variables.
## head () and tail () function 
The function head() enables you to show the first observations of a data frame. 
Similarly, the function tail() prints out the last observations in your dataset.
## str ()
The function str() shows you the structure of your dataset.
## Creating a Data Frame 
You construct a data frame with the data.frame() function. 
As arguments, you pass the vectors from before: they will become the different columns of your data frame. 
Because every column has the same length, the vectors you pass should also have the same length.
But don't forget that it is possible (and likely) that they contain different types of data <br>
```
~ Definition of vectors
name <- c("Mercury", "Venus", "Earth", "Mars",
"Jupiter", "Saturn", "Uranus", "Neptune")
type <- c("Terrestrial planet", "Terrestrial planet",
"Terrestrial planet", "Terrestrial planet", "Gas giant", 
          "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532,
11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03,
0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)
~ Create a data frame from the vectors
planets_df <- data.frame(name,type,diameter,rotation,rings)
planets_df
~ Investing the dataset structure
str(planets_df)
```
## Selection of data frame elements
Similar to vectors and matrices, you select elements from a data frame with the help of square brackets [ ].
By using a comma, you can indicate what to select from the rows and the columns respectively.
- my_df[1,2] selects the value at the first row and second column in my_df.
- my_df[1:3,2:4] selects rows 1, 2, 3 and columns 2, 3, 4 in my_df.
- my_df[1, ] selects all elements of the first row <br>
```
~ Print out diameter of Mercury (row 1, column 3)
planets_df[1,3]
~ Print out data for Mars (entire fourth row)
planets_df[4,]
```
Instead of using numerics to select elements of a data frame, you can also use the variable names to select columns of a data frame.
Suppose you want to select the first three elements of the type column. <br>
```planets_df[1:3,2]```<br>
A possible disadvantage of this approach is that you have to know (or look up) the column number of type, which gets hard if you have a lot of variables. 
It is often easier to just make use of the variable name <br>
```planets_df[1:3,"type"]```
```
~ Select first 5 values of diameter column
planets_df[1:5,"diameter"]
```
You will often want to select an entire column, namely one specific variable from a data frame. 
If you want to select all elements of the variable diameter, for example, both of these will do the trick: <br>
```planets_df[,3]``` <br>
```planets_df[,"diameter"]``` <br>
However, there is a short-cut. If your columns have names, you can use the $ sign:
```planets_df$diameter```  <br>

```
~ Select the rings variable from planets_df
rings_vector <- planets_df$rings 
~ Print out rings_vector
rings_vector
~ Adapt the code to name columns for planets with rings
planets_df[rings_vector,"name" ]
~ Adapt the code to select all columns for planets with rings
planets_df[rings_vector, ]
```
## subset ()
In R, the subset() function is used to create a subset of a data frame based on specified conditions. 
The function extracts rows from a data frame that satisfy certain criteria. <br>
```subset(my_df, subset = some_condition)```
The first argument of subset() specifies the dataset for which you want a subset. 
By adding the second argument, you give R the necessary information and conditions to select the correct subset. <br>
```
~ Select planets with diameter < 1
subset(planets_df,subset=diameter<1)
or
subset(planet_df,diameter<1)
```
## order ()
 Is a function that gives you the ranked position of each element when it is applied on a variable.
 ```
a <- c(100, 10, 1000)
order(a)
~ result
[1] 2 1 3
```
10, which is the second element in a, is the smallest element, so 2 comes first in the output of order(a). 
100, which is the first element in a is the second smallest element, so 1 comes second in the output of order(a).
This means we can use the output of order(a) to reshuffle a:
```
a[order(a)]
~ result
[1]   10  100 1000
```
Applying order () 
```
~ Use order() to create positions
positions <-  order(planets_df$diameter)
~ Use positions to sort planets_df,
this means the sorted diameter column is used to sort the entire dataset
planets_df[positions, ]
```
