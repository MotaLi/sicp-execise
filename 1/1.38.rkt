#lang planet neil/sicp
(define (cont-frac n d k)
  (define (iter t result)
    (if (= t 0)
        result
        (iter (- t 1) (/ (n t) (+ (d t) result)))))
  (iter k 0))
(define (d x)
  (let ((tt (+ 1 x)))
    (cond ((<= x 2) x)
          ((= (remainder tt 3) 0) (* (/ tt 3) 2))
          (else 1))))
  
(define (e n)
  (+ 2 (cont-frac (lambda (x) 1) d n)))
(exact->inexact (e 20))

