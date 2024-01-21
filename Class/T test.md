A t test is a statistical test that is used to compare the means of two groups. 
It is often used in hypothesis testing to determine whether a process or treatment actually has an effect on the population of interest, or whether two groups are different from one another.
Example <br>
You want to know whether the mean petal length of iris flowers differs according to their species.
You find two different species of irises growing in a garden and measure 25 petals of each species. You can test the difference between these two groups using a t test and null and alterative hypotheses.
- The null hypothesis (H0) is that the true difference between these group means is zero.
- The alternate hypothesis (Ha) is that the true difference is different from zero. <br>
The t test assumes your data:
- Are independent
- Are (approximately) normally distributed
- Have a similar amount of variance within each group being compared (a.k.a. homogeneity of variance) <br>

|Test                   | Purpose | Data | Hypothesis | Asumption | Examples | 
|-----------------------|-----------|--------------------|----------|------------|---------|
|One-sample t-test | Determines whether a single sample’s mean deviates considerably from a given population mean.| Analyses a single set of measurements or observations. | Tests whether a population mean is hypothesized to be significantly different from the sample mean.|Assumes that observations are independent and that the data is regularly distributed. | Examining whether a class’s average test scores considerably deviate from the average test score for the country, for instance.|
| Two-sample t-test | Determines whether there is a substantial difference between the means of two independent groups | Compares two distinct groups’ or samples’ means.|Determines whether there is a significant difference between the two groups’ means.| Assumes that observations are unrelated to one another, that data in each group is normally distributed, and that the variances of the two groups may or may not be equal| Using the average heights of male and female people to determine whether there is a noticeable difference between the two groups.|
|Paired sample t-test|Determines whether the means of two connected or paired samples differ significantly from one another|Analyses the identical group or set of observations made under two distinct situations or at two different times.|Tests hypotheses to determine if the mean difference between the paired samples differs noticeably from zero.|Assumes that the paired observations are dependent or matched pairs, that the differences have a fixed variance, and that the differences are normally distributed.| Comparing measures taken from the same group of people before and after a new treatment can help determine whether it has a discernible impact.|
```
t.test(x, y,
      alternative = c("two.sided", "less", "greater"),
      mu = 0, paired = FALSE, var.equal = FALSE,
      conf.level = 0.95, ...)
```
- x, y <br>
x: a numeric vector of data values for a one-sample or paired t-test. <br>
y: a numeric vector of data values for a two-sample t-test. <br>
- alternative: Specifies the alternative hypothesis. It can take values "two.sided" (default), "less" for a one-sided test less than the null hypothesis, or "greater" for a one-sided test greater than the null hypothesis. <br>
- mu: The hypothesized population mean for a one-sample t-test. <br>
- paired: Logical indicating whether you are performing a paired t-test (TRUE) or not (FALSE). If TRUE, you should provide two vectors, x and y. <br>
- var.equal: Logical indicating whether to assume equal variances in the two samples for a two-sample t-test. Default is FALSE. <br>
- conf.level: Confidence level for the confidence interval. Default is 0.95. <br>
- na.action: A function that indicates what should happen if missing values are encountered. The default is na.fail, which stops the function if missing values are present. <br>
- paired: Logical indicating whether to perform a paired t-test. Default is FALSE. <br>
## One Sample T – Test Approach
The One-Sample T-Test is used to test the statistical difference between a sample mean and a known or assumed/hypothesized value of the mean in the population
```
set.seed(0)
sample_1 <- c(rnorm(50, mean = 140, sd = 5))
sample_1
~ mu=The hypothesized mean difference between the two groups.
t.test(sample_1, mu = 150)
```
## Two sample T-Test Approach
It is used to help us to understand whether the difference between the two means is real or simply by chance. 
```
set.seed(0)
shopOne <- rnorm(50, mean = 140, sd = 4.5)
shopTwo <- rnorm(50, mean = 150, sd = 4)
t.test(shopOne, shopTwo, var.equal = TRUE)
```
## Paired Sample T-test
This is a statistical procedure that is used to determine whether the mean difference between two sets of observations is zero. 
In a paired sample t-test, each subject is measured two times, resulting in pairs of observations.


