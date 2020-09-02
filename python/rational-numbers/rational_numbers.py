from __future__ import division
from math import gcd

class Rational:
    def __init__(self, numer, denom):
        my_gcd = gcd(int(numer), int(denom))
        sign = self.getSign(numer, denom)
        self.numer = sign * int(numer / my_gcd)
        self.denom = sign * int(denom / my_gcd)

    def __eq__(self, other):
        return self.numer == other.numer and self.denom == other.denom

    def __repr__(self):
        return '{}/{}'.format(self.numer, self.denom)

    def __add__(self, other):
        new_numer = self.numer * other.denom + other.numer * self.denom
        new_denom = self.denom * other.denom
        new_gcd = gcd(new_numer, new_denom)
        return Rational(int(new_numer / new_gcd), int(new_denom / new_gcd))

    def __sub__(self, other):
        new_numer = self.numer * other.denom - other.numer * self.denom
        new_denom = self.denom * other.denom
        new_gcd = gcd(new_numer, new_denom)
        return Rational(int(new_numer / new_gcd), int(new_denom / new_gcd))

    def __mul__(self, other):
        new_numer = self.numer * other.numer
        new_denom = self.denom * other.denom
        new_gcd = gcd(new_numer, new_denom)
        new_sign = self.getSign(new_numer, new_denom)
        return Rational(new_sign * int(new_numer / new_gcd),
                        new_sign * int(new_denom / new_gcd))

    def __truediv__(self, other):
        new_numer = self.numer * other.denom
        new_denom = self.denom * other.numer
        new_gcd = gcd(new_numer, new_denom)
        new_sign = self.getSign(new_numer, new_denom)
        return Rational(new_sign * int(new_numer / new_gcd),
                        new_sign * int(new_denom / new_gcd))

    def __abs__(self):
        new_numer = self.numer
        if new_numer < 0:
            new_numer = -1 * new_numer

        new_denom = self.denom
        if new_denom < 0:
            new_denom = -1 * new_denom

        return Rational(new_numer, new_denom)

    def __pow__(self, power):
        if power == 0:
            return Rational(1,1)
        new_numer = self.numer
        new_denom = self.denom
        for i in range(1,power):
            new_numer = new_numer * self.numer
            new_denom = new_denom * self.denom
        return Rational(new_numer, new_denom)

    def __rpow__(self, base):
        return (base ** self.numer) ** (1/self.denom)

    def getSign(self, numer, denom):
        if numer < 0 and denom < 0:
            return -1
        elif numer > 0 and denom < 0:
            return -1
        else :
            return 1

def main():
    print(Rational(-1,2) / Rational(-2,3))
    
if __name__ == '__main__':
    main()
