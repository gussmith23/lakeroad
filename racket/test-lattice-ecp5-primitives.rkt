#lang racket/base
;;; Verify and simulate the implementation of Lattice ECP5 primitives in Lakeroad.

(module test racket/base
  (require rosette
           rackunit
           "lattice-ecp5.rkt"
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

  ;;; Semantics for CCU2C.
  ;;;
  ;;; TODO(@gussmith23): Include the INJECT signals.
  (define (ccu2c-semantics INIT0 INIT1 CIN A0 B0 C0 D0 A1 B1 C1 D1)
    (let* ([lut4-0-output (lut INIT0 (concat D0 C0 B0 A0))]
           [lut2-0-output (lut (extract 3 0 INIT0) (concat B0 A0))]
           [lut4-1-output (lut INIT1 (concat D1 C1 B1 A1))]
           [lut2-1-output (lut (extract 3 0 INIT1) (concat B1 A1))]
           [S0 (bvxor lut4-0-output CIN)]
           [cout0 (bvor (bvand (bvnot lut4-0-output) lut2-0-output) (bvand lut4-0-output CIN))]
           [S1 (bvxor lut4-1-output cout0)]
           [COUT (bvor (bvand (bvnot lut4-1-output) lut2-1-output) (bvand lut4-1-output cout0))])
      (list S0 S1 COUT)))

  (verify-lakeroad-expression
   "Lattice ECP5 CCU2C (with INJECT signals set to 0)"
   (begin
     (define-symbolic INIT0 (bitvector 16))
     (define-symbolic INIT1 (bitvector 16))
     (define-symbolic CIN (bitvector 1))
     (define-symbolic A0 (bitvector 1))
     (define-symbolic B0 (bitvector 1))
     (define-symbolic C0 (bitvector 1))
     (define-symbolic D0 (bitvector 1))
     (define-symbolic A1 (bitvector 1))
     (define-symbolic B1 (bitvector 1))
     (define-symbolic C1 (bitvector 1))
     (define-symbolic D1 (bitvector 1)))
   (lr:concat
    (lattice-ecp5-ccu2c
     (lr:bv INIT0)
     (lr:bv INIT1)
     (lr:bv (bv 0 1))
     (lr:bv (bv 0 1))
     (lr:bv CIN)
     (lr:list (list (lr:concat (lr:list (list (lr:bv D0) (lr:bv C0) (lr:bv B0) (lr:bv A0))))
                    (lr:concat (lr:list (list (lr:bv D1) (lr:bv C1) (lr:bv B1) (lr:bv A1))))))))
   (apply concat (ccu2c-semantics INIT0 INIT1 CIN A0 B0 C0 D0 A1 B1 C1 D1))
   ;;; We don't have `verify-lakeroad-expression` add this to the list of things to simulate, as
   ;;; compiliation to Verilog through Yosys requires parameters to be concrete. Thus, we simulate
   ;;; below with some concrete values.
   ;;;
   ;;; TODO(@gussmith23): This is a common issue -- should have tools to handle it.
   ;;;
   ;;; add-to-simulate
   )

  ;;; Add some simulation tasks for CCU2C using concrete LUT init memory values.
  (test-true
   "normal return"
   (normal?
    (with-vc
     (with-terms
      (begin
        (define-symbolic CIN (bitvector 1))
        (define-symbolic A0 (bitvector 1))
        (define-symbolic B0 (bitvector 1))
        (define-symbolic C0 (bitvector 1))
        (define-symbolic D0 (bitvector 1))
        (define-symbolic A1 (bitvector 1))
        (define-symbolic B1 (bitvector 1))
        (define-symbolic C1 (bitvector 1))
        (define-symbolic D1 (bitvector 1))
        (define lut-init-0 (bv #xdead 16))
        (define lut-init-1 (bv #xbeef 16))
        (define lut-init-2 (bv #x2324 16))
        (define lut-init-3 (bv #x1cf6 16))
        (define lut-init-4 (bv #x201c 16))

        (define (add-test init0 init1)
          (add-to-simulate
           (to-simulate
            (lr:concat
             (lattice-ecp5-ccu2c
              (lr:bv init0)
              (lr:bv init1)
              (lr:bv (bv 0 1))
              (lr:bv (bv 0 1))
              (lr:bv CIN)
              (list (lr:concat (lr:list (list (lr:bv D0) (lr:bv C0) (lr:bv B0) (lr:bv A0))))
                    (lr:concat (lr:list (list (lr:bv D1) (lr:bv C1) (lr:bv B1) (lr:bv A1)))))))
            (apply concat (ccu2c-semantics init0 init1 CIN A0 B0 C0 D0 A1 B1 C1 D1)))))

        (add-test lut-init-0 lut-init-1)
        (add-test lut-init-1 lut-init-2)
        (add-test lut-init-2 lut-init-0)
        (add-test lut-init-3 lut-init-4)
        (add-test lut-init-4 lut-init-3))))))

  (verify-lakeroad-expression
   "Lattice ECP5 LUT2"
   (begin
     (define-symbolic INIT (bitvector 4))
     (define-symbolic A (bitvector 1))
     (define-symbolic B (bitvector 1)))
   (lr:list-ref (lattice-ecp5-lut2 (lr:bv INIT) (lr:bv (concat B A))) (lr:integer 0))
   (lut INIT (concat B A))
   ;;; We don't have `verify-lakeroad-expression` add this to the list of things to simulate, as
   ;;; compiliation to Verilog through Yosys requires parameters to be concrete. Thus, we simulate
   ;;; below with some concrete values.
   ;;;
   ;;; TODO(@gussmith23): This is a common issue -- should have tools to handle it.
   ;;;
   ;;; add-to-simulate
   )

  ;;; Add some simulation tasks for LUT2 using concrete LUT init memory values.
  (test-true
   "normal return"
   (normal?
    (with-vc
     (with-terms
      (begin
        (define-symbolic A (bitvector 1))
        (define-symbolic B (bitvector 1))
        (define lut-init-0 (bv #xd 4))
        (define lut-init-1 (bv #xe 4))
        (define lut-init-2 (bv #x2 4))

        (add-to-simulate
         (to-simulate (lr:list-ref (lattice-ecp5-lut2 (lr:bv lut-init-0) (lr:bv (concat B A))) 0)
                      (lut lut-init-0 (concat B A))))
        (add-to-simulate
         (to-simulate (lr:list-ref (lattice-ecp5-lut2 (lr:bv lut-init-1) (lr:bv (concat B A))) 0)
                      (lut lut-init-1 (concat B A))))
        (add-to-simulate
         (to-simulate (lr:list-ref (lattice-ecp5-lut2 (lr:bv lut-init-2) (lr:bv (concat B A))) 0)
                      (lut lut-init-2 (concat B A)))))))))

  (verify-lakeroad-expression
   "Lattice ECP5 LUT4"
   (begin
     (define-symbolic INIT (bitvector 16))
     (define-symbolic A (bitvector 1))
     (define-symbolic B (bitvector 1))
     (define-symbolic C (bitvector 1))
     (define-symbolic D (bitvector 1)))
   (lr:list-ref (lattice-ecp5-lut4
                 (lr:bv INIT)
                 (lr:concat (lr:list (list (lr:bv D) (lr:bv C) (lr:bv B) (lr:bv A)))))
                (lr:integer 0))
   (lut INIT (concat D C B A))
   ;;; We don't have `verify-lakeroad-expression` add this to the list of things to simulate, as
   ;;; compiliation to Verilog through Yosys requires parameters to be concrete. Thus, we simulate
   ;;; below with some concrete values.
   ;;;
   ;;; TODO(@gussmith23): This is a common issue -- should have tools to handle it.
   ;;;
   ;;; add-to-simulate
   )

  ;;; Add some simulation tasks for LUT4 using concrete LUT init memory values.
  (test-true
   "normal return"
   (normal?
    (with-vc (with-terms
              (begin
                (define-symbolic A (bitvector 1))
                (define-symbolic B (bitvector 1))
                (define-symbolic C (bitvector 1))
                (define-symbolic D (bitvector 1))
                (define lut-init-0 (bv #xdead 16))
                (define lut-init-1 (bv #xbeef 16))
                (define lut-init-2 (bv #x2323 16))

                (add-to-simulate
                 (to-simulate
                  (lr:list-ref (lattice-ecp5-lut4
                                (lr:bv lut-init-0)
                                (lr:concat (lr:list (list (lr:bv D) (lr:bv C) (lr:bv B) (lr:bv A)))))
                               (lr:integer 0))
                  (lut lut-init-0 (concat D C B A))))
                (add-to-simulate
                 (to-simulate
                  (lr:list-ref (lattice-ecp5-lut4
                                (lr:bv lut-init-1)
                                (lr:concat (lr:list (list (lr:bv D) (lr:bv C) (lr:bv B) (lr:bv A)))))
                               (lr:integer 0))
                  (lut lut-init-1 (concat D C B A))))
                (add-to-simulate
                 (to-simulate
                  (lr:list-ref (lattice-ecp5-lut4
                                (lr:bv lut-init-2)
                                (lr:concat (lr:list (list (lr:bv D) (lr:bv C) (lr:bv B) (lr:bv A)))))
                               (lr:integer 0))
                  (lut lut-init-2 (concat D C B A)))))))))

  ;;; Simulate with Verilator.
  (when (not (getenv "VERILATOR_INCLUDE_DIR"))
    (raise "VERILATOR_INCLUDE_DIR not set"))
  (when (not (getenv "LAKEROAD_DIR"))
    (error "LAKEROAD_DIR environment variable must be set"))
  (define include-dir (build-path (getenv "LAKEROAD_DIR") "f4pga-arch-defs/ecp5/primitives/slice"))
  (test-true "simulate all synthesized designs with Verilator"
             (simulate-with-verilator #:include-dirs (list include-dir)
                                      #:extra-verilator-args "-Wno-UNUSED"
                                      to-simulate-list
                                      (getenv "VERILATOR_INCLUDE_DIR"))))
