# Types of Quantile Calculation Methods
## Type 1 (Empirical Distribution Function)
- Formula: Q(p)=(n×p)Q(p) = (n \times p)Q(p)=(n×p)-th value in the sorted data.
- Description: This method uses the empirical distribution function. It doesn't interpolate between values.
- Usage: Simple and straightforward, but can be less accurate for small datasets.
## Type 2 (Nearest Order Statistic)
- Formula: Q(p)=Floor(n×p)Q(p) = \text{Floor}(n \times p)Q(p)=Floor(n×p)-th value in the sorted data.
- Description: This method takes the nearest order statistic and rounds down to the nearest integer.
- Usage: Often used in older statistical packages and some textbooks.
## Type 3 (Tukey's Hinges)
- Formula: Q(p)=Floor(n×p+0.5)Q(p) = \text{Floor}(n \times p + 0.5)Q(p)=Floor(n×p+0.5)-th value in the sorted data.
- Description: An adjustment to Type 2, this method uses a rounding rule that adds 0.5 before flooring.
- Usage: Popularized by Tukey for exploratory data analysis.
## Type 4 (Linear Interpolation of the Cumulative Distribution Function)
- Formula: Q(p)=(n+1)×pQ(p) = (n + 1) \times pQ(p)=(n+1)×p-th value in the sorted data.
- Description: This method linearly interpolates between the empirical distribution function values.
- Usage: Provides a smoother estimate of quantiles.
## Type 5 (Piecewise Linear Function)
- Formula: Q(p)=(p(n+1)−1)/(n−1)Q(p) = (p(n + 1) - 1) / (n - 1)Q(p)=(p(n+1)−1)/(n−1)-th value in the sorted data.
- Description: A piecewise linear approach, often used in R and some other statistical software.
- Usage: Balances between simplicity and smooth interpolation.
## Type 6 (Linear Interpolation of the Inverse Empirical CDF)
- Formula: Q(p)=p(n−1)+1nQ(p) = \frac{p(n - 1) + 1}{n}Q(p)=np(n−1)+1-th value in the sorted data.
- Description: Interpolates linearly based on the inverse empirical cumulative distribution function.
- Usage: Another form of smooth interpolation, often preferred for theoretical reasons.
## Type 7 (Sample Quantile Type)
-	Formula: Q(p)=(n−1)×p+1Q(p) = (n - 1) \times p + 1Q(p)=(n−1)×p+1-th value in the sorted data.
-	Description: This method is the default in R's quantile function and in many other statistical software packages.
-	Usage: Widely used due to its balance of simplicity and accuracy.
## Type 8 (Median Unbiased)
- Formula: Q(p)=(n+1/3)×p+1/3Q(p) = (n + 1/3) \times p + 1/3Q(p)=(n+1/3)×p+1/3-th value in the sorted data.
- Description: This method aims to minimize the bias in the sample quantiles.
- Usage: Used when a median unbiased estimate is required.
## Type 9 (Normal Distribution-Based)
- Formula: Q(p)=qnorm(p)×sqrt(n×p×(1−p))Q(p) = \text{qnorm}(p) \times \text{sqrt}(n \times p \times (1 - p))Q(p)=qnorm(p)×sqrt(n×p×(1−p))-th value in the sorted data.
- Description: This method adjusts the quantile calculation based on the assumption of a normal distribution.
- Usage: Useful in cases where the data distribution is approximately normal.

```
data <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

# IQR calculations
IQR_type1 <- IQR(data, type=1)
IQR_type2 <- IQR(data, type=2)
IQR_type3 <- IQR(data, type=3)
IQR_type4 <- IQR(data, type=4)
IQR_type5 <- IQR(data, type=5)
IQR_type6 <- IQR(data, type=6)
IQR_type7 <- IQR(data, type=7)
IQR_type8 <- IQR(data, type=8)
IQR_type9 <- IQR(data, type=9)

# Display results
list(
  Type1 = IQR_type1,
  Type2 = IQR_type2,
  Type3 = IQR_type3,
  Type4 = IQR_type4,
  Type5 = IQR_type5,
  Type6 = IQR_type6,
  Type7 = IQR_type7,
  Type8 = IQR_type8,
  Type9 = IQR_type9)
```
