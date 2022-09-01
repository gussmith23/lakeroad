#lang racket/base
;;; Test SOFA primitives.

(module test racket/base
  (require rosette
           rackunit
           "interpreter.rkt"
           "sofa.rkt"
           "lut.rkt"
           "verilator.rkt"
           (prefix-in lr: "language.rkt")
           rosette/solver/smt/boolector
           "testing.rkt")

  (current-solver (boolector))

  ;;; Lakeroad/bitvector expressions to simulate and compare against each other.
  (define to-simulate-list (list))
  (define (add-to-simulate v)
    (set! to-simulate-list (cons v to-simulate-list)))

  (verify-lakeroad-expression "sofa frac_lut4"
                              (define-symbolic in (bitvector 4))
                              (define-symbolic sram (bitvector 16))
                              (lr:list-ref (sofa-frac-lut4 in (bv 0 1) (bv 0 1) sram (bv 0 16)) 2)
                              (lut sram (apply concat (bitvector->bits in)))
                              add-to-simulate)

  ;;; Simulate with Verilator.
  (when (not (getenv "LAKEROAD_DIR"))
    (raise "LAKEROAD_DIR not set"))
  (when (not (getenv "VERILATOR_INCLUDE_DIR"))
    (raise "VERILATOR_INCLUDE_DIR not set"))
  (define skywater-or2-1-dir
    (build-path (getenv "LAKEROAD_DIR") "skywater-pdk-libs-sky130_fd_sc_hd/cells/or2/"))
  (define skywater-inv-dir
    (build-path (getenv "LAKEROAD_DIR") "skywater-pdk-libs-sky130_fd_sc_hd/cells/inv/"))
  (define skywater-buf-dir
    (build-path (getenv "LAKEROAD_DIR") "skywater-pdk-libs-sky130_fd_sc_hd/cells/buf/"))
  (define skywater-mux2-dir
    (build-path (getenv "LAKEROAD_DIR") "skywater-pdk-libs-sky130_fd_sc_hd/cells/mux2/"))
  (define skywater-udp-mux-2to1-dir
    (build-path (getenv "LAKEROAD_DIR") "skywater-pdk-libs-sky130_fd_sc_hd" "models" "udp_mux_2to1"))
  (test-true
   "simulate all synthesized designs with Verilator"
   (simulate-with-verilator
    #:include-dirs (list (build-path (getenv "LAKEROAD_DIR") "modules_for_importing" "SOFA")
                         skywater-or2-1-dir
                         skywater-inv-dir
                         skywater-buf-dir
                         skywater-mux2-dir
                         skywater-udp-mux-2to1-dir)
    #:extra-verilator-args
    "-DNO_PRIMITIVES -Wno-LITENDIAN -Wno-EOFNEWLINE -Wno-UNUSED -Wno-PINMISSING -Wno-TIMESCALEMOD"
    to-simulate-list
    (getenv "VERILATOR_INCLUDE_DIR"))))
