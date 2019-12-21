module Cli where

import Advent
import Lib
import qualified Data.Text as T
import LoadEnv
import System.Environment (lookupEnv)

usageText :: String
usageText = "Usage: aoc <year> <day> <part>"

questionWrapper :: Maybe AoCQuestion -> (Either AoCError T.Text) -> String
questionWrapper _ (Left err) = "Error: " ++ (show err)
questionWrapper Nothing _ = "Error: " ++ "Question not implemented."
questionWrapper (Just f) (Right input) = "Answer: " ++ (show $ f input)

createAoCOpts :: Integer -> (IO AoCOpts)
createAoCOpts year =
  do
    loadEnv
    session <- lookupEnv "AOCSESSION"
    return $ defaultAoCOpts year (maybe "" id session)

runQuestion :: Integer -> Integer -> Integer -> IO ()
runQuestion year day star =
  let req = AoCInput (mkDay_ day)
      function = getQuestion year day star
  in do
    opts <- createAoCOpts 2019
    input <- runAoC opts req
    putStrLn $ questionWrapper function input
