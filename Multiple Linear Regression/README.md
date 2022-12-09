# Multiple Linear Regression

## SAS Code
proc glm data=cheese alpha = .05 plots=all;  
model taste = Acetic H2S / solution clparm;  
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
presacetic = taste - β0 - β2(H2S) = taste + 26.94 - 5.146*H2S;  
