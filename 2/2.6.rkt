#lang planet neil/sicp
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
(add-1 zero)

(define one
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))
(define +
  (lambda (m)
    (lambda (n)
      (lambda (f) (lambda (x) (m ((n f) x)))))))
((+ 5) 6)