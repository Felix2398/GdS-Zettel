import statistics

age_list = []
km_list = []


def calculate_values(data_list):
    mean = statistics.mean(data_list)
    median = statistics.median(data_list)
    variance = statistics.variance(data_list)
    standard_deviation = statistics.pstdev(data_list)
    variation = standard_deviation / mean
    modal = statistics.multimode(data_list)

    return f"Mittelwert: {round(mean, 2)}\n" \
           f"Median: {round(median, 2)}\n" \
           f"Varianz: {round(variance, 2)}\n" \
           f"Standartabweichung: {round(standard_deviation,2)}\n" \
           f"Variationskoeffizient: {round(variation, 2)}\n" \
           f"Modalwert D: {modal}\n"


with open("data/Data_Exercise_1.txt") as file:
    next(file)
    for line in file:
        line = line.replace("\n", "")
        temp_list = line.split("\t")
        age_list.append(int(temp_list[0]))
        km_list.append(float(temp_list[1]))

print("Alter\n" + calculate_values(age_list))
print("Km\n" + calculate_values(km_list))
