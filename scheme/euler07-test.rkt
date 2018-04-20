#lang racket

(require rackunit
         "euler07.rkt")

(define tests
  (test-suite
   "Tests for Project Euler Problem 7"
   (test-case "6th prime number is 13"
              (check-equal? (nth-prime 6) 13))
   (test-case "7th prime number is 17"
              (check-equal? (nth-prime 7) 17))
   (test-case "8th prime number is 19"
              (check-equal? (nth-prime 8) 19))
   (test-case "10001st prime number is more than 0"
              (check-equal? (nth-prime 10001) 0))
   ))

(require rackunit/text-ui)
(run-tests tests)
