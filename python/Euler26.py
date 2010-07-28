#!/usr/bin/env python

# Project Euler - Problem 26
# Find the value of d  1000 for which 1/d contains the longest
# recurring cycle in its decimal fraction part.
#
# solution by nathan dotz
# nathan (period) dotz (at sign) gmail (period) com


def repLength(n):
	#assume it won't be divisble evenly by 2, 3 or 5
	if not n%2 or not n%3 or not n%5 or not n%7 or not n%11: return 0 
	length = 1
	while True:
		if (pow(10, length)-1) % n == 0:
			return length
		else:
			length += 1

MaxLengthDenom = 0
MaxLengthDigits = 0
for d in xrange(1,1000):
	temp = repLength(d)
	if temp > MaxLengthDigits: MaxLengthDenom, MaxLengthDigits = d,temp

print "1/%d"%MaxLengthDenom, "has a repetition length of", MaxLengthDigits
