#lang racket

(provide range sum)

(define (range low high)
  (if (> low high)
      (reverse (range (+ 1 high) (+ 1 low)))
      (cond
       [(> low high) ]
       [(> low (- high 1) ) null]
       [else (cons low (range (+ low 1) high))])))

(define (sum x)
  (apply + x))
