# Multiple Linear Regression

## SAS Code
proc glm data=cheese alpha = .05 plots=all;  
model taste = Acetic H2S / solution clparm;  
run;

### Code for Partial Residuals
proc corr data = partialres2;  
var case taste Acetic H2S presh presa;  
with case taste Acetic H2S presh presa;  
run;  

data partialres1;  
set cheese;  
presh = taste + 26.94 - 3.80*Acetic;  
;  

data partialres2;  
set partialres1;  
presa = taste + 26.94 - 5.146*H2S;  
;  

Proc sgplot data=partialres2;  
scatter y = presa x = Acetic;  
run;  

Proc sgplot data=partialres2;  
scatter y = presh x = H2S;  
run;  

## Cook's D / Outliers
The threshold we are using for Cook’s Distance is 4/n

**SAS CODE**  
proc glm data=cheese alpha = .05;  
model taste = Acetic H2S / solution clparm;      
output out = outliers1 P=Fitted PRESS = PRESS H=HAT  
COOKD=COOKD;  
run;  

data outliers1;  
set outliers1;  
where COOKD > 0.13;  
run;  

proc print data=outliers1;  

## Extra Sums of Square F-test
proc sgscatter data=sashelp.iris;  
  title "Scatterplot Matrix for Iris Data";  
  matrix sepallength petallength sepalwidth petalwidth  
         / group=species;  
run;  

## Sample 1  
### Questions:

#### 1) Is the overall regression equation significant  
Use Analysis of Variance Table to check for P-value  
![image](https://user-images.githubusercontent.com/110003333/206790891-91d0b1fc-0c3f-46d5-a5ef-c96d6938bfdb.png)


#### 2) Are the slopes of the regression line statistically significant?  
![image](https://user-images.githubusercontent.com/110003333/206791076-2ab32959-100f-4466-b4c8-97c89a29b378.png)
H2S is statistically significant because the p-value is 0.0002, which means that the slope is significant different from 0 at α = 0.05.  
Acetic is not statistically signifcant because the p-value is 0.4062, which mean that the slope is not signficantly different than 0 at   
These p-values are calculated by a hypothesis test where the null hypothesis is that the slope parameter is equal 0 and the alternative hypothesis is that the slope parameter is not equal to zero.   

Practically, this means that we can eliminate the Acetic variable from the model without impacting the fit of the model.  A quick comparison of R2 for both the 3 parameter model (with Acetic included) and the 2 parameter model (a simple linear regression based on H2S) in Figure 6 shows this is true.  

### 3) Interpret each slope- Log Transformation  
Because the variable H2S is log transformed, holding the value of Aectic constant, a doubling of the concentration of H2S is associated with a mean increase of 3.567 =  5.15*log(2)  

While not statistically significant in this model, the best estimate of effect of increasing the Acetic concentration while holding the value of H2S constant is that a doubling of the concentration is associated with an increase of 2.634 in the mean of taste.  

![image](https://user-images.githubusercontent.com/110003333/206798452-de275ab0-6d50-463c-8875-f3db083d8593.png)  


### 3) Partial Residuals or Correlation  

presH2S = taste - β0 - β1(Acetic) = taste + 26.94 - 3.80*Acetic;  
![image](https://user-images.githubusercontent.com/110003333/206802497-cddab16c-1ef4-4c14-9583-81ef1ee53cd1.png)  
![image](https://user-images.githubusercontent.com/110003333/206802777-7d32a8b4-6a83-4fd4-8605-efb322803ae1.png)

After computing for partial residual for H2S, we are able to see the variation in taste is almost completely explained by the concentration of H2S. H2S on the scatterplot looks more linearly correlation. The values of the correlation is <.0001, which is statistically signficant.

presacetic = taste - β0 - β2(H2S) = taste + 26.94 - 5.146*H2S;  
![image](https://user-images.githubusercontent.com/110003333/206802795-c49384ee-d147-41f4-aef8-b9ad3dfe9164.png)  

![image](https://user-images.githubusercontent.com/110003333/206802698-3be2267b-602a-4269-b5d2-f0aa4be78289.png)  
After computing for partial residual of Acetic, we are able to see that there is a random cloud in the scatter plot. The correlation value is not signifcant at .2839

## Partial Residuals  
Partial residuals can be useful for identifying which variables are the most important for predicting the response variable, and for understanding the relationships between the variables in the model.

## Confidence Intervals for Multiple Linear Regression

### Question: g.	Obtain a 90% confidence interval for population slope of the variable “H2S”. Interpret the interval.    
A 90% CI for β1 is (-3.9, 11.5). A 90% CI for β2 is (3.1, 7.2).  
![image](https://user-images.githubusercontent.com/110003333/206803578-f9730efd-7709-49e9-90c4-a620addb2783.png)

## Outliers
### Question: Identify any leverage points in the data using any measure you like. Give a definition of the measure you chose. If you make your decision on the basis of several measures, then explain only one of them. If there are no leverage points, then explain why you came to that conclusion.  

**Look At Cook's D**  
![image](https://user-images.githubusercontent.com/110003333/206803760-bedd473d-101c-4545-9f6f-435e0e029326.png)

proc glm data=cheese alpha = .05;  
model taste = Acetic H2S / solution clparm;      
output out = outliers1 P=Fitted PRESS = PRESS H=HAT  
COOKD=COOKD;  
run;  

data outliers1;  
set outliers1;  
where COOKD > 0.13;  
run;  

proc print data=outliers1;  

As shown on the Cook'D, observations 12, 15, 13 had a Cook's D greater than .13, which was calculated using 4/30. **Cook's Distance is a measure of overall influence on the regress coefficients, its numberator measures how much fitted values change when the observations is deleted** Since each of these points is above the threshold, they can become problematic, which should be investigated further. 

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
proc glm data=cheese alpha = .10 plots=all;    
model taste = Acetic H2S / solution clparm;   
means Acetic H2S / hovtest = bf;   
run;  
![image](https://user-images.githubusercontent.com/110003333/206806031-7f9f05fa-3669-4819-8cfa-1b6e64ae9684.png)

![image](https://user-images.githubusercontent.com/110003333/206805938-319aa9af-7e56-4a52-8ef2-e5a653eb01e0.png)

Step 4: F-test Table: Identical
Step 5: Conclusion: 0.0001 < 0.05 Reject Ho
Step 6: Conclusion in Context
There is strong evidence to suggest at the α = .05 level of significance (p-value = <.0001, n = 30) that the variation in the model is better explained by the regression model that includes Acetic and H2S than the equal means model.  

