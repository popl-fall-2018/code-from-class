import System.Random


three_random_ints :: StdGen -> (Char, Char, Char)
three_random_ints gen = (int1, int2, int3)
  where (int1, gen1) = random gen
        (int2, gen2) = random gen1
        (int3, gen3) = random gen2


--- Generate random Ints until one has at least ten 7's in it

ten7s num = numOf7s >= 10
  where numOf7s = length $ filter (== '7') $ show num


firstRandomIntGTten7s gen = head $ filter ten7s $ randoms gen


-- rolls until yahtzee

rollsUntilYahtzee gen = numsUntilYahtzee rolls
  where rolls = randomRs (1,6) gen

numsUntilYahtzee :: [Int] -> Integer
numsUntilYahtzee allRolls @ (r1:r2:r3:r4:r5:_)
  | r1 == r2 && r2 == r3 && r3 == r4 && r4 == r5 = 0
  | otherwise = succ $ numsUntilYahtzee $ tail allRolls


main1 = do
  gen <- getStdGen
  print $ take 5 $ (randomRs (1,6) gen :: [Int])


main = do
  gen <- getStdGen
  print $ fst $ (random gen :: (Int, StdGen))
  gen2 <- newStdGen
  print $ fst $ (random gen2 :: (Int, StdGen))


-- shuffle lst - returns list in random order
-- only use randomR

shuffle [1,2,3,4,5] gen -> [5,2,1,3,4]

