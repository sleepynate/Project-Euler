{-
 - Project Euler Problem 3
 - Solution by nathan dotz - nathan (period) dotz (at sign) gmail (period) com
 -
 - What is the largest prime factor of the number 600851475143 ?
 -}
bignum = 600851475143
divisors = [x|x<-[3,5..(floor(sqrt(fromIntegral(bignum))) `div` 6)], bignum`mod`x==0 ]
answer = last ([ x | x <- divisors, x> 1 && (all (\n -> x `mod` n /= 0 ) $ takeWhile (\n -> n*n <= x) [2..]) ])
main = putStrLn $ "The largest prime factor of " ++ show bignum ++ " is " ++ show answer
