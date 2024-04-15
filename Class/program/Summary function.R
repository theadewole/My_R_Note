################################################################################
#Using summary() with Vector
################################################################################
#define vector
x <- c(3, 4, 4, 5, 7, 8, 9, 12, 13, 13, 15, 19, 21)
summary(x)
# with na (missing data)
xna <- c(3, 4, 4, 5, 7, 8, 9, 12, 13, 13, 15, 19, 21, NA, NA)
summary(xna)
################################################################################
#Using summary() with Data Frame
################################################################################
sport <- data.frame(team=c('A', 'B', 'C', 'D', 'E'),
                 points=c(99, 90, 86, 88, 95),
                 assists=c(33, 28, 31, 39, 34),
                 rebounds=c(30, 28, 24, 24, 28))
summary(sport)
#Using summary() with Specific Data Frame Columns
summary(sport[c('points','rebounds')])

################################################################################
#Using summary() with Regression Model
################################################################################
df <- data.frame(y=c(99, 90, 86, 88, 95, 99, 91),
                 x=c(33, 28, 31, 39, 34, 35, 36))

#fit linear regression model
model <- lm(y~x, data=df)

#summarize model fit
summary(model)

#Call:
  lm(formula = y ~ x, data = df)

################################################################################
#Using summary() with ANOVA Model
################################################################################
set.seed(0)
data <- data.frame(program = rep(c("A", "B", "C"), each = 30),
                     weight_loss = c(runif(30, 0, 3),
                                     runif(30, 0, 5),
                                     runif(30, 1, 7)))
  
#fit ANOVA model
model <- aov(weight_loss ~ program, data = data)
#summarize model fit
anova <- summary(model)
