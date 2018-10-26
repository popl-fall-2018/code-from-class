module BasicFunctions where


-- Define a constant.
list = [1, 3, 8, 12]

-- square :: (Num a) => a -> a
square x = x * x

-- square 4
-- square 4.4
-- square "hi"
-- :t square
-- -> square :: Num a => a -> a
-- - For now, read as "Call `a` any numeric type. square takes
--   an `a` and returns an `a`

---- Explicit Function Type Declarations
-- Leave below off at first, look at type
concat3times :: String -> String -- String is synonym for [Char]
concat3times s = s ++ s ++ s

-- square only odd numbers
squareOdd x = if odd x
                then x * x
                else x

-- factorial
-- Here, we define the base case through pattern matching on input 0.
fact :: Integer -> Integer -- Leave this off at first
fact 0 = 1
fact x = x * fact (x - 1)


-- list processing
-- map fact [1..10]
-- filter even [1..10]
