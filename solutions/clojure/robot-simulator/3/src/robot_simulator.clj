(ns robot-simulator)

;; in 2d space only these directions are allowed
(def bearings [:north :east :south :west])
(def dir->idx (zipmap bearings (range)))

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

(defn- rotate
  "Changes direction clockwise for positive n, counterclockwise for
  negative n. Accepts map with :bearing key and integer."
  [n robot-state]
  (let [idx (dir->idx (:bearing robot-state))
        new-idx (mod (+ idx n) (count bearings))]
    (assoc robot-state :bearing (bearings new-idx))))

(defn- advance
  "Changes coordinate of robot by 1 in correct direction"
  [robot-state]
  (let [;; dp = diff in position (dx/dy)
        dp (if (contains? #{:north :east} (:bearing robot-state))
             1 -1)
        axis (if (contains? #{:north :south} (:bearing robot-state))
               :y :x)]
    (update-in robot-state [:coordinates axis] #(+ dp %))))

(defn- step->action
  "Takes step as single-letter code, returns function to be applied to
  robot-state."
  [step]
  (case step
    \R (partial rotate 1)
    \L (partial rotate -1)
    \A advance
    (throw (RuntimeException. (print-str "Invalid command for robot:"
                                         step
                                         "\nAllowed movements are R, L and A")))))

(defn simulate
  "Simulates the robot's movements based on the given instructions and
  updates its state."
  [instructions robot-state]
  (reduce #(%2 %1) robot-state (map step->action instructions)))
