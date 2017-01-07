#lang racket
(define (sum-of-max-two x y z)
  (cond ((> x y) (if (> y z) (+ x y) (+ x z)))
        ((< x y) (if (> x z) (+ x y) (+ y z)))))

(sum-of-max-two 3 2 1)
(sum-of-max-two 1 2 3)
(sum-of-max-two 1 3 2)
(sum-of-max-two 2 3 1)
(sum-of-max-two 3 1 2)
(sum-of-max-two 3 2 1)