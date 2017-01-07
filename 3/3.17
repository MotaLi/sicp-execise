#lang planet neil/sicp
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))
(define (count-pairs1 x)
  (define (has? l e)
    (if (null? l)
        #t
        (or (eq? e (car l)) (has? (cdr l) e))))
  (define (iter v)
    (let ((l (cons '() '())))
      (if (or (not (pair? x)) (has? l v))
          0
          (begin (set-cdr! (last-pair l) v)
                 (+ (iter (car x))
                    (iter (cdr x))
                    1)))))
  (iter x))

(define (count-pairs x)
    (length (inner x '())))

(define (inner x memo-list)
    (if (and (pair? x)
             (not (memq x memo-list)))
        (inner (car x)
               (inner (cdr x)
                      (cons x memo-list)))
        memo-list))

(define a (list 'a 'b 'c))
(define one (list 1))
(define two (cons one one))
(define b (cons two '()))
(define c (cons two two))
(count-pairs a)
(count-pairs b)
(count-pairs c)

(define (make-cycle x)
  (set-cdr! (last-pair x) x) x)
(define z (make-cycle (list 'a 'b 'c)))

(define d (make-cycle (list 'a 'b 'c)))
(count-pairs d)



