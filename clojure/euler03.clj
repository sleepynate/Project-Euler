;
; Project Euler Problem 3
; Solution by nathan dotz - nathan (period) dotz (at sign) gmail (period) com
;
; What is the largest prime factor of the number 600851475143 ?
;
;

(ns euler3)

(def bignum 600851475143)

(def divisor                                                  ; only numbers who have
  (filter #(zero? (rem bignum %))                             ; remainder 0 when dividing bignum
          (filter odd? (range 2 (/ (Math/sqrt bignum) 6 ) ) ) ; up to big/6
          )
  )
(def prime_divs
  (for [x divisors :when
        (every? #(not (zero? (rem x %)) ) ;
                (range 2 (Math/sqrt x)) ) ;
        ] x )
  )

(last prime_divs)
