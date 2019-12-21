module Day2 (
  star1,
  star2,
  exec
  ) where

import qualified Data.List as L
{-# LANGUAGE OverloadedStrings #-}

import qualified Data.Text as T
import qualified Data.Vector as V

execAdd :: (Int, V.Vector Int) -> (Int, V.Vector Int)
execAdd (pc, instrs) =
  let x1 = instrs V.! (pc + 1)
      x2 = instrs V.! (pc + 2)
      dst = instrs V.! (pc + 3)
      res = (instrs V.! x1) + (instrs V.! x2)
  in
    (pc + 4, instrs V.// [(dst, res)])

execMul :: (Int, V.Vector Int) -> (Int, V.Vector Int)
execMul (pc, instrs) =
  let x1 = instrs V.! (pc + 1)
      x2 = instrs V.! (pc + 2)
      dst = instrs V.! (pc + 3)
      res = (instrs V.! x1) * (instrs V.! x2)
  in
    (pc + 4, instrs V.// [(dst, res)])

exec' :: (Int, V.Vector Int) -> V.Vector Int
exec' (pc, instrs) = case (instrs V.! pc) of
  1 -> exec' $ execAdd (pc, instrs)
  2 -> exec' $ execMul (pc, instrs)
  99 -> instrs
  _ -> error "This should never happen!"

exec :: [Int] -> [Int]
exec instrs = V.toList $ exec' (0, V.fromList instrs)

prep :: Int -> Int -> [Int] -> [Int]
prep i1 i2 (i0:_:_:instrs) = (i0:i1:i2:instrs)
prep _ _ _ = error "This should never happen!"

star1 :: T.Text -> T.Text
star1 input = T.pack $ show $ exec $ prep 12 02 $ map (read . T.unpack) $ T.splitOn (T.pack ",") input

star2 :: T.Text -> T.Text
star2 input =
  let instrs' = map (read . T.unpack) $ T.splitOn (T.pack ",") input
      alloutputs = do

        noun <- [0..99]
        verb <- [0..99]
        return $ exec $ prep noun verb instrs'
      Just (_:desiredNoun:desiredVerb:_) = L.find (\x -> (head x) == 19690720) alloutputs
      answer = (desiredNoun * 100) + desiredVerb
  in T.pack $ show answer
