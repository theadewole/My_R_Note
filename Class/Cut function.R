df <- data.frame(player=c('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'),
                 points=c(4, 7, 8, 12, 14, 16, 20, 26, 36))

################################################################################
#Cut Vector Based on Number of Breaks
################################################################################
df$category <- cut(df$points, breaks=4)

################################################################################
#Cut Vector Based on Specific Break Points
################################################################################
df$category <- cut(df$points, breaks=c(0, 10, 15, 20, 40))

################################################################################
#Cut Vector Using Specific Break Points and Labels
################################################################################
df$category <- cut(df$points,
                   breaks=c(0, 10, 15, 20, 40),
                   labels=c('Bad', 'OK', 'Good', 'Great'))

################################################################################
#with include.lowest
################################################################################
data <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
# Cut the data into intervals
intervals <- cut(data, breaks = c(1, 5, 10), include.lowest = TRUE)

# Display the result
print(intervals)
