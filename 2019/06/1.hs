import System.IO
import qualified Data.Map as Map
import qualified Data.Set as Set

data Mass = YOU | SAN | Obj !String
  deriving (Eq, Ord)

main :: IO ()
main = do inputFile <- openFile "input" ReadMode
          input <- hGetContents inputFile
          print $ getNumOrbits input
  where
    getNumOrbits :: String -> Int
    getNumOrbits = (\om ->
                      foldl (\c m ->
                                c + (length . allOrbiters om) m
                            ) 0 (masses om)) . Map.fromList . map parse . lines

parent :: Map.Map Mass Mass -> Mass -> Mass
parent om o = Map.findWithDefault (Obj "COM") o om

transfersBetween :: Map.Map Mass Mass -> Mass -> Mass -> Int
transfersBetween om a b = f (Set.singleton a) (Set.singleton b) 0
  where
    f :: Set.Set Mass -> Set.Set Mass -> Int -> Int
    f as bs n
      | Set.null (Set.intersection as bs)
      = f bs (Set.union (ps as) (dos as)) $ succ n
      | otherwise
      = n
    ps :: Set.Set Mass -> Set.Set Mass
    ps  = foldl (\s e -> Set.insert (parent om e) s)        Set.empty
    dos :: Set.Set Mass -> Set.Set Mass
    dos = foldl (\s e -> Set.union (directOrbiters om e) s) Set.empty

directOrbiters :: Map.Map Mass Mass -> Mass -> Set.Set Mass
directOrbiters om m = Map.foldlWithKey (\s o p -> if p == m
                                                     then Set.insert o s
                                                     else s) Set.empty om

allOrbiters :: Map.Map Mass Mass -> Mass -> Set.Set Mass
allOrbiters om m
  | Set.null dos = Set.empty
  | otherwise    = Set.unions $ dos : map (allOrbiters om) (Set.toList dos)
  where
    dos = directOrbiters om m

masses :: Map.Map Mass Mass -> Set.Set Mass
masses os = foldl (\s p -> Set.insert p s) Set.empty os

breakOn :: Eq a => a -> [a] -> ([a], [a])
breakOn x xs
  | null s    = (f, [])
  | otherwise = (f, tail s)
  where
    (f, s) = break (== x) xs

parse :: String -> (Mass, Mass)
parse s
  | o == "SAN" = (SAN, Obj p)
  | o == "YOU" = (YOU, Obj p)
  | otherwise  = (Obj o, Obj p)
  where
    (p, o) = breakOn ')' s
