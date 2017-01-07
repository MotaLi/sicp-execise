#lang planet neil/sicp
;(define (make-frame origin edge1 edge2)
;  (list origin edge1 edge2))
;(define (origin frame)
;  (car frame))
;(define (edge1 frame)
;  (cadr frame))
;(define (edge2 frame)
;  (caddr frame))

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
(define (origin frame)
  (car frame))
(define (edge1 frame)
  (cadr frame))
(define (edge2 frame)
  (cdr (cdr frame)))



(define frame (make-frame 1 2 3))
(origin frame)
(edge1 frame)
(edge2 frame)