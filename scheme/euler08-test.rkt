#lang racket

(require rackunit
         "euler08.rkt")

(define bnl (string->list bignum))

(define tests-08
  (test-suite
   "Tests for Project Euler Problem 8"
   (test-case "Can convert digits to int values"
              (check-equal? (chars-to-ints (take bnl 5)) '(7 3 1 6 7)))
   (test-case "Product of first 4 digits"
              (check-eqv? (product-of-digits 4 bnl) 126))
   (test-case "Create list of products"
              (check-equal? (product-list-from-digits 4 (take bnl 10))
                            '(126 126 42 294 294 210 630)))
   (test-case "Find max in list of products"
              (check-eq? (max-product-digit-window 4 bignum) 5832))
   (test-case "Solve problem 8"
              (check-eq? (max-product-digit-window 13 bignum) 0))))

(require rackunit/text-ui)
(run-tests tests-08)
