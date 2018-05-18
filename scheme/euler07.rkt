;; Project Euler - Problem 7
;; By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we
;; can see that the 6th prime is 13.
;; What is the 10 001st prime number?

#lang racket

(module euler07-lazy lazy
  (provide nth-primes)

  (define nats (cons 1 (map add1 nats)))
  (define (sift n l) (filter (λ(x) (not (zero? (modulo x n)))) l))
  (define (sieve l) (cons (first l) (sieve (sift (first l) (rest l)))))
  (define primes (sieve (rest nats)))

  (define (nth-primes n) (!! (take n primes))))

(require 'euler07-lazy)
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
