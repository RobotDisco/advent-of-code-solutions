{-# LANGUAGE OverloadedStrings #-}

module Day6Test where

import Day6
import Test.Tasty
import Test.Tasty.HUnit

test_d6s1 :: TestTree
test_d6s1 = testCase "Day 6, Star 1" $
              (star1 "COM)B\nB)C\nC)D\nD)E\nE)F\nB)G\nG)H\nD)I\nE)J\nJ)K\nK)L") @?= "42"

test_d6s2 :: TestTree
test_d6s2 = testCase "Day 6, Star 2" $
              (star2 "COM)B\nB)C\nC)D\nD)E\nE)F\nB)G\nG)H\nD)I\nE)J\nJ)K\nK)L\nK)YOU\nI)SAN") @?= "4"
