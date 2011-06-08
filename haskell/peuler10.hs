{-
 - Project Euler - Problem 10
 - Find the sum of all primes below 2 million
 -
 - solution by nathan dotz
 - nathan (period) dotz (at sign) gmail (period) com
 -}

primes :: [Integer]
primes = 2:filter isPrime [3,5..]
   where
      isPrime n   = all (not . divides n) $ takeWhile (\p -> p*p <= n) primes
      divides n p = n `mod` p == 0

prsum :: Integer -> Integer
prsum n = foldl1 (+) $ takeWhile (\p -> p < n) primes

main = do
   putStrLn $ "The sum of all primes below 2 million is: " ++ show (prsum 2000000)
