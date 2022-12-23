#Aufgabe 1.a)
data <- matrix(c(12, 8, 17, 3), nrow=2,
               dimnames = list(Klausurergebnisse = c("Bestanden", "Nicht Bestanden"),
                                Geschlecht= c("Männlich", "Weiblich"))
              )

# Durchführung von Fisher Test
# H0: Keine Verbindung zwischen den zwei Variablen
# H1: Es besteht eine Verbindung zwischen den zwei Variablen
fisher.test(data)
# p-Wert ist 0.1552, H0 wird akzeptiert.
# => Es besteht keine Verbindung zwischen den Variablen, der Datensatz
# ermöglicht keine Aussage darüber ob Frauen besser sind als Männer.


# Aufgabe 1.c)
data2 <- matrix(c(120, 80, 170, 30), nrow=2,
               dimnames = list(Klausurergebnisse = c("Bestanden", "Nicht Bestanden"),
                               Geschlecht= c("Männlich", "Weiblich"))
                )

# Durchführung von Chi-Quadrat Test
# H0: Die beiden Variablen sind unabhängig
# H1: Die beiden Variablen sind nicht unabhängig
chisq.test(data2, correct = F)
# p-Wert ist 2.157e-08 => H1 wird akzeptiert
