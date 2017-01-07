#lang racket
(define (p) (p))
(define x 3)
(cond ((= x 3) 9)
      (else (p)))
(if (= x 3) 9 (p))

(define (new-if x y z) (cond (x y) (else z)))
(new-if (= x 3) 9 (p)) ;; OOM
;; new-if 不能展开，因为(p)项没有算出结果