module Lib (
  d1s1
  ) where

import qualified Data.Text as T

fuelForMass :: Int -> Int
fuelForMass  mass = mass `div` 3 - 2

d1s1 :: T.Text -> Int
d1s1 input = sum $ map (fuelForMass . read . T.unpack) $ T.lines input
