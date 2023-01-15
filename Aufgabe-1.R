dataset <- read.csv(file = "ExDecay.csv", sep = ";", header=T)

# 1.a)
linear.model <- lm(formula = Counts ~ Time, data = dataset)
summary(linear.model)
# Multiple R-squared: 0.767


# 1.b)
quadratic.model <- lm(formula = Counts ~ (Time + Time^2), data = dataset)
summary(quadratic.model)
# Multiple R-squared: 0.767
exponential.model <- lm(formula = log(Counts) ~ Time, data = dataset)
summary(exponential.model)
# Multiple R-squared: 0.8319

# Der R-Wert des exponentiellen Models ist am höchsten, der Zerfallsprozess
# lässt sich also am besten mit diesem Model vorhersagen 