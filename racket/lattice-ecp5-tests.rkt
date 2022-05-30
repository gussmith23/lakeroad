#lang racket

(require "lattice-ecp5.rkt"
         rosette
         "programs-to-synthesize.rkt"
         "circt-comb-operators.rkt"
         rosette/solver/smt/boolector
         json
         "comp-json.rkt")

(current-solver (boolector))

(current-solver (boolector))

(define-symbolic cin (bitvector 1))
(define-symbolic lut-memory-a (bitvector 16))
(define-symbolic lut-memory-b (bitvector 16))
(define-symbolic lut-memory-c (bitvector 16))
(define-symbolic lut-memory-d (bitvector 16))
(define-symbolic lut-memory-e (bitvector 16))
(define-symbolic lut-memory-f (bitvector 16))
(define-symbolic lut-memory-g (bitvector 16))
(define-symbolic lut-memory-h (bitvector 16))

(define-symbolic logical-input-0 (bitvector 8))
(define-symbolic logical-input-1 (bitvector 8))
(define-symbolic logical-input-2 (bitvector 8))
(define-symbolic logical-input-3 (bitvector 8))

(define out
  (apply interpret-lattice-ecp5-pfu
         (lattice-ecp5-pfu (lattice-ecp5-lut4 lut-memory-a)
                           (lattice-ecp5-lut4 lut-memory-b)
                           (lattice-ecp5-lut4 lut-memory-c)
                           (lattice-ecp5-lut4 lut-memory-d)
                           (lattice-ecp5-lut4 lut-memory-e)
                           (lattice-ecp5-lut4 lut-memory-f)
                           (lattice-ecp5-lut4 lut-memory-g)
                           (lattice-ecp5-lut4 lut-memory-h))
         ; cin
         (lattice-ecp5-logical-to-physical-inputs logical-input-0
                                                  logical-input-1
                                                  logical-input-2
                                                  logical-input-3)))

(define logical-inputs
  (list logical-input-0
        logical-input-1
        logical-input-2
        logical-input-3))

; The following is copied verbatim (modulo some formatting) from
; ultrascale-tests.rkt
(define (helper f arity)
  (if (equal? arity 6) (error "arity 6 not supported yet") '())
  (match-let
      ([soln
        ; TODO(@gussmith23) Time synthesis. For some reason, time-apply doesn't mix
        ; well with synthesize.  And time just prints to stdout, which is not ideal
        ; (but we could deal with it if necessary).
        (synthesize
         #:forall logical-inputs
         #:guarantee
         (begin

           ; TODO: Make a github issue
           ; Assume unused inputs are zero. We can set them to whatever we want,
           ; but it's important that we tell the solver that they're unused and
           ; unimportant, and setting them to a constant value is the way to this.
           ;
           ; When these aren't set, synthesis takes about 10-20x longer (20mins vs
           ; 1.5mins). In this case, we synthesize a LUT that is correct for inputs
           ; 0 and 1 regardless of the settings of the other inputs. I'm not sure
           ; if that's useful. I also wonder if there's a faster way to get the
           ; same result. E.g. either:

           ; 1. assume 2-5 are all 0 and then manually edit the resulting LUT and
           ;    duplicate the "correct" parts of the LUT memory into the rest of
           ;    the LUT memory, OR,

           ; 2. a more graceful solution, `assume` some predicates that basically
           ;    say that 2-5 "don't matter" and that the outputs for a given 0 and
           ;    1 should be the same for any 2-5.
           (for ([logical-input (list-tail logical-inputs arity)])
             (assume (bvzero? logical-input)))

           ; Assert that the output of the PFU implements the requested function f.
           (assert (bveq (apply f (take logical-inputs arity)) out))))])
    ; Print the output. Unwrap the model if there is one, so that all of the
    ; values print.
    ;(displayln f)
    ;(if (sat? soln) (pretty-print (model soln)) (displayln soln))
    ;(displayln "")
    soln))

(module+ test
  (require rackunit)

  ; Test synthesis of various functions on UltraScale+.
  ; If any test starts failing, it's presumably because our UltraScale+ model changed. The question
  ; is, was the change correct?
  ; If a check-true test fails, then the model became less flexible.
  ; If a check-false test fails, then the model became more flexible.
  ; It's up to you to determine whether the change was correct!

  ; Simple test: identify function.
  (check-true (sat? (helper (lambda (a) a) 1)))

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

  ; Bithack examples.
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


  (define json-file (make-temporary-file "gen~a.json"))

  (define fdout (open-output-file json-file #:exists 'replace))
  (write-json json-doc fdout)
  (close-output-port fdout)
  (displayln (format "Wrote to ~a" json-file))

  (run-nextpnr json-file)
  #t)

(module+ test 
  (require rackunit)
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
  (let* ([doc     (make-lakeroad-json-doc)]
         ; a corresponds to logical-input-0 (i think?)
         ; a-bits corresponds to the port bits that we are outputting to JSON
         ; Yosys 2-indexes these for some reason but I'm not sure why
         ; Sticking with this for now, though we can experiment w/ running PnR
         ; on some different formats
         [a-bits    (make-bits-list  2 8)]
         [a         (make-port-details "input"  a-bits)]
         ; b corresponds to logical-input-1 (i think?)
         [b-bits    (make-bits-list 10 8)]
         [b         (make-port-details "input"  b-bits)]
         ; out
         [out-bits  (make-bits-list 18 8)]
         [out       (make-port-details "output" out-bits)]

         [ports     (make-ports 'a a 'b b 'out out)]
         ; lut-helper: create the nth LUT4. This requires six values:
         ;
         ; INPUTS: LUT.A, LUT.B, LUT.C, and LUT.D must be wired to literal bit
         ;     values or bit numbers
         ;
         ; OUTPUT: LUT.Z must be wired to an output location
         ;
         ; INIT: the INIT value of a LUT determines the function it computes
         [lut-helper (lambda (n)
                       (let* ([D         (make-literal-value 0 1)]
                              [C         (make-literal-value 0 1)]
                              [B         (list-ref b-bits   n)]
                              [A         (list-ref a-bits   n)]
                              [Z         (list-ref out-bits n)]
                              [INIT      (hash-ref a-model lut-memory-a)]
                              [INIT      (bitvector->natural INIT)]
                              [INIT      (make-literal-value INIT 16)])
                         (make-lattice-lut4 INIT A B C D Z)))]

         ; Each lut's inputs A and B are used in our current configuration,
         ; while C and D are hardwired to `0`
         ;
         ; input 'a is attached to LUT.D
         ; input 'b is attached to LUT.C
         [LUT0      (lut-helper 0)]
         [LUT1      (lut-helper 1)]
         [LUT2      (lut-helper 2)]
         [LUT3      (lut-helper 3)]
         [LUT4      (lut-helper 4)]
         [LUT5      (lut-helper 5)]
         [LUT6      (lut-helper 6)]
         [LUT7      (lut-helper 7)]

         ; [====== Cells  ======]
         [cells (make-cells 'LUT4_A LUT0
                            'LUT4_B LUT1
                            'LUT4_C LUT2
                            'LUT4_D LUT3
                            'LUT4_E LUT4
                            'LUT4_F LUT5
                            'LUT4_G LUT6
                            'LUT4_H LUT7)]

         ; [====== Netnames ======]
         ; Now let's specify how things are linked together. This is pretty
         ; straightforward since this design is so simple
         [nn-a    (make-net-details a-bits)]
         [nn-b    (make-net-details b-bits)]
         [nn-out  (make-net-details out-bits)]
         [netnames (make-netnames 'a nn-a 'b nn-b 'out nn-out)]


         ; [====== Module ======]
         ; Finally, let's combine this into a module and add it to our Lakeroad
         ; JSON file.
         [modul (make-module ports cells netnames)])
    (add-module-to-doc doc module-name modul)
    doc))