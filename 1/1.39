#lang planet neil/sicp
(define (cont-frac n d x k)
  (define (iter t result)
    (if (= t 0)
        result
        (iter (- t 1) (/ (n x t) (- (d t) result)))))
  (iter k 0))
(define (d x) (- (* 2 x) 1))
(define (n base exp) (if (= exp 1) base (* base base)))

(define (tan-cf x k)
  (cont-frac n d x k))
(exact->inexact (tan-cf 0.7853981633974483 2000))

