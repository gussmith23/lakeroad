#lang errortrace racket

(require "compile-to-json.rkt"
         "verilator.rkt"
         json
         rosette
         rosette/lib/synthax
         "interpreter.rkt"
         "programs-to-synthesize.rkt"
         "circt-comb-operators.rkt"
         "utils.rkt"
         "synthesize.rkt")

(define includes-dir (build-path (getenv "LAKEROAD_DIR") "verilator_xilinx"))
(define includes
  (append (for/list ([mod (list "CARRY8.v" "LUT6_2.v" "LUT3.v" "LUT2.v" "LUT1.v")])
            (format "~a/~a" includes-dir mod))
          (list (build-path (getenv "LAKEROAD_DIR") "verilator-unisims" "DSP48E2.v"))))
(define (end-to-end-test bv-expr)

  (define lakeroad-expr
    (result-value (with-vc (with-terms (synthesize-xilinx-ultrascale-plus-impl bv-expr)))))

  (simulate-expr
   lakeroad-expr
   bv-expr
   #:includes includes
   #:extra-verilator-args
   "-Wno-LATCH -Wno-ASSIGNDLY --CFLAGS -DVL_TIME_STAMP64 --CFLAGS -DVL_NO_LEGACY -DXIL_XECLIB"))

(module+ test
  (require rackunit
           rosette/solver/smt/boolector)

  (current-solver (boolector))

  ;;; TODO for now these need to be named l0..l5. Make this more flexible.
  (for ([sz (list 1 2 3 4 5 6 7 8 16 32 64)])
    ;;; Setup: Make symbolic terms.
    (after (gc-terms!)
           (define-symbolic l0 l1 (bitvector sz))
           (define-symbolic l2 (bitvector 1))
           (check-equal? (bvlen l0) sz)
           (check-equal? (bvlen l1) sz)
           (check-equal? (bvlen l2) 1)
           (test-true (format "~a bit mux" sz) (end-to-end-test (circt-comb-mux l2 l0 l1)))
           (test-true (format "~a bit <" sz) (end-to-end-test (bool->bitvector (bvult l0 l1))))
           (test-true (format "~a bit <=" sz) (end-to-end-test (bool->bitvector (bvule l0 l1))))
           (test-true (format "~a bit >" sz) (end-to-end-test (bool->bitvector (bvugt l0 l1))))
           (test-true (format "~a bit >=" sz) (end-to-end-test (bool->bitvector (bvuge l0 l1))))
           (test-true (format "~a bit ==" sz) (end-to-end-test (bool->bitvector (bveq l0 l1))))
           (test-true (format "~a bit !=" sz) (end-to-end-test (bool->bitvector (not (bveq l0 l1)))))
           (test-true (format "~a bit &" sz) (end-to-end-test (bvand l0 l1)))
           (test-true (format "~a bit xor" sz) (end-to-end-test (bvxor l0 l1)))
           (test-true (format "~a bit |" sz) (end-to-end-test (bvor l0 l1)))
           (test-true (format "~a bit not" sz) (end-to-end-test (bvnot l0)))
           (test-true (format "~a bit +" sz) (end-to-end-test (bvadd l0 l1)))
           (test-true (format "~a bit -" sz) (end-to-end-test (bvsub l0 l1)))
           (test-true (format "~a bit bithack1" sz) (end-to-end-test (bithack1 l0 l1)))
           (test-true (format "~a bit bithack2" sz) (end-to-end-test (bithack2 l0 l1)))
           (test-true (format "~a bit bithack3" sz) (end-to-end-test (bithack3 l0 l1)))
           (test-true (format "~a bit identity" sz) (end-to-end-test l0))
           (test-true (format "~a bit *0" sz) (end-to-end-test (bvmul l0 (bv 0 sz))))
           (test-true (format "~a bit *1" sz) (end-to-end-test (bvmul l0 (bv 1 sz))))
           (test-true (format "~a bit *2" sz) (end-to-end-test (bvmul l0 (bv 2 sz))))
           (test-true (format "~a bit <<0" sz) (end-to-end-test (circt-comb-shl l0 (bv 0 sz))))
           (test-true (format "~a bit <<1" sz) (end-to-end-test (circt-comb-shl l0 (bv 1 sz))))
           ;;; Cleanup: Clear symbolic state.
           (begin
             (clear-vc!)
             (clear-terms!)
             (collect-garbage)))))
