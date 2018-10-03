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


