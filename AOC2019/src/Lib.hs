module Lib
    ( q1s1,
      someFunc
    ) where

q1s1 :: Int -> Int
q1s1 mass = mass `div` 3 - 2

someFunc :: IO()
someFunc = putStrLn "someFunc"
