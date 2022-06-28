#lang errortrace racket

(require rosette
         rosette/solver/smt/boolector
         rosette/lib/synthax
         json
         racket/pretty
         "interpreter.rkt"
         "lattice-ecp5.rkt"
         "programs-to-synthesize.rkt"
         "circt-comb-operators.rkt"
         "comp-json.rkt"
         "utils.rkt")

(current-solver (boolector))

(define luts (make-n-symbolics 8 (bitvector 16)))
(define logical-inputs (make-n-symbolics 4 (bitvector 8)))
(define lut-inputs (apply lattice-ecp5-logical-to-physical-inputs logical-inputs))
(define out (interpret `(lattice-ecp5-pfu ,@luts ,lut-inputs)))



(define (helper f arity)
  (define soln
    (synthesize #:forall logical-inputs
                #:guarantee (begin
                              (assert (bveq (apply f (take logical-inputs arity)) out)))))
  soln)

(module+ test
  (require rackunit)

  ; Test synthesis of various functions on UltraScale+.
  ; If any test starts failing, it's presumably because our UltraScale+ model changed. The question
  ; is, was the change correct?
  ; If a check-true test fails, then the model became less flexible.
  ; If a check-false test fails, then the model became more flexible.
  ; It's up to you to determine whether the change was correct!

  (displayln "Testing Synthesis of Identity Function")
  (check-true (sat? (helper identity 1)))

  (displayln "Testing Synthesis of CIRCT Comb Dialect Functions")
  ; CIRCT Comb dialect.
  (check-false (sat? (helper circt-comb-add 2)))
  (check-true (sat? (helper circt-comb-and 2)))
  (check-false (sat? (helper circt-comb-divs 2)))
  (check-false (sat? (helper circt-comb-divu 2)))
  (check-false (sat? (helper (lambda (a b) (zero-extend (circt-comb-icmp a b) (bitvector 8))) 2)))
  (check-false (sat? (helper circt-comb-mods 2)))
  (check-false (sat? (helper circt-comb-mul 2)))
  (check-false (sat? (helper circt-comb-mux 3)))
  (check-true (sat? (helper circt-comb-or 2)))
  (check-false (sat? (helper (lambda (a) (zero-extend (circt-comb-parity a) (bitvector 8))) 1)))
  (check-false (sat? (helper circt-comb-shl 2)))
  (check-false (sat? (helper circt-comb-shrs 2)))
  (check-false (sat? (helper circt-comb-shru 2)))
  (check-false (sat? (helper circt-comb-sub 2)))
  (check-true (sat? (helper circt-comb-xor 2)))

  (displayln "Testing Synthesis of Bithack Examples")
  ; ; Bithack examples.
  (check-false (sat? (helper floor-avg 2)))
  (check-true (sat? (helper bithack3 2)))
  (check-false (sat? (helper bithack2 2)))
  (check-true (sat? (helper bithack1 2)))
  (check-false (sat? (helper ceil-avg 2)))
  (check-false (sat? (helper bvadd 2)))
  (check-false (sat? (helper cycle 4))))

(define (make-bits-list base len)
  (sequence->list (in-inclusive-range base (- (+ base len) 1))))

; Test function `f` of arity 2 which we will output to JSON module
; `module-name`.
;
; This assumes routing for 8-bit bitwise operators
;
; Routing is as follows:
(define (end-to-end-test-arity-2-bitwise-ops f module-name)

  (define soln (helper f 2))
  (when (not (sat? soln))
    (error (format "Couldn't synthesize a program for module ~a" module-name)))

  (define a-model (model soln))

  (define json-doc (model->json-doc-arity-2-bitwise a-model module-name))

  (define json-file (make-temporary-file (string-append module-name "-~a.json")))

  (define fdout (open-output-file json-file #:exists 'replace))
  (write-json json-doc fdout)
  (close-output-port fdout)
  (displayln (format "Wrote to ~a" json-file))

  (run-nextpnr json-file)

  ; Next, let's run Verilator. Start by translating json-file to a verilog file

  (define verilog-file (string-append (string-trim (path->string json-file) ".json") ".sv"))
  (json->verilog json-file verilog-file)
  #t)

(module+ test
  (require rackunit)
  (displayln "Running end-to-end tests")
  (check-true (end-to-end-test-arity-2-bitwise-ops circt-comb-and "bitwise-and"))
  (check-true (end-to-end-test-arity-2-bitwise-ops circt-comb-or "bitwise-or"))
  (check-true (end-to-end-test-arity-2-bitwise-ops circt-comb-xor "bitwise-xor"))
  (check-true (end-to-end-test-arity-2-bitwise-ops bithack1 "bithack1"))
  (check-true (end-to-end-test-arity-2-bitwise-ops bithack3 "bithack3")))

(define (run-nextpnr json-file)
  (define pnr-log-file (format "~a.log" json-file))
  (when (not (system (format "nextpnr-ecp5 --json ~a > ~a 2>&1" json-file pnr-log-file)))
    (error "nextpnr failed")))

; Given a model produced by Rosette (e.g., from `(model soln)`),
; use this to create a JSON document. Used b
(define (model->json-doc-arity-2-bitwise a-model module-name)
  ; Helper function to make LUTs
  (define (make-lattice-lut4 init-mem A B C D Z #:attrs [attrs (hasheq)])
    (make-cell "LUT4"
               (make-cell-port-directions (list 'A 'B 'C 'D) (list 'Z))
               (make-cell-connections 'A A 'B B 'C C 'D D 'Z Z)
               #:params (hasheq 'INIT init-mem)))

  ; We will modify this to make a json document with our synthesized design
  (let* ([doc (make-lakeroad-json-doc)]
         ; a corresponds to logical-input-0 (i think?)
         ; a-bits corresponds to the port bits that we are outputting to JSON
         ; Yosys 2-indexes these for some reason but I'm not sure why
         ; Sticking with this for now, though we can experiment w/ running PnR
         ; on some different formats
         [a-bits (make-bits-list 2 8)]
         [a (make-port-details "input" a-bits)]
         ; b corresponds to logical-input-1 (i think?)
         [b-bits (make-bits-list 10 8)]
         [b (make-port-details "input" b-bits)]
         ; out
         [out-bits (make-bits-list 18 8)]
         [out (make-port-details "output" out-bits)]

         [ports (make-ports 'a a 'b b 'out out)]
         ; lut-helper: create the nth LUT4. This requires six values:
         ;
         ; INPUTS: LUT.A, LUT.B, LUT.C, and LUT.D must be wired to literal bit
         ;     values or bit numbers
         ;
         ; OUTPUT: LUT.Z must be wired to an output location
         ;
         ; INIT: the INIT value of a LUT determines the function it computes
         [lut-helper (lambda (n)
                       (let* ([D (make-literal-value 0 1)]
                              [C (make-literal-value 0 1)]
                              [B (list-ref b-bits n)]
                              [A (list-ref a-bits n)]
                              [Z (list-ref out-bits n)]
                              [INIT (hash-ref a-model (list-ref luts n))]
                              [INIT (bitvector->natural INIT)]
                              [INIT (make-literal-value INIT 16)])
                         (make-lattice-lut4 INIT A B C D Z)))]

         ; Each lut's inputs A and B are used in our current configuration,
         ; while C and D are hardwired to `0`
         ;
         ; input 'a is attached to LUT.D
         ; input 'b is attached to LUT.C
         [LUT0 (lut-helper 0)]
         [LUT1 (lut-helper 1)]
         [LUT2 (lut-helper 2)]
         [LUT3 (lut-helper 3)]
         [LUT4 (lut-helper 4)]
         [LUT5 (lut-helper 5)]
         [LUT6 (lut-helper 6)]
         [LUT7 (lut-helper 7)]

         ; [====== Cells  ======]
         [cells (make-cells 'LUT4_A
                            LUT0
                            'LUT4_B
                            LUT1
                            'LUT4_C
                            LUT2
                            'LUT4_D
                            LUT3
                            'LUT4_E
                            LUT4
                            'LUT4_F
                            LUT5
                            'LUT4_G
                            LUT6
                            'LUT4_H
                            LUT7)]

         ; [====== Netnames ======]
         ; Now let's specify how things are linked together. This is pretty
         ; straightforward since this design is so simple
         [nn-a (make-net-details a-bits)]
         [nn-b (make-net-details b-bits)]
         [nn-out (make-net-details out-bits)]
         [netnames (make-netnames 'a nn-a 'b nn-b 'out nn-out)]

         ; [====== Module ======]
         ; Finally, let's combine this into a module and add it to our Lakeroad
         ; JSON file.
         [modul (make-module ports cells netnames)])
    (add-module-to-doc doc module-name modul)
    doc))

(define (end-to-end-with-lakeroad-syntax f mod-name #:arity [arity 2])
  (define expr
    `(physical-to-logical-mapping (bitwise)
                                  (lattice-ecp5-pfu ,(?? (bitvector 16))
                                                    ,(?? (bitvector 16))
                                                    ,(?? (bitvector 16))
                                                    ,(?? (bitvector 16))
                                                    ,(?? (bitvector 16))
                                                    ,(?? (bitvector 16))
                                                    ,(?? (bitvector 16))
                                                    ,(?? (bitvector 16)))))
  (define out (interpret expr))

  (define soln
    (synthesize #:forall logical-inputs
                #:guarantee (begin
                              (for ([logical-input (list-tail logical-inputs arity)])
                                (assume (bvzero? logical-input)))
                              (assert (bveq (apply f (take logical-inputs arity)) out)))))

  (define evaluated (evaluate expr soln))

  (match-define `(physical-to-logical-mapping
                  (bitwise)
                  (lattice-ecp5-pfu ,lut-a ,lut-b ,lut-c ,lut-d ,lut-e ,lut-f ,lut-g ,lut-h))
    evaluated)
  (displayln evaluated)
  '())

; (module+ test
;   (require rackunit)
;   (check-true (end-to-end-with-lakeroad-syntax circt-comb-and "bitwise-and"))
;   (check-true (end-to-end-with-lakeroad-syntax circt-comb-or "bitwise-or"))
;   (check-true (end-to-end-with-lakeroad-syntax circt-comb-xor "bitwise-xor"))
;   (check-true (end-to-end-with-lakeroad-syntax bithack1 "bithack1"))
;   (check-true (end-to-end-with-lakeroad-syntax bithack3 "bithack3")))
