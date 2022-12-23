# 2.b)
x <- c(185, 189, 196, 172, 175, 165, 199, 168, 191, 180)
y <- c(75, 81, 85, 66, 68, 62, 89, 63, 80, 72)

# H0: Die Variablen sind von einander unabhängig
# H1: Es besteht eine Abhängigkeit zwischen den Variablen
cor.test(x,y)
# Korrelationskoeffiziente ist 0.9936803
# p-Wert ist 6.926e-09 => H1 wird akzeptiert, das Ergebnis ist signifikant


# 2.c)
plot(x, y)

# 2.d)
lm(y ~ x)
