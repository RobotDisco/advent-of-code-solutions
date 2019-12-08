import Test.Tasty
import Test.Tasty.HUnit
import Lib

tests :: TestTree
tests = testGroup "Tests" [testD1S1]

testD1S1 :: TestTree
testD1S1 = testGroup "Day 1, Star 1" [testD1S1T1, testD1S1T2, testD1S1T3, testD1S1T4]

testD1S1T1 = testCase "For a mass of 12, divide by 3 and round down to get 4, then subtract 2 to get 2." $ (fuelForMass 12) @?= 2
testD1S1T2 = testCase "For a mass of 14, dividing by 3 and rounding down still yields 4, so the fuel required is also 2." $ (fuelForMass 14) @?= 2
testD1S1T3 = testCase "For a mass of 1969, the fuel required is 654." $ (fuelForMass 1969) @?= 654
testD1S1T4 = testCase "For a mass of 100756, the fuel required is 33583." $ (fuelForMass 100756) @?= 33583

main :: IO ()
main = defaultMain tests
