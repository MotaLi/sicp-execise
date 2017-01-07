#lang planet neil/sicp
(define (?loop x)
  (define (aux x y)
    (cond ((or (not (pair? (cdr y))) (not (pair? y))) #f)
          ((eq? x y) #t)
          (else (aux (cdr x) (cdr (cdr y))))))
  (aux x (cdr x)))
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))
(define (make-cycle x)
  (set-cdr! (last-pair x) x) x)
(define z (make-cycle (list 'a 'b 'c 'd)))

(display (?loop z))
(newline)
(display (?loop (list 'a 'b 'c 'd)))

             