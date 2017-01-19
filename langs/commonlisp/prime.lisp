(defun sieve (size)
  (declare (optimize (speed 3) (debug 0) (safety 0)))
  (if (<= size 1)
      (make-array size :element-type 'bit)
    (let ((sieveArray (make-array size :element-type 'bit :initial-element 1))
	  (root (+ 1 (floor (sqrt size)))))
      (setf (bit sieveArray 0) 0)
      (setf (bit sieveArray 1) 0)
      (loop for i from 2 to (- root 1)
	    if (= (bit sieveArray i) 1)
	    do (loop for j from (* i i) to (- size 1) by i
		     do (setf (bit sieveArray j) 0)))
      sieveArray)))

(defun countPrime (n)
  (declare (optimize (speed 3) (debug 0) (safety 0)))
  (let ((counter 0) (xs (sieve (+ n 1))))
    (dotimes (i (length xs))
      (when (= (bit xs i) 1) (incf counter)))
    counter))

(defun args ()
  #+clisp ext:*args*
  #+sbcl (cdr sb-ext:*posix-argv*))

(prin1 (countPrime
	(if (null (args))
	    10000000
	  (parse-integer (car (args))))))
#+sbcl (terpri)
