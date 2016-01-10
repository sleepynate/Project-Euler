#lang racket

(require rackunit
         "euler02.rkt")

(define tests
  (test-suite
   "Tests for Project Euler problem 2"

   (check-equal? (fib 0) '() "There are no fibonacci numbers below 1")
   (check-equal? (fib 1) '(1 1) "Fibonacci numbers <= 1 is '(1 1)")
   (check-equal? (fib 5) '(5 3 2 1 1) "Fibonacci numbers <= to 5 is '(5 3 2 1 1)")

   (check-equal? (evens '(1 2 3 4)) '(2 4) "evens of 1 through 4 is '(2 4)")

   ;; answer
   (check-equal? (answer) null "Project Euler 2 Answer")
))


(require rackunit/text-ui)
(run-tests tests)
