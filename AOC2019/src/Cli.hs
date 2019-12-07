module Cli where

usageText :: String
usageText = "Usage: aoc <year> <day> <part>"

printUsage :: IO ()
printUsage = putStrLn usageText
