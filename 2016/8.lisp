(ql:quickload '("cl-utilities" "cl-ppcre"))

(defvar example
  "rect 3x2
rotate column x=1 by 1
rotate row y=0 by 4
rotate column x=1 by 1")

(defvar input
  "rect 1x1
rotate row y=0 by 2
rect 1x1
rotate row y=0 by 5
rect 1x1
rotate row y=0 by 3
rect 1x1
rotate row y=0 by 3
rect 2x1
rotate row y=0 by 5
rect 1x1
rotate row y=0 by 5
rect 4x1
rotate row y=0 by 2
rect 1x1
rotate row y=0 by 2
rect 1x1
rotate row y=0 by 5
rect 4x1
rotate row y=0 by 3
rect 2x1
rotate row y=0 by 5
rect 4x1
rotate row y=0 by 2
rect 1x2
rotate row y=1 by 6
rotate row y=0 by 2
rect 1x2
rotate column x=32 by 1
rotate column x=23 by 1
rotate column x=13 by 1
rotate row y=0 by 6
rotate column x=0 by 1
rect 5x1
rotate row y=0 by 2
rotate column x=30 by 1
rotate row y=1 by 20
rotate row y=0 by 18
rotate column x=13 by 1
rotate column x=10 by 1
rotate column x=7 by 1
rotate column x=2 by 1
rotate column x=0 by 1
rect 17x1
rotate column x=16 by 3
rotate row y=3 by 7
rotate row y=0 by 5
rotate column x=2 by 1
rotate column x=0 by 1
rect 4x1
rotate column x=28 by 1
rotate row y=1 by 24
rotate row y=0 by 21
rotate column x=19 by 1
rotate column x=17 by 1
rotate column x=16 by 1
rotate column x=14 by 1
rotate column x=12 by 2
rotate column x=11 by 1
rotate column x=9 by 1
rotate column x=8 by 1
rotate column x=7 by 1
rotate column x=6 by 1
rotate column x=4 by 1
rotate column x=2 by 1
rotate column x=0 by 1
rect 20x1
rotate column x=47 by 1
rotate column x=40 by 2
rotate column x=35 by 2
rotate column x=30 by 2
rotate column x=10 by 3
rotate column x=5 by 3
rotate row y=4 by 20
rotate row y=3 by 10
rotate row y=2 by 20
rotate row y=1 by 16
rotate row y=0 by 9
rotate column x=7 by 2
rotate column x=5 by 2
rotate column x=3 by 2
rotate column x=0 by 2
rect 9x2
rotate column x=22 by 2
rotate row y=3 by 40
rotate row y=1 by 20
rotate row y=0 by 20
rotate column x=18 by 1
rotate column x=17 by 2
rotate column x=16 by 1
rotate column x=15 by 2
rotate column x=13 by 1
rotate column x=12 by 1
rotate column x=11 by 1
rotate column x=10 by 1
rotate column x=8 by 3
rotate column x=7 by 1
rotate column x=6 by 1
rotate column x=5 by 1
rotate column x=3 by 1
rotate column x=2 by 1
rotate column x=1 by 1
rotate column x=0 by 1
rect 19x1
rotate column x=44 by 2
rotate column x=40 by 3
rotate column x=29 by 1
rotate column x=27 by 2
rotate column x=25 by 5
rotate column x=24 by 2
rotate column x=22 by 2
rotate column x=20 by 5
rotate column x=14 by 3
rotate column x=12 by 2
rotate column x=10 by 4
rotate column x=9 by 3
rotate column x=7 by 3
rotate column x=3 by 5
rotate column x=2 by 2
rotate row y=5 by 10
rotate row y=4 by 8
rotate row y=3 by 8
rotate row y=2 by 48
rotate row y=1 by 47
rotate row y=0 by 40
rotate column x=47 by 5
rotate column x=46 by 5
rotate column x=45 by 4
rotate column x=43 by 2
rotate column x=42 by 3
rotate column x=41 by 2
rotate column x=38 by 5
rotate column x=37 by 5
rotate column x=36 by 5
rotate column x=33 by 1
rotate column x=28 by 1
rotate column x=27 by 5
rotate column x=26 by 5
rotate column x=25 by 1
rotate column x=23 by 5
rotate column x=22 by 1
rotate column x=21 by 2
rotate column x=18 by 1
rotate column x=17 by 3
rotate column x=12 by 2
rotate column x=11 by 2
rotate column x=7 by 5
rotate column x=6 by 5
rotate column x=5 by 4
rotate column x=3 by 5
rotate column x=2 by 5
rotate column x=1 by 3
rotate column x=0 by 4")

(defparameter *screen* nil)

(defun clear-screen (dim)
  (setq *screen* (make-array dim :initial-element nil)))

(defun reset-screen ()
  (clear-screen '(6 50)))

(defun example-screen ()
  (clear-screen '(3 7)))

(reset-screen)

(defun rect (a b)
  (loop for y below a
     do (loop for x below b
	   do (setf (aref *screen* x y) t))))

(defun print-screen ()
  (let ((cols (array-dimension *screen* 1))
	(rows (array-dimension *screen* 0)))
    (loop
       for x below rows
       do (format t
		  "~A~%"
		  (map 'string (lambda (x) (if x #\# #\.))
		       (make-array cols
				   :displaced-to *screen*
				   :displaced-index-offset (* cols x)))))))

(defun shift-vector (vector)
  (let* ((last-elem-pos (- (array-total-size vector) 1))
	 (last-elem (aref vector last-elem-pos)))
    (loop for i from last-elem-pos above 0
       do (setf (aref vector i) (aref vector (- i 1))))
    (setf (aref vector 0) last-elem)))

(defun rotate-row (row shift-by)
  (let* ((cols (array-dimension *screen* 1))
	 (row (make-array cols :displaced-to *screen* :displaced-index-offset (* cols row))))
    (dotimes (i shift-by)
      (shift-vector row))))

(defun rotate-col (col shift-by)
  (let* ((rows (array-dimension *screen* 0))
	 (buffer (make-array rows)))
    (dotimes (i rows)
      (setf (aref buffer i) (aref *screen* i col)))
    (dotimes (i shift-by)
      (shift-vector buffer))
    (dotimes (i rows)
      (setf (aref *screen* i col) (aref buffer i)))))

(defun q8 (input)
  (let ((strs (cl-utilities:split-sequence #\newline input)))
    (dolist (str strs)
      (cl-ppcre:register-groups-bind ((#'parse-integer w h)) ("rect (\\d+)x(\\d+)" str)
	(rect w h))
      (cl-ppcre:register-groups-bind ((#'parse-integer col shift-by)) ("rotate column x=(\\d+) by (\\d+)" str)
	(rotate-col col shift-by))
      (cl-ppcre:register-groups-bind ((#'parse-integer row shift-by)) ("rotate row y=(\\d+) by (\\d+)" str)
	(rotate-row row shift-by)))
    (print-screen)
    (count t (make-array (* (array-dimension *screen* 0) (array-dimension *screen* 1)) :displaced-to *screen*))))
