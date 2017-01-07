#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))
(define nil '())

(define (paint-segs l)
  (paint (segments->painter l)))
(define (connect vs)
  (define (aux result remain)
    (if (null? (cdr remain))
        (reverse result)
        (aux (cons (make-segment (car remain) (cadr remain)) result) (cdr remain))))
  (aux nil vs))
(define v make-vect)
(define ld (append (connect (list (v 0 .8)
                            (v .2 .6)
                            (v .3 .7)
                            (v .45 .75)
                            (v .4 .85)
                            (v .45 1)))
                   (connect (list (v .6 1)
                            (v .65 .85)
                            (v .6 .75)
                            (v .75 .7)
                            (v 1 .45)))
                   (connect (list (v 0 .5)
                            (v .2 .4)
                            (v .35 .6)
                            (v .4 .45)
                            (v .2 0)))
                   (connect (list (v .4 0)
                            (v .5 .25)
                            (v .55 0)))
                   (connect (list (v .7 0)
                            (v .6 .5)
                            (v 1 .25)))
                   (connect (list (v .48 .82)
                                  (v .52 .8)
                                  (v .55 .82)))))
(paint-segs ld)

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))
 
(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))
(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))
(define (alt-corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1)))
            (corner (alt-corner-split painter (- n 1))))
          (beside (below painter up)
                  (below right corner)))))
(paint (alt-corner-split einstein 4))

(define (identity x) x)
(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))
 
(define (square-limit painter n) 
  (let ((combine4 (square-of-four flip-vert rotate180
                                  identity flip-horiz)))
    (combine4 (corner-split painter n))))
(paint (square-limit einstein 2))







