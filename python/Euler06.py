# Project Euler - Problem 6

# The sum of the squares of the first ten natural numbers is,
# 1^2 + 2^2 + ... + 10^2 = 385
#
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)^2 = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural
# numbers and the square of the sum is 3025 − 385 = 2640.
#
# Find the difference between the sum of the squares of the first one hundred
# natural numbers and the square of the sum.

import unittest

class SumOfSquaresTest(unittest.TestCase):
    """Tests for Sum of squares problem"""

    def test_can_find_sum_of_squares(self):
        self.assertEqual(sum_of_squares(1, 10), 385)

    def test_can_find_square_of_sum(self):
        self.assertEqual(square_of_sum(1, 10), 3025)

def sum_of_squares(start, end):
    return sum(map(lambda i: i ** 2, range(start, end + 1)))

def square_of_sum(start, end):
    return sum(range(start, end + 1)) ** 2

if __name__ == '__main__':
    n = abs(sum_of_squares(1, 100) - square_of_sum(1, 100))
    print("The difference between the sum of squares and the square of the sum from 1-100 is ", n)
