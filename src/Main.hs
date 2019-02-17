module Main where

import Data
import MarsRover

main :: IO ()
main = do
  edges <- getLine
  if gridFromStr edges == Nothing
    then do
      putStrLn "Invalid planet boundaries. Try again"
      main
    else do
      doRover edges
      doRover edges
  where
    doRover b = rover (lift . gridFromStr $ b)
    lift (Just x) = x

rover :: Grid -> IO ()
rover g = do
  p <- getLine
  commPoolData <- getLine
  if posFromStr p == Nothing || pX (liftedPos p) > gX g || pY (liftedPos p) > gY g
    then do
      putStrLn "Invalid position. Try again"
      rover g
    else do
      putStrLn . show $ (boundedStrCommPool g (liftedPos p) commPoolData)
      putStr "\n"
  where
    lift (Just x) = x
    liftedPos = lift . posFromStr
