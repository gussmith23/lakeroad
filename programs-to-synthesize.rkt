#lang racket

(require rosette)

(provide ceil-avg bithack1 bithack2 bithack3 floor-avg)

; https://github.com/mangpo/chlorophyll/tree/ab6d4268c5d12aa66eff817c678aaf7ebf935ba7/examples/bithack
(define (ceil-avg x y) (bvsub (bvor x y) (bvashr (bvxor x y) (bv 1 (length (bitvector->bits x))))))
(define (bithack1 x y) (bvsub x (bvand x y)))
(define (bithack2 x y) (bvnot (bvsub x y)))
(define (bithack3 x y) (bvxor (bvxor x y) (bvand x y)))
(define (floor-avg x y) (bvadd (bvand x y) (bvashr (bvxor x y) (bv 1 (length (bitvector->bits x))))))