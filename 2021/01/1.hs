main :: IO ()
main =
  readFile "input"
    >>= print
    .   numOfIncreases
    .   map (read :: String -> Int)
    .   lines

numOfIncreases :: [Int] -> Int
numOfIncreases = length . filter (uncurry (<)) . (\x -> zip x $ tail x)
