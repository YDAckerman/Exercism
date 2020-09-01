module Anagram (anagramsFor) where

import Data.Char (toLower)

charCounter :: Char -> String -> Int
charCounter c xs = length (filter (== lc) lxs)
  where
    lc = toLower c
    lxs = map toLower xs

wordToCount :: String -> [Int]
wordToCount xs = [charCounter c xs | c <- ['a'..'z']] 
       
anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = [x | x <- xss,
                      cc_xs == wordToCount x &&
                      not (l_xs == map toLower x)]
  where
    cc_xs = wordToCount xs
    l_xs = map toLower xs
  
