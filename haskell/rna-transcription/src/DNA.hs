module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA xs = traverse toPair xs

toPair :: Char -> Either Char Char
toPair 'G' = Right 'C'
toPair 'C' = Right 'G'
toPair 'T' = Right 'A'
toPair 'A' = Right 'U'
toPair x = Left x

