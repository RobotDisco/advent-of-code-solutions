module Lib (
  fuelForMass2,
  fuelForMass,
  AoCQuestion,
  getQuestion
  ) where

import qualified Data.Text as T
import qualified Data.Map as M

fuelForMass :: Integer -> Integer
fuelForMass  mass = maximum [mass `div` 3 - 2, 0]

fuelForMass2 :: Integer -> Integer
fuelForMass2 mass =
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
  

d1s1 :: AoCQuestion
d1s1 input = sum $ map (fuelForMass . read . T.unpack) $ T.lines input
d1s2 :: AoCQuestion
d1s2 input = sum $ map (fuelForMass2 . read . T.unpack) $ T.lines input

type AoCQuestion = T.Text -> Integer
type AoCDay = M.Map Integer AoCQuestion
type AoCYear = M.Map Integer AoCDay
type AoCCollection = M.Map Integer AoCYear

day1 :: AoCDay
day1 = M.fromList [(1, d1s1), (2, d1s2)]
year2019 :: AoCYear
year2019 = M.singleton 1 day1

collection :: AoCCollection
collection = M.singleton 2019 year2019

getQuestion :: Integer -> Integer -> Integer -> Maybe AoCQuestion
getQuestion year day star =
  do
    yqs <- M.lookup year collection
    dqs <- M.lookup day yqs
    M.lookup star dqs
