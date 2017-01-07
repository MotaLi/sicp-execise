#lang racket
(define (double n)
    (+ n n))

(define (halve n)
    (/ n 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt i j)
  (define (expt x c a)
    (cond ((= c 0) a)
          ((even? c) (expt (double x) (halve c) a))
          (else (expt x (- c 1) (+ a x)))))
  (expt i j 0))
(fast-expt 6 5)