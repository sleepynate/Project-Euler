{-
- Project Euler - Problem 21
- Evaluate the sum of all the amicable numbers under 10000.
-
- solution by nathan dotz
- nathan (period) dotz (at sign) gmail (period) com
-}
divisorlist :: Int -> [Int]
divisorlist y = [ x:z | x <- [1..upTo], z <- fromIntegral, y `mod` x == 0 ]
   where upTo = floor . sqrt $ fromIntegral y
