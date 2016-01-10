#lang racket

(require rackunit
         "euler03.rkt")

(define tests
  (test-suite
   "Tests for Project Euler problem 1"

   (check-equal? (prime-factors 1) '() "1 is not prime nor has prime factors")
   (check-equal? (prime-factors 2) '(2) "2 is prime")
   (check-equal? (prime-factors 3) '(3) "3 is prime")
   (check-equal? (prime-factors 4) '(2 2) "Prime factors of 4 is '(2 2)")
   (check-equal? (prime-factors 5) '(5) "5 is prime")
   (check-equal? (prime-factors 6) '(3 2) "Prime factors of 6 is '(3 2)")
   (check-equal? (prime-factors 7) '(7) "7 is prime")
   (check-equal? (prime-factors 8) '(2 2 2) "Prime factors of 4 is '(2 2)")
   (check-equal? (prime-factors 9) '(3 3) "Prime factors of 9 is '(3 3)")
   (check-equal? (prime-factors 10) '(5 2) "Prime factors of 10 is '(5 2)")
   (check-equal? (prime-factors 12) '(3 2 2) "Prime factors of 12 is '(3 2 2)")
   (check-equal? (prime-factors 50) '(5 5 2) "Prime factors of 50 is '(5 5 2)")

   (check-equal? (largest-prime-factor 50) 5 "largest prime factor of 50 is 5")
   ;; answer
   (check-equal? (largest-prime-factor 600851475143) null "Project Euler 3 Answer")
   ))
(require rackunit/text-ui)
(run-tests tests)
