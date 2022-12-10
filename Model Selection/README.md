#Variable Selection with olsrr and caret: Body Fat Example 

library(olsrr)
library(tidyverse)
bodyfat = read.csv(file.choose(), header = TRUE)
head(bodyfat)
bodyfat2 = bodyfat[-c(39,42),]
bodyfat3 = bodyfat2 %>% select(-c(Density,Weight))
head(bodyfat3)
fit = lm(Fat~., data = bodyfat3)

#forward on pvalue
a = ols_step_forward_p(fit,details = TRUE)

#forward on AIC
a = ols_step_forward_aic(fit,details = TRUE)
train_control<- trainControl(method="LOOCV")

# train the model 
model<- train(Fat ~ Abs + Wrist + Height + Age + Chest + Bicepts + Neck, data=bodyfat3, trControl=train_control, method="lm")
model
#RMSE      Rsquared  MAE     
#4.310612  0.728903  3.569474


#backward on pvalue
a = ols_step_backward_p(fit,details = TRUE)

#backward on AIC
a = ols_step_backward_aic(fit,details = TRUE)
train_control<- trainControl(method="LOOCV")

# train the model 
model<- train(Fat ~ Age + Height + Neck + Abs + Hip + Thigh + Forearm + Wrist, data=bodyfat3, trControl=train_control, method="lm")
model
#RMSE      Rsquared   MAE     
#4.306043  0.7294843  3.536925

#stepwise on pvalue
a = ols_step_both_p(fit,details = TRUE)

#stepwise on AIC
a = ols_step_both_aic(fit,details = TRUE)
# define training control
train_control<- trainControl(method="LOOCV")

# train the model 
model<- train(Fat ~ Abs + Wrist + Height + Age + Chest + Bicepts + Neck, data=bodyfat3, trControl=train_control, method="lm")
model
#RMSE      Rsquared  MAE     
#4.310612  0.728903  3.569474




# 2-way Interactions

fit = lm(Fat~.^2, data = bodyfat3)

#forward on pvalue
a = ols_step_forward_p(fit,details = TRUE)

#forward on AIC
a = ols_step_forward_aic(fit,details = TRUE)
# define training control
train_control<- trainControl(method="LOOCV")

# train the model 
model<- train(Fat ~ Abs + Height:Wrist + Chest:Hip + Age:Bicepts + Height:Thigh + Neck:Abs + Forearm, data=bodyfat3, trControl=train_control, method="lm")
model
#RMSE      Rsquared   MAE     
#4.250331  0.7364117  3.488826


#backward on pvalue
a = ols_step_backward_p(fit,details = TRUE)

#backward on AIC
a = ols_step_backward_aic(fit,details = TRUE)
# define training control
train_control<- trainControl(method="LOOCV")

# train the model 
model<- train(Fat ~ Height + Hip + Knee + Bicepts + Wrist + Age:Ankle + Age:Bicepts + Age:Wrist + Height:Chest + Height:Hip + Height:Thigh + Height:Knee + Height:Ankle + Height:Forearm + Neck:Abs + Neck:Thigh + Neck:Ankle + Neck:Forearm + Chest:Abs + Chest:Knee + Chest:Forearm + Abs:Thigh + Abs:Knee + Abs:Forearm + Hip:Thigh + Hip:Forearm + Knee:Forearm + Ankle:Bicepts + Ankle:Wrist + Forearm:Wrist, data=bodyfat3, trControl=train_control, method="lm")
model
#RMSE      Rsquared   MAE     
#4.031198  0.7640068  3.271879


#stepwise on pvalue
a = ols_step_both_p(fit,details = TRUE)

#stepwise on AIC
a = ols_step_both_aic(fit,details = TRUE)

# define training control
train_control<- trainControl(method="LOOCV")

# train the model 
model<- train(Fat ~ Abs + Height:Wrist + Chest:Hip + Age:Bicepts + Height:Thigh + Neck:Abs + Forearm, data=bodyfat3, trControl=train_control, method="lm")
model
#RMSE      Rsquared   MAE     
#4.250331  0.7364117  3.488826
