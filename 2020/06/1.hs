import           Data.List                      ( nub )
import           Data.List.Split                ( splitOn )

main :: IO ()
main =
  readFile "input"
    >>= print
    .   sum
    .   map (length . nub . filter (/= '\n'))
    .   splitOn "\n\n"
