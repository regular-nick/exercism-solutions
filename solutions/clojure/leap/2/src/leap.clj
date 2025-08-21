(ns leap)

(defn leap-year? [year] ;; <- argslist goes here
  (if (divides? year 100) (divides? year 400) (divides? year 4))
)
