import Test.Tasty
import Test.Tasty.HUnit
import Lib

tests :: TestTree
tests = testGroup "Tests" [testQ1S1]

testQ1S1 :: TestTree
testQ1S1 = testGroup "Day 1, Star 1" [testQ1S1T1, testQ1S1T2, testQ1S1T3, testQ1S1T4]

testQ1S1T1 = testCase "For a mass of 12, divide by 3 and round down to get 4, then subtract 2 to get 2." $ (q1s1 12) @?= 2
testQ1S1T2 = testCase "For a mass of 14, dividing by 3 and rounding down still yields 4, so the fuel required is also 2." $ (q1s1 14) @?= 2
testQ1S1T3 = testCase "For a mass of 1969, the fuel required is 654." $ (q1s1 1969) @?= 654
testQ1S1T4 = testCase "For a mass of 100756, the fuel required is 33583." $ (q1s1 100756) @?= 33583


main :: IO ()
main = defaultMain tests
