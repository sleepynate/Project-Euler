#
# Project Euler Problem 2
# Solution by nathan dotz - nathan (period) dotz (at sign) gmail (period) com
#
# Each new term in the Fibonacci sequence is generated by adding
# the previous two terms. By starting with 1 and 2, the first
# 10 terms will be:
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
# 
# Find the sum of all the even-valued terms in the sequence
# which do not exceed four million.
#

def fibs():
    a = b = 1
    while True:
        yield a
        a, b = b, a + b

def max_test(y): return y <= 4000000

import itertools
print "Sum of all even fibonacci numbers below 4 million is: ",sum(x for x in itertools.takewhile(max_test, fibs()) if not x%2)