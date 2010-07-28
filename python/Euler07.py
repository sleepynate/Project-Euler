#!/usr/bin/env python

# Project Euler - Problem 07
# Solution by nathan (dot) dotz (at) gmail (dot) com
# 
# what is the 10001st prime number

primeList = [2,3]

def genPrime():
    seed = primeList[-1] + 2
    while True:
        for p in primeList:
            if seed % p == 0:
                seed += 2
                break
            if p == primeList[-1] or p > seed ** .5 :
                primeList.append(seed)
                return 
