;;; TODO(@gussmith23) Add this to eval. Currently I just time it from the command line.
;;; Manually testing mapping a pipelined multiply-accumulate to Xilinx UltraScale+ DSPs.
#lang errortrace racket/base

(module+ test
  (require rosette
           "btor.rkt"
           "stateful-design-experiment.rkt"
           rackunit
           rosette/lib/synthax
           ;;; TODO(@gussmith23): Using a hacked version of the imported DSP.
           "xilinx-ultrascale-plus-dsp48e2-less-merging.rkt"
           rosette/solver/smt/boolector)

  (define-namespace-anchor anc)

  (current-solver (boolector))

  (when (not (getenv "LAKEROAD_DIR"))
    (raise "LAKEROAD_DIR not set"))

  ;;; The define-bounded syntax rule helps us "finitize" in Rosette, described in here:
  ;;; https://docs.racket-lang.org/rosette-guide/ch_essentials.html
  ;;; See 2.4.3.
  ;;; fuel determines the maximum depth we will attempt.
  (define fuel (make-parameter 10))
  (define-syntax-rule (define-bounded (id param ...) body ...)
    (define (id param ...)
      (assert (> (fuel) 0) "Out of fuel.")
      (parameterize ([fuel (sub1 (fuel))])
        body ...)))

  (define btor
    (with-output-to-string
     (thunk
      (system
       (format
        "yosys -q -p 'read_verilog -sv ~a; hierarchy -simcheck -top ~a; prep; proc; flatten; clk2fflogic; write_btor;'"
        (build-path (getenv "LAKEROAD_DIR")
                    "verilog"
                    "pipelined_multiply_accumulate.sv")
        "pipelined_multiply_accumulate")))))
  (define ns (namespace-anchor->namespace anc))
  (define f (eval (first (btor->racket btor)) ns))
  (define-symbolic a b acc (bitvector 16))
  ;;; Tick the counter n times. previous-value is the previous return value of the counter, which
  ;;; defaults to the initial result of a counter.
  (define-bounded (run-design n previous-value)
                  (if (bvzero? n)
                      ;;; If we've run all requested ticks, return the previous value.
                      previous-value
                      ;;; Else, recurse.
                      (let* ([out0 (assoc-ref (f #:a (bv->signal a previous-value)
                                                 #:b (bv->signal b)
                                                 #:acc (bv->signal acc)
                                                 #:clk (bv->signal (bv 0 1)))
                                              'out)]
                             [out1 (assoc-ref (f #:a (bv->signal a out0)
                                                 #:b (bv->signal b)
                                                 #:acc (bv->signal acc)
                                                 #:clk (bv->signal (bv 1 1)))
                                              'out)])
                        (run-design (bvsub1 n) out1))))
  (define bw 8)
  (define-symbolic clock-ticks (bitvector bw))
  ;;; To get the module to implement (a*b)+acc, we need to tick the clock twice.
  ;;; (chek-equal?
  ;;;  (evaluate
  ;;;   clock-ticks
  ;;;   ;;; This synthesis query basically asks Rosette: how many clock ticks do I need to implement
  ;;;   ;;; (a*b)+acc?
  ;;;   (synthesize #:forall (list a b acc)
  ;;;               #:guarantee
  ;;;               (assert (bveq (bvadd acc (bvmul a b))
  ;;;                             ;;; We give a dummy value for the initial value of `previous-value`.
  ;;;                             (signal-value (run-design clock-ticks (signal (bv 0 16) (list))))))))
  ;;;  (bv 2 bw))

  (clear-terms!)
  (clear-vc!)

  (define-symbolic a2 b2 acc2 (bitvector 16))

  ;;; represents the Verilog design to be compiled.
  (define-bounded (run-design-to-compile n previous-value)
                  (if (bvzero? n)
                      ;;; If we've run all requested ticks, return the previous value.
                      previous-value
                      ;;; Else, recurse.
                      (let* ([out0 (assoc-ref (f #:a (bv->signal a2 previous-value)
                                                 #:b (bv->signal b2)
                                                 #:acc (bv->signal acc2)
                                                 #:clk (bv->signal (bv 0 1)))
                                              'out)]
                             [out1 (assoc-ref (f #:a (bv->signal a2 out0)
                                                 #:b (bv->signal b2)
                                                 #:acc (bv->signal acc2)
                                                 #:clk (bv->signal (bv 1 1)))
                                              'out)])
                        (run-design (bvsub1 n) out1))))

  (define dsp-a (zero-extend (choose a2 b2 acc2 (bv 0 1)) (bitvector 30)))
  (define dsp-b (zero-extend (choose a2 b2 acc2 (bv 0 1)) (bitvector 18)))
  (define dsp-c (zero-extend (choose a2 b2 acc2 (bv 0 1)) (bitvector 48)))
  (define dsp-d (zero-extend (choose a2 b2 acc2 (bv 0 1)) (bitvector 27)))
  ;;; (define-symbolic A (bitvector 30))
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
  ;(define A_INPUT (bv 7 5))
  ;;; (define-symbolic B (bitvector 18))
  (define-symbolic BCASCREG (bitvector 32))
  (define-symbolic BCIN (bitvector 18))
  (define-symbolic BMULTSEL (bitvector 5))
  (define-symbolic BREG (bitvector 32))
  (define-symbolic B_INPUT (bitvector 5))
  ;;; (define-symbolic C (bitvector 48))
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
  ;;; (define-symbolic D (bitvector 27))
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

  ;;; Constrain the inputs based on the information in the DSP48E2 user manual. (see spec-sheets/.)
  ;;; Constrain #registers (usually to 0, 1, or 2).
  (assert (|| (bveq ACASCREG (bv 0 32)) (bveq ACASCREG (bv 1 32)) (bveq ACASCREG (bv 2 32))))
  (assert (|| (bveq ADREG (bv 0 32)) (bveq ADREG (bv 1 32))))
  (assert (|| (bveq ALUMODEREG (bv 0 32)) (bveq ALUMODEREG (bv 1 32))))
  (assert (|| (bveq AREG (bv 0 32)) (bveq AREG (bv 1 32)) (bveq AREG (bv 2 32))))
  (assert (|| (bveq BCASCREG (bv 0 32)) (bveq BCASCREG (bv 1 32)) (bveq BCASCREG (bv 2 32))))
  (assert (|| (bveq BREG (bv 0 32)) (bveq BREG (bv 1 32)) (bveq BREG (bv 2 32))))
  (assert (|| (bveq CARRYINREG (bv 0 32)) (bveq CARRYINREG (bv 1 32))))
  (assert (|| (bveq CARRYINSELREG (bv 0 32)) (bveq CARRYINSELREG (bv 1 32))))
  (assert (|| (bveq CREG (bv 0 32)) (bveq CREG (bv 1 32))))
  (assert (|| (bveq DREG (bv 0 32)) (bveq DREG (bv 1 32))))
  (assert (|| (bveq INMODEREG (bv 0 32)) (bveq INMODEREG (bv 1 32))))
  (assert (|| (bveq MREG (bv 0 32)) (bveq MREG (bv 1 32))))
  (assert (|| (bveq OPMODEREG (bv 0 32)) (bveq OPMODEREG (bv 1 32))))
  (assert (|| (bveq PREG (bv 0 32)) (bveq PREG (bv 1 32))))
  ;;; We converted the strings to enum values of bitwidth 5. See the enum defined at the top of
  ;;; utils/tests/convert-module-to-btor/DSP48E2.v for the mapping of string to number value.
  ;;; DIRECT or CASCADE.
  (assert (|| (bveq A_INPUT (bv 7 5)) (bveq A_INPUT (bv 15 5))))
  (assert (|| (bveq B_INPUT (bv 7 5)) (bveq B_INPUT (bv 15 5))))
  ;;; A or B.
  (assert (|| (bveq PREADDINSEL (bv 0 5)) (bveq PREADDINSEL (bv 1 5))))
  ;;; A or AD.
  (assert (|| (bveq AMULTSEL (bv 0 5)) (bveq AMULTSEL (bv 2 5))))
  ;;; B or AD.
  (assert (|| (bveq BMULTSEL (bv 1 5)) (bveq BMULTSEL (bv 2 5))))
  ;;; NONE, MULTIPLY, or DYNAMIC.
  (assert (|| (bveq USE_MULT (bv 20 5)) (bveq USE_MULT (bv 10 5)) (bveq USE_MULT (bv 18 5))))
  ;;; ONE48, TWO24, FOUR12.
  (assert (|| (bveq USE_SIMD (bv 12 5)) (bveq USE_SIMD (bv 25 5)) (bveq USE_SIMD (bv 19 5))))
  ;;; TRUE, FALSE.
  (assert (|| (bveq USE_WIDEXOR (bv 24 5)) (bveq USE_WIDEXOR (bv 13 5))))
  ;;; XOR12, XOR24_48_96
  (assert (|| (bveq XORSIMD (bv 26 5)) (bveq XORSIMD (bv 14 5))))
  ;;; NO_RESET, RESET_MATCH, RESET_NOT_MATCH.
  (assert (|| (bveq AUTORESET_PATDET (bv 3 5))
              (bveq AUTORESET_PATDET (bv 4 5))
              (bveq AUTORESET_PATDET (bv 5 5))))
  ;;; RESET, CEP.
  (assert (|| (bveq AUTORESET_PRIORITY (bv 6 5)) (bveq AUTORESET_PRIORITY (bv 16 5))))
  ;;; MASK, C, ROUNDING_MODE1, ROUNDING_MODE2
  (assert (|| (bveq SEL_MASK (bv 8 5))
              (bveq SEL_MASK (bv 17 5))
              (bveq SEL_MASK (bv 22 5))
              (bveq SEL_MASK (bv 23 5))))
  ;;; PATTERN, C.
  (assert (|| (bveq SEL_PATTERN (bv 9 5)) (bveq SEL_PATTERN (bv 17 5))))
  ;;; NO_PATDET, PATDET.
  (assert (|| (bveq USE_PATTERN_DETECT (bv 11 5)) (bveq USE_PATTERN_DETECT (bv 21 5))))
  ;;; Table 2-4 of DSP manual.
  (assert (=> (bveq (bvxor (extract 1 0 OPMODE) (extract 1 0 IS_OPMODE_INVERTED)) (bv #b01 2))
              (bveq (bvxor (extract 3 2 OPMODE) (extract 3 2 IS_OPMODE_INVERTED)) (bv #b01 2))))
  ;;; Table 2-6 of DSP manual.
  (assert (not (bveq (bvxor (extract 6 4 OPMODE) (extract 6 4 IS_OPMODE_INVERTED)) (bv #b111 3))))
  ;;; Warning from DSP model:
  ;;;
  ;;; DRC warning : [Unisim DSP48E2-11] CARRYINSEL is set to 010 with OPMODEREG set to 0. This causes
  ;;; unknown values after reset occurs. It is suggested to use OPMODEREG = 1 when cascading large
  ;;; adders.
  (assert (not (&& (bveq CARRYINSEL (bv #b010 3)) (bvzero? OPMODEREG))))

  ;;; Assumptions we make to speed synthesis.

  ;;; For some reason I can't get this working for the full
  ;;; bitwidth. I expect it to work for 26x17 (because we do
  ;;; unsigned mult, but DSP is signed, so we can't use all
  ;;; 27/18 bits.) 16x16 seems to be the most I can get.
  (assume (bvult dsp-a (bv (expt 2 16) 30)))
  (assume (bvult dsp-b (bv (expt 2 16) 18)))

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
  ;;;  (assert (bvzero? AREG))
  ;;;  (assert (bvzero? ADREG))
  ;;;  (assert (bvzero? ACASCREG))
  ;;;  (assert (bvzero? BREG))
  ;;;  (assert (bvzero? BCASCREG))
  ;;;  (assert (bvzero? CREG))
  ;;;  (assert (bvzero? DREG))
  ;;;  (assert (bvzero? PREG))
  ;;;  (assert (bvzero? MREG))
  ;;;  (assert (bvzero? INMODEREG))
  ;;;  (assert (bvzero? OPMODEREG))
  ;;;  (assert (bvzero? ALUMODEREG))
  ;;;  (assert (bvzero? CARRYINREG))
  ;;;  (assert (bvzero? CARRYINSELREG))
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

  ;;; Run the DSP n times.
  (define-bounded
   (run-dsp n previous-value)
   (if (bvzero? n)
       ;;; If we've run all requested ticks, return the previous value.
       previous-value
       ;;; Else, recurse.
       (let* ([out0 (assoc-ref (xilinx-ultrascale-plus-dsp48e2
                                #:A (bv->signal dsp-a previous-value)
                                #:ACASCREG (bv->signal ACASCREG)
                                #:ACIN (bv->signal ACIN)
                                #:ADREG (bv->signal ADREG)
                                #:ALUMODE (bv->signal ALUMODE)
                                #:ALUMODEREG (bv->signal ALUMODEREG)
                                #:AMULTSEL (bv->signal AMULTSEL)
                                #:AREG (bv->signal AREG)
                                #:AUTORESET_PATDET (bv->signal AUTORESET_PATDET)
                                #:AUTORESET_PRIORITY (bv->signal AUTORESET_PRIORITY)
                                #:A_INPUT (bv->signal A_INPUT)
                                #:B (bv->signal dsp-b)
                                #:BCASCREG (bv->signal BCASCREG)
                                #:BCIN (bv->signal BCIN)
                                #:BMULTSEL (bv->signal BMULTSEL)
                                #:BREG (bv->signal BREG)
                                #:B_INPUT (bv->signal B_INPUT)
                                #:C (bv->signal dsp-c)
                                #:CARRYCASCIN (bv->signal CARRYCASCIN)
                                #:CARRYIN (bv->signal CARRYIN)
                                #:CARRYINREG (bv->signal CARRYINREG)
                                #:CARRYINSEL (bv->signal CARRYINSEL)
                                #:CARRYINSELREG (bv->signal CARRYINSELREG)
                                #:CEA1 (bv->signal CEA1)
                                #:CEA2 (bv->signal CEA2)
                                #:CEAD (bv->signal CEAD)
                                #:CEALUMODE (bv->signal CEALUMODE)
                                #:CEB1 (bv->signal CEB1)
                                #:CEB2 (bv->signal CEB2)
                                #:CEC (bv->signal CEC)
                                #:CECARRYIN (bv->signal CECARRYIN)
                                #:CECTRL (bv->signal CECTRL)
                                #:CED (bv->signal CED)
                                #:CEINMODE (bv->signal CEINMODE)
                                #:CEM (bv->signal CEM)
                                #:CEP (bv->signal CEP)
                                #:CLK (bv->signal (bv 0 1))
                                #:CREG (bv->signal CREG)
                                #:D (bv->signal dsp-d)
                                #:DREG (bv->signal DREG)
                                #:INMODE (bv->signal INMODE)
                                #:INMODEREG (bv->signal INMODEREG)
                                #:IS_ALUMODE_INVERTED (bv->signal IS_ALUMODE_INVERTED)
                                #:IS_CARRYIN_INVERTED (bv->signal IS_CARRYIN_INVERTED)
                                #:IS_CLK_INVERTED (bv->signal IS_CLK_INVERTED)
                                #:IS_INMODE_INVERTED (bv->signal IS_INMODE_INVERTED)
                                #:IS_OPMODE_INVERTED (bv->signal IS_OPMODE_INVERTED)
                                #:IS_RSTALLCARRYIN_INVERTED (bv->signal IS_RSTALLCARRYIN_INVERTED)
                                #:IS_RSTALUMODE_INVERTED (bv->signal IS_RSTALUMODE_INVERTED)
                                #:IS_RSTA_INVERTED (bv->signal IS_RSTA_INVERTED)
                                #:IS_RSTB_INVERTED (bv->signal IS_RSTB_INVERTED)
                                #:IS_RSTCTRL_INVERTED (bv->signal IS_RSTCTRL_INVERTED)
                                #:IS_RSTC_INVERTED (bv->signal IS_RSTC_INVERTED)
                                #:IS_RSTD_INVERTED (bv->signal IS_RSTD_INVERTED)
                                #:IS_RSTINMODE_INVERTED (bv->signal IS_RSTINMODE_INVERTED)
                                #:IS_RSTM_INVERTED (bv->signal IS_RSTM_INVERTED)
                                #:IS_RSTP_INVERTED (bv->signal IS_RSTP_INVERTED)
                                #:MASK (bv->signal MASK)
                                #:MREG (bv->signal MREG)
                                #:MULTSIGNIN (bv->signal MULTSIGNIN)
                                #:OPMODE (bv->signal OPMODE)
                                #:OPMODEREG (bv->signal OPMODEREG)
                                #:PATTERN (bv->signal PATTERN)
                                #:PCIN (bv->signal PCIN)
                                #:PREADDINSEL (bv->signal PREADDINSEL)
                                #:PREG (bv->signal PREG)
                                #:RND (bv->signal RND)
                                #:RSTA (bv->signal RSTA)
                                #:RSTALLCARRYIN (bv->signal RSTALLCARRYIN)
                                #:RSTALUMODE (bv->signal RSTALUMODE)
                                #:RSTB (bv->signal RSTB)
                                #:RSTC (bv->signal RSTC)
                                #:RSTCTRL (bv->signal RSTCTRL)
                                #:RSTD (bv->signal RSTD)
                                #:RSTINMODE (bv->signal RSTINMODE)
                                #:RSTM (bv->signal RSTM)
                                #:RSTP (bv->signal RSTP)
                                #:SEL_MASK (bv->signal SEL_MASK)
                                #:SEL_PATTERN (bv->signal SEL_PATTERN)
                                #:USE_MULT (bv->signal USE_MULT)
                                #:USE_PATTERN_DETECT (bv->signal USE_PATTERN_DETECT)
                                #:USE_SIMD (bv->signal USE_SIMD)
                                #:USE_WIDEXOR (bv->signal USE_WIDEXOR)
                                #:XORSIMD (bv->signal XORSIMD)
                                #:unnamed-input-331 (bv->signal unnamed-input-331)
                                #:unnamed-input-488 (bv->signal unnamed-input-488)
                                #:unnamed-input-750 (bv->signal unnamed-input-750)
                                #:unnamed-input-806 (bv->signal unnamed-input-806)
                                #:unnamed-input-850 (bv->signal unnamed-input-850))
                               'P)]
              [out1 (assoc-ref (xilinx-ultrascale-plus-dsp48e2
                                #:A (bv->signal dsp-a out0)
                                #:ACASCREG (bv->signal ACASCREG)
                                #:ACIN (bv->signal ACIN)
                                #:ADREG (bv->signal ADREG)
                                #:ALUMODE (bv->signal ALUMODE)
                                #:ALUMODEREG (bv->signal ALUMODEREG)
                                #:AMULTSEL (bv->signal AMULTSEL)
                                #:AREG (bv->signal AREG)
                                #:AUTORESET_PATDET (bv->signal AUTORESET_PATDET)
                                #:AUTORESET_PRIORITY (bv->signal AUTORESET_PRIORITY)
                                #:A_INPUT (bv->signal A_INPUT)
                                #:B (bv->signal dsp-b)
                                #:BCASCREG (bv->signal BCASCREG)
                                #:BCIN (bv->signal BCIN)
                                #:BMULTSEL (bv->signal BMULTSEL)
                                #:BREG (bv->signal BREG)
                                #:B_INPUT (bv->signal B_INPUT)
                                #:C (bv->signal dsp-c)
                                #:CARRYCASCIN (bv->signal CARRYCASCIN)
                                #:CARRYIN (bv->signal CARRYIN)
                                #:CARRYINREG (bv->signal CARRYINREG)
                                #:CARRYINSEL (bv->signal CARRYINSEL)
                                #:CARRYINSELREG (bv->signal CARRYINSELREG)
                                #:CEA1 (bv->signal CEA1)
                                #:CEA2 (bv->signal CEA2)
                                #:CEAD (bv->signal CEAD)
                                #:CEALUMODE (bv->signal CEALUMODE)
                                #:CEB1 (bv->signal CEB1)
                                #:CEB2 (bv->signal CEB2)
                                #:CEC (bv->signal CEC)
                                #:CECARRYIN (bv->signal CECARRYIN)
                                #:CECTRL (bv->signal CECTRL)
                                #:CED (bv->signal CED)
                                #:CEINMODE (bv->signal CEINMODE)
                                #:CEM (bv->signal CEM)
                                #:CEP (bv->signal CEP)
                                #:CLK (bv->signal (bv 1 1))
                                #:CREG (bv->signal CREG)
                                #:D (bv->signal dsp-d)
                                #:DREG (bv->signal DREG)
                                #:INMODE (bv->signal INMODE)
                                #:INMODEREG (bv->signal INMODEREG)
                                #:IS_ALUMODE_INVERTED (bv->signal IS_ALUMODE_INVERTED)
                                #:IS_CARRYIN_INVERTED (bv->signal IS_CARRYIN_INVERTED)
                                #:IS_CLK_INVERTED (bv->signal IS_CLK_INVERTED)
                                #:IS_INMODE_INVERTED (bv->signal IS_INMODE_INVERTED)
                                #:IS_OPMODE_INVERTED (bv->signal IS_OPMODE_INVERTED)
                                #:IS_RSTALLCARRYIN_INVERTED (bv->signal IS_RSTALLCARRYIN_INVERTED)
                                #:IS_RSTALUMODE_INVERTED (bv->signal IS_RSTALUMODE_INVERTED)
                                #:IS_RSTA_INVERTED (bv->signal IS_RSTA_INVERTED)
                                #:IS_RSTB_INVERTED (bv->signal IS_RSTB_INVERTED)
                                #:IS_RSTCTRL_INVERTED (bv->signal IS_RSTCTRL_INVERTED)
                                #:IS_RSTC_INVERTED (bv->signal IS_RSTC_INVERTED)
                                #:IS_RSTD_INVERTED (bv->signal IS_RSTD_INVERTED)
                                #:IS_RSTINMODE_INVERTED (bv->signal IS_RSTINMODE_INVERTED)
                                #:IS_RSTM_INVERTED (bv->signal IS_RSTM_INVERTED)
                                #:IS_RSTP_INVERTED (bv->signal IS_RSTP_INVERTED)
                                #:MASK (bv->signal MASK)
                                #:MREG (bv->signal MREG)
                                #:MULTSIGNIN (bv->signal MULTSIGNIN)
                                #:OPMODE (bv->signal OPMODE)
                                #:OPMODEREG (bv->signal OPMODEREG)
                                #:PATTERN (bv->signal PATTERN)
                                #:PCIN (bv->signal PCIN)
                                #:PREADDINSEL (bv->signal PREADDINSEL)
                                #:PREG (bv->signal PREG)
                                #:RND (bv->signal RND)
                                #:RSTA (bv->signal RSTA)
                                #:RSTALLCARRYIN (bv->signal RSTALLCARRYIN)
                                #:RSTALUMODE (bv->signal RSTALUMODE)
                                #:RSTB (bv->signal RSTB)
                                #:RSTC (bv->signal RSTC)
                                #:RSTCTRL (bv->signal RSTCTRL)
                                #:RSTD (bv->signal RSTD)
                                #:RSTINMODE (bv->signal RSTINMODE)
                                #:RSTM (bv->signal RSTM)
                                #:RSTP (bv->signal RSTP)
                                #:SEL_MASK (bv->signal SEL_MASK)
                                #:SEL_PATTERN (bv->signal SEL_PATTERN)
                                #:USE_MULT (bv->signal USE_MULT)
                                #:USE_PATTERN_DETECT (bv->signal USE_PATTERN_DETECT)
                                #:USE_SIMD (bv->signal USE_SIMD)
                                #:USE_WIDEXOR (bv->signal USE_WIDEXOR)
                                #:XORSIMD (bv->signal XORSIMD)
                                #:unnamed-input-331 (bv->signal unnamed-input-331)
                                #:unnamed-input-488 (bv->signal unnamed-input-488)
                                #:unnamed-input-750 (bv->signal unnamed-input-750)
                                #:unnamed-input-806 (bv->signal unnamed-input-806)
                                #:unnamed-input-850 (bv->signal unnamed-input-850))
                               'P)])

         (run-dsp (bvsub1 n) out1))))

  (define-symbolic dsp-clock-ticks (bitvector 3))
  ;(run-dsp dsp-clock-ticks (signal (bv 0 48) (list)))

  ;;; we ask Rosette: Can you synthesize an instance of a DSP so that it behaves the same as our input
  ;;; design?
  (check-true
   ;;; This synthesis query basically asks Rosette: how many clock ticks do I need to implement
   ;;; (a*b)+acc?
   (sat?
    (synthesize
     #:forall (list a2 b2 acc2)
     #:guarantee
     (assert
      ;;; We give a dummy value for the initial value of `previous-value`.
      (bveq (signal-value (run-design-to-compile (bv 2 2) (signal (bv 0 16) (list))))
            ;;; We give a dummy value for the initial value of `previous-value`.
            (extract 15 0 (signal-value (run-dsp dsp-clock-ticks (signal (bv 0 48) (list)))))))))))
