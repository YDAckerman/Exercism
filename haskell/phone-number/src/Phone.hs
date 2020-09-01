module Phone (number) where

import Data.Char (isNumber)

number :: String -> Maybe String
number xs = f xs
  where
    f = checkEC . checkAC . pullCC . filter isNumber

pullCC :: String -> String
pullCC all@(x:xs)
  | length all == 10 = all
  | length all == 11 && x == '1' = xs
  | otherwise = replicate 6 ' '

checkAC :: String -> String
checkAC xs
  | xs!!0 `elem` "23456789" = xs
  | otherwise = replicate 6 ' '

checkEC :: String -> Maybe String
checkEC xs
  | xs!!3 `elem` "23456789" = Just xs
  | otherwise = Nothing




 
