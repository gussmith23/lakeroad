#lang racket/base
(provide xilinx-ultrascale-plus-lut2)
(require "signal.rkt")
(require "lut.rkt")
(require rosette)
(define xilinx-ultrascale-plus-lut2
  (λ (#:I0 (I0 (bv->signal (constant (list 'I0 'symbolic-constant) (bitvector 1))))
      #:I1 (I1 (bv->signal (constant (list 'I1 'symbolic-constant) (bitvector 1))))
      #:INIT (INIT (bv->signal (constant (list 'INIT 'symbolic-constant) (bitvector 4))))
      #:name (name ""))
    (list (cons 'O
                (signal (lut (signal-value INIT) (concat (signal-value I1) (signal-value I0)))
                        (merge-state (list I0 I1 INIT)))))))
