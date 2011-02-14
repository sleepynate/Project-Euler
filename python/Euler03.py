#
# Project Euler Problem 3
# Solution by nathan dotz - nathan (period) dotz (at sign) gmail (period) com
#
# What is the largest prime factor of the number 600851475143 ?
import math

bignum = 600851475143

def prime_factors(x):
    top = int(math.sqrt(x))
    for i in range(2,top):
        while x % i == 0:
            x = x/i
            yield i 

print "The largest prime factor of", bignum,"is",reduce(lambda x,y:y, prime_factors(bignum))
