(ns raindrops)

(defn convert
  "convert number to string according to divisibility rules.
  if is divisible by 3, add 'Pling' to the result.
  if divisible by 5, add 'Plang' to the result.
  if divisible by 7, add 'Plong' to the result.
  otherwise, the result should be the number as a string.
"
  [n] ;; <- number
  (let [d3 (zero? (mod n 3))
        d5 (zero? (mod n 5))
        d7 (zero? (mod n 7))
        m {"Pling" d3,
           "Plang" d5,
           "Plong" d7}
        filtered (clojure.string/join (filter #(get m %) (keys m)))]
    (if (empty? filtered)
      (str n)
      filtered)))
