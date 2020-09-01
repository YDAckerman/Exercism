module Prime (nth) where

nth :: Int -> Maybe Integer
nth 0 = Nothing
nth n = Just $ (filterPrimes [2..]) !! (n-1)
    
filterPrimes :: [Integer] -> [Integer]
filterPrimes [] = []
filterPrimes (x:xs) = x:(filterPrimes [i | i <- xs, i `mod` x /= 0])


-- nth :: Int -> Maybe Integer
-- nth 0 = Nothing
-- nth n = Just ((sieve [2..]) !! (n - 1))

-- sieve :: [Integer] -> [Integer]
-- sieve (x:xs) = (x:(sieve [y|y <- xs, rem y x /= 0]))
