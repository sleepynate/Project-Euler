# Project Euler Problem 3
# Solution by nathan dotz - nathan (period) dotz (at sign) gmail (period) com
#
# What is the largest prime factor of the number 600851475143 ?
import math
import unittest
import operator
from functools import reduce

class PrimeFactorsTests(unittest.TestCase):

    def test_largest_prime_factor_of_2(self):
        self.assertEqual(list(prime_factors(2)), [2])

    def test_largest_prime_factor_of_3(self):
        self.assertEqual(list(prime_factors(3)), [3])

    def test_largest_prime_factor_of_4(self):
        self.assertEqual(list(prime_factors(4)), [2,2])

    def test_largest_prime_factor_of_5(self):
        self.assertEqual(list(prime_factors(5)), [5])

    def test_largest_prime_factor_of_6(self):
        self.assertEqual(list(prime_factors(6)), [2,3])

    def test_largest_prime_factor_of_8(self):
        self.assertEqual(list(prime_factors(8)), [2,2,2])

    def test_largest_prime_factor_of_21(self):
        self.assertEqual(list(prime_factors(21)), [3,7])

    def test_largest_prime_factor_of_49(self):
        self.assertEqual(list(prime_factors(49)), [7,7])

bignum = 600851475143

def prime_factors(x):
    top = math.ceil(math.sqrt(x))
    for i in range(2,top + 1):
        while x % i == 0:
            x = x/i
            yield i
    if x > 1:
        yield x

if __name__ == "__main__":
    print("The largest prime factor of", bignum,"is",reduce(lambda x,y:y, prime_factors(bignum)))
