;; Problem 11 - Largest product in a grid
;;
;; In the 20×20 grid below, four numbers along a diagonal line have been marked
;; in red. The product of these numbers is 26 × 63 × 78 × 14 = 1788696.
;;
;; What is the greatest product of four adjacent numbers in the same
;; direction (up, down, left, right, or diagonally) in the 20×20 grid?

#lang racket

(module+ test
  (require rackunit))

(require "util.rkt")

(define grid
  '((08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08)
    (49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00)
    (81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65)
    (52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91)
    (22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80)
    (24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50)
    (32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70)
    (67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21)
    (24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72)
    (21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95)
    (78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92)
    (16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57)
    (86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58)
    (19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40)
    (04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66)
    (88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69)
    (04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36)
    (20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16)
    (20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54)
    (01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48)))

(define (quples-in-row r)
  (if (< (length r) 4)
      null
      (cons (take r 4) (quples-in-row (cdr r)))))

(module+ test
  (check-equal? (first (quples-in-row (first grid))) '(08 02 22 97))
  (check-equal? (last  (quples-in-row (first grid))) '(50 77 91 08)))

(define (row-quples g)
  (if (null? g)
      null
      (append (quples-in-row (first g)) (row-quples (rest g)))))

(module+ test
  (check-equal? (first (row-quples grid)) '(08 02 22 97))
  (check-equal? (last  (row-quples grid)) '(89 19 67 48)))

(define (quples-in-col g c)
  (for/list ([i (in-range 0 17)])
    (list (list-ref (list-ref g      i)  c)
          (list-ref (list-ref g (+ 1 i)) c)
          (list-ref (list-ref g (+ 2 i)) c)
          (list-ref (list-ref g (+ 3 i)) c))))

(module+ test
  (check-equal? (first (quples-in-col grid 0))  '(08 49 81 52))
  (check-equal? (last  (quples-in-col grid 19)) '(36 16 54 48)))

(define (col-quples g)
  (if (null? g)
      null
      (let ([cols (length (car g))])
        (apply append
               (for/list ([i (in-range 0 cols)])
                 (quples-in-col g i))))))

(module+ test
  (check-equal? (first (col-quples grid)) '(08 49 81 52))
  (check-equal? (last  (col-quples grid)) '(36 16 54 48)))

(define (diag-iter g f)
  (filter not-null
          (apply append
                 (for/list ([y (in-range 0 (length g))])
                   (for/list ([x (in-range 0 (length (list-ref g y)))])
                     (if (and (< (+ y 3) (length g))
                              (< (+ x 3) (length (list-ref g y))))

                         (f g x y)

                         null))))))

(define (downright-quples g)
  (diag-iter g (λ (g x y)
                 (list
                  (list-ref (list-ref g    y)       x)
                  (list-ref (list-ref g (+ y 1)) (+ x 1))
                  (list-ref (list-ref g (+ y 2)) (+ x 2))
                  (list-ref (list-ref g (+ y 3)) (+ x 3))))))


(module+ test
  (check-equal? (first (downright-quples grid)) '(8 49 31 23))
  (check-equal? (last  (downright-quples grid)) '(40 4 5 48)))

(define (downleft-quples g)
  (diag-iter g (λ (g x y)
                 (list
                  (list-ref (list-ref g    y)    (+ x 3))
                  (list-ref (list-ref g (+ y 1)) (+ x 2))
                  (list-ref (list-ref g (+ y 2)) (+ x 1))
                  (list-ref (list-ref g (+ y 3))      x)))))

(module+ test
  (check-equal? (first (downleft-quples grid)) '(97 99 49 52))
  (check-equal? (last  (downleft-quples grid)) '(36 36 57 89)))

(define (all-quples g)
  (apply append (list (row-quples g)
                      (col-quples g)
                      (downright-quples g)
                      (downleft-quples g))))

(define (quples-to-products qs)
  (map (λ(xs) (apply * xs)) qs))

(module+ test
  (check-equal? (quples-to-products '((1 2 3) (2 3 4))) '(6 24)))

(module+ main
  (printf "~a ~a\n"
          "Problem 11: The greatest product of four adjacent numbers in the grid is"
          (apply max (quples-to-products (all-quples grid)))))
