module Lib (
  AoCQuestion,
  getQuestion
  ) where

import qualified Data.Text as T
import qualified Data.Map as M
import qualified Day1
import qualified Day2

type AoCQuestion = T.Text -> T.Text
type AoCDay = M.Map Integer AoCQuestion
type AoCYear = M.Map Integer AoCDay
type AoCCollection = M.Map Integer AoCYear

-- day1 :: AoCDay
-- day1 = M.fromList [(1, mkSolution Day1.d1s1), (2, mkSolution Day1.d1s2)]

day1 :: AoCDay
day1 = M.fromList [(1, Day1.star1), (2, Day1.star2)]
day2 :: AoCDay
day2 = M.fromList [(1, Day2.star1), (2, Day2.star2)]
year2019 :: AoCYear
year2019 = M.fromList
  [
    (1, day1),
    (2, day2)
  ]

collection :: AoCCollection
collection = M.singleton 2019 year2019

getQuestion :: Integer -> Integer -> Integer -> Maybe AoCQuestion
getQuestion year day star =
  do
    yqs <- M.lookup year collection
    dqs <- M.lookup day yqs
    M.lookup star dqs
