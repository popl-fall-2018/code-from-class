import System.Random


three_random_ints :: StdGen -> (Char, Char, Char)
three_random_ints gen = (int1, int2, int3)
  where (int1, gen1) = random gen
        (int2, gen2) = random gen1
        (int3, gen3) = random gen2
