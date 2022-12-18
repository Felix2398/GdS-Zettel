# Aufgabe 3
data <- c(92, 96, 96, 106, 112, 114, 114, 118, 123, 124)

# 3.b)
wilcox.test(data, mu=100, alternativ = "two.sided", conf.level = 0.95)
