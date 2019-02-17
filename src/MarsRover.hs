module MarsRover where

import Data

command :: Position -> Command -> Position
-- Move forward
command (Pos x y N) M = Pos x (y + 1) N
command (Pos x y S) M = Pos x (y - 1) S
command (Pos x y E) M = Pos (x + 1) y E
command (Pos x y W) M = Pos (x - 1) y W
-- Turn left
command (Pos x y N) L = Pos x y W
command (Pos x y S) L = Pos x y E
command (Pos x y E) L = Pos x y N
command (Pos x y W) L = Pos x y S
-- Turn right
command (Pos x y N) R = Pos x y E
command (Pos x y S) R = Pos x y W
command (Pos x y E) R = Pos x y S
command (Pos x y W) R = Pos x y N

boundedComm :: Grid -> Position -> Command -> Position
boundedComm g p c
  | x > gX g = Pos (gX g) (pY p) (pC p)
  | y > gY g = Pos (pX p) (gY g) (pC p)
  | x < 0 = Pos 0 (pY p) (pC p)
  | y < 0 = Pos (pX p) 0 (pC p)
  | otherwise = pos
  where
    x = pX pos
    y = pY pos
    pos = (command p c)

commPool :: Position -> [Command] -> Position
commPool p (x:xs) = commPool (command p x) xs
commPool p []     = p

boundedCommPool :: Grid -> Position -> [Command] -> Position
boundedCommPool g p (x:xs) = boundedCommPool g (boundedComm g p x) xs
boundedCommPool g p []     = p

strCommPool :: Position -> String -> Position
strCommPool p xs = commPool p (map lift $ commandStr xs)

boundedStrCommPool :: Grid -> Position -> String -> Position
boundedStrCommPool g p xs = boundedCommPool g p (map lift $ commandStr xs)

commandStr :: String -> [Maybe Command]
commandStr xs = filter (\x -> x /= Nothing) (map commFromChar xs)

lift :: Maybe x -> x
lift (Just x) = x
