module Day2 (
  exec
  ) where

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
