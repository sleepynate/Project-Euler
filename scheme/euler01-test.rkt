#lang racket

(require rackunit
         "euler01.rkt")

(define tests
  (test-suite
   "Tests for Project Euler problem 1"

   (check-eq? (fizzbuzz 1) #f "1 is not a fizzbuzz")
   (check-eq? (fizzbuzz 3) #t "3 is a fizzbuzz")
   (check-eq? (fizzbuzz 5) #t "5 is a fizzbuzz")
   (check-eq? (fizzbuzz 6) #t "6 is a fizzbuzz")
   (check-eq? (fizzbuzz 7) #f "7 is not a fizzbuzz")

   (check-eq? (fizbuzr '(1)) 0 "No fizzbuzz numbers in '(1)")
   (check-eq? (fizbuzr '(1 3)) 3 "Only 3 is fizzbuzz")
   (check-eq? (fizbuzr '(1 3 5)) 8 "Only 3 and 5 are fizzbuzz")
   (check-eq? (fizbuzr (range 1 10)) 23 "fizzbuzz numbers under 10 sum to 23")

   ;; answer
   (check-equal? (answer) null "Project Euler 1 Answer")
   ))

(require rackunit/text-ui)
(run-tests tests)
