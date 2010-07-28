#!/usr/bin/env python

# Project Euler - Problem 18 and 67
# Find the maximum total from top to bottom in a triangle
#
# solution by nathan dotz
# nathan (period) dotz (at sign) gmail (period) com


class TriangleSolver:
	def __init__(self, inD=[]):
		self.setTriangle(inD)
	
	def setTriangle(self, inD=[]):
		self.triangle = inD
	
	def solve(self):
		triangle = self.triangle
		i = triangle.__len__()-2
		while i >= 0:
			for j in range(i+1):
				triangle[i][j] = triangle[i][j] + max(triangle[i+1][j], triangle[i+1][j+1])
			i = i-1
		return triangle[0][0]
	#end of solve()
	
	def show(self):
		i = self.triangle.__len__()
		for list in self.triangle:
			print "   "*i,
			for item in list:
				if item < 10:
					print ' ',
				print item,
				if list[-1] != item:
					print ", ",
			print
			i = i-1

# end of class TriangleSolver

if __name__ == '__main__':
	inData = []
	f = file("triangle.txt",'r')
	for line in f:
		tempLine = line.split()
		tempLine = map(int, tempLine)
		inData.append(tempLine)
	triangle = TriangleSolver(inData)
	print "Max path through is: ", triangle.solve()
