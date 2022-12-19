#lang racket/base
(provide xilinx-ultrascale-plus-lut2)
(require "stateful-design-experiment.rkt")
(require "lut.rkt")
(require rosette)
(require racket/hash)
(define xilinx-ultrascale-plus-lut2
  (λ (#:I0 (I0 (bv->signal (constant (list 'I0 'symbolic-constant) (bitvector 1))))
      #:I1 (I1 (bv->signal (constant (list 'I1 'symbolic-constant) (bitvector 1))))
      #:INIT (INIT (bv->signal (constant (list 'INIT 'symbolic-constant) (bitvector 4)))))
    (hash 'O (bv->signal (lut (signal-value INIT) (concat (signal-value I1) (signal-value I0)))))))
