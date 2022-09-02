#lang racket/base
;;; Specifically test that some functions work on DSPs.

;;; TODO(@gussmith23): Restructure to use batched simulation w/ Verilator.

(module+ test

  (require "synthesize.rkt"
           "verilator.rkt"
           "utils.rkt"
           rackunit
           rosette)

  (define includes-dir (build-path (getenv "LAKEROAD_DIR") "verilator_xilinx"))
  (define includes
    (append (for/list ([mod (list "CARRY8.v" "LUT6_2.v" "LUT3.v" "LUT2.v" "LUT1.v")])
              (format "~a/~a" includes-dir mod))
            (list (build-path (getenv "LAKEROAD_DIR") "verilator-unisims" "DSP48E2.v"))))
  (define (end-to-end-test bv-expr)
    (define with-vc-result (with-vc (with-terms (synthesize-xilinx-ultrascale-plus-dsp bv-expr))))
    (when (failed? with-vc-result)
      (raise (result-value with-vc-result)))
    (define lakeroad-expr (result-value with-vc-result))
    (check-not-equal? lakeroad-expr #f)

    (simulate-expr
     lakeroad-expr
     bv-expr
     #:includes includes
     #:extra-verilator-args
     "-Wno-LATCH -Wno-ASSIGNDLY --CFLAGS -DVL_TIME_STAMP64 --CFLAGS -DVL_NO_LEGACY -DXIL_XECLIB"))

  (for ([sz (list 1 2 3 4 5 6 7 8 16)])
    (after
     (gc-terms!)
     (define-symbolic l0 l1 l2 l3 (bitvector sz))
     (check-equal? (bvlen l0) sz)
     (check-equal? (bvlen l1) sz)
     (check-equal? (bvlen l2) sz)
     (check-equal? (bvlen l3) sz)
     (test-true (format "~a-bit sub" sz) (end-to-end-test (bvsub l0 l1)))
     (test-true (format "~a-bit mul-add-mul" sz)
                (end-to-end-test (bvadd (bvmul (bvadd l0 l1) l2) l3)))
     (test-true (format "~a-bit mul-add" sz) (end-to-end-test (bvadd (bvmul l0 l1) l2)))
     (test-true (format "~a-bit add-mul" sz) (end-to-end-test (bvmul (bvadd l0 l1) l2)))
     ; Sub on pre-adder doesn't seem to be working.
     ;(test-true (format "~a-bit sub-mul" sz) (end-to-end-test (bvmul (bvsub l0 l1) l2)))
     (test-true (format "~a-bit add squared" sz)
                (end-to-end-test (bvmul (bvadd l0 l1) (bvadd l0 l1))))
     ;(test-true (format "~a-bit sub squared" sz) (end-to-end-test (bvmul (bvsub l0 l1) (bvsub l0 l1))))
     (test-true (format "~a-bit square" sz) (end-to-end-test (bvmul l0 l0)))
     (test-true (format "~a-bit add" sz) (end-to-end-test (bvadd l0 l1)))
     (test-true (format "~a-bit mul" sz) (end-to-end-test (bvmul l0 l1)))
     (test-true (format "~a-bit identity" sz) (end-to-end-test l0))
     (begin
       (clear-vc!)
       (clear-terms!)
       (collect-garbage)))))
