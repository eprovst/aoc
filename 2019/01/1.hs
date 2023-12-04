import System.IO

main :: IO ()
main = do inputFile <- openFile "input" ReadMode
          input <- hGetContents inputFile
          print $ processInput input

processInput :: String -> Int
processInput = sum . map (\m -> m `div` 3 - 2) . map read . lines
