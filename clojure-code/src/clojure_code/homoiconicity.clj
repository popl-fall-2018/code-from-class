(ns clojure-code.homoiconicity)


;; (read-string "(+ 2 3)")

;; (eval (read-string "(+ 2 3)"))

;; (eval '(+ 2 3))

;; (first (read-string "(+ 2 3)"))

;; (type (read-string "(+ 2 3)"))

;; (read-string "[1 2 3]")

;; (read-string "(quote (2 3 4))")
;; (read-string "'(2 3 4)") ; Reader-macro for quote

;; (read-string "#(+ % %)")

;; (read-string "(+ 2 3);this is a comment")

;; (read-string "variable")

;; '(a b c)

;; eval

;; (eval 5)

;; (let [x 45]
;;   (eval x))

;; (+ 2 3)

;; '(+ 2 3)

;; (eval '(+ 2 3))

;; (eval '('(* 10 3)))

;; (read-string "'('(* 10 3))")

;; (read-line)

(defn repl
  "A Clojure REPL"
  []
  (print "H]=> ")
  (flush)
  (let [line (read-line)]
    (when (not (empty? line))
      (println (eval (read-string line)))
      (recur))))

;(repl)


(defn -main
  []
  (repl))

