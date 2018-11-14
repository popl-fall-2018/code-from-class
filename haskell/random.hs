---- Randomness ----

import System.Random

-- Remember, every function must return the same value for given arguments.
-- To deal with this, random number functions take a random number generator
--   in a particular state as an argument!

-- How do random generators work?
--  - A pseudorandom generator has a state, which is updated after each call
--  - Ex: newNum = (a * pevNum + b) mod m
--  -     where a, b, and m are large integers, and prevNum is the prev state
--  - Since Haskell can't simply change the state of a global generator, random
--    functions must return the generator so it can generate again.

-- > :t random
-- random :: (RandomGen g, Random a) => g -> (a, g)

-- So, random takes a random generator g and some type that can be random a,
--   and returns a random number from type a as well as a generator!

-- > :t mkStdGen
-- mkStdGen :: Int -> StdGen

-- mkStdGen takes an integer, and returns a random generator in a particular
--   state depending on the integer.
-- Since it is a pure function, the same Int will always create the same StdGen

-- > mkStdGen 5
-- 6 1
-- > mkStdGen 5
-- 6 1

-- This means that these two generators will generate the same numbers.

-- > random (mkStdGen 5) :: (Int, StdGen)
-- > random (mkStdGen 5) :: (Int, StdGen)

-- Of course, generators initialized with different ints will give different
-- random numbers

-- > random (mkStdGen 6) :: (Int, StdGen)  

-- The second thing in the returned tuple (the two numbers with the space)
--   is the next state of the StdGen
--  - You could store this and use it to generate the next number.

-- > (a, nextGen) = random (mkStdGen 6) :: (Int, StdGen)
-- > a
-- > nextGen
-- > (b, nextGen2) = random nextGen :: (Int, StdGen)
-- > b

-- You can create other random types by giving different type annotations

-- > random (mkStdGen 5) :: (Float, StdGen)  
-- (0.8874528,1016786924 1655838864)
-- > random (mkStdGen 5) :: (Bool, StdGen)  
-- (True,240084 40692)

-- Let's write a function that produces 3 random integers:
-- (show what happens if you use gen each time)

threeInts :: StdGen -> (Int, Int, Int)
threeInts gen = (int1, int2, int3)
  where (int1, gen1) = random gen :: (Int, StdGen)
        (int2, gen2) = random gen1 :: (Int, StdGen)
        (int3, gen3) = random gen2 :: (Int, StdGen)
     
-- threeInts (mkStdGen 5)
-- threeInts (mkStdGen 5) -- Same ints!
-- threeInts (mkStdGen 6) -- Different ints


---- More randoms ----

-- What if we want a bunch of random numbers?
-- It's a pain to have to get and use the generator each time.
-- randoms gives an infinite list of random things!

-- take 5 $ randoms (mkStdGen 5) :: [Int]

-- > :t randoms
-- randoms :: (RandomGen g, Random a) => g -> [a]

-- Note that randoms doesn't return a random generator
-- After the generator is used to make one number, it then needs to be used to
--   make the next in the infinite sequence!

-- Practice: Generate random Ints until one has at least 10 7's in it:

ten7s int = number7s >= 10
  where stringInt = show int
        number7s = length $ filter (== '7') stringInt

firstRandomIntGTten7s gen = head $ filter ten7s $ randoms gen

-- > firstRandomIntGTten7s (mkStdGen 5)
-- 981767577757777717

---- Random in Range ----

-- What if we want a random thing from a particular range?
-- randomR takes a range given by a tuple as well as a generator:

-- > :t randomR
-- randomR :: (RandomGen g, Random a) => (a, a) -> g -> (a, g)

-- > randomR (1,6) (mkStdGen 5)
-- (6,240084 40692)

-- > randomR ('a','z') (mkStdGen 5)
-- ('x',240084 40692)

-- Similarly, randomRs gives an infinite sequence of things from a range:

-- > take 10 $ randomRs (1, 6) (mkStdGen 5)
-- [6,2,2,1,3,2,5,1,5,4]

-- > take 10 $ randomRs ('a', 'z') (mkStdGen 5)
-- "xvtoobaqud"

-- Practice: Generate random rolls of a 6-sided die until get 5 equal numbers
--   in a row (a Yahtzee!); count total number of rolls


rollsUntilYahtzee gen = numsUntilYahtzee rolls
  where rolls = randomRs (1, 6) gen

numsUntilYahtzee :: [Int] -> Integer
numsUntilYahtzee allRolls @ (r1:r2:r3:r4:r5:_)
  | r1 == r2 && r2 == r3 && r3 == r4 && r4 == r5 = 1
  | otherwise = succ $ numsUntilYahtzee $ tail allRolls

-- > rollsUntilYahtzee (mkStdGen 2)
-- 100
-- > take 5 $ drop 99 $ randomRs (1, 6) (mkStdGen 2)
-- [5,5,5,5,5]


---- getStdGen ----

-- What if we want to use random numbers in real programs?
-- We won't want to use mkStdGen with a fixed integer, since it will give
--   us the same random numbers each time we run it.
-- We can use getStdGen:

-- > :t getStdGen
-- getStdGen :: IO StdGen

-- getStdGen returns an IO StdGen - a generator that requires IO?
-- When a program is run, it creates a global generator based on something like
--   the system time.
-- getStdGen uses the global generator, and thus will be different each time
--   - Hense the IO part - impure function!

main1 = do
  gen <- getStdGen
  print $ take 5 $ (randomRs (1, 6) gen :: [Int])

-- Note that getStdGen does not update the global generator, so we can't
-- simply use it twice:

main2 = do  
    gen <- getStdGen  
    print $ fst $ (random gen :: (Int, StdGen))
    gen2 <- getStdGen  
    print $ fst $ (random gen2 :: (Int, StdGen))

-- Instead, we can split the global random generator into two using newStdGen

main3 = do  
    gen <- getStdGen  
    print $ fst $ (random gen :: (Int, StdGen))
    gen2 <- newStdGen  
    print $ fst $ (random gen2 :: (Int, StdGen))

