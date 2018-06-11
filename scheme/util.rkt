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

(define (all f xs)
  (if (empty? xs)
      #t
      (if (f (first xs))
          (all f (rest xs))
          #f)))

(module+ test
  (check-true (all null '()))
  (check-true (all (λ(x) (< x 10)) (list 1 2 3 4 5)))
  (check-false (all (λ(x) (> x 0)) (list 1 2 -3 4 5))))

(module util-lazy lazy
  (provide nats
           primes
           lazy-takef
           nth-primes )

  (define nats
    (cons 1 (map add1 nats)))
  (define (sift n l)
    (filter (λ(x) (not (zero? (modulo x n)))) l))
  (define (when-bigger n l f)
    (if (< (car l) n) (cons (car l) (when-bigger n (cdr l) f)) (f l)))
  (define (sieve l ps)
    (cons (car l) (when-bigger (* (car ps) (car ps)) (cdr l)
                               (λ(t) (sieve (sift (car ps) t) (cdr ps))))))
  (define primes (sieve (cdr nats) primes))

  (define (nth-primes n) (!! (take n primes)))

  (define (lazy-takef s f)
    (let [(x (first (!! (take 1 s))))]
      (if (f x)
          (cons x (lazy-takef (rest s) f))
          empty))))

(module+ test
  (require lazy/force
           (submod ".." util-lazy))
  (check-equal? (!! (lazy-takef '(1 2 3 4) (λ(x) (< x 5)) nats))))
