import System.IO

main :: IO ()
main = do inputFile <- openFile "input" ReadMode
          input <- hGetContents inputFile
          print $ processInput input

processInput :: String -> Int
processInput = sum . map computeFuel . map read . lines

computeFuel :: Int -> Int
computeFuel m
  | mf <= 0 = 0
  | otherwise = mf + computeFuel mf
  where
    mf = m `div` 3 - 2
