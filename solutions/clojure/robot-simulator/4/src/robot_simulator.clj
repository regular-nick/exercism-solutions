(ns robot-simulator)

;; in 2d space only these directions are allowed
(def bearings [:north :east :south :west])
(def dir->delta (zipmap bearings [[0 1] [1 0] [0 -1] [-1 0]]))
(def dir->idx (zipmap bearings (range)))

(def valid-commands #{\R \L \A})

(defn robot
  "Creates a robot at the given coordinates, facing the given direction.
  Assumes robot has :bearing (one of allowed in bearings) and :coordinates.
  :coordinates is a map with :x and :y keys.
  Returns nil if required keys are not present."
  [coordinates direction]
  (and (some #{direction} bearings)
       (:x coordinates)
       (:y coordinates)
       {:bearing direction, :coordinates coordinates}))

(defn- rotate-bearing
  "Applies n turns to the bearing.
  Turns are counterclockwise for negative n."
  [bearing n]
  (let [idx (dir->idx bearing)
        new-idx (mod (+ idx n) (count bearings))]
    (bearings new-idx)))

(defn- rotate
  "Rotate bearing for whole number of turns"
  [turns robot-state]
  (update robot-state :bearing rotate-bearing turns))

(defn- advance
  "Changes coordinate of robot by 1 in correct direction.
  Uses global mapping of bearing to delta in movement."
  [robot-state]
  (let [[dx dy] (dir->delta (:bearing robot-state))]
    (-> robot-state
      (update :coordinates (fn [{:keys [x y]}]
                             {:x (+ x dx)
                              :y (+ y dy)})))))

(defn- step->action
  "Takes step as single-letter code, returns function to be applied to
  robot-state. Returns nil for unsupported command."
  [step]
  (case step
    \R (partial rotate 1)
    \L (partial rotate -1)
    \A advance
    nil
    ;; (throw (RuntimeException. (print-str "Invalid command for robot:"
    ;;                                      step
                                     ;; "\nAllowed movements are R, L and A")))
    ))

(defn- sanitize-action-list
  [valid-commands command-string]
  (reduce (fn [acc el]
            (if (contains? valid-commands el)
              (conj acc el)
              (reduced (do (binding [*out* *err*]
                    (println "Invalid command found:" el)
                    (println "Only commands preceding invalid command will be applied."))
                  acc))))
          []
          command-string))

(defn simulate
  "Simulates the robot's movements based on the given instructions and
  updates its state."
  [instructions robot-state]
  (->> instructions
       (sanitize-action-list valid-commands)
       (map step->action)
       (reduce #(%2 %1) robot-state)))
