#lang planet neil/sicp
(define (cons x y)
  (* (expt 2 x)
     (expt 3 y)))

(define (car x)
  (if (= 0 (remainder x 2))
      (+ (car (/ x 2)) 1)
      0))
(define (cdr x)
  (if (= 0 (remainder x 3))
      (+ (cdr (/ x 3)) 1)
      0))

(car (cons 4 6))
(cdr (cons 4 6))
         
