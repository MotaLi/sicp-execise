#lang planet neil/sicp

(define (gcd x y)
  (if (= y 0) x (gcd y (remainder x y))))

(define (make-rat n d)
  (let ((g (abs (gcd n d))))
  (cond ((> d 0) (cons (/ n g) (/ d g)))
        ((< d 0) (cons (/ (- n) g) (/ (- d) g)))
        (else (error "d can be zero")))))

(make-rat 9 81)
(make-rat -9 81)
(make-rat -9 -81)
(make-rat 9 -81)

(make-rat 81 9)
(make-rat -81 9)
(make-rat -81 -9)
(make-rat 81 -9)