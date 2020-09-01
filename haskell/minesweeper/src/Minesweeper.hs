module Minesweeper (annotate) where

import Data.Char

annotate :: [String] -> [String]
annotate board
  | r == 0 || c == 0 = board
  | otherwise = chunk (map processPos positions) c
  where
    (r,c) = boardToDim board
    positions = [(i,j) | i <- [0..(r-1)], j <- [0..(c-1)]]
    processPos (x,y) = if charAtPos (x,y) == '*' then '*' else countMines (x,y)
    countMines = noZero . intToDigit . sum . map (isMine . charAtPos) . getNbs
    getNbs (x,y) = filter onBoard [(x + a, y + b) |
                                a <- [1,0,-1], b <- [1,0,-1],
                                a /= 0 || b /= 0]
    charAtPos (x,y) = (board!!x)!!y
    isMine '*' = 1
    isMine _ = 0
    onBoard (x,y) = (x `elem` [0..(r-1)]) && (y `elem` [0..(c-1)])
    noZero x = if x == '0' then ' ' else x


chunk :: String -> Int -> [String]
chunk [] _ = []
chunk xs n = [take n xs] ++ chunk (drop n xs) n
    
boardToDim :: [String] -> (Int, Int)
boardToDim xs
  | length xs == 0 = (0,0)
  | length (xs!!0) == 0 = (0,0)
  | otherwise = (length xs, length (xs!!0))
    

-- let board = [ "   ", " * ", "   " ]
