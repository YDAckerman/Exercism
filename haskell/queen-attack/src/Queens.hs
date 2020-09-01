module Queens (boardString, canAttack) where

import Data.List (intersperse)

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString Nothing Nothing =  unlines $ replicate 8 $ line ()
boardString (Just white) Nothing = unlines $ pnt2Board white 'W'
boardString Nothing (Just black) = unlines $ pnt2Board black 'B'
boardString (Just white) (Just black) = board
  where
    board = mergeBoards bw bb
    bw = unlines $ pnt2Board white 'W'
    bb = unlines $ pnt2Board black 'B'
    
mergeBoards :: String -> String -> String
mergeBoards b1 b2 = [ keepChar (b1!!i) (b2!!i)  | i <- [0..((length b1) - 1)] ]
  where
    keepChar 'W' _ = 'W'
    keepChar _ 'B' = 'B'
    keepChar x y = x

line :: () -> String
line () = intersperse ' ' $ replicate 8 '_'

pnt2Board :: (Int,Int) -> Char -> [String]
pnt2Board (x,y) c = (replicate x $ line ()) ++ [pieceLine y c] ++ (replicate (7-x) $ line ())
    
pieceLine :: Int -> Char -> String
pieceLine y c = intersperse ' ' $ replicate (y) '_' ++ [c] ++ replicate (7-y) '_'

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack (x_w, y_w) (x_b, y_b)
  | x_w == x_b || y_w == y_b = True
  | abs (x_w - x_b) == abs (y_w - y_b) = True
  | otherwise = False
