{-
 - Project Euler - Problem 11
 - What is the greatest product of four adjacent numbers in any 
 - direction (up, down, left, right, or diagonally) in the 2020 grid?
 -
 - solution by nathan dotz
 - nathan (period) dotz (at sign) gmail (period) com
 -}

import IO

maxHoriz g :: [[String]] -> Int
maxHoriz = max maxHRow g

maxHRow g :: [String] -> Int
maxHRow r = max [ r!!n * r!!n+1 * r!!n+2 * r!!n+3 | n <- [0..17]]

split :: Char -> String -> [String]
split delim [] = [""]
split delim (c:cs)
   | c == delim = "" : rest
   | otherwise = (c : head rest) : tail rest
   where
      rest = split delim cs 

main = do
   fHan <- readFile "numbertable" 
   let grid = lines fHan
   let sgrid = map (split ' ') grid
   mapM_ (mapM_ putStrLn) sgrid
