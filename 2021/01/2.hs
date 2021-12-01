main :: IO ()
main =
  readFile "input"
    >>= print
    .   numOfIncreases
    .   movingSum
    .   map (read :: String -> Int)
    .   lines

numOfIncreases :: [Int] -> Int
numOfIncreases = length . filter (uncurry (<)) . (\x -> zip x (tail x))

movingSum :: [Int] -> [Int]
movingSum =
  map (\(x, y, z) -> x + y + z) . (\x -> zip3 x (tail x) (tail $ tail x))
