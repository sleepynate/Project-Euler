#!/usr/bin/env python
#
# Project Euler - Problem 21
# Evaluate the sum of all the amicable numbers under 10000.
#
# solution by nathan dotz
# nathan (period) dotz (at sign) gmail (period) com
#

amicableSum = 0

def DivisorList(x):
	return [y for y in range(1,(x-2)) if not (x%y) ]

def DivisorSum(x):
	try:
		return reduce(lambda a,b:a+b, DivisorList(x))
	except:
		return 1

for i in range(1, 10001):
	if DivisorSum(DivisorSum(i)) == i and DivisorSum(i) != i:
		print i, DivisorList(i), "= ", DivisorSum(i)
		amicableSum += i
print amicableSum
