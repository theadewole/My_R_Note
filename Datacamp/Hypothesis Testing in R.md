# Introduction to Hypothesis Testing 
<details><summary>PDF</summary>
  
[chapter1.pdf](https://github.com/theadewole/My_R_Note/files/15186301/chapter1.pdf)

</details>

**Definitions** <br>
- A hypothesis is a statement about an unknown population parameter.
- A hypothesis test is a test of two competing hypotheses. 
  - The null hypothesis (H ) is the existing "champion" idea.
      - The alternative hypothesis (H ) is the new "challenger" idea of the researcher. <br>
      
The null hypothesis is like the current champion, and the alternative hypothesis is like a challenger trying to overthrow that champion. Here, the null hypothesis is that our data won't tell us anything new, The alternative hypothesis is that our hunch is correct.

![image](https://github.com/theadewole/My_R_Note/assets/108795960/4cd054b9-9a98-41bf-b54e-8fc8e1be5522) <br>
**p-values quantify evidence for the null hypothesis.** <br>
- Large p-value → fail to reject null hypothesis.
  - Small p-value → reject null hypothesis.
![image](https://github.com/theadewole/My_R_Note/assets/108795960/43d71e7b-e2f7-46c9-a3ac-2fb04a73de69)
![image](https://github.com/theadewole/My_R_Note/assets/108795960/aa703a6c-2f9d-4820-b222-15b629f6ea56)

# Two-Sample and ANOVA Tests

<details><summary>PDF</summary>
  
[chapter2.pdf](https://github.com/theadewole/My_R_Note/files/15186317/chapter2.pdf)

</details>

**Hypothesis testing workflow** <br>
![image](https://github.com/theadewole/My_R_Note/assets/108795960/b0c811ee-5739-4d4d-bdc4-466d0d718a8f)


**Testing differences between two means using t.test()** <br>
```
t.test(
# Vector of differences
sample_data$diff,
# Choose between "two.sided","less","greater"alternative = "less",
# Null hypothesis population parameter
mu = 0
)
```
**t.test() with paired = TRUE**
```
t.test(sample_data$repub_percent_08,sample_data$repub_percent_12,alternative = "less",
mu = 0,
paired = TRUE
)
```
**Unpaired t.test()**
```
t.test(
x = sample_data$repub_percent_08,
y = sample_data$repub_percent_12,
alternative = "less",
mu = 0
)
```
![image](https://github.com/theadewole/My_R_Note/assets/108795960/e15ace4d-ad56-42bf-a386-e1c2ab4013ca)

**Analysis of variance (ANOVA)** <br>
You call lm, specifying the numeric variable as the response on the left-hand-side of the formula, and the categories as the explanatory variable on the right-hand side. Then you call anova to perform an analysis of variance test. 
```
calling_lm <- lm(numeric_var~categorical_var,data=dataframe)

anova(calling_lm)
```
**pairwise test()** <br>
![image](https://github.com/theadewole/My_R_Note/assets/108795960/25ebe7c7-d4eb-4018-8db2-1de25e1d8d34)
To run all these hypothesis tests in one go, you can use pairwise-dot-t-dot-test. The first argument is the numeric variable whose sample means you are interested in. The second argument is the categorical variable defining the groups. 
```
pairwise.t.test(df$numeric_var~df$categorical,p.adjusted.method="none")
```
more methods for p.adjusted.method includes: <br>
"holm" "hochberg" "hommel" "bonferroni" "BH" "BY" "fdr" "none" <br>
- Holm: The Holm method is a step-down procedure that adjusts the p-values by controlling the family-wise error rate (FWER). It sequentially compares the smallest adjusted p-value with a threshold based on the Bonferroni correction.
- Hochberg: Similar to Holm's method, the Hochberg method also controls the FWER. However, instead of using the smallest adjusted p-value, it uses a sequential approach based on ranking the p-values.
- Hommel: The Hommel method is another step-down procedure for adjusting p-values while controlling the FWER. It is more powerful than Holm's method and can be particularly useful when the tests are dependent.
- Bonferroni: The Bonferroni method is one of the simplest approaches for controlling the family-wise error rate. It adjusts each individual p-value by dividing the significance level (usually 0.05) by the number of tests.
- BH (Benjamini-Hochberg): The Benjamini-Hochberg method controls the false discovery rate (FDR), which is the expected proportion of false discoveries among all rejected hypotheses. It is less conservative than methods controlling the FWER and often more powerful in detecting true positives.
BY (Benjamini-Yekutieli): The Benjamini-Yekutieli method is a variant of the Benjamini-Hochberg method. It is suitable when the tests are dependent or when the dependency structure is unknown.
- FDR (False Discovery Rate): This method controls the FDR, similar to the BH method. It adjusts the p-values to limit the expected proportion of false positives among all rejected hypotheses.
- None: Choosing "none" means that no adjustment is applied to the p-values. This is not recommended when performing multiple hypothesis tests because it can lead to an inflated Type I error rate.

# Proportion Tests

<details><summary>PDF</summary>
  
[chapter3.pdf](https://github.com/theadewole/My_R_Note/files/15186318/chapter3.pdf)

</details>

## Two-sample proportion tests
![image](https://github.com/theadewole/My_R_Note/assets/108795960/a4a15045-685c-4474-96f4-a14aaeb83bb1)

## Chi-square test of independence
Just as ANOVA extends t-tests to more than two groups, chi-square tests of independence extend proportion tests to more than two groups. <br>
The hypothesis test for independence is called a chi-square independence test, its a right tailed test. 
using infer's chisq-underscore-test. 
Pipe from the sample dataset, passing a formula with the response variable on the left and the explanatory variable on the right.
![image](https://github.com/theadewole/My_R_Note/assets/108795960/2eb93846-f3e4-4ba6-8644-69f47d798a68)

## Chi-square goodness of fit tests
The one-sample chi-square test is called a goodness of fit test. To run it, we need the hypothesized proportions in vector form rather than in a tibble. Again we use chisq_test from infer. However, this time the arguments are different. Piping from the dataset, we set response to the name of the column of interest, and set p to the hypothesized distribution.

![image](https://github.com/theadewole/My_R_Note/assets/108795960/47f4ddf4-faaa-4c4a-9d5f-e5c65ef4382a)

# Non-Parametric Tests
<details><summary>PDF</summary>
  
[chapter4.pdf](https://github.com/theadewole/My_R_Note/files/15186319/chapter4.pdf)

</details>

## Assumptions in hypothesis testing

## The "There is only one test" framework

****A grammar of hypothesis tests**** <br>
![image](https://github.com/theadewole/My_R_Note/assets/108795960/4649a2a2-6b40-487a-98b2-ad9b69b5edc9)

****specify ()**** <br>
![image](https://github.com/theadewole/My_R_Note/assets/108795960/c80a8f83-7cd3-49ca-a4b9-ade510d28e18)

****hypothesize()**** <br>
![image](https://github.com/theadewole/My_R_Note/assets/108795960/91e52d49-155f-4751-9f7a-24a115c9994f)

****generate()**** <br>
generate performs the simulation step many times. Each simulated dataset is called a replicate and represents an example of what we might expect the two columns to look like in a universe where the null hypothesis is true
- To call generate, tell it how many replicates you want. For independence tests, the generation type should always be "permute". For convenience, generate combines all the simulated datasets into a single tibble
![image](https://github.com/theadewole/My_R_Note/assets/108795960/4386501f-d27c-4e75-9dc8-aacf9e702439)

****calculate()****
- To use the difference in proportions as the test statistic, set the stat argument to "diff in props". We need to tell calculate which proportion to subtract from which by setting the order.
![image](https://github.com/theadewole/My_R_Note/assets/108795960/713a7e0e-ac0c-46e4-b9fa-6acf3ffacb1c)

****Get the p-value**** <br>
![image](https://github.com/theadewole/My_R_Note/assets/108795960/eb71c12b-fa25-46df-9c89-1491372b6302)

## Non-parametric ANOVA and unpaired t-tests
A non-parametric test is a hypothesis test that doesn't assume a probability distribution for the test statistic. <br>
There are two types of non-parametric hypothesis test: <br>
- Simulation-based.
- Rank-based 
****Wilcoxon-Mann-Whitney test**** <br>
Wilcoxon-Mann-Whitney test using wilcox-dot-test from base-R. It accepts a formula and data argument, though these are swapped compared to the infer functions, so they are less pipe-friendly. <br>
![image](https://github.com/theadewole/My_R_Note/assets/108795960/622472af-63f4-4214-9357-63b119a6af7e)

****Kruskal-Wallis test**** <br>
In the same way that ANOVA extends t-tests to more than two groups, the Kruskal-Wallace test extends the Wilcoxon-Mann-Whitney to more than two groups. That is, the Kruskal-Wallace test is a non-parametric version of ANOVA. <br>
![image](https://github.com/theadewole/My_R_Note/assets/108795960/83af42b5-5afd-44b4-bc94-8861c7d42bbb)

