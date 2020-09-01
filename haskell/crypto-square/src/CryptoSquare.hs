module CryptoSquare (encode) where

import qualified Data.Char as C

cleanText :: String -> String
cleanText xs = filter C.isAlphaNum (map C.toLower xs)
    
chunkList :: String -> Int -> [String]
chunkList [] _ = []
chunkList xs n = [take n xs] ++ (chunkList (drop n xs) n)

paste :: [String] -> String
paste [] = []
paste (x:xs) = x ++ (paste xs)

pad :: String -> Int -> String
pad xs n = xs ++ [' ' | i <- [1..n]]

intSqrt = (round . sqrt . fromIntegral)

calcDim :: Int -> (Int, Int)
calcDim n = (r, c)
  where
    r = intSqrt n
    c = if n <= r*r then r else r + 1
      
encode :: String -> String
encode "" = ""
encode xs = unwords coded
    where
      cxs = cleanText xs
      (r, c) = calcDim (length cxs)
      padded = pad cxs (r * c - length cxs)
      blocks = chunkList padded c
      coded = [paste [drop (i-1) (take i x) | x <- blocks] | i <- [1..c]]
