;; Project Euler Problem 1
;;
;; If we list all the natural numbers below 10 that are multiples of 3 or 5
;; we get 3, 5, 6 and 9. The sum of these multiples is 23.
;;
;; Find the sum of all the multiples of 3 or 5 below 1000.
;;
;; solution by nathan dotz
;; nathan (period) dotz (at sign) gmail (period) com

#lang racket

(provide fizzbuzz fizbuzr answer-01)

(require "util.rkt")

(define (fizzbuzz x)
  (cond
   ((= 0 (remainder x 5)) #t)
   ((= 0 (remainder x 3)) #t)
   (else #f )))

(define (fizbuzr x)
  (sum (filter fizzbuzz x)))

(define (answer-01)
  (fizbuzr (range 1 1000)))

(module+ main
  (printf "~a ~a~n"
          "Problem 1: The sum of all multiples of 3 or 5 below 1000 is"
          (answer-01)))

(module+ test
  (require rackunit)
  (check-eq? (fizzbuzz 1) #f "1 is not a fizzbuzz")
  (check-eq? (fizzbuzz 3) #t "3 is a fizzbuzz")
  (check-eq? (fizzbuzz 5) #t "5 is a fizzbuzz")
  (check-eq? (fizzbuzz 6) #t "6 is a fizzbuzz")
  (check-eq? (fizzbuzz 7) #f "7 is not a fizzbuzz")

  (check-eq? (fizbuzr '(1)) 0 "No fizzbuzz numbers in '(1)")
  (check-eq? (fizbuzr '(1 3)) 3 "Only 3 is fizzbuzz")
  (check-eq? (fizbuzr '(1 3 5)) 8 "Only 3 and 5 are fizzbuzz")
  (check-eq? (fizbuzr (range 1 10)) 23 "fizzbuzz numbers under 10 sum to 23"))
