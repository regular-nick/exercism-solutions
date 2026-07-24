(ns coordinate-transformation)

(defn translate2d 
  "Returns a function making use of a closure to
   perform a repeatable 2d translation of a coordinate pair."
  [dx dy]
  (fn [x0 y0] (map + [x0 y0] [dx dy]))
  )

(defn scale2d 
  "Returns a function making use of a closure to
   perform a repeatable 2d scale of a coordinate pair."
  [sx sy]
  (fn [x0 y0] (map * [x0 y0] [sx sy]))
  )

(defn compose-transform
  "Create a composition function that returns a function that 
   combines two functions to perform a repeatable transformation."
  [f g]
  (fn [x0 y0] (->> [x0 y0]
                   (apply f)
                   (apply g)))
  )

(defn memoize-transform
  "Returns a function that memoizes the last result.
   If the arguments are the same as the last call,
   the memoized result is returned."
  [f]
  (let [cache (atom {})]
    (fn [x0 y0]
      (if-let [res (@cache [x0 y0])]
        res
        (let [ret (f x0 y0)]
          (reset! cache {})
          (swap! cache assoc [x0 y0] ret)
          ret))))
  )
