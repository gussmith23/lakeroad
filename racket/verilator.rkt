#lang racket

(provide simulate-expr)

(require json
         "compile-to-json.rkt"
         rosette
         "utils.rkt")

;;; Test a Lakeroad expression using a simple testbench.
;;;
;;; The testbench simply does an exhaustive check over all inputs.
;;;
;;; lakeroad-expr: The Lakeroad expr to test.
;;;
;;; bv-expr: The expression (in Rosette's bitvector language) which the Lakeroad expression should be
;;;   tested against.
;;;
;;; Returns: The return value returned by running the compiled testbench executable.
(define (simulate-expr lakeroad-expr bv-expr)
  ;;; TODO anonymize.
  (when (not (getenv "LAKEROAD_DIR"))
    (error "LAKEROAD_DIR must be set to base dir of Lakeroad"))

  (define json-file (make-temporary-file "rkttmp~a.json"))
  (define verilog-file (make-temporary-file "rkttmp~a.v"))
  (display-to-file (jsexpr->string (lakeroad->jsexpr lakeroad-expr)) json-file #:exists 'update)
  (when (not (system (format "yosys -p 'read_json ~a; write_verilog ~a'" json-file verilog-file)))
    (error "Converting JSON to Verilog via Yosys failed."))

  (define verilator-make-dir (make-temporary-file "rkttmp~a" 'directory))
  (define verilated-type-name
    (format "V~a" (path-replace-extension (file-name-from-path verilog-file) "")))
  (define testbench-source
    (format
     (file->string (build-path (getenv "LAKEROAD_DIR") "racket" "testbench.cc.template"))
     (path-replace-extension (build-path verilator-make-dir verilated-type-name) ".h")
     verilated-type-name
     (if (>= (length (symbolics bv-expr)) 1) (format "top->~a = l0;" (first (symbolics bv-expr))) "")
     (if (>= (length (symbolics bv-expr)) 2) (format "top->~a = l1;" (second (symbolics bv-expr))) "")
     (if (>= (length (symbolics bv-expr)) 3) (format "top->~a = l2;" (third (symbolics bv-expr))) "")
     (if (>= (length (symbolics bv-expr)) 4) (format "top->~a = l3;" (fourth (symbolics bv-expr))) "")
     (if (>= (length (symbolics bv-expr)) 5) (format "top->~a = l4;" (fifth (symbolics bv-expr))) "")
     (if (>= (length (symbolics bv-expr)) 6) (format "top->~a = l5;" (sixth (symbolics bv-expr))) "")
     (if (>= (length (symbolics bv-expr)) 1) "255" "0")
     (if (>= (length (symbolics bv-expr)) 2) "255" "0")
     (if (>= (length (symbolics bv-expr)) 3) "255" "0")
     (if (>= (length (symbolics bv-expr)) 4) "255" "0")
     (if (>= (length (symbolics bv-expr)) 5) "255" "0")
     (if (>= (length (symbolics bv-expr)) 6) "255" "0")
     verilated-type-name
     verilated-type-name
     (bvexpr->cexpr bv-expr)
     (bvexpr->cexpr bv-expr)))

  (define testbench-file (make-temporary-file "rkttmp~a.cc"))
  (display-to-file testbench-source testbench-file #:exists 'update)

  (define verilator-unisims-dir (build-path (getenv "LAKEROAD_DIR") "verilator_xilinx"))

  ; TODO(@gussmith23) hardcoded dir
  (define verilator-command
    (format
     "verilator -Wall -Wno-TIMESCALEMOD -Wno-UNUSED -Wno-DECLFILENAME -Wno-PINMISSING -Wno-UNOPTFLAT --Mdir ~a --cc ~a -I ~a/CARRY8.v -I ~a/LUT6_2.v --build --exe ~a"
     verilator-make-dir
     verilog-file
     verilator-unisims-dir
     verilator-unisims-dir
     testbench-file))
  (when (not (system verilator-command))
    (error (format "Verilator command failed:\n~a" verilator-command)))

  (system* (build-path verilator-make-dir verilated-type-name)))
