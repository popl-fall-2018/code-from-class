
mult_then_add :: Num a => a -> (a -> (a -> a))
mult_then_add x y z = (x * y) + z


mult_by_5_then_add y z = (5 * y) + z
-- equivalent to
mult_by_5_then_add' y z = mult_then_add 5 y z
-- equivalent to
mult_by_5_then_add'' = mult_then_add 5

divide100 x = div 100 x
-- equivlent to
divide100' = div 100

divide_by_14 x = div x 14

divide_by_14' = (`div` 14)

add5 x = x + 5

add5' = (+ 5)

add5'' = (+) 5

equalsA x = x == 'A'

equalsA' = (== 'A')

equalsA'' = (==) 'A'





mystery = map (^ 2)


