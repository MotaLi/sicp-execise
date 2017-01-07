#lang planet neil/sicp
(define (iterative-improve enough? improve)
  (lambda (x)
    (if (enough? x)
        x
        ((iterative-improve enough? improve) (improve x)))))
(define epsn 0.00001)
(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))
(define (sqrt n)
  (define (enough? x) (< (abs (- (* x x) n)) epsn))
  (define (improve x) (average x (/ n x)))
  ((iterative-improve enough? improve) 3))

;; (sqrt 2500)
(define (fixed-point f first-guess)
  (define (enough? x) (< (abs (- (f x) x)) epsn))
  (define (improve x) (f x))
  ((iterative-improve enough? improve) first-guess))
;; (fixed-point (lambda (x) (+ (sin x) (cos x))) 1.0)
                           
                          