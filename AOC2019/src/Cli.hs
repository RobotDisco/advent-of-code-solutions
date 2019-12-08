module Cli where

import Advent
import Lib
import qualified Data.Text as T
import LoadEnv
import System.Environment (lookupEnv)

usageText :: String
usageText = "Usage: aoc <year> <day> <part>"

printUsage :: IO ()
printUsage = putStrLn usageText

questionWrapper :: (T.Text -> Int) -> (Either AoCError T.Text) -> String
questionWrapper _ (Left err) = "Error: " ++ (show err)
questionWrapper f (Right input) = "Answer: " ++ (show $ f input)

createAoCOpts :: Integer -> (IO AoCOpts)
createAoCOpts year =
  do
    loadEnv
    session <- lookupEnv "AOCSESSION"
    return $ defaultAoCOpts year (maybe "" id session)

runQuestion :: Int -> Integer -> Int -> IO ()
runQuestion _year day _ =
  let req = AoCInput (mkDay_ day)
  in do
    opts <- createAoCOpts 2019
    input <- runAoC opts req;
    res <- return $ questionWrapper d1s1 input;
    putStrLn res;
