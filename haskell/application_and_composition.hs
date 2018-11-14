---- $ - function application ----

---- Sometimes you need to keep applying functions to the result of
---- other functions
---- Since this isn't a Lisp, don't want all the parentheses

---- Ex:
-- sum (map (^2) (filter even [1..10]))

---- We can use function application to pass the result of one expression
---- to the one on the left
---- Better:
-- sum $ map (^2) $ filter even [1..10]

---- Ex: First number that squared is greater than 1000
-- head $ filter (\x -> x^2 > 1000) [1..]

-- :t ($)
-- ($) :: (a -> b) -> a -> b
---- Takes function from a to b and applies it to an a to get a b
---- Note that $, like all symbol functions, is infix, so the function
----   is the thing before the $.


---- . - function composition----

---- Sometimes you want to create a new function from two other functions,
---- where you'd first apply one and then apply the other to the result.

-- (even . length . show . abs) 33
-- (even . length . show . abs) (-333)
evenDigits :: Integer -> Bool
evenDigits = even . length . show . abs

---- A good use for function composition is to make a function to pass to
---- a higher-order function like map or filter

---- Ex: For integers in [1..x], find the integer part of the cube
---- of the square root.
intCubeSqrt x = map (truncate . (^ 3) . sqrt) [1..x]

---- Ex: Given a list of integers, return those that have an even
---- number of digits
evenNumberDigits :: [Integer] -> [Integer]
evenNumberDigits list = filter (even . length . show . abs) list
---- Note could do partial application with no explicit argument

-- evenNumberDigits [2, 32, 533, -42, -400, 9000]
