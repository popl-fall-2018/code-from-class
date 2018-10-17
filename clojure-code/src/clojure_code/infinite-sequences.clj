(ns clojure-code.infinite-sequences)


(defn my-filter
  [func lst]
  (cond
    (empty? lst) lst
    (func (first lst)) (conj (my-filter func (rest lst))
                             (first lst))
    :else (my-filter func (rest lst))))

(my-filter even? (range 20))

; (my-filter even? (range 2000000))

(defn my-filter-tail
  [func lst]
  (loop [lst lst
         result '()]
    (cond
      (empty? lst) (reverse result)
      (func (first lst)) (recur (rest lst)
                                (conj result (first lst)))
      :else (recur (rest lst)
                   result))))

(my-filter-tail even? (range 20))

(take 20 (my-filter-tail even? (range 20000000)))

(take 20 (filter even?
                 (range 200000000)))

;; Infinite sequences

; (range) ; all numbers between 0 and infinity

(take 5 (range))
(range 5)

(nth (range) 10)

(first (filter (fn [x] (> x 1000))
               (range)))

(take 10 (map #(* % %)
              (range)))


(first (filter (fn [x] (> x 1000000))
               (map #(* % %) (range))))


; repeat
(repeat 5 :hi)

(take 10 (repeat :hi))


(take 100 (map str
               (repeat "$")
               (range)))

(take 10 (repeatedly rand))
(repeatedly 10 rand)

(take 10 (map #(+ 100.0 %)
              (repeatedly rand)))


; iterate

(take 5 (iterate inc 10))

(take 8 (iterate list 9))


(take 10 (iterate #(* % 2)
                  1))

(nth (iterate #(*' % 2)
                  1) 10000)

(def infinite-foobar
  (iterate (fn [s] (str s "bar"))
           "foo"))

(take 5 infinite-foobar)

(first (filter #(> (count %) 40)
               infinite-foobar))

(defn next-fib
  [[x y]]
  [y (+' x y)])

(next-fib [0 1])
(next-fib [1 1])
(next-fib [1 2])

(def fib-sequence
  (map first (iterate next-fib [0 1])))

(take 100 fib-sequence)

(defn fast-fib
  [n]
  (nth fib-sequence n))

(fast-fib 100)

(fast-fib 100001)

(fast-fib 99999)

