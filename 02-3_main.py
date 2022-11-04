import random
import math


def approximate_pi(n):
    counter = 0
    i = n
    while i > 0:
        x = random.uniform(-1, 1)
        y = random.uniform(-1, 1)
        if math.sqrt(math.pow(x, 2) + math.pow(y, 2)) <= 1:
            counter += 1
        i -= 1
    return counter / n * 4


print(approximate_pi(10000))
print(approximate_pi(100000))
