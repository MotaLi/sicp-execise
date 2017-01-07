#lang planet neil/sicp

(define (make-interval a b)
  (cons a b))

(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (upper-bound x) (lower-bound y)))
        (p3 (* (lower-bound x) (upper-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
  (make-interval (min p1 p2 p3 p4)
                 (max p1 p2 p3 p4))))
(define (div-interval x y)
  (mul-interval x (make-interval (/ 1.0 (upper-bound y))
                                 (/ 1.0 (lower-bound y)))))

(define (div-interval1 x y)
  (if (or (< (upper-bound y) 0) (> (lower-bound y) 0))
      (mul-interval x (make-interval (/ 1.0 (upper-bound y))
                                     (/ 1.0 (lower-bound y))))
      (error "y can't include zero")))
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
  (div-interval one
                (add-interval
                 (div-interval one r1)
                 (div-interval one r2)))))
(define r1 (make-interval 1 3))
(define r2 (make-interval 2 8))
(par1 r1 r2)
(par2 r1 r2)


