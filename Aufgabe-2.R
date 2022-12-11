input = c(180, 182, 182, 177, 175,185, 190, 179, 181, 178)
mean(input)
sd(input)
df <- 10-1

t_value <- ((mean(input) - 173) / (sd(input) / sqrt(10)))

# p-Wert
x = -(abs((mean(input) - 173)) / (sd(input) / sqrt(10)))
pt(x, df=df)



# Konfidenzintervall untere Grenze
mean(input) + qt(0.1,9)*sd(input)/sqrt(10)

# Kontrolle
t.test(input, mu=173, alternative="greater", conf.level = 0.9)
