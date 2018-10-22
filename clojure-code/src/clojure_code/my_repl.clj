(ns clojure-code.my-repl)

(defn my-eval
  ""
  [state expression]
  (if (not (seq? expression))
    (if (symbol? expression)
      (assoc state :return (get (:environment state) expression))
      (assoc state :return expression))
    (let [env (:environment state)
          f (first expression)]
      (cond
        (= f '+) (assoc state
                        :return
                        (apply +
                               (map #(:return (my-eval state %))
                                    (rest expression))))
        (= f 'def) {:environment (assoc env
                                        (second expression)
                                        (:return (my-eval state
                                                          (nth expression 2))))
                    :return (second expression)}
        :else (assoc state :return "Error: That function is not defined.")))))

;; A state is always composed of an :environment
;; and optionally a :return
;; {:environment {},
;;  :return val}

(defn repl
  "A Clojure REPL"
  ([]
   (repl {:environment {}}))
  ([state]
   (print "H]=> ")
   (flush)
   (let [line (read-line)]
     (when (not (empty? line))
       (let [new-state (my-eval state
                                (read-string line))]
         (println "Environment: " (:environment new-state))
         (println (:return new-state))
         (recur new-state))))))


(defn -main
  []
  (repl))


