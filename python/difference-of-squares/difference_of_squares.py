def square_of_sum(n):
    return round((n * (n+1) / 2)**2)


def sum_of_squares(n):
    return round((n**3)/3 + (n**2)/2 + n/6)


def difference_of_squares(n):
    return square_of_sum(n) - sum_of_squares(n)
