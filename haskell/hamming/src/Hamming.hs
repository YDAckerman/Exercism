module Hamming (distance) where

import Data.Char (Char)

distance :: String -> String -> Maybe Int
distance xs ys  
  | length xs /= length ys = Nothing
  | otherwise = Just $ foldl myCompare 0 $ zip xs ys

myCompare :: Int -> (Char, Char) -> Int
myCompare z (x, y)
  | x == y = 0 + z
  | otherwise = 1 + z
