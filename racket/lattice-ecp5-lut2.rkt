;;; Generated with:
;;; $LAKEROAD_DIR/bin/verilog_to_racket.py \
;;;   --infile $LAKEROAD_DIR/modules_for_importing/lattice_ecp5/LUT2.v \
;;;   --top LUT2 \
;;;   --function-name lattice-ecp5-lut2

#lang racket/base
(provide lattice-ecp5-lut2)
(require "stateful-design-experiment.rkt")
(require rosette)
(require racket/hash)
(define lattice-ecp5-lut2
  (λ (inputs)
    (let* ([A (or (cdr (assoc 'A inputs))
                  (bv->signal (constant (list 'A 'symbolic-constant) (bitvector 1))))]
           [B (or (cdr (assoc 'B inputs))
                  (bv->signal (constant (list 'B 'symbolic-constant) (bitvector 1))))]
           [INIT (or (cdr (assoc 'INIT inputs))
                     (bv->signal (constant (list 'INIT 'symbolic-constant) (bitvector 4))))]
           [merged-input-state-hash (hash)]
           [init-hash (hash)]
           [btor1 (bitvector 1)]
           [btor2 A]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state A))]
           [btor3 B]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state B))]
           [btor4 (bitvector 4)]
           [btor5 INIT]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state INIT))]
           [btor6 (bitvector 2)]
           [btor7 (signal (extract 1 0 (signal-value btor5)) (signal-state btor5))]
           [btor8 (signal (extract 3 2 (signal-value btor5)) (signal-state btor5))]
           [btor9 (if (bitvector->bool (signal-value btor3)) btor8 btor7)]
           [btor10 (signal (extract 0 0 (signal-value btor9)) (signal-state btor9))]
           [btor11 (signal (extract 1 1 (signal-value btor9)) (signal-state btor9))]
           [btor12 (if (bitvector->bool (signal-value btor2)) btor11 btor10)]
           [btor14 (bv->signal (zero-extend (signal-value btor9) (bitvector 2)) btor9)])
      (make-immutable-hash (list (cons 'Z (signal (signal-value btor12) (hash))))))))
