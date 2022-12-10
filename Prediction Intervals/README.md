# Confidence and Prediction Intervals

## R Codes 1

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

## R Codes 2  
autism <- read.csv("")  
autism.lm <- lm(Prevalence ~ Year, data = autism)  
newx <- autism$Year  
newx <- sort(newx)  
prd_c <- predict(autism.lm, newdata= data.frame(Year = newx), interval=c("confidence"),   
                 type = c("response"), level=0.95)  

prd_p <- predict(autism.lm, newdata= data.frame(Year = newx), interval=c("prediction"), 
                 type = c("response"), level=0.95)  
                 #Plot with confidence and prediction intervals
plot(autism[,1], autism[,2],xlim = c(1990,2002), ylim = c(-5,25), xlab = "Year", 
     ylab = "Prevalence", main = "Autism Prevalence")  
abline(autism.lm, col = "red")  
lines(newx,prd_c[,2],col = "blue",lty = 2, lwd = 2)  
lines(newx,prd_c[,3],col = "blue", lty = 2, lwd = 2)  
lines(newx,prd_p[,2],col = "green", lty = 2, lwd = 2)  
lines(newx,prd_p[,3],col = "green", lty = 2, lwd = 2)  

## R Code with Log Transformations
autism$log.prevalence <- log(autism$Prevalence)
log.autism.lm <- lm(log.prevalence ~ Year, data = autism)
prd_c2 <- predict(log.autism.lm, newdata= data.frame(Year = newx), interval=c("confidence"), 
                  type = c("response"), level=0.95)
prd_p2 <- predict(log.autism.lm, newdata= data.frame(Year = newx), interval=c("prediction"), 
                  type = c("response"), level=0.95)
 #Plot with confidence and prediction intervals
plot(autism[,1], autism[,3],xlim = c(1990,2002), ylim = c(0,3), xlab = "Year", 
     ylab = "log(Prevalence)", main = "Autism log(Prevalence)")
abline(log.autism.lm, col = "red")  
lines(newx,prd_c2[,2],col = "blue",lty = 2, lwd = 2)  
lines(newx,prd_c2[,3],col = "blue", lty = 2, lwd = 2)  
lines(newx,prd_p2[,2],col = "green", lty = 2, lwd = 2)  
lines(newx,prd_p2[,3],col = "green", lty = 2, lwd = 2)  

## Scatterplot of Residuals
Store residuals from linear model  
autismres <- resid(autism.lm)  
#Get scatterplot of residuals  
plot(autism$Year, autismres, ylab="Residuals", xlab="Year", main="Residuals versus Year")
abline (0,0)  

Store residuals from linear model
autismres2 <- resid(log.autism.lm)
#Get scatterplot of residuals
plot(autism$Year, autismres, ylab="Residuals", xlab="Year", main="Residuals versus Year")
abline (0,0)

## Histogram of Residuals  
**Store Residuals**
studresautism <- rstudent(autism.lm)

**Histogram**
hist(studresautism, freq=FALSE, main="Distribution of Studentized Residuals", xlab="Studentized Residuals", ylab="Density", ylim=c(0,0.5))  

**Create range of x-values for normal curve**  
xfit <- seq(min(studresautism)-1, max(studresautism)+1, length=40)  

**Generates values from normal distribution at specified values**  
yfit <- (dnorm(xfit))  

**Add Normal Curve**
lines(xfit, yfit, ylim=c(0,0.5))
## Calibration Interval
![image](https://user-images.githubusercontent.com/110003333/206835298-efc2093e-6f37-4421-ba71-a5779d492a86.png)
![image](https://user-images.githubusercontent.com/110003333/206835314-e572b44c-b90c-4f42-9e9b-2f9f903642af.png)

## QQPlot - Normality Check
par(mfrow=c(1,2))
qqnorm(studresautism)
qqline(studresautism)
qqnorm(studresautism2)
qqline(studresautism2)

## R-sqd  
summary(log.autism.lm)$r.squared
