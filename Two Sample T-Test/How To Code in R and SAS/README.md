# Two Sample T-test
## SAS Code:
proc ttest data = pocketmoney;  
class school;  
var money;  
run;

## Report
Problem:

Inferential Limitations:

Assumptions:

6 Step Hypothesis Testing:  
Step 1: Hypothesis  
Step 2: Critical Value or Alpha Level:  
Step 3: Test Statistic  
Step 4: P-value  
Step 5: Decision  
Step 6: Conclusion  
Scope of Inference:  







## Conclusion Scripts:

#### Fail to Reject
Based on this test, there is not enough evidence to suggest that the mean amount of pocket cash of the SMU students is different than that of the students from Seattle U (p=0.1732 from a two-sided t-test). A 95% confidence interval for this difference is [-$53, $282]. Since the subjects in this sample were not randomly sampled, the results only generalize to the subjects in the study (no need to discuss causal conclusions for a non-significant result).

**Comment on Interval**: Since 0 is not in the confidence interval, our test strongly reject the null hypothesis that the mean difference is 0. Thus, this is not plausible of the difference of the mean sleeping rating between placebo and vaccine groups. 

#### Reject the Null Hypothesis

**Assumptions are met because of sample sample size:**
There is overwhelming evidence to suggest that the mean appetite score of the Vaccine Group is greater than that of the Placebo group and, since this was a randomized experiment, the Vaccine caused this difference (pvalue < .00001 from a pooled two sample t-test). We are 95% confident that Vaccine group has a mean that is between 1.03 and 1.45 points more than the mean appetite score from the Placebo group.  

## Confidence Intervals:
**Example 1:** A 95% confidence interval for this difference is [-1.60,5.44] years (or the 1-sided interval reported above). With 95% confidence, we expect the true mean difference in ages to fall in this interval. In particular, approximately 95% of all confidence intervals created this way should include the true difference in means. Because 0 is included in the interval and is thus a probable value, we don’t have enough evidence to conclude a difference exists.

**Example 2: ** We are 99% confidence that the placebo group has a mean sleep rating that is between .072 and .544 points greater than that of the vaccine group; our best estimate is .308. This one will always agree with .01 test.


### Sample 1
**Problem:** Does placing rats on calcium-deficient diet cause an increase in the consumption of lead-acetate solution? **Remember to use the rats not the people**

**Inferential Limitations:**
This is randomized experiment, so casual inference can be drawn as a result of this analysis.

Assumptions:
1) Normality: **Look at Histogram, Boxplot, and QQPlot**
Histogram: Looks normal and are consistent with small sample sizes draws from normal population
QQPlot: The lines are fairly linear
![image](https://user-images.githubusercontent.com/110003333/206784827-062b1f94-876a-4bdf-a26b-cc4f403889b5.png)

2) Equal Variance: **Use the Equality of Variance Output in SAS**
The sample standard deviation are close to each other, but since the normality assumption is met, we can use the equality of variance test.
![image](https://user-images.githubusercontent.com/110003333/206785031-d4e5d068-71b8-4dea-95b6-ad2c07e73f66.png)
Null Hypothesis is the variance variances are equal: We reject this because p-value is 0.53
The test shows that there is not evidence to suggest variance are equal (Failt o Reject) with a p-value of 0.5356.

3) Independence: We assume the observations are independent and proceed with test.

6 Step Hypothesis Testing: Two-Sample t-test to compare the means of dependent variables of two independent groups, conducted at a α = 0.05 level of significance.

Step 1: Hypothesis  
Ho : µE -µC = 0
Ha : µE -µC > 0

Step 2: Critical Value or Alpha Level:  
One Sided T-Value: 1.734  
**R Code: qt(0.95,20-2)**

Step 3: Test Statistic :
From Output:  
![image](https://user-images.githubusercontent.com/110003333/206787689-9e3f4dcf-9f07-48ef-af60-8b55c8a7bad9.png)

By Hand:  
![image](https://user-images.githubusercontent.com/110003333/206787848-8e6f4f73-c46a-4601-918a-72bcadcedcd5.png)
![image](https://user-images.githubusercontent.com/110003333/206787867-42b49473-f728-43b5-8e9a-9a86e4b08f32.png)

Step 4: P-value: **Look at Output Table**  
p-value = < .0001  

Step 5: Decision: .0001 < .05, Reject Null Hypothesis  

Step 6: Conclusion: **Reject Null Hypothesis** 
There is strong evidence to suggest at the α = .05 level of significance (p-value = <.0001, n = 20) that a calcium-deficient diet in rats caused an increase in the consumption of lead-acetate of 3.5 units.  A 90% confidence interval for the increase is [2.465, 4.535].  

Scope of Inference: This is an randomized experiment, thus casual inference can be made. 
