import csv
import random


def get_input():
    n = input("What is N: ")
    dist = input("What is the distribution? \"n\" for normal, \"u\" for uniform and \"e\" for exponential: ")
    value_1 = ""
    value_2 = ""

    if dist == "n":
        value_1 = input("What is the mean of the normal distribution: ")
        value_2 = input("What is the standard deviation of the normal distribution: ")
    elif dist == "u":
        value_1 = input("What is the min value of the uniform distribution: ")
        value_2 = input("What is the max value of the uniform distribution: ")
    elif dist == "e":
        value_1 = input("What is the lambda of the exponential distribution: ")
        value_2 = "0"
    else:
        print("Error")

    id = input("Should an id be added (y/n): ")
    header = input("Should an header be added (y/n): ")

    return n + " " + dist + " " + value_1 + " " + value_2 + " " + id + " " + header


def generate_normal(n, mean, sd):
    return [random.normalvariate(mean, sd) for _ in range(n)]


def generate_uniform(n, min_v, max_v):
    return [random.uniform(min_v, max_v) for _ in range(n)]


def generate_expo(n, lam):
    return [random.expovariate(lam) for _ in range(n)]


def parse_input(string):
    numbers = []
    res = []
    parts = string.split()
    if len(parts) < 4:
        parts.append(0)

    n = int(parts[0])
    distribution = parts[1]
    value_1 = float(parts[2])
    value_2 = float(parts[3])
    id = parts[4]
    header = parts[5]

    if distribution == "n":
        numbers = generate_normal(n, value_1, value_2)
    elif distribution == "u":
        numbers = generate_uniform(n, value_1, value_2)
    elif distribution == "e":
        numbers = generate_expo(n, value_1)
    else:
        print("Error")

    if header == "y":
        res.append(["Id", "Values"])

    if id == "y":
        for i in range(n):
            res.append([i + 1, numbers[i]])
    else:
        for i in range(n):
            res.append([numbers[i]])

    return res


def create_csv(list_of_rows):
    with open('output.csv', 'w', newline='') as f:
        writer = csv.writer(f)
        writer.writerows(list_of_rows)


input_string = get_input()
list_of_entries = parse_input(input_string)
create_csv(list_of_entries)

print(list_of_entries)



