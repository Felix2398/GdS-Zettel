dataset <- read.csv(file = "Teilnahme.csv", sep = ";", header=TRUE)
head(dataset)
str(dataset)

# 2.a)
dataset$attend_or_not <- factor(dataset$attend_or_not, levels = c("course not attended", "course attended"))
str(dataset)
levels(dataset$attend_or_not)

# 2.b)
logistic <- glm(dataset$attend_or_not ~ dataset$stat_joy, family = binomial, data=dataset)
summary(logistic)
plot(dataset$stat_joy, logistic$fitted.values, col=dataset$attend_or_not)

# 2.c)
library(pROC)
roc(dataset$attend_or_not, logistic$fitted.values, plot=TRUE, legacy.axes=TRUE)

# 2.d)
logistic2 <- glm(dataset$attend_or_not ~ ., family = binomial, data=dataset)
summary(logistic2)

roc(dataset$attend_or_not, logistic$fitted.values, plot=TRUE, legacy.axes=TRUE, col="#DA341A95", lwd=5, print.auc=TRUE)
plot.roc(dataset$attend_or_not, logistic2$fitted.values, add=TRUE, legacy.axes=TRUE, col="#008C4C95", lwd=5, print.auc=TRUE, print.auc.y=0.4)

# Der AUC von Model1, welches nur stats_joy berücksichtigt, beträgt 0.808
# Der AUC von Model2, welches alle anderen Variablen berücksichtigt, beträgt 0.810
# Model2 ist dadurch zwar minimal besser geeignet als Model1, aber die Variablen sun_joy und temperature
# haben nur eine sehr geringe Auswirkung auf des Ergebnis.
# Die Teilnahme eines Studenten an der Vorlesung lässt sich deshalb also fast ausschließlich dadurch 
# vorhersagen wie stark der Genuss der Vorlesung des Studenten ist.

