(ns clojure-code.hof)

(def nums (range 4 12))
nums


; apply

;(+ nums) ; not what we want
(apply + nums)

(str nums)
(apply str nums)

(max 7 3 8 2)
(max nums)
(apply max nums)

; map - applies a function to every element of a list, collecting the results in a new list

(inc 5)

;(apply inc nums)

(map str
     nums
     '("a" "b" "c" "d"))

nums

(vec (map inc [1 2 6]))


(defn square
  [x]
  (* x x))

(map square nums)

(map (fn [x] (* x 5))
     nums)

(map #(* % 5) nums)

(map count '("what" "is" "this" "nonsense"))

(defn sorted-by-length?
  "Returns true if argument list is a list of words
  sorted by length"
  [words]
  (apply <
         (map count words)))

(sorted-by-length? '("hi" "there" "wednesday"))
(sorted-by-length? '("hi"))
(sorted-by-length? '("what" "is" "this" "nonsense"))


(def people '({:name "Kelly" :age 22}
              {:name "Francis" :age 34}
              {:name "Olivia" :age 19}))

; want a list of the names of all people in our database
(map :name people)
(map #(get % :name)
     people)

(defn addplus100
  [x y]
  (+ x y 100))

(def fns [+ - * / mod < str vector (fn [x y] 2) addplus100])

(map (fn [function]
       (function 5 8))
     fns)

;; filter - apply function to each element, return the
;; elements that make the function return true

nums
(filter even? nums)

(filter (fn [x] (> x 8))
        nums)

(filter #(> % 8) nums)

(filter #(>= (count %) 5)
        '("only" "the" "longest" "words" "will" "survive"))

; reduce - interposes function calls between elements
;  of a list. -- in Ruby, inject

(reduce + nums)
(apply + nums)

(reduce + 100 nums)

(reduce (fn [x y] (str x ", " y))
        nums)

(reduce #(str %1 ", " %2)
        nums)

(apply str (interpose ", " nums))

(apply #(+ % %1 %2 %3 %4 %5 %6 %7 %8 %9) (range 1 10))

(reduce conj '() nums)
(reverse nums) ; another way

(reduce list nums)
(reduce list '() nums)


(def letters '(:a :b :a :c :a :a :a :c :c :a :a :a :b :d :a :b))

(defn inc-count-in-map
  [count-map k]
  (assoc count-map
         k
         (inc (get count-map k 0))))


(reduce inc-count-in-map {} letters)

(reductions inc-count-in-map {} letters)

(frequencies letters)

(reduce #((rand-nth [+ - * /]) %1 %2)
        nums)

;; Function that finds all prime numbers less than some input upper-bound.

(defn prime?
  "Returns true if x is prime. False otherwise."
  [x]
  (if (< x 2)
    false
    (empty? (filter (fn [divisor] (zero? (mod x divisor)))
                    (range 2 x)))))

(defn primes
  "Returns a list of all prime numbers less than upper-bound"
  [upper-bound]
  (filter prime?
          (range upper-bound)))

;; Higher-order function that returns a function

(defn square
  [x]
  (* x x))

(defn cube
  [x]
  (* x x x))

(defn powerer
  "Returns a function that raises argument to exponent power"
  [exponent]
  (fn [argument] ; NOTE: returns an anonymous function
    (apply *
           (repeat exponent argument))))

(def cube (powerer 3))

(cube 5)

(def to-the-tenth (powerer 10))

(to-the-tenth 2)
(to-the-tenth 3.7)

((powerer 10) 2)

;; This is a _closure_ - a function with an environment,
;; which gives each free variable a value at the time
;; the function was created

(defn concat-string-with
  "Return a function that takes a string and concats
  it onto start-string"
  [start-string]
  (fn [s]
    (str start-string s)))

(def say-hello (concat-string-with "hello "))

(say-hello "Jerry")

(def t-minus (concat-string-with "T-minus "))

(t-minus 10)

(map t-minus (range 10 -1 -1))


(defn log-fn-then-execute
  "Logs (prints) the function and then executes it.
  Note: this function takes a function as an argument,
  and also returns a function."
  [f]
  (fn [& args]
    (println (conj args f))
    (apply f args)))

(def logged+ (log-fn-then-execute +))

(logged+ 4 3)
(logged+ 1 2 3 4 5)

(logged+ (logged+ 4 5) (logged+ 6 7))


(def logged-str (log-fn-then-execute str))

(logged-str "hi" "there")

(map logged-str (range 5))

(defn square
  [x]
  (* x x))

(def logged-square (log-fn-then-execute square))

(logged-square 5)

(def logged-anon-square (log-fn-then-execute #(* % %)))

(logged-anon-square 3)

(def logged-logged (log-fn-then-execute log-fn-then-execute))

(def ll+ (logged-logged +))

(ll+ 5 6)
