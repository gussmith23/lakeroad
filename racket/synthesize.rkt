#lang racket
;;; Synthesis routines for the various architectures.
;;;
;;; TODO provide a top-level synthesis procedure?

(provide synthesize-any
         synthesize-all
         synthesize-with-sketch
         synthesize-with
         ;  synthesize-lattice-ecp5-dsp
         synthesize-wire
         rosette-synthesize)

(require "interpreter.rkt"
         rosette
         rosette/lib/synthax
         rosette/lib/angelic
         racket/sandbox
         rosette/solver/smt/bitwuzla
         "utils.rkt"
         "logical-to-physical.rkt"
         (prefix-in lr: "language.rkt")
         "sketches.rkt"
         "architecture-description.rkt")

;;; Attempt synthesis, return the first that works.
(define (synthesize-any architecture-description
                        bv-expr
                        #:additional-forall [additional-forall '()]
                        #:module-semantics [module-semantics '()])
  (let/ec return
          (for ([sketch-generator (all-sketch-generators)])
            (let ([result (synthesize-with-sketch sketch-generator
                                                  architecture-description
                                                  bv-expr
                                                  #:additional-forall additional-forall
                                                  #:module-semantics module-semantics)])
              (when result
                (return result))))
          #f))

;;; Attempt synthesis with all sketch generators.
;;; Returns a list of pairs of (sketch-generator-fn . result).
(define (synthesize-all architecture-description
                        bv-expr
                        #:additional-forall [additional-forall '()]
                        #:module-semantics [module-semantics '()])
  (for/list ([sketch-generator (all-sketch-generators)])
    (let ([result (synthesize-with-sketch sketch-generator
                                          architecture-description
                                          bv-expr
                                          #:additional-forall additional-forall
                                          #:module-semantics module-semantics)])
      (cons sketch-generator result))))

;;; Attempt synthesis with a single sketch generator.
(define (synthesize-with-sketch sketch-generator
                                architecture-description
                                bv-expr
                                #:additional-forall [additional-forall '()]
                                #:module-semantics [module-semantics '()])
  (log-info "Attempting synthesis on expression ~a with sketch generator ~a" bv-expr sketch-generator)
  (rosette-synthesize bv-expr
                      (generate-sketch sketch-generator architecture-description bv-expr)
                      (append (symbolics bv-expr) additional-forall)
                      #:module-semantics module-semantics))

(define (synthesize-with-timeout strat input timeout)
  (let ([t (current-thread)] [timeout-time (if (null? timeout) 5.0 timeout)])
    (if timeout
        (let ([synthesized (with-handlers ([exn:fail? (lambda (exn) #f)])
                             (with-deep-time-limit timeout-time (strat input)))])
          (clear-vc!)
          (clear-terms!)
          synthesized)
        (strat input))))

;;;;;;
;;;
;;; TOP-LEVEL SYNTHESIS ROUTINES
;;; ----------------------------
;;; Lakeroad's synthesis is divided into a few levels.
;;; At the very top are our top-level synthesis routines:
;;; - synthesize-with (a generic function which runs synthesis strategies)
;;; - architecture-specific synthesis routines (which call into synthesize-with)

;;; Attempts to synthesize a program for bv-expr using provided templates provided.
;;;
;;; finish-when: can be one of 'first-to-succeed or 'exhaustive; if the finish
;;;     condition is 'first-to-succeed, returns the first valid synthesis result.
;;;     Otherwise, returns a list of all synthesis results, with order
;;;     corresponding to the order of templates supplied.
;;; templates: a list of templates, each template having type
;;;     bv-expr -> (union bv-expr #f)
;;; bv-expr: a bv-expr to synthesize
;;; timeout: gives a per-template timeout in seconds (defaults to #f, no timeout)
(define (synthesize-with finish-when templates bv-expr [timeout #f])
  (define timeout-time (if (null? timeout) 5.0 timeout))
  (match finish-when
    ['first-to-succeed
     (match templates
       [(cons t ts)
        (or (synthesize-with-timeout t bv-expr timeout-time)
            (synthesize-with finish-when ts bv-expr timeout-time))]
       [_ #f])]
    ;;; TODO: impl timeouts or something idk
    ['exhaustive
     (map (lambda (s)
            (clear-vc!)
            (clear-terms!)
            (collect-garbage)
            (synthesize-with-timeout s bv-expr timeout-time))
          templates)]))

;;; (define (synthesize-sofa-impl bv-expr [finish-when 'first-to-succeed])
;;; (synthesize-with finish-when (list synthesize-wire (synthesize-using-lut 'sofa 1 4)) bv-expr))

(module+ test
  (define-logger lakeroad)
  (current-logger lakeroad-logger)
  (require rackunit)
  (define-syntax-rule (simple-test f before-call args ...)
    (test-true (format "~a simple test" f)
               (normal? (with-vc (with-terms (begin
                                               before-call
                                               (let ([result (f args ...)])
                                                 (check-not-equal? #f result)))))))))

;;;;;;
;;;
;;; GENERIC SYNTHESIS STRATEGIES
;;; ----------------------------
;;; Below the top level are synthesis strategies, which define how to wire up
;;; components and synthesis holes. These generic synthesis strategies call into
;;; lakeroad templates, which generically define building blocks (e.g. luts)
;;; modulo the specific architecture used.

;;; A function which, when given an architecture, a target number of lutmems,
;;; whether to use a carry, and how many arguments to pad the inputs to, if any,
;;; returns a synthesis strategy which uses the lut template.
;;; (define (synthesize-using-lut arch num-lutmems [pad #f] [carry? #f])
;;;   (lambda (bv-expr)
;;;     (when (> (length (symbolics bv-expr)) 6)
;;;       (error "Only 6 inputs supported"))

;;;     ;;; Maximum number of input and output bitwidths = the number of bits we need to support.
;;;     (define nbits (apply max (bvlen bv-expr) (map bvlen (symbolics bv-expr))))

;;;     (define inputs
;;;       (if pad
;;;           (append (symbolics bv-expr) (make-list (- pad (length (symbolics bv-expr))) (bv 0 1)))
;;;           (symbolics bv-expr)))

;;;     (define lutmems
;;;       (for/list ([i num-lutmems])
;;;         (define-symbolic* lutmem (bitvector (expt 2 (length inputs))))
;;;         lutmem))

;;;     (define lakeroad-expr
;;;       ((if carry? template:lut-with-carry template:lut) nbits arch inputs lutmems (bvlen bv-expr)))

;;;     (rosette-synthesize bv-expr lakeroad-expr (symbolics bv-expr))))

;;; A function which, when given an architecture, a target number of lutmems,
;;; and a number of arguments to pad the inputs to,
;;; returns a synthesis strategy which uses the comparison template.
;;; (define (synthesize-using-comparison arch num-lutmems [pad #f])
;;;   (lambda (bv-expr)
;;;     (when (> (length (symbolics bv-expr)) 4)
;;;       (error "Only 4 inputs supported"))

;;;     ;;; Maximum number of input and output bitwidths = the number of bits we need to support.
;;;     (define nbits (apply max (bvlen bv-expr) (map bvlen (symbolics bv-expr))))

;;;     (define inputs
;;;       (if pad
;;;           (append (symbolics bv-expr) (make-list (- pad (length (symbolics bv-expr))) (bv 0 1)))
;;;           (symbolics bv-expr)))

;;;     (define lutmems
;;;       (for/list ([i num-lutmems])
;;;         (define-symbolic* lutmem (bitvector (expt 2 (length inputs))))
;;;         lutmem))

;;;     (define lakeroad-expr (template:comparison nbits arch inputs lutmems))
;;;     (rosette-synthesize bv-expr lakeroad-expr (symbolics bv-expr))))

;;;;;;
;;;
;;; ARCH-DEPENDENT SYNTHESIS STRATEGIES
;;; -----------------------------------
;;; Finally, we have architecture-dependent synthesis strategies!

; (define (synthesize-lattice-ecp5-dsp bv-expr)
;   (let/ec
;    return
;    (begin

;      ;;; Only supporting 3 inputs, a, b, c.
;      (when (> (length (symbolics bv-expr)) 3)
;        (return #f))

;      ;;; Only supporting max bws of 18 on DSPs for now.
;      (when (> (apply max (bvlen bv-expr) (map bvlen (symbolics bv-expr))) 18)
;        (return #f))

;      (define in0 (if (>= (length (symbolics bv-expr)) 1) (list-ref (symbolics bv-expr) 0) (bv 0 1)))
;      (define in1 (if (>= (length (symbolics bv-expr)) 2) (list-ref (symbolics bv-expr) 1) (bv 0 1)))
;      (define in2 (if (>= (length (symbolics bv-expr)) 3) (list-ref (symbolics bv-expr) 2) (bv 0 1)))

;      ;;; Main input ports.
;      (define A
;        (lr:zero-extend (lr:bv (choose in0 in1 in2 (bv 0 1) (bv 1 1))) (lr:bitvector (bitvector 18))))
;      (define B
;        (lr:zero-extend (lr:bv (choose in0 in1 in2 (bv 0 1) (bv 1 1))) (lr:bitvector (bitvector 18))))
;      (define C
;        (lr:zero-extend (lr:bv (choose in0 in1 in2 (bv 0 1) (bv 1 1))) (lr:bitvector (bitvector 18))))

;      ;;; Input ports.
;      (define-symbolic SIGNEDA (bitvector 1))
;      (define-symbolic SIGNEDB (bitvector 1))
;      (define-symbolic SOURCEA (bitvector 1))
;      (define-symbolic SOURCEB (bitvector 1))
;      (define-symbolic CE (bitvector 4))
;      (define-symbolic CLK (bitvector 4))
;      (define-symbolic RST (bitvector 4))
;      (define-symbolic SRIA (bitvector 18))
;      (define-symbolic SRIB (bitvector 18))

;      ;;; Parameters.
;      (define-symbolic REG_INPUTA_CLK (bitvector 5))
;      (define-symbolic REG_INPUTA_CE (bitvector 5))
;      (define-symbolic REG_INPUTA_RST (bitvector 5))
;      (define-symbolic REG_INPUTB_CLK (bitvector 5))
;      (define-symbolic REG_INPUTB_CE (bitvector 5))
;      (define-symbolic REG_INPUTB_RST (bitvector 5))
;      (define-symbolic REG_INPUTC_CLK (bitvector 5))
;      (define-symbolic REG_INPUTC_CE (bitvector 5))
;      (define-symbolic REG_INPUTC_RST (bitvector 5))
;      (define-symbolic REG_PIPELINE_CLK (bitvector 5))
;      (define-symbolic REG_PIPELINE_CE (bitvector 5))
;      (define-symbolic REG_PIPELINE_RST (bitvector 5))
;      (define-symbolic REG_OUTPUT_CLK (bitvector 5))
;      (define-symbolic REG_OUTPUT_CE (bitvector 5))
;      (define-symbolic REG_OUTPUT_RST (bitvector 5))
;      (define-symbolic CLK0_DIV (bitvector 5))
;      (define-symbolic CLK1_DIV (bitvector 5))
;      (define-symbolic CLK2_DIV (bitvector 5))
;      (define-symbolic CLK3_DIV (bitvector 5))
;      (define-symbolic HIGHSPEED_CLK (bitvector 5))
;      (define-symbolic GSR (bitvector 5))
;      (define-symbolic CAS_MATCH_REG (bitvector 5))
;      (define-symbolic SOURCEB_MODE (bitvector 5))
;      (define-symbolic MULT_BYPASS (bitvector 5))
;      (define-symbolic RESETMODE (bitvector 5))

;      ;;; Constraints.
;      (assert (bvzero? SIGNEDA))
;      (assert (bvzero? SIGNEDB))
;      (assert (bvzero? SOURCEA))
;      (assert (bvzero? SOURCEB))
;      (assert (bvzero? CE))
;      (assert (bvzero? CLK))
;      (assert (bvzero? SRIA))
;      (assert (bvzero? SRIB))
;      (assert (bveq REG_INPUTA_CLK (bv 0 5)))
;      (assert (bveq REG_INPUTA_CE (bv 1 5)))
;      (assert (bveq REG_INPUTA_RST (bv 2 5)))
;      (assert (bveq REG_INPUTB_CLK (bv 0 5)))
;      (assert (bveq REG_INPUTB_CE (bv 1 5)))
;      (assert (bveq REG_INPUTB_RST (bv 2 5)))
;      (assert (bveq REG_INPUTC_CLK (bv 0 5)))
;      (assert (bveq REG_INPUTC_CE (bv 1 5)))
;      (assert (bveq REG_INPUTC_RST (bv 2 5)))
;      (assert (bveq REG_PIPELINE_CLK (bv 0 5)))
;      (assert (bveq REG_PIPELINE_CE (bv 1 5)))
;      (assert (bveq REG_PIPELINE_RST (bv 2 5)))
;      (assert (bveq REG_OUTPUT_CLK (bv 0 5)))
;      (assert (bveq REG_OUTPUT_CE (bv 1 5)))
;      (assert (bveq REG_OUTPUT_RST (bv 2 5)))
;      (assert (bveq CLK0_DIV (bv 5 5)))
;      (assert (bveq CLK1_DIV (bv 5 5)))
;      (assert (bveq CLK2_DIV (bv 5 5)))
;      (assert (bveq CLK3_DIV (bv 5 5)))
;      (assert (bveq HIGHSPEED_CLK (bv 0 5)))
;      (assert (bveq GSR (bv 5 5)))
;      (assert (bveq CAS_MATCH_REG (bv 4 5)))
;      (assert (bveq SOURCEB_MODE (bv 7 5)))
;      (assert (bveq MULT_BYPASS (bv 5 5)))
;      (assert (bveq RESETMODE (bv 6 5)))

;      (define-symbolic unnamed-input-624 (bitvector 1))

;      (define module-expr
;        (lr:hw-module-instance
;         "MULT18X18D"
;         (list
;          (module-instance-port "A0" (lr:extract (lr:integer 0) (lr:integer 0) A) 'input 1)
;          (module-instance-port "A1" (lr:extract (lr:integer 1) (lr:integer 1) A) 'input 1)
;          (module-instance-port "A2" (lr:extract (lr:integer 2) (lr:integer 2) A) 'input 1)
;          (module-instance-port "A3" (lr:extract (lr:integer 3) (lr:integer 3) A) 'input 1)
;          (module-instance-port "A4" (lr:extract (lr:integer 4) (lr:integer 4) A) 'input 1)
;          (module-instance-port "A5" (lr:extract (lr:integer 5) (lr:integer 5) A) 'input 1)
;          (module-instance-port "A6" (lr:extract (lr:integer 6) (lr:integer 6) A) 'input 1)
;          (module-instance-port "A7" (lr:extract (lr:integer 7) (lr:integer 7) A) 'input 1)
;          (module-instance-port "A8" (lr:extract (lr:integer 8) (lr:integer 8) A) 'input 1)
;          (module-instance-port "A9" (lr:extract (lr:integer 9) (lr:integer 9) A) 'input 1)
;          (module-instance-port "A10" (lr:extract (lr:integer 10) (lr:integer 10) A) 'input 1)
;          (module-instance-port "A11" (lr:extract (lr:integer 11) (lr:integer 11) A) 'input 1)
;          (module-instance-port "A12" (lr:extract (lr:integer 12) (lr:integer 12) A) 'input 1)
;          (module-instance-port "A13" (lr:extract (lr:integer 13) (lr:integer 13) A) 'input 1)
;          (module-instance-port "A14" (lr:extract (lr:integer 14) (lr:integer 14) A) 'input 1)
;          (module-instance-port "A15" (lr:extract (lr:integer 15) (lr:integer 15) A) 'input 1)
;          (module-instance-port "A16" (lr:extract (lr:integer 16) (lr:integer 16) A) 'input 1)
;          (module-instance-port "A17" (lr:extract (lr:integer 17) (lr:integer 17) A) 'input 1)
;          (module-instance-port "B0" (lr:extract (lr:integer 0) (lr:integer 0) B) 'input 1)
;          (module-instance-port "B1" (lr:extract (lr:integer 1) (lr:integer 1) B) 'input 1)
;          (module-instance-port "B2" (lr:extract (lr:integer 2) (lr:integer 2) B) 'input 1)
;          (module-instance-port "B3" (lr:extract (lr:integer 3) (lr:integer 3) B) 'input 1)
;          (module-instance-port "B4" (lr:extract (lr:integer 4) (lr:integer 4) B) 'input 1)
;          (module-instance-port "B5" (lr:extract (lr:integer 5) (lr:integer 5) B) 'input 1)
;          (module-instance-port "B6" (lr:extract (lr:integer 6) (lr:integer 6) B) 'input 1)
;          (module-instance-port "B7" (lr:extract (lr:integer 7) (lr:integer 7) B) 'input 1)
;          (module-instance-port "B8" (lr:extract (lr:integer 8) (lr:integer 8) B) 'input 1)
;          (module-instance-port "B9" (lr:extract (lr:integer 9) (lr:integer 9) B) 'input 1)
;          (module-instance-port "B10" (lr:extract (lr:integer 10) (lr:integer 10) B) 'input 1)
;          (module-instance-port "B11" (lr:extract (lr:integer 11) (lr:integer 11) B) 'input 1)
;          (module-instance-port "B12" (lr:extract (lr:integer 12) (lr:integer 12) B) 'input 1)
;          (module-instance-port "B13" (lr:extract (lr:integer 13) (lr:integer 13) B) 'input 1)
;          (module-instance-port "B14" (lr:extract (lr:integer 14) (lr:integer 14) B) 'input 1)
;          (module-instance-port "B15" (lr:extract (lr:integer 15) (lr:integer 15) B) 'input 1)
;          (module-instance-port "B16" (lr:extract (lr:integer 16) (lr:integer 16) B) 'input 1)
;          (module-instance-port "B17" (lr:extract (lr:integer 17) (lr:integer 17) B) 'input 1)
;          (module-instance-port "C0" (lr:extract (lr:integer 0) (lr:integer 0) C) 'input 1)
;          (module-instance-port "C1" (lr:extract (lr:integer 1) (lr:integer 1) C) 'input 1)
;          (module-instance-port "C2" (lr:extract (lr:integer 2) (lr:integer 2) C) 'input 1)
;          (module-instance-port "C3" (lr:extract (lr:integer 3) (lr:integer 3) C) 'input 1)
;          (module-instance-port "C4" (lr:extract (lr:integer 4) (lr:integer 4) C) 'input 1)
;          (module-instance-port "C5" (lr:extract (lr:integer 5) (lr:integer 5) C) 'input 1)
;          (module-instance-port "C6" (lr:extract (lr:integer 6) (lr:integer 6) C) 'input 1)
;          (module-instance-port "C7" (lr:extract (lr:integer 7) (lr:integer 7) C) 'input 1)
;          (module-instance-port "C8" (lr:extract (lr:integer 8) (lr:integer 8) C) 'input 1)
;          (module-instance-port "C9" (lr:extract (lr:integer 9) (lr:integer 9) C) 'input 1)
;          (module-instance-port "C10" (lr:extract (lr:integer 10) (lr:integer 10) C) 'input 1)
;          (module-instance-port "C11" (lr:extract (lr:integer 11) (lr:integer 11) C) 'input 1)
;          (module-instance-port "C12" (lr:extract (lr:integer 12) (lr:integer 12) C) 'input 1)
;          (module-instance-port "C13" (lr:extract (lr:integer 13) (lr:integer 13) C) 'input 1)
;          (module-instance-port "C14" (lr:extract (lr:integer 14) (lr:integer 14) C) 'input 1)
;          (module-instance-port "C15" (lr:extract (lr:integer 15) (lr:integer 15) C) 'input 1)
;          (module-instance-port "C16" (lr:extract (lr:integer 16) (lr:integer 16) C) 'input 1)
;          (module-instance-port "C17" (lr:extract (lr:integer 17) (lr:integer 17) C) 'input 1)
;          (module-instance-port "SIGNEDA" (lr:bv SIGNEDA) 'input 1)
;          (module-instance-port "SIGNEDB" (lr:bv SIGNEDB) 'input 1)
;          (module-instance-port "SOURCEA" (lr:bv SOURCEA) 'input 1)
;          (module-instance-port "SOURCEB" (lr:bv SOURCEB) 'input 1)
;          (module-instance-port "CE0" (lr:extract (lr:integer 0) (lr:integer 0) (lr:bv CE)) 'input 1)
;          (module-instance-port "CE1" (lr:extract (lr:integer 1) (lr:integer 1) (lr:bv CE)) 'input 1)
;          (module-instance-port "CE2" (lr:extract (lr:integer 2) (lr:integer 2) (lr:bv CE)) 'input 1)
;          (module-instance-port "CE3" (lr:extract (lr:integer 3) (lr:integer 3) (lr:bv CE)) 'input 1)
;          (module-instance-port "CLK0" (lr:extract (lr:integer 0) (lr:integer 0) (lr:bv CLK)) 'input 1)
;          (module-instance-port "CLK1" (lr:extract (lr:integer 1) (lr:integer 1) (lr:bv CLK)) 'input 1)
;          (module-instance-port "CLK2" (lr:extract (lr:integer 2) (lr:integer 2) (lr:bv CLK)) 'input 1)
;          (module-instance-port "CLK3" (lr:extract (lr:integer 3) (lr:integer 3) (lr:bv CLK)) 'input 1)
;          (module-instance-port "RST0" (lr:extract (lr:integer 0) (lr:integer 0) (lr:bv RST)) 'input 1)
;          (module-instance-port "RST1" (lr:extract (lr:integer 1) (lr:integer 1) (lr:bv RST)) 'input 1)
;          (module-instance-port "RST2" (lr:extract (lr:integer 2) (lr:integer 2) (lr:bv RST)) 'input 1)
;          (module-instance-port "RST3" (lr:extract (lr:integer 3) (lr:integer 3) (lr:bv RST)) 'input 1)
;          (module-instance-port "SRIA0"
;                                (lr:extract (lr:integer 0) (lr:integer 0) (lr:bv SRIA))
;                                'input
;                                1)
;          (module-instance-port "SRIA1"
;                                (lr:extract (lr:integer 1) (lr:integer 1) (lr:bv SRIA))
;                                'input
;                                1)
;          (module-instance-port "SRIA2"
;                                (lr:extract (lr:integer 2) (lr:integer 2) (lr:bv SRIA))
;                                'input
;                                1)
;          (module-instance-port "SRIA3"
;                                (lr:extract (lr:integer 3) (lr:integer 3) (lr:bv SRIA))
;                                'input
;                                1)
;          (module-instance-port "SRIA4"
;                                (lr:extract (lr:integer 4) (lr:integer 4) (lr:bv SRIA))
;                                'input
;                                1)
;          (module-instance-port "SRIA5"
;                                (lr:extract (lr:integer 5) (lr:integer 5) (lr:bv SRIA))
;                                'input
;                                1)
;          (module-instance-port "SRIA6"
;                                (lr:extract (lr:integer 6) (lr:integer 6) (lr:bv SRIA))
;                                'input
;                                1)
;          (module-instance-port "SRIA7"
;                                (lr:extract (lr:integer 7) (lr:integer 7) (lr:bv SRIA))
;                                'input
;                                1)
;          (module-instance-port "SRIA8"
;                                (lr:extract (lr:integer 8) (lr:integer 8) (lr:bv SRIA))
;                                'input
;                                1)
;          (module-instance-port "SRIA9"
;                                (lr:extract (lr:integer 9) (lr:integer 9) (lr:bv SRIA))
;                                'input
;                                1)
;          (module-instance-port "SRIA10"
;                                (lr:extract (lr:integer 10) (lr:integer 10) (lr:bv SRIA))
;                                'input
;                                1)
;          (module-instance-port "SRIA11"
;                                (lr:extract (lr:integer 11) (lr:integer 11) (lr:bv SRIA))
;                                'input
;                                1)
;          (module-instance-port "SRIA12"
;                                (lr:extract (lr:integer 12) (lr:integer 12) (lr:bv SRIA))
;                                'input
;                                1)
;          (module-instance-port "SRIA13"
;                                (lr:extract (lr:integer 13) (lr:integer 13) (lr:bv SRIA))
;                                'input
;                                1)
;          (module-instance-port "SRIA14"
;                                (lr:extract (lr:integer 14) (lr:integer 14) (lr:bv SRIA))
;                                'input
;                                1)
;          (module-instance-port "SRIA15"
;                                (lr:extract (lr:integer 15) (lr:integer 15) (lr:bv SRIA))
;                                'input
;                                1)
;          (module-instance-port "SRIA16"
;                                (lr:extract (lr:integer 16) (lr:integer 16) (lr:bv SRIA))
;                                'input
;                                1)
;          (module-instance-port "SRIA17"
;                                (lr:extract (lr:integer 17) (lr:integer 17) (lr:bv SRIA))
;                                'input
;                                1)
;          (module-instance-port "SRIB0"
;                                (lr:extract (lr:integer 0) (lr:integer 0) (lr:bv SRIB))
;                                'input
;                                1)
;          (module-instance-port "SRIB1"
;                                (lr:extract (lr:integer 1) (lr:integer 1) (lr:bv SRIB))
;                                'input
;                                1)
;          (module-instance-port "SRIB2"
;                                (lr:extract (lr:integer 2) (lr:integer 2) (lr:bv SRIB))
;                                'input
;                                1)
;          (module-instance-port "SRIB3"
;                                (lr:extract (lr:integer 3) (lr:integer 3) (lr:bv SRIB))
;                                'input
;                                1)
;          (module-instance-port "SRIB4"
;                                (lr:extract (lr:integer 4) (lr:integer 4) (lr:bv SRIB))
;                                'input
;                                1)
;          (module-instance-port "SRIB5"
;                                (lr:extract (lr:integer 5) (lr:integer 5) (lr:bv SRIB))
;                                'input
;                                1)
;          (module-instance-port "SRIB6"
;                                (lr:extract (lr:integer 6) (lr:integer 6) (lr:bv SRIB))
;                                'input
;                                1)
;          (module-instance-port "SRIB7"
;                                (lr:extract (lr:integer 7) (lr:integer 7) (lr:bv SRIB))
;                                'input
;                                1)
;          (module-instance-port "SRIB8"
;                                (lr:extract (lr:integer 8) (lr:integer 8) (lr:bv SRIB))
;                                'input
;                                1)
;          (module-instance-port "SRIB9"
;                                (lr:extract (lr:integer 9) (lr:integer 9) (lr:bv SRIB))
;                                'input
;                                1)
;          (module-instance-port "SRIB10"
;                                (lr:extract (lr:integer 10) (lr:integer 10) (lr:bv SRIB))
;                                'input
;                                1)
;          (module-instance-port "SRIB11"
;                                (lr:extract (lr:integer 11) (lr:integer 11) (lr:bv SRIB))
;                                'input
;                                1)
;          (module-instance-port "SRIB12"
;                                (lr:extract (lr:integer 12) (lr:integer 12) (lr:bv SRIB))
;                                'input
;                                1)
;          (module-instance-port "SRIB13"
;                                (lr:extract (lr:integer 13) (lr:integer 13) (lr:bv SRIB))
;                                'input
;                                1)
;          (module-instance-port "SRIB14"
;                                (lr:extract (lr:integer 14) (lr:integer 14) (lr:bv SRIB))
;                                'input
;                                1)
;          (module-instance-port "SRIB15"
;                                (lr:extract (lr:integer 15) (lr:integer 15) (lr:bv SRIB))
;                                'input
;                                1)
;          (module-instance-port "SRIB16"
;                                (lr:extract (lr:integer 16) (lr:integer 16) (lr:bv SRIB))
;                                'input
;                                1)
;          (module-instance-port "SRIB17"
;                                (lr:extract (lr:integer 17) (lr:integer 17) (lr:bv SRIB))
;                                'input
;                                1)
;          (module-instance-port "unnamed-input-624" (lr:bv unnamed-input-624) 'input 1)
;          ;;; TODO(@gussmith23): Will need to add the rest of the outputs when needed.
;          (module-instance-port "P0" 'unused 'output 1)
;          (module-instance-port "P1" 'unused 'output 1)
;          (module-instance-port "P2" 'unused 'output 1)
;          (module-instance-port "P3" 'unused 'output 1)
;          (module-instance-port "P4" 'unused 'output 1)
;          (module-instance-port "P5" 'unused 'output 1)
;          (module-instance-port "P6" 'unused 'output 1)
;          (module-instance-port "P7" 'unused 'output 1)
;          (module-instance-port "P8" 'unused 'output 1)
;          (module-instance-port "P9" 'unused 'output 1)
;          (module-instance-port "P10" 'unused 'output 1)
;          (module-instance-port "P11" 'unused 'output 1)
;          (module-instance-port "P12" 'unused 'output 1)
;          (module-instance-port "P13" 'unused 'output 1)
;          (module-instance-port "P14" 'unused 'output 1)
;          (module-instance-port "P15" 'unused 'output 1)
;          (module-instance-port "P16" 'unused 'output 1)
;          (module-instance-port "P17" 'unused 'output 1)
;          (module-instance-port "P18" 'unused 'output 1)
;          (module-instance-port "P19" 'unused 'output 1)
;          (module-instance-port "P20" 'unused 'output 1)
;          (module-instance-port "P21" 'unused 'output 1)
;          (module-instance-port "P22" 'unused 'output 1)
;          (module-instance-port "P23" 'unused 'output 1)
;          (module-instance-port "P24" 'unused 'output 1)
;          (module-instance-port "P25" 'unused 'output 1)
;          (module-instance-port "P26" 'unused 'output 1)
;          (module-instance-port "P27" 'unused 'output 1)
;          (module-instance-port "P28" 'unused 'output 1)
;          (module-instance-port "P29" 'unused 'output 1)
;          (module-instance-port "P30" 'unused 'output 1)
;          (module-instance-port "P31" 'unused 'output 1)
;          (module-instance-port "P32" 'unused 'output 1)
;          (module-instance-port "P33" 'unused 'output 1)
;          (module-instance-port "P34" 'unused 'output 1)
;          (module-instance-port "P35" 'unused 'output 1))
;         (list (module-instance-parameter "REG_INPUTA_CLK" (lr:bv REG_INPUTA_CLK))
;               (module-instance-parameter "REG_INPUTA_CE" (lr:bv REG_INPUTA_CE))
;               (module-instance-parameter "REG_INPUTA_RST" (lr:bv REG_INPUTA_RST))
;               (module-instance-parameter "REG_INPUTB_CLK" (lr:bv REG_INPUTB_CLK))
;               (module-instance-parameter "REG_INPUTB_CE" (lr:bv REG_INPUTB_CE))
;               (module-instance-parameter "REG_INPUTB_RST" (lr:bv REG_INPUTB_RST))
;               (module-instance-parameter "REG_INPUTC_CLK" (lr:bv REG_INPUTC_CLK))
;               (module-instance-parameter "REG_INPUTC_CE" (lr:bv REG_INPUTC_CE))
;               (module-instance-parameter "REG_INPUTC_RST" (lr:bv REG_INPUTC_RST))
;               (module-instance-parameter "REG_PIPELINE_CLK" (lr:bv REG_PIPELINE_CLK))
;               (module-instance-parameter "REG_PIPELINE_CE" (lr:bv REG_PIPELINE_CE))
;               (module-instance-parameter "REG_PIPELINE_RST" (lr:bv REG_PIPELINE_RST))
;               (module-instance-parameter "REG_OUTPUT_CLK" (lr:bv REG_OUTPUT_CLK))
;               (module-instance-parameter "REG_OUTPUT_CE" (lr:bv REG_OUTPUT_CE))
;               (module-instance-parameter "REG_OUTPUT_RST" (lr:bv REG_OUTPUT_RST))
;               (module-instance-parameter "CLK0_DIV" (lr:bv CLK0_DIV))
;               (module-instance-parameter "CLK1_DIV" (lr:bv CLK1_DIV))
;               (module-instance-parameter "CLK2_DIV" (lr:bv CLK2_DIV))
;               (module-instance-parameter "CLK3_DIV" (lr:bv CLK3_DIV))
;               (module-instance-parameter "HIGHSPEED_CLK" (lr:bv HIGHSPEED_CLK))
;               (module-instance-parameter "GSR" (lr:bv GSR))
;               (module-instance-parameter "CAS_MATCH_REG" (lr:bv CAS_MATCH_REG))
;               (module-instance-parameter "SOURCEB_MODE" (lr:bv SOURCEB_MODE))
;               (module-instance-parameter "MULT_BYPASS" (lr:bv MULT_BYPASS))
;               (module-instance-parameter "RESETMODE" (lr:bv RESETMODE)))
;         ""))

;      (define P-expr
;        (lr:concat (lr:list (list (lr:hash-ref module-expr 'P35)
;                                  (lr:hash-ref module-expr 'P34)
;                                  (lr:hash-ref module-expr 'P33)
;                                  (lr:hash-ref module-expr 'P32)
;                                  (lr:hash-ref module-expr 'P31)
;                                  (lr:hash-ref module-expr 'P30)
;                                  (lr:hash-ref module-expr 'P29)
;                                  (lr:hash-ref module-expr 'P28)
;                                  (lr:hash-ref module-expr 'P27)
;                                  (lr:hash-ref module-expr 'P26)
;                                  (lr:hash-ref module-expr 'P25)
;                                  (lr:hash-ref module-expr 'P24)
;                                  (lr:hash-ref module-expr 'P23)
;                                  (lr:hash-ref module-expr 'P22)
;                                  (lr:hash-ref module-expr 'P21)
;                                  (lr:hash-ref module-expr 'P20)
;                                  (lr:hash-ref module-expr 'P19)
;                                  (lr:hash-ref module-expr 'P18)
;                                  (lr:hash-ref module-expr 'P17)
;                                  (lr:hash-ref module-expr 'P16)
;                                  (lr:hash-ref module-expr 'P15)
;                                  (lr:hash-ref module-expr 'P14)
;                                  (lr:hash-ref module-expr 'P13)
;                                  (lr:hash-ref module-expr 'P12)
;                                  (lr:hash-ref module-expr 'P11)
;                                  (lr:hash-ref module-expr 'P10)
;                                  (lr:hash-ref module-expr 'P9)
;                                  (lr:hash-ref module-expr 'P8)
;                                  (lr:hash-ref module-expr 'P7)
;                                  (lr:hash-ref module-expr 'P6)
;                                  (lr:hash-ref module-expr 'P5)
;                                  (lr:hash-ref module-expr 'P4)
;                                  (lr:hash-ref module-expr 'P3)
;                                  (lr:hash-ref module-expr 'P2)
;                                  (lr:hash-ref module-expr 'P1)
;                                  (lr:hash-ref module-expr 'P0)))))

;      ;;; First 18 bits of the multiplier output.
;      (define mult-out (lr:extract (lr:integer 17) (lr:integer 0) P-expr))

;      ;;; Choosing the ALU inputs.
;      (define alu-A
;        (lr:zero-extend (choose (lr:bv  in0)
;                                (lr:bv  in1)
;                                (lr:bv  in2)
;                                mult-out
;                                (lr:bv  (bv 0 1))
;                                (lr:bv  (bv 1 1)))
;                        (lr:bitvector (bitvector 18))))
;      (define alu-B
;        (lr:zero-extend (choose (lr:bv  in0)
;                                (lr:bv  in1)
;                                (lr:bv  in2)
;                                mult-out
;                                (lr:bv  (bv 0 1))
;                                (lr:bv  (bv 1 1)))
;                        (lr:bitvector (bitvector 18))))

;      (define-symbolic OPADDNSUB (bitvector 1))

;      (define alu24b-module-expr
;        (lr:hw-module-instance
;         "ALU24B"
;         (list
;          (module-instance-port "OPADDNSUB" (lr:bv  OPADDNSUB) 'input 1)
;          (module-instance-port "OPCINSEL" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "SIGNEDIA" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "SIGNEDIB" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CE0" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CE1" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CE2" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CE3" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CLK0" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CLK1" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CLK2" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CLK3" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "RST0" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "RST1" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "RST2" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "RST3" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB0" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB1" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB2" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB3" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB4" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB5" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB6" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB7" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB8" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB9" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB10" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB11" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB12" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB13" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB14" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB15" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB16" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB17" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB18" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB19" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB20" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB21" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB22" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CFB23" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN0" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN1" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN2" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN3" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN4" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN5" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN6" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN7" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN8" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN9" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN10" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN11" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN12" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN13" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN14" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN15" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN16" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN17" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN18" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN19" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN20" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN21" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN22" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "CIN23" (lr:bv  (bv 0 1)) 'input 1)
;          (module-instance-port "MA0" (lr:extract (lr:integer 0) (lr:integer 0) alu-A) 'input 1)
;          (module-instance-port "MA1" (lr:extract (lr:integer 1) (lr:integer 1) alu-A) 'input 1)
;          (module-instance-port "MA2" (lr:extract (lr:integer 2) (lr:integer 2) alu-A) 'input 1)
;          (module-instance-port "MA3" (lr:extract (lr:integer 3) (lr:integer 3) alu-A) 'input 1)
;          (module-instance-port "MA4" (lr:extract (lr:integer 4) (lr:integer 4) alu-A) 'input 1)
;          (module-instance-port "MA5" (lr:extract (lr:integer 5) (lr:integer 5) alu-A) 'input 1)
;          (module-instance-port "MA6" (lr:extract (lr:integer 6) (lr:integer 6) alu-A) 'input 1)
;          (module-instance-port "MA7" (lr:extract (lr:integer 7) (lr:integer 7) alu-A) 'input 1)
;          (module-instance-port "MA8" (lr:extract (lr:integer 8) (lr:integer 8) alu-A) 'input 1)
;          (module-instance-port "MA9" (lr:extract (lr:integer 9) (lr:integer 9) alu-A) 'input 1)
;          (module-instance-port "MA10" (lr:extract (lr:integer 10) (lr:integer 10) alu-A) 'input 1)
;          (module-instance-port "MA11" (lr:extract (lr:integer 11) (lr:integer 11) alu-A) 'input 1)
;          (module-instance-port "MA12" (lr:extract (lr:integer 12) (lr:integer 12) alu-A) 'input 1)
;          (module-instance-port "MA13" (lr:extract (lr:integer 13) (lr:integer 13) alu-A) 'input 1)
;          (module-instance-port "MA14" (lr:extract (lr:integer 14) (lr:integer 14) alu-A) 'input 1)
;          (module-instance-port "MA15" (lr:extract (lr:integer 15) (lr:integer 15) alu-A) 'input 1)
;          (module-instance-port "MA16" (lr:extract (lr:integer 16) (lr:integer 16) alu-A) 'input 1)
;          (module-instance-port "MA17" (lr:extract (lr:integer 17) (lr:integer 17) alu-A) 'input 1)
;          (module-instance-port "MB0" (lr:extract (lr:integer 0) (lr:integer 0) alu-B) 'input 1)
;          (module-instance-port "MB1" (lr:extract (lr:integer 1) (lr:integer 1) alu-B) 'input 1)
;          (module-instance-port "MB2" (lr:extract (lr:integer 2) (lr:integer 2) alu-B) 'input 1)
;          (module-instance-port "MB3" (lr:extract (lr:integer 3) (lr:integer 3) alu-B) 'input 1)
;          (module-instance-port "MB4" (lr:extract (lr:integer 4) (lr:integer 4) alu-B) 'input 1)
;          (module-instance-port "MB5" (lr:extract (lr:integer 5) (lr:integer 5) alu-B) 'input 1)
;          (module-instance-port "MB6" (lr:extract (lr:integer 6) (lr:integer 6) alu-B) 'input 1)
;          (module-instance-port "MB7" (lr:extract (lr:integer 7) (lr:integer 7) alu-B) 'input 1)
;          (module-instance-port "MB8" (lr:extract (lr:integer 8) (lr:integer 8) alu-B) 'input 1)
;          (module-instance-port "MB9" (lr:extract (lr:integer 9) (lr:integer 9) alu-B) 'input 1)
;          (module-instance-port "MB10" (lr:extract (lr:integer 10) (lr:integer 10) alu-B) 'input 1)
;          (module-instance-port "MB11" (lr:extract (lr:integer 11) (lr:integer 11) alu-B) 'input 1)
;          (module-instance-port "MB12" (lr:extract (lr:integer 12) (lr:integer 12) alu-B) 'input 1)
;          (module-instance-port "MB13" (lr:extract (lr:integer 13) (lr:integer 13) alu-B) 'input 1)
;          (module-instance-port "MB14" (lr:extract (lr:integer 14) (lr:integer 14) alu-B) 'input 1)
;          (module-instance-port "MB15" (lr:extract (lr:integer 15) (lr:integer 15) alu-B) 'input 1)
;          (module-instance-port "MB16" (lr:extract (lr:integer 16) (lr:integer 16) alu-B) 'input 1)
;          (module-instance-port "MB17" (lr:extract (lr:integer 17) (lr:integer 17) alu-B) 'input 1)
;          (module-instance-port "R0" 'unused 'output 1)
;          (module-instance-port "R1" 'unused 'output 1)
;          (module-instance-port "R2" 'unused 'output 1)
;          (module-instance-port "R3" 'unused 'output 1)
;          (module-instance-port "R4" 'unused 'output 1)
;          (module-instance-port "R5" 'unused 'output 1)
;          (module-instance-port "R6" 'unused 'output 1)
;          (module-instance-port "R7" 'unused 'output 1)
;          (module-instance-port "R8" 'unused 'output 1)
;          (module-instance-port "R9" 'unused 'output 1)
;          (module-instance-port "R10" 'unused 'output 1)
;          (module-instance-port "R11" 'unused 'output 1)
;          (module-instance-port "R12" 'unused 'output 1)
;          (module-instance-port "R13" 'unused 'output 1)
;          (module-instance-port "R14" 'unused 'output 1)
;          (module-instance-port "R15" 'unused 'output 1)
;          (module-instance-port "R16" 'unused 'output 1)
;          (module-instance-port "R17" 'unused 'output 1))
;         (list (module-instance-parameter "REG_OUTPUT_CLK" (lr:bv  (bv 0 5)))
;               (module-instance-parameter "REG_OUTPUT_CE" (lr:bv  (bv 1 5)))
;               (module-instance-parameter "REG_OUTPUT_RST" (lr:bv  (bv 2 5)))
;               (module-instance-parameter "REG_OPCODE_0_CLK" (lr:bv  (bv 0 5)))
;               (module-instance-parameter "REG_OPCODE_0_CE" (lr:bv  (bv 1 5)))
;               (module-instance-parameter "REG_OPCODE_0_RST" (lr:bv  (bv 2 5)))
;               (module-instance-parameter "REG_OPCODE_1_CLK" (lr:bv  (bv 0 5)))
;               (module-instance-parameter "REG_OPCODE_1_CE" (lr:bv  (bv 1 5)))
;               (module-instance-parameter "REG_OPCODE_1_RST" (lr:bv  (bv 2 5)))
;               (module-instance-parameter "REG_INPUTCFB_CLK" (lr:bv  (bv 0 5)))
;               (module-instance-parameter "REG_INPUTCFB_CE" (lr:bv  (bv 1 5)))
;               (module-instance-parameter "REG_INPUTCFB_RST" (lr:bv  (bv 2 5)))
;               (module-instance-parameter "CLK0_DIV" (lr:bv  (bv 5 5)))
;               (module-instance-parameter "CLK1_DIV" (lr:bv  (bv 5 5)))
;               (module-instance-parameter "CLK2_DIV" (lr:bv  (bv 5 5)))
;               (module-instance-parameter "CLK3_DIV" (lr:bv  (bv 5 5)))
;               (module-instance-parameter "GSR" (lr:bv  (bv 3 5)))
;               (module-instance-parameter "RESETMODE" (lr:bv  (bv 6 5))))
;         ""))

;      (define R-expr
;        (lr:concat (lr:list (list (lr:hash-ref alu24b-module-expr 'R17)
;                                  (lr:hash-ref alu24b-module-expr 'R16)
;                                  (lr:hash-ref alu24b-module-expr 'R15)
;                                  (lr:hash-ref alu24b-module-expr 'R14)
;                                  (lr:hash-ref alu24b-module-expr 'R13)
;                                  (lr:hash-ref alu24b-module-expr 'R12)
;                                  (lr:hash-ref alu24b-module-expr 'R11)
;                                  (lr:hash-ref alu24b-module-expr 'R10)
;                                  (lr:hash-ref alu24b-module-expr 'R9)
;                                  (lr:hash-ref alu24b-module-expr 'R8)
;                                  (lr:hash-ref alu24b-module-expr 'R7)
;                                  (lr:hash-ref alu24b-module-expr 'R6)
;                                  (lr:hash-ref alu24b-module-expr 'R5)
;                                  (lr:hash-ref alu24b-module-expr 'R4)
;                                  (lr:hash-ref alu24b-module-expr 'R3)
;                                  (lr:hash-ref alu24b-module-expr 'R2)
;                                  (lr:hash-ref alu24b-module-expr 'R1)
;                                  (lr:hash-ref alu24b-module-expr 'R0)))))

;      (define lakeroad-expr (lr:extract (lr:integer (sub1 (bvlen bv-expr))) (lr:integer 0) R-expr))

;      (interpret lakeroad-expr
;                 #:module-semantics (list (cons (cons "MULT18X18D" "") lattice-ecp5-mult18x18d)
;                                          (cons (cons "ALU24B" "") lattice-ecp5-alu24b)))

;      (define-symbolic unnamed-input-218 (bitvector 24))
;      (rosette-synthesize bv-expr
;                          lakeroad-expr
;                          (append (symbolics bv-expr) (list unnamed-input-624))
;                          #:module-semantics
;                          (list (cons (cons "MULT18X18D" "") lattice-ecp5-mult18x18d)
;                                (cons (cons "ALU24B" "") lattice-ecp5-alu24b))))))

; Convert a simple Rosette bitvector expression to the list format expected by `rosette-synthesize`.
; - expr: A Rosette bitvector expression.
; - output-name: The name of the output port. This should be the same as the name of the output port
;     you'll use in the call to `rosette-synthesize`.
(define (convert-bv-expr-to-spec-list expr output-name)
  (list
   (lambda _ (void))
   ; output function just returns whatever is input; input should be expr!
   (lambda (in)
     (match in
       [(list (cons output-name expr)) in]
       [_
        (error
         "input to output-fn should be a list of the form (list (cons <output-name> <expr>)), as produced via the function defined below this message.")]))
   (lambda _ (void))
   (lambda _ (list (list (cons output-name expr)) 'this-should-not-be-used))))

;;; Returns a concrete Lakeroad expression, or #f if synthesis failed.
;;;
;;; Args:
;;; - spec: A list of functions and objects defining the spec to synthesize against:
;;;    1. input-fn: A function which takes inputs as an association list mapping strings to bitvectors
;;;                 and returns them in the form expected by the spec function.
;;;    2. output-fn: A function which takes the outputs returned by the spec function and returns them
;;;                  as an association list mapping strings to bitvectors.
;;;    3. initial-state: A struct representing the initial state values for the spec.
;;;    4. spec-fn: A function such that (spec-fn (input-fn ...) initial-state) returns
;;;                a (list out state), and furthermore that (output-fn out) is an association list
;;;                giving the expected outputs for the given inputs.
;;; - spec-envs/lr-expr-envs: Environments used to evaluate the bitvector and Lakeroad expressions.
;;;     A list of association lists. Each association list is the environment for one
;;;     call to the interpreter. The interpreter is called once for each association list, and the
;;;     state from each call is passed to the next call. The final bitvector expression is used for
;;;     synthesis.
;;; - inputs: A list of bitvectors to use as inputs to the spec function. These are used as the
;;;     forall inputs in synthesis.
;;; - module-semantics: The semantics of hardware modules. See the corresponding interpreter argument.
;;;   Module semantics mirror the values in the `spec` list.
;;; - assert-equal-on: A list of booleans the same legth as bv/lr-sequential, indicating which
;;;   evaluation stages' outputs we should make assertions over. #f means no assertion at this stage,
;;;   #t means an assertion at this stage. If #f, we default to making assertions only at the last
;;;   stage.
;;; - assumes: A list of Rosette expressions to assume.
;;; - output-ports: A list of output ports that will be asserted equal. Currently expected to be
;;;   length 1.
;;;   TODO(@gussmith23): Support synthesis of multiple output ports.
;;;   To implement this correctly, we will also need to change the sketches so that they don't get
;;;   the output port, i.e. they return the full hash map.
(define (rosette-synthesize spec
                            lr-expr
                            inputs
                            spec-envs
                            lr-expr-envs
                            output-ports
                            #:module-semantics [module-semantics '()]
                            #:assert-equal-on [assert-equal-on #f]
                            #:assumes [assumes '()])

  (when (not (equal? 1 (length output-ports)))
    (error "Currently exactly one output port is expected. See lakeroad/issues/503."))
  (define output-port (first output-ports))

  (when (empty? spec-envs)
    (error
     "spec-envs must not be empty. If you're using convert-bv-expr-to-spec-list, you should pass a list with one element: (list (list))"))
  (when (empty? lr-expr-envs)
    (error
     "lr-expr-envs must not be empty. If the expression has no variables, you should pass a list of one empty environment: (list (list))"))

  (match-define (list spec-input-fn spec-output-fn spec-initial-state spec-fn) spec)

  (when (not (equal? assert-equal-on #f))
    (when (not (and (equal? (length lr-expr-envs) (length spec-envs))
                    (equal? (length spec-envs) (length assert-equal-on))))
      (error "if not #f, assert-equal-on should be the same length as spec-envs and lr-expr-envs")))

  (define spec-evaluated
    (let* ([interpret-one-iter
            (lambda (this-iter-env prev-values)
              (match-let* ([(list out state) (spec-fn (spec-input-fn this-iter-env)
                                                      ;;; Last iteration's state.
                                                      (second (first prev-values)))])
                (cons (list (spec-output-fn out) state) prev-values)))]
           [final-value (foldl interpret-one-iter (list (list 'unused spec-initial-state)) spec-envs)]
           ;;; Fold to get the list of values from each step; map to get the values and ignore the states,
           ;;; reverse to get the values in the right order (newest last); cdr to drop the
           ;;; initial value.
           [spec-evaluated (map first (drop (reverse final-value) 1))]

           ; TODO(#503): This logic should be colocated with similar logic for lr-expr-evaluated when we
           ; implement #503.
           [spec-evaluated
            (map (lambda (assoc-list)
                   (cdr (or (assoc output-port assoc-list)
                            (error (format "output ~a not found in ~a" output-port assoc-list)))))
                 spec-evaluated)])
      spec-evaluated))

  (define lr-expr-initial-state (generate-initial-state-map lr-expr module-semantics))

  ; TODO(#503): In the future, this should end up producing a list of hashmaps/assoc lists, which we
  ; then need to index using the output ports.
  (define lr-expr-evaluated
    (let* (;;; Interpret the Lakeroad expression once, using one of the environments from `envs`
           ;;; (stored in `this-iter-env`). `prev-values` are the values from the previous call to
           ;;; the interpreter, newest first.
           [interpret-one-iter (lambda (this-iter-env prev-values)
                                 (cons (interpret lr-expr
                                                  ; Last iteration's state.
                                                  (second (first prev-values))
                                                  #:module-semantics module-semantics
                                                  #:environment this-iter-env)
                                       prev-values))]
           [final-value
            (foldl interpret-one-iter (list (list 'unused lr-expr-initial-state)) lr-expr-envs)])
      (map first (drop (reverse final-value) 1))))

  (log-debug "spec-evaluated: ~a" spec-evaluated)
  (log-debug "lr-expr-evaluated: ~a" lr-expr-evaluated)

  ;;; This block of code should be restructured. Instead of running synthesis in here, this `define`
  ;;; should interpret the Lakeroad expression, and then synthesis should be moved to another define.
  (define soln
    (synthesize ;;; [this comment just helps force a prettier formatting]
     #:forall inputs
     #:guarantee ;;; [this comment just helps force a prettier formatting]
     (begin
       (for ([assumption assumes])
         (log-debug (format "Assuming: ~a" assumption))
         (assume assumption))
       (match assert-equal-on
         [#f
          (log-debug "asserting: ~a" (bveq (last spec-evaluated) (last lr-expr-evaluated)))
          (when (not (bveq (last spec-evaluated) (last lr-expr-evaluated)))
            (error
             (format
              "spec and lakeroad-expr are trivially not equal. spec-evaluated:~n~a~nlr-expr-evaluated:~n~a"
              spec-evaluated
              lr-expr-evaluated)))
          (assert (bveq (last spec-evaluated) (last lr-expr-evaluated)))]
         [(list bools ...)
          (for ([i (in-range (length bools))])
            (when (list-ref bools i)
              (assert (bveq (list-ref spec-evaluated i) (list-ref lr-expr-evaluated i)))))]))))

  (if (sat? soln)
      (evaluate
       lr-expr
       ;;; Complete the solution: fill in any symbolic values that *aren't* the logical inputs.
       (complete-solution soln
                          (set->list (set-subtract (list->set (symbolics lr-expr))
                                                   (list->set (symbolics spec-evaluated))))))
      #f))

(module+ test
  (require rackunit)

  (test-case "sequential synthesis test"
    (begin

      ;;; Two-stage adder, taking two clock ticks to produce an output.
      (struct two-stage-adder-inputs (a b clk) #:transparent)
      (struct two-stage-adder-outputs (o) #:transparent)
      (struct two-stage-adder-state (old-a old-b old-clk) #:transparent)
      (define two-stage-adder-initial-state (two-stage-adder-state (bv 0 8) (bv 0 8) (bv 0 1)))
      (define (two-stage-adder inputs state)
        (let* ([clk (two-stage-adder-inputs-clk inputs)]
               [a (two-stage-adder-inputs-a inputs)]
               [b (two-stage-adder-inputs-b inputs)]
               [old-clk (two-stage-adder-state-old-clk state)]
               [old-a (two-stage-adder-state-old-a state)]
               [old-b (two-stage-adder-state-old-b state)]
               [clk-ticked (and (bveq clk (bv 1 1)) (bveq old-clk (bv 0 1)))]
               [new-a (if clk-ticked a old-a)]
               [new-b (if clk-ticked b old-b)]
               [out (two-stage-adder-outputs (bvadd old-a old-b))])
          (log-debug "~a" (list clk a b old-clk old-a old-b clk-ticked new-a new-b out))
          (list out (two-stage-adder-state new-a new-b clk))))
      ;;; Helper function used by the below tests.
      (define (make-env clk a b)
        (list (cons "a" a) (cons "b" b) (cons "clk" clk)))

      (define-symbolic a b (bitvector 8))

      ;;; The Lakeroad program just calls the two-stage adder and gets the O output.
      (define lr-expr
        (lr:hash-ref
         (lr:hw-module-instance "two-stage-adder"
                                "two-stage-adder"
                                (list (module-instance-port "a" (lr:bv a) 'input 8)
                                      (module-instance-port "b" (lr:bv b) 'input 8)
                                      (module-instance-port "clk" (lr:var "clk" 1) 'input 1)
                                      (module-instance-port "O" "O" 'output 8))
                                '()
                                "unused filepath")
         "O"))

      ;;; The next two checks test the `lr-sequential` argument to `rosette-synthesize`.

      ;;; Check: we *can't* synthesize an add with a single clock cycle.
      (check-false (rosette-synthesize
                    (convert-bv-expr-to-spec-list (bvadd a b) "O")
                    lr-expr
                    (list a b)
                    ; Empty, because we're using a simple bitvector expression.
                    (list (list))
                    ;;; Tick the clock once (eval with clk=0, eval with clk=1).
                    (list (make-env (bv 0 1) a b) (make-env (bv 1 1) a b))
                    ; output
                    (list "O")
                    #:module-semantics
                    (list (cons (cons "two-stage-adder" "unused filepath")
                                (list (lambda (in)
                                        (two-stage-adder-inputs (cdr (assoc "a" in))
                                                                (cdr (assoc "b" in))
                                                                (cdr (assoc "clk" in))))
                                      (lambda (out) (list (cons "O" (two-stage-adder-outputs-o out))))
                                      two-stage-adder-initial-state
                                      two-stage-adder)))))

      ;;; Check: we *can* successfully synthesize an add with two clock cycles.
      ;;;
      ;;; Note that "synthesis" here is actually equivalent to `verify` in Rosette, because there are
      ;;; no free symbolics to be solved for. So `rosette-synthesize` actually just verifies whether
      ;;; bv-expr == lr-expr for all inputs.
      (check-not-false (rosette-synthesize
                        (convert-bv-expr-to-spec-list (bvadd a b) "O")
                        lr-expr
                        (list a b)
                        ; Don't need to pass envs for bv-expr, as it's already evaluated.
                        (list '())
                        ;;; Tick the clock twice.
                        (list (make-env (bv 0 1) a b)
                              (make-env (bv 1 1) a b)
                              (make-env (bv 0 1) (bv 0 8) (bv 0 8))
                              (make-env (bv 1 1) (bv 0 8) (bv 0 8)))
                        (list "O")
                        #:module-semantics
                        (list (cons (cons "two-stage-adder" "unused filepath")
                                    (list (lambda (in)
                                            (two-stage-adder-inputs (cdr (assoc "a" in))
                                                                    (cdr (assoc "b" in))
                                                                    (cdr (assoc "clk" in))))
                                          (lambda (out)
                                            (list (cons "O" (two-stage-adder-outputs-o out))))
                                          two-stage-adder-initial-state
                                          two-stage-adder)))))

      ;;; The next check tests the `bv-sequential` argument to `rosette-synthesize`.

      ;;; Two-stage adder that does its add on the first clock tick. This will serve as our `bv-expr`
      ;;; input to synthesis. It's just a different way to implement the same adder. We could have also
      ;;; made it one stage or three stages.
      (struct two-stage-adder-2-state (old-sum old-clk) #:transparent)
      (define (two-stage-adder-2 inputs state)
        (let* ([clk (two-stage-adder-inputs-clk inputs)]
               [a (two-stage-adder-inputs-a inputs)]
               [b (two-stage-adder-inputs-b inputs)]
               [old-clk (two-stage-adder-2-state-old-clk state)]
               [old-sum (two-stage-adder-2-state-old-sum state)]
               [sum (bvadd a b)]
               [clk-ticked (and (bveq clk (bv 1 1)) (bveq old-clk (bv 0 1)))]
               [new-sum (if clk-ticked sum old-sum)]
               [out (two-stage-adder-outputs old-sum)])
          (list out (two-stage-adder-2-state new-sum clk))))
      (define two-stage-adder-2-initial-state (two-stage-adder-2-state (bv 0 8) (bv 0 1)))

      ;;; Check that we can successfully "synthesize" (same note as above re: "synthesis" being
      ;;; equivalent to verification in this case) a Lakeroad expression that implements our
      ;;; `two-stage-adder-2` spec.
      (check-not-false
       (rosette-synthesize
        (list
         (lambda (in)
           (two-stage-adder-inputs (cdr (assoc "a" in)) (cdr (assoc "b" in)) (cdr (assoc "clk" in))))
         (lambda (out) (list (cons "O" (two-stage-adder-outputs-o out))))
         two-stage-adder-2-initial-state
         two-stage-adder-2)
        lr-expr
        (list a b)
        ;;; Tick the clock twice, on both designs.
        (list (make-env (bv 0 1) a b)
              (make-env (bv 1 1) a b)
              (make-env (bv 0 1) (bv 0 8) (bv 0 8))
              (make-env (bv 1 1) (bv 0 8) (bv 0 8)))
        (list (make-env (bv 0 1) a b)
              (make-env (bv 1 1) a b)
              (make-env (bv 0 1) (bv 0 8) (bv 0 8))
              (make-env (bv 1 1) (bv 0 8) (bv 0 8)))
        (list "O")
        #:module-semantics
        (list (cons (cons "two-stage-adder" "unused filepath")
                    (list (lambda (in)
                            (two-stage-adder-inputs (cdr (assoc "a" in))
                                                    (cdr (assoc "b" in))
                                                    (cdr (assoc "clk" in))))
                          (lambda (out) (list (cons "O" (two-stage-adder-outputs-o out))))
                          two-stage-adder-initial-state
                          two-stage-adder)))))

      ;;; If you don't tick the clock twice on the `bv-expr`, then the synthesis will fail.
      (check-false (rosette-synthesize
                    (list (lambda (in)
                            (two-stage-adder-inputs (cdr (assoc "a" in))
                                                    (cdr (assoc "b" in))
                                                    (cdr (assoc "clk" in))))
                          (lambda (out) (list (cons "O" (two-stage-adder-outputs-o out))))
                          two-stage-adder-2-initial-state
                          two-stage-adder-2)
                    lr-expr
                    (list a b)
                    (list (make-env (bv 0 1) a b) (make-env (bv 1 1) a b))
                    (list (make-env (bv 0 1) a b)
                          (make-env (bv 1 1) a b)
                          (make-env (bv 0 1) (bv 0 8) (bv 0 8))
                          (make-env (bv 1 1) (bv 0 8) (bv 0 8)))
                    (list "O")
                    #:module-semantics
                    (list (cons (cons "two-stage-adder" "unused filepath")
                                (list (lambda (in)
                                        (two-stage-adder-inputs (cdr (assoc "a" in))
                                                                (cdr (assoc "b" in))
                                                                (cdr (assoc "clk" in))))
                                      (lambda (out) (list (cons "O" (two-stage-adder-outputs-o out))))
                                      two-stage-adder-initial-state
                                      two-stage-adder))))))))

;;; (define (synthesize-lattice-ecp5-multiply-circt bv-expr)

;;;   (define out-bw (bvlen bv-expr))
;;;   (define max-input-bw
;;;     (if (empty? (symbolics bv-expr)) out-bw (apply max (map bvlen (symbolics bv-expr)))))
;;;   (define logical-inputs (get-lattice-logical-inputs bv-expr #:num-inputs 2 #:expected-bw out-bw))

;;;   ; Ugly hack to check exit conditions...everythin is indented way too much
;;;   ;
;;;   ; TODO: There is a way to use continuations to fix this (let/ec) but this
;;;   ; isn't the most important thing right now We only handle two inputs for now
;;;   ; for this form
;;;   (if (or (not (= (length logical-inputs) 2)) (not (concrete? out-bw)) (not (concrete? max-input-bw)))
;;;       #f
;;;       (begin
;;;         ;;; Max bitwidth of any input.
;;;         ;;; If there are no symbolic vars in the expression, default to the bitwidth of the output.

;;;         (define a (first logical-inputs))
;;;         (define b (second logical-inputs))
;;;         (define lakeroad-expr (lattice-mul-with-carry out-bw a b))
;;;         (rosette-synthesize bv-expr lakeroad-expr (symbolics bv-expr)))))

;;; make-wire-lrexpr: a helper function for `synthesize-wire`. This creates a FULL
;;; (input-to-output) wire template that is ready for synthesis.
(define (make-wire-lrexpr inputs shift-by bitwidth)
  (define lakeroad-expr
    (lr:first (lr:physical-to-logical-mapping
               (lr:ptol-bitwise)
               (lr:logical-to-physical-mapping
                (choose (lr:ltop-bitwise)
                        (lr:ltop-bitwise-reverse)
                        (lr:ltop-shift shift-by)
                        (lr:ltop-constant (lr:bv (??* (bitvector bitwidth)))))
                inputs))))

  lakeroad-expr)

;;; Synthesize a wire instruction. This is architecture-independent and involves
;;; pure routing of wires. This includes:
;;; + bitwise (direct routing of input wires to output wires)
;;; + bitwise revierse (reversing he order of wires)
;;; + constant (ignoring inputs and routing a constant to the output)
;;; + shift (logical shifting the input wires to the left or right by a constant
;;;   statically know amount)
(define (synthesize-wire bv-expr #:shift-by [shift-by '()])
  (define out-bw (bvlen bv-expr))
  (when (not (concrete? out-bw))
    (error "Out bitwidth must be statically known."))

  (define max-input-bw
    (if (empty? (symbolics bv-expr)) out-bw (apply max (map bvlen (symbolics bv-expr)))))
  (when (not (concrete? max-input-bw))
    (error "Input bitwidths must be statically known."))

  ; TODO: (Ben) get-lattice-logical-inputs is lattice-specific, and is also
  ;       causing an error at some locations for mux: (abs ??) seems to be a
  ;       problem, for instance.  We don't really need to use dup extensions for
  ;       wire instruction synthesis, so I think we can get away with just using
  ;       the symbolics of the bv-expr as the logical inputs.

  ; (define logical-inputs (get-lattice-logical-inputs bv-expr #:num-inputs 2 #:expected-bw out-bw))
  (define logical-inputs (lr:list (map lr:bv (symbolics bv-expr))))

  (define shift-by-concrete
    (cond
      [(null? shift-by)
       (apply choose*
              (for/list ([i (range (- out-bw) (add1 (add1 out-bw)))] #:when (not (zero? i)))
                i))]
      [(list? shift-by) (apply choose* shift-by)]
      [(int? shift-by) shift-by]
      [else (error "Invalid shift-by: ~a" shift-by)]))

  (define lakeroad-expr (make-wire-lrexpr logical-inputs shift-by-concrete out-bw))
  (log-debug "lakeroad-expr: ~a" lakeroad-expr)
  (rosette-synthesize (convert-bv-expr-to-spec-list bv-expr "O")
                      lakeroad-expr
                      (symbolics bv-expr)
                      (list (list))
                      (list (list))
                      (list "O")))

(module+ test
  (require rosette/solver/smt/bitwuzla
           rosette
           rackunit)
  (current-solver (bitwuzla))
  (with-terms (begin
                (define-symbolic a (bitvector 4))
                (let ([lrexpr (synthesize-wire (bvshl a (bv 0 4)))]) (check-not-false lrexpr))
                (let ([lrexpr (synthesize-wire (bvshl a (bv 1 4)))]) (check-not-false lrexpr))
                (let ([lrexpr (synthesize-wire (bvshl a (bv 2 4)))]) (check-not-false lrexpr))
                (let ([lrexpr (synthesize-wire (bvshl a (bv 3 4)))]) (check-not-false lrexpr))
                (let ([lrexpr (synthesize-wire (bvlshr a (bv 0 4)))]) (check-not-false lrexpr))
                (let ([lrexpr (synthesize-wire (bvlshr a (bv 1 4)))]) (check-not-false lrexpr))
                (let ([lrexpr (synthesize-wire (bvlshr a (bv 2 4)))]) (check-not-false lrexpr))
                (let ([lrexpr (synthesize-wire (bvlshr a (bv 3 4)))]) (check-not-false lrexpr))
                (let ([lrexpr (synthesize-wire (bvlshr a (bv 4 4)) #:shift-by 4)])
                  (check-not-false lrexpr))
                (let ([lrexpr (synthesize-wire (bvlshr a (bv 5 4)))]) (check-not-false lrexpr))
                (let ([lrexpr (synthesize-wire (bv #xff 8))]) (check-not-false lrexpr))
                (let ([lrexpr (synthesize-wire (bv #x12 8))]) (check-not-false lrexpr))
                (let ([lrexpr (synthesize-wire (bv #x123456789abcdef0123456789abcdef0 128))])
                  (check-not-false lrexpr)))))
