module MarsRoverSpec where

import Control.Exception (evaluate)
import Data
import MarsRover
import Test.Hspec
import Test.QuickCheck

spec = do
  describe "Mars rover library core functionality" $ do
    it "[command] Should receive a position-command and return a new position" $ do
      command (Pos 0 0 N) M `shouldBe` Pos 0 1 N
      command (Pos 0 0 S) M `shouldBe` Pos 0 (-1) S
      command (Pos 0 0 W) M `shouldBe` Pos (-1) 0 W
      command (Pos 0 0 E) M `shouldBe` Pos 1 0 E
      command (Pos 1 1 N) L `shouldBe` Pos 1 1 W
      command (Pos 1 1 N) R `shouldBe` Pos 1 1 E
      command (Pos 1 1 S) L `shouldBe` Pos 1 1 E
      command (Pos 1 1 S) R `shouldBe` Pos 1 1 W
      command (Pos 1 1 E) L `shouldBe` Pos 1 1 N
      command (Pos 1 1 E) R `shouldBe` Pos 1 1 S
      command (Pos 1 1 W) L `shouldBe` Pos 1 1 S
      command (Pos 1 1 W) R `shouldBe` Pos 1 1 N
    it "[boundedComm] Should receive a position-command and return a new position inside grid boundaries" $ do
      boundedComm (Grid 5 5) (Pos 5 5 N) M `shouldBe` Pos 5 5 N
      boundedComm (Grid 5 5) (Pos 5 5 S) M `shouldBe` Pos 5 4 S
      boundedComm (Grid 5 5) (Pos 0 0 S) M `shouldBe` Pos 0 0 S
      boundedComm (Grid 5 5) (Pos 0 0 W) M `shouldBe` Pos 0 0 W
    it "[commPool] Should receive a position and command pool and return a new position" $ do
      commPool (Pos 1 2 N) [L, M, L, M, L, M, L, M, M] `shouldBe` Pos 1 3 N
      commPool (Pos 3 3 E) [M, M, R, M, M, R, M, R, R, M] `shouldBe` Pos 5 1 E
      commPool (Pos 3 3 E) [] `shouldBe` Pos 3 3 E
    it
      "[boundedCommPool] Should receive a grid, a position and command pool and return a new position in grid boundaries" $ do
      boundedCommPool (Grid 5 5) (Pos 5 5 N) [M, M, R, M, R, M, M, L, M, R, M] `shouldBe` Pos 5 2 S
    it
      "[strCommPool] Should receive a position and string-command (discarding wrong chars) pool and return a new position" $ do
      strCommPool (Pos 1 2 N) "L M L M L M L M M" `shouldBe` Pos 1 3 N
      strCommPool (Pos 1 2 N) "L, M, L, M, L, M, L, M, M" `shouldBe` Pos 1 3 N
      strCommPool (Pos 1 2 N) "LMWWQDLMLMLDSWXSWMM" `shouldBe` Pos 1 3 N
    it
      "[boundedStrCommPool] Should receive a grid, position and string-command pool and return a new position in grid boundaries" $ do
      boundedStrCommPool (Grid 5 5) (Pos 5 5 N) "M, M, R, M, R, M, M, L, M, R, M" `shouldBe` Pos 5 2 S
