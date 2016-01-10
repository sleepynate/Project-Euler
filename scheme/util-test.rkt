(require rackunit
         "util.rkt")

(define tests
  (test-suite
   "Tests for utility functions used in Project Euler problems"

   (check-equal? (range 1 4) '(1 2 3) "range of numbers from 1 until 4 is '(1 2 3)")
   (check-equal? (range 4 1) '() "range does not do reverse ranges")

   (check-eq? (sum '()) 0 "Sum of empty list should be zero")
   (check-eq? (sum '(1)) 1 "Sum of singleton list should be singleton value")
   (check-eq? (sum '(1 2 3 4)) 10 "Sum of 1 2 3 4 is 10")

   ))

(require rackunit/text-ui)
(run-tests tests)
