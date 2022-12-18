# Aufgabe 2
data <- read.csv("Hair.csv", sep = ";")
attach(data)


# 2.a)
dataA <- data[,3]
dataB <- data[,4]
# H0: Das Mittel beschleunigt nicht das Haarwachstum
# H1: Das Mittel beschleunigt das Haarwachstum
  
# t-Test mit gepaarten Stichproben, da die selben Personen getestet wurden
# und die Proben deshalb voneinander abhängig sind. Zur Verwendung des t-test
#  muss die Normalverteilung und Varianzhomogenität der Daten erfüllt sein

# Prüfen auf Normalverteilung mir Kolmogorov-Smirnov Test:
# H0: Es liegt eine Normalverteilung vor
# H1: Es liegt keine Normalverteilung vor

ks.test(dataA, "pnorm", mean=mean(dataA), sd=sd(dataA))
# p-Wert ist 0.9919, H0 kann akzeptiert werden

ks.test(dataB, "pnorm", mean=mean(dataB), sd=sd(dataB))
# p-Wert ist 0.5946, H0 kann akzeptiert werden
# => A und B sind normalverteilt

# Prüfen auf Varianzhomogenität mit Ansari-Bradley Test:
# H0: Die Varianz der Datensätze ist gleich
# H1: Die Varianz der Datensätze ist nicht gleich

ansari.test(dataA-mean(dataA), dataB-mean(dataB))
# p-Wert ist 0.9766, H0 kann akzeptiert werden
# => A und B haben die gleiche Varianz

# Da die Bedingung auf Normalverteilung und Varianzhomogenität erfüllt sind,
# kann der t-Test verwendet werden.

t.test(dataA-dataB, var.equal = TRUE, alternative="less")
# p-Wert ist 0.228, H0 kann akzeptiert werden
# => Das Mittel beschleunigt nicht das Haarwachstum


# 2.b)
dataC <- na.omit(data[,6])
dataC

# Gleicher Aufbau wie bei 2.a), aber Verwendung von t-Test mit zwei Proben
ks.test(dataC, "pnorm", mean=mean(dataC), sd=sd(dataC))
# p-Wert ist 0.909 => C ist normalverteil
ansari.test(dataA-mean(dataA), dataC-mean(dataC))
# p-Wert ist 0.1702 => A und C haben gleiche Varianz

# t-Test für zwei Proben kann verwendet werden.
t.test(dataA, dataC, alternative="less")
# p-Wert is 0.6774 => das Mittel beschleunigt nicht das Haarwachstum

# Die Ergebnisse aus 2.a) sind relevanter, da hier mit den gleichen Personen
# getestet wurde und dadurch außerdem beide Proben die gleiche Anzahl an Daten
# haben. Bei 2.b) wurden verschiedenen Personen getestet, wodurch sich die
# Ergebnisse schon stärker unterscheiden könnten, dies lässt sich auch schon an
# p-Werten der Ansari-Bradley Tests erkennen. Außerdem ist die Anzahl von den
# Datensätzen bei C nur noch halb so groß wie die von A.


# 2.c)
for (i in 1:12) {
  tempA <- data[,3][data[,2] == i]
  tempB <- data[,4][data[,2] == i]
  pValue <- t.test(tempA-tempB, alternative="less")$p.value
  
  if(pValue < 0.05) {
    print(i)
    print(pValue)
  }
}

# Für Sternzeichen 4 und 9 zeigt das Mittel einen signifikanten Effekt.
# Die Marketing der Firma kann damit werben, das es statistisch bewiesen wurde,
# dass das Mittel für die Sternzeichen 4 und 9 wirkt. Als Wissenschaftler sollten
# die Ergebnisse angezweifelt werden, da offentsichtlich keine Kausalität zwischen
# dem Sternzeichen und der Wirksamkeit des Mittels vorliegt.
