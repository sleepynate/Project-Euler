#!/usr/bin/env python

# Project Euler - Problem 23
# Find the sum of all the positive integers which cannot be 
# written as the sum of two abundant numbers.
#
# solution by nathan dotz
# nathan (period) dotz (at sign) gmail (period) com
#

def isAbundant(n):
	if sum( [ i for i in range(1,n) if n%i==0 ] ) > n:
		return True
	else:
		return False

result =0
numbers = [ n for n in range (1,28124) ]
abundants = []
for i in numbers:
	result += i
	if isAbundant(i):
		abundants.append(i)

i=0
while i<len(abundants):
	j=i
	while  j<len(abundants):
		index=abundants[i]+abundants[j]-1
		if index < len(numbers):
			result -= numbers[index]
			numbers[index] = 0
		j+=1
	i+=1

print result
