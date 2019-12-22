
module Day3 (
  star1
  ) where

import Data.List (sort, zip)
import Data.List.Split (splitOn)
import qualified Data.Map as M
import qualified Data.Set as S
import qualified Data.Text as T

type Point2D = (Int, Int)
data Wire = WireConstructor
  { steps :: [Int]
  , segmentEnds :: [Point2D]
  }

newWire :: Wire
newWire = WireConstructor { steps=[0], segmentEnds=[(0,0)] }

addSegment' :: (Point2D -> Point2D) -> Wire -> Wire
addSegment' f WireConstructor {steps=s:ss, segmentEnds=e:es} = WireConstructor
  { steps = (s+1):s:ss
  , segmentEnds=(f e):e:es
  }
up :: Wire -> Wire
up = addSegment' (\(x,y) -> (x, y+1))
down :: Wire -> Wire
down = addSegment' (\(x,y) -> (x, y-1))
left :: Wire -> Wire
left = addSegment' (\(x,y) -> (x-1, y))
right :: Wire -> Wire
right = addSegment' (\(x,y) -> (x+1, y))

manhattanDistance :: (Num a) => (a, a) -> a
manhattanDistance (x, y) = (abs x) + (abs y)

addSegment :: Wire -> String -> Wire
addSegment wire (dir:strLength) =
  let segLength = read strLength
      f = case dir of
        'U' -> up
        'D' -> down
        'L' -> left
        'R' -> right
        _ -> error "This should never happen!"
  in last $ take segLength $ tail $ iterate f wire
        
connectionDistance :: String -> Int
connectionDistance input =
  let strings = lines input
      string1 = head strings
      string2 = head $ tail strings
      segmentStrs1 = splitOn "," string1
      segmentStrs2 = splitOn "," string2
      wire1 = foldl addSegment (newWire) segmentStrs1
      wire2 = foldl addSegment (newWire) segmentStrs2
  in
    head . sort $ map manhattanDistance $ map snd $ crossedPaths wire1 wire2

crossedPaths :: Wire -> Wire -> [(Int, Point2D)]
crossedPaths
  WireConstructor {steps=steps1, segmentEnds=ends1}
  WireConstructor {steps=steps2, segmentEnds=ends2}
  = let map1 = M.fromList $ zip ends1 steps1
        map2 = M.fromList $ zip ends2 steps2
        intersections = S.toList $ S.delete (0,0) $ S.intersection (S.fromList ends1) (S.fromList ends2)
    in zip (repeat 0) intersections

star1 :: T.Text -> T.Text
star1 input = (T.pack . show . connectionDistance . T.unpack) input
