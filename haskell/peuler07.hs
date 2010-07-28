{-
 - Project Euler - Problem 7
 - What is the 10001st Prime Number?
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

main = do
   putStrLn "The 10001st prime is :"
   putStrLn $ show (primes !! 10000)
        
