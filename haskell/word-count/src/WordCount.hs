{-# LANGUAGE OverloadedStrings #-}

module WordCount (wordCount) where

import qualified Data.Text as T
import           Data.Char as C
import           Data.Text (Text)
import           Data.Map (Map, fromListWith)

wordCount :: Text -> (Map Text Integer)
wordCount xs = fromListWith (+) $ zip clean_words $ cycle [1]
  where
    clean_words = map unQuote $ (T.words . T.toLower . replaceWithSpace) xs
    
replaceWithSpace :: Text -> Text
replaceWithSpace xs = T.map toSpace xs
  where
    toSpace c = if C.isAlphaNum c || c == '\'' then c else ' '

unQuote :: Text -> Text
unQuote xs 
  | T.isSuffixOf "\'" xs && T.isPrefixOf "\'" xs = T.filter C.isAlphaNum xs
  | otherwise = xs
