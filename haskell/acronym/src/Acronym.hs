module Acronym (abbreviate) where

import qualified Data.Text as T
import qualified Data.Char as C
import           Data.Text (Text)
import           Data.Int (Int)

countCaps :: Text -> Int
countCaps x = T.length (T.filter C.isUpper x)

pullCaps :: Text -> Text
pullCaps x = if not ((countCaps x) == (T.length x)) then all_caps else first_only
  where
    first_only = T.toUpper (T.take 1 x)
    all_caps = T.concat [first_only, T.filter C.isUpper (T.tail x)]

abbreviate :: Text -> Text
abbreviate xs = T.concat x
  where
    -- remove any characters that don't affect the outcome
    x0 = T.filter (\y -> y `elem` ['a'..'z'] ++ ['A'..'Z'] ++ "- ") xs
    -- make the non-alpha characters we care about uniform
    x1 = T.replace (T.pack "-") (T.pack " ") x0
    -- split into words
    x2 = T.splitOn (T.pack " ") x1
    -- pull the capital letters from each word (with conditions)
    x = map pullCaps x2
  









