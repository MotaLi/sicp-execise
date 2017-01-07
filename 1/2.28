#lang planet neil/sicp
(define x (list (list 1 2) (list 3 4)))

(define (fringe1 x)
  (define (iter l1 l2)
    (cond ((null? l1) l2)
          ((not (pair? l1)) (cons l1 l2))
          (else (iter (cdr l1) (iter (car l1) l2)))))
  (reverse (iter x nil)))

(define (fringe2 x)
  (define (iter l1 l2)
    (cond ((null? l1) l2)
          ((not (pair? l1)) (cons l1 l2))
          (else (iter (car l1) (iter (cdr l1) l2)))))
  (iter x nil))

(fringe2 x)
(fringe2 (list x x))