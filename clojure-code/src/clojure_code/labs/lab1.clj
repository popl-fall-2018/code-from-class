(ns clojure-code.labs.lab1)

;; These are Prof. Helmuth's functions for the lab problems

; 1. Write a function that takes a string as its argument, and tells whether or not it is a legal Tweet. If the string has 0 characters, return a message that the Tweet was empty. If it has more than 140 characters, return a message that it was too long. Otherwise, return a message saying that it is legal and the number of characters it contains. Each message should be a returned string.

(defn legal-tweet
  [tweet]
  (cond
    (empty? tweet) "Empty tweet."
    (> (count tweet) 140) "Your tweet has too many characters!"
    :else (str "Your tweet has " (count tweet) " characters")))

(legal-tweet "")
(legal-tweet "Hello world!")
(legal-tweet "This tweet is toooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo long!")


; 2. Write a function that takes a list and another thing as arguments. The function should return the list with 3 copies of the thing added to the beginning of the list.

(defn add-3-copies
  [elements thing]
  (conj (conj (conj elements thing)
              thing)
        thing))

(add-3-copies '(1 2 3 4) 5)

; 3. Write a function that takes a list of strings, and returns a list of the second character in each of those strings.


(defn second-chars
  [strings]
  (map second strings))

(second-chars '("Well" "isn't" "that" "nifty"))


; 4. Write a function that takes two x-y pairs as vectors and returns the Euclidean distance between them. Hint: you'll need Math/sqrt.

(defn distance
  [[x1 y1] [x2 y2]]
  (let [diffx (- x1 x2)
        diffy (- y1 y2)]
    (Math/sqrt (+ (* diffx diffx)
                  (* diffy diffy)))))

(distance [0 1] [1 0])


; 5. Write a function that takes a list, and returns a new list containing the first element, the middle element, and the last element of the list. If the list has an even number of elements, you can use either middle element as the one in your returned list.

(defn first-middle-last
  [things]
  (list (first things)
        (nth things (/ (count things) 2))
        (last things)))

(first-middle-last (range 5))
(first-middle-last (range 6))


; 6. Write a function that takes a list of positive integers as input, and returns a list containing the ones digit for each integer.

(defn ones-digits
  [nums]
  (map #(mod % 10)
       nums))

(ones-digits '(123 3432 3 4910))


; Bonus task 1:
; Write a function that converts a number of miles to a number of inches.

(defn miles-to-inches
  [miles]
  (* miles 5280 12))

(miles-to-inches 26.2)

; Bonus task 2:
; Write a function that takes a function as an argument, and maps it over a list of strings representing the names of members of your group.

(defn function-mapper
  [func]
  (map func '("Helmuth" "Perkins" "Strash")))

(function-mapper first)
(function-mapper #(str "Prof. " %))


; Bonus task 3:
; Write a function that takes a string as an argument and tells whether the string is a palindrome or not, returning true or false.

(defn palindrome?
  [s]
  (= s
     (apply str (reverse s))))

(palindrome? "hello")
(palindrome? "racecar")
