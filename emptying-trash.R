library(here)
library(ggplot2)
library(dplyr)

goal_mebi = 231680

raw = read.csv(here('mb_free.txt'))
# raw = read.csv('~/Desktop/emptying-trash/mb_free.txt')

raw %>%
mutate(hours = timenocolon %/% 100 + (timenocolon - timenocolon %/% 100 * 100) / 60) ->
X

lin_reg <- lm(formula = megabytes ~ hours, data = X)
m = lin_reg$coefficients[2]
b = lin_reg$coefficients[1]

mround = round(m, 1)
eta = round((goal_mebi - b) / m, 2)
# 250 = m * x + b
# (250 - b) / m = x

qplot(x= hours, y=megabytes, data=X) + geom_abline(slope=m, intercept=b) + labs(title=paste(mround, 'MiB per hr'), subtitle = paste(eta, 'ETA'), y = 'Available space (MiB)') + xlim(10,30) + ylim(NA, goal_mebi) + geom_smooth() + geom_hline(yintercept = goal_mebi)
