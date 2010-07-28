{-
 - Project Euler Problem 13
 - solution by nathan (dot) dotz (at) gmail (dot) com
 -
 - find the first 10 digits of the sum of 100 50-digit numbers.
 -}

import Char

toInt x = (read x)::Integer

main = do
   inStr <- readFile "src.peuler13.txt"
   putStrLn $ take 10 . show . sum $ map toInt (lines inStr)
