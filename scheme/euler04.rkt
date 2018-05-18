;; Problem 4
;; A palindromic number reads the same both ways. The largest palindrome made
;; from the product of two 2-digit numbers is 9009 = 91 × 99.
;;
;; Find the largest palindrome made from the product of two 3-digit numbers.

#lang racket

(provide palindrome? range-products answer-04)

(define (palindrome? s)
  (let* ([lst (string->list s)]
         [rev (reverse lst)]
         [rev-str (list->string rev)])
      (equal? s rev-str)))

(define (range-products start end)
  (for*/list ([i (range start (+ 1 end))]
              [j (range i (+ 1 end))])
    (* i j)))

(define (answer-04)
  (let* ([f (compose palindrome? number->string)]
         [r (range-products 900 999)])
      (car (sort (filter f r) >))))

(module+ main
  (printf "~a ~a ~a\n"
          "Problem 4: The largest palindrome made from the product "
          "of two 3-digit numbers is"
          (answer-04)))

(module+ test
  (require rackunit)
  (check-equal? (palindrome? "abc") #f "abc is not a palindrome")
  (check-equal? (palindrome? "abba") #t "abba is a palindrome")
  (check-equal? (palindrome? (number->string 123)) #f "123 is not a palindrome number")
  (check-equal? (palindrome? (number->string 12321)) #t "12321 is a palindrome number")
  (check-equal? (range-products 1 3) '(1 2 3 4 6 9)
                "range-products gives all products of range between two numbers"))
