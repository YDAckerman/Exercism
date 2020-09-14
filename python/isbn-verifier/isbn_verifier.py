import re

def checkChar(x):
    if x == "X":
        return 10
    else:
        return int(x)

def is_valid(isbn):
    isbn = re.sub("-", "", isbn)[::-1]

    if len(isbn) != 10:
        return False

    if isbn[0] in "0123456789X":
        tot = checkChar(isbn[0])
    else:
        return False

    for i in range(2,11):
        c = isbn[i - 1]
        if c in "0123456789":
            tot += checkChar(c) * i
        else:
            return False

    if tot % 11 == 0:
        return True
    else:
        return False
