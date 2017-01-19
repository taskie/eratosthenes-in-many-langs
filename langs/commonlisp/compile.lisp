(defun args ()
  #+clisp ext:*args*
  #+sbcl (cdr sb-ext:*posix-argv*))

(compile-file (car (args)))
