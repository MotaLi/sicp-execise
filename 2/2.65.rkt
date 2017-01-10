#lang racket/load
(load "2.63.rkt")
(load "2.64.rkt")

(define (union-tree tr1 tr2)
  (list-tree (union-set (tree->list-2 tr1)
                               (tree->list-2 tr2))))
(define (intersection-tree tr1 tr2)
  (list-tree (intersetion-set (tree->list-2 tr1)
                               (tree->list-2 tr2))))

(define a (intersection-tree (list->tree 1 3 7 12)
                             (list->tree -2 6 11)))