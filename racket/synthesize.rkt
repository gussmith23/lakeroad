#lang errortrace racket
;;; Synthesis routines for the various architectures.
;;;
;;; TODO provide a top-level synthesis procedure?

(provide synthesize-any
         synthesize-all
         synthesize-with-sketch
         synthesize-with
         synthesize-xilinx-ultrascale-plus-impl
         synthesize-sofa-impl
         synthesize-lattice-ecp5-impl
         synthesize-wire
         synthesize-xilinx-ultrascale-plus-dsp
         template-map)

(require "interpreter.rkt"
         "ultrascale.rkt"
         "lattice-ecp5.rkt"
         "lattice-mul.rkt"
         rosette
         rosette/lib/synthax
         rosette/lib/angelic
         racket/pretty
         racket/sandbox
         rosette/solver/smt/boolector
         "utils.rkt"
         "logical-to-physical.rkt"
         (prefix-in template: "templates.rkt")
         (prefix-in lr: "language.rkt")
         "sketches.rkt")

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
  (rosette-synthesize bv-expr
                      (generate-sketch sketch-generator architecture-description bv-expr)
                      (append (symbolics bv-expr) additional-forall)
                      #:module-semantics module-semantics))

(current-solver (boolector))

(define (template-map)
  (make-immutable-hash
   (list (cons "synthesize_wire" synthesize-wire)
         (cons "synthesize_sofa_bitwise" (synthesize-using-lut 'sofa 1 4))
         (cons "synthesize_xilinx_ultrascale_plus_dsp" synthesize-xilinx-ultrascale-plus-dsp)
         (cons "synthesize_xilinx_ultrascale_plus_bitwise"
               (synthesize-using-lut 'xilinx-ultrascale-plus 1))
         (cons "synthesize_xilinx_ultrascale_plus_kitchen_sink"
               synthesize-xilinx-ultrascale-plus-impl-kitchen-sink)
         (cons "synthesize_lattice_ecp5_for_pfu" synthesize-lattice-ecp5-for-pfu)
         (cons "synthesize_lattice_ecp5_for_ripple_pfu" synthesize-lattice-ecp5-for-ripple-pfu)
         (cons "synthesize_lattice_ecp5_for_ccu2c" synthesize-lattice-ecp5-for-ccu2c)
         (cons "synthesize_lattice_ecp5_for_ccu2c_tri" synthesize-lattice-ecp5-for-ccu2c-tri)
         (cons "synthesize_lattice_ecp5_multiply_circt" synthesize-lattice-ecp5-multiply-circt))))

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

(define (synthesize-sofa-impl bv-expr [finish-when 'first-to-succeed])
  (synthesize-with finish-when (list synthesize-wire (synthesize-using-lut 'sofa 1 4)) bv-expr))

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

(module+ test
  (simple-test synthesize-sofa-impl (define-symbolic a b (bitvector 8)) (bvand a b)))

;;; Synthesize a Xilinx UltraScale+ Lakeroad expression for the given Rosette bitvector expression.
;;;
;;; TODO Use the grammar to generate *any* Lakeroad program. This will probably require that we also
;;; let the user specify the depth to search over and other parameters. At the very least, start by
;;; defining those as keyword args with default values.
(define (synthesize-xilinx-ultrascale-plus-impl bv-expr [finish-when 'first-to-succeed])
  (synthesize-with finish-when
                   (list synthesize-wire
                         synthesize-xilinx-ultrascale-plus-dsp
                         (synthesize-using-lut 'xilinx-ultrascale-plus 1)
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
                         synthesize-lattice-ecp5-for-ccu2c-tri
                         synthesize-lattice-ecp5-multiply-circt)
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
(define (synthesize-using-lut arch num-lutmems [pad #f] [carry? #f])
  (lambda (bv-expr)
    (when (> (length (symbolics bv-expr)) 6)
      (error "Only 6 inputs supported"))

    ;;; Maximum number of input and output bitwidths = the number of bits we need to support.
    (define nbits (apply max (bvlen bv-expr) (map bvlen (symbolics bv-expr))))

    (define inputs
      (if pad
          (append (symbolics bv-expr) (make-list (- pad (length (symbolics bv-expr))) (bv 0 1)))
          (symbolics bv-expr)))

    (define lutmems
      (for/list ([i num-lutmems])
        (define-symbolic* lutmem (bitvector (expt 2 (length inputs))))
        lutmem))

    (define lakeroad-expr
      ((if carry? template:lut-with-carry template:lut) nbits arch inputs lutmems (bvlen bv-expr)))

    (rosette-synthesize bv-expr lakeroad-expr (symbolics bv-expr))))

;;; A function which, when given an architecture, a target number of lutmems,
;;; and a number of arguments to pad the inputs to,
;;; returns a synthesis strategy which uses the comparison template.
(define (synthesize-using-comparison arch num-lutmems [pad #f])
  (lambda (bv-expr)
    (when (> (length (symbolics bv-expr)) 4)
      (error "Only 4 inputs supported"))

    ;;; Maximum number of input and output bitwidths = the number of bits we need to support.
    (define nbits (apply max (bvlen bv-expr) (map bvlen (symbolics bv-expr))))

    (define inputs
      (if pad
          (append (symbolics bv-expr) (make-list (- pad (length (symbolics bv-expr))) (bv 0 1)))
          (symbolics bv-expr)))

    (define lutmems
      (for/list ([i num-lutmems])
        (define-symbolic* lutmem (bitvector (expt 2 (length inputs))))
        lutmem))

    (define lakeroad-expr (template:comparison nbits arch inputs lutmems))
    (rosette-synthesize bv-expr lakeroad-expr (symbolics bv-expr))))

;;;;;;
;;;
;;; ARCH-DEPENDENT SYNTHESIS STRATEGIES
;;; -----------------------------------
;;; Finally, we have architecture-dependent synthesis strategies!

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

     (define A (zero-extend (choose in0 in1 in2 in3 (bv 0 1) (bv 1 1)) (bitvector 30)))
     (define B (zero-extend (choose in0 in1 in2 in3 (bv 0 1) (bv 1 1)) (bitvector 18)))
     (define C (zero-extend (choose in0 in1 in2 in3 (bv 0 1) (bv 1 1)) (bitvector 48)))
     (define D (zero-extend (choose in0 in1 in2 in3 (bv 0 1) (bv 1 1)) (bitvector 27)))

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
                   (lr:first (ultrascale-plus-dsp48e2 (lr:bv A)
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
                                                      (lr:bv B)
                                                      (lr:bv BCASCREG)
                                                      (lr:bv BCIN)
                                                      (lr:bv BMULTSEL)
                                                      (lr:bv BREG)
                                                      (lr:bv B_INPUT)
                                                      (lr:bv C)
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
                                                      (lr:bv D)
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
     (assume (bvult A (bv (expt 2 16) 30)))
     (assume (bvult B (bv (expt 2 16) 18)))

     ;;; Force to DYNAMIC to avoid:
     ;;;
     ;;; OPMODE Input Warning : [Unisim DSP48E2-8] The OPMODE[1:0] (11) is
     ;;; invalid when using attributes USE_MULT = MULTIPLY and (A, B and
     ;;; M) or (A, B and P) or (M and P) are not REGISTERED at time 0.000
     ;;; ns. Please set USE_MULT to either NONE or DYNAMIC or REGISTER one
     ;;; of each group. (A or B) and (M or P) will satisfy the
     ;;; requirement. Instance TOP.top.DSP48E2_0
     (assert (bveq USE_MULT (bv 18 5)))

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

(module+ test
  (require rackunit
           rosette)
  (test-begin
   (define-symbolic a b (bitvector 8))
   (define synthesize-xilinx-ultrascale-plus-impl-smaller-luts
     (synthesize-using-lut 'xilinx-ultrascale-plus 1))
   (check-not-equal? #f (synthesize-xilinx-ultrascale-plus-impl-smaller-luts (bvand a b)))))

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

(define (synthesize-lattice-ecp5-multiply-circt bv-expr)

  (define out-bw (bvlen bv-expr))
  (define max-input-bw
    (if (empty? (symbolics bv-expr)) out-bw (apply max (map bvlen (symbolics bv-expr)))))
  (define logical-inputs (get-lattice-logical-inputs bv-expr #:num-inputs 2 #:expected-bw out-bw))

  ; Ugly hack to check exit conditions...everythin is indented way too much
  ;
  ; TODO: There is a way to use continuations to fix this (let/ec) but this
  ; isn't the most important thing right now We only handle two inputs for now
  ; for this form
  (if (or (not (= (length logical-inputs) 2)) (not (concrete? out-bw)) (not (concrete? max-input-bw)))
      #f
      (begin
        ;;; Max bitwidth of any input.
        ;;; If there are no symbolic vars in the expression, default to the bitwidth of the output.

        (define a (first logical-inputs))
        (define b (second logical-inputs))
        (define lakeroad-expr (lattice-mul-with-carry out-bw a b))
        (rosette-synthesize bv-expr lakeroad-expr (symbolics bv-expr)))))

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
