#!/usr/bin/env python

# Project Euler - Problem 11
# What is the greatest product of four adjacent numbers in any 
# direction (up, down, left, right, or diagonally) in the 2020 grid?
#
# solution by nathan dotz
# nathan (period) dotz (at sign) gmail (period) com

GRID = []
MAXFOUND = 0

def fillGrid():
	infile = open("numbertable","r")
	for line in infile.readlines():
		grrList=[]
		for temp in line.split():
			grrList.append(int(temp))
		GRID.append(grrList)

def checkHoriz(x):
	global MAXFOUND, GRID
	for line in GRID:
		start = 0
		while start < x-3:
			#DEBUG print "Iteration: ", start+1
			thisRowProduct = 1
			for num in line[start:start+3]:
				thisRowProduct = thisRowProduct * num
			if thisRowProduct > MAXFOUND:
				MAXFOUND = thisRowProduct
				print "New Maximum found: ", MAXFOUND
			start = start + 1
	print "Horizontals checked"

def checkVert(x):
	global MAXFOUND, GRID
	checkColumn = 0
	while checkColumn < x:
		setStart = 0
		thisSetProduct = 1
		while setStart < x-3:
			#DEBUG print GRID[setStart][checkColumn], GRID[setStart+1][checkColumn], GRID[setStart+2][checkColumn], GRID[setStart+3][checkColumn]
			thisSetProduct = GRID[setStart][checkColumn] * GRID[setStart+1][checkColumn] * GRID[setStart+2][checkColumn] * GRID[setStart+3][checkColumn]
			if thisSetProduct > MAXFOUND:
				MAXFOUND = thisSetProduct
				print "New Maximum found: ", MAXFOUND
			setStart = setStart + 1
		checkColumn = checkColumn + 1
	print "Verticals checked"

def checkDiagRight(x):
	global GRID, MAXFOUND
	startRow = 0
	while startRow < x-3:
		startColumn = 0
		while startColumn < x-3:
			thisSetProduct = GRID[startRow][startColumn]*GRID[startRow+1][startColumn+1]*GRID[startRow+2][startColumn+2]*GRID[startRow+3][startColumn+3]
			if thisSetProduct > MAXFOUND:
				MAXFOUND = thisSetProduct
				print "New Maximum found: ", MAXFOUND
			startColumn = startColumn + 1
		startRow = startRow + 1
	print "Diagonal to the right checked"

def checkDiagLeft(x):
	global GRID, MAXFOUND
	startRow = 0
	while startRow < x-3:
		startColumn = 3
		while startColumn < x:
			thisSetProduct = GRID[startRow][startColumn]*GRID[startRow+1][startColumn-1]*GRID[startRow+2][startColumn-2]*GRID[startRow+3][startColumn-3]
			if thisSetProduct > MAXFOUND:
				MAXFOUND = thisSetProduct
				print "New Maximum found: ", MAXFOUND
			startColumn = startColumn + 1
		startRow = startRow + 1
	print "Diagonal to the left checked"


def outputMax():
	print "Final maximum product found was: ", MAXFOUND

#debug
fillGrid()
checkHoriz(20)
checkVert(20)
checkDiagRight(20)
checkDiagLeft(20)
outputMax()
