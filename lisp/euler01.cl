; Project Euler Problem 1
;
; If we list all the natural numbers below 10 that are multiples of 3 or 5
; we get 3, 5, 6 and 9. The sum of these multiples is 23.
;
; Find the sum of all the multiples of 3 or 5 below 1000.
;
; solution by nathan dotz
; nathan (period) dotz (at sign) gmail (period) com

(defun sum (x)
  (apply '+ x))

(defun fizzbuzz (x) 
  (cond 
	( (eq 0 (mod x 5)) t) 
	( (eq 0 (mod x 3)) t) 
	( nil )))

(defun fizbuzr (x)
  (sum (remove-if-not 'fizzbuzz x)))

(defun range (start end)
  (loop for i from start below end collect i))

(princ "The sum of ints divisble by 3 or 5 under 1000 is ")
(princ (fizbuzr (range 1 1000)))
