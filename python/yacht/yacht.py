"""
This exercise stub and the test suite contain several enumerated constants.

Since Python 2 does not have the enum module, the idiomatic way to write
enumerated constants has traditionally been a NAME assigned to an arbitrary,
but unique value. An integer is traditionally used because it’s memory
efficient.
It is a common practice to export both constants and functions that work with
those constants (ex. the constants in the os, subprocess and re modules).

You can learn more here: https://en.wikipedia.org/wiki/Enumerated_type
"""

from numpy import unique

# Score categories.
# Change the values as you see fit.
YACHT = 0
ONES = 1
TWOS = 2
THREES = 3
FOURS = 4
FIVES = 5
SIXES = 6
FULL_HOUSE = 7
FOUR_OF_A_KIND = 8
LITTLE_STRAIGHT = 9
BIG_STRAIGHT = 10
CHOICE = 11


def score(dice, category):
    counts = getCounts(dice)
    if category == YACHT and 5 in counts:
        return 50
    if category in range(1,7):
        return category * counts[category-1]
    if category == FULL_HOUSE and all([x in counts for x in [3,2]]):
        return sum([i * counts[i-1] for i in range(0,7)])
    if category == FOUR_OF_A_KIND and (4 in counts or 5 in counts):
        return sum([i for i in range(0,7) if counts[i-1] in [4,5]]) * 4
    if category == LITTLE_STRAIGHT and counts == [1,1,1,1,1,0]:
        return 30
    if category == BIG_STRAIGHT and counts == [0,1,1,1,1,1]:
        return 30
    if category == CHOICE:
        return sum(dice)
    return 0

def getCounts(dice):
    counts = [0,0,0,0,0,0]
    for i in dice:
        counts[i-1] = counts[i-1] + 1
    return counts
