library(tidyverse)
library(dplyr)
library(ggplot2)


handicap = Unit_7_Handicap_Data

#Run 1 Way ANOVA

fit = lm(Score~Handicap, data = handicap)

library(lsmeans)

leastsquare=lsmeans(fit,"Handicap")

#The columns names must match order of levels of the treatment variable
Contrasts = list(AW=c(.5,-.5,.5,0,-.5))

contrast(leastsquare,Contrasts)


library(multcomp)
sport = ANOVA_Sports_Height_Example

sport$Sport = factor(sport$Sport)

fit = lm(Height~Sport,data=sport)

gfit = glht(fit,linfct=mcp(Sport="Tukey"))

summary(gfit,test=adjusted("none"))

#Bonferroni Adjustment
summary(gfit,test=adjusted("bonferroni"))

#Dunnet's Adjustment
gfit = glht(fit,linfct=mcp(Sport="Dunnett"))
summary(gfit)

confint(gfit)