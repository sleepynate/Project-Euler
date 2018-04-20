#lang racket

(require rackunit
         "euler06.rkt")

(define tests
  (test-suite
   "Tests for Project Euler Problem 6"
   (test-case "sum of squares from 1 to 10"
              (check-equal? (sum-of-squares 1 10) 385))
   (test-case  "square of sum from 1 to 10"
               (check-equal? (square-of-sum 1 10) 3025))
   (test-case  "difference of 1 to 10"
               (check-equal? (difference-of-sums-and-squares 1 10) 2640))
   (test-case "difference of 1 to 100"
              (check-equal? (answer) null))))

(require rackunit/text-ui)
(run-tests tests)
