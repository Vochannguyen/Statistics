money = SMU_CASH_DATA

colnames(cash)

t.test(Cash ~ School, data=money, var.equal=T, alternative='two.sided')

### Optional
SMU = c(34, 1200, 23, 50, 60, 50, 0, 0, 30, 89, 0, 300, 400, 20, 10, 0)
Seattle = c(20, 10, 5, 0, 30, 50, 0, 100, 110, 0, 40, 10, 3, 0)
school1 <- rep('SMU', 16)
school2 <- rep('Seattle', 14)
school <- as.factor(c(school1, school2))
all.money <- data.frame(name=school, money=c(SMU, Seattle))


