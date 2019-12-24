module Day1 (
  fuelForMass,
  fuelForFuelForMass,
  star1,
  star2
  ) where

import qualified Data.Text as T

fuelForMass :: Integer -> Integer
fuelForMass mass = maximum [mass `div` 3 - 2, 0]

fuelForFuelForMass :: Integer -> Integer
fuelForFuelForMass mass =
  -- sum up the recursive computations of additional fuel required
  sum nonzeros
  -- Infinite list where we keep calculating amount of fuel required,
  -- and then the fuel required for that fuel
  -- Note that the original input value is the first element, so strip that.
  where keepAddingFuel = tail $ iterate fuelForMass mass
        -- since iterate produces an infite lazy list, cut off after
        -- we get back only zeroes
        -- I don't get how the curried anonymous function works, it
        -- feels like I should use the reverse order. But maybe because
        -- the operator is considered infix?
        nonzeros = takeWhile (> 0) keepAddingFuel

star1 :: T.Text -> T.Text
star1 input = T.pack $ show $ sum $ map fuelForMass $ map (read . T.unpack) $ T.lines input

star2 :: T.Text -> T.Text
star2 input = T.pack $ show $ sum $ map fuelForFuelForMass $ map (read . T.unpack) $ T.lines input

