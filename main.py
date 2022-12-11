import numpy as np

count = 0

for i in range(1000):
    numbers = np.random.normal(180, 10, 100)
    mean = np.mean(numbers)
    if mean < 178:
        count += 1

print(count)