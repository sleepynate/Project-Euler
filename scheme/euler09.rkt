;; Project Euler Problem 9 - Special Pythagorean triplet
;; A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
;;
;; a2 + b2 = c2
;; For example, 32 + 42 = 9 + 16 = 25 = 52.
;;
;; There exists exactly one Pythagorean triplet for which a + b + c = 1000.
;; Find the product abc.

#lang racket

(require "util.rkt")

(provide gen-triple
         product
         pythagorean-triples-for)

(define (product x)
  (apply * x))

(define (gen-triple n m x)
  (let [(a (*  2 n m))
        (b (- (expt m 2) (expt n 2)))
        (c (+ (expt m 2) (expt n 2)))]
    (if (= (+ a b c) x)
        (list a b c)
        '())))

(define (pythagorean-triples-for x)
  (filter not-null
          (flatten
           (let [(search-range (/ x 3))]
             (for/list ([n (in-range 1 search-range)])
               (for/list ([m (in-range n search-range)])
                 (gen-triple n m x)))))))
