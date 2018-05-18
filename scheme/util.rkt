#lang racket

(provide range sum not-null)

(module+ test (require rackunit))

(define (range low high)
  (if (> low high)
      (reverse (range (+ 1 high) (+ 1 low)))
      (cond
       [(> low high) ]
       [(> low (- high 1) ) null]
       [else (cons low (range (+ low 1) high))])))

(module+ test
   (check-equal? (range 1 4) '(1 2 3) "range of numbers from 1 until 4 is '(1 2 3)")
   (check-equal? (range 4 1) '(4 3 2) "range does reverse ranges"))

(define (sum x)
  (apply + x))

(module+ test
   (check-eq? (sum '()) 0 "Sum of empty list should be zero")
   (check-eq? (sum '(1)) 1 "Sum of singleton list should be singleton value")
   (check-eq? (sum '(1 2 3 4)) 10 "Sum of 1 2 3 4 is 10"))

(define (not-null x)
  (not (null? x)))
