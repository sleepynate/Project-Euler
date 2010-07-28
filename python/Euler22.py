#!/usr/bin/env python

# Project Euler - Problem 22
# Using names.txt, begin by sorting it into alphabetical order. 
# Then working out the alphabetical value for each name, multiply 
# this value by its alphabetical position in the list to obtain a name score.
#
# solution by nathan dotz
# nathan (period) dotz (at sign) gmail (period) com
#


import string # for string.ascii_uppercase... i'm lazy

def getValue(aStr):
    aSum = 0
    for letter in aStr:
        for value, char in zip(range(1,27), string.ascii_uppercase):
            if char == letter:
                # print(char,"=",value)
                aSum += value
    return aSum

f = open ("names.txt", 'r')
names = [ name.strip('"' for name in f.read().split(',') ]
names = sorted(names)

superTotal=0
for iterCount,name in enumerate(names):
	superTotal += (iterCount+1)*getValue(name)
print(superTotal)
