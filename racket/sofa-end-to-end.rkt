#lang rosette/safe

(module+ test
  (require rackunit
           rosette/solver/smt/boolector
           "verilator.rkt"
           "synthesize.rkt"
           "circt-comb-operators.rkt"
           "utils.rkt"
           rosette)
  (current-solver (boolector))

  (define to-simulate-list (list))

  (define (synthesize test-name bv-expr)
    (test-case
     test-name
     (begin
       (log-info "synthesizing: ~a" bv-expr)

       (define with-vc-result (with-vc (with-terms (synthesize-sofa-impl bv-expr))))
       (check-false (failed? with-vc-result))
       ;;; (when (failed? with-vc-result)
       ;;;   (raise (result-value with-vc-result)))

       (define lakeroad-expr (result-value with-vc-result))

       (check-not-equal? lakeroad-expr 'unsynthesizable)
       (check-not-equal? lakeroad-expr #f)

       (set! to-simulate-list (cons (to-simulate lakeroad-expr bv-expr) to-simulate-list)))))

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
           (log-info "testing (bitvector ~a)" sz)
           (synthesize (format "~a bit mux" sz) (circt-comb-mux l2 l0 l1))
           (synthesize (format "~a bit &" sz) (bvand l0 l1))
           (synthesize (format "~a bit xor" sz) (bvxor l0 l1))
           (synthesize (format "~a bit |" sz) (bvor l0 l1))
           ;;; Cleanup: Clear symbolic state.
           (begin
             (clear-vc!)
             (clear-terms!)
             (collect-garbage))))

  (define skywater-or2-1-dir
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/or2/"))
  (define skywater-inv-dir
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/inv/"))
  (define skywater-buf-dir
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/buf/"))
  (define skywater-mux2-dir
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd/cells/mux2/"))
  (define skywater-udp-mux-2to1-dir
    (build-path (get-lakeroad-directory) "skywater-pdk-libs-sky130_fd_sc_hd" "models" "udp_mux_2to1"))

  (when (not (getenv "VERILATOR_INCLUDE_DIR"))
    (raise "VERILATOR_INCLUDE_DIR not set"))
  (test-true "simulate all synthesized designs with Verilator"
             (simulate-with-verilator
              #:include-dirs (list (build-path (get-lakeroad-directory) "SOFA_modules")
                                   skywater-or2-1-dir
                                   skywater-inv-dir
                                   skywater-buf-dir
                                   skywater-mux2-dir
                                   skywater-udp-mux-2to1-dir)
              #:extra-verilator-args
              "-Wno-LITENDIAN -Wno-EOFNEWLINE -Wno-UNUSED -Wno-PINMISSING -Wno-TIMESCALEMOD"
              to-simulate-list
              (getenv "VERILATOR_INCLUDE_DIR"))))
