module Lib (
  AoCQuestion,
  getQuestion
  ) where

import qualified Data.Text as T
import qualified Data.Map as M
import qualified Day1
import qualified Day2
import qualified Day3
import qualified Day4

type AoCQuestion = T.Text -> T.Text
type AoCDay = M.Map Integer AoCQuestion
type AoCYear = M.Map Integer AoCDay
type AoCCollection = M.Map Integer AoCYear

-- day1 :: AoCDay
-- day1 = M.fromList [(1, mkSolution Day1.d1s1), (2, mkSolution Day1.d1s2)]

year2019 :: AoCYear
year2019 = M.fromList
  [
    (1, M.fromList [(1, Day1.star1), (2, Day1.star2)]),
    (2, M.fromList [(1, Day2.star1), (2, Day2.star2)]),
    (3, M.fromList [(1, Day3.star1), (2, Day3.star2)]),
    (4, M.fromList [(1, Day4.star1), (2, Day4.star2)])
  ]

collection :: AoCCollection
collection = M.singleton 2019 year2019

getQuestion :: Integer -> Integer -> Integer -> Maybe AoCQuestion
getQuestion year day star =
  do
    yqs <- M.lookup year collection
    dqs <- M.lookup day yqs
    M.lookup star dqs
