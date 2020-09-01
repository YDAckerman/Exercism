module Triangle (rows) where

import Data.List (iterate)

rows :: Int -> [[Integer]]
rows 0 = []
rows n = take n $ iterate nextPascal [1]
  
nextPascal :: [Integer] -> [Integer]
nextPascal xs = zipWith (+) ([0] ++ xs) (xs ++ [0])
