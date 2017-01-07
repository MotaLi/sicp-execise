#lang planet neil/sicp
(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define a (list 'a 'b 'c))
(define one (list 1))
(define two (cons one one))
(define b (cons two '()))
(define c (cons two two))
(count-pairs a)
(count-pairs b)
(count-pairs c)

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))
(define (make-cycle x)
  (set-cdr! (last-pair x) x) x)
(define z (make-cycle (list 'a 'b 'c)))

(define d (make-cycle (list 'a 'b 'c)))
(count-pairs d)
