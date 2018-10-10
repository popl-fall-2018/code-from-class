(ns clojure-code.recursion)

(def nums (range 4 12))

(defn my-count
  [lst]
  (if (empty? lst)
    0
    (inc (my-count (rest lst)))))

(my-count nums)

; (my-count (range 100000))

(defn fib
  "The nth Fibonacci number"
  [n]
  (cond
    (= n 0) 0
    (= n 1) 1
    :else (+ (fib (dec n))
             (fib (dec (dec n))))))

(fib 5)
(map fib (range 10))

;(fib 100)

(defn my-reduce
  ([function coll]
   (my-reduce function (first coll) (rest coll)))
  ([function start-val coll]
   (if (empty? coll)
     start-val
     (my-reduce function
                (function start-val
                          (first coll))
                (rest coll)))))

(my-reduce + 1000 nums)

(my-reduce list nums)

(defn first-positive-in-list
  [numbers]
  (if (> (first numbers) 0)
    (first numbers)
    (recur (rest numbers))))

(first-positive-in-list '(-3 -2 -6 4 -2 77))

(first-positive-in-list '(-3 -2))

(first-positive-in-list (range -100000 5))

(defn my-tail-count
  [in-lst]
  (loop [lst in-lst
         c 0]
    (if (empty? lst)
      c
      (recur (rest lst)
             (inc c)))))

(my-tail-count nums)

(my-tail-count (range 100000))


(defn my-tail-fib
  [init-n]
  (loop [n 0
         x 0
         y 1]
    (if (>= n init-n)
      x
      (recur (inc n)
             y
             (+' x y)))))

(map my-tail-fib (range 10))

(my-tail-fib 100)

(my-tail-count (str (my-tail-fib 100000)))

