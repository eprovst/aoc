main :: IO ()
main =
  readFile "input"
    >>= print
    .   (\(a,b) -> a*b)
    .   finalCoord
    .   map parseAction
    .   lines

data Action = Forward Int | Up Int | Down Int

parseAction s = case words s of
    ["forward", n] -> Forward $ read n
    ["up", n] -> Up $ read n
    ["down", n] -> Down $ read n

finalCoord :: [Action] -> (Int, Int)
finalCoord as = aux as (0, 0)
  where
    aux [] (p, d) = (p, d)
    aux (Forward n : as) (p, d) = aux as (p + n, d)
    aux (Up n : as) (p, d) = aux as (p, d - n)
    aux (Down n : as) (p, d) = aux as (p, d + n)
