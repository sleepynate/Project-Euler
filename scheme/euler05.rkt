 ; Project Euler - Problem 5
 ;
 ; 2520 is the smallest number that can be divided by
 ; each of the numbers from 1 to 10 without any remainder.
 ; What is the smallest number that is evenly divisible
 ; by all of the numbers from 1 to 20?

#lang racket

(provide lcm-range answer-05)

(define (lcm-range low high)
  (foldl lcm low (range (+ 1 low) high)))

(define (answer-05)
  (lcm-range 1 20))

(module+ main
  (printf "~a ~a ~a\n"
          "Problem 5: The smallest number that is evenly"
          "divisible by all of the numbers from 1 to 20 is"
          (answer-05)))


(module+ test
  (require rackunit)
   (check-equal? (lcm-range 1 10) 2520 "lcm of all numbers from 1 to 10"))
