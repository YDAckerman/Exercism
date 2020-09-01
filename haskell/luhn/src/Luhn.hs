module Luhn (isValid) where

import Data.Char (isNumber, digitToInt)

-- Old:
-- isValid :: String -> Bool
-- isValid n  
--   | l < 2 = False
--   | otherwise = rem (sum n2) 10 == 0
--   where
--     n1 = reverse $ filter isNumber n
--     l = length n1
--     odd_f = digitToInt
--     double x = if 2 * x > 9 then 2 * x - 9 else 2 * x
--     even_f = double . odd_f 
--     n2 = [if rem i 2 == 0 then even_f (n1!!(i-1)) else odd_f (n1!!(i-1)) |
--              i <- [1..l]]
    
isValid :: String -> Bool
isValid n = (length $ isValid' n) > 1 && rem (isValid'' n) 10 == 0
  where
    isValid' = reverse . map digitToInt . filter isNumber 
    isValid'' = sum . map tProd . zip (cycle [1,2]) . isValid'
    tProd (a, b) = if a*b > 9 then a*b - 9 else a*b
