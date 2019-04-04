# Project Euler - Problem 4
# Find the largest palindrome made from the
# product of two 3-digit numbers.
#
# solution by nathan dotz
# nathan (period) dotz (at sign) gmail (period) com
#

import unittest

class PalindromTest(unittest.TestCase):

    def test_can_check_palindrome_number(self):
        self.assertTrue(is_palindrome(111))
        self.assertFalse(is_palindrome(112))

        self.assertTrue(is_palindrome(989))
        self.assertFalse(is_palindrome(998))

def is_palindrome(n):
    return str(n) == str(n)[::-1]

if __name__ == "__main__":
    palindromes = [x*y
                   for x in range(111,1000)
                   for y in range(111,1000)
                   if is_palindrome(x*y)]
    print("The largest palindrome that's the product of two 3-digit numbers is", max(palindromes))
