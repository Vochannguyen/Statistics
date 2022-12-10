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

## Calibration Interval
![image](https://user-images.githubusercontent.com/110003333/206835298-efc2093e-6f37-4421-ba71-a5779d492a86.png)
![image](https://user-images.githubusercontent.com/110003333/206835314-e572b44c-b90c-4f42-9e9b-2f9f903642af.png)
