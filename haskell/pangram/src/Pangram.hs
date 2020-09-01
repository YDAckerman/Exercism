module Pangram (isPangram) where

import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text = all (\x -> x `elem` low_text) ['a'..'z']
  where
    low_text = map toLower text
     
  
