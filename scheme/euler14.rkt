;; Problem 14 - Longest Collatz sequence
;; The following iterative sequence is defined for the set of positive integers:
;;
;; n → n/2 (n is even)
;; n → 3n + 1 (n is odd)
;;
;; Using the rule above and starting with 13, we generate the following sequence:
;;
;; 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
;; It can be seen that this sequence (starting at 13 and finishing at
;; 1) contains 10 terms. Although it has not been proved yet (Collatz
;; Problem), it is thought that all starting numbers finish at 1.
;;
;; Which starting number, under one million, produces the longest chain?

#lang racket

(module+ test
  (require rackunit))

(define (collatz n)
  ;; collatz sequence starting at n
  (if (= n 1)
      '(1)
      (cons n (if (even? n)
                  (collatz (/ n 2))
                  (collatz (+ (* n 3) 1))))))

(module+ test
  (check-equal? (collatz 13) '(13 40 20 10 5 16 8 4 2 1))
  (check-equal? (length (collatz 13)) 10))

(define (collatz-under n)
  (for/list ([n (in-range 1 n)])
    (let ([c (collatz n)])
      (list (length c) (first c)))))

(module+ test
  (test-case "collatz under 10 checks"
    (let ([c (collatz-under 10)])
      (check-equal? (first  c) '(1 1))
      (check-equal? (last   c) '(20 9))
      (check-equal? (length c) 9))))

(define (longest-collatz s)
  (foldl (lambda (a b)
           (if (> (first b) (first a))
               b
               a)) '(0 ()) s))

(module+ main
  (printf "~a ~a\n"
          "Problem 14 - The longest collatz chain starting under 1000000 starts at"
          (second (longest-collatz (collatz-under 1000000)))))
