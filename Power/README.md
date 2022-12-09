# Power

## SAS Code
### Find the Number of Sample Size
proc power;  
onesamplemeans  
alpha = 0.05  
nullmean = 100  
mean = 110  
stddev = 7  
power = 0.8  
ntotal = .;  
run;  

## R Code
### Find the Number of Sample Size
power.t.test(delta=10,sd=7,sig.level = .05, power = .8, type = "two.sample",alternative="one.sided")
