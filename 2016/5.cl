(ql:quickload "md5")

(defparameter example-str "abc")
(defparameter input-str "ojvtpuvg")

(defun combine (key integer)
  (concatenate 'string key (format nil "~D" integer)))

(defun hex-md5-hash (str)
  (let ((hashvec (map 'vector (lambda (x) (format nil "~2,'0X" x)) (md5:md5sum-string str))))
    (reduce (lambda (accum x)
	      (concatenate 'string accum x))
	    hashvec :initial-value "")))

(defun get-next-char (hash)
  (if (string= (subseq hash 0 5) "00000")
      (subseq hash 5 6)
      nil))

(defun get-next-char1 (hash)
  (if (and (string= (subseq hash 0 5) "00000")
	   (<= (parse-integer (subseq hash 5 6) :radix 16) 7))
      (cons (parse-integer (subseq hash 5 6) :radix 16) (subseq hash 6 7))
      nil))

(defun q5 (key)
  (do ((password "")
       (integer 0))
      ((>= (length password) 8))
    (let ((candidate (get-next-char (hex-md5-hash (combine key integer)))))
      (unless (null candidate)
	(setq password (concatenate 'string password candidate))
	(format t "~A~%" password)))
    (incf integer)))

(defun q5_2 (key)
  (let ((password (make-array 8 :element-type 'string :initial-element "" :fill-pointer t)))
    (do ((integer 0))
	((notany (lambda (x) (string= "" x)) password))
      (let ((candidate (get-next-char1 (hex-md5-hash (combine key integer)))))
	(unless (or (null candidate) (string/= (aref password (car candidate)) ""))
	  (setf (aref password (car candidate)) (cdr candidate)))
	(incf integer)))
    (format t "~A~%" (reduce (lambda (accum x)
			       (concatenate 'string accum x))
			     password
			     :initial-value ""))))
