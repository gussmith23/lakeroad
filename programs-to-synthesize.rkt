#lang racket

(require rosette)

(provide ceil-avg bithack1 bithack2 bithack3 floor-avg cycle)

; https://github.com/mangpo/chlorophyll/tree/ab6d4268c5d12aa66eff817c678aaf7ebf935ba7/examples/bithack
(define (ceil-avg x y) (bvsub (bvor x y) (bvashr (bvxor x y) (bv 1 (length (bitvector->bits x))))))
(define (bithack1 x y) (bvsub x (bvand x y)))
(define (bithack2 x y) (bvnot (bvsub x y)))
(define (bithack3 x y) (bvxor (bvxor x y) (bvand x y)))
(define (floor-avg x y) (bvadd (bvand x y) (bvashr (bvxor x y) (bv 1 (length (bitvector->bits x))))))
; I'm not sure we can implement this one; I think it's specific to the bitwidth of c ints (32? 64?)
; Given that its magic numbers are larger than 8 bits, it def won't work here.
(define (bithack-count x)
  (let* ([n (length (bitvector->bits x))]
         [o1 (bvashr x (bv 1 n))]
         [o1 (bvand o1 (bv 87381 n))]
         [x (bvsub x o1)])
    empty))
; I don't know what this one does.
(define (cycle x a b c)
  (let* ([n (length (bitvector->bits x))]
         [o1 (bvneg (bool->bitvector (bveq x c) n))]
         [o2 (bvxor a c)]
         [o3 (bvneg (bool->bitvector (bveq x a) n))]
         [o4 (bvxor b c)]
         [o1 (bvand o1 o2)]
         [o3 (bvand o3 o4)]
         [o1 (bvxor o1 o3)]
         [out (bvxor o1 c)])
    out))
