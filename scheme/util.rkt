#lang racket

(provide range sum)

(define (range low high)
  (cond
   [(> low (- high 1) ) null]
   [else (cons low (range (+ low 1) high))]))

(define (sum x)
  (apply + x))
