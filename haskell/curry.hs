-------- Partially Applied Functions --------

multThenAdd x y z = (x * y) + z
-- What is the type?

-- We can use partial application to get new functions
multBy5ThenAdd y z = (5 * y) + z
-- equivalent to
multBy5ThenAdd' y z = multThenAdd 5 y z
-- equivalent to
multBy5ThenAdd'' = multThenAdd 5

-- We can do the same with built-in functions
divide100 x = div 100 x
-- equivalent to
divide100' = div 100

add5 x = x + 5
--equivalent to
add5' = (+ 5)            -- here, 5 is the second argument

equalsA x = x == 'A'
--equivalent to
equalsA' = (==) 'A'      -- here, 'A' is the first argument

divideBy14 x = div x 14
--equivalent to
divideBy14' = (`div` 14) -- here, 14 is the second argument

-- Any of these partially applied functions can be used as anonymous functions
-- map (+ 5) [1..10]
-- filter (10 >) [1..20]
-- filter (> 10) [1..20]


-------- Currying --------

-- This will explain why partially applied functions work
-- _Currying_ takes a function with multiple arguments and breaks it into
-- multiple functions with 1 argument each.
-- (almost) Every function in Haskell really takes only 1 argument

-- :t (+)
-- (+) :: Num a => a -> a -> a
-- (+) :: Num a => a -> (a -> a)

-- multThenAdd x y z = (x * y) + z
-- multThenAdd :: Num a => a -> a -> a -> a
-- multThenAdd :: Num a => a -> (a -> (a -> a))

-- :t (==)
-- (==) :: Eq a => a -> a -> Bool

-- So, when you partially apply a function, you are getting back a function
-- of the remaining arguments.

-- :t map
-- map :: (a -> b) -> [a] -> [b]
-- map :: (a -> b) -> ([a] -> [b])
---- Says that map takes a function from 'a' to 'b' and returns a function
---- from [a] to [b].

-- mapSquare = map (^ 2)
-- mapSquare [1, 3, 5, 7]
-- :t mapSquare
-- mapSquare :: Num b => [b] -> [b]

-- :t filter
-- filter :: (a -> Bool) -> [a] -> [a]
---- filter takes a function from 'a' to Bool and returns a function from [a]
---- to [a]


-------- Anonymous Functions --------

-- (\x -> x+3)
---- equivalent to
-- (+ 3)
---- So, often just use partially applied functions. But, anonymous functions
---- are sometimes useful

longWords words = filter (\w -> length w > 5) words
-- longWords ["hi", "there", "independent", "scafold", "star"]

-- foldl1 (\x y -> (2+x) * (2+y)) [1..4]
