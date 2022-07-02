#lang errortrace racket

(provide simulate-expr)

(require json
         "compile-to-json.rkt"
         rosette
         "utils.rkt"
         "interpreter.rkt")

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
(define (simulate-expr lakeroad-expr bv-expr #:includes [includes '()])
  ;;; TODO anonymize.
  (when (not (getenv "LAKEROAD_DIR"))
    (error "LAKEROAD_DIR must be set to base dir of Lakeroad"))

  (define json-file (make-temporary-file "rkttmp~a.json"))
  (define verilog-file (make-temporary-file "rkttmp~a.v"))
  (display-to-file (jsexpr->string (lakeroad->jsexpr lakeroad-expr)) json-file #:exists 'update)

  (match-let ([(list proc-stdout stdin proc-id stderr control-fn)
               (process (format "yosys -p 'read_json ~a; write_verilog ~a'" json-file verilog-file))])
             (control-fn 'wait)
             (when (not (equal? 0 (control-fn 'exit-code)))
               (error (format "Converting JSON to Verilog via Yosys failed:\nSTDOUT:\n~a\nSTDERR:\n~a"
                              (port->string proc-stdout)
                              (port->string stderr))))
             (close-input-port proc-stdout)
             (close-input-port stderr)
             (close-output-port stdin))

  ;;; Input and output bitwidths. We use this to determine which testbench to use.
  (define out-bitwidth (bvlen (interpret lakeroad-expr)))
  (define max-in-bitwidth
    (if (empty? (symbolics bv-expr)) 0 (apply max (map bvlen (symbolics bv-expr)))))
  (define max-bitwidth (max out-bitwidth max-in-bitwidth))
  (define testbench-filename
    (match max-bitwidth
      [_
       #:when (<= max-bitwidth 8)
       "testbench.cc.template"]
      [_
       #:when (<= max-bitwidth 16)
       "testbench_bw16.cc.template"]))

  (define verilator-make-dir (make-temporary-file "rkttmp~a" 'directory))
  (define verilated-type-name
    (format "V~a" (path-replace-extension (file-name-from-path verilog-file) "")))
  (define testbench-source
    (format
     (file->string (build-path (getenv "LAKEROAD_DIR") "racket" testbench-filename))
     (path-replace-extension (build-path verilator-make-dir verilated-type-name) ".h")
     verilated-type-name
     (if (>= (length (symbolics bv-expr)) 1) (format "top->~a = l0;" (first (symbolics bv-expr))) "")
     (if (>= (length (symbolics bv-expr)) 2) (format "top->~a = l1;" (second (symbolics bv-expr))) "")
     (if (>= (length (symbolics bv-expr)) 3) (format "top->~a = l2;" (third (symbolics bv-expr))) "")
     (if (>= (length (symbolics bv-expr)) 4) (format "top->~a = l3;" (fourth (symbolics bv-expr))) "")
     (if (>= (length (symbolics bv-expr)) 5) (format "top->~a = l4;" (fifth (symbolics bv-expr))) "")
     (if (>= (length (symbolics bv-expr)) 6) (format "top->~a = l5;" (sixth (symbolics bv-expr))) "")
     (if (>= (length (symbolics bv-expr)) 1)
         (min 255 (sub1 (expt 2 (bvlen (first (symbolics bv-expr))))))
         "0") ; The min of 255 is arbitrary. Just don't want it to run forever.
     (if (>= (length (symbolics bv-expr)) 2)
         (min 255 (sub1 (expt 2 (bvlen (second (symbolics bv-expr))))))
         "0") ; The min of 255 is arbitrary. Just don't want it to run forever.
     (if (>= (length (symbolics bv-expr)) 3)
         (min 255 (sub1 (expt 2 (bvlen (third (symbolics bv-expr))))))
         "0") ; The min of 255 is arbitrary. Just don't want it to run forever.
     (if (>= (length (symbolics bv-expr)) 4)
         (min 255 (sub1 (expt 2 (bvlen (fourth (symbolics bv-expr))))))
         "0") ; The min of 255 is arbitrary. Just don't want it to run forever.
     (if (>= (length (symbolics bv-expr)) 5)
         (min 255 (sub1 (expt 2 (bvlen (fifth (symbolics bv-expr))))))
         "0") ; The min of 255 is arbitrary. Just don't want it to run forever.
     (if (>= (length (symbolics bv-expr)) 6)
         (min 255 (sub1 (expt 2 (bvlen (sixth (symbolics bv-expr))))))
         "0") ; The min of 255 is arbitrary. Just don't want it to run forever.
     verilated-type-name
     verilated-type-name
     (bvexpr->cexpr bv-expr)
     (bvexpr->cexpr bv-expr)))

  (define testbench-file (make-temporary-file "rkttmp~a.cc"))
  (display-to-file testbench-source testbench-file #:exists 'update)

  (define verilator-unisims-dir (build-path (getenv "LAKEROAD_DIR") "verilator_xilinx"))
  (define includes-string
    (string-join (for/list ([include includes])
                   (format "-I ~a" include))))

  ; TODO(@gussmith23) hardcoded dir
  (define verilator-command
    (format
     "verilator -Wall -Wno-MULTITOP -Wno-TIMESCALEMOD -Wno-UNUSED -Wno-DECLFILENAME -Wno-PINMISSING -Wno-UNOPTFLAT --Mdir ~a --cc ~a ~a --build --exe ~a"
     verilator-make-dir
     verilog-file
     includes-string
     testbench-file))

  (match-let ([(list proc-stdout stdin proc-id stderr control-fn) (process verilator-command)])
             ;;; Wait until Verilator completes.
             (control-fn 'wait)
             ;;; Error out if it errors.
             (when (not (equal? 0 (control-fn 'exit-code)))
               (error (format "Verilator command failed:\n~a\nSTDOUT:\n~a\nSTDERR:\n~a"
                              verilator-command
                              (port->string proc-stdout)
                              (port->string stderr))))
             (close-input-port proc-stdout)
             (close-input-port stderr)
             (close-output-port stdin))

  (system* (build-path verilator-make-dir verilated-type-name)))
