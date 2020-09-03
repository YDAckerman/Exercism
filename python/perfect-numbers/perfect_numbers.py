def classify(number):

    if number in [0,-1]:
        raise ValueError("Must provide a non-zero natural number")
    
    s = 0
    for n in range(1, number):
        if number % n == 0:
            s += n
            
    if s == number:
        return "perfect"
    if s > number:
        return "abundant"
    if s < number:
        return "deficient"
