#lang racket

(require rackunit)
(require rosette)
(require (prefix-in lr: "language.rkt"))
(require "architecture-description.rkt")
(require "synthesize.rkt")
(require "verilator.rkt")
(require "utils.rkt")
(require "generated/xilinx-ultrascale-plus-dsp48e2.rkt")

(define architecture-description (xilinx-ultrascale-plus-architecture-description))

(define-symbolic a b (bitvector 16))

(define dsp-sketch
  (lr:hash-ref (first (construct-interface architecture-description
                                           (interface-identifier "DSP" (hash "width" 16))
                                           (list (cons "A" (lr:bv a)) (cons "B" (lr:bv b)))
                                           #:internal-data #f))
               'O))

(displayln (format "DSP sketch: ~a" dsp-sketch))

;;; synthesize the interface
(define lr-dsp
  (rosette-synthesize (bvmul a b)
                      dsp-sketch
                      (list a b)
                      #:module-semantics (list (cons (cons "DSP48E2" "../verilator_unisims/DSP48E2.v")
                                                     xilinx-ultrascale-plus-dsp48e2))))
(displayln "synthesized DSP:")
(displayln lr-dsp)
(simulate-with-verilator
 #:include-dirs (list (build-path (get-lakeroad-directory) "verilator_xilinx")
                      (build-path (get-lakeroad-directory) "verilator-unisims"))
 #:extra-verilator-args
 "-Wno-UNUSED -Wno-LATCH -Wno-ASSIGNDLY -DXIL_XECLIB -Wno-TIMESCALEMOD -Wno-PINMISSING -Wno-UNOPT"
 (list (to-simulate lr-dsp (bvmul a b)))
 (getenv "VERILATOR_INCLUDE_DIR"))
