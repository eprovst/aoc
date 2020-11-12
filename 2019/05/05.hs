main :: IO [Int]
main = getLine >>= \l -> run $ parse l

data Mode
  = Pos
  | Imm
  deriving (Show)
type Op = Int
data Instr
  = Instr Op Mode Mode Mode
  deriving (Show)

splitOn :: Eq a => a -> [a] -> [[a]]
splitOn x xs
  | null r    = [l]
  | otherwise = l : splitOn x (tail r)
  where
    (l, r) = break (== x) xs

parse :: String -> [Int]
parse = map read . splitOn ','

getMode :: Int -> Mode
getMode 0 = Pos
getMode 1 = Imm
getMode _ = undefined

parseInstr :: Int -> Instr
parseInstr a = Instr (sp 0 1)
               (getMode $ sp 2 2)
               (getMode $ sp 3 3)
               (getMode $ sp 4 4)
  where
    sp :: Int -> Int -> Int
    sp l h = (a `div` 10^l) `mod` 10^(h-l+1)

replaceAt :: Int -> a -> [a] -> [a]
replaceAt idx x xs
  | null r    = xs
  | otherwise = l ++ [x] ++ tail r
  where (l, r) = splitAt idx xs

access :: Int -> Mode -> [Int] -> Int
access i Pos d = d !! i
access i Imm _ = i

execMInstr :: Instr -> Int -> Int -> Int -> [Int] -> [Int]
execMInstr (Instr op lm rm _) l r o d
  | op == 1 = replaceAt o (ld + rd) d
  | op == 2 = replaceAt o (ld * rd) d
  | op == 7 && ld < rd  = replaceAt o 1 d
  | op == 7 && ld >= rd = replaceAt o 0 d
  | op == 8 && ld == rd = replaceAt o 1 d
  | op == 8 && ld /= rd = replaceAt o 0 d
  | otherwise = undefined
  where
    ld = access l lm d
    rd = access r rm d

execIOInstr :: Instr -> Int -> [Int] -> IO [Int]
execIOInstr (Instr op fm _ _) f d
  | op == 3 = getLine >>= \x -> return $ replaceAt f (read x) d
  | op == 4 = print fd >> return d
  | otherwise = undefined
  where
    fd = access f fm d

execJPInstr :: Instr -> Int -> Int -> Int -> [Int] -> Int
execJPInstr (Instr op fm sm _) p f s d
  | op == 5 && fd /= 0 = sd
  | op == 5 && fd == 0 = p + 3
  | op == 6 && fd /= 0 = p + 3
  | op == 6 && fd == 0 = sd
  | otherwise = undefined
  where
    fd = access f fm d
    sd = access s sm d

run :: [Int] -> IO [Int]
run = run' 0

run' :: Int -> [Int] -> IO [Int]
run' p d
  | op == 99
  = return d
  | op == 1 || op == 2 || op == 7 || op == 8
  = run' (p+4) $ execMInstr i (d !! (p+1)) (d !! (p+2)) (d !! (p+3)) d
  | op == 3 || op == 4
  = execIOInstr i (d !! (p+1)) d >>= run' (p+2)
  | op == 5 || op == 6
  = run' (execJPInstr i p (d !! (p+1)) (d !! (p+2)) d) d
  | otherwise
  = error $ "Unknown opcode " ++ show op
  where
    i@(Instr op _ _ _) = parseInstr $ d !! p
