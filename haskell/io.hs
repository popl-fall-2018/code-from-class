module Main where

---- Printing ----

-- Can't change state in Haskell
--  - Every function will return same outputs for same inputs.
--  - This includes changing the state of output devices (printing) and
--    getting state from input devices such as keyboard
--  - Also, can't simply call a function to get a random number -- random
--    number generators depend on the state of the generator!

-- Hello World!
main = putStrLn "Hello World!"

-- Compile:
-- > ghc --make io.hs
-- > ./io

-- Interpret:
-- > runhaskell io.hs

-- GHCI
-- > :l io
-- > main

-- > :t putStrLn
-- putStrLn :: String -> IO ()
--  - This says that putStrLn takes a String and returns an IO action with
--    result type ()
--  - An IO action does some side-effecty IO, and has a return value
--  - Printing has no meaningful return value, so empty tuple as dummy return

-- "Don't think of a function like putStrLn as a function that takes a string
--  and prints it to the screen. Think of it as a function that takes a string
--  and returns an I/O action. That I/O action will, when performed, print
--  beautiful poetry to your terminal." - Learn You A Haskell

-- Ways to do IO actions:
--  - Give an IO action the name "main" and run the program
--  - Run the IO action (or function that performs an IO action) in GHCI
--  - Put the IO action inside a do block that is eventually passed to main
--    or a function called in GHCI


---- Do Syntax ----

-- To perform more than one IO operation, need to use "do" keyword.
-- - do, followed by one or more line of IO operations
-- - last operation must return an IO action

main2 = do
  putStrLn "Give me your name!"
  name <- getLine
  putStrLn $ "HELLO " ++ name


---- Input ----

-- getLine gets a line from standard input
-- Note that getLine isn't required to return the same value when run twice!
--  - Impure function!
--  - This is why it returns an IO action:

-- > :t getLine
-- getLine :: IO String

-- getLine also returns an IO action, but this one has a result type String
-- "<-" takes the result out of an IO action and binds the result to the
--    given name
-- <- can only be used within another IO action

-- Note that thing bound with <- can be passed as argument to regular function:

colorJudge color
  | color == "yellow" = "yellow is the best color!!!"
  | otherwise = color ++ " is ok, but not as good as yellow."

main3 = do
  putStrLn "Tell me your favorite color:"
  color <- getLine
  putStrLn $ colorJudge color

-- Cannot assign normal variables / functions in a do block; instead, use let

-- Ex: Add an input number to the first 6 primes
main4 = do
  putStrLn "Number please:"
  numStr <- getLine
  let addToInput x = x + (read numStr)
      mapped = map addToInput [2, 3, 5, 7, 11, 13]
  putStrLn $ "Adding " ++ numStr ++ " to the first 6 primes gives " ++ (show mapped)


---- IO functions and return ----

-- Any function that does IO must return an IO action to indicate that it is impure

-- This function requires either a type signature or the :: Integer for read
getInt :: IO Integer
getInt = do
  line <- getLine
  return (read line :: Integer)

main5 = do
  putStrLn "Integer please:"
  int <- getInt
  putStrLn $ (show int) ++ " squared is " ++ (show $ int * int)

-- return
--  - Does not do what you think it does!
--  - It turns a regular value into an IO action of that type
--  - Since an IO action can get its value with <-, this works:

main6 = do
  a <- return "This"
  b <- return " is silly!"
  putStrLn $ a ++ b

-- > :t return
-- return :: Monad m => a -> m a
--  - It turns out that an IO action is in typeclass Monad!


---- Aside: Monads ----
-- A _monad_ is a structure that defines a sequence of computational steps.
-- Monads allow you to do side effects and change state for things like:
--  - IO
--  - exception handling
--  - random number generation
--  - concurrency
-- Thus, to do IO, you define a sequence of computational steps, assign it
--   to main, and then run it.
---- End Aside ----


---- Practice: Get List Of Strings ----

-- Write the following function:
-- getListOfStrings -- gets a list of strings from the user, stopping at RET

getListOfStrings :: IO [String]
getListOfStrings = do
  line <- getLine
  if null line
    then return []
    else do
      listOfStrings <- getListOfStrings
      return (line : listOfStrings)

main7 = do
  putStrLn "Enter some strings:"
  strings <- getListOfStrings
  print strings
  print $ map length strings
  putStrLn "----"
  mapM_ putStrLn strings

-- Note: print - takes anything that can be shown and prints the string version
-- :t print
-- print :: Show a => a -> IO ()

-- mapM_ maps a function that returns an IO action over a list, and then
-- does all of the IO actions.
