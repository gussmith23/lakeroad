#lang errortrace errortrace racket

(require "compile-to-json.rkt"
         "verilator.rkt"
         json
         rosette
         rosette/lib/synthax
         "interpreter.rkt"
         "programs-to-synthesize.rkt"
         "lattice-ecp5.rkt"
         "circt-comb-operators.rkt"
         "synthesize.rkt"
         "utils.rkt")

(define includes-dir (build-path (getenv "LAKEROAD_DIR") "f4pga-arch-defs/ecp5/primitives/slice"))
(define includes
  (for/list ([mod (list "LUT4.v" "PFUMX.v" "CCU2C.v" "LUT2.v")])
    (format "~a/~a" includes-dir mod)))

(define (end-to-end-test bv-expr)
  (displayln (format "Running end-to-end on ~a" bv-expr))
  (define result (simulate-expr (synthesize-lattice-ecp5-impl bv-expr) bv-expr #:includes includes))
  (clear-vc!)
  result)

(module+ test
  (require rackunit
           rosette/solver/smt/boolector)

  (current-solver (boolector))

  ; (test-begin (displayln "and so i am become death, destroyer of worlds")
  ;             (define-symbolic l0 (bitvector 1))
  ;             (define-symbolic l1 l2 (bitvector 32))
  ;             (check-true (end-to-end-test (circt-comb-mux l0 l1 l2)))))



  ; (test-begin (displayln "AAAAAAAAAAAAAAA")
  ;             (define-symbolic a b (bitvector 2))
  ;             (define-symbolic s (bitvector 1))
  ;             (define lakeroad-expr
  ;                (get-lattice-logical-inputs (circt-comb-mux s a b) #:num-inputs 4 #:expected-bw 2))
  ;             (define soln (synthesize #:forall (list s a b)
  ;                                      #:guarantee (begin 
  ;                                      
  ;                                      (match-define (list lin0 lin1 lin2 lin3) (interpret lakeroad-expr) )
  ;                                      (assert (bveq lin0 (concat s s)))
  ;                                      (assert (bveq lin1 b))
  ;                                      (assert (bveq lin2 a))
  ;                                                                       )))
  ;             (displayln (evaluate lakeroad-expr soln))))

  ;;; TODO for now these need to be named l0..l5. Make this more flexible.
  (test-begin (displayln "=== Running End To End Tests for Lattice ===")
              (displayln "  -- 1 bit -- ")
              (define-symbolic l0 l1 (bitvector 1))
              (define-symbolic l2 (bitvector 1))
              (check-true (end-to-end-test (bool->bitvector (bveq l0 l1))))
              (check-true (end-to-end-test (bvadd l0 l1)))
              (check-true (end-to-end-test (bvand l0 l1)))
              (check-true (end-to-end-test (bvxor l0 l1)))
              (check-true (end-to-end-test (bvor l0 l1)))
              (check-true (end-to-end-test (bvadd l0 l1)))
              (check-true (end-to-end-test (bvsub l0 l1)))
              (check-true (end-to-end-test (bithack1 l0 l1)))
              (check-true (end-to-end-test (bithack2 l0 l1)))
              (check-true (end-to-end-test (bithack3 l0 l1)))
              (check-true (end-to-end-test l0))
              (check-true (end-to-end-test (bvmul l0 (bv 0 1))))
              (check-true (end-to-end-test (bvmul l0 (bv 1 1))))
              (check-true (end-to-end-test (circt-comb-mux l2 l0 l1))))
  
  (test-begin (displayln "  -- 4 bit -- ")
              (define-symbolic l0 l1 (bitvector 4))
              (define-symbolic l2 (bitvector 1))
              (check-true (end-to-end-test (bvand l0 l1)))
              (check-true (end-to-end-test (bvxor l0 l1)))
              (check-true (end-to-end-test (bvor l0 l1)))
              (check-true (end-to-end-test (bvadd l0 l1)))
              (check-true (end-to-end-test (bvsub l0 l1)))
              (check-true (end-to-end-test (bithack1 l0 l1)))
              (check-true (end-to-end-test (bithack2 l0 l1)))
              (check-true (end-to-end-test (bithack3 l0 l1)))
              (check-true (end-to-end-test l0))
              (check-true (end-to-end-test (bvmul l0 (bv 0 4))))
              (check-true (end-to-end-test (bvmul l0 (bv 1 4))))
              (check-true (end-to-end-test (circt-comb-mux l2 l0 l1))))
  
  (test-begin (displayln "  -- 5 bit -- ")
              (define-symbolic l0 l1 (bitvector 5))
              (define-symbolic l2 (bitvector 1))
              (check-true (end-to-end-test (bvand l0 l1)))
              (check-true (end-to-end-test (bvxor l0 l1)))
              (check-true (end-to-end-test (bvor l0 l1)))
              (check-true (end-to-end-test (bvadd l0 l1)))
              (check-true (end-to-end-test (bvsub l0 l1)))
              (check-true (end-to-end-test (bithack1 l0 l1)))
              (check-true (end-to-end-test (bithack2 l0 l1)))
              (check-true (end-to-end-test (bithack3 l0 l1)))
              (check-true (end-to-end-test l0))
              (check-true (end-to-end-test (bvmul l0 (bv 0 5))))
              (check-true (end-to-end-test (bvmul l0 (bv 1 5))))
              (check-true (end-to-end-test (circt-comb-mux l2 l0 l1))))
  
  (test-begin (displayln "  -- 8 bit -- ")
              (define-symbolic l0 l1 (bitvector 8))
              (define-symbolic l2 (bitvector 1))
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
              ; (check-false (end-to-end-test (bvmul l0 (bv 2 8))))
              ; (check-false (end-to-end-test (circt-comb-shl l0 (bv 1 8))))
              (check-true (end-to-end-test (circt-comb-shl l0 (bv 0 8))))
              (check-true (end-to-end-test (circt-comb-mux l2 l0 l1))))
  
  (test-begin (displayln "  -- 12 bit -- ")
              (define-symbolic l0 l1 (bitvector 12))
              (define-symbolic l2 (bitvector 1))
              (check-true (end-to-end-test (bvand l0 l1)))
              (check-true (end-to-end-test (bvxor l0 l1)))
              (check-true (end-to-end-test (bvor l0 l1)))
              (check-true (end-to-end-test (bvadd l0 l1)))
              (check-true (end-to-end-test (bvsub l0 l1)))
              (check-true (end-to-end-test (bithack1 l0 l1)))
              (check-true (end-to-end-test (bithack2 l0 l1)))
              (check-true (end-to-end-test (bithack3 l0 l1)))
              (check-true (end-to-end-test l0))
              (check-true (end-to-end-test (bvmul l0 (bv 0 12))))
              (check-true (end-to-end-test (bvmul l0 (bv 1 12))))
              ; (check-false (end-to-end-test (bvmul l0 (bv 2 8))))
              ; (check-false (end-to-end-test (circt-comb-shl l0 (bv 1 8))))
              (check-true (end-to-end-test (circt-comb-shl l0 (bv 0 12))))
              (check-true (end-to-end-test (circt-comb-mux l2 l0 l1))))
  
  (test-begin (displayln "  -- 16 bit -- ")
              (define-symbolic l0 l1 (bitvector 16))
              (define-symbolic l2 (bitvector 1))
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
              ; (check-false (end-to-end-test (bvmul l0 (bv 2 8))))
              ; (check-false (end-to-end-test (circt-comb-shl l0 (bv 1 8))))
              (check-true (end-to-end-test (circt-comb-shl l0 (bv 0 16))))
              (check-true (end-to-end-test (circt-comb-mux l2 l0 l1)))))
  