module Day4 (
  star1
  ) where

import qualified Data.List as L
import qualified Data.Set as S
import qualified Data.Text as T
import Text.Regex.TDFA

conforms :: Int  -> Bool
conforms n =
  let sn = show n
      set = S.fromList sn
      oneDouble = (length set) < (length sn)
      isMonotonic = (L.sort sn) == sn
  in oneDouble && isMonotonic

star1 :: T.Text -> T.Text
star1 input =
  let regex = "([0-9]+)-([0-9]+)"
      (_,_,_,lowStr:highStr:_) = (T.unpack input) =~ regex :: (String, String, String, [String])
      lowBound = read lowStr
      highBound = read highStr
  in T.pack $ show $ length $ filter conforms [lowBound..highBound]
