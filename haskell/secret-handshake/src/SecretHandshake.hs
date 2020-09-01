module SecretHandshake (handshake) where

handshake :: Int -> [String]
handshake n 
  | n > 31 || n < 1 = []
  | otherwise = decode n

decode :: Int -> [String]
decode n = flip $ keep $ zip (take 4 code) answers
  where
    code = reverse $ toBinCode n
    answers = ["wink", "double blink", "close your eyes", "jump"]
    flip = if code!!4 == '1' then reverse else id

toBinCode :: Int -> String
toBinCode n = lpad bin_str (5 - length (bin_str))
  where 
    bin_str = show (toBinary n)
    
lpad :: String -> Int -> String
lpad xs n = (replicate n '0') ++ xs

keep :: [(Char, String)] -> [String]
keep xs = [ a | (c,a) <- xs, c == '1']
    
toBinary :: Int -> Int
toBinary 0 = 0
toBinary n = 10^higher_pwr + toBinary (n - 2^higher_pwr)
  where
    higher_pwr = last [i | i <- [0..6],  2^i <= n]
