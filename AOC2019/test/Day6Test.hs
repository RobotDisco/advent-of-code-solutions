{-# LANGUAGE OverloadedStrings #-}

module Day6Test where

import Day6
import Test.Tasty
import Test.Tasty.HUnit

test_d6s1 :: TestTree
test_d6s1 = testCase "Day 6, Star 1" $
              (star1 "COM)B\nB)C\nC)D\nD)E\nE)F\nB)G\nG)H\nD)I\nE)J\nJ)K\nK)L") @?= "42"
