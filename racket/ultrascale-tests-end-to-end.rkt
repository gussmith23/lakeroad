#lang errortrace racket

(require "compile-to-json.rkt"
         json
         rosette
         rosette/lib/synthax
         "interpreter.rkt"
         "programs-to-synthesize.rkt"
         "circt-comb-operators.rkt")

;;; Rosette bitvector expression to C expression.
(define (bvexpr->cexpr expr)
  (match expr
    [(expression (== bvand) a b) (format "(~a & ~a)" (bvexpr->cexpr a) (bvexpr->cexpr b))]
    [(expression (== bvxor) a b) (format "(~a ^ ~a)" (bvexpr->cexpr a) (bvexpr->cexpr b))]
    [(expression (== bvor) a b) (format "(~a | ~a)" (bvexpr->cexpr a) (bvexpr->cexpr b))]
    [(expression (== bvsub) a b) (format "(~a - ~a)" (bvexpr->cexpr a) (bvexpr->cexpr b))]
    [(expression (== bvadd) a b) (format "(~a + ~a)" (bvexpr->cexpr a) (bvexpr->cexpr b))]
    [(expression (== bvnot) a) (format "(~~~a)" (bvexpr->cexpr a))]
    [(expression (== bvneg) a) (format "(-~a)" (bvexpr->cexpr a))]
    [(? constant? a) (~a a)]))

(define (end-to-end-test instr)
  (when (> (length (symbolics instr)) 6)
    (error "Only 6 inputs supported"))

  ;;; TODO anonymize.
  (when (not (getenv "LAKEROAD_DIR"))
    (error "LAKEROAD_DIR must be set to base dir of Lakeroad"))

  ;;; Form the list of logical inputs, and pad up to make sure there are 6.
  (define logical-inputs
    (append (symbolics instr) (make-list (- 6 (length (symbolics instr))) (bv #xff 8))))

  (define expr
    `(first (physical-to-logical-mapping
             (bitwise)
             (ultrascale-plus-clb ,(?? (bitvector 1))
                                  ,(?? (bitvector 64))
                                  ,(?? (bitvector 64))
                                  ,(?? (bitvector 64))
                                  ,(?? (bitvector 64))
                                  ,(?? (bitvector 64))
                                  ,(?? (bitvector 64))
                                  ,(?? (bitvector 64))
                                  ,(?? (bitvector 64))
                                  ,(?? (bitvector 2))
                                  ,(?? (bitvector 2))
                                  ,(?? (bitvector 2))
                                  ,(?? (bitvector 2))
                                  ,(?? (bitvector 2))
                                  ,(?? (bitvector 2))
                                  ,(?? (bitvector 2))
                                  ,(?? (bitvector 2))
                                  (logical-to-physical-mapping (bitwise) ,logical-inputs)))))

  (define verilator-make-dir (make-temporary-file "rkttmp~a" 'directory))
  ;(displayln verilator-make-dir)

  (define soln
    ; TODO(@gussmith23) Time synthesis. For some reason, time-apply doesn't mix well with synthesize.
    ; And time just prints to stdout, which is not ideal (but we could deal with it if necessary).
    (synthesize #:forall logical-inputs
                #:guarantee (begin
                              (assert (bveq instr (interpret expr))))))

  (when (not (sat? soln))
    (error "expected sat soln"))

  (define json-file (make-temporary-file "rkttmp~a.json"))
  (define verilog-file (make-temporary-file "rkttmp~a.v"))
  (display-to-file (jsexpr->string (lakeroad->jsexpr (evaluate expr soln)))
                   json-file
                   #:exists 'update)
  (when (not (system (format "yosys -p 'read_json ~a; write_verilog ~a'" json-file verilog-file)))
    (error "Converting JSON to Verilog via Yosys failed."))

  (define verilated-type-name
    (format "V~a" (path-replace-extension (file-name-from-path verilog-file) "")))

  (define testbench-source
    (format
     (file->string (build-path (getenv "LAKEROAD_DIR") "racket" "testbench.cc.template"))
     (path-replace-extension (build-path verilator-make-dir verilated-type-name) ".h")
     verilated-type-name
     (if (>= (length (symbolics instr)) 1) (format "top->~a = l0;" (first (symbolics instr))) "")
     (if (>= (length (symbolics instr)) 2) (format "top->~a = l1;" (second (symbolics instr))) "")
     (if (>= (length (symbolics instr)) 3) (format "top->~a = l2;" (third (symbolics instr))) "")
     (if (>= (length (symbolics instr)) 4) (format "top->~a = l3;" (fourth (symbolics instr))) "")
     (if (>= (length (symbolics instr)) 5) (format "top->~a = l4;" (fifth (symbolics instr))) "")
     (if (>= (length (symbolics instr)) 6) (format "top->~a = l5;" (sixth (symbolics instr))) "")
     (if (>= (length (symbolics instr)) 1) "255" "0")
     (if (>= (length (symbolics instr)) 2) "255" "0")
     (if (>= (length (symbolics instr)) 3) "255" "0")
     (if (>= (length (symbolics instr)) 4) "255" "0")
     (if (>= (length (symbolics instr)) 5) "255" "0")
     (if (>= (length (symbolics instr)) 6) "255" "0")
     verilated-type-name
     verilated-type-name
     (bvexpr->cexpr instr)
     (bvexpr->cexpr instr)))

  (define testbench-file (make-temporary-file "rkttmp~a.cc"))
  (display-to-file testbench-source testbench-file #:exists 'update)

  (define verilator-unisims-dir (build-path (getenv "LAKEROAD_DIR") "verilator_xilinx"))

  ; TODO(@gussmith23) hardcoded dir
  (define verilator-command
    (format
     "verilator -Wall -Wno-TIMESCALEMOD -Wno-UNUSED -Wno-DECLFILENAME -Wno-PINMISSING --Mdir ~a --cc ~a -I ~a/CARRY8.v -I ~a/LUT6_2.v --build --exe ~a"
     verilator-make-dir
     verilog-file
     verilator-unisims-dir
     verilator-unisims-dir
     testbench-file))
  (when (not (system verilator-command))
    (error (format "Verilator command failed:\n~a" verilator-command)))

  (system* (build-path verilator-make-dir verilated-type-name)))

(module+ test
  (require rackunit)

  ;;; TODO for now these need to be named l0..l5. Make this more flexible.
  (define-symbolic l0 l1 (bitvector 8))

  (check-true (end-to-end-test (bvand l0 l1)))
  (check-true (end-to-end-test (bvxor l0 l1)))
  (check-true (end-to-end-test (bvor l0 l1)))
  (check-true (end-to-end-test (bvadd l0 l1)))
  (check-true (end-to-end-test (bvsub l0 l1)))
  (check-true (end-to-end-test (bithack1 l0 l1)))
  (check-true (end-to-end-test (bithack2 l0 l1)))
  (check-true (end-to-end-test (bithack3 l0 l1))))
