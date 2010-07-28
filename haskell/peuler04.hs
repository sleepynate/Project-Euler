{-
 - Project Euler - Problem 4
 - Find the largest palindrome made from the 
 - product of two 3-digit numbers.
 -
 - solution by nathan dotz
 - nathan (period) dotz (at sign) gmail (period) com
 -}
myMax = maximum [ x*y | x<-[100..999], y<-[100..999], show(x*y) == reverse (show(x*y)) ]
main = putStrLn $ "The largest palindrome made from the product of two 3-digit numbers is: " ++  show myMax
