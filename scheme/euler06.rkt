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

(provide sum-of-squares square-of-sum difference-of-sums-and-squares answer-06)

(define (sum-of-squares low high)
  (apply + (map sqr (range low (+ 1 high)))))

(define (square-of-sum low high)
  (sqr (apply + (range low (+ 1 high)))))

(define (difference-of-sums-and-squares low high)
  (- (square-of-sum low high) (sum-of-squares low high)))

(define (answer-06)
  (difference-of-sums-and-squares 1 100))

(module+ main
  (printf "~a ~a ~a\n"
          "Problem 6: The difference between the sum of the squares of the first"
          "100 natural numbers and the square of the sum is"
          (answer-06)))

(module+ test
  (require rackunit)

  (test-case "sum of squares from 1 to 10"
             (check-equal? (sum-of-squares 1 10) 385))
  (test-case  "square of sum from 1 to 10"
              (check-equal? (square-of-sum 1 10) 3025))
  (test-case  "difference of 1 to 10"
              (check-equal? (difference-of-sums-and-squares 1 10) 2640)))
