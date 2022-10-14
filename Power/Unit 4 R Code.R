covid = VXTrial
#n is number in each group, two sample
power.t.test(500,delta=.2,sd=1.4554,sig.level = .05, type = "two.sample",alternative="two.sided")


power.t.test(delta=.2,sd=1.4554,sig.level = .05,power=.9, type = "two.sample",alternative="two.sided")



#Sample Size Professor Code
powerholder = c()
samplesizes = seq(60,80,length = 20)

for(i in 1:20)
{
  powerholder[i] = power.t.test(n = samplesizes[i], delta = .2, sd = 1.4554, sig.level = .05, type = "two.sample",alternative = "two.sided")$power
}

plot(samplesizes,powerholder,type = "l", col = "blue", main = "POWER CURVE", ylab = "POWER", lwd = 3)



powerholder = c()
effectsizes = seq(.1,1,by = 50)

for(i in 1:6)
{
  powerholder[i] = power.t.test(n = 500,delta = effectsizes[i], sd = 1.4554, sig.level = .05, type = "two.sample",alternative = "two.sided")$power
}

plot(effectsizes,powerholder,type = "l", col = "blue", main = "POWER CURVE", ylab = "POWER", lwd = 3)


#Alpha
betaholder = c()
alphas = seq(.1,1,length = 50)

for(i in 1:50)
{
  betaholder[i] = 1 - power.t.test(n = 500, delta = .2, sd = 1.445, sig.level = alphas[i], type = "two.sample",alternative = "two.sided")$power
}

plot(alphas,betaholder,type = "l", col = "blue", main = "Beta CURVE", ylab = "Beta", lwd = 3)
