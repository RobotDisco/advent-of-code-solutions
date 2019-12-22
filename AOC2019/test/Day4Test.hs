{-# LANGUAGE OverloadedStrings #-}

module Day4Test where

import Day4
import Test.Tasty
import Test.Tasty.HUnit

test_d3s1 :: TestTree
test_d3s1 = testGroup "Day 4, Star 1" [testD4S1T1, testD4S1T2, testD4S1T3]

testD4S1T1 :: TestTree
testD4S1T1 = testCase "111111" $ (star1 "111111-111111") @?= "1"
testD4S1T2 :: TestTree
testD4S1T2 = testCase "223450" $ (star1 "223450-223450") @?= "0"
testD4S1T3 :: TestTree
testD4S1T3 = testCase "123789" $ (star1 "123789-123789") @?= "0"
