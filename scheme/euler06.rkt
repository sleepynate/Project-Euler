;; Project Euler - Problem 6
;; The sum of the squares of the first ten natural numbers is,
;; 1^2 + 2^2 + ... + 10^2 = 385
;; The square of the sum of the first ten natural numbers is,
;; (1 + 2 + ... + 10)^2 = 552 = 3025
;; Hence the difference between the sum of the squares of the first ten natural
;; numbers and the square of the sum is 3025 − 385 = 2640.
;;
;; Find the difference between the sum of the squares of the first one hundred
;; natural numbers and the square of the sum.

#lang racket

(provide sum-of-squares square-of-sum difference-of-sums-and-squares answer)

(define (sum-of-squares low high)
  (apply + (map sqr (range low (+ 1 high)))))

(define (square-of-sum low high)
  (sqr (apply + (range low (+ 1 high)))))

(define (difference-of-sums-and-squares low high)
  (- (square-of-sum low high) (sum-of-squares low high)))

(define (answer)
  (difference-of-sums-and-squares 1 100))
