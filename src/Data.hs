module Data where

import Text.Regex.PCRE
import Data.List.Split

data Command = L | R | M deriving (Show, Eq)

data Cardinal = N | S | E | W deriving (Show, Eq)

data Position = Pos Int Int Cardinal deriving (Eq)

instance Show Position where
  show (Pos x y c) = show x ++ " " ++ show y ++ " " ++ show c
  showsPrec = undefined

cardFromChar :: Char -> Maybe Cardinal
cardFromChar 'N' = Just N
cardFromChar 'S' = Just S
cardFromChar 'W' = Just W
cardFromChar 'E' = Just E
cardFromChar _ = Nothing

commFromChar :: Char -> Maybe Command
commFromChar 'L' = Just L
commFromChar 'R' = Just R
commFromChar 'M' = Just M
commFromChar _   = Nothing

posFromStr :: String -> Maybe Position
posFromStr x
  | isValid x = Just $ getPos x
  | otherwise = Nothing
  where
    isValid = matchTest (makeRegex "^\\d+ \\d+ (N|S|E|W)$" :: Regex)
    getPos = (\x -> Pos (toInt $ x!!0) (toInt $ x!!1) (lift . cardFromChar . head $ x!!2)) . splitOn " "
    toInt x = (read x :: Int)
    lift (Just x) = x