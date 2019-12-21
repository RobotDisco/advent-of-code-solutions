{-# LANGUAGE OverloadedStrings #-}

module Day3 (
  star1
  ) where

import Data.List (sort)
import Data.List.Split (splitOn)
import qualified Data.Set as S
import qualified Data.Text as T

-- type Point2D = (Int, Int)


up = (\(x,y) -> (x, y+1), \(x,y) l -> (x, y+l))
down = (\(x,y) -> (x, y-1), \(x,y) l -> (x, y-l))
left = (\(x,y) -> (x-1, y), \(x,y) l -> (x-l, y))
right = (\(x,y) -> (x+1, y), \(x,y) l -> (x+l, y))

manhattanDistance (x, y) = (abs x) + (abs y)

addSegment (currEnd, coordsInWire) (dir:strLength) =
  let segLength = read strLength
      fs = case dir of
        'U' -> up
        'D' -> down
        'L' -> left
        'R' -> right
        _ -> error "This should never happen!"
  in (((snd fs) currEnd segLength), S.union coordsInWire $ S.fromList $ take segLength $ tail $ iterate (fst fs) currEnd)
        
connectionDistance input =
  let initEnd = (0, 0)
      initCoords = S.empty
      wires = lines input
      wire1 = head wires
      wire2 = head $ tail wires
      segmentStrs1 = splitOn "," wire1
      segmentStrs2 = splitOn "," wire2
      coords1 = foldl addSegment (initEnd, initCoords) segmentStrs1
      coords2 = foldl addSegment (initEnd, initCoords) segmentStrs2
      intersections = S.toList $ S.intersection (snd coords1) (snd coords2)
  in
    head . sort $ map manhattanDistance intersections

star1 input = (T.pack . show . connectionDistance . T.unpack) input
