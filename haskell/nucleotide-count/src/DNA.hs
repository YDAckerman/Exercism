module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, fromList, adjust)

data Nucleotide = A | C | G | T  deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = foldr (adjust (+1)) map_0 <$> traverse toNuc xs
  where
    map_0 = fromList $ zip [A,C,T,G] (cycle [0])
    
toNuc :: Char -> Either String Nucleotide
toNuc 'A' = Right A
toNuc 'C' = Right C
toNuc 'G' = Right G
toNuc 'T' = Right T
toNuc x = Left "Error"


