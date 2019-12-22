module Day4 (
  star1,
  star2
  ) where

import qualified Data.List as L
import qualified Data.Text as T
import Text.Regex.TDFA

conforms1 :: Int  -> Bool
conforms1 n =
  let sn = show n
      grouped = L.group sn
      oneDouble = any (\s -> length s > 1) grouped
      isMonotonic = (L.sort sn) == sn
  in oneDouble && isMonotonic

conforms2 :: Int  -> Bool
conforms2 n =
  let sn = show n
      grouped = L.group sn
      onlyDoubles = any (\s -> length s == 2) grouped
      isMonotonic = (L.sort sn) == sn
  in onlyDoubles && isMonotonic

findPasswords :: (Int -> Bool) -> T.Text -> T.Text
findPasswords f input =
  let regex = "([0-9]+)-([0-9]+)"
      (_,_,_,lowStr:highStr:_) = (T.unpack input) =~ regex :: (String, String, String, [String])
      lowBound = read lowStr
      highBound = read highStr
  in T.pack $ show $ length $ filter f [lowBound..highBound]

star1 :: T.Text -> T.Text
star1 = findPasswords conforms1
star2 :: T.Text -> T.Text
star2 = findPasswords conforms2
