#lang racket/base
;;; Specifically test that some functions work on DSPs.

;;; TODO(@gussmith23): Restructure to use batched simulation w/ Verilator.

(module+ test

  (require "synthesize.rkt"
           "verilator.rkt"
           "utils.rkt"
           rackunit
           rosette)

  (define to-simulate-list (list))
  (define (end-to-end-test bv-expr)
    (test-case
     (format "~a-bit ~a" (bvlen bv-expr) bv-expr)
     (begin
       (define with-vc-result (with-vc (with-terms (synthesize-xilinx-ultrascale-plus-dsp bv-expr))))
       (when (failed? with-vc-result)
         (raise (result-value with-vc-result)))
       (define lakeroad-expr (result-value with-vc-result))
       (check-not-equal? lakeroad-expr #f)
       (set! to-simulate-list (cons (to-simulate lakeroad-expr bv-expr) to-simulate-list)))))

  (for ([sz (list 1 2 3 4 5 6 7 8 16)])
    (after
     (gc-terms!)
     (define-symbolic l0 l1 l2 l3 (bitvector sz))
     (check-equal? (bvlen l0) sz)
     (check-equal? (bvlen l1) sz)
     (check-equal? (bvlen l2) sz)
     (check-equal? (bvlen l3) sz)
     (end-to-end-test (bvsub l0 l1))
     ;;; TODO(@gussmith23): This test takes especially long for 8 and 16 bit (256^4 points to
     ;;; simulate). Could enable an option to forcibly enable random testing.
     (end-to-end-test (bvadd (bvmul (bvadd l0 l1) l2) l3))
     ;;; TODO(@gussmith23): Re-enable this test on all inputs once Rosette bug (#174) fixed.
     (when (not (equal? sz 16))
       (end-to-end-test (bvadd (bvmul l0 l1) l2)))
     (end-to-end-test (bvmul (bvadd l0 l1) l2))
     ; Sub on pre-adder doesn't seem to be working.
     ;(test-true (format "~a-bit sub-mul" sz) (end-to-end-test (bvmul (bvsub l0 l1) l2)))
     (end-to-end-test (bvmul (bvadd l0 l1) (bvadd l0 l1)))
     ;(test-true (format "~a-bit sub squared" sz) (end-to-end-test (bvmul (bvsub l0 l1) (bvsub l0 l1))))
     (end-to-end-test (bvadd l0 l1))
     ;;; TODO(@gussmith23): Re-enable this test on all inputs once Rosette bug (#174) fixed.
     (when (not (equal? sz 16))
       (end-to-end-test (bvmul l0 l1)))
     (end-to-end-test (bvneg (bvmul l0 l1)))
     ;;; TODO(@gussmith23): Re-enable this test on all inputs once Rosette bug (#174) fixed.
     (when (not (equal? sz 16))
       (end-to-end-test (bvmul (bvsub l0 l1) l2)))
     (end-to-end-test (bvmul (bvsub l0 l1) (bvsub l0 l1)))
     (end-to-end-test l0)
     (begin
       (clear-vc!)
       (clear-terms!)
       (collect-garbage))))

  (when (not (getenv "VERILATOR_INCLUDE_DIR"))
    (raise "VERILATOR_INCLUDE_DIR not set"))
  (define include-dir (build-path (get-lakeroad-directory) "verilator_xilinx"))
  (test-true
   "simulate all synthesized designs with Verilator"
   (simulate-with-verilator
    #:max-loop-bound 128
    #:force-random-values #t
    #:include-dirs (list (build-path (get-lakeroad-directory) "verilator_xilinx")
                         (build-path (get-lakeroad-directory) "verilator-unisims"))
    #:extra-verilator-args
    "-Wno-TIMESCALEMOD -Wno-PINMISSING -Wno-UNUSED -Wno-LATCH -Wno-ASSIGNDLY --CFLAGS -DVL_TIME_STAMP64 --CFLAGS -DVL_NO_LEGACY -DXIL_XECLIB"
    to-simulate-list
    (getenv "VERILATOR_INCLUDE_DIR"))))
