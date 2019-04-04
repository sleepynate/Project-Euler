# Project Euler - Problem 5
#
# 2520 is the smallest number that can be divided by each of the
# numbers from 1 to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all
# of the numbers from 1 to 20?
#
# solution by nathan dotz
# nathan (period) dotz (at sign) gmail (period) com
#

import unittest
from fractions import gcd

class EvenlyDivisibleTest(unittest.TestCase):

    def test_smallest_divisible_up_to_ten(self):
        self.assertEqual(2520, smallest_divisble_by(1,10))

    def test_can_find_lcm(self):
        self.assertEqual(lcm(54, 24), 216)

def lcm(x,y):
    return abs(x * y) / gcd(x, y) if x and y else 0

def smallest_divisble_by(low, high):
    lowest = low
    for i in range(low+1, high):
        lowest = lcm(lowest, i)

    return lowest

if __name__ == "__main__":
    s = smallest_divisble_by(1, 20)
    print("The smallest number evenly divisible by all the numbers from 1 to 20 is ", s)
