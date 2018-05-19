;; Project Euler - Problem 7
;; By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we
;; can see that the 6th prime is 13.
;; What is the 10 001st prime number?

#lang racket

(require (submod "util.rkt" util-lazy))

(provide nth-prime)
(define (nth-prime n)
  (last (nth-primes n)))

(module+ main
  (printf "~a ~a\n"
          "Problem 7: The 10,001st prime number is"
          (nth-prime 10001)))

(module+ test
  (require rackunit)
  (test-case "6th prime number is 13"
             (check-equal? (nth-prime 6) 13))
  (test-case "7th prime number is 17"
             (check-equal? (nth-prime 7) 17))
  (test-case "8th prime number is 19"
             (check-equal? (nth-prime 8) 19)))
