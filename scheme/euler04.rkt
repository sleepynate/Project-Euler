; Problem 4
; A palindromic number reads the same both ways. The largest palindrome made
; from the product of two 2-digit numbers is 9009 = 91 × 99.
;
; Find the largest palindrome made from the product of two 3-digit numbers.

#lang racket

(provide palindrome? range-products answer)

(define (palindrome? s)
  (let* ([lst (string->list s)]
         [rev (reverse lst)]
         [rev-str (list->string rev)])
      (equal? s rev-str)))

(define (range-products start end)
  (for*/list ([i (range start (+ 1 end))]
              [j (range i (+ 1 end))])
    (* i j)))

(define (answer)
  (let* ([f (compose palindrome? number->string)]
         [r (range-products 900 999)])
      (car (sort (filter f r) >))))
