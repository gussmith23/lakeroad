#lang racket/base
(provide intel-cyclone10lp-mac-out)
(require "../signal.rkt")
(require rosette)
(define intel-cyclone10lp-mac-out
  (λ (#:aclr
      (aclr (bv->signal (constant 'aclr (bitvector 1))))
      #:clk
      (clk (bv->signal (constant 'clk (bitvector 1))))
      #:dataa
      (dataa (bv->signal (constant 'dataa (bitvector 1))))
      #:devclrn
      (devclrn (bv->signal (constant 'devclrn (bitvector 1))))
      #:devpor
      (devpor (bv->signal (constant 'devpor (bitvector 1))))
      #:ena
      (ena (bv->signal (constant 'ena (bitvector 1))))
      #:name
      (name ""))
    (let* ((merged-input-state-hash (list))
           (init-hash (list))
           (btor1 (bitvector 1))
           (btor2 aclr)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state aclr)))
           (btor3 clk)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state clk)))
           (btor4 dataa)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state dataa)))
           (btor5 devclrn)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state devclrn)))
           (btor6 devpor)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state devpor)))
           (btor7 ena)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state ena)))
           (btor9
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 1))
             btor2))
           (btor10
            (bv->signal
             (zero-extend (signal-value btor3) (bitvector 1))
             btor3))
           (btor11
            (bv->signal
             (zero-extend (signal-value btor4) (bitvector 1))
             btor4))
           (btor12
            (bv->signal
             (zero-extend (signal-value btor4) (bitvector 1))
             btor4))
           (btor13
            (bv->signal
             (zero-extend (signal-value btor7) (bitvector 1))
             btor7))
           (btor14 (bv->signal (bv 0 (bitvector 1))))
           (btor15
            (bv->signal
             (zero-extend (signal-value btor14) (bitvector 1))
             btor14))
           (btor16
            (bv->signal
             (zero-extend (signal-value btor14) (bitvector 1))
             btor14))
           (btor17
            (bv->signal
             (zero-extend (signal-value btor14) (bitvector 1))
             btor14))
           (output-state
            (remove-duplicates
             (append (list) merged-input-state-hash)
             equal?
             #:key
             car)))
      (list (cons 'dataout (signal (signal-value btor4) output-state))))))
