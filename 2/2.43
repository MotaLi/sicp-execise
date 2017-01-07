#lang planet neil/sicp
(define (print tree)
  (cond ((not (pair? tree))
         (display tree)
         (display " "))
        (else (display " (")
              (map print tree)
              (display ") "))))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (filter predictor? l)
  (cond ((null? l) nil)
        ((predictor? (car l))
         (cons (car l)
               (filter predictor? (cdr l))))
        (else (filter predictor? (cdr l)))))
(define (enumerate-interval start end)
  (if (> start end)
      nil
      (cons start (enumerate-interval (+ 1 start) end))))
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
(define empty-board nil)
(define (safe? k ps)
  (if (null? ps) #t
      (if (not (null? (filter (lambda (e) (= (cadr (car ps)) (cadr e))) (cdr ps))))
          #f
          (null? (filter (lambda (e) (= (abs (- (car (car ps)) (car e))) (abs (- (cadr (car ps)) (cadr e)))))
                         (cdr ps))))))
(define (adjoin-position nr k qs)
  (cons (list k nr) qs))
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (new-row)
            (map (lambda (rest-of-queens)
                   (adjoin-position new-row k rest-of-queens))
                 (queen-cols (- k 1))))
          (enumerate-interval 1 board-size)))))
  (queen-cols board-size))

(print (queens 8))
;; too slow!!!
;; not tail recursive
;; 每次检测新位置的时候都要重新生成之前的棋盘状态
;; 放第八个子，需重复之前的七个子的状态8次，所以下界至少是 broad-size * T
