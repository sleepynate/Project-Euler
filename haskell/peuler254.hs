import Char

fac :: Int -> Int
fac 0 = 1
fac n = foldl (*) 1 [1..n]

digHead :: Int -> Int
digHead n = read [head (show n)]::Int

digTail :: Int -> Int
digTail n = read(tail (show n))::Int

f :: Int -> Int -- sum of the factorials of digits of n
f n = if n < 10 then n else fac (digHead n) + f (digTail n)

sf :: Int -> Int -- sum of the digits of f(n)
sf n = sum (map (digitToInt) (show (f n)))
