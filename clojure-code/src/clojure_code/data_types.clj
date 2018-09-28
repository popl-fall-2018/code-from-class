(ns clojure-code.data-types)

(+ 2 3)

(* 1 2 3 4 5)
(* 4)
(/ 6 27)
(+ 3 7.31)
(+ 1 2 (* 9 3) 8 (/ 34 11))

2999 ; integer
4.51 ; float
5/27 ; ratio

(< 1 4)
(= 3 9)
(< 2 4 5 8 10)

; booleans
true
false
nil ; not a boolean, represents nothing
    ; nil is a falsey value

; keywords
; like symbols in Ruby
:kiwis
:avocados

; strings
"hi there"

"This string
has multiple
lines"

(str "Hello" "World")
(str "hi " (+ 3 2))

(str :hi)

(println "cat")
(println "Why" "do" "you" "have" 5 "cats?")

; sequences: lists and vectors
'(1 2 3)
'(+ 2 3)
'(1 (+ 2 3) 4)

(quote (1 2 3))
(list 1 2 3)

(list 1 (+ 2 3) 4)

(list 1 '(+ 2 3) 4)

[1 2 3]
(vector 1 2 3)
[1 (+ 2 3) 4]

'(5 :a "hi" ("a" "list"))

(first '(:a :b :c :d :e))
(rest '(:a :b :c :d :e))
(last '(:a :b :c :d :e))
(count '(:a :b :c :d :e))
(nth '(:a :b :c :d :e) 3)

(mod 10 3)





