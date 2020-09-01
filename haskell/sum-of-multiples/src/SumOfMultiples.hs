module SumOfMultiples (sumOfMultiples) where

import Data.Set (singleton, fromList, unions)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ traverse f factors
  where
    f 0 = singleton 0
    f n = fromList [n, 2*n .. (limit - 1)]



