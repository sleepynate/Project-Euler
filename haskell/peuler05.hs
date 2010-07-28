-- What is the smallest number that is evenly divisible
-- by all of the numbers from 1 to 20?

main = putStrLn $ "The smallest number that is evenly divisible by all the numbers from 1 to 20 is " ++ show ( foldl lcm 1 [2..20] )
