{-
 - Project Euler - Problem 5
 -
 - 2520 is the smallest number that can be divided by 
 - each of the numbers from 1 to 10 without any remainder.
 - What is the smallest number that is evenly divisible
 - by all of the numbers from 1 to 20?
 -
 - solution by nathan dotz
 - nathan (period) dotz (at sign) gmail (period) com
 -}

main = putStrLn $ "The smallest number that is evenly divisible by all the numbers from 1 to 20 is " ++ show ( foldl lcm 1 [2..20] )
