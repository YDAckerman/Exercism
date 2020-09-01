{-# LANGUAGE OverloadedStrings #-}

module Bob (responseFor) where

import qualified Data.Text as T
import qualified Data.Char as C
import           Data.Text (Text)

isQuestion :: Text -> Bool
isQuestion text = T.last text == '?'

isEmpty :: Text -> Bool
isEmpty text = T.all C.isSpace text || T.null text

isAllCaps :: Text -> Bool
isAllCaps text = T.any C.isUpper text && not (T.any C.isLower text)

responseFor :: Text -> Text
responseFor xs
  | isEmpty strp_xs = "Fine. Be that way!"
  | isQuestion strp_xs && isAllCaps strp_xs = "Calm down, I know what I'm doing!"
  | isAllCaps strp_xs = "Whoa, chill out!"
  | isQuestion strp_xs = "Sure."
  | otherwise = "Whatever."
  where strp_xs = T.strip xs



