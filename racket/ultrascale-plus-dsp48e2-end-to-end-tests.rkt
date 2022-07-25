#lang racket/base
;;; Specifically test that some functions work on DSPs.

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
    (after (gc-terms!)
           (define-symbolic l0 l1 l2 l3 (bitvector sz))
           (check-equal? (bvlen l0) sz)
           (check-equal? (bvlen l1) sz)
           (check-equal? (bvlen l2) sz)
           (check-equal? (bvlen l3) sz)
           (test-true (format "~a-bit mul" sz) (end-to-end-test (bvmul l0 l1)))
           (test-true (format "~a-bit ident" sz) (end-to-end-test l0))
           (begin
             (clear-vc!)
             (clear-terms!)
             (collect-garbage)))))
