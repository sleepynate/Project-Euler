; Project Euler Problem 1
;
; If we list all the natural numbers below 10 that are multiples of 3 or 5
; we get 3, 5, 6 and 9. The sum of these multiples is 23.
;
; Find the sum of all the multiples of 3 or 5 below 1000.
;
; solution by nathan dotz
; nathan (period) dotz (at sign) gmail (period) com

#lang racket
(provide fizzbuzz fizbuzr answer)

(require "util.rkt")

(define (fizzbuzz x)
  (cond
   ( (= 0 (remainder x 5)) #t)
   ( (= 0 (remainder x 3)) #t)
   ( else #f )))

(define (fizbuzr x)
  (sum (filter fizzbuzz x)))

(define (answer)
  (fizbuzr (range 1 1000)))
