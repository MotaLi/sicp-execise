#lang racket
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(define (fi n)
  (define (fi-iter x y z count)
    (cond ((= count 0) x)
          ((= count 1) y)
          ((= count 2) z)
          (else (fi-iter y z (+ z (* 2 y) (* 3 x)) (- count 1)))))
  (fi-iter 0 1 2 n))
(f 20)
(fi 20)
