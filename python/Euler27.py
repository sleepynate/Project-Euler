#!/usr/bin/env python

# Project Euler - Problem 27
# Find the product of the coefficients, a and b, for the quadratic 
# expression that produces the maximum number of primes for consecutive
# values of n, starting with n = 0
#
# solution by nathan dotz
# nathan (period) dotz (at sign) gmail (period) com

def isPrime(x):
	if x < 0: x=-x
	if x==2 or x==3 or x==5 or x==7 or x==11: return True
	if not x%2 or not x%3 or not x%5 or not x%7 or not x%11 or x < 2: return False
	for divisor in xrange(2,int(x**0.5)):
		if not x % divisor: return False
	return True

MPQ = { 'a':0, 'b':0, 'primes':0 }

for a in xrange(-999,1000):
	for b in xrange(1,1000):
		if not isPrime(b):
			continue
		n=0
		while isPrime( n*n + a*n + b):
			n+=1
		if n > MPQ['primes']:
			MPQ['primes']=n
			MPQ['a']=a
			MPQ['b']=b

print "a=",MPQ['a']
print "b=",MPQ['b']
print "has",MPQ['primes'],"primes"
print "a*b=",MPQ['a']*MPQ['b']
