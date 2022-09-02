#lang racket/base

(require rosette)

(provide circt-comb-add
         circt-comb-and
         circt-comb-divs
         circt-comb-divu
         circt-comb-icmp
         circt-comb-mods
         circt-comb-mul
         circt-comb-mux
         circt-comb-or
         circt-comb-parity
         circt-comb-shl
         circt-comb-shrs
         circt-comb-shru
         circt-comb-sub
         circt-comb-xor)

(define circt-comb-add bvadd)
(define circt-comb-and bvand)
; TODO: concat?
(define circt-comb-divs bvsdiv)
(define circt-comb-divu bvudiv)
; TODO: extract?
(define (circt-comb-icmp a b)
  (bool->bitvector (bveq a b)))
(define circt-comb-mods bvsmod)
; TODO: modu
(define circt-comb-mul bvmul)
(define (circt-comb-mux cond true-value false-value)
  (if (not (bvzero? cond)) true-value false-value))
(define circt-comb-or bvor)
(define (circt-comb-parity a)
  (foldl bvxor (bv 0 1) (bitvector->bits a)))
; TODO: replicate? --> concat, extract, replciate are "wire" instructions that don't consuem resources
; they also force thinking about sizes
(define circt-comb-shl bvshl)
(define circt-comb-shrs bvashr)
(define circt-comb-shru bvlshr)
(define circt-comb-sub bvsub)
(define circt-comb-xor bvxor)
