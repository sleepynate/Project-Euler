#lang racket

(require rackunit
         "euler05.rkt")

(define tests
  (test-suite
   "Tests for Project Euler Problem 5"

   (check-equal? (lcm-range 1 10) 2520 "lcm of all numbers from 1 to 10")
   (check-equal? (answer) null "Project Euler 5 answer")

   ))

(require rackunit/text-ui)
(run-tests tests)
