(defn next-terms [term-1 term-2]
  (let [term-3 (+ term-1 term-2)]
    (lazy-seq
      (cons term-3
        (next-terms term-2 term-3)))))

(defn fibonacci [t1, t2]
  (concat [t1 t2]
    (next-terms t1 t2)))

(take 15 (fibonacci 0 1))