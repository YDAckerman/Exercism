module BST
    ( BST
    , bstLeft
    , bstRight
    , bstValue
    , empty
    , fromList
    , insert
    , singleton
    , toList
    ) where

import Data.Maybe (isNothing, fromJust)

data BST a = BST {node :: Maybe a,
                  left :: Maybe (BST a),
                  right :: Maybe (BST a)
                 } deriving (Eq, Show)

bstLeft :: BST a -> Maybe (BST a)
bstLeft tree = left tree

bstRight :: BST a -> Maybe (BST a)
bstRight tree = right tree

bstValue :: BST a -> Maybe a
bstValue tree = node tree

empty :: BST a
empty = BST {node = Nothing, left = Nothing, right = Nothing}

fromList :: Ord a => [a] -> BST a
fromList [] = empty
fromList (x:xs) = BST {node = Just x,
                       left = Just $ fromList $ filter (<= x) xs,
                       right = Just $ fromList $ filter (> x) xs}

insert :: Ord a => a -> BST a -> BST a
insert x tree@(BST {node = n, left = l, right = r})
  | isNothing n = singleton x
  | x <= node_val && not l_empty = BST {node = n,
                                          left = Just $ insert x (fromJust l),
                                          right = r}
  | x > node_val && not r_empty = BST {node = n,
                                           left = l,
                                           right = Just $ insert x (fromJust r)}
  | x <= node_val && l_empty = BST {node = n,
                                      left = Just (singleton x),
                                      right = r}
  | x > node_val && r_empty = BST {node = n,
                                       left = l,
                                       right = Just (singleton x)}
  where
    node_val = fromJust n
    l_empty = isNothing l
    r_empty = isNothing r
    
singleton :: a -> BST a
singleton x = BST {node = Just x, left = Nothing, right = Nothing}

toList :: BST a -> [a]
toList tree@(BST {node = n, left = l, right = r})
  | isNothing n = []
  | otherwise = l' ++ [fromJust n] ++ r'
  where
    r' = if isNothing r then [] else toList $ (fromJust r)
    l' = if isNothing l then [] else toList $ (fromJust l)


