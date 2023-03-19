;;; Generated with:
;;; $LAKEROAD_DIR/bin/verilog_to_racket.py \
;;;   --infile $LAKEROAD_DIR/modules_for_importing/lattice_ecp5/LUT4.v \
;;;   --top LUT4 \
;;;   --function-name lattice-ecp5-lut4

#lang racket/base
(provide lattice-ecp5-lut4)
(require "../signal.rkt")
(require rosette)
(require racket/hash)
(define lattice-ecp5-lut4
  (λ (#:A (A (bv->signal (constant (list 'A 'symbolic-constant) (bitvector 1))))
      #:B (B (bv->signal (constant (list 'B 'symbolic-constant) (bitvector 1))))
      #:C (C (bv->signal (constant (list 'C 'symbolic-constant) (bitvector 1))))
      #:D (D (bv->signal (constant (list 'D 'symbolic-constant) (bitvector 1))))
      #:init (init (bv->signal (constant (list 'init 'symbolic-constant) (bitvector 16)))))
    (let* ([merged-input-state-hash (hash)]
           [init-hash (hash)]
           [btor1 (bitvector 1)]
           [btor2 A]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state A))]
           [btor3 B]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state B))]
           [btor4 C]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state C))]
           [btor5 D]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state D))]
           [btor6 (bitvector 16)]
           [btor7 init]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state init))]
           [btor8 (bitvector 8)]
           [btor9 (signal (extract 7 0 (signal-value btor7)) (signal-state btor7))]
           [btor10 (signal (extract 15 8 (signal-value btor7)) (signal-state btor7))]
           [btor11 (if (bitvector->bool (signal-value btor5)) btor10 btor9)]
           [btor12 (bitvector 4)]
           [btor13 (signal (extract 3 0 (signal-value btor11)) (signal-state btor11))]
           [btor14 (signal (extract 7 4 (signal-value btor11)) (signal-state btor11))]
           [btor15 (if (bitvector->bool (signal-value btor4)) btor14 btor13)]
           [btor16 (bitvector 2)]
           [btor17 (signal (extract 1 0 (signal-value btor15)) (signal-state btor15))]
           [btor18 (signal (extract 3 2 (signal-value btor15)) (signal-state btor15))]
           [btor19 (if (bitvector->bool (signal-value btor3)) btor18 btor17)]
           [btor20 (signal (extract 0 0 (signal-value btor19)) (signal-state btor19))]
           [btor21 (signal (extract 1 1 (signal-value btor19)) (signal-state btor19))]
           [btor22 (if (bitvector->bool (signal-value btor2)) btor21 btor20)]
           [btor24 (bv->signal (zero-extend (signal-value btor19) (bitvector 2)) btor19)]
           [btor25 (bv->signal (zero-extend (signal-value btor15) (bitvector 4)) btor15)]
           [btor26 (bv->signal (zero-extend (signal-value btor11) (bitvector 8)) btor11)])
      (make-immutable-hash (list (cons 'Z (signal (signal-value btor22) (hash))))))))
