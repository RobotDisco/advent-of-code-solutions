module Day6 (
  star1
) where

import qualified Data.Map.Strict as M
import qualified Data.Text as T
import Text.Regex.TDFA

string2tuple :: String -> (String, String)
string2tuple str =
  let regex = "(.*)\\)(.*)"
      (_,_,_,orbitee:orbiter:_) = str =~ regex :: (String, String, String, [String])
  in (orbiter, orbitee)

string2map :: [String] -> M.Map String String
string2map = M.fromList . (map string2tuple)

numOrbits' :: M.Map String String -> Int -> Maybe String -> Int
numOrbits' m acc (Just s) = numOrbits' m (acc + 1) (M.lookup s m)
-- We decrement acc because this one doesn't count, it isn't a valid orbit.
numOrbits' _ acc Nothing = acc - 1

numOrbits :: M.Map String String -> String -> Int
numOrbits m s = numOrbits' m 0 (Just s)

star1 :: T.Text -> T.Text
star1 input =
  let orbits = string2map $ map T.unpack $ T.lines input
      totalOrbits = M.foldrWithKey (\k _ a -> (numOrbits orbits k) + a) 0 orbits
  in T.pack $ show totalOrbits
