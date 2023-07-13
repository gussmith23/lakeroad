#lang racket/base
(provide lattice-ecp5-lut2)
(require "../signal.rkt")
(require rosette)
(define lattice-ecp5-lut2
  (λ (#:A
      (A (bv->signal (constant 'A (bitvector 1))))
      #:B
      (B (bv->signal (constant 'B (bitvector 1))))
      #:init
      (init (bv->signal (constant 'init (bitvector 4))))
      #:name
      (name ""))
    (let* ((merged-input-state-hash (list))
           (init-hash (list))
           (btor1 (bitvector 1))
           (btor2 A)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state A)))
           (btor3 B)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state B)))
           (btor4 (bitvector 4))
           (btor5 init)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state init)))
           (btor6 (bitvector 2))
           (btor7
            (signal (extract 1 0 (signal-value btor5)) (signal-state btor5)))
           (btor8
            (signal (extract 3 2 (signal-value btor5)) (signal-state btor5)))
           (btor9 (if (bitvector->bool (signal-value btor3)) btor8 btor7))
           (btor10
            (signal (extract 0 0 (signal-value btor9)) (signal-state btor9)))
           (btor11
            (signal (extract 1 1 (signal-value btor9)) (signal-state btor9)))
           (btor12 (if (bitvector->bool (signal-value btor2)) btor11 btor10))
           (btor14
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 2))
             btor9)))
      (list
       (cons
        'Z
        (signal
         (signal-value btor12)
         (append (list) merged-input-state-hash)))))))
