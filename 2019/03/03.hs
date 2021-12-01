import System.IO

main :: IO ()
main = do inputFile <- openFile "input" ReadMode
          input <- hGetContents inputFile
          print $ processInput input


-- Solving Puzzle --

both :: (a -> b) -> (a, a) -> (b, b)
both f (l, r) = (f l, f r)

ttake2 :: [[a]] -> ([a], [a])
ttake2 (as1 : as2 : _) = (as1, as2)
ttake2 _               = undefined

processInput :: String -> Int
processInput s
  = minimum [timing p ls1 + timing p ls2
            | l1 <- ls1
            , l2 <- ls2
            , p <- intersections l1 l2
            , p /= z]
  where
    (ls1, ls2) = both parse . ttake2 $ lines s

splitOn :: Eq a => a -> [a] -> [[a]]
splitOn x xs
  | null r    = [l]
  | otherwise = l : splitOn x (tail r)
  where
    (l, r) = break (== x) xs

parse :: String -> [Line]
parse s = reverse . foldl f [] $ splitOn ',' s
  where
    f []              (a:d) = go z a (read d) : []
    f ls@((_, p) : _) (a:d) = go p a (read d) : ls
    f _               _     = undefined
    go p@(x, y) a d
      | a == 'U'  = (p, (x, y+d))
      | a == 'D'  = (p, (x, y-d))
      | a == 'R'  = (p, (x+d, y))
      | otherwise = (p, (x-d, y))

manhattan :: Point -> Int
manhattan (x, y) = abs x + abs y

timing :: Point -> [Line] -> Int
timing p (l@(s, e) : ls)
  | p `on` l  = distance s p
  | otherwise = llength l + timing p ls
timing _ [] = undefined


-- Computational Geometry --

type Point = (Int, Int)
type Line = (Point, Point)

z :: Point
z = (0, 0)

boundingbox :: Line -> (Point, Point)
boundingbox ((ux, uy), (vx, vy))
  = ((min ux vx, min uy vy), (max ux vx, max uy vy))

quickreject :: Line -> Line -> Bool
quickreject l1 l2 = urx1 < llx2 || urx2 < llx1 ||
                    ury1 < lly2 || ury2 < lly1
  where
    ((llx1, lly1), (urx1, ury1)) = boundingbox l1
    ((llx2, lly2), (urx2, ury2)) = boundingbox l2

intersections :: Line -> Line -> [Point]
intersections l1@((x11, y11), (x12, _)) l2@((x21, y21), _)
  | quickreject l1 l2 = []
  | otherwise         = let
      i | x11 == x12  = (x11, y21)
        | otherwise   = (x21, y11)
      in [i]

on :: Point -> Line -> Bool
(px, py) `on` ((ux, uy), (vx, _))
  | ux == vx  = px == ux
  | otherwise = py == uy

distance :: Point -> Point -> Int
distance (ux, uy) (vx, vy) = abs(ux - vx) + abs(uy - vy)

llength :: Line -> Int
llength (u, v) = distance u v
