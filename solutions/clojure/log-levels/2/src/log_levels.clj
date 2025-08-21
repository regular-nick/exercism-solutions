(ns log-levels
  (:require [clojure.string :as str]))

(defn message
  "Takes a string representing a log line
   and returns its message with whitespace trimmed."
  [s]
  (str/trim (get (str/split s #": ") 1)))

(defn log-level
  "Takes a string representing a log line
   and returns its level in lower-case."
  [s]
  (let [old_log (get (str/split s #": ") 0)]
    (str/lower-case (subs old_log 1 (dec (count old_log))))))

(defn reformat
  "Takes a string representing a log line and formats it
   with the message first and the log level in parentheses."
  [s]
  (str (message s) " (" (log-level s) ")"))
