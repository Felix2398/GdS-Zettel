def calc_mean(x):
    return sum(x) / len(x)


def calc_std(x, mean_x):
    s = 0
    for elem in x:
        s += (elem - mean_x) ** 2
    return (s / (len(x) - 1)) ** 0.5


def calc_cov(x, y, mean_x, mean_y):
    s = 0
    for i in range(len(x)):
        s += (x[i] - mean_x) * (y[i] - mean_y)
    return s / (len(x) - 1)


def find_function(x, y):
    mean_x = calc_mean(x)
    mean_y = calc_mean(y)
    std_x = calc_std(x, mean_x)
    std_y = calc_std(y, mean_y)
    cov = calc_cov(x, y, mean_x, mean_y)
    corr = cov / (std_x * std_y)

    m = corr * (std_y / std_x)
    b = mean_y - m * mean_x
    print(f"f(x) = {m:.4f}x + {b:.4f}")


data_x = [185, 189, 196, 172, 175, 165, 199, 168, 191, 180]
data_y = [75, 81, 85, 66, 68, 62, 89, 63, 80, 72]

find_function(data_x, data_y)
