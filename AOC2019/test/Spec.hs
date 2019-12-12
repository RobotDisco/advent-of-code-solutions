import Test.Tasty
import Test.Tasty.HUnit
import Day1
import qualified Day2

tests :: TestTree
tests = testGroup "Tests" [testD1S1, testD1S2, testD2S1]

testD1S1 :: TestTree
testD1S1 = testGroup "Day 1, Star 1" [testD1S1T1, testD1S1T2, testD1S1T3, testD1S1T4]
testD1S2 :: TestTree
testD1S2 = testGroup "Day 1, Star 2" [testD1S2T1, testD1S2T2, testD1S2T3]

testD2S1 :: TestTree
testD2S1 = testGroup "Day 2, Star 1" [testD2S1T1, testD2S1T2, testD2S1T3, testD2S1T4]

testD1S1T1 = testCase "For a mass of 12, divide by 3 and round down to get 4, then subtract 2 to get 2." $ (fuelForMass 12) @?= 2
testD1S1T2 = testCase "For a mass of 14, dividing by 3 and rounding down still yields 4, so the fuel required is also 2." $ (fuelForMass 14) @?= 2
testD1S1T3 = testCase "For a mass of 1969, the fuel required is 654." $ (fuelForMass 1969) @?= 654
testD1S1T4 = testCase "For a mass of 100756, the fuel required is 33583." $ (fuelForMass 100756) @?= 33583

testD1S2T1 = testCase "A module of mass 14 requires 2 fuel. This fuel requires no further fuel (2 divided by 3 and rounded down is 0, which would call for a negative fuel), so the total fuel required is still just 2." $ (fuelForFuelForMass 14) @?= 2
testD1S2T2 = testCase "At first, a module of mass 1969 requires 654 fuel. Then, this fuel requires 216 more fuel (654 / 3 - 2). 216 then requires 70 more fuel, which requires 21 fuel, which requires 5 fuel, which requires no further fuel. So, the total fuel required for a module of mass 1969 is 654 + 216 + 70 + 21 + 5 = 966." $ (fuelForFuelForMass 1969) @?= 966
testD1S2T3 = testCase "The fuel required by a module of mass 100756 and its fuel is: 33583 + 11192 + 3728 + 1240 + 411 + 135 + 43 + 12 + 2 = 50346." $ (fuelForFuelForMass 100756) @?= 50346

testD2S1T1 = testCase "1,0,0,0,99 becomes 2,0,0,0,99 (1 + 1 = 2)." $ Day2.exec [1,0,0,0,99] @?= [2,0,0,0,99]
testD2S1T2 = testCase "2,3,0,3,99 becomes 2,3,0,6,99 (3 * 2 = 6)." $ Day2.exec [2,3,0,3,99] @?= [2,3,0,6,99]
testD2S1T3 = testCase "2,4,4,5,99,0 becomes 2,4,4,5,99,9801 (99 * 99 = 9801)." $ Day2.exec [2,4,4,5,99,0] @?= [2,4,4,5,99,9801]
testD2S1T4 = testCase "1,1,1,4,99,5,6,0,99 becomes 30,1,1,4,2,5,6,0,99." $ Day2.exec [1,1,1,4,99,5,6,0,99] @?= [30,1,1,4,2,5,6,0,99]

main :: IO ()
main = defaultMain tests
