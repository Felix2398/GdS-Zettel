# 1.b)
data = read.csv("systolic.csv", header=TRUE, sep=";", dec=",")
attach(data)

# 1.c)
bd = as.numeric(data[["Blutdruck"]])
hist(bd)
mean(bd)
sd(bd)

# 1.d)
t.test(bd, mu=17)
# H1: Der Blutdruck in der behandelten Gruppe unterscheidet sich von der Kontrollgruppe
# Da der p-Wert mit 0.02837 kleiner als das Signifikanzlevel von 0.05 ist, sollte H0 abgelehnt werden

# 1.e)
t.test(bd, mu=17, conf.level=0.99)
# Da der p-Wert mit 0.02837 größer als das Signifikanzlevel von 0.01 ist, sollte H0 nicht abgelehnt werden

# 1.f)
t.test(bd, mu=17, alternative="less")
# H1: Der Blutdruck in der behandelten Gruppe ist niedriger als in der Kontrollgruppe”.
# Da der p-Wert mit 0.01419 kleiner als das Signifikanzlevel von 0.05 ist, sollte H0 abgelehnt werden

# 1.g)
t.test(bd, mu=17, alternative="greater")
# H1: Der Blutdruck in der behandelten Gruppe ist höher als in der Kontrollgruppe”.
# Da der p-Wert mit 0.9858 größer als das Signifikanzlevel von 0.05 ist, sollte H0 nicht abgelehnt werden

