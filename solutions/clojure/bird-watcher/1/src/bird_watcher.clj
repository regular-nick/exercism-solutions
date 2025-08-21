(ns bird-watcher)

(def last-week [0 2 5 3 7 8 4])

(defn today [birds]
  (peek birds))

(defn inc-bird [birds]
  (conj (pop birds) (+ 1 (today birds))))

(defn day-without-birds? [birds]
  (not (= -1 (.indexOf birds 0))))

(defn n-days-count [birds n]
  (reduce + (take n birds)))

(defn busy-days [birds]
  (let [BUSY_THRESHOLD 5]
    (count (filter #(>= % BUSY_THRESHOLD) birds))))

(defn odd-week? [birds]
  (or (= birds [0 1 0 1 0 1 0]) (= birds [1 0 1 0 1 0 1])))
