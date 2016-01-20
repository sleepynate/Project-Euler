#lang racket

(require rackunit
         "euler04.rkt")

(define tests
  (test-suite
   "Tests for Project Euler Problem 4"

   (check-equal? (palindrome? "abc") #f "abc is not a palindrome")
   (check-equal? (palindrome? "abba") #t "abba is a palindrome")
   (check-equal? (palindrome? (number->string 123)) #f "123 is not a palindrome number")
   (check-equal? (palindrome? (number->string 12321)) #t "12321 is a palindrome number")

   (check-equal? (range-products 1 3) '(1 2 3 4 6 9) "range-products gives all products of range between two numbers")

   (check-equal? (answer) null "Project Euler 4 answer")
   ))

(require rackunit/text-ui)
(run-tests tests)
