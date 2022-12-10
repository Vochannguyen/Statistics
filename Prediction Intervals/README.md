# Confidence and Prediction Intervals

## R Codes

### 99% Confidence Interval Scatterplot with Regression Line
Initial Scatterplot  
plot(male$Mass, male$Tcell, xlim = c(0, 13), ylim =c(0, 0.7), xlab = "Mass", ylab = "Tcell", main = "Tcell versus Mass")  
displayDF <- data.frame(male)  

**Regression Model**
model1 <- lm(Tcell ~ Mass, data = male)

**Add Regression Line to Scatterplot**
abline(model1, col = "red")

**Create new data sets for prediction and confidence intervals**

### Confidence Intervals
pred_c = predict(model1, newdata=data.frame(Mass=newx), interval=c("confidence"),type=c("response"), level=.99)

### Prediction Interval
pred_p = predict(model1, newdata=data.frame(Mass=newx), interval=c("prediction"),type=c("response"), level=.99)

### How to Add Confidence and Prediction Interval
lines(newx, pred_c[,2], col = "blue", lty = 2, lwd = 2)
lines(newx,pred_c[,3], col = "blue", lty = 2, lwd = 2)
lines(newx,pred_p[,2], col = "green", lty = 2, lwd = 2)
lines(newx,pred_p[,3], col = "green", lty = 2, lwd = 2)
