(defn get-expenses [user-id start-date end-date]
  (create-audit-log user-id GET-EXPENSES)
  (let [connection (connect-to-expenses-db user-id)
    expenses (find-all-between connection start-date end-date)]
    (close-connection connection)
    (flush-connection connection)
    expenses))

(defn add-expense [user-id date amount] 
  (with-audited-connection [user-id connection] 
    (save-new-expense connection date amount)))

(+ 1 2)

(def post-headers [{:title "title" :length 430}
                   {:title "title" :}
  ])

(def long-post-headers [threshold-length headers]
  (let [is-long? (fn [header])] 
    ))