; Project Euler Problem 1
;
; If we list all the natural numbers below 10 that are multiples of 3 or 5
; we get 3, 5, 6 and 9. The sum of these multiples is 23.
;
; Find the sum of all the multiples of 3 or 5 below 1000.
;
; solution by nathan dotz
; nathan (period) dotz (at sign) gmail (period) com

(ns euler1)

(defn divBy?
  "See if this is number is evenly divisble by divisor"
  [number divisor]
  (= 0 (mod number divisor))
  )

(defn fizzBuzz?
  "check to see if number is divisible by 3 or 5"
  [number]
  (or (divBy? number 3) (divBy? number 5))
  )

(def fizzbuzzd
  (filter fizzBuzz? (range 1 1000))
  )

(print (reduce + fizzbuzzd))

; or (reduce + (for [ x (range 1 1000) :when (or (= 0 (mod x 3)) (= 0 (mod x 5)))] x) )
