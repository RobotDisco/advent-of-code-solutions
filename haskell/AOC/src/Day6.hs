module Day6 (
  star1,
  star2
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

numOrbits'' :: M.Map String String -> [String] -> Maybe String -> [String]
numOrbits'' m acc (Just s) = numOrbits'' m (s:acc) (M.lookup s m)
-- We decrement acc because this one doesn't count, it isn't a valid orbit.
numOrbits'' _ acc Nothing = tail acc

orbitL :: M.Map String String -> String -> [String]
orbitL m s = numOrbits'' m [] (Just s)

star1 :: T.Text -> T.Text
star1 input =
  let orbits = string2map $ map T.unpack $ T.lines input
      totalOrbits = M.foldrWithKey (\k _ a -> (length $ orbitL orbits k) + a) 0 orbits
  in T.pack $ show totalOrbits

star2 :: T.Text -> T.Text
star2 input =
  let orbits = string2map $ map T.unpack $ T.lines input
      you_orbits = init $ orbitL orbits "YOU"
      santa_orbits = init $ orbitL orbits "SAN"
      common_orbits = takeWhile (\(x,y) -> x == y) $ zip you_orbits santa_orbits
      num_jumps = (length you_orbits) + (length santa_orbits) - (2 * (length common_orbits))
  in T.pack $ show num_jumps
