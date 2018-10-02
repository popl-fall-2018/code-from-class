(ns clojure-code.functions)

; let - allows you to assign values to symbols within
; a lexical context.
; let is your friend and you should use it often!

(+ 1000
   (let [nums '(7 2 3 3 1)
         first-element (first nums)]
     (println nums)
     (+ 2 5)
     (* first-element first-element)))

(let [nums '(7 2 3 3 1)
      new-nums (conj nums 100)]
  (println nums)
  (println (conj nums 100))
  (println nums)
  (rest nums))


;defn - define function

(defn square
  "This is a docstring. Squares the input x"
  [x] ;this is the parameter list
  (*' x x))

(square 5)
(square 3.6)
(square (/ 2 3))
; (square "hi")

(type 2/3)

(*' 1000000000 1000000000000000000)

(int (Math/pow 2 5))

(defn print-strings-and-concatenate
  [string1 string2]
  (println string1)
  (println string2)
  (str string1 \space string2))

(print-strings-and-concatenate "hi" "there")

(defn sphere-volume
  "Calculates volume of a sphere."
  [radius]
  (let [r-cubed (* radius radius radius)
        volume (* 4/3 Math/PI r-cubed)]
    volume))

(sphere-volume 6)
