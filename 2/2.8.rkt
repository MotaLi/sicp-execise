#lang planet neil/sicp
(define (make-interval a b)
  (cons a b))
(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define inter1 (make-interval 1 2))
(define inter2 (make-interval 2 3))
(sub-interval inter1 inter2)