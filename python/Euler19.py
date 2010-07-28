#!/usr/bin/env python
#
# Project Euler - Problem 19
# How many Sundays fell on the first of the month during the
# twentieth century
#
# solution by nathan dotz
# nathan (period) dotz (at sign) gmail (period) com
#

import commands

output = []

def firstNum(x):
	sundays = []
	try:
		sundays.append(int(x[0:3]))
	except:
		sundays.append(0)
	try:
		sundays.append(int(x[22:25]))
	except:
		sundays.append(0)
	try:
		sundays.append(int(x[44:47]))
	except:
		sundays.append(0)
	return sundays

def fillList(aList, startYear, endYear):
	for i in range(startYear,endYear):
		for line in commands.getoutput('cal '+str(i)).split('\n'):
			aList.append(firstNum(line))

fillList(output, 1901, 2001)
foundSundays=0
for set in output:
	for num in set:
		if num is 1:
			foundSundays+=1
print "There are", foundSundays, "Sundays in the 20th secntury"
