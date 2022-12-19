#lang racket
;;; Synthesis routines for the various architectures.
;;;
;;; TODO provide a top-level synthesis procedure?

(provide synthesize-any
         synthesize-all
         synthesize-with-sketch
         synthesize-with
         synthesize-xilinx-ultrascale-plus-impl
         synthesize-lattice-ecp5-impl
         synthesize-lattice-ecp5-dsp
         synthesize-wire
         synthesize-xilinx-ultrascale-plus-dsp
         rosette-synthesize
         template-map)

(require "interpreter.rkt"
         "ultrascale.rkt"
         "lattice-ecp5.rkt"
         rosette
         rosette/lib/synthax
         rosette/lib/angelic
         racket/sandbox
         rosette/solver/smt/boolector
         "utils.rkt"
         "logical-to-physical.rkt"
         (prefix-in lr: "language.rkt")
         "sketches.rkt"
         "architecture-description.rkt"
         "lattice-ecp5-mult18x18d.rkt"
         "lattice-ecp5-alu24b.rkt")

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

(current-solver (boolector))

(define (template-map)
  (make-immutable-hash
   (list (cons "synthesize_wire" synthesize-wire)
         (cons "synthesize_xilinx_ultrascale_plus_dsp" synthesize-xilinx-ultrascale-plus-dsp)
         (cons "synthesize_xilinx_ultrascale_plus_kitchen_sink"
               synthesize-xilinx-ultrascale-plus-impl-kitchen-sink)
         (cons "synthesize_lattice_ecp5_for_pfu" synthesize-lattice-ecp5-for-pfu)
         (cons "synthesize_lattice_ecp5_for_ripple_pfu" synthesize-lattice-ecp5-for-ripple-pfu)
         (cons "synthesize_lattice_ecp5_for_ccu2c" synthesize-lattice-ecp5-for-ccu2c)
         (cons "synthesize_lattice_ecp5_for_ccu2c_tri" synthesize-lattice-ecp5-for-ccu2c-tri))))

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
  (require rackunit)
  (define-syntax-rule (simple-test f before-call args ...)
    (test-true (format "~a simple test" f)
               (normal? (with-vc (with-terms (begin
                                               before-call
                                               (let ([result (f args ...)])
                                                 (check-true (not (or (equal? #f result)
                                                                      (equal? 'unsynthesizable
                                                                              result))))))))))))

;;; (module+ test
;;;   (simple-test synthesize-sofa-impl (define-symbolic a b (bitvector 8)) (bvand a b)))

;;; Synthesize a Xilinx UltraScale+ Lakeroad expression for the given Rosette bitvector expression.
;;;
;;; TODO Use the grammar to generate *any* Lakeroad program. This will probably require that we also
;;; let the user specify the depth to search over and other parameters. At the very least, start by
;;; defining those as keyword args with default values.
(define (synthesize-xilinx-ultrascale-plus-impl bv-expr [finish-when 'first-to-succeed])
  (synthesize-with finish-when
                   (list synthesize-wire
                         synthesize-xilinx-ultrascale-plus-dsp
                         synthesize-xilinx-ultrascale-plus-impl-kitchen-sink)
                   bv-expr))

(module+ test
  (simple-test synthesize-xilinx-ultrascale-plus-impl
               (define-symbolic a b (bitvector 8))
               (bvand a b)))

(define (synthesize-lattice-ecp5-impl bv-expr [finish-when 'first-to-succeed] #:timeout [timeout 5.0])
  (synthesize-with finish-when
                   (list synthesize-wire
                         synthesize-lattice-ecp5-for-pfu
                         synthesize-lattice-ecp5-for-ripple-pfu
                         synthesize-lattice-ecp5-for-ccu2c
                         synthesize-lattice-ecp5-for-ccu2c-tri)
                   bv-expr
                   timeout))

(module+ test
  (simple-test synthesize-lattice-ecp5-impl (define-symbolic a b (bitvector 8)) (bvand a b))
  (simple-test synthesize-lattice-ecp5-for-pfu (define-symbolic a b (bitvector 8)) (bvand a b))
  (simple-test synthesize-lattice-ecp5-for-ripple-pfu (define-symbolic a b (bitvector 8)) (bvand a b))
  (simple-test synthesize-lattice-ecp5-for-ripple-pfu (define-symbolic a b (bitvector 8)) (bvadd a b))
  ;;; It's unclear whether CCU2C template is supposed to work. Assuming it's broken for now. Same with
  ;;; tri.
  ;;; (simple-test synthesize-lattice-ecp5-for-ccu2c (define-symbolic a b (bitvector 8)) (bvand a b))
  ;;; (simple-test synthesize-lattice-ecp5-for-ccu2c (define-symbolic a b (bitvector 8)) (bvadd a b))
  ;;; I tried hard, but I just couldn't get multiplication fixed. It's okay, because we'll fix it by
  ;;; reimplementing it as a new template.
  ;;; (simple-test synthesize-lattice-ecp5-multiply-circt (define-symbolic a b (bitvector 2)) (bvmul a b))
  ;;; (simple-test synthesize-lattice-ecp5-multiply-circt (define-symbolic a b (bitvector 3)) (bvmul a b))
  ;;; (simple-test synthesize-lattice-ecp5-multiply-circt (define-symbolic a b (bitvector 4)) (bvmul a b))
  ;;; (simple-test synthesize-lattice-ecp5-multiply-circt
  ;;;              (define-symbolic a b (bitvector 8))
  ;;;              (bvmul a b))
  )

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

(define (synthesize-lattice-ecp5-dsp bv-expr)
  (let/ec
   return
   (begin

     ;;; Only supporting 3 inputs, a, b, c.
     (when (> (length (symbolics bv-expr)) 3)
       (return #f))

     ;;; Only supporting max bws of 18 on DSPs for now.
     (when (> (apply max (bvlen bv-expr) (map bvlen (symbolics bv-expr))) 18)
       (return #f))

     (define in0 (if (>= (length (symbolics bv-expr)) 1) (list-ref (symbolics bv-expr) 0) (bv 0 1)))
     (define in1 (if (>= (length (symbolics bv-expr)) 2) (list-ref (symbolics bv-expr) 1) (bv 0 1)))
     (define in2 (if (>= (length (symbolics bv-expr)) 3) (list-ref (symbolics bv-expr) 2) (bv 0 1)))

     ;;; Main input ports.
     (define A
       (lr:zero-extend (lr:bv (choose in0 in1 in2 (bv 0 1) (bv 1 1))) (lr:bitvector (bitvector 18))))
     (define B
       (lr:zero-extend (lr:bv (choose in0 in1 in2 (bv 0 1) (bv 1 1))) (lr:bitvector (bitvector 18))))
     (define C
       (lr:zero-extend (lr:bv (choose in0 in1 in2 (bv 0 1) (bv 1 1))) (lr:bitvector (bitvector 18))))

     ;;; Input ports.
     (define-symbolic SIGNEDA (bitvector 1))
     (define-symbolic SIGNEDB (bitvector 1))
     (define-symbolic SOURCEA (bitvector 1))
     (define-symbolic SOURCEB (bitvector 1))
     (define-symbolic CE (bitvector 4))
     (define-symbolic CLK (bitvector 4))
     (define-symbolic RST (bitvector 4))
     (define-symbolic SRIA (bitvector 18))
     (define-symbolic SRIB (bitvector 18))

     ;;; Parameters.
     (define-symbolic REG_INPUTA_CLK (bitvector 5))
     (define-symbolic REG_INPUTA_CE (bitvector 5))
     (define-symbolic REG_INPUTA_RST (bitvector 5))
     (define-symbolic REG_INPUTB_CLK (bitvector 5))
     (define-symbolic REG_INPUTB_CE (bitvector 5))
     (define-symbolic REG_INPUTB_RST (bitvector 5))
     (define-symbolic REG_INPUTC_CLK (bitvector 5))
     (define-symbolic REG_INPUTC_CE (bitvector 5))
     (define-symbolic REG_INPUTC_RST (bitvector 5))
     (define-symbolic REG_PIPELINE_CLK (bitvector 5))
     (define-symbolic REG_PIPELINE_CE (bitvector 5))
     (define-symbolic REG_PIPELINE_RST (bitvector 5))
     (define-symbolic REG_OUTPUT_CLK (bitvector 5))
     (define-symbolic REG_OUTPUT_CE (bitvector 5))
     (define-symbolic REG_OUTPUT_RST (bitvector 5))
     (define-symbolic CLK0_DIV (bitvector 5))
     (define-symbolic CLK1_DIV (bitvector 5))
     (define-symbolic CLK2_DIV (bitvector 5))
     (define-symbolic CLK3_DIV (bitvector 5))
     (define-symbolic HIGHSPEED_CLK (bitvector 5))
     (define-symbolic GSR (bitvector 5))
     (define-symbolic CAS_MATCH_REG (bitvector 5))
     (define-symbolic SOURCEB_MODE (bitvector 5))
     (define-symbolic MULT_BYPASS (bitvector 5))
     (define-symbolic RESETMODE (bitvector 5))

     ;;; Constraints.
     (assert (bvzero? SIGNEDA))
     (assert (bvzero? SIGNEDB))
     (assert (bvzero? SOURCEA))
     (assert (bvzero? SOURCEB))
     (assert (bvzero? CE))
     (assert (bvzero? CLK))
     (assert (bvzero? SRIA))
     (assert (bvzero? SRIB))
     (assert (bveq REG_INPUTA_CLK (bv 0 5)))
     (assert (bveq REG_INPUTA_CE (bv 1 5)))
     (assert (bveq REG_INPUTA_RST (bv 2 5)))
     (assert (bveq REG_INPUTB_CLK (bv 0 5)))
     (assert (bveq REG_INPUTB_CE (bv 1 5)))
     (assert (bveq REG_INPUTB_RST (bv 2 5)))
     (assert (bveq REG_INPUTC_CLK (bv 0 5)))
     (assert (bveq REG_INPUTC_CE (bv 1 5)))
     (assert (bveq REG_INPUTC_RST (bv 2 5)))
     (assert (bveq REG_PIPELINE_CLK (bv 0 5)))
     (assert (bveq REG_PIPELINE_CE (bv 1 5)))
     (assert (bveq REG_PIPELINE_RST (bv 2 5)))
     (assert (bveq REG_OUTPUT_CLK (bv 0 5)))
     (assert (bveq REG_OUTPUT_CE (bv 1 5)))
     (assert (bveq REG_OUTPUT_RST (bv 2 5)))
     (assert (bveq CLK0_DIV (bv 5 5)))
     (assert (bveq CLK1_DIV (bv 5 5)))
     (assert (bveq CLK2_DIV (bv 5 5)))
     (assert (bveq CLK3_DIV (bv 5 5)))
     (assert (bveq HIGHSPEED_CLK (bv 0 5)))
     (assert (bveq GSR (bv 5 5)))
     (assert (bveq CAS_MATCH_REG (bv 4 5)))
     (assert (bveq SOURCEB_MODE (bv 7 5)))
     (assert (bveq MULT_BYPASS (bv 5 5)))
     (assert (bveq RESETMODE (bv 6 5)))

     (define-symbolic unnamed-input-624 (bitvector 1))

     (define module-expr
       (lr:hw-module-instance
        "MULT18X18D"
        (list
         (module-instance-port "A0" (lr:extract (lr:integer 0) (lr:integer 0) A) 'input 1)
         (module-instance-port "A1" (lr:extract (lr:integer 1) (lr:integer 1) A) 'input 1)
         (module-instance-port "A2" (lr:extract (lr:integer 2) (lr:integer 2) A) 'input 1)
         (module-instance-port "A3" (lr:extract (lr:integer 3) (lr:integer 3) A) 'input 1)
         (module-instance-port "A4" (lr:extract (lr:integer 4) (lr:integer 4) A) 'input 1)
         (module-instance-port "A5" (lr:extract (lr:integer 5) (lr:integer 5) A) 'input 1)
         (module-instance-port "A6" (lr:extract (lr:integer 6) (lr:integer 6) A) 'input 1)
         (module-instance-port "A7" (lr:extract (lr:integer 7) (lr:integer 7) A) 'input 1)
         (module-instance-port "A8" (lr:extract (lr:integer 8) (lr:integer 8) A) 'input 1)
         (module-instance-port "A9" (lr:extract (lr:integer 9) (lr:integer 9) A) 'input 1)
         (module-instance-port "A10" (lr:extract (lr:integer 10) (lr:integer 10) A) 'input 1)
         (module-instance-port "A11" (lr:extract (lr:integer 11) (lr:integer 11) A) 'input 1)
         (module-instance-port "A12" (lr:extract (lr:integer 12) (lr:integer 12) A) 'input 1)
         (module-instance-port "A13" (lr:extract (lr:integer 13) (lr:integer 13) A) 'input 1)
         (module-instance-port "A14" (lr:extract (lr:integer 14) (lr:integer 14) A) 'input 1)
         (module-instance-port "A15" (lr:extract (lr:integer 15) (lr:integer 15) A) 'input 1)
         (module-instance-port "A16" (lr:extract (lr:integer 16) (lr:integer 16) A) 'input 1)
         (module-instance-port "A17" (lr:extract (lr:integer 17) (lr:integer 17) A) 'input 1)
         (module-instance-port "B0" (lr:extract (lr:integer 0) (lr:integer 0) B) 'input 1)
         (module-instance-port "B1" (lr:extract (lr:integer 1) (lr:integer 1) B) 'input 1)
         (module-instance-port "B2" (lr:extract (lr:integer 2) (lr:integer 2) B) 'input 1)
         (module-instance-port "B3" (lr:extract (lr:integer 3) (lr:integer 3) B) 'input 1)
         (module-instance-port "B4" (lr:extract (lr:integer 4) (lr:integer 4) B) 'input 1)
         (module-instance-port "B5" (lr:extract (lr:integer 5) (lr:integer 5) B) 'input 1)
         (module-instance-port "B6" (lr:extract (lr:integer 6) (lr:integer 6) B) 'input 1)
         (module-instance-port "B7" (lr:extract (lr:integer 7) (lr:integer 7) B) 'input 1)
         (module-instance-port "B8" (lr:extract (lr:integer 8) (lr:integer 8) B) 'input 1)
         (module-instance-port "B9" (lr:extract (lr:integer 9) (lr:integer 9) B) 'input 1)
         (module-instance-port "B10" (lr:extract (lr:integer 10) (lr:integer 10) B) 'input 1)
         (module-instance-port "B11" (lr:extract (lr:integer 11) (lr:integer 11) B) 'input 1)
         (module-instance-port "B12" (lr:extract (lr:integer 12) (lr:integer 12) B) 'input 1)
         (module-instance-port "B13" (lr:extract (lr:integer 13) (lr:integer 13) B) 'input 1)
         (module-instance-port "B14" (lr:extract (lr:integer 14) (lr:integer 14) B) 'input 1)
         (module-instance-port "B15" (lr:extract (lr:integer 15) (lr:integer 15) B) 'input 1)
         (module-instance-port "B16" (lr:extract (lr:integer 16) (lr:integer 16) B) 'input 1)
         (module-instance-port "B17" (lr:extract (lr:integer 17) (lr:integer 17) B) 'input 1)
         (module-instance-port "C0" (lr:extract (lr:integer 0) (lr:integer 0) C) 'input 1)
         (module-instance-port "C1" (lr:extract (lr:integer 1) (lr:integer 1) C) 'input 1)
         (module-instance-port "C2" (lr:extract (lr:integer 2) (lr:integer 2) C) 'input 1)
         (module-instance-port "C3" (lr:extract (lr:integer 3) (lr:integer 3) C) 'input 1)
         (module-instance-port "C4" (lr:extract (lr:integer 4) (lr:integer 4) C) 'input 1)
         (module-instance-port "C5" (lr:extract (lr:integer 5) (lr:integer 5) C) 'input 1)
         (module-instance-port "C6" (lr:extract (lr:integer 6) (lr:integer 6) C) 'input 1)
         (module-instance-port "C7" (lr:extract (lr:integer 7) (lr:integer 7) C) 'input 1)
         (module-instance-port "C8" (lr:extract (lr:integer 8) (lr:integer 8) C) 'input 1)
         (module-instance-port "C9" (lr:extract (lr:integer 9) (lr:integer 9) C) 'input 1)
         (module-instance-port "C10" (lr:extract (lr:integer 10) (lr:integer 10) C) 'input 1)
         (module-instance-port "C11" (lr:extract (lr:integer 11) (lr:integer 11) C) 'input 1)
         (module-instance-port "C12" (lr:extract (lr:integer 12) (lr:integer 12) C) 'input 1)
         (module-instance-port "C13" (lr:extract (lr:integer 13) (lr:integer 13) C) 'input 1)
         (module-instance-port "C14" (lr:extract (lr:integer 14) (lr:integer 14) C) 'input 1)
         (module-instance-port "C15" (lr:extract (lr:integer 15) (lr:integer 15) C) 'input 1)
         (module-instance-port "C16" (lr:extract (lr:integer 16) (lr:integer 16) C) 'input 1)
         (module-instance-port "C17" (lr:extract (lr:integer 17) (lr:integer 17) C) 'input 1)
         (module-instance-port "SIGNEDA" (lr:bv SIGNEDA) 'input 1)
         (module-instance-port "SIGNEDB" (lr:bv SIGNEDB) 'input 1)
         (module-instance-port "SOURCEA" (lr:bv SOURCEA) 'input 1)
         (module-instance-port "SOURCEB" (lr:bv SOURCEB) 'input 1)
         (module-instance-port "CE0" (lr:extract (lr:integer 0) (lr:integer 0) (lr:bv CE)) 'input 1)
         (module-instance-port "CE1" (lr:extract (lr:integer 1) (lr:integer 1) (lr:bv CE)) 'input 1)
         (module-instance-port "CE2" (lr:extract (lr:integer 2) (lr:integer 2) (lr:bv CE)) 'input 1)
         (module-instance-port "CE3" (lr:extract (lr:integer 3) (lr:integer 3) (lr:bv CE)) 'input 1)
         (module-instance-port "CLK0" (lr:extract (lr:integer 0) (lr:integer 0) (lr:bv CLK)) 'input 1)
         (module-instance-port "CLK1" (lr:extract (lr:integer 1) (lr:integer 1) (lr:bv CLK)) 'input 1)
         (module-instance-port "CLK2" (lr:extract (lr:integer 2) (lr:integer 2) (lr:bv CLK)) 'input 1)
         (module-instance-port "CLK3" (lr:extract (lr:integer 3) (lr:integer 3) (lr:bv CLK)) 'input 1)
         (module-instance-port "RST0" (lr:extract (lr:integer 0) (lr:integer 0) (lr:bv RST)) 'input 1)
         (module-instance-port "RST1" (lr:extract (lr:integer 1) (lr:integer 1) (lr:bv RST)) 'input 1)
         (module-instance-port "RST2" (lr:extract (lr:integer 2) (lr:integer 2) (lr:bv RST)) 'input 1)
         (module-instance-port "RST3" (lr:extract (lr:integer 3) (lr:integer 3) (lr:bv RST)) 'input 1)
         (module-instance-port "SRIA0"
                               (lr:extract (lr:integer 0) (lr:integer 0) (lr:bv SRIA))
                               'input
                               1)
         (module-instance-port "SRIA1"
                               (lr:extract (lr:integer 1) (lr:integer 1) (lr:bv SRIA))
                               'input
                               1)
         (module-instance-port "SRIA2"
                               (lr:extract (lr:integer 2) (lr:integer 2) (lr:bv SRIA))
                               'input
                               1)
         (module-instance-port "SRIA3"
                               (lr:extract (lr:integer 3) (lr:integer 3) (lr:bv SRIA))
                               'input
                               1)
         (module-instance-port "SRIA4"
                               (lr:extract (lr:integer 4) (lr:integer 4) (lr:bv SRIA))
                               'input
                               1)
         (module-instance-port "SRIA5"
                               (lr:extract (lr:integer 5) (lr:integer 5) (lr:bv SRIA))
                               'input
                               1)
         (module-instance-port "SRIA6"
                               (lr:extract (lr:integer 6) (lr:integer 6) (lr:bv SRIA))
                               'input
                               1)
         (module-instance-port "SRIA7"
                               (lr:extract (lr:integer 7) (lr:integer 7) (lr:bv SRIA))
                               'input
                               1)
         (module-instance-port "SRIA8"
                               (lr:extract (lr:integer 8) (lr:integer 8) (lr:bv SRIA))
                               'input
                               1)
         (module-instance-port "SRIA9"
                               (lr:extract (lr:integer 9) (lr:integer 9) (lr:bv SRIA))
                               'input
                               1)
         (module-instance-port "SRIA10"
                               (lr:extract (lr:integer 10) (lr:integer 10) (lr:bv SRIA))
                               'input
                               1)
         (module-instance-port "SRIA11"
                               (lr:extract (lr:integer 11) (lr:integer 11) (lr:bv SRIA))
                               'input
                               1)
         (module-instance-port "SRIA12"
                               (lr:extract (lr:integer 12) (lr:integer 12) (lr:bv SRIA))
                               'input
                               1)
         (module-instance-port "SRIA13"
                               (lr:extract (lr:integer 13) (lr:integer 13) (lr:bv SRIA))
                               'input
                               1)
         (module-instance-port "SRIA14"
                               (lr:extract (lr:integer 14) (lr:integer 14) (lr:bv SRIA))
                               'input
                               1)
         (module-instance-port "SRIA15"
                               (lr:extract (lr:integer 15) (lr:integer 15) (lr:bv SRIA))
                               'input
                               1)
         (module-instance-port "SRIA16"
                               (lr:extract (lr:integer 16) (lr:integer 16) (lr:bv SRIA))
                               'input
                               1)
         (module-instance-port "SRIA17"
                               (lr:extract (lr:integer 17) (lr:integer 17) (lr:bv SRIA))
                               'input
                               1)
         (module-instance-port "SRIB0"
                               (lr:extract (lr:integer 0) (lr:integer 0) (lr:bv SRIB))
                               'input
                               1)
         (module-instance-port "SRIB1"
                               (lr:extract (lr:integer 1) (lr:integer 1) (lr:bv SRIB))
                               'input
                               1)
         (module-instance-port "SRIB2"
                               (lr:extract (lr:integer 2) (lr:integer 2) (lr:bv SRIB))
                               'input
                               1)
         (module-instance-port "SRIB3"
                               (lr:extract (lr:integer 3) (lr:integer 3) (lr:bv SRIB))
                               'input
                               1)
         (module-instance-port "SRIB4"
                               (lr:extract (lr:integer 4) (lr:integer 4) (lr:bv SRIB))
                               'input
                               1)
         (module-instance-port "SRIB5"
                               (lr:extract (lr:integer 5) (lr:integer 5) (lr:bv SRIB))
                               'input
                               1)
         (module-instance-port "SRIB6"
                               (lr:extract (lr:integer 6) (lr:integer 6) (lr:bv SRIB))
                               'input
                               1)
         (module-instance-port "SRIB7"
                               (lr:extract (lr:integer 7) (lr:integer 7) (lr:bv SRIB))
                               'input
                               1)
         (module-instance-port "SRIB8"
                               (lr:extract (lr:integer 8) (lr:integer 8) (lr:bv SRIB))
                               'input
                               1)
         (module-instance-port "SRIB9"
                               (lr:extract (lr:integer 9) (lr:integer 9) (lr:bv SRIB))
                               'input
                               1)
         (module-instance-port "SRIB10"
                               (lr:extract (lr:integer 10) (lr:integer 10) (lr:bv SRIB))
                               'input
                               1)
         (module-instance-port "SRIB11"
                               (lr:extract (lr:integer 11) (lr:integer 11) (lr:bv SRIB))
                               'input
                               1)
         (module-instance-port "SRIB12"
                               (lr:extract (lr:integer 12) (lr:integer 12) (lr:bv SRIB))
                               'input
                               1)
         (module-instance-port "SRIB13"
                               (lr:extract (lr:integer 13) (lr:integer 13) (lr:bv SRIB))
                               'input
                               1)
         (module-instance-port "SRIB14"
                               (lr:extract (lr:integer 14) (lr:integer 14) (lr:bv SRIB))
                               'input
                               1)
         (module-instance-port "SRIB15"
                               (lr:extract (lr:integer 15) (lr:integer 15) (lr:bv SRIB))
                               'input
                               1)
         (module-instance-port "SRIB16"
                               (lr:extract (lr:integer 16) (lr:integer 16) (lr:bv SRIB))
                               'input
                               1)
         (module-instance-port "SRIB17"
                               (lr:extract (lr:integer 17) (lr:integer 17) (lr:bv SRIB))
                               'input
                               1)
         (module-instance-port "unnamed-input-624" (lr:bv unnamed-input-624) 'input 1)
         ;;; TODO(@gussmith23): Will need to add the rest of the outputs when needed.
         (module-instance-port "P0" 'unused 'output 1)
         (module-instance-port "P1" 'unused 'output 1)
         (module-instance-port "P2" 'unused 'output 1)
         (module-instance-port "P3" 'unused 'output 1)
         (module-instance-port "P4" 'unused 'output 1)
         (module-instance-port "P5" 'unused 'output 1)
         (module-instance-port "P6" 'unused 'output 1)
         (module-instance-port "P7" 'unused 'output 1)
         (module-instance-port "P8" 'unused 'output 1)
         (module-instance-port "P9" 'unused 'output 1)
         (module-instance-port "P10" 'unused 'output 1)
         (module-instance-port "P11" 'unused 'output 1)
         (module-instance-port "P12" 'unused 'output 1)
         (module-instance-port "P13" 'unused 'output 1)
         (module-instance-port "P14" 'unused 'output 1)
         (module-instance-port "P15" 'unused 'output 1)
         (module-instance-port "P16" 'unused 'output 1)
         (module-instance-port "P17" 'unused 'output 1)
         (module-instance-port "P18" 'unused 'output 1)
         (module-instance-port "P19" 'unused 'output 1)
         (module-instance-port "P20" 'unused 'output 1)
         (module-instance-port "P21" 'unused 'output 1)
         (module-instance-port "P22" 'unused 'output 1)
         (module-instance-port "P23" 'unused 'output 1)
         (module-instance-port "P24" 'unused 'output 1)
         (module-instance-port "P25" 'unused 'output 1)
         (module-instance-port "P26" 'unused 'output 1)
         (module-instance-port "P27" 'unused 'output 1)
         (module-instance-port "P28" 'unused 'output 1)
         (module-instance-port "P29" 'unused 'output 1)
         (module-instance-port "P30" 'unused 'output 1)
         (module-instance-port "P31" 'unused 'output 1)
         (module-instance-port "P32" 'unused 'output 1)
         (module-instance-port "P33" 'unused 'output 1)
         (module-instance-port "P34" 'unused 'output 1)
         (module-instance-port "P35" 'unused 'output 1))
        (list (module-instance-parameter "REG_INPUTA_CLK" (lr:bv REG_INPUTA_CLK))
              (module-instance-parameter "REG_INPUTA_CE" (lr:bv REG_INPUTA_CE))
              (module-instance-parameter "REG_INPUTA_RST" (lr:bv REG_INPUTA_RST))
              (module-instance-parameter "REG_INPUTB_CLK" (lr:bv REG_INPUTB_CLK))
              (module-instance-parameter "REG_INPUTB_CE" (lr:bv REG_INPUTB_CE))
              (module-instance-parameter "REG_INPUTB_RST" (lr:bv REG_INPUTB_RST))
              (module-instance-parameter "REG_INPUTC_CLK" (lr:bv REG_INPUTC_CLK))
              (module-instance-parameter "REG_INPUTC_CE" (lr:bv REG_INPUTC_CE))
              (module-instance-parameter "REG_INPUTC_RST" (lr:bv REG_INPUTC_RST))
              (module-instance-parameter "REG_PIPELINE_CLK" (lr:bv REG_PIPELINE_CLK))
              (module-instance-parameter "REG_PIPELINE_CE" (lr:bv REG_PIPELINE_CE))
              (module-instance-parameter "REG_PIPELINE_RST" (lr:bv REG_PIPELINE_RST))
              (module-instance-parameter "REG_OUTPUT_CLK" (lr:bv REG_OUTPUT_CLK))
              (module-instance-parameter "REG_OUTPUT_CE" (lr:bv REG_OUTPUT_CE))
              (module-instance-parameter "REG_OUTPUT_RST" (lr:bv REG_OUTPUT_RST))
              (module-instance-parameter "CLK0_DIV" (lr:bv CLK0_DIV))
              (module-instance-parameter "CLK1_DIV" (lr:bv CLK1_DIV))
              (module-instance-parameter "CLK2_DIV" (lr:bv CLK2_DIV))
              (module-instance-parameter "CLK3_DIV" (lr:bv CLK3_DIV))
              (module-instance-parameter "HIGHSPEED_CLK" (lr:bv HIGHSPEED_CLK))
              (module-instance-parameter "GSR" (lr:bv GSR))
              (module-instance-parameter "CAS_MATCH_REG" (lr:bv CAS_MATCH_REG))
              (module-instance-parameter "SOURCEB_MODE" (lr:bv SOURCEB_MODE))
              (module-instance-parameter "MULT_BYPASS" (lr:bv MULT_BYPASS))
              (module-instance-parameter "RESETMODE" (lr:bv RESETMODE)))
        ""))

     (define P-expr
       (lr:concat (lr:list (list (lr:hash-ref module-expr 'P35)
                                 (lr:hash-ref module-expr 'P34)
                                 (lr:hash-ref module-expr 'P33)
                                 (lr:hash-ref module-expr 'P32)
                                 (lr:hash-ref module-expr 'P31)
                                 (lr:hash-ref module-expr 'P30)
                                 (lr:hash-ref module-expr 'P29)
                                 (lr:hash-ref module-expr 'P28)
                                 (lr:hash-ref module-expr 'P27)
                                 (lr:hash-ref module-expr 'P26)
                                 (lr:hash-ref module-expr 'P25)
                                 (lr:hash-ref module-expr 'P24)
                                 (lr:hash-ref module-expr 'P23)
                                 (lr:hash-ref module-expr 'P22)
                                 (lr:hash-ref module-expr 'P21)
                                 (lr:hash-ref module-expr 'P20)
                                 (lr:hash-ref module-expr 'P19)
                                 (lr:hash-ref module-expr 'P18)
                                 (lr:hash-ref module-expr 'P17)
                                 (lr:hash-ref module-expr 'P16)
                                 (lr:hash-ref module-expr 'P15)
                                 (lr:hash-ref module-expr 'P14)
                                 (lr:hash-ref module-expr 'P13)
                                 (lr:hash-ref module-expr 'P12)
                                 (lr:hash-ref module-expr 'P11)
                                 (lr:hash-ref module-expr 'P10)
                                 (lr:hash-ref module-expr 'P9)
                                 (lr:hash-ref module-expr 'P8)
                                 (lr:hash-ref module-expr 'P7)
                                 (lr:hash-ref module-expr 'P6)
                                 (lr:hash-ref module-expr 'P5)
                                 (lr:hash-ref module-expr 'P4)
                                 (lr:hash-ref module-expr 'P3)
                                 (lr:hash-ref module-expr 'P2)
                                 (lr:hash-ref module-expr 'P1)
                                 (lr:hash-ref module-expr 'P0)))))

     ;;; First 18 bits of the multiplier output.
     (define mult-out (lr:extract (lr:integer 17) (lr:integer 0) P-expr))

     ;;; Choosing the ALU inputs.
     (define alu-A
       (lr:zero-extend
        (choose (lr:bv in0) (lr:bv in1) (lr:bv in2) mult-out (lr:bv (bv 0 1)) (lr:bv (bv 1 1)))
        (lr:bitvector (bitvector 18))))
     (define alu-B
       (lr:zero-extend
        (choose (lr:bv in0) (lr:bv in1) (lr:bv in2) mult-out (lr:bv (bv 0 1)) (lr:bv (bv 1 1)))
        (lr:bitvector (bitvector 18))))

     (define-symbolic OPADDNSUB (bitvector 1))

     (define alu24b-module-expr
       (lr:hw-module-instance
        "ALU24B"
        (list
         (module-instance-port "OPADDNSUB" (lr:bv OPADDNSUB) 'input 1)
         (module-instance-port "OPCINSEL" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "SIGNEDIA" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "SIGNEDIB" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CE0" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CE1" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CE2" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CE3" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CLK0" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CLK1" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CLK2" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CLK3" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "RST0" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "RST1" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "RST2" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "RST3" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB0" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB1" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB2" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB3" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB4" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB5" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB6" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB7" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB8" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB9" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB10" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB11" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB12" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB13" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB14" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB15" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB16" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB17" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB18" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB19" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB20" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB21" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB22" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CFB23" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN0" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN1" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN2" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN3" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN4" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN5" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN6" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN7" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN8" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN9" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN10" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN11" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN12" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN13" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN14" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN15" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN16" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN17" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN18" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN19" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN20" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN21" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN22" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "CIN23" (lr:bv (bv 0 1)) 'input 1)
         (module-instance-port "MA0" (lr:extract (lr:integer 0) (lr:integer 0) alu-A) 'input 1)
         (module-instance-port "MA1" (lr:extract (lr:integer 1) (lr:integer 1) alu-A) 'input 1)
         (module-instance-port "MA2" (lr:extract (lr:integer 2) (lr:integer 2) alu-A) 'input 1)
         (module-instance-port "MA3" (lr:extract (lr:integer 3) (lr:integer 3) alu-A) 'input 1)
         (module-instance-port "MA4" (lr:extract (lr:integer 4) (lr:integer 4) alu-A) 'input 1)
         (module-instance-port "MA5" (lr:extract (lr:integer 5) (lr:integer 5) alu-A) 'input 1)
         (module-instance-port "MA6" (lr:extract (lr:integer 6) (lr:integer 6) alu-A) 'input 1)
         (module-instance-port "MA7" (lr:extract (lr:integer 7) (lr:integer 7) alu-A) 'input 1)
         (module-instance-port "MA8" (lr:extract (lr:integer 8) (lr:integer 8) alu-A) 'input 1)
         (module-instance-port "MA9" (lr:extract (lr:integer 9) (lr:integer 9) alu-A) 'input 1)
         (module-instance-port "MA10" (lr:extract (lr:integer 10) (lr:integer 10) alu-A) 'input 1)
         (module-instance-port "MA11" (lr:extract (lr:integer 11) (lr:integer 11) alu-A) 'input 1)
         (module-instance-port "MA12" (lr:extract (lr:integer 12) (lr:integer 12) alu-A) 'input 1)
         (module-instance-port "MA13" (lr:extract (lr:integer 13) (lr:integer 13) alu-A) 'input 1)
         (module-instance-port "MA14" (lr:extract (lr:integer 14) (lr:integer 14) alu-A) 'input 1)
         (module-instance-port "MA15" (lr:extract (lr:integer 15) (lr:integer 15) alu-A) 'input 1)
         (module-instance-port "MA16" (lr:extract (lr:integer 16) (lr:integer 16) alu-A) 'input 1)
         (module-instance-port "MA17" (lr:extract (lr:integer 17) (lr:integer 17) alu-A) 'input 1)
         (module-instance-port "MB0" (lr:extract (lr:integer 0) (lr:integer 0) alu-B) 'input 1)
         (module-instance-port "MB1" (lr:extract (lr:integer 1) (lr:integer 1) alu-B) 'input 1)
         (module-instance-port "MB2" (lr:extract (lr:integer 2) (lr:integer 2) alu-B) 'input 1)
         (module-instance-port "MB3" (lr:extract (lr:integer 3) (lr:integer 3) alu-B) 'input 1)
         (module-instance-port "MB4" (lr:extract (lr:integer 4) (lr:integer 4) alu-B) 'input 1)
         (module-instance-port "MB5" (lr:extract (lr:integer 5) (lr:integer 5) alu-B) 'input 1)
         (module-instance-port "MB6" (lr:extract (lr:integer 6) (lr:integer 6) alu-B) 'input 1)
         (module-instance-port "MB7" (lr:extract (lr:integer 7) (lr:integer 7) alu-B) 'input 1)
         (module-instance-port "MB8" (lr:extract (lr:integer 8) (lr:integer 8) alu-B) 'input 1)
         (module-instance-port "MB9" (lr:extract (lr:integer 9) (lr:integer 9) alu-B) 'input 1)
         (module-instance-port "MB10" (lr:extract (lr:integer 10) (lr:integer 10) alu-B) 'input 1)
         (module-instance-port "MB11" (lr:extract (lr:integer 11) (lr:integer 11) alu-B) 'input 1)
         (module-instance-port "MB12" (lr:extract (lr:integer 12) (lr:integer 12) alu-B) 'input 1)
         (module-instance-port "MB13" (lr:extract (lr:integer 13) (lr:integer 13) alu-B) 'input 1)
         (module-instance-port "MB14" (lr:extract (lr:integer 14) (lr:integer 14) alu-B) 'input 1)
         (module-instance-port "MB15" (lr:extract (lr:integer 15) (lr:integer 15) alu-B) 'input 1)
         (module-instance-port "MB16" (lr:extract (lr:integer 16) (lr:integer 16) alu-B) 'input 1)
         (module-instance-port "MB17" (lr:extract (lr:integer 17) (lr:integer 17) alu-B) 'input 1)
         (module-instance-port "R0" 'unused 'output 1)
         (module-instance-port "R1" 'unused 'output 1)
         (module-instance-port "R2" 'unused 'output 1)
         (module-instance-port "R3" 'unused 'output 1)
         (module-instance-port "R4" 'unused 'output 1)
         (module-instance-port "R5" 'unused 'output 1)
         (module-instance-port "R6" 'unused 'output 1)
         (module-instance-port "R7" 'unused 'output 1)
         (module-instance-port "R8" 'unused 'output 1)
         (module-instance-port "R9" 'unused 'output 1)
         (module-instance-port "R10" 'unused 'output 1)
         (module-instance-port "R11" 'unused 'output 1)
         (module-instance-port "R12" 'unused 'output 1)
         (module-instance-port "R13" 'unused 'output 1)
         (module-instance-port "R14" 'unused 'output 1)
         (module-instance-port "R15" 'unused 'output 1)
         (module-instance-port "R16" 'unused 'output 1)
         (module-instance-port "R17" 'unused 'output 1))
        (list (module-instance-parameter "REG_OUTPUT_CLK" (lr:bv (bv 0 5)))
              (module-instance-parameter "REG_OUTPUT_CE" (lr:bv (bv 1 5)))
              (module-instance-parameter "REG_OUTPUT_RST" (lr:bv (bv 2 5)))
              (module-instance-parameter "REG_OPCODE_0_CLK" (lr:bv (bv 0 5)))
              (module-instance-parameter "REG_OPCODE_0_CE" (lr:bv (bv 1 5)))
              (module-instance-parameter "REG_OPCODE_0_RST" (lr:bv (bv 2 5)))
              (module-instance-parameter "REG_OPCODE_1_CLK" (lr:bv (bv 0 5)))
              (module-instance-parameter "REG_OPCODE_1_CE" (lr:bv (bv 1 5)))
              (module-instance-parameter "REG_OPCODE_1_RST" (lr:bv (bv 2 5)))
              (module-instance-parameter "REG_INPUTCFB_CLK" (lr:bv (bv 0 5)))
              (module-instance-parameter "REG_INPUTCFB_CE" (lr:bv (bv 1 5)))
              (module-instance-parameter "REG_INPUTCFB_RST" (lr:bv (bv 2 5)))
              (module-instance-parameter "CLK0_DIV" (lr:bv (bv 5 5)))
              (module-instance-parameter "CLK1_DIV" (lr:bv (bv 5 5)))
              (module-instance-parameter "CLK2_DIV" (lr:bv (bv 5 5)))
              (module-instance-parameter "CLK3_DIV" (lr:bv (bv 5 5)))
              (module-instance-parameter "GSR" (lr:bv (bv 3 5)))
              (module-instance-parameter "RESETMODE" (lr:bv (bv 6 5))))
        ""))

     (define R-expr
       (lr:concat (lr:list (list (lr:hash-ref alu24b-module-expr 'R17)
                                 (lr:hash-ref alu24b-module-expr 'R16)
                                 (lr:hash-ref alu24b-module-expr 'R15)
                                 (lr:hash-ref alu24b-module-expr 'R14)
                                 (lr:hash-ref alu24b-module-expr 'R13)
                                 (lr:hash-ref alu24b-module-expr 'R12)
                                 (lr:hash-ref alu24b-module-expr 'R11)
                                 (lr:hash-ref alu24b-module-expr 'R10)
                                 (lr:hash-ref alu24b-module-expr 'R9)
                                 (lr:hash-ref alu24b-module-expr 'R8)
                                 (lr:hash-ref alu24b-module-expr 'R7)
                                 (lr:hash-ref alu24b-module-expr 'R6)
                                 (lr:hash-ref alu24b-module-expr 'R5)
                                 (lr:hash-ref alu24b-module-expr 'R4)
                                 (lr:hash-ref alu24b-module-expr 'R3)
                                 (lr:hash-ref alu24b-module-expr 'R2)
                                 (lr:hash-ref alu24b-module-expr 'R1)
                                 (lr:hash-ref alu24b-module-expr 'R0)))))

     (define lakeroad-expr (lr:extract (lr:integer (sub1 (bvlen bv-expr))) (lr:integer 0) R-expr))

     (interpret lakeroad-expr
                #:module-semantics (list (cons (cons "MULT18X18D" "") MULT18X18D)
                                         (cons (cons "ALU24B" "") lattice-ecp5-alu24b)))

     (define-symbolic unnamed-input-218 (bitvector 24))
     (rosette-synthesize bv-expr
                         lakeroad-expr
                         (append (symbolics bv-expr) (list unnamed-input-624))
                         #:module-semantics (list (cons (cons "MULT18X18D" "") MULT18X18D)
                                                  (cons (cons "ALU24B" "") lattice-ecp5-alu24b))))))

;;; Attempt to synthesize expression using a DSP.
(define (synthesize-xilinx-ultrascale-plus-dsp bv-expr)
  (let/ec
   return
   (begin

     ;;; Only supporting 4 inputs, a, b, c, d.
     (when (> (length (symbolics bv-expr)) 4)
       (return #f))

     ;;; Only supporting max bws of 16 on DSPs for now.
     (when (> (apply max (bvlen bv-expr) (map bvlen (symbolics bv-expr))) 16)
       (return #f))

     (define in0 (if (>= (length (symbolics bv-expr)) 1) (list-ref (symbolics bv-expr) 0) (bv 0 1)))
     (define in1 (if (>= (length (symbolics bv-expr)) 2) (list-ref (symbolics bv-expr) 1) (bv 0 1)))
     (define in2 (if (>= (length (symbolics bv-expr)) 3) (list-ref (symbolics bv-expr) 2) (bv 0 1)))
     (define in3 (if (>= (length (symbolics bv-expr)) 4) (list-ref (symbolics bv-expr) 3) (bv 0 1)))

     (define A
       (lr:zero-extend (lr:bv (choose in0 in1 in2 in3 (bv 0 1) (bv 1 1)))
                       (lr:bitvector (bitvector 30))))
     (define B
       (lr:zero-extend (lr:bv (choose in0 in1 in2 in3 (bv 0 1) (bv 1 1)))
                       (lr:bitvector (bitvector 18))))
     (define C
       (lr:zero-extend (lr:bv (choose in0 in1 in2 in3 (bv 0 1) (bv 1 1)))
                       (lr:bitvector (bitvector 48))))
     (define D
       (lr:zero-extend (lr:bv (choose in0 in1 in2 in3 (bv 0 1) (bv 1 1)))
                       (lr:bitvector (bitvector 27))))

     (define-symbolic ACASCREG (bitvector 32))
     (define-symbolic ACIN (bitvector 30))
     (define-symbolic ADREG (bitvector 32))
     (define-symbolic ALUMODE (bitvector 4))
     (define-symbolic ALUMODEREG (bitvector 32))
     (define-symbolic AMULTSEL (bitvector 5))
     (define-symbolic AREG (bitvector 32))
     (define-symbolic AUTORESET_PATDET (bitvector 5))
     (define-symbolic AUTORESET_PRIORITY (bitvector 5))
     (define-symbolic A_INPUT (bitvector 5))
     (define-symbolic BCASCREG (bitvector 32))
     (define-symbolic BCIN (bitvector 18))
     (define-symbolic BMULTSEL (bitvector 5))
     (define-symbolic BREG (bitvector 32))
     (define-symbolic B_INPUT (bitvector 5))
     (define-symbolic CARRYCASCIN (bitvector 1))
     (define-symbolic CARRYIN (bitvector 1))
     (define-symbolic CARRYINREG (bitvector 32))
     (define-symbolic CARRYINSEL (bitvector 3))
     (define-symbolic CARRYINSELREG (bitvector 32))
     (define-symbolic CEA1 (bitvector 1))
     (define-symbolic CEA2 (bitvector 1))
     (define-symbolic CEAD (bitvector 1))
     (define-symbolic CEALUMODE (bitvector 1))
     (define-symbolic CEB1 (bitvector 1))
     (define-symbolic CEB2 (bitvector 1))
     (define-symbolic CEC (bitvector 1))
     (define-symbolic CECARRYIN (bitvector 1))
     (define-symbolic CECTRL (bitvector 1))
     (define-symbolic CED (bitvector 1))
     (define-symbolic CEINMODE (bitvector 1))
     (define-symbolic CEM (bitvector 1))
     (define-symbolic CEP (bitvector 1))
     (define-symbolic CLK (bitvector 1))
     (define-symbolic CREG (bitvector 32))
     (define-symbolic DREG (bitvector 32))
     (define-symbolic INMODE (bitvector 5))
     (define-symbolic INMODEREG (bitvector 32))
     (define-symbolic IS_ALUMODE_INVERTED (bitvector 4))
     (define-symbolic IS_CARRYIN_INVERTED (bitvector 1))
     (define-symbolic IS_CLK_INVERTED (bitvector 1))
     (define-symbolic IS_INMODE_INVERTED (bitvector 5))
     (define-symbolic IS_OPMODE_INVERTED (bitvector 9))
     (define-symbolic IS_RSTALLCARRYIN_INVERTED (bitvector 1))
     (define-symbolic IS_RSTALUMODE_INVERTED (bitvector 1))
     (define-symbolic IS_RSTA_INVERTED (bitvector 1))
     (define-symbolic IS_RSTB_INVERTED (bitvector 1))
     (define-symbolic IS_RSTCTRL_INVERTED (bitvector 1))
     (define-symbolic IS_RSTC_INVERTED (bitvector 1))
     (define-symbolic IS_RSTD_INVERTED (bitvector 1))
     (define-symbolic IS_RSTINMODE_INVERTED (bitvector 1))
     (define-symbolic IS_RSTM_INVERTED (bitvector 1))
     (define-symbolic IS_RSTP_INVERTED (bitvector 1))
     (define-symbolic MASK (bitvector 48))
     (define-symbolic MREG (bitvector 32))
     (define-symbolic MULTSIGNIN (bitvector 1))
     (define-symbolic OPMODE (bitvector 9))
     (define-symbolic OPMODEREG (bitvector 32))
     (define-symbolic PATTERN (bitvector 48))
     (define-symbolic PCIN (bitvector 48))
     (define-symbolic PREADDINSEL (bitvector 5))
     (define-symbolic PREG (bitvector 32))
     (define-symbolic RND (bitvector 48))
     (define-symbolic RSTA (bitvector 1))
     (define-symbolic RSTALLCARRYIN (bitvector 1))
     (define-symbolic RSTALUMODE (bitvector 1))
     (define-symbolic RSTB (bitvector 1))
     (define-symbolic RSTC (bitvector 1))
     (define-symbolic RSTCTRL (bitvector 1))
     (define-symbolic RSTD (bitvector 1))
     (define-symbolic RSTINMODE (bitvector 1))
     (define-symbolic RSTM (bitvector 1))
     (define-symbolic RSTP (bitvector 1))
     (define-symbolic SEL_MASK (bitvector 5))
     (define-symbolic SEL_PATTERN (bitvector 5))
     (define-symbolic USE_MULT (bitvector 5))
     (define-symbolic USE_PATTERN_DETECT (bitvector 5))
     (define-symbolic USE_SIMD (bitvector 5))
     (define-symbolic USE_WIDEXOR (bitvector 5))
     (define-symbolic XORSIMD (bitvector 5))
     (define-symbolic unnamed-input-331 (bitvector 48))
     (define-symbolic unnamed-input-488 (bitvector 48))
     (define-symbolic unnamed-input-750 (bitvector 48))
     (define-symbolic unnamed-input-806 (bitvector 48))
     (define-symbolic unnamed-input-850 (bitvector 1))

     (define lakeroad-expr
       (lr:extract (lr:integer (sub1 (bvlen bv-expr)))
                   (lr:integer 0)
                   (lr:first (ultrascale-plus-dsp48e2 A
                                                      (lr:bv ACASCREG)
                                                      (lr:bv ACIN)
                                                      (lr:bv ADREG)
                                                      (lr:bv ALUMODE)
                                                      (lr:bv ALUMODEREG)
                                                      (lr:bv AMULTSEL)
                                                      (lr:bv AREG)
                                                      (lr:bv AUTORESET_PATDET)
                                                      (lr:bv AUTORESET_PRIORITY)
                                                      (lr:bv A_INPUT)
                                                      B
                                                      (lr:bv BCASCREG)
                                                      (lr:bv BCIN)
                                                      (lr:bv BMULTSEL)
                                                      (lr:bv BREG)
                                                      (lr:bv B_INPUT)
                                                      C
                                                      (lr:bv CARRYCASCIN)
                                                      (lr:bv CARRYIN)
                                                      (lr:bv CARRYINREG)
                                                      (lr:bv CARRYINSEL)
                                                      (lr:bv CARRYINSELREG)
                                                      (lr:bv CEA1)
                                                      (lr:bv CEA2)
                                                      (lr:bv CEAD)
                                                      (lr:bv CEALUMODE)
                                                      (lr:bv CEB1)
                                                      (lr:bv CEB2)
                                                      (lr:bv CEC)
                                                      (lr:bv CECARRYIN)
                                                      (lr:bv CECTRL)
                                                      (lr:bv CED)
                                                      (lr:bv CEINMODE)
                                                      (lr:bv CEM)
                                                      (lr:bv CEP)
                                                      (lr:bv CLK)
                                                      (lr:bv CREG)
                                                      D
                                                      (lr:bv DREG)
                                                      (lr:bv INMODE)
                                                      (lr:bv INMODEREG)
                                                      (lr:bv IS_ALUMODE_INVERTED)
                                                      (lr:bv IS_CARRYIN_INVERTED)
                                                      (lr:bv IS_CLK_INVERTED)
                                                      (lr:bv IS_INMODE_INVERTED)
                                                      (lr:bv IS_OPMODE_INVERTED)
                                                      (lr:bv IS_RSTALLCARRYIN_INVERTED)
                                                      (lr:bv IS_RSTALUMODE_INVERTED)
                                                      (lr:bv IS_RSTA_INVERTED)
                                                      (lr:bv IS_RSTB_INVERTED)
                                                      (lr:bv IS_RSTCTRL_INVERTED)
                                                      (lr:bv IS_RSTC_INVERTED)
                                                      (lr:bv IS_RSTD_INVERTED)
                                                      (lr:bv IS_RSTINMODE_INVERTED)
                                                      (lr:bv IS_RSTM_INVERTED)
                                                      (lr:bv IS_RSTP_INVERTED)
                                                      (lr:bv MASK)
                                                      (lr:bv MREG)
                                                      (lr:bv MULTSIGNIN)
                                                      (lr:bv OPMODE)
                                                      (lr:bv OPMODEREG)
                                                      (lr:bv PATTERN)
                                                      (lr:bv PCIN)
                                                      (lr:bv PREADDINSEL)
                                                      (lr:bv PREG)
                                                      (lr:bv RND)
                                                      (lr:bv RSTA)
                                                      (lr:bv RSTALLCARRYIN)
                                                      (lr:bv RSTALUMODE)
                                                      (lr:bv RSTB)
                                                      (lr:bv RSTC)
                                                      (lr:bv RSTCTRL)
                                                      (lr:bv RSTD)
                                                      (lr:bv RSTINMODE)
                                                      (lr:bv RSTM)
                                                      (lr:bv RSTP)
                                                      (lr:bv SEL_MASK)
                                                      (lr:bv SEL_PATTERN)
                                                      (lr:bv USE_MULT)
                                                      (lr:bv USE_PATTERN_DETECT)
                                                      (lr:bv USE_SIMD)
                                                      (lr:bv USE_WIDEXOR)
                                                      (lr:bv XORSIMD)
                                                      (lr:bv unnamed-input-331)
                                                      (lr:bv unnamed-input-488)
                                                      (lr:bv unnamed-input-750)
                                                      (lr:bv unnamed-input-806)
                                                      (lr:bv unnamed-input-850)))))

     ;;; For some reason I can't get this working for the full
     ;;; bitwidth. I expect it to work for 26x17 (because we do
     ;;; unsigned mult, but DSP is signed, so we can't use all
     ;;; 27/18 bits.) 16x16 seems to be the most I can get.
     (assume (bvult (interpret A) (bv (expt 2 16) 30)))
     (assume (bvult (interpret B) (bv (expt 2 16) 18)))

     ;;; Force to DYNAMIC to avoid:
     ;;;
     ;;; OPMODE Input Warning : [Unisim DSP48E2-8] The OPMODE[1:0] (11) is
     ;;; invalid when using attributes USE_MULT = MULTIPLY and (A, B and
     ;;; M) or (A, B and P) or (M and P) are not REGISTERED at time 0.000
     ;;; ns. Please set USE_MULT to either NONE or DYNAMIC or REGISTER one
     ;;; of each group. (A or B) and (M or P) will satisfy the
     ;;; requirement. Instance TOP.top.DSP48E2_0
     (assert (bveq USE_MULT (bv 18 5)))

     ;;; ERROR: [DRC DSPS-2] Invalid PCIN Connection for OPMODE value: DSP48E2 cell DSP48E2_0 has
     ;;; OPMODE[5:4] set to 01 which uses the input of the PCIN bus for its computation, however the
     ;;; PCIN input is not properly connected to another DSP48E2 Block.  Please either correct the
     ;;; connectivity or OPMODE value to allow for proper implementation.
     ;;;
     ;;; TODO(@gussmith23): deal with this when we support multiple DSPs.
     (assert (not (bveq (extract 5 4 OPMODE) (bv #b01 2))))

     (assert (bvzero? CARRYIN))
     (assert (bvzero? CARRYCASCIN))

     (assert (bvzero? CLK))

     (assert (bvzero? PCIN))
     (assert (bvzero? ACIN))
     (assert (bvzero? BCIN))
     ;;;(assert (bvzero? MASK))
     ;;;(assert (bvzero? PATTERN))
     ;;;(assert (bvzero? RND))
     (assert (bvzero? RSTA))
     (assert (bvzero? RSTALLCARRYIN))
     (assert (bvzero? RSTALUMODE))
     (assert (bvzero? RSTB))
     (assert (bvzero? RSTC))
     (assert (bvzero? RSTCTRL))
     (assert (bvzero? RSTD))
     (assert (bvzero? RSTINMODE))
     (assert (bvzero? RSTM))
     (assert (bvzero? RSTP))
     (assert (bvzero? AREG))
     (assert (bvzero? ADREG))
     (assert (bvzero? ACASCREG))
     (assert (bvzero? BREG))
     (assert (bvzero? BCASCREG))
     (assert (bvzero? CREG))
     (assert (bvzero? DREG))
     (assert (bvzero? PREG))
     (assert (bvzero? MREG))
     (assert (bvzero? INMODEREG))
     (assert (bvzero? OPMODEREG))
     (assert (bvzero? ALUMODEREG))
     (assert (bvzero? CARRYINREG))
     (assert (bvzero? CARRYINSELREG))
     (assert (bvzero? CARRYINSEL))
     (assert (bvzero? MULTSIGNIN))

     (assert (bvzero? IS_ALUMODE_INVERTED))
     (assert (bvzero? IS_CARRYIN_INVERTED))
     (assert (bvzero? IS_CLK_INVERTED))
     (assert (bvzero? IS_INMODE_INVERTED))
     (assert (bvzero? IS_OPMODE_INVERTED))
     (assert (bvzero? IS_RSTALLCARRYIN_INVERTED))
     (assert (bvzero? IS_RSTALUMODE_INVERTED))
     (assert (bvzero? IS_RSTA_INVERTED))
     (assert (bvzero? IS_RSTB_INVERTED))
     (assert (bvzero? IS_RSTCTRL_INVERTED))
     (assert (bvzero? IS_RSTC_INVERTED))
     (assert (bvzero? IS_RSTD_INVERTED))
     (assert (bvzero? IS_RSTINMODE_INVERTED))
     (assert (bvzero? IS_RSTM_INVERTED))
     (assert (bvzero? IS_RSTP_INVERTED))

     (assert (not (bvzero? CEA1)))
     (assert (not (bvzero? CEA2)))
     (assert (not (bvzero? CEAD)))
     (assert (not (bvzero? CEALUMODE)))
     (assert (not (bvzero? CEB1)))
     (assert (not (bvzero? CEB2)))
     (assert (not (bvzero? CEC)))
     (assert (not (bvzero? CECARRYIN)))
     (assert (not (bvzero? CECTRL)))
     (assert (not (bvzero? CED)))
     (assert (not (bvzero? CEINMODE)))
     (assert (not (bvzero? CEM)))
     (assert (not (bvzero? CEP)))

     ;;; Forcing these to zero to see what happens. If stuff starts to break, remove these
     ;;; assumes.
     (assume (bvzero? unnamed-input-331))
     (assume (bvzero? unnamed-input-488))
     (assume (bvzero? unnamed-input-750))
     (assume (bvzero? unnamed-input-806))
     (assume (bvzero? unnamed-input-850))

     (rosette-synthesize bv-expr
                         lakeroad-expr
                         (append (symbolics bv-expr)
                                 (list unnamed-input-331
                                       unnamed-input-488
                                       unnamed-input-750
                                       unnamed-input-806
                                       unnamed-input-850))))))

(module+ test
  (simple-test synthesize-xilinx-ultrascale-plus-dsp (define-symbolic a b (bitvector 8)) (bvmul a b)))

;;; Throw the kitchen sink at it -- try synthesizing with full CLBs, using LUT6_2s and carry chains.
;;; This is our original synthesis implementation, and remains our fallback.
(define (synthesize-xilinx-ultrascale-plus-impl-kitchen-sink bv-expr)
  (when (> (length (symbolics bv-expr)) 6)
    (error "Only 6 inputs supported"))

  ;;; Bitwidth of the output.
  (define out-bw (bvlen bv-expr))
  (when (not (concrete? out-bw))
    (error "Out bitwidth must be statically known."))

  ;;; Max bitwidth of any input.
  ;;; If there are no symbolic vars in the expression, default to the bitwidth of the output.
  (define max-input-bw
    (if (empty? (symbolics bv-expr)) out-bw (apply max (map bvlen (symbolics bv-expr)))))
  (when (not (concrete? max-input-bw))
    (error "Input bitwidths must be statically known."))

  ;;; Number of CLBs needed to take all of the input bits, assuming each CLB gets at most 8 bits from
  ;;; any one input.
  (define num-clbs (ceiling (/ max-input-bw 8)))

  ;;; The bitwidth that all logical inputs should be extended to.
  (define logical-input-width (* 8 num-clbs))

  ;;; Form the list of logical inputs, and pad up to make sure there are 6.
  ;;; We also zero-extend each input so that it is the correct size.
  (define logical-inputs
    (map (lambda (v) (zero-extend v (bitvector logical-input-width)))
         (append (symbolics bv-expr)
                 (make-list (- 6 (length (symbolics bv-expr))) (bvnot (bv 0 logical-input-width))))))

  (define physical-inputs (logical-to-physical-mapping (ltop-bitwise) logical-inputs))

  ;;; Split the physical inputs into groups, grouped by LUT.
  (define physical-inputs-per-clb
    (for/list ([clb-i (range num-clbs)])
      (lr:take (lr:drop physical-inputs (* 8 clb-i)) 8)))

  ;;; Returns (list logical-outputs cout).
  (define (clb cin lutmem mux physical-inputs)
    (let* ([clb-out (ultrascale-plus-clb cin
                                         lutmem
                                         lutmem
                                         lutmem
                                         lutmem
                                         lutmem
                                         lutmem
                                         lutmem
                                         lutmem
                                         mux
                                         mux
                                         mux
                                         mux
                                         mux
                                         mux
                                         mux
                                         mux
                                         physical-inputs)])
      (list (lr:take clb-out 8) (lr:list-ref clb-out 8))))

  (match-define (list physical-outputs cout)
    (let ([cin (?? (bitvector 1))] [lutmem (?? (bitvector 64))] [mux (?? (bitvector 2))])
      (foldl
       (lambda (physical-inputs previous-out)
         (match-let* ([(list accumulated-physical-output previous-cout) previous-out]
                      [(list this-clb-physical-outputs this-cout)
                       (clb previous-cout lutmem mux physical-inputs)]
                      [accumulated-physical-output (if (equal? accumulated-physical-output 'first)
                                                       this-clb-physical-outputs
                                                       (lr:append (list accumulated-physical-output
                                                                        this-clb-physical-outputs)))])
           (list accumulated-physical-output this-cout)))
       ;;; It would be cleaner if we could use (bv 0 0) instead of 'first, but it's not allowed.
       (list 'first cin)
       physical-inputs-per-clb)))

  (define lakeroad-expr
    (lr:extract (lr:integer (sub1 out-bw))
                (lr:integer 0)
                (lr:first (physical-to-logical-mapping (choose (ptol-bitwise) (ptol-bitwise-reverse))
                                                       physical-outputs))))
  (rosette-synthesize bv-expr lakeroad-expr (symbolics bv-expr)))

;;; Synthesizes a lattice expression using ccu2c modules.
;;; This template is designed for use with simple comparison operators which
;;; use (n / 2) ccu2c modules, where n is the bitwidth of the inputs
;;; The type of the output of the programs produced by this template is always a 1-bit bitvector.
(define (synthesize-lattice-ecp5-for-ccu2c bv-expr)
  (when (> (length (symbolics bv-expr)) 4)
    (error "Only 4 inputs supported"))

  (define out-bw (bvlen bv-expr))
  (when (not (concrete? out-bw))
    (error "Out bitwidth must be statically known."))

  ;;; Max bitwidth of any input.
  ;;; If there are no symbolic vars in the expression, default to the bitwidth of the output.
  (define max-input-bw
    (if (empty? (symbolics bv-expr)) out-bw (apply max (map bvlen (symbolics bv-expr)))))
  (when (not (concrete? max-input-bw))
    (error "Input bitwidths must be statically known."))

  ;;; Number of ccu2c modules needed to take all of the input bits,
  ;;; assuming each CLB gets at most 8 bits from any one input.
  (define num-mods (ceiling (/ max-input-bw 2)))

  ;;; The bitwidth that all logical inputs should be extended to.
  (define logical-input-width (* 2 num-mods))
  (define logical-inputs (get-lattice-logical-inputs bv-expr #:expected-bw logical-input-width))

  ;;; Split the logical inputs into groups, grouped by CCU2C
  (define logical-inputs-per-ccu2c
    (for/list ([ccu2c-i (range num-mods)])
      (for/list ([logical-input logical-inputs])
        (lr:extract (lr:integer (sub1 (* 2 (add1 ccu2c-i))))
                    (lr:integer (* 2 ccu2c-i))
                    logical-input))))

  (define lutmem (?? (bitvector 16)))
  (define initial-cin (?? (bitvector 1)))

  (define lakeroad-expr
    (foldl (lambda (logical-inputs previous-cout)
             (match-let* ([(list this-ccu2c-physical-outputs this-cout)
                           (let ([ccu2c-out (make-lattice-ccu2c-expr
                                             #:inputs (logical-to-physical-mapping
                                                       (choose (ltop-bitwise) (ltop-bitwise-reverse))
                                                       (lr:list logical-inputs))
                                             #:CIN previous-cout
                                             #:INIT0 (lr:bv lutmem)
                                             #:INIT1 (lr:bv lutmem))])

                             (list (lr:take ccu2c-out (lr:integer 2))
                                   (lr:list-ref ccu2c-out (lr:integer 2))))])
               this-cout))
           (lr:bv initial-cin)
           logical-inputs-per-ccu2c))
  (rosette-synthesize bv-expr lakeroad-expr (symbolics bv-expr)))

;;; Synthesizes a lattice expression using multiple ccu2c modules.
;;; This differs from the single ccu2c module template in that this template uses
;;; three ccu2c modules for every 2 bits of input, in order to implement more
;;; complex comparison operators (e.g. >=, etc.)
;;; The type of the output of the programs produced by this template is always a 1-bit bitvector.
(define (synthesize-lattice-ecp5-for-ccu2c-tri bv-expr)
  (when (> (length (symbolics bv-expr)) 4)
    (error "Only 4 inputs supported"))

  (define out-bw (bvlen bv-expr))
  (when (not (concrete? out-bw))
    (error "Out bitwidth must be statically known."))

  ;;; Max bitwidth of any input.
  ;;; If there are no symbolic vars in the expression, default to the bitwidth of the output.
  (define max-input-bw
    (if (empty? (symbolics bv-expr)) out-bw (apply max (map bvlen (symbolics bv-expr)))))
  (when (not (concrete? max-input-bw))
    (error "Input bitwidths must be statically known."))

  ;;; Number of ccu2c modules needed to take all of the input bits,
  ;;; assuming each CLB gets at most 8 bits from any one input.
  (define num-mods (ceiling (/ max-input-bw 2)))

  ;;; The bitwidth that all logical inputs should be extended to.
  (define logical-input-width (* 2 num-mods))
  (define logical-inputs (get-lattice-logical-inputs bv-expr #:expected-bw logical-input-width))

  ;;; Split the logical inputs into groups, grouped by CCU2C
  (define logical-inputs-per-ccu2c
    (for/list ([ccu2c-i (range num-mods)])
      (for/list ([logical-input logical-inputs])
        (lr:extract (lr:integer (sub1 (* 2 (add1 ccu2c-i))))
                    (lr:integer (* 2 ccu2c-i))
                    logical-input))))

  (match-define (list phys-0 cout-0)
    (let ([cin (?? (bitvector 1))] [lutmem (?? (bitvector 16))])
      (foldl
       (lambda (logical-inputs previous-out)
         (match-let* ([(list acc-phys-out previous-cout) previous-out]
                      [(list this-ccu2c-physical-outputs this-cout)
                       (let ([ccu2c-out (make-lattice-ccu2c-expr
                                         #:inputs (logical-to-physical-mapping
                                                   (choose (ltop-bitwise) (ltop-bitwise-reverse))
                                                   logical-inputs)
                                         #:CIN previous-cout
                                         #:INIT0 lutmem
                                         #:INIT1 lutmem)])

                         (list (lr:take ccu2c-out 2) (lr:list-ref ccu2c-out 2)))]
                      [acc-phys-out (if (equal? acc-phys-out 'first)
                                        this-ccu2c-physical-outputs
                                        (lr:append (list acc-phys-out this-ccu2c-physical-outputs)))])
           (list acc-phys-out this-cout)))
       (list 'first cin)
       logical-inputs-per-ccu2c)))

  (match-define (list phys-1 cout-1)
    (let ([cin (?? (bitvector 1))] [lutmem (?? (bitvector 16))])
      (foldl
       (lambda (logical-inputs previous-out)
         (match-let* ([(list acc-phys-out previous-cout) previous-out]
                      [(list this-ccu2c-physical-outputs this-cout)
                       (let ([ccu2c-out (make-lattice-ccu2c-expr
                                         #:inputs (logical-to-physical-mapping
                                                   (choose (ltop-bitwise) (ltop-bitwise-reverse))
                                                   logical-inputs)
                                         #:CIN previous-cout
                                         #:INIT0 lutmem
                                         #:INIT1 lutmem)])

                         (list (lr:take ccu2c-out 2) (lr:list-ref ccu2c-out 2)))]
                      [acc-phys-out (if (equal? acc-phys-out 'first)
                                        this-ccu2c-physical-outputs
                                        (lr:append (list acc-phys-out this-ccu2c-physical-outputs)))])
           (list acc-phys-out this-cout)))
       (list 'first cin)
       logical-inputs-per-ccu2c)))

  ;;; Our third set of ccu2c modules should be structured as follows:
  ;;; ccu2c-3.0 takes in (1 1 ccu2c-0.0 ccu2c-1.0)
  ;;; ccu2c-3.1 takes in (1 1 ccu2c-0.1 ccu2c-1.1)
  ;;; ...
  ;;; ccu2c-3.n takes in (1 1 ccu2c-0.n ccu2c-1.n)
  ;;; The key insight here is that regardless of how many inputs we
  ;;; take in at first, the inputs to this ccu2c look the same every time

  (define lakeroad-expr
    (let ([inputs (for/list ([ccu2c-i (range num-mods)])
                    (list (lr:concat (list (bv #b11 2)
                                           (lr:concat (list (lr:list-ref phys-0 (* 2 ccu2c-i))
                                                            (lr:list-ref phys-1 (* 2 ccu2c-i))))))
                          (lr:concat
                           (list (bv #b11 2)
                                 (lr:concat
                                  (list (lr:list-ref phys-0 (sub1 (* 2 (add1 ccu2c-i))))
                                        (lr:list-ref phys-1 (sub1 (* 2 (add1 ccu2c-i))))))))))]
          [cin (?? (bitvector 1))]
          [lutmem (?? (bitvector 16))])
      (foldl (lambda (gis previous-cout)
               (match-let* ([(list this-ccu2c-physical-outputs this-cout)
                             (let ([ccu2c-out (make-lattice-ccu2c-expr #:inputs gis
                                                                       #:CIN previous-cout
                                                                       #:INIT0 lutmem
                                                                       #:INIT1 lutmem)])

                               (list (lr:take ccu2c-out 2) (lr:list-ref ccu2c-out 2)))])
                 this-cout))
             cin
             inputs)))

  (rosette-synthesize bv-expr lakeroad-expr (symbolics bv-expr)))

(define (synthesize-lattice-ecp5-for-ripple-pfu bv-expr)

  (when (> (length (symbolics bv-expr)) 4)
    (error "Only 4 inputs supported"))

  (define out-bw (bvlen bv-expr))
  (when (not (concrete? out-bw))
    (error "Out bitwidth must be statically known."))

  ;;; Max bitwidth of any input.
  ;;; If there are no symbolic vars in the expression, default to the bitwidth of the output.
  (define max-input-bw
    (if (empty? (symbolics bv-expr)) out-bw (apply max (map bvlen (symbolics bv-expr)))))
  (when (not (concrete? max-input-bw))
    (error "Input bitwidths must be statically known."))

  ;;; Number of PFUs needed to take all of the input bits, assuming each CLB gets at most 8 bits from
  ;;; any one input.
  (define num-pfus (ceiling (/ max-input-bw 8)))

  ;;; The bitwidth that all logical inputs should be extended to.
  (define logical-input-width (* 8 num-pfus))
  (define logical-inputs (get-lattice-logical-inputs bv-expr #:expected-bw logical-input-width))

  ;;; Split the logical inputs into groups, grouped by PFU.
  (define logical-inputs-per-pfu
    (for/list ([pfu-i (range num-pfus)])
      (for/list ([logical-input logical-inputs])
        (lr:extract (lr:integer (sub1 (* 8 (add1 pfu-i)))) (lr:integer (* 8 pfu-i)) logical-input))))

  (match-define (list physical-output cout)
    (let ([cin (?? (bitvector 1))] [lutmem (?? (bitvector 16))])
      (foldl (lambda (logical-inputs previous-out)
               (match-let*
                   ([(list accumulated-physical-output previous-cout) previous-out]
                    [(list this-pfu-physical-outputs this-cout)
                     (let ([pfu-out (make-lattice-ripple-pfu-expr
                                     #:out-bw logical-input-width
                                     #:inputs (lr:list logical-inputs)
                                     #:CIN previous-cout
                                     #:INIT0 (lr:bv lutmem)
                                     #:INIT1 (lr:bv lutmem)
                                     #:INIT2 (lr:bv lutmem)
                                     #:INIT3 (lr:bv lutmem)
                                     #:INIT4 (lr:bv lutmem)
                                     #:INIT5 (lr:bv lutmem)
                                     #:INIT6 (lr:bv lutmem)
                                     #:INIT7 (lr:bv lutmem)
                                     #:MAPPING (choose (ltop-bitwise) (ltop-bitwise-reverse)))])

                       (list (lr:take pfu-out (lr:integer 8)) (lr:list-ref pfu-out (lr:integer 8))))]
                    [accumulated-physical-output
                     (if (equal? accumulated-physical-output 'first)
                         this-pfu-physical-outputs
                         (lr:append (lr:list (list accumulated-physical-output
                                                   this-pfu-physical-outputs))))])
                 (list accumulated-physical-output this-cout)))
             ;;; It would be cleaner if we could use (bv 0 0) instead of 'first, but it's not allowed.
             (list 'first (lr:bv cin))
             logical-inputs-per-pfu)))

  (define lakeroad-expr
    (lr:extract (lr:integer (sub1 out-bw))
                (lr:integer 0)
                (lr:first (physical-to-logical-mapping (choose (ptol-bitwise) (ptol-bitwise-reverse))
                                                       physical-output))))
  (rosette-synthesize bv-expr lakeroad-expr (symbolics bv-expr)))

;;; Returns a concrete Lakeroad expression, or #f if synthesis failed.
(define (rosette-synthesize bv-expr
                            lakeroad-expr
                            inputs
                            #:multi-cycle [multi-cycle #f]
                            #:module-semantics [module-semantics '()])

  (define soln
    (synthesize
     #:forall inputs
     #:guarantee
     (assert (bveq bv-expr (interpret lakeroad-expr #:module-semantics module-semantics)))))

  (if (sat? soln)
      (evaluate
       lakeroad-expr
       ;;; Complete the solution: fill in any symbolic values that *aren't* the logical inputs.
       (complete-solution soln
                          (set->list (set-subtract (list->set (symbolics lakeroad-expr))
                                                   (list->set (symbolics bv-expr))))))
      #f))

(define (synthesize-lattice-ecp5-for-pfu bv-expr)

  (when (> (length (symbolics bv-expr)) 4)
    (error "Only 4 inputs supported"))

  (define out-bw (bvlen bv-expr))
  (when (not (concrete? out-bw))
    (error "Out bitwidth must be statically known."))

  ;;; Max bitwidth of any input.
  ;;; If there are no symbolic vars in the expression, default to the bitwidth of the output.
  (define max-input-bw
    (if (empty? (symbolics bv-expr)) out-bw (apply max (map bvlen (symbolics bv-expr)))))
  (when (not (concrete? max-input-bw))
    (error "Input bitwidths must be statically known."))

  ;;; Number of PFUs needed to take all of the input bits, assuming each CLB gets at most 8 bits from
  ;;; any one input.
  (define num-pfus (ceiling (/ max-input-bw 8)))

  ;;; The bitwidth that all logical inputs should be extended to.
  (define logical-input-width (* 8 num-pfus))
  (define logical-inputs (get-lattice-logical-inputs bv-expr #:expected-bw logical-input-width))

  ;;; Split the logical inputs into groups, grouped by PFU.
  (define logical-inputs-per-pfu
    (for/list ([pfu-i (range num-pfus)])
      (for/list ([logical-input logical-inputs])
        (lr:extract (lr:integer (sub1 (* 8 (add1 pfu-i)))) (lr:integer (* 8 pfu-i)) logical-input))))

  (define logical-output
    (let ([cin (?? (bitvector 1))] [lutmem (?? (bitvector 16))])
      (foldl
       (lambda (logical-inputs previous-out)
         (match-let* ([accumulated-logical-output previous-out]
                      [this-pfu-logical-outputs
                       (let ([pfu-out (make-lattice-pfu-expr (lr:list logical-inputs))])
                         (lr:first (physical-to-logical-mapping (ptol-bitwise)
                                                                (lr:take pfu-out (lr:integer 8)))))]
                      [accumulated-logical-output
                       (if (equal? accumulated-logical-output 'first-iter)
                           this-pfu-logical-outputs
                           (lr:concat (lr:list (list this-pfu-logical-outputs
                                                     accumulated-logical-output))))])
           accumulated-logical-output))
       ;;; It would be cleaner if we could use (bv 0 0) instead of 'first, but it's not allowed.
       'first-iter
       logical-inputs-per-pfu)))

  (define lakeroad-expr (lr:extract (lr:integer (sub1 out-bw)) (lr:integer 0) logical-output))

  (rosette-synthesize bv-expr lakeroad-expr (symbolics bv-expr)))

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
    (lr:first (physical-to-logical-mapping
               (ptol-bitwise)
               (logical-to-physical-mapping
                (choose (ltop-bitwise)
                        (ltop-bitwise-reverse)
                        (ltop-shift shift-by)
                        (ltop-constant (lr:bv (??* (bitvector bitwidth)))))
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
  (rosette-synthesize bv-expr lakeroad-expr (symbolics bv-expr)))

(module+ test
  (require rosette/solver/smt/boolector
           rosette
           rackunit)
  (current-solver (boolector))
  (with-terms
   (begin
     (define-symbolic a (bitvector 4))
     (let ([lrexpr (synthesize-wire (bvshl a (bv 0 4)))]) (check-not-false lrexpr))
     (let ([lrexpr (synthesize-wire (bvshl a (bv 1 4)))]) (check-not-false lrexpr))
     (let ([lrexpr (synthesize-wire (bvshl a (bv 2 4)))]) (check-not-false lrexpr))
     (let ([lrexpr (synthesize-wire (bvshl a (bv 3 4)))]) (check-not-false lrexpr))
     (let ([lrexpr (synthesize-wire (bvlshr a (bv 0 4)))]) (check-not-false lrexpr))
     (let ([lrexpr (synthesize-wire (bvlshr a (bv 1 4)))]) (check-not-false lrexpr))
     (let ([lrexpr (synthesize-wire (bvlshr a (bv 2 4)))]) (check-not-false lrexpr))
     (let ([lrexpr (synthesize-wire (bvlshr a (bv 3 4)))]) (check-not-false lrexpr))
     (let ([lrexpr (synthesize-wire (bvlshr a (bv 4 4)) #:shift-by 4)]) (check-not-false lrexpr))
     (let ([lrexpr (synthesize-wire (bvlshr a (bv 5 4)))]) (check-not-false lrexpr))
     (let ([lrexpr (synthesize-wire (bv #xff 8))]) (check-not-false lrexpr))
     (let ([lrexpr (synthesize-wire (bv #x12 8))]) (check-not-false lrexpr))
     (let ([lrexpr (synthesize-wire (bv #x123456789abcdef0123456789abcdef0 128))])
       (check-not-false lrexpr)))))

(module+ test
  (require rackunit)
  (test-case "lattice dsp add"
             (begin
               (check-true
                (normal? (with-vc (with-terms (begin
                                                (define-symbolic a b (bitvector 18))
                                                (check-not-equal? #f
                                                                  (synthesize-lattice-ecp5-dsp
                                                                   (bvadd a b))))))))))
  (test-case "lattice dsp mul"
             (begin
               (check-true
                (normal? (with-vc (with-terms (begin
                                                (define-symbolic a b (bitvector 18))
                                                (check-not-equal? #f
                                                                  (synthesize-lattice-ecp5-dsp
                                                                   (bvmul a b))))))))))
  (test-case "lattice dsp mul-add"
             (begin
               (check-true (normal? (with-vc (with-terms (begin
                                                           (define-symbolic a b c (bitvector 18))
                                                           (check-not-equal?
                                                            #f
                                                            (synthesize-lattice-ecp5-dsp
                                                             (bvadd c (bvmul a b)))))))))))
  (test-case "lattice dsp mul-sub"
             (begin
               (check-true (normal? (with-vc (with-terms (begin
                                                           (define-symbolic a b c (bitvector 18))
                                                           (check-not-equal?
                                                            #f
                                                            (synthesize-lattice-ecp5-dsp
                                                             (bvsub c (bvmul a b)))))))))))

  (test-case "lattice dsp add 16"
             (begin
               (check-true
                (normal? (with-vc (with-terms (begin
                                                (define-symbolic a b (bitvector 18))
                                                (check-not-equal? #f
                                                                  (synthesize-lattice-ecp5-dsp
                                                                   (bvadd a b))))))))))
  (test-case "lattice dsp mul 16"
             (begin
               (check-true
                (normal? (with-vc (with-terms (begin
                                                (define-symbolic a b (bitvector 18))
                                                (check-not-equal? #f
                                                                  (synthesize-lattice-ecp5-dsp
                                                                   (bvmul a b))))))))))
  (test-case "lattice dsp mul-add 16"
             (begin
               (check-true (normal? (with-vc (with-terms (begin
                                                           (define-symbolic a b c (bitvector 18))
                                                           (check-not-equal?
                                                            #f
                                                            (synthesize-lattice-ecp5-dsp
                                                             (bvadd c (bvmul a b)))))))))))
  (test-case "lattice dsp mul-sub 16"
             (begin
               (check-true (normal? (with-vc (with-terms (begin
                                                           (define-symbolic a b c (bitvector 18))
                                                           (check-not-equal?
                                                            #f
                                                            (synthesize-lattice-ecp5-dsp
                                                             (bvsub c (bvmul a b)))))))))))

  (for ([i (list 1 2 3 4 5 6 7 8 16)])
    (test-case (format "lattice dsp mul~a" i)
               (begin
                 (check-true (normal? (with-vc (with-terms (begin
                                                             (define-symbolic a b (bitvector i))
                                                             (check-not-equal?
                                                              #f
                                                              (synthesize-lattice-ecp5-dsp
                                                               (bvmul a b))))))))))))
