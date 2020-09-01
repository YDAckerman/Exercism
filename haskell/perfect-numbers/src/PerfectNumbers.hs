module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify n
  | n <= 0 = Nothing
  | otherwise = Just $ decide n ((sum . decompose) n)
  where
    decide x d 
      | x < d = Abundant
      | x == d = Perfect
      | x > d = Deficient
  
decompose :: Int -> [Int]
decompose n = [i | i <- [1..(n-1)], rem n i == 0]
