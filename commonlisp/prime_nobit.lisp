(defun sieve (size)
  (declare (optimize (speed 3) (debug 0) (safety 0)))
  (if (<= size 1)
      (make-array size :initial-element nil)
    (let ((sieveArray (make-array size :initial-element t))
	  (root (+ 1 (floor (sqrt size)))))
      (setf (svref sieveArray 0) nil)
      (setf (svref sieveArray 1) nil)
      (loop for i from 2 to (- root 1)
	    if (svref sieveArray i)
	    do (loop for j from (* i i) to (- size 1) by i
		     do (setf (svref sieveArray j) nil)))
      sieveArray)))

(defun countPrime (n)
  (declare (optimize (speed 3) (debug 0) (safety 0)))
  (let ((counter 0) (xs (sieve (+ n 1))))
    (dotimes (i (length xs))
      (when (svref xs i) (incf counter)))
    counter))

(defun args ()
  #+clisp ext:*args*
  #+sbcl (cdr sb-ext:*posix-argv*))

(prin1 (countPrime
	(if (null (args))
	    10000000
	  (parse-integer (car (args))))))
#+sbcl (terpri)
