module Day2Test where

import Day2
import Test.Tasty
import Test.Tasty.HUnit

test_D2S1 :: TestTree
test_D2S1 = testGroup "Day 2, Star 1" [testD2S1T1, testD2S1T2, testD2S1T3, testD2S1T4]

testD2S1T1 :: TestTree
testD2S1T1 = testCase "1,0,0,0,99 becomes 2,0,0,0,99 (1 + 1 = 2)." $ Day2.exec [1,0,0,0,99] @?= [2,0,0,0,99]
testD2S1T2 :: TestTree
testD2S1T2 = testCase "2,3,0,3,99 becomes 2,3,0,6,99 (3 * 2 = 6)." $ Day2.exec [2,3,0,3,99] @?= [2,3,0,6,99]
testD2S1T3 :: TestTree
testD2S1T3 = testCase "2,4,4,5,99,0 becomes 2,4,4,5,99,9801 (99 * 99 = 9801)." $ Day2.exec [2,4,4,5,99,0] @?= [2,4,4,5,99,9801]
testD2S1T4 :: TestTree
testD2S1T4 = testCase "1,1,1,4,99,5,6,0,99 becomes 30,1,1,4,2,5,6,0,99." $ Day2.exec [1,1,1,4,99,5,6,0,99] @?= [30,1,1,4,2,5,6,0,99]
