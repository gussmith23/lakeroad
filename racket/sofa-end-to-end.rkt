#lang racket

(require "compile-to-json.rkt"
         "verilator.rkt"
         "lut.rkt"
         "sofa.rkt"
         "synthesize.rkt"
         "circt-comb-operators.rkt"
         "utils.rkt"
         rosette)

(define sofa-lut4
  (build-path (getenv "LAKEROAD_DIR")
              "SOFA"
              "FPGA1212_QLSOFA_HD_PNR"
              "FPGA1212_QLSOFA_HD_Verilog"
              "SRC"
              "sub_module"
              "luts.v"))
(define sofa-muxes
  (build-path (getenv "LAKEROAD_DIR")
              "SOFA"
              "FPGA1212_QLSOFA_HD_PNR"
              "FPGA1212_QLSOFA_HD_Verilog"
              "SRC"
              "sub_module"
              "muxes.v"))
(define sofa-const
  (build-path (getenv "LAKEROAD_DIR")
              "SOFA"
              "FPGA1212_QLSOFA_HD_PNR"
              "FPGA1212_QLSOFA_HD_Verilog"
              "SRC"
              "sub_module"
              "inv_buf_passgate.v"))
(define skywater-or2-1-dir
  (build-path (getenv "LAKEROAD_DIR") "skywater-pdk-libs-sky130_fd_sc_hd/cells/or2/"))
(define skywater-inv-dir
  (build-path (getenv "LAKEROAD_DIR") "skywater-pdk-libs-sky130_fd_sc_hd/cells/inv/"))
(define skywater-inv-1-path
  (build-path (getenv "LAKEROAD_DIR")
              "skywater-pdk-libs-sky130_fd_sc_hd/cells/inv/sky130_fd_sc_hd__inv_1.v"))
(define skywater-buf-dir
  (build-path (getenv "LAKEROAD_DIR") "skywater-pdk-libs-sky130_fd_sc_hd/cells/buf/"))
(define skywater-buf-2-path
  (build-path (getenv "LAKEROAD_DIR")
              "skywater-pdk-libs-sky130_fd_sc_hd/cells/buf/sky130_fd_sc_hd__buf_2.v"))
(define skywater-mux2-dir
  (build-path (getenv "LAKEROAD_DIR") "skywater-pdk-libs-sky130_fd_sc_hd/cells/mux2/"))
(define skywater-mux2-1-path
  (build-path (getenv "LAKEROAD_DIR")
              "skywater-pdk-libs-sky130_fd_sc_hd/cells/mux2/sky130_fd_sc_hd__mux2_1.v"))

(define (end-to-end-test bv-expr)
  (displayln bv-expr)
  (define with-vc-result (with-vc (with-terms (synthesize-sofa-impl bv-expr))))
  (when (failed? with-vc-result)
    (raise (result-value with-vc-result)))
  (define lakeroad-expr (result-value with-vc-result))

  (simulate-expr
   lakeroad-expr
   bv-expr
   #:includes
   (list sofa-lut4 sofa-muxes sofa-const skywater-inv-1-path skywater-buf-2-path skywater-mux2-1-path)
   #:include-dirs (list skywater-or2-1-dir skywater-inv-dir skywater-buf-dir skywater-mux2-dir)
   #:extra-verilator-args "-Wno-LITENDIAN -Wno-EOFNEWLINE"))

(module+ test
  (require rackunit)
  (require rosette/solver/smt/boolector)
  (current-solver (boolector))

  ;;; How I reverse engineered SOFA LUT4:
  ;;; (for* ([i (range 16)] [j (range 16)])
  ;;;   (when (simulate-expr `(sofa-lut4 ,(bv (expt 2 i) 16) ,(bv j 4))
  ;;;                      (bv 1 1)
  ;;;                      #:includes (list sofa-lut4
  ;;;                                       sofa-muxes
  ;;;                                       sofa-const
  ;;;                                       skywater-inv-1-path
  ;;;                                       skywater-buf-2-path
  ;;;                                       skywater-mux2-1-path)
  ;;;                      #:include-dirs
  ;;;                      (list skywater-or2-1-dir skywater-inv-dir skywater-buf-dir skywater-mux2-dir)
  ;;;                      #:extra-verilator-args "-Wno-LITENDIAN -Wno-EOFNEWLINE")
  ;;;                      (displayln (format "i: ~a, j: ~a" i j))
  ;;;                      (set! i (add1 i))
  ;;;                      ))

  (for ([sz (list 1 2 3 4 5 6 7 8 16 32 64)])
    (after (gc-terms!)
           (define-symbolic l0 l1 (bitvector sz))
           (define-symbolic l2 (bitvector 1))
           (check-equal? (bvlen l0) sz)
           (check-equal? (bvlen l1) sz)
           (check-equal? (bvlen l2) 1)
           (displayln (format "testing (bitvector ~a)" sz))
           (test-true (format "~a bit mux" sz) (end-to-end-test (circt-comb-mux l2 l0 l1)))
           (test-true (format "~a bit &" sz) (end-to-end-test (bvand l0 l1)))
           (test-true (format "~a bit xor" sz) (end-to-end-test (bvxor l0 l1)))
           (test-true (format "~a bit |" sz) (end-to-end-test (bvor l0 l1)))
           (displayln "")
           ;;; Cleanup: Clear symbolic state.
           (begin
             (clear-vc!)
             (clear-terms!)
             (collect-garbage)))))
