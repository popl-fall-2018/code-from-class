
import System.Random

deleteAtIndex :: Int -> [a] -> [a]
deleteAtIndex index list = (take index list) ++ (drop (succ index) list)


shuffle :: [a] -> StdGen -> [a]
shuffle [] _ = []
shuffle things gen = element : (shuffle removed newGen)
  where (index, newGen) = randomR (0, (pred $ length things)) gen :: (Int, StdGen)
        element = things !! index
        removed = deleteAtIndex index things
        

main = do
  gen <- getStdGen
  let ints = [1..10]
  putStrLn $ "Shuffle of " ++ show ints
  print $ shuffle ints gen
