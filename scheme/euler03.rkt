;; Project Euler Problem 3
;; Solution by nathan dotz - nathan (period) dotz (at sign) gmail (period) com
;;
;; The prime factors of 13195 are 5, 7, 13 and 29.
;; What is the largest prime factor of the number 600851475143 ?

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

(module+ main
  (printf "~a ~a~n"
          "Problem 3: the largest prime factor of the number 600851475143"
          (largest-prime-factor 600851475143)))

(module+ test
  (require rackunit)
  (check-equal? (prime-factors 1) '() "1 is not prime nor has prime factors")
  (check-equal? (prime-factors 2) '(2) "2 is prime")
  (check-equal? (prime-factors 3) '(3) "3 is prime")
  (check-equal? (prime-factors 4) '(2 2) "Prime factors of 4 is '(2 2)")
  (check-equal? (prime-factors 5) '(5) "5 is prime")
  (check-equal? (prime-factors 6) '(3 2) "Prime factors of 6 is '(3 2)")
  (check-equal? (prime-factors 7) '(7) "7 is prime")
  (check-equal? (prime-factors 8) '(2 2 2) "Prime factors of 4 is '(2 2)")
  (check-equal? (prime-factors 9) '(3 3) "Prime factors of 9 is '(3 3)")
  (check-equal? (prime-factors 10) '(5 2) "Prime factors of 10 is '(5 2)")
  (check-equal? (prime-factors 12) '(3 2 2) "Prime factors of 12 is '(3 2 2)")
  (check-equal? (prime-factors 50) '(5 5 2) "Prime factors of 50 is '(5 5 2)")

  (check-equal? (largest-prime-factor 50) 5 "largest prime factor of 50 is 5"))
