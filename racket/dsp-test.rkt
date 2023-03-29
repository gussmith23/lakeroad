;;; TODO(@ninehusky): get rid of errortrace
#lang errortrace racket

(require rackunit)
(require rosette)
(require (prefix-in lr: "language.rkt"))
(require "architecture-description.rkt")
(require "synthesize.rkt")
(require "verilator.rkt")
(require "utils.rkt")
(require "generated/xilinx-ultrascale-plus-dsp48e2.rkt")

(define architecture-description (xilinx-ultrascale-plus-architecture-description))

(module+ test
  (require rackunit
           "interpreter.rkt"
           rosette/solver/smt/boolector)

  (current-solver (boolector))

  (define-syntax-rule (sketch-test #:name name
                                   #:defines defines
                                   ...
                                   #:bv-expr bv-expr
                                   #:dsp-sketch dsp-sketch
                                   #:module-semantics module-semantics
                                   #:include-dirs include-dirs
                                   #:extra-verilator-args extra-verilator-args)
    (test-case
     name
     (with-terms
      (begin
        (displayln "--------------------------------------------------------------------------------")
        (displayln (format "running test ~a" name))
        defines ...

        (define result-that-actually-works
          (rosette-synthesize bv-expr
                              dsp-sketch
                              (symbolics bv-expr)
                              #:module-semantics module-semantics))

        (define result
          (with-vc (with-terms (rosette-synthesize bv-expr
                                                   dsp-sketch
                                                   (symbolics bv-expr)
                                                   #:module-semantics module-semantics))))

        (check-true (normal? result))
        (define soln (result-value result))
        (check-true (not (equal? soln #f)))

        (when (not (getenv "VERILATOR_INCLUDE_DIR"))
          (raise "VERILATOR_INCLUDE_DIR not set"))

        (displayln "simulating with verilator...")
        (check-true (simulate-with-verilator #:include-dirs include-dirs
                                             #:extra-verilator-args extra-verilator-args
                                             (list (to-simulate soln bv-expr))
                                             (getenv "VERILATOR_INCLUDE_DIR")))))))

  (sketch-test
   #:name "bvmul on Xilinx DSP48E2"
   #:defines (define-symbolic a b (bitvector 16))
   #:bv-expr (bvmul a b)
   #:dsp-sketch (lr:hash-ref (first (construct-interface
                                     architecture-description
                                     (interface-identifier "DSP" (hash "width" 16))
                                     (list (cons "A" (lr:bv a)) (cons "B" (lr:bv b)))
                                     #:internal-data #f))
                             'O)
   #:module-semantics (list (cons (cons "DSP48E2" "../verilator_unisims/DSP48E2.v")
                                  xilinx-ultrascale-plus-dsp48e2))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilator_xilinx")
                        (build-path (get-lakeroad-directory) "verilator-unisims"))
   #:extra-verilator-args
   "-Wno-UNUSED -Wno-LATCH -Wno-ASSIGNDLY -DXIL_XECLIB -Wno-TIMESCALEMOD -Wno-PINMISSING -Wno-UNOPT")

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
                                     architecture-description
                                     (interface-identifier "DSP" (hash "width" 16))
                                     (list (cons "A" (lr:bv a)) (cons "B" (lr:bv b)))
                                     #:internal-data #f))
                             'O)
   #:module-semantics (list (cons (cons "DSP48E2" "../verilator_unisims/DSP48E2.v")
                                  xilinx-ultrascale-plus-dsp48e2))
   #:include-dirs (list (build-path (get-lakeroad-directory) "verilator_xilinx")
                        (build-path (get-lakeroad-directory) "verilator-unisims"))
   #:extra-verilator-args
   "-Wno-UNUSED -Wno-LATCH -Wno-ASSIGNDLY -DXIL_XECLIB -Wno-TIMESCALEMOD -Wno-PINMISSING -Wno-UNOPT"))
