import Test.Tasty
import Test.Tasty.HUnit

test1 :: TestTree
test1 = testCase "Equals 1" $ 1 @?= 1

main :: IO ()
main = defaultMain test1
