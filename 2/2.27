#lang planet neil/sicp
(define x (list (list 1 2) (list 3 4)))
(define (deep-reverse l)
  (define (iter l1 l2)
    (cond ((null? l1) l2)
          ((not (pair? l1)) l1)
          (else (iter (cdr l1) (cons (iter (car l1) nil) l2)))))
  (iter l nil))

(reverse x)
(deep-reverse x)
(deep-reverse (list 1 (list 2 3) 4 5))