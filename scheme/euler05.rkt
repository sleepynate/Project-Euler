 ; Project Euler - Problem 5
 ;
 ; 2520 is the smallest number that can be divided by
 ; each of the numbers from 1 to 10 without any remainder.
 ; What is the smallest number that is evenly divisible
 ; by all of the numbers from 1 to 20?

#lang racket

(provide lcm-range answer)

(define (lcm-range low high)
  (foldl lcm low (range (+ 1 low) high)))

(define (answer)
  (lcm-range 1 20))
