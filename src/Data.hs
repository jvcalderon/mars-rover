module Data where

data Command = L | R | M
data Cardinal = N | S | E | W deriving (Show, Eq)

data Position = Pos Int Int Cardinal deriving (Eq)
instance Show Position where
  show (Pos x y c) = show x ++ " " ++ show y ++ " " ++ show c
  showsPrec = undefined
