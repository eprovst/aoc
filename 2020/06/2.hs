import           Data.List                      ( intersect )
import           Data.List.Split                ( splitOn )

main :: IO ()
main =
  readFile "input"
    >>= print
    .   sum
    .   map (length . foldl1 intersect . lines)
    .   splitOn "\n\n"
