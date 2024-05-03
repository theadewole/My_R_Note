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
**Hypothesis testing workflow** <br>
![image](https://github.com/theadewole/My_R_Note/assets/108795960/b0c811ee-5739-4d4d-bdc4-466d0d718a8f)

<details><summary>PDF</summary>
  
[chapter3.pdf](https://github.com/theadewole/My_R_Note/files/15186318/chapter3.pdf)

</details>

## Two-sample proportion tests
![image](https://github.com/theadewole/My_R_Note/assets/108795960/a4a15045-685c-4474-96f4-a14aaeb83bb1)


# Non-Parametric Tests
<details><summary>PDF</summary>
  
[chapter4.pdf](https://github.com/theadewole/My_R_Note/files/15186319/chapter4.pdf)

</details>
