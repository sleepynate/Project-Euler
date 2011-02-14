#
# Project Euler - Problem 4
# Find the largest palindrome made from the 
# product of two 3-digit numbers.
#
# solution by nathan dotz
# nathan (period) dotz (at sign) gmail (period) com
#

print "The largest palindrome that's the product of two 3-digit numbers is", \
        max( [x*y 
            for x in xrange(111,1000)
            for y in xrange(111,1000)
            if str(x*y) == str(x*y)[::-1] ]
            )
