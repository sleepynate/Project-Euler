{-
 - Project Euler -- Problem 9
 - There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 - Find the product abc.
 -
 - solution by nathan dotz
 - nathan (period) dotz (at sign) gmail (period) com
 -}

 -- Find the pythagorean triplet for a final number 'x',
 -- searching up as far as 's' for Euclid's 'm' and 'n'
pythTrip :: Int -> Int -> (Int,Int,Int)
pythTrip x s =
   if tripList == []
      then (0,0,0)
      else head tripList
   where tripList = [ (a,b,c) | n <- [1..s]
                     , m <- [n..s]
                     , let a = 2*m*n
                     , let b = m^2 - n^2
                     , let c = m^2 + n^2
                     , a+b+c == x ]
main = do
   let (a,b,c) = pythTrip 1000 20
   putStrLn $ "The pythagorean triplet whose sum a+b+c = 1000 is ("
      ++ show(a) ++ ", " ++ show(b) ++", "++ show(c) ++")"
   putStrLn $ "The product of a*b*c = " ++ show ( a*b*c )
