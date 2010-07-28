{-
 - Project Euler #14
 - nathan (dot) dotz (at) gmail (dot) com
 - 
 - Which starting number of Collatz sequence under 
 - 1 million has the longest chain until you get to 1?
 -}
import Data.List

half :: Integer -> Integer
half x = quot x 2

increase :: Integer -> Integer
increase x = 3*x + 1

collatz :: Int -> Integer -> (Int,Integer)
collatz acc x = if x == 1 
                then (acc,x)
                else 
      collatz (1+acc) (if even x 
                        then half x 
                        else increase x) 

colList :: Integer -> [(Int,Integer)]
colList y = map (collatz 1 ) [870000..y]

comp x y = if fst x > fst y then x else y

main = do
   putStrLn . show $ colList 900000 -- foldl (comp) $ colList 900000

