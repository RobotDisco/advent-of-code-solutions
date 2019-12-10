module Lib (
  AoCQuestion,
  getQuestion
  ) where

import qualified Data.Text as T
import qualified Data.Map as M
import Day1

mkSolution :: ([Integer] -> Integer) -> T.Text -> Integer
mkSolution f input = f $ map (read . T.unpack) $ T.lines input

type AoCQuestion = T.Text -> Integer
type AoCDay = M.Map Integer AoCQuestion
type AoCYear = M.Map Integer AoCDay
type AoCCollection = M.Map Integer AoCYear

day1 :: AoCDay
day1 = M.fromList [(1, mkSolution Day1.d1s1), (2, mkSolution Day1.d1s2)]
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
