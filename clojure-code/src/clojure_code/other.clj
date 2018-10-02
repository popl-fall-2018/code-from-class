(ns clojure-code.other)

; if
(if (< 1 4)
  (println (str 1 " is smallest"))
  (println (str 4 " is smallest")))

(type +)

; when
(when true
  (println "yay"))

(when false
  (println "boo"))

; cond: takes multiple condition / what to do pairs:
(defn how-big
  "Tells how big a number is."
  [num]
  (cond
    (< num 0) "That's so negative."
    (< num 10) "Single digit"
    (< num 100) "A bit bigger"
    :else (str "OMG " num " is so big!!!!")))

(how-big -5)


(and true false)
(or true false)
(not true)


;def - used to GLOBALLY assign a constant value to
; a symbol that will not change.
(def more-nums '(1 2 3 4 5))
more-nums
(rest more-nums)
more-nums

; never use def within other code:

(+ (def a 45)
   100)

;turns out, defn is shorthand for (def name (fn ))
(def cube
  (fn [x]
    (* x x x)))

(cube 5)

(let [local-cube (fn [x] (* x x x))]
  (local-cube 4))

; (local-cube 4)

; maps - like dictionaries or hashes
{} ;empty map

{:apples 4
 :bananas 6
 :cantaloupes 10}

(def rooms {:dining-room :taupe
            :kitchen :mauve
            :living-room :mint
            :bedroom :lavendar
            :garage :mint})

rooms

(assoc rooms :bathroom :cerulean)
(assoc rooms :living-room :cranberry)
rooms

(get rooms :kitchen)
(get rooms :den)
(get rooms :den :DEFAULT)

(keys rooms)
(vals rooms)

; Can use maps or keywords as functions; either way
; this is the same as get:
(rooms :kitchen)
(:kitchen rooms)


