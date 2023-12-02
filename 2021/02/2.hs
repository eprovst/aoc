main :: IO ()
main =
  readFile "input"
    >>= print
    .   (\(p, d, a) -> p * d)
    .   finalState
    .   map parseAction
    .   lines

data Action = Forward Int | Up Int | Down Int

parseAction s = case words s of
    ["forward", n] -> Forward $ read n
    ["up", n] -> Up $ read n
    ["down", n] -> Down $ read n

finalState :: [Action] -> (Int, Int, Int)
finalState as = aux as (0, 0, 0)
  where
    aux [] (p, d, a) = (p, d, a)
    aux (Forward n : as) (p, d, a) = aux as (p + n, d + a*n, a)
    aux (Up n : as) (p, d, a) = aux as (p, d, a - n)
    aux (Down n : as) (p, d, a) = aux as (p, d, a + n)
