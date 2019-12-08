module Main where

import System.IO
import System.Exit
import Cli
import System.Environment

main :: IO ()
main = do
  args <- getArgs
  case args of
    [yearInteger, dayInteger, starInteger]
      | year <- read yearInteger
      , day  <- read dayInteger
      , star <- read starInteger
        -> runQuestion year day star
    _ -> do
      hPutStrLn stderr $ usageText
      exitFailure
