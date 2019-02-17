module Main where

import Data
import MarsRover

main :: IO ()
main = do
  boundaries <- getLine
  rover
  rover

rover :: IO ()
rover = do
  position <- getLine
  commPoolData <- getLine
  if posFromStr position == Nothing
    then do
      putStrLn "Invalid position. Try again"
      rover
    else do
      putStrLn . show $ (strCommPool (lift . posFromStr $ position) commPoolData)
      putStr "\n"
  where
    lift (Just x) = x
