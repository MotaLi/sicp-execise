#lang planet neil/sicp

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
(define (unique-pairs n)
  (accumulate append
              nil
              (map (lambda (i)
                     (map (lambda (j) (list i j))
                          (enumerate-interval 1 (- i 1))))
                   (enumerate-interval 1 n))))

(define (prime-sum-pairs n s)
  (map (lambda (pair) (let ((r (- s (+ (car pair) (cadr pair))))) (list (car pair) (cadr pair) r)))
       (filter (lambda (pair)
                 (let ((r (- s (+ (car pair) (cadr pair)))))
                   (and (> r 0) (< r n))))
               (unique-pairs n))))
(prime-sum-pairs 8 10)



