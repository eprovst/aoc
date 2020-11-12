import System.IO

main :: IO ()
main = do inputFile <- openFile "input" ReadMode
          input <- hGetContents inputFile
          print $ processInput input

breakOn :: Eq a => a -> [a] -> ([a], [a])
breakOn x xs
  | null s    = (f, [])
  | otherwise = (f, tail s)
  where
    (f, s) = break (== x) xs

both :: (a -> b) -> (a, a) -> (b, b)
both f (x, y) = (f x, f y)

processInput :: String -> Int
processInput s
  = length [p
           | p <- map show [l..h]
           , containsStrictDouble p
           , isIncreasing p]
  where
    (l, h) = both (read :: String -> Int) $ breakOn '-' s

group :: Eq a => [a] -> [[a]]
group = foldr f []
  where
    f y [] = [[y]]
    f y ((x : xs) : xss)
      | x == y    = (y : x : xs) : xss
      | otherwise = [y] : (x : xs) : xss
    f _ _  = undefined

containsDouble :: String -> Bool
containsDouble s = any ((>= 2) . length) $ group s

containsStrictDouble :: String -> Bool
containsStrictDouble s = any ((== 2) . length) $ group s

isIncreasing :: String -> Bool
isIncreasing []        = True
isIncreasing [_]       = True
isIncreasing (c1:c2:s) = c1 <= c2 && isIncreasing (c2 : s)
