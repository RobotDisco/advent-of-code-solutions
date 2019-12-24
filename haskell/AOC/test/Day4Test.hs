{-# LANGUAGE OverloadedStrings #-}

module Day4Test where

import Day4
import Test.Tasty
import Test.Tasty.HUnit

test_d4s1 :: TestTree
test_d4s1 = testGroup "Day 4, Star 1" [testD4S1T1, testD4S1T2, testD4S1T3, testD4S1T4, testD4S1T5, testD4S1T6]

test_d4s2 :: TestTree
test_d4s2 = testGroup "Day 4, Star 2" [testD4S2T1, testD4S2T2, testD4S2T3, testD4S2T4, testD4S2T5, testD4S2T6]

testD4S1T1 :: TestTree
testD4S1T1 = testCase "111111" $ (star1 "111111-111111") @?= "1"
testD4S1T2 :: TestTree
testD4S1T2 = testCase "223450" $ (star1 "223450-223450") @?= "0"
testD4S1T3 :: TestTree
testD4S1T3 = testCase "123789" $ (star1 "123789-123789") @?= "0"
testD4S1T4 :: TestTree
testD4S1T4 = testCase "122345" $ (star1 "122345-122345") @?= "1"
testD4S1T5 :: TestTree
testD4S1T5 = testCase "111123" $ (star1 "111123-111123") @?= "1"
testD4S1T6 :: TestTree
testD4S1T6 = testCase "135679" $ (star1 "135679-135679") @?= "0"

testD4S2T1 :: TestTree
testD4S2T1 = testCase "111111" $ (star2 "111111-111111") @?= "0"
testD4S2T2 :: TestTree
testD4S2T2 = testCase "223450" $ (star2 "223450-223450") @?= "0"
testD4S2T3 :: TestTree
testD4S2T3 = testCase "123789" $ (star2 "123789-123789") @?= "0"
testD4S2T4 :: TestTree
testD4S2T4 = testCase "112233" $ (star2 "112233-112233") @?= "1"
testD4S2T5 :: TestTree
testD4S2T5 = testCase "123444" $ (star2 "123444-123444") @?= "0"
testD4S2T6 :: TestTree
testD4S2T6 = testCase "111122" $ (star2 "111122-111122") @?= "1"
