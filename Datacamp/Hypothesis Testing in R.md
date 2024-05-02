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

# Proportion Tests
**Hypothesis testing workflow** <br>
![image](https://github.com/theadewole/My_R_Note/assets/108795960/b0c811ee-5739-4d4d-bdc4-466d0d718a8f)

<details><summary>PDF</summary>
  
[chapter3.pdf](https://github.com/theadewole/My_R_Note/files/15186318/chapter3.pdf)

</details>

# Non-Parametric Tests
<details><summary>PDF</summary>
  
[chapter4.pdf](https://github.com/theadewole/My_R_Note/files/15186319/chapter4.pdf)

</details>
