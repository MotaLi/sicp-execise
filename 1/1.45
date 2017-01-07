#lang planet neil/sicp
(define (repeated f n)
  (lambda (x) (if (= n 1) (f x) (f ((repeated f (- n 1)) x)))))
(define tolerance .00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
(define (average x y) (/ (+ x y) 2))
(define (average-damp f)
  (lambda (x) (average x (f x))))
(define (square x) (* x x))
(define (n^k n k)
  (cond ((= k 0) 1)
        ((even? k) (square (n^k n (/ k 2))))
        (else (* n (n^k n (- k 1))))))

(define (lg n)
    (cond ((> (/ n 2) 1)
            (+ 1 (lg (/ n 2))))
          ((< (/ n 2) 1)
            0)
          (else
            1)))

(define (sqrt n x)
  (define (g y) (/ x (n^k y (- n 1))))
  (fixed-point ((repeated average-damp (lg n)) g) 2))

(sqrt 4 (* 3 3 3 3))
  

