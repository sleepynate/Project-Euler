(defun sum (x) (apply '+ x))
(defun fizzbuzz (x)
	(cond
	( (eq 0 (mod x 5)) 1)
	( (eq 0 (mod x 3)) 1)
	( 0 ))
)
