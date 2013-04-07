(def total-expenditure (ref 0))

;; The following will throw an exception
(defn add-amount [amount]
  (ref-set total-expenditure (+ amount @total-expenditure)))

(defm add-amount [amount]
  (dosync
    (ref-set total-expenditure (+ amount @total-expenditure))))

