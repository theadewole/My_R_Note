The with() and within() functions in R can be used to evaluate some expression based on a data frame.
<br>
```with(data, expression)```
<br>
```within(data, expression)``` <br>
- data: The name of the data frame
- expression: The expression to evaluate <br>
Here’s the difference between the two functions:
*with() evaluates the expression without modifying the original data frame.*
*within() evaluates the expression and creates a copy of the original data frame*
## Use with() Function
We can use the following with()function to multiply the values between the two columns in the data frame
```
df <- data.frame(x=c(3, 5, 5, 7, 6, 10),
                 y=c(2, 2, 0, 5, 9, 4))
with(df, x*y)
```
## Use within() Function
We can use the following within() function to multiply the values between the two columns 
in the data frame and assign the results to a new column in the data frame
```
within(df, z <- x*y)
~ multiply values in x and y and assign results to new data frame
df_new <- within(df, z <- x*y)
```
The results of the multiplication are now stored in a new column named z
