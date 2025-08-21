(ns annalyns-infiltration)

(defn can-fast-attack?
  "Returns true if a fast-attack can be made, false otherwise."
  ;; Can if knight is not awake
  [knight-awake?]
  (not knight-awake?))

(defn can-spy?
  "Returns true if the kidnappers can be spied upon, false otherwise."
  ;; Can if at least one of them is awake
  [knight-awake? archer-awake? prisoner-awake?]
  (boolean (some true? [knight-awake? archer-awake? prisoner-awake?])))

(defn can-signal-prisoner?
  "Returns true if the prisoner can be signalled, false otherwise."
  ;; Can if prisoner is awake and archer is sleeping
  [archer-awake? prisoner-awake?]
  (and prisoner-awake? (not archer-awake?)))

(defn can-free-prisoner?
  "Returns true if prisoner can be freed, false otherwise."
  ;; One of two conditions must be met:
  ;; 1. Dog is present and archer is asleep
  ;; 2. Without dog prisoner must be the only awake
  [knight-awake? archer-awake? prisoner-awake? dog-present?]
  (or (and dog-present? (not archer-awake?))
      (and prisoner-awake?
           (not-any? true? [dog-present? knight-awake? archer-awake?]))))
