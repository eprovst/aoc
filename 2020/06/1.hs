import           Data.List                      ( union )
import           Data.List.Split                ( splitOn )

main :: IO ()
main =
  readFile "input"
    >>= print
    .   sum
    .   map (length . foldl1 union . lines)
    .   splitOn "\n\n"
