#lang planet neil/sicp

(define (make-deque) (cons '() '()))
(define (empty-deque? deque) (or (null? (car deque)) (null? (cdr deque))))
(define (front-deque deque)
  (if (empty-deque? deque) (error "empty deque" deque) (car (car deque))))
(define (rear-deque deque)
  (if (empty-deque? deque) (error "empty deque" deque) (car (cdr deque))))
(define (front-insert-deque! deque item)
  (let ((new-pair (cons item (cons '() '()))))
    (cond ((empty-deque? deque)
           (set-car! deque new-pair)
           (set-cdr! deque new-pair)
           deque)
          (else
           (set-cdr! (cdr new-pair) (car deque))
           (set-car! (cdr (car deque)) new-pair)
           (set-car! deque new-pair)
           deque))))
(define (rear-insert-deque! deque item)
  (let ((new-pair (cons item (cons '() '()))))
    (cond ((empty-deque? deque)
           (set-car! deque new-pair)
           (set-cdr! deque new-pair)
           deque)
          (else
           (set-car! (cdr new-pair) (cdr deque))
           (set-cdr! (cdr (cdr deque)) new-pair)
           (set-cdr! deque new-pair)
           deque))))
(define (front-delete-deque! deque)
  (cond ((empty-deque? deque) (error "empty deque" deque))
        (else
         (set-car! deque (cdr (cdr (car deque))))
         (if (null? (car deque))
             (set-cdr! deque '())
             (set-car! (cdr (car deque)) '()))
         deque)))
(define (rear-delete-deque! deque)
  (cond ((empty-deque? deque) (error "empty deque" deque))
        (else
         (set-cdr! deque (car (cdr (cdr deque))))
         (if (null? (cdr deque))
             (set-car! deque '())
             (set-cdr! (cdr (cdr deque)) '()))
         deque)))

(define (print deque)
  (define (aux s e)
    (if (not (eq? s e))
        (begin (display (car s))
               (display " ")
               (aux (cdr (cdr s)) e))
        (begin (display (car s))
               #t)))
  (if (not (empty-deque? deque))
      (begin (aux (car deque) (cdr deque))
             (newline))
      (display "")))

(define d (make-deque))
(front-insert-deque! d 5)
(print d)
(front-insert-deque! d 6)
(print d)
(rear-insert-deque! d 4)
(print d)
(front-delete-deque! d)
(print d)
(rear-delete-deque! d)
(print d)