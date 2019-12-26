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

orbitPath' :: M.Map String String -> [String] -> Maybe String -> [String]
orbitPath' m acc (Just s) = orbitPath' m (s:acc) (M.lookup s m)
-- We decrement acc because this one doesn't count, it isn't a valid orbit.
orbitPath' _ acc Nothing = tail acc

orbitPath :: M.Map String String -> String -> [String]
orbitPath m s = orbitPath' m [] (Just s)

star1 :: T.Text -> T.Text
star1 input =
  let orbits = string2map $ map T.unpack $ T.lines input
      totalOrbits = M.foldrWithKey (\k _ a -> (length $ orbitPath orbits k) + a) 0 orbits
  in T.pack $ show totalOrbits

star2 :: T.Text -> T.Text
star2 input =
  let orbits = string2map $ map T.unpack $ T.lines input
      you_orbits = init $ orbitPath orbits "YOU"
      santa_orbits = init $ orbitPath orbits "SAN"
      common_orbits = takeWhile (\(x,y) -> x == y) $ zip you_orbits santa_orbits
      num_jumps = (length you_orbits) + (length santa_orbits) - (2 * (length common_orbits))
  in T.pack $ show num_jumps
