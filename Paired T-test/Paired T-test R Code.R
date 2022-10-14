twitch = twitch

#Histogram

twitch$diff = twitch$Placebo - twitch$Ritalin

hist(twitch$diff)

t.test(twitch$Placebo,twitch$Ritalin, paired=TRUE)

t.test(twitch$Placebo,twitch$Ritalin, paired=TRUE,alternative="less")

t.test(twitch$Placebo,twitch$Ritalin, paired=TRUE, conf.level=.90)
