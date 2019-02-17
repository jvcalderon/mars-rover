module DataSpec where

import Control.Exception (evaluate)
import Data
import Test.Hspec
import Test.QuickCheck

spec = do
  describe "Mars rover algebraic data types" $ do
    it "[cardFromChar] Should receive a char and maybe return a Cardinal" $ do
      cardFromChar 'N' `shouldBe` Just N
      cardFromChar 'S' `shouldBe` Just S
      cardFromChar 'W' `shouldBe` Just W
      cardFromChar 'E' `shouldBe` Just E
      cardFromChar 'V' `shouldBe` Nothing
    it "[commFromChar] Should receive a char and maybe return a Command" $ do
      commFromChar 'L' `shouldBe` Just L
      commFromChar 'R' `shouldBe` Just R
      commFromChar 'M' `shouldBe` Just M
    it "[posFromStr] Should receive a string and maybe return a Position" $ do
      posFromStr "12 92 W" `shouldBe` Just (Pos 12 92 W)
      posFromStr "12 wX" `shouldBe` Nothing
    it "[gridFromStr] Should receive a string and maybe return a Grid" $ do
      gridFromStr "5 5" `shouldBe` Just (Grid 5 5)
      gridFromStr "-5 5" `shouldBe` Nothing
      gridFromStr "xxxx" `shouldBe` Nothing