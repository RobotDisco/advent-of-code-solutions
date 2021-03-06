{-# LANGUAGE OverloadedStrings #-}

module Day3Test where

import Day3
import Test.Tasty
import Test.Tasty.HUnit

test_d3s1 :: TestTree
test_d3s1 = testGroup "Day 3, Star 1" [testD3S1T1, testD3S1T2, testD3S1T3]

testD3S1T1 :: TestTree
testD3S1T1 = testCase "R8,U5,L5,D3\nU7,R6,D4,L4" $ (star1
                                                    "R8,U5,L5,D3\nU7,R6,D4,L4") @?= "6"
testD3S1T2 :: TestTree
testD3S1T2 = testCase "R75,D30,R83,U83,L12,D49,R71,U7,L72\nU62,R66,U55,R34,D71,R55,D58,R83" $ (star1 "R75,D30,R83,U83,L12,D49,R71,U7,L72\nU62,R66,U55,R34,D71,R55,D58,R83") @?= "159"
testD3S1T3 :: TestTree
testD3S1T3 = testCase "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51\nU98,R91,D20,R16,D67,R40,U7,R15,U6,R7" $ (star1 "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51\nU98,R91,D20,R16,D67,R40,U7,R15,U6,R7") @?= "135"

test_d3s2 :: TestTree
test_d3s2 = testGroup "Day 3, Star 2" [testD3S2T1, testD3S2T2, testD3S2T3]

testD3S2T1 :: TestTree
testD3S2T1 = testCase "R8,U5,L5,D3\nU7,R6,D4,L4" $ (star2
                                                    "R8,U5,L5,D3\nU7,R6,D4,L4") @?= "30"
testD3S2T2 :: TestTree
testD3S2T2 = testCase "R75,D30,R83,U83,L12,D49,R71,U7,L72\nU62,R66,U55,R34,D71,R55,D58,R83" $ (star2 "R75,D30,R83,U83,L12,D49,R71,U7,L72\nU62,R66,U55,R34,D71,R55,D58,R83") @?= "610"
testD3S2T3 :: TestTree
testD3S2T3 = testCase "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51\nU98,R91,D20,R16,D67,R40,U7,R15,U6,R7" $ (star2 "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51\nU98,R91,D20,R16,D67,R40,U7,R15,U6,R7") @?= "410"
