(ql:quickload "cl-utilities")

(defparameter *screen* nil)

(defun reset-screen ()
  (setq *screen* (make-array '(6 50) :initial-element nil)))

(reset-screen)

(defun rect (a b)
  (loop for y below a
     do (loop for x below b
	   do (setf (aref *screen* x y) t))))

(defun print-screen ()
  (loop for x below 6
     do (format t "~A~%" (map 'string (lambda (x) (if x #\# #\.))
			      (make-array 50 :displaced-to *screen* :displaced-index-offset (* 50 x))))))

(defun shift-vector (vector)
  (let* ((last-elem-pos (- (array-total-size vector) 1))
	 (last-elem (aref vector last-elem-pos)))
    (loop for i from last-elem-pos above 0
       do (setf (aref vector i) (aref vector (- i 1))))
    (setf (aref vector 0) last-elem)))

(defun rotate-row (row shift-by)
  (let ((row (make-array 50 :displaced-to *screen* :displaced-index-offset (* 50 row))))
    (dotimes (i shift-by)
      (shift-vector row))))
