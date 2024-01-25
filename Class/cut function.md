The cut() function in R can be used to cut a range of values into bins and specify labels for each bin. <br>
            ```cut(x, breaks, labels = NULL, …)``` <br>
- x: Name of vector
- breaks: Number of breaks to make or vector of break points
- labels: Labels for the resulting bins
## Cut Vector Based on Number of Breaks
cut() function to create a new column called category that cuts the points column into bins of four equal sizes.
```
df <- data.frame(player=c('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'),
                 points=c(4, 7, 8, 12, 14, 16, 20, 26, 36))

~ Cut Vector Based on Number of Breaks
df$category <- cut(df$points, breaks=4)
```
*When breaks is specified as a single number, the range of the data is divided into breaks pieces of equal length, and 
then the outer limits are moved away by 0.1% of the range to ensure that the extreme values both fall within the 
break intervals.*

## Cut Vector Based on Specific Break Points
The following code shows how to use the cut() function to create a new column called category that cuts the points column based on a vector of specific break points
```
df$category <- cut(df$points, breaks=c(0, 10, 15, 20, 40))
```
## Cut Vector Using Specific Break Points and Labels
The following code shows how to use the cut() function to create a new column called category that cuts the points column based on a vector of specific break points with custom labels
```
df$category <- cut(df$points,
                   breaks=c(0, 10, 15, 20, 40),
                   labels=c('Bad', 'OK', 'Good', 'Great'))
```
## with include.lowest
The include.lowest parameter is used in the context of binning or creating intervals in R, specifically in functions like cut() or hist(). 
It is a logical argument that determines whether the lower bound of the intervals should be inclusive or exclusive.
- When include.lowest = TRUE, it means that the intervals include the lowest value of the data. In other words, if an interval is specified as [a, b), the interval includes a.
- When include.lowest = FALSE, it means that the intervals are exclusive on the lower end. Using the same example, if an interval is specified as (a, b), the interval does not include a.

```
data <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
~ Cut the data into intervals
intervals <- cut(data, breaks = c(1, 5, 10), include.lowest = TRUE)
~ Display the result
print(intervals)
```
