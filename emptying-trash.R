library(here)
library(ggplot2)
X = read.csv(here('mb_free.txt'))
# X = read.csv('~/Desktop/emptying-trash/mb_free.txt')

lin_reg <- lm(formula = megabytes ~ timenocolon, data = X)
m = lin_reg$coefficients[2]
b = lin_reg$coefficients[1]

mr = round(m, 1)
eta = (250000 - b) / m
qplot(x=timenocolon, y=megabytes, data=X) + geom_abline(slope=m, intercept=b) + labs(title=paste(mr, 'MB per min', subtitle = paste(eta, 'ETA')))

# 250 = m * x + b
# (250 - b) / m = x
