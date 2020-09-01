module Grains (square, total) where

square :: Integer -> Maybe Integer
square x
  | x <= 0 || x > 64 = Nothing
  | otherwise = Just (2^(x - 1))


total :: Integer
total = -(1 - (2^64))
