(ns raindrops)

(defn convert [n] ;; <- number
      ;; your code goes here
      (let [
            d3 (zero? (mod n 3))
            d5 (zero? (mod n 5))
            d7 (zero? (mod n 7))
            m {
               "Pling" d3,
               "Plang" d5,
               "Plong" d7
              }
            filtered (clojure.string/join (filter #(get m %) (keys m)))
            ]
        (if (empty? filtered)
          (str n)
          filtered)
        )
)
