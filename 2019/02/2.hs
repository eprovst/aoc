main :: IO ()
main = getLine >>= \l -> print $ searchNV (parse l) !! 0

searchNV :: [Int] -> [Int]
searchNV p = [n*100 + v | n <- [0..99], v <- [0..99],
              (== 19690720) . (!! 0) . run . replaceAt 1 n . replaceAt 2 v $ p]

parse :: String -> [Int]
parse = map read . splitOn ','

splitOn :: Eq a => a -> [a] -> [[a]]
splitOn x xs
  | null r    = [l]
  | otherwise = l : splitOn x (tail r)
  where
    (l, r) = break (== x) xs

replaceAt :: Int -> a -> [a] -> [a]
replaceAt idx x xs
  | null r    = xs
  | otherwise = l ++ [x] ++ tail r
  where (l, r) = splitAt idx xs

doOp :: Int -> [Int] -> (Int -> Int -> Int) -> [Int]
doOp p d op = let l = d !! (d !! (p + 1))
                  r = d !! (d !! (p + 2))
                  o = d !! (p + 3)
              in replaceAt o (l `op` r) d

run :: [Int] -> [Int]
run = run' 0

run' :: Int -> [Int] -> [Int]
run' p d
  | op == 99  = d
  | op == 1   = run' (p + 4) (doOp p d (+))
  | op == 2   = run' (p + 4) (doOp p d (*))
  | otherwise = error $ "Undefined opcode " ++ show op
  where
    op = d !! p
