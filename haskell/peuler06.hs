{-
 - Project Euler - Problem 6
 - Find the difference between the sum of the squares of the 
 - first one hundred natural numbers and the square of the sum.
 -
 -
 -}

-- find the sum of the squares of the numbers 1..n
sumOfSquares :: Integer -> Integer
sumOfSquares n = sum $ map (\x -> x*x) [1..n]

-- find the square of a sum
squareOfSum :: Integer -> Integer
squareOfSum n = sum [1..n] ^ 2 

main = do
   putStrLn "Find the difference between sum squares and the square of sum "
   putStrLn "From 1 to :"
   a <- getLine
   putStrLn " "
   putStrLn . show $ abs (sumOfSquares(read a) - squareOfSum(read a))
