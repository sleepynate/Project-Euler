#lang racket

(require rackunit
         "euler09.rkt")

(define tests-09
  (test-suite
   "Tests for Project Euler Problem 9"
   (test-case "gen-triple generates pythagorean triples"
              (check-equal? (gen-triple 1 2 12) '(4 3 5)))
   (test-case "can generate list of triples for target"
              (check-equal? (pythagorean-triples-for 12) '(4 3 5)))
   (test-case "product of triple"
              (check-equal? (product (pythagorean-triples-for 12)) 60))
   (test-case "Problem 9 Answer"
              (check-equal? (product (pythagorean-triples-for 1000)) 0))
   ))

(require rackunit/text-ui)
(run-tests tests-09)
