;; Problem 10 - Summation of primes
;; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
;; Find the sum of all the primes below two million.

#lang racket

(require "util.rkt"
         (submod "util.rkt" util-lazy)
         lazy/force)

(module+ main
  (printf "~a ~a\n"
          "Problem 10: The sum of all the primes below two million is"
          (sum (!! (lazy-takef primes (λ(x) (< x 2000000)))))))
