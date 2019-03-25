# Project Euler Problem 1
#
# If we list all the natural numbers below 10 that are multiples of 3 or 5
# we get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.
#
# solution by nathan dotz
# nathan (period) dotz (at sign) gmail (period) com
#

import unittest

class FizzBuzzTest(unittest.TestCase):
    def test_upto_4(self):
        """[1, 2, 3] -> [3]"""
        self.assertEqual(fizzbuzz(4), 3)

    def test_upto_5(self):
        """[1, 2, 3, 4] -> [3]"""
        self.assertEqual(fizzbuzz(5), 3)

    def test_upto_6(self):
        """[1, 2, 3, 4, 5] -> [3, 5]"""
        self.assertEqual(fizzbuzz(6), 8)


    def test_answer(self):
        self.assertEqual(fizzbuzz(1000), 233168)

def filter(x):
    return not x % 3 or not x % 5

def fizzbuzz(end):
    candidates = range(1, end)
    return sum([x for x in candidates if filter(x)])

if __name__ == '__main__':
    print("Sum of all multiples of 3 or 5 below 1000: ", fizzbuzz(1000))
