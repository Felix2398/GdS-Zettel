# Aufgabe 1
data <- read.csv("Elektronik.csv", sep = ";")
attach(data)
data0T <- data[,2]
data1T <- data[,3]


# 1.a)
# Für 0T
hist(data0T)
qqnorm(data0T)
qqline(data0T)

#Für 1T
hist(data1T)
qqnorm(data1T)
qqline(data1T)

# Nach den erstellten Histogrammen und QQ-Plots handelt es sich bei beiden
# Verteilungen um keine Normalverteilungen


# 1.b)
# Durchführung der Kolmogorov-Smirnov Tests
ks.test(data0T, "pnorm", mean=mean(data0T), sd=sd(data0T))
ks.test(data1T, "pnorm", mean=mean(data1T), sd=sd(data1T))
# Laut dem Test handelt es sich um eine Normalverteilung, wenn der p-Wert
# größer als 0.05 ist. Dies ist hier für 0T und 1T nicht erfüllt, weshalb es
# sich um keine Normalverteilung handelt.


# 1.c)
t.test(data0T, data1T)
# Nach dem t-Test weichen die Verteilungen nicht voneinander ab
# Der t-Test kann hier aber nicht aussagekräftig angewendet werden, da die Daten
# Normalverteil sein müssen, damit der Test sinnvoll durchgeführt werden kann.