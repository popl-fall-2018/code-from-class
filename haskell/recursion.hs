

sum' [] = 0
sum' (x:xs) = x + sum' xs


filter' _ [] = []
filter' fn (x:xs)
  | fn x = x : filter' fn xs
  | otherwise = filter' fn xs
