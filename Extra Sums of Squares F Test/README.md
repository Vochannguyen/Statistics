
## Extra Sums of Square F-test
Problem:  Perform an extra sum of squares F-test to simultaneously test the significance of these variables together.  
Assumptions: Based on the scatter matrix in Figure 10, there is not sufficient evidence against a linear relationship between taste and each of the explanatory variables Acetic and H2S. Based on the residual plots, residual histograms and residual QQ plots in Figures 10, we see little evidence against normality except the double peak of the residual histogram, which may be cause for concern.  Similarly, the residuals appear to have constant variance, but there is an outlier with a predicted value of over 20 (and a studentized residual over 2) that we will investigate further.  We will assume the residuals are independent of each other and proceed with an extra sum of squares test to determine which model is appropriate. For the reduced model (shown in Figure 11) we also find little evidence against the residuals being normally distributed with constant variance.  
![image](https://user-images.githubusercontent.com/110003333/206805186-4ca0e2a4-4b96-4f8c-a956-a9a3cdae37c4.png)

Step 1: Null and Alternative Hypothesis
Ho : βAcetic = βH2S = 0;
Ha : βAcetic,βH2S  ≠ 0;

Step 2: Full Model from SAS  
![image](https://user-images.githubusercontent.com/110003333/206805535-48ada604-8159-413c-803b-ed1958f02f1e.png)  

Step 3: Reduced Model from SAS:
![image](https://user-images.githubusercontent.com/110003333/206806031-7f9f05fa-3669-4819-8cfa-1b6e64ae9684.png)

![image](https://user-images.githubusercontent.com/110003333/206805938-319aa9af-7e56-4a52-8ef2-e5a653eb01e0.png)

Step 4: F-test Table: Identical
Step 5: Conclusion: 0.0001 < 0.05 Reject Ho
Step 6: Conclusion in Context
There is strong evidence to suggest at the α = .05 level of significance (p-value = <.0001, n = 30) that the variation in the model is better explained by the regression model that includes Acetic and H2S than the equal means model.  
