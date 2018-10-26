-- NOTE: The following will only work in the interpreter - if you load this
-- file, you will get a "parse error: naked expression at top level"

-- arithmetic
5 + 2
4.3 * 3.1
65 / 7
div 65 7
65 `div` 7
7 * (52 - 31)

-- note - spaces used for function application, not parens
succ 4     -- successor
max 42 23

-- function application before arithmetic
succ 10 * 5

------------------------------------------------------
-- Infix vs Prefix --

-- Normal functions (using letters and numbers) are applied in prefix notation
-- (ex: mod 50 22) can be called infix using backticks (ex: 50 `mod` 22).
--
-- Functions using special characters are used infix by default (ex: 4 + 2 or
-- "hi" == "there"), but can be used prefix by surrounding with parens,
-- (ex: (+) 4 2). This is also necessary for passing them to other functions,
-- such as "foldl1 (+) [1,2,3]", or to find their type (ex: ":t (==)").
------------------------------------------------------

-- comparisons
5 == 6
23.1 >= 4.2

-- strings
"abc"
['a', 'b', 'c'] -- exactly the same

-- types of things
:t 4
:t 13.3
:t 'r'
:t "abc"
:t True

-- lists - must be homogeneous
[1,2,3,4]
head [1,2,3,4]
tail [1,2,3,4]
[1,2,3,4] ++ [5,6,7]
0 : [1,2,3,4]
[1.1, 2.2, 3.3, 4.4] !! 2

"hello" ++ "world" --strings are just lists
'a' : " good book"
"haskell" !! 3

-- other list things
length [1,2,3]
null []
null [1,2,3,4]
reverse "haskell"
take 5 [1,2,3,4,5,6,7,8,9,10]

elem 2 [1,2,3]
elem 4 [1,2,3]
elem 'a' "hat"
elem 'a' [1,2,3] -- breaks

-- can't mix types in lists
[1, 2.4, "hi"]

-- ranges
[0..10]
[1,3..30]
[10,9..1]

['a'..'t']
['G'..'g']

-- list comprehensions
[x + 5 | x <- [1..10]]
[x + 100 | x <- [1..10], odd x]
[(-x) | x <- [1..20], x*x < 100, odd x]

[x+y | x <- [1..5], y <- [100..102]]
[x+y | x <- [1..5], y <- [100..102], x*y > 200]

[(color, fruit) | color <- ["red", "blue", "green"],  fruit <- ["apple", "berry", "mango"]]

[c | c <- "Hello There World", elem c ['a'..'z']]

-- tuples - can be heterogeneous; fixed length (can't add elements)
(1, 2, "hi")

zip ["hi", "there", "world"] [1..10]
