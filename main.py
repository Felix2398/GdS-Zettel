import random
from scipy.stats import binom
import matplotlib.pyplot as plt


n = 10
repetitions = 100
p = float(input("Enter a probability between 0 and 1: "))
r_values = list(range(n + 1))
dist = [binom.pmf(r, n, p) for r in r_values]
results = [0.0] * (n + 1)

for i in range(repetitions):
    counter = 0
    for j in range(n):
        if random.uniform(0, 1) < p:
            counter += 1
    results[counter] += 1

print(results)
results = [(value / repetitions) for value in results]

plt.bar(r_values, results)
plt.scatter(r_values, dist)
plt.ylabel("probability")
plt.show()
