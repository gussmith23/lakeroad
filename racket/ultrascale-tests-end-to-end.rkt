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
  (simulate-expr
   (synthesize-xilinx-ultrascale-plus-impl bv-expr)
   bv-expr
   #:includes includes
   #:extra-verilator-args
   "-Wno-LATCH -Wno-ASSIGNDLY --CFLAGS -DVL_TIME_STAMP64 --CFLAGS -DVL_NO_LEGACY -DXIL_XECLIB"))

(module+ test
  (require rackunit
           rosette/solver/smt/boolector)

  (current-solver (boolector))

  ; mux tests
  (for ([sz (list 1 2 4 8 16 32)])
    (test-begin (define-symbolic l0 (bitvector 1))
                (define-symbolic l1 l2 (bitvector sz))
                (check-true (end-to-end-test (circt-comb-mux l0 l1 l2)))))

  (test-begin (define-symbolic l0 l1 (bitvector 32))
              (check-equal? 32 (bvlen l0))
              (check-equal? 32 (bvlen l1))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1)))))

  (test-begin (define-symbolic l0 l1 (bitvector 24))
              (check-equal? 24 (bvlen l0))
              (check-equal? 24 (bvlen l1))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1)))))

  (test-begin (define-symbolic l0 l1 (bitvector 16))
              (check-equal? 16 (bvlen l0))
              (check-equal? 16 (bvlen l1))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1)))))

  (test-begin (define-symbolic l0 l1 (bitvector 8))
              (check-equal? 8 (bvlen l0))
              (check-equal? 8 (bvlen l1))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1)))))

  (test-begin (define-symbolic l0 l1 (bitvector 1))
              (check-equal? 1 (bvlen l0))
              (check-equal? 1 (bvlen l1))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bvugt l0 l1)))))

  (test-begin (define-symbolic l0 l1 (bitvector 2))
              (check-equal? 2 (bvlen l0))
              (check-equal? 2 (bvlen l1))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bvugt l0 l1)))))

  (test-begin (define-symbolic l0 l1 (bitvector 3))
              (check-equal? 3 (bvlen l0))
              (check-equal? 3 (bvlen l1))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bvugt l0 l1)))))

  (test-begin (define-symbolic l0 l1 (bitvector 4))
              (check-equal? 4 (bvlen l0))
              (check-equal? 4 (bvlen l1))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bvugt l0 l1)))))

  (test-begin (define-symbolic l0 l1 (bitvector 5))
              (check-equal? 5 (bvlen l0))
              (check-equal? 5 (bvlen l1))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bvugt l0 l1)))))

  (test-begin (define-symbolic l0 l1 (bitvector 6))
              (check-equal? 6 (bvlen l0))
              (check-equal? 6 (bvlen l1))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bvugt l0 l1)))))

  (test-begin (define-symbolic l0 l1 (bitvector 7))
              (check-equal? 7 (bvlen l0))
              (check-equal? 7 (bvlen l1))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bvugt l0 l1)))))

  ;;; TODO for now these need to be named l0..l5. Make this more flexible.
  (test-begin (define-symbolic l0 l1 (bitvector 8))
              (check-equal? 8 (bvlen l0))
              (check-equal? 8 (bvlen l1))
              (check-true (end-to-end-test (bool->bitvector (bvult l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bvule l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bvugt l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bvuge l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (not (bveq l0 l1)))))
              (check-true (end-to-end-test (bvand l0 l1)))
              (check-true (end-to-end-test (bvxor l0 l1)))
              (check-true (end-to-end-test (bvor l0 l1)))
              (check-true (end-to-end-test (bvadd l0 l1)))
              (check-true (end-to-end-test (bvsub l0 l1)))
              (check-true (end-to-end-test (bithack1 l0 l1)))
              (check-true (end-to-end-test (bithack2 l0 l1)))
              (check-true (end-to-end-test (bithack3 l0 l1)))
              (check-true (end-to-end-test l0))
              (check-true (end-to-end-test (bvmul l0 (bv 0 8))))
              (check-true (end-to-end-test (bvmul l0 (bv 1 8))))
              (check-true (end-to-end-test (bvmul l0 (bv 2 8))))
              (check-true (end-to-end-test (circt-comb-shl l0 (bv 0 8))))
              (check-true (end-to-end-test (circt-comb-shl l0 (bv 1 8)))))

  ;;; TODO for now these need to be named l0..l5. Make this more flexible.
  (test-begin (define-symbolic l0 l1 (bitvector 16))
              (check-equal? 8 (bvlen l0))
              (check-equal? 8 (bvlen l1))
              (check-true (end-to-end-test (bool->bitvector (bvult l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bvule l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bvugt l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bvuge l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1))))
              (check-true (end-to-end-test (bool->bitvector (not (bveq l0 l1)))))
              (check-true (end-to-end-test (bvand l0 l1)))
              (check-true (end-to-end-test (bvxor l0 l1)))
              (check-true (end-to-end-test (bvor l0 l1)))
              (check-true (end-to-end-test (bvadd l0 l1)))
              (check-true (end-to-end-test (bvsub l0 l1)))
              (check-true (end-to-end-test (bithack1 l0 l1)))
              (check-true (end-to-end-test (bithack2 l0 l1)))
              (check-true (end-to-end-test (bithack3 l0 l1)))
              (check-true (end-to-end-test l0))
              (check-true (end-to-end-test (bvmul l0 (bv 0 16))))
              (check-true (end-to-end-test (bvmul l0 (bv 1 16))))
              (check-true (end-to-end-test (bvmul l0 (bv 2 16))))
              (check-true (end-to-end-test (circt-comb-shl l0 (bv 0 16))))
              (check-true (end-to-end-test (circt-comb-shl l0 (bv 1 16)))))

  (test-begin (define-symbolic l0 l1 (bitvector 32))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1))))))
