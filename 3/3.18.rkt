#lang planet neil/sicp
(define (?loop x)
  (define (aux x memo-list)
    (cond ((not (pair? x)) #f)
          ((memq x memo-list) #t)
          (else (aux (cdr x) (cons x memo-list)))))
  (aux x '()))
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))
(define (make-cycle x)
  (set-cdr! (last-pair x) x) x)
(define z (make-cycle (list 'a 'b 'c)))

(display (?loop z))
(newline)
(display (?loop (list 'a 'b 'c 'd)))

             