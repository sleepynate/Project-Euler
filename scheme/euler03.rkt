; Project Euler Problem 3
; Solution by nathan dotz - nathan (period) dotz (at sign) gmail (period) com
;
; The prime factors of 13195 are 5, 7, 13 and 29.
; What is the largest prime factor of the number 600851475143 ?
                                        ;
#lang racket

(provide prime-factors largest-prime-factor)

(define (prime-factors n)

  (define (helper n last-prime factors)
    (cond
     [(< n 2) null]
     [(> last-prime (sqrt n)) (cons n factors)]
     [(zero? (remainder n last-prime))
      (let* ([reduced-n (/ n last-prime)]
             [new-factors (cons last-prime factors)])
        (helper reduced-n last-prime new-factors))]
     [(eq? last-prime 2) (helper n 3 factors)]
     [else (helper n (+ 2 last-prime) factors)]))

  (helper n 2 null))

(define (largest-prime-factor n)
  (car (prime-factors n)))
