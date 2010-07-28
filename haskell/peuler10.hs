{-
 - Project Euler - Problem 10
 - Find the sum of all primes below 2 million
 -
 - solution by nathan dotz
 - nathan (period) dotz (at sign) gmail (period) com
 -}

isPrime n = n > 1 && n == head (primeFactors n)
 
primeFactors 1 = []
primeFactors n = go n primes
   where go n ps@(p:pt)
            | p*p > n        = [n]
            | n `rem` p == 0 = p : go (n `quot` p) ps
            | otherwise      = go n pt

primes :: [Integer]
primes = 2:filter isPrime [3,5..]
   where
      isPrime n   = all (not . divides n) $ takeWhile (\p -> p*p <= n) primes
      divides n p = n `mod` p == 0

prsum :: Integer -> Integer
prsum n = foldl1 (+) $ takeWhile (\p -> p < n) primes

main = do
   putStrLn $ "The sum of all primes below 2 million is: " ++ show (prsum 2000000)
