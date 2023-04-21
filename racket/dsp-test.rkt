#lang racket

(require rackunit)
(require rosette)
(require (prefix-in lr: "language.rkt"))
(require "architecture-description.rkt")
(require "synthesize.rkt")
(require "verilator.rkt")
(require "utils.rkt")
(require "interpreter.rkt")
(require "signal.rkt")
(require "generated/intel-altmult-accum.rkt")
(require "generated/xilinx-ultrascale-plus-dsp48e2.rkt")
(require "generated/lattice-ecp5-mult18x18d.rkt")

(define xilinx-architecture-description (xilinx-ultrascale-plus-architecture-description))
(define lattice-architecture-description (lattice-ecp5-architecture-description))
(define the-intel-architecture-description (intel-architecture-description))

(module+ test
  (require rackunit
           rosette/solver/smt/boolector)

  (current-solver (boolector))

  (define-syntax-rule (sketch-test #:name name
                                   #:defines defines
                                   ...
                                   #:bv-expr bv-expr
                                   #:dsp-sketch dsp-sketch
                                   #:module-semantics module-semantics
                                   #:include-dirs include-dirs
                                   #:extra-verilator-args extra-verilator-args
                                   #:run-with-verilator run-with-verilator)
    (test-case
     name
     (with-terms
      (begin
        (displayln "--------------------------------------------------------------------------------")
        (displayln (format "running test ~a" name))
        defines ...

        (define result
          (with-vc (with-terms (rosette-synthesize bv-expr
                                                   dsp-sketch
                                                   (symbolics bv-expr)
                                                   #:module-semantics module-semantics))))
        (check-true (normal? result))
        (define soln (result-value result))
        (check-true (not (equal? soln #f)))

        (when run-with-verilator
          (when (not (getenv "VERILATOR_INCLUDE_DIR"))
            (raise "VERILATOR_INCLUDE_DIR not set"))

          (displayln "simulating with verilator...")
          (check-true (simulate-with-verilator #:include-dirs include-dirs
                                               #:extra-verilator-args extra-verilator-args
                                               (list (to-simulate soln bv-expr))
                                               (getenv "VERILATOR_INCLUDE_DIR"))))))))

  (sketch-test
   #:name "bvmul 16 on Xilinx DSP48E2"
   #:defines (define-symbolic a b (bitvector 16))
   #:bv-expr (bvmul a b)
   #:dsp-sketch (lr:hash-ref (first (construct-interface
                                     xilinx-architecture-description
                                     (interface-identifier "DSP" (hash "width" 16))
                                     (list (cons "A" (lr:bv (bv->signal a)))
                                           (cons "B" (lr:bv (bv->signal b))))
                                     #:internal-data #f))
                             'O)
   #:module-semantics (list (cons (cons "DSP48E2" "../verilator_unisims/DSP48E2.v")
                                  xilinx-ultrascale-plus-dsp48e2))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilator_xilinx")
                        (build-path (get-lakeroad-directory) "verilator-unisims"))
   #:extra-verilator-args
   "-Wno-UNUSED -Wno-LATCH -Wno-ASSIGNDLY -DXIL_XECLIB -Wno-TIMESCALEMOD -Wno-PINMISSING -Wno-UNOPT"
   #:run-with-verilator #t)

  (sketch-test
   #:name "bvmul 8 on Lattice ECP5"
   #:defines (define-symbolic a b (bitvector 8))
   #:bv-expr (bvmul a b)
   #:dsp-sketch
   (lr:extract
    (lr:integer 7)
    (lr:integer 0)
    (lr:hash-ref
     (first (construct-interface
             lattice-architecture-description
             (interface-identifier "DSP" (hash "width" 16))
             (list (cons "A" (lr:zero-extend (lr:bv (bv->signal a)) (lr:bitvector (bitvector 16))))
                   (cons "B" (lr:zero-extend (lr:bv (bv->signal b)) (lr:bitvector (bitvector 16)))))
             #:internal-data #f))
     'O))
   #:module-semantics (list (cons (cons "MULT18X18D" "../lakeroad-private/lattice_ecp5/MULT18X18D.v")
                                  lattice-ecp5-mult18x18d))
   #:include-dirs (list (build-path (get-lakeroad-directory) "f4pga-arch-defs/ecp5/primitives/slice"))
   #:extra-verilator-args
   "-Wno-UNUSED -Wno-LATCH -Wno-ASSIGNDLY -DXIL_XECLIB -Wno-TIMESCALEMOD -Wno-PINMISSING -Wno-UNOPT"
   #:run-with-verilator #f)

  (sketch-test
   #:name "bvmul 16 on Lattice ECP5"
   #:defines (define-symbolic a b (bitvector 16))
   #:bv-expr (bvmul a b)
   #:dsp-sketch (lr:hash-ref (first (construct-interface
                                     lattice-architecture-description
                                     (interface-identifier "DSP" (hash "width" 16))
                                     (list (cons "A" (lr:bv (bv->signal a)))
                                           (cons "B" (lr:bv (bv->signal b))))
                                     #:internal-data #f))
                             'O)
   #:module-semantics (list (cons (cons "MULT18X18D" "../lakeroad-private/lattice_ecp5/MULT18X18D.v")
                                  lattice-ecp5-mult18x18d))
   #:include-dirs (list (build-path (get-lakeroad-directory) "f4pga-arch-defs/ecp5/primitives/slice"))
   #:extra-verilator-args
   "-Wno-UNUSED -Wno-LATCH -Wno-ASSIGNDLY -DXIL_XECLIB -Wno-TIMESCALEMOD -Wno-PINMISSING -Wno-UNOPT"
   #:run-with-verilator #f)

  (sketch-test
   #:name "bvmul 16 on Intel"
   #:defines (define-symbolic a b (bitvector 16))
   #:bv-expr (bvmul a b)
   #:dsp-sketch (lr:hash-ref (first (construct-interface
                                     the-intel-architecture-description
                                     (interface-identifier "DSP" (hash "width" 16))
                                     (list (cons "A" (lr:bv a)) (cons "B" (lr:bv b)))
                                     #:internal-data #f))
                             'O)
   #:module-semantics (list (cons (cons "altmult_accum" "unused") intel-altmult-accum))
   #:include-dirs (list)
   #:extra-verilator-args
   "-Wno-UNUSED -Wno-LATCH -Wno-ASSIGNDLY -DXIL_XECLIB -Wno-TIMESCALEMOD -Wno-PINMISSING -Wno-UNOPT"
   #:run-with-verilator #f)

  ;;; TODO(@ninehusky): find out why these aren't working by going through the DSP48E2 manual

  ;;; (sketch-test
  ;;;  #:name "bvor on Xilinx DSP48E2"
  ;;;  #:defines (define-symbolic a b (bitvector 16))
  ;;;  #:bv-expr (bvor a b)
  ;;;  #:dsp-sketch (lr:hash-ref (first (construct-interface
  ;;;                                    architecture-description
  ;;;                                    (interface-identifier "DSP" (hash "width" 16))
  ;;;                                    (list (cons "A" (lr:bv a)) (cons "B" (lr:bv b)))
  ;;;                                    #:internal-data #f))
  ;;;                            'O)
  ;;;  #:module-semantics (list (cons (cons "DSP48E2" "../verilator_unisims/DSP48E2.v")
  ;;;                                 xilinx-ultrascale-plus-dsp48e2))
  ;;;  #:include-dirs (list (build-path (get-lakeroad-directory) "verilator_xilinx")
  ;;;                       (build-path (get-lakeroad-directory) "verilator-unisims"))
  ;;;  #:extra-verilator-args
  ;;;  "-Wno-UNUSED -Wno-LATCH -Wno-ASSIGNDLY -DXIL_XECLIB -Wno-TIMESCALEMOD -Wno-PINMISSING -Wno-UNOPT")

  ;;; (sketch-test
  ;;;  #:name "bvnot on Xilinx DSP48E2"
  ;;;  #:defines (define-symbolic a b (bitvector 16))
  ;;;  #:bv-expr (bvnot a)
  ;;;  #:dsp-sketch (lr:hash-ref (first (construct-interface
  ;;;                                    architecture-description
  ;;;                                    (interface-identifier "DSP" (hash "width" 16))
  ;;;                                    (list (cons "A" (lr:bv a)) (cons "B" (lr:bv b)))
  ;;;                                    #:internal-data #f))
  ;;;                            'O)
  ;;;  #:module-semantics (list (cons (cons "DSP48E2" "../verilator_unisims/DSP48E2.v")
  ;;;                                 xilinx-ultrascale-plus-dsp48e2))
  ;;;  #:include-dirs (list (build-path (get-lakeroad-directory) "verilator_xilinx")
  ;;;                       (build-path (get-lakeroad-directory) "verilator-unisims"))
  ;;;  #:extra-verilator-args
  ;;;  "-Wno-UNUSED -Wno-LATCH -Wno-ASSIGNDLY -DXIL_XECLIB -Wno-TIMESCALEMOD -Wno-PINMISSING -Wno-UNOPT")

  ;;; (sketch-test
  ;;;  #:name "bvxor on Xilinx DSP48E2"
  ;;;  #:defines (define-symbolic a b (bitvector 16))
  ;;;  #:bv-expr (bvxor a b)
  ;;;  #:dsp-sketch (lr:hash-ref (first (construct-interface
  ;;;                                    architecture-description
  ;;;                                    (interface-identifier "DSP" (hash "width" 16))
  ;;;                                    (list (cons "A" (lr:bv a)) (cons "B" (lr:bv b)))
  ;;;                                    #:internal-data #f))
  ;;;                            'O)
  ;;;  #:module-semantics (list (cons (cons "DSP48E2" "../verilator_unisims/DSP48E2.v")
  ;;;                                 xilinx-ultrascale-plus-dsp48e2))
  ;;;  #:include-dirs (list (build-path (get-lakeroad-directory) "verilator_xilinx")
  ;;;                       (build-path (get-lakeroad-directory) "verilator-unisims"))
  ;;;  #:extra-verilator-args
  ;;;  "-Wno-UNUSED -Wno-LATCH -Wno-ASSIGNDLY -DXIL_XECLIB -Wno-TIMESCALEMOD -Wno-PINMISSING -Wno-UNOPT")

  (sketch-test
   #:name "bvmul and bvand on Xilinx DSP48E2"
   #:defines (define-symbolic a b (bitvector 16))
   #:bv-expr (bvand (bvmul a b) (bvmul a b))
   #:dsp-sketch (lr:hash-ref (first (construct-interface
                                     xilinx-architecture-description
                                     (interface-identifier "DSP" (hash "width" 16))
                                     (list (cons "A" (lr:bv (bv->signal a)))
                                           (cons "B" (lr:bv (bv->signal b))))
                                     #:internal-data #f))
                             'O)
   #:module-semantics (list (cons (cons "DSP48E2" "../verilator_unisims/DSP48E2.v")
                                  xilinx-ultrascale-plus-dsp48e2))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilator_xilinx")
                        (build-path (get-lakeroad-directory) "verilator-unisims"))
   #:extra-verilator-args
   "-Wno-UNUSED -Wno-LATCH -Wno-ASSIGNDLY -DXIL_XECLIB -Wno-TIMESCALEMOD -Wno-PINMISSING -Wno-UNOPT"
   #:run-with-verilator #f))
