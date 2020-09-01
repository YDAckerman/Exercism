 {-# LANGUAGE UnicodeSyntax #-}

module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
  | n <= 0 = Nothing
  | otherwise = Just $ collatzCounter n 0 

collatzCounter :: Integer -> Integer -> Integer
collatzCounter 1 k = k
collatzCounter n k
  | r == 0 = collatzCounter q (k + 1)
  | otherwise = collatzCounter (3 * n + 1) (k + 1)
  where
    (q,r) = quotRem n 2






