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
