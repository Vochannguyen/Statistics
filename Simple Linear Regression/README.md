# Simple Linear Regression

## Six Step Hypothesis Testing - See Script

### R Code

**Confidence Interval**  
confint(displaylm, level=0.99)

**Crit Value:**    
alpha = .01  
qt(.995,21-2)

### Stating the Regression Equation - See Script

### Interpret Slope
Interpret the slope in the model (regression equation).
For every increase of 1 gram in the stone mass, the estimated T-cell response increases by 0.03282 mm.

### Interpret Intercept
Interpret the y-intercept in the model (regression equation).
When the stone mass is equal to 0, the estimated T-cell response is 0.0875 mm.


### Finding Exact Values of Predictions and Stating the Intervals
**Use this for exact predictions for confidence intervals**
newpoint <- data.frame(Tcell=NA, Mass=4.5)  
predict(displaylm, newpoint, interval="confidence", level=0.99)  

**Interpretations** 
##         fit       lwr       upr
## 1 0.2351937 0.1385665 0.3318209
With 99% confidence, the mean t-cell response for a stone mass of 4.5 grams is between 0.139 and 0.332.

**Use this for exact predictions for prediction intervals**
newpoint <- data.frame(Tcell=NA, Mass=4.5)
predict(displaylm, newpoint, interval="prediction", level=0.99)

**Interpretations** 
##         fit         lwr       upr
## 1 0.2351937 -0.01593192 0.4863193
A 99% prediction interval for a t-cell response given a stone mass of 4.5 grams is -0.016 to 0.486.
