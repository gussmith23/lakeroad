;;; Automatically generated with:
;;; $LAKEROAD_DIR/bin/verilog_to_racket.py \
;;;   --infile $LAKEROAD_DIR/modules_for_importing/xilinx_ultrascale_plus/CARRY8.v \
;;;   --top CARRY8 \
;;;   --function-name xilinx-ultrascale-plus-carry8

#lang racket/base
(provide xilinx-ultrascale-plus-carry8)
(require "../stateful-design-experiment.rkt")
(require rosette)
(require racket/hash)
(define xilinx-ultrascale-plus-carry8
  (λ (#:CARRY_TYPE (CARRY_TYPE (bv->signal (constant (list 'CARRY_TYPE 'symbolic-constant)
                                                     (bitvector 1))))
      #:CI (CI (bv->signal (constant (list 'CI 'symbolic-constant) (bitvector 1))))
      #:CI_TOP (CI_TOP (bv->signal (constant (list 'CI_TOP 'symbolic-constant) (bitvector 1))))
      #:DI (DI (bv->signal (constant (list 'DI 'symbolic-constant) (bitvector 8))))
      #:S (S (bv->signal (constant (list 'S 'symbolic-constant) (bitvector 8)))))
    (let* ([merged-input-state-hash (hash)]
           [init-hash (hash)]
           [btor1 (bitvector 1)]
           [btor2 CARRY_TYPE]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CARRY_TYPE))]
           [btor3 CI]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CI))]
           [btor4 CI_TOP]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state CI_TOP))]
           [btor5 (bitvector 8)]
           [btor6 DI]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state DI))]
           [btor7 S]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state S))]
           [btor8 (signal (extract 0 0 (signal-value btor6)) (signal-state btor6))]
           [btor9 (signal (extract 0 0 (signal-value btor7)) (signal-state btor7))]
           [btor10 (if (bitvector->bool (signal-value btor9)) btor3 btor8)]
           [btor11 (signal (extract 1 1 (signal-value btor6)) (signal-state btor6))]
           [btor12 (signal (extract 1 1 (signal-value btor7)) (signal-state btor7))]
           [btor13 (if (bitvector->bool (signal-value btor12)) btor10 btor11)]
           [btor14 (signal (extract 2 2 (signal-value btor6)) (signal-state btor6))]
           [btor15 (signal (extract 2 2 (signal-value btor7)) (signal-state btor7))]
           [btor16 (if (bitvector->bool (signal-value btor15)) btor13 btor14)]
           [btor17 (signal (extract 3 3 (signal-value btor6)) (signal-state btor6))]
           [btor18 (signal (extract 3 3 (signal-value btor7)) (signal-state btor7))]
           [btor19 (if (bitvector->bool (signal-value btor18)) btor16 btor17)]
           [btor20 (signal (extract 4 4 (signal-value btor6)) (signal-state btor6))]
           [btor21 (if (bitvector->bool (signal-value btor2)) btor4 btor19)]
           [btor22 (signal (extract 4 4 (signal-value btor7)) (signal-state btor7))]
           [btor23 (if (bitvector->bool (signal-value btor22)) btor21 btor20)]
           [btor24 (signal (extract 5 5 (signal-value btor6)) (signal-state btor6))]
           [btor25 (signal (extract 5 5 (signal-value btor7)) (signal-state btor7))]
           [btor26 (if (bitvector->bool (signal-value btor25)) btor23 btor24)]
           [btor27 (signal (extract 6 6 (signal-value btor6)) (signal-state btor6))]
           [btor28 (signal (extract 6 6 (signal-value btor7)) (signal-state btor7))]
           [btor29 (if (bitvector->bool (signal-value btor28)) btor26 btor27)]
           [btor30 (signal (extract 7 7 (signal-value btor6)) (signal-state btor6))]
           [btor31 (signal (extract 7 7 (signal-value btor7)) (signal-state btor7))]
           [btor32 (if (bitvector->bool (signal-value btor31)) btor29 btor30)]
           [btor33 (bitvector 2)]
           [btor34 (signal (concat (signal-value btor13) (signal-value btor10))
                           (merge-state (list btor13 btor10)))]
           [btor35 (bitvector 3)]
           [btor36 (signal (concat (signal-value btor16) (signal-value btor34))
                           (merge-state (list btor16 btor34)))]
           [btor37 (bitvector 4)]
           [btor38 (signal (concat (signal-value btor19) (signal-value btor36))
                           (merge-state (list btor19 btor36)))]
           [btor39 (bitvector 5)]
           [btor40 (signal (concat (signal-value btor23) (signal-value btor38))
                           (merge-state (list btor23 btor38)))]
           [btor41 (bitvector 6)]
           [btor42 (signal (concat (signal-value btor26) (signal-value btor40))
                           (merge-state (list btor26 btor40)))]
           [btor43 (bitvector 7)]
           [btor44 (signal (concat (signal-value btor29) (signal-value btor42))
                           (merge-state (list btor29 btor42)))]
           [btor45 (signal (concat (signal-value btor32) (signal-value btor44))
                           (merge-state (list btor32 btor44)))]
           [btor47 (signal (concat (signal-value btor10) (signal-value btor3))
                           (merge-state (list btor10 btor3)))]
           [btor48 (signal (concat (signal-value btor13) (signal-value btor47))
                           (merge-state (list btor13 btor47)))]
           [btor49 (signal (concat (signal-value btor16) (signal-value btor48))
                           (merge-state (list btor16 btor48)))]
           [btor50 (signal (concat (signal-value btor21) (signal-value btor49))
                           (merge-state (list btor21 btor49)))]
           [btor51 (signal (concat (signal-value btor23) (signal-value btor50))
                           (merge-state (list btor23 btor50)))]
           [btor52 (signal (concat (signal-value btor26) (signal-value btor51))
                           (merge-state (list btor26 btor51)))]
           [btor53 (signal (concat (signal-value btor29) (signal-value btor52))
                           (merge-state (list btor29 btor52)))]
           [btor54 (signal (bvxor (signal-value btor7) (signal-value btor53))
                           (merge-state (list btor7 btor53)))]
           [btor56 (bv->signal (zero-extend (signal-value btor21) (bitvector 1)) btor21)]
           [btor57 (bv->signal (zero-extend (signal-value btor10) (bitvector 1)) btor10)]
           [btor58 (bv->signal (zero-extend (signal-value btor13) (bitvector 1)) btor13)]
           [btor59 (bv->signal (zero-extend (signal-value btor16) (bitvector 1)) btor16)]
           [btor60 (bv->signal (zero-extend (signal-value btor19) (bitvector 1)) btor19)]
           [btor61 (bv->signal (zero-extend (signal-value btor23) (bitvector 1)) btor23)]
           [btor62 (bv->signal (zero-extend (signal-value btor26) (bitvector 1)) btor26)]
           [btor63 (bv->signal (zero-extend (signal-value btor29) (bitvector 1)) btor29)]
           [btor64 (bv->signal (zero-extend (signal-value btor32) (bitvector 1)) btor32)])
      (make-immutable-hash (list (cons 'CO (signal (signal-value btor45) (hash)))
                                 (cons 'O (signal (signal-value btor54) (hash))))))))
