#lang errortrace racket

(provide interpret-ultrascale-plus
         ultrascale-plus-clb
         ultrascale-plus-lut6-2
         ultrascale-plus-lut4
         ultrascale-plus-lut3
         ultrascale-plus-lut2
         ultrascale-plus-lut1
         ultrascale-plus-dsp48e2
         ultrascale-plus-dsp48e2-state
         compile-ultrascale-plus-dsp48e2
         interpret-ultrascale-plus-dsp48e2
         ultrascale-plus-grammar
         make-ultrascale-plus-clb
         make-ultrascale-plus-dsp48e2
         interpret-ultrascale-plus-carry8
         (struct-out xilinx-ultrascale-plus-carry8)
         (struct-out xilinx-ultrascale-plus-lut6)
         (struct-out xilinx-ultrascale-plus-lut6-2)
         compile-xilinx-ultrascale-plus-carry8
         compile-xilinx-ultrascale-plus-lut6
         compile-xilinx-ultrascale-plus-lut6-2)

(require rosette
         rosette/lib/synthax
         "comp-json.rkt"
         "lut.rkt"
         (prefix-in lr: "language.rkt")
         (rename-in (file "xilinx-ultrascale-plus-dsp48e2.rkt")
                    (xilinx-ultrascale-plus-dsp48e2 interpret-xilinx-ultrascale-plus-dsp48e2))
         "logical-to-physical.rkt"
         "stateful-design-experiment.rkt"
         (rename-in (file "xilinx-ultrascale-plus-carry8.rkt")
                    (xilinx-ultrascale-plus-carry8 interpret-xilinx-ultrascale-plus-carry8))
         (rename-in (file "xilinx-ultrascale-plus-lut6.rkt")
                    (xilinx-ultrascale-plus-lut6 interpret-xilinx-ultrascale-plus-lut6))
         (rename-in (file "xilinx-ultrascale-plus-lut6-2.rkt")
                    (xilinx-ultrascale-plus-lut6-2 interpret-xilinx-ultrascale-plus-lut6-2)))

(struct ultrascale-plus-clb
        (cin lut-a
             lut-b
             lut-c
             lut-d
             lut-e
             lut-f
             lut-g
             lut-h
             mux-selector-a
             mux-selector-b
             mux-selector-c
             mux-selector-d
             mux-selector-e
             mux-selector-f
             mux-selector-g
             mux-selector-h
             inputs)
  #:transparent)
(struct ultrascale-plus-lut6-2 (init inputs) #:transparent)
(struct ultrascale-plus-lut4 (init inputs) #:transparent)
(struct ultrascale-plus-lut3 (init inputs) #:transparent)
(struct ultrascale-plus-lut2 (init inputs) #:transparent)
(struct ultrascale-plus-lut1 (init inputs) #:transparent)
(struct ultrascale-plus-dsp48e2
        (A ACASCREG
           ACIN
           ADREG
           ALUMODE
           ALUMODEREG
           AMULTSEL
           AREG
           AUTORESET_PATDET
           AUTORESET_PRIORITY
           A_INPUT
           B
           BCASCREG
           BCIN
           BMULTSEL
           BREG
           B_INPUT
           C
           CARRYCASCIN
           CARRYIN
           CARRYINREG
           CARRYINSEL
           CARRYINSELREG
           CEA1
           CEA2
           CEAD
           CEALUMODE
           CEB1
           CEB2
           CEC
           CECARRYIN
           CECTRL
           CED
           CEINMODE
           CEM
           CEP
           CLK
           CREG
           D
           DREG
           INMODE
           INMODEREG
           IS_ALUMODE_INVERTED
           IS_CARRYIN_INVERTED
           IS_CLK_INVERTED
           IS_INMODE_INVERTED
           IS_OPMODE_INVERTED
           IS_RSTALLCARRYIN_INVERTED
           IS_RSTALUMODE_INVERTED
           IS_RSTA_INVERTED
           IS_RSTB_INVERTED
           IS_RSTCTRL_INVERTED
           IS_RSTC_INVERTED
           IS_RSTD_INVERTED
           IS_RSTINMODE_INVERTED
           IS_RSTM_INVERTED
           IS_RSTP_INVERTED
           MASK
           MREG
           MULTSIGNIN
           OPMODE
           OPMODEREG
           PATTERN
           PCIN
           PREADDINSEL
           PREG
           RND
           RSTA
           RSTALLCARRYIN
           RSTALUMODE
           RSTB
           RSTC
           RSTCTRL
           RSTD
           RSTINMODE
           RSTM
           RSTP
           SEL_MASK
           SEL_PATTERN
           USE_MULT
           USE_PATTERN_DETECT
           USE_SIMD
           USE_WIDEXOR
           XORSIMD
           unnamed-input-331
           unnamed-input-488
           unnamed-input-750
           unnamed-input-806
           unnamed-input-850)
  #:transparent)
(struct xilinx-ultrascale-plus-carry8 (carry-type ci ci-top di s) #:transparent)
(struct xilinx-ultrascale-plus-lut6-2 (i0 i1 i2 i3 i4 i5 init) #:transparent)
(struct xilinx-ultrascale-plus-lut6 (i0 i1 i2 i3 i4 i5 init) #:transparent)

;;; Compile program in Lakeroad DSL to module.

;;; Convert LUT6_2 to JSON.
(define (make-ultrascale-plus-lut6-2 init-mem I0 I1 I2 I3 I4 I5 O5 O6 #:attrs [attrs (hasheq)])
  (make-cell "LUT6_2"
             (make-cell-port-directions (list 'I0 'I1 'I2 'I3 'I4 'I5) (list 'O5 'O6))
             (make-cell-connections 'I0 I0 'I1 I1 'I2 I2 'I3 I3 'I4 I4 'I5 I5 'O5 O5 'O6 O6)
             #:params (hasheq 'INIT init-mem)))

;;; Convert CARRY8 to JSON.
(define (make-ultrascale-plus-carry8 CI_TOP CI DI S O CO)
  (make-cell "CARRY8"
             (make-cell-port-directions '(CI_TOP CI DI S) '(O CO))
             (hasheq-helper 'CI_TOP (list CI_TOP) 'CI (list CI) 'DI DI 'S S 'O O 'CO CO)))

;;; Make module definition for CLB.
(define (make-ultrascale-plus-clb lakeroad->jsexpr
                                  get-bits
                                  add-cell
                                  add-netname
                                  add-parameter-default-value
                                  expr)

  ; Make module for CLB.
  (match-let* ([(ultrascale-plus-clb cin
                                     lut-a
                                     lut-b
                                     lut-c
                                     lut-d
                                     lut-e
                                     lut-f
                                     lut-g
                                     lut-h
                                     mux-selector-a
                                     mux-selector-b
                                     mux-selector-c
                                     mux-selector-d
                                     mux-selector-e
                                     mux-selector-f
                                     mux-selector-g
                                     mux-selector-h
                                     inputs) expr]
               ;;; Compile all input expressions.
               [cin (lakeroad->jsexpr cin)]
               [inputs (lakeroad->jsexpr inputs)]
               ;;; Unwrap lut and mux-selector values. This is kind of a hack. We could also compile
               ;;; them and compare against their values directly.
               [(lr:bv lut-a) lut-a]
               [(lr:bv lut-b) lut-b]
               [(lr:bv lut-c) lut-c]
               [(lr:bv lut-d) lut-d]
               [(lr:bv lut-e) lut-e]
               [(lr:bv lut-f) lut-f]
               [(lr:bv lut-g) lut-g]
               [(lr:bv lut-h) lut-h]
               [(lr:bv mux-selector-a) mux-selector-a]
               [(lr:bv mux-selector-b) mux-selector-b]
               [(lr:bv mux-selector-c) mux-selector-c]
               [(lr:bv mux-selector-d) mux-selector-d]
               [(lr:bv mux-selector-e) mux-selector-e]
               [(lr:bv mux-selector-f) mux-selector-f]
               [(lr:bv mux-selector-g) mux-selector-g]
               [(lr:bv mux-selector-h) mux-selector-h]
               ;;; Extract individual inputs.
               [(list a-ins b-ins c-ins d-ins e-ins f-ins g-ins h-ins) inputs]
               ;;; Index bitvector at bit id.
               [bit (lambda (n l) (list-ref l n))]
               ;;; Nets.
               [luts_O5 (get-bits 8)]
               [luts_O6 (get-bits 8)]
               [o (get-bits 8)]
               [co (get-bits 8)]
               [mux-helper (lambda (o5 o6 carry-o carry-co selector)
                             (if (bveq selector (bv 0 2))
                                 o5
                                 (if (bveq selector (bv 1 2))
                                     o6
                                     (if (bveq selector (bv 2 2)) carry-o carry-co))))]
               [out (map mux-helper
                         luts_O5
                         luts_O6
                         o
                         co
                         (list mux-selector-a
                               mux-selector-b
                               mux-selector-c
                               mux-selector-d
                               mux-selector-e
                               mux-selector-f
                               mux-selector-g
                               mux-selector-h))]
               ;;; LUTs.
               [A_LUT (apply make-ultrascale-plus-lut6-2
                             (make-literal-value-from-bv lut-a)
                             (append a-ins (list (bit 0 luts_O5) (bit 0 luts_O6))))]
               [B_LUT (apply make-ultrascale-plus-lut6-2
                             (make-literal-value-from-bv lut-b)
                             (append b-ins (list (bit 1 luts_O5) (bit 1 luts_O6))))]
               [C_LUT (apply make-ultrascale-plus-lut6-2
                             (make-literal-value-from-bv lut-c)
                             (append c-ins (list (bit 2 luts_O5) (bit 2 luts_O6))))]
               [D_LUT (apply make-ultrascale-plus-lut6-2
                             (make-literal-value-from-bv lut-d)
                             (append d-ins (list (bit 3 luts_O5) (bit 3 luts_O6))))]
               [E_LUT (apply make-ultrascale-plus-lut6-2
                             (make-literal-value-from-bv lut-e)
                             (append e-ins (list (bit 4 luts_O5) (bit 4 luts_O6))))]
               [F_LUT (apply make-ultrascale-plus-lut6-2
                             (make-literal-value-from-bv lut-f)
                             (append f-ins (list (bit 5 luts_O5) (bit 5 luts_O6))))]
               [G_LUT (apply make-ultrascale-plus-lut6-2
                             (make-literal-value-from-bv lut-g)
                             (append g-ins (list (bit 6 luts_O5) (bit 6 luts_O6))))]
               [H_LUT (apply make-ultrascale-plus-lut6-2
                             (make-literal-value-from-bv lut-h)
                             (append h-ins (list (bit 7 luts_O5) (bit 7 luts_O6))))]
               ;;; Carry.
               [carry (make-ultrascale-plus-carry8 "0" (bit 0 cin) luts_O5 luts_O6 o co)])
    (add-cell 'A_LUT A_LUT)
    (add-cell 'B_LUT B_LUT)
    (add-cell 'C_LUT C_LUT)
    (add-cell 'D_LUT D_LUT)
    (add-cell 'E_LUT E_LUT)
    (add-cell 'F_LUT F_LUT)
    (add-cell 'G_LUT G_LUT)
    (add-cell 'H_LUT H_LUT)
    (add-cell 'carry carry)
    (add-netname 'luts_O5 (make-net-details luts_O5))
    (add-netname 'luts_O6 (make-net-details luts_O6))
    (add-netname 'o (make-net-details o))
    (add-netname 'co (make-net-details co))
    ; Return ((lut-a-out) (lut-b-out) ... (lut-h-out) (cout)).
    (append (map list out) (list (list (list-ref co 7))))))

;;; (module+ test
;;;   (require rackunit)
;;;   (require json)
;;;   (define json-file (make-temporary-file "~a.json"))
;;;   (define verilog-file (make-temporary-file "~a.sv"))
;;;   ;;; Unsure why, but (write-json) doesn't work for me.
;;;   (displayln (jsexpr->string (make-ultrascale-plus-clb-module-definition 'clb))
;;;              (open-output-file json-file #:mode 'text #:exists 'must-truncate))
;;;   (when (not (system (format "yosys -p \"read_json ~a; write_verilog ~a\"" json-file verilog-file)))
;;;     (error "Yosys failed")))

;;; Grammar for synthesizing instruction implementations on UltraScale+.
;;;
;;; This grammar can be used in the manner shown in the Rosette docs:
;;; https://docs.racket-lang.org/rosette-guide/sec_rosette-libs.html#%28form._%28%28lib._rosette%2Flib%2Fsynthax..rkt%29._define-grammar%29%29
;;;
;;; For example:
;;;
;;; ```racket
;;; (define-symbolic a (bitvector 8))
;;; (define-symbolic b (bitvector 8))
;;; (define expr (ultrascale-plus-grammar (list a b) #:depth 3))
;;; (define soln (synthesize #:forall (list a b) #:guarantee (assert (bveq (interpret expr) (bvadd a b)))))
;;; (displayln (evaluate expr soln))
;;; ```
(define-grammar
 (ultrascale-plus-grammar logical-inputs lutmems muxes)
 [expr (logical-8bit)]
 [logical-input
  (match logical-inputs
    [(list) (void)]
    [(list l0) (choose l0)]
    [(list l0 l1) (choose l0 l1)]
    [(list l0 l1 l2) (choose l0 l1 l2)]
    [(list l0 l1 l2 l3) (choose l0 l1 l2 l3)]
    [(list l0 l1 l2 l3 l4) (choose l0 l1 l2 l3 l4)]
    [(list l0 l1 l2 l3 l4 l5) (choose l0 l1 l2 l3 l4 l5)]
    [(list l0 l1 l2 l3 l4 l5 l6) (choose l0 l1 l2 l3 l4 l5 l6)]
    [(list l0 l1 l2 l3 l4 l5 l6 l7) (choose l0 l1 l2 l3 l4 l5 l6 l7)])]
 [cin (?? (bitvector 1))]
 [lutmem
  (match lutmems
    [(list) (void)]
    [(list i0) (choose i0)]
    [(list i0 i1) (choose i0 i1)]
    [(list i0 i1 i2) (choose i0 i1 i2)])]
 [mux
  (match muxes
    [(list) (void)]
    [(list i0) (choose i0)]
    [(list i0 i1) (choose i0 i1)]
    [(list i0 i1 i2) (choose i0 i1 i2)]
    [(list i0 i1 i2 i3) (choose i0 i1 i2 i3)])]
 [physical-list
  ;;; We currently drop the cout bit.
  (lr:take (ultrascale-plus-clb (cin)
                                (lutmem)
                                (lutmem)
                                (lutmem)
                                (lutmem)
                                (lutmem)
                                (lutmem)
                                (lutmem)
                                (lutmem)
                                (mux)
                                (mux)
                                (mux)
                                (mux)
                                (mux)
                                (mux)
                                (mux)
                                (mux)
                                (logical-to-physical-mapping
                                 (choose (ltop-bitwise) (ltop-bitwise-reverse))
                                 (logical-list)))
           8)]
 [logical-list
  (choose (list (logical-8bit) (logical-8bit) (bv #xff 8) (bv #xff 8) (bv #xff 8) (bv #xff 8))
          (physical-to-logical-mapping
           (choose (ptol-bitwise) (ptol-choose-one (bv 0 1)) (ptol-bitwise-reverse))
           (physical-list)))]
 ;;; 8bit logical input
 ;;; Note: it's important that all unused inputs get set to HIGH. This is most important for the sixth
 ;;; input, as on Xilinx UltraScale+, the sixth input to each LUT must be held high to enable two
 ;;; distinct outputs. By providing #xff as a choosable constant, we let the synthesizer decide when
 ;;; to use it.
 [logical-8bit (choose (logical-input) (bv #xff 8) (bv #x00 8) (lr:list-ref (logical-list) 0))])

; Contains the state for a LUT6_2.
; memory is the LUT's memory: (bitvector 64).
(struct ultrascale-plus-lut6-2-state (memory))

(module+ test
  (require rackunit)
  (check-equal? (lut (bv #b0110 4) (bv 0 1)) (bv #b0 1))
  (check-equal? (lut (bv #b0110 4) (bv 1 1)) (bv #b1 1))
  (check-equal? (lut (bv #b0110 4) (bv 2 2)) (bv #b1 1))
  (check-equal? (lut (bv #b0110 4) (bv 3 2)) (bv #b0 1)))

(define (interpret-ultrascale-plus-lut6-2 interpreter expr)
  (match expr
    [(ultrascale-plus-lut6-2 memory inputs)
     (interpret-ultrascale-plus-lut6-2-impl
      (interpreter (ultrascale-plus-lut6-2-state-memory (ultrascale-plus-lut6-2-state memory)))
      (interpreter inputs))]))

; LUT6_2 primitive described on page 37 of
; https://www.xilinx.com/support/documentation/user_guides/ug574-ultrascale-clb.pdf
;
; lut is the lut6-2 struct.
;
; inputs is a 6-bit bitvector, corresponding to I0 (LSB) through I5 (MSB) in figure 3-1.
;
; Returns the O5 and O6 signals.
(define (interpret-ultrascale-plus-lut6-2-impl lut6-2-memory inputs)
  (let* ([memory lut6-2-memory]
         [lut5-0 (lut (extract 63 32 memory) (extract 4 0 inputs))]
         [lut5-1 (lut (extract 31 0 memory) (extract 4 0 inputs))]
         [O6 (if (bitvector->bool (bit 5 inputs)) lut5-0 lut5-1)]
         [O5 lut5-1])
    (list O5 O6)))

(module+ test
  (require rackunit)
  (check-equal? (second (interpret-ultrascale-plus-lut6-2
                         identity
                         (ultrascale-plus-lut6-2 (bv #x0000000000000008 64) (bv 0 6))))
                (bv 0 1))
  (check-equal? (second (interpret-ultrascale-plus-lut6-2
                         identity
                         (ultrascale-plus-lut6-2 (bv #x0000000000000008 64) (bv 1 6))))
                (bv 0 1))
  (check-equal? (second (interpret-ultrascale-plus-lut6-2
                         identity
                         (ultrascale-plus-lut6-2 (bv #x0000000000000008 64) (bv 2 6))))
                (bv 0 1))
  (check-equal? (second (interpret-ultrascale-plus-lut6-2
                         identity
                         (ultrascale-plus-lut6-2 (bv #x0000000000000008 64) (bv 3 6))))
                (bv 1 1)))

; Carry signals CO0..CO7 (aka MUXCY; carry output) in fig 2-4. Note that, to implement a mux with
; "if", the "then" and "else" clauses are in reverse order from the usual mux input order!
(define (carry-co s di prev-muxcy)
  (if (bitvector->bool s) prev-muxcy di))
; Carry signals O0..O7 (aka sum value) in Fig 2-4.
(define (carry-o s prev-muxcy)
  (bvxor s prev-muxcy))
; Wrapper to make things easier.
; Returns (carry0, muxcy)
(define (carry-layer outputs prev-muxcy)
  (match-let ([(list O5 O6) outputs]) (list (carry-o O6 prev-muxcy) (carry-co O6 O5 prev-muxcy))))

(define ultrascale-input-width 6)
(define ultrascale-output-width 2)

; Implementation translated from
; https://github.com/fredrequin/verilator_xilinx/blob/352de831223a65e8eca3f6abe5c11217863a9dd3/CARRY8.v
(define (interpret-ultrascale-plus-carry8 d s ci)
  (let* ([w_CO0 (if (bitvector->bool (bit 0 s)) ci (bit 0 d))]
         [w_CO1 (if (bitvector->bool (bit 1 s)) w_CO0 (bit 1 d))]
         [w_CO2 (if (bitvector->bool (bit 2 s)) w_CO1 (bit 2 d))]
         [w_CO3 (if (bitvector->bool (bit 3 s)) w_CO2 (bit 3 d))]
         [w_CO4 (if (bitvector->bool (bit 4 s)) w_CO3 (bit 4 d))]
         [w_CO5 (if (bitvector->bool (bit 5 s)) w_CO4 (bit 5 d))]
         [w_CO6 (if (bitvector->bool (bit 6 s)) w_CO5 (bit 6 d))]
         [w_CO7 (if (bitvector->bool (bit 7 s)) w_CO6 (bit 7 d))]
         [CO (concat w_CO7 w_CO6 w_CO5 w_CO4 w_CO3 w_CO2 w_CO1 w_CO0)]
         [O (bvxor s (concat w_CO6 w_CO5 w_CO4 w_CO3 w_CO2 w_CO1 w_CO0 ci))])
    (list O CO)))

; Defines the programmable state of an UltraScale+ CLB.
(struct ultrascale-plus-clb-state
        (lut-a lut-b
               lut-c
               lut-d
               lut-e
               lut-f
               lut-g
               lut-h
               mux-selector-a
               mux-selector-b
               mux-selector-c
               mux-selector-d
               mux-selector-e
               mux-selector-f
               mux-selector-g
               mux-selector-h))

;;; Top level UltraScale+ interpreter.
(define (interpret-ultrascale-plus interpreter expr)
  (match expr
    [(ultrascale-plus-dsp48e2 A
                              ACASCREG
                              ACIN
                              ADREG
                              ALUMODE
                              ALUMODEREG
                              AMULTSEL
                              AREG
                              AUTORESET_PATDET
                              AUTORESET_PRIORITY
                              A_INPUT
                              B
                              BCASCREG
                              BCIN
                              BMULTSEL
                              BREG
                              B_INPUT
                              C
                              CARRYCASCIN
                              CARRYIN
                              CARRYINREG
                              CARRYINSEL
                              CARRYINSELREG
                              CEA1
                              CEA2
                              CEAD
                              CEALUMODE
                              CEB1
                              CEB2
                              CEC
                              CECARRYIN
                              CECTRL
                              CED
                              CEINMODE
                              CEM
                              CEP
                              CLK
                              CREG
                              D
                              DREG
                              INMODE
                              INMODEREG
                              IS_ALUMODE_INVERTED
                              IS_CARRYIN_INVERTED
                              IS_CLK_INVERTED
                              IS_INMODE_INVERTED
                              IS_OPMODE_INVERTED
                              IS_RSTALLCARRYIN_INVERTED
                              IS_RSTALUMODE_INVERTED
                              IS_RSTA_INVERTED
                              IS_RSTB_INVERTED
                              IS_RSTCTRL_INVERTED
                              IS_RSTC_INVERTED
                              IS_RSTD_INVERTED
                              IS_RSTINMODE_INVERTED
                              IS_RSTM_INVERTED
                              IS_RSTP_INVERTED
                              MASK
                              MREG
                              MULTSIGNIN
                              OPMODE
                              OPMODEREG
                              PATTERN
                              PCIN
                              PREADDINSEL
                              PREG
                              RND
                              RSTA
                              RSTALLCARRYIN
                              RSTALUMODE
                              RSTB
                              RSTC
                              RSTCTRL
                              RSTD
                              RSTINMODE
                              RSTM
                              RSTP
                              SEL_MASK
                              SEL_PATTERN
                              USE_MULT
                              USE_PATTERN_DETECT
                              USE_SIMD
                              USE_WIDEXOR
                              XORSIMD
                              unnamed-input-331
                              unnamed-input-488
                              unnamed-input-750
                              unnamed-input-806
                              unnamed-input-850)
     (interpret-ultrascale-plus-dsp48e2-new interpreter expr)]
    [(ultrascale-plus-lut6-2 init inputs) (interpret-ultrascale-plus-lut6-2 interpreter expr)]
    [(ultrascale-plus-lut3 init inputs) (lut init (interpreter inputs))]
    [(ultrascale-plus-lut2 init inputs) (lut init (interpreter inputs))]
    [(ultrascale-plus-lut1 init inputs) (lut init (interpreter inputs))]
    [(ultrascale-plus-clb cin
                          lut-a
                          lut-b
                          lut-c
                          lut-d
                          lut-e
                          lut-f
                          lut-g
                          lut-h
                          mux-selector-a
                          mux-selector-b
                          mux-selector-c
                          mux-selector-d
                          mux-selector-e
                          mux-selector-f
                          mux-selector-g
                          mux-selector-h
                          inputs)

     (let* ([inputs (interpreter inputs)]
            [lut-input-a (first inputs)]
            [lut-input-b (second inputs)]
            [lut-input-c (third inputs)]
            [lut-input-d (fourth inputs)]
            [lut-input-e (fifth inputs)]
            [lut-input-f (sixth inputs)]
            [lut-input-g (seventh inputs)]
            [lut-input-h (eighth inputs)])
       (interpret-ultrascale-plus-clb-impl
        (ultrascale-plus-clb-state (ultrascale-plus-lut6-2-state (interpreter lut-a))
                                   (ultrascale-plus-lut6-2-state (interpreter lut-b))
                                   (ultrascale-plus-lut6-2-state (interpreter lut-c))
                                   (ultrascale-plus-lut6-2-state (interpreter lut-d))
                                   (ultrascale-plus-lut6-2-state (interpreter lut-e))
                                   (ultrascale-plus-lut6-2-state (interpreter lut-f))
                                   (ultrascale-plus-lut6-2-state (interpreter lut-g))
                                   (ultrascale-plus-lut6-2-state (interpreter lut-h))
                                   (interpreter mux-selector-a)
                                   (interpreter mux-selector-b)
                                   (interpreter mux-selector-c)
                                   (interpreter mux-selector-d)
                                   (interpreter mux-selector-e)
                                   (interpreter mux-selector-f)
                                   (interpreter mux-selector-g)
                                   (interpreter mux-selector-h))
        (interpreter cin)
        lut-input-a
        lut-input-b
        lut-input-c
        lut-input-d
        lut-input-e
        lut-input-f
        lut-input-g
        lut-input-h))]
    [(xilinx-ultrascale-plus-carry8 carry-type ci ci-top di s)
     (let ([out (interpret-xilinx-ultrascale-plus-carry8 #:CARRY_TYPE (bv->signal carry-type)
                                                         #:CI (bv->signal ci)
                                                         #:CI_TOP (bv->signal ci-top)
                                                         #:DI (bv->signal di)
                                                         #:S (bv->signal s))])
       (list (signal-value (hash-ref out 'CO)) (signal-value (hash-ref out 'O))))]
    [(xilinx-ultrascale-plus-lut6 i0 i1 i2 i3 i4 i5 init)
     (let ([out (interpret-xilinx-ultrascale-plus-lut6 #:I0 (bv->signal i0)
                                                       #:I1 (bv->signal i1)
                                                       #:I2 (bv->signal i2)
                                                       #:I3 (bv->signal i3)
                                                       #:I4 (bv->signal i4)
                                                       #:I5 (bv->signal i5)
                                                       #:INIT (bv->signal init))])
       (signal-value (hash-ref out 'O)))]
    [(xilinx-ultrascale-plus-lut6-2 i0 i1 i2 i3 i4 i5 init)
     (let ([out (interpret-xilinx-ultrascale-plus-lut6-2 #:I0 (bv->signal i0)
                                                         #:I1 (bv->signal i1)
                                                         #:I2 (bv->signal i2)
                                                         #:I3 (bv->signal i3)
                                                         #:I4 (bv->signal i4)
                                                         #:I5 (bv->signal i5)
                                                         #:INIT (bv->signal init))])
       (list (signal-value (hash-ref out 'O5)) (signal-value (hash-ref out 'O6))))]))

; Returns the physical outputs of the CLB.
(define (interpret-ultrascale-plus-clb-impl clb
                                            cin
                                            lut-input-a
                                            lut-input-b
                                            lut-input-c
                                            lut-input-d
                                            lut-input-e
                                            lut-input-f
                                            lut-input-g
                                            lut-input-h)

  (match-let*
      ([(list a-o5 a-o6) (interpret-ultrascale-plus-lut6-2-impl
                          (ultrascale-plus-lut6-2-state-memory (ultrascale-plus-clb-state-lut-a clb))
                          lut-input-a)]
       [(list b-o5 b-o6) (interpret-ultrascale-plus-lut6-2-impl
                          (ultrascale-plus-lut6-2-state-memory (ultrascale-plus-clb-state-lut-b clb))
                          lut-input-b)]
       [(list c-o5 c-o6) (interpret-ultrascale-plus-lut6-2-impl
                          (ultrascale-plus-lut6-2-state-memory (ultrascale-plus-clb-state-lut-c clb))
                          lut-input-c)]
       [(list d-o5 d-o6) (interpret-ultrascale-plus-lut6-2-impl
                          (ultrascale-plus-lut6-2-state-memory (ultrascale-plus-clb-state-lut-d clb))
                          lut-input-d)]
       [(list e-o5 e-o6) (interpret-ultrascale-plus-lut6-2-impl
                          (ultrascale-plus-lut6-2-state-memory (ultrascale-plus-clb-state-lut-e clb))
                          lut-input-e)]
       [(list f-o5 f-o6) (interpret-ultrascale-plus-lut6-2-impl
                          (ultrascale-plus-lut6-2-state-memory (ultrascale-plus-clb-state-lut-f clb))
                          lut-input-f)]
       [(list g-o5 g-o6) (interpret-ultrascale-plus-lut6-2-impl
                          (ultrascale-plus-lut6-2-state-memory (ultrascale-plus-clb-state-lut-g clb))
                          lut-input-g)]
       [(list h-o5 h-o6) (interpret-ultrascale-plus-lut6-2-impl
                          (ultrascale-plus-lut6-2-state-memory (ultrascale-plus-clb-state-lut-h clb))
                          lut-input-h)]
       [(list carry-o carry-co) (interpret-ultrascale-plus-carry8
                                 (concat h-o5 g-o5 f-o5 e-o5 d-o5 c-o5 b-o5 a-o5)
                                 (concat h-o6 g-o6 f-o6 e-o6 d-o6 c-o6 b-o6 a-o6)
                                 cin)]
       [cout (bit 7 carry-co)]
       [(list carry-o0 carry-co0) (list (bit 0 carry-o) (bit 0 carry-co))]
       [(list carry-o1 carry-co1) (list (bit 1 carry-o) (bit 1 carry-co))]
       [(list carry-o2 carry-co2) (list (bit 2 carry-o) (bit 2 carry-co))]
       [(list carry-o3 carry-co3) (list (bit 3 carry-o) (bit 3 carry-co))]
       [(list carry-o4 carry-co4) (list (bit 4 carry-o) (bit 4 carry-co))]
       [(list carry-o5 carry-co5) (list (bit 5 carry-o) (bit 5 carry-co))]
       [(list carry-o6 carry-co6) (list (bit 6 carry-o) (bit 6 carry-co))]
       [(list carry-o7 carry-co7) (list (bit 7 carry-o) (bit 7 carry-co))]
       [mux-helper
        (lambda (o5 o6 carry-o carry-co selector)
          (if (bveq selector (bv 0 2))
              o5
              (if (bveq selector (bv 1 2)) o6 (if (bveq selector (bv 2 2)) carry-o carry-co))))]
       [a-mux-out
        (mux-helper a-o5 a-o6 carry-o0 carry-co0 (ultrascale-plus-clb-state-mux-selector-a clb))]
       [b-mux-out
        (mux-helper b-o5 b-o6 carry-o1 carry-co1 (ultrascale-plus-clb-state-mux-selector-b clb))]
       [c-mux-out
        (mux-helper c-o5 c-o6 carry-o2 carry-co2 (ultrascale-plus-clb-state-mux-selector-c clb))]
       [d-mux-out
        (mux-helper d-o5 d-o6 carry-o3 carry-co3 (ultrascale-plus-clb-state-mux-selector-d clb))]
       [e-mux-out
        (mux-helper e-o5 e-o6 carry-o4 carry-co4 (ultrascale-plus-clb-state-mux-selector-e clb))]
       [f-mux-out
        (mux-helper f-o5 f-o6 carry-o5 carry-co5 (ultrascale-plus-clb-state-mux-selector-f clb))]
       [g-mux-out
        (mux-helper g-o5 g-o6 carry-o6 carry-co6 (ultrascale-plus-clb-state-mux-selector-g clb))]
       [h-mux-out
        (mux-helper h-o5 h-o6 carry-o7 carry-co7 (ultrascale-plus-clb-state-mux-selector-h clb))])
    (list a-mux-out b-mux-out c-mux-out d-mux-out e-mux-out f-mux-out g-mux-out h-mux-out cout)))

; Programmable state for DSP48E2. See spec in the spec-sheets dir.
(struct ultrascale-plus-dsp48e2-state ())

; Output of DSP48E2. See spec in the spec-sheets dir.
; p: the P signal in the spec. (bitvector 48).
(struct ultrascale-plus-dsp48e2-output (p))

; Interpreter for DSP48E2. See spec in the spec-sheets dir.
; For now, implements the first equation from Equation 2-2:
; C + (B*(D+A) + W + C_in)
;
; a: (bitvector 30)
; b: (bitvector 18)
; c: (bitvector 48)
; d: (bitvector 27)
; output: (bitvector 48)
(define (interpret-ultrascale-plus-dsp48e2 dsp a b c d)
  (let* ([a (sign-extend a (bitvector 48))]
         [b (sign-extend b (bitvector 48))]
         [d (sign-extend d (bitvector 48))]
         [out (bvadd c (bvmul (bvadd d a) b))])
    out))

(define (interpret-ultrascale-plus-dsp48e2-new interpreter expr)
  (match-let* ([(ultrascale-plus-dsp48e2 A
                                         ACASCREG
                                         ACIN
                                         ADREG
                                         ALUMODE
                                         ALUMODEREG
                                         AMULTSEL
                                         AREG
                                         AUTORESET_PATDET
                                         AUTORESET_PRIORITY
                                         A_INPUT
                                         B
                                         BCASCREG
                                         BCIN
                                         BMULTSEL
                                         BREG
                                         B_INPUT
                                         C
                                         CARRYCASCIN
                                         CARRYIN
                                         CARRYINREG
                                         CARRYINSEL
                                         CARRYINSELREG
                                         CEA1
                                         CEA2
                                         CEAD
                                         CEALUMODE
                                         CEB1
                                         CEB2
                                         CEC
                                         CECARRYIN
                                         CECTRL
                                         CED
                                         CEINMODE
                                         CEM
                                         CEP
                                         CLK
                                         CREG
                                         D
                                         DREG
                                         INMODE
                                         INMODEREG
                                         IS_ALUMODE_INVERTED
                                         IS_CARRYIN_INVERTED
                                         IS_CLK_INVERTED
                                         IS_INMODE_INVERTED
                                         IS_OPMODE_INVERTED
                                         IS_RSTALLCARRYIN_INVERTED
                                         IS_RSTALUMODE_INVERTED
                                         IS_RSTA_INVERTED
                                         IS_RSTB_INVERTED
                                         IS_RSTCTRL_INVERTED
                                         IS_RSTC_INVERTED
                                         IS_RSTD_INVERTED
                                         IS_RSTINMODE_INVERTED
                                         IS_RSTM_INVERTED
                                         IS_RSTP_INVERTED
                                         MASK
                                         MREG
                                         MULTSIGNIN
                                         OPMODE
                                         OPMODEREG
                                         PATTERN
                                         PCIN
                                         PREADDINSEL
                                         PREG
                                         RND
                                         RSTA
                                         RSTALLCARRYIN
                                         RSTALUMODE
                                         RSTB
                                         RSTC
                                         RSTCTRL
                                         RSTD
                                         RSTINMODE
                                         RSTM
                                         RSTP
                                         SEL_MASK
                                         SEL_PATTERN
                                         USE_MULT
                                         USE_PATTERN_DETECT
                                         USE_SIMD
                                         USE_WIDEXOR
                                         XORSIMD
                                         unnamed-input-331
                                         unnamed-input-488
                                         unnamed-input-750
                                         unnamed-input-806
                                         unnamed-input-850) expr]
               [A (interpreter A)]
               [ACASCREG (interpreter ACASCREG)]
               [ACIN (interpreter ACIN)]
               [ADREG (interpreter ADREG)]
               [ALUMODE (interpreter ALUMODE)]
               [ALUMODEREG (interpreter ALUMODEREG)]
               [AMULTSEL (interpreter AMULTSEL)]
               [AREG (interpreter AREG)]
               [AUTORESET_PATDET (interpreter AUTORESET_PATDET)]
               [AUTORESET_PRIORITY (interpreter AUTORESET_PRIORITY)]
               [A_INPUT (interpreter A_INPUT)]
               [B (interpreter B)]
               [BCASCREG (interpreter BCASCREG)]
               [BCIN (interpreter BCIN)]
               [BMULTSEL (interpreter BMULTSEL)]
               [BREG (interpreter BREG)]
               [B_INPUT (interpreter B_INPUT)]
               [C (interpreter C)]
               [CARRYCASCIN (interpreter CARRYCASCIN)]
               [CARRYIN (interpreter CARRYIN)]
               [CARRYINREG (interpreter CARRYINREG)]
               [CARRYINSEL (interpreter CARRYINSEL)]
               [CARRYINSELREG (interpreter CARRYINSELREG)]
               [CEA1 (interpreter CEA1)]
               [CEA2 (interpreter CEA2)]
               [CEAD (interpreter CEAD)]
               [CEALUMODE (interpreter CEALUMODE)]
               [CEB1 (interpreter CEB1)]
               [CEB2 (interpreter CEB2)]
               [CEC (interpreter CEC)]
               [CECARRYIN (interpreter CECARRYIN)]
               [CECTRL (interpreter CECTRL)]
               [CED (interpreter CED)]
               [CEINMODE (interpreter CEINMODE)]
               [CEM (interpreter CEM)]
               [CEP (interpreter CEP)]
               [CLK (interpreter CLK)]
               [CREG (interpreter CREG)]
               [D (interpreter D)]
               [DREG (interpreter DREG)]
               [INMODE (interpreter INMODE)]
               [INMODEREG (interpreter INMODEREG)]
               [IS_ALUMODE_INVERTED (interpreter IS_ALUMODE_INVERTED)]
               [IS_CARRYIN_INVERTED (interpreter IS_CARRYIN_INVERTED)]
               [IS_CLK_INVERTED (interpreter IS_CLK_INVERTED)]
               [IS_INMODE_INVERTED (interpreter IS_INMODE_INVERTED)]
               [IS_OPMODE_INVERTED (interpreter IS_OPMODE_INVERTED)]
               [IS_RSTALLCARRYIN_INVERTED (interpreter IS_RSTALLCARRYIN_INVERTED)]
               [IS_RSTALUMODE_INVERTED (interpreter IS_RSTALUMODE_INVERTED)]
               [IS_RSTA_INVERTED (interpreter IS_RSTA_INVERTED)]
               [IS_RSTB_INVERTED (interpreter IS_RSTB_INVERTED)]
               [IS_RSTCTRL_INVERTED (interpreter IS_RSTCTRL_INVERTED)]
               [IS_RSTC_INVERTED (interpreter IS_RSTC_INVERTED)]
               [IS_RSTD_INVERTED (interpreter IS_RSTD_INVERTED)]
               [IS_RSTINMODE_INVERTED (interpreter IS_RSTINMODE_INVERTED)]
               [IS_RSTM_INVERTED (interpreter IS_RSTM_INVERTED)]
               [IS_RSTP_INVERTED (interpreter IS_RSTP_INVERTED)]
               [MASK (interpreter MASK)]
               [MREG (interpreter MREG)]
               [MULTSIGNIN (interpreter MULTSIGNIN)]
               [OPMODE (interpreter OPMODE)]
               [OPMODEREG (interpreter OPMODEREG)]
               [PATTERN (interpreter PATTERN)]
               [PCIN (interpreter PCIN)]
               [PREADDINSEL (interpreter PREADDINSEL)]
               [PREG (interpreter PREG)]
               [RND (interpreter RND)]
               [RSTA (interpreter RSTA)]
               [RSTALLCARRYIN (interpreter RSTALLCARRYIN)]
               [RSTALUMODE (interpreter RSTALUMODE)]
               [RSTB (interpreter RSTB)]
               [RSTC (interpreter RSTC)]
               [RSTCTRL (interpreter RSTCTRL)]
               [RSTD (interpreter RSTD)]
               [RSTINMODE (interpreter RSTINMODE)]
               [RSTM (interpreter RSTM)]
               [RSTP (interpreter RSTP)]
               [SEL_MASK (interpreter SEL_MASK)]
               [SEL_PATTERN (interpreter SEL_PATTERN)]
               [USE_MULT (interpreter USE_MULT)]
               [USE_PATTERN_DETECT (interpreter USE_PATTERN_DETECT)]
               [USE_SIMD (interpreter USE_SIMD)]
               [USE_WIDEXOR (interpreter USE_WIDEXOR)]
               [XORSIMD (interpreter XORSIMD)]
               [unnamed-input-331 (interpreter unnamed-input-331)]
               [unnamed-input-488 (interpreter unnamed-input-488)]
               [unnamed-input-750 (interpreter unnamed-input-750)]
               [unnamed-input-806 (interpreter unnamed-input-806)]
               [unnamed-input-850 (interpreter unnamed-input-850)])
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
    (define P
      (signal-value (hash-ref (interpret-xilinx-ultrascale-plus-dsp48e2
                               #:A (bv->signal A)
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
                               #:B (bv->signal B)
                               #:BCASCREG (bv->signal BCASCREG)
                               #:BCIN (bv->signal BCIN)
                               #:BMULTSEL (bv->signal BMULTSEL)
                               #:BREG (bv->signal BREG)
                               #:B_INPUT (bv->signal B_INPUT)
                               #:C (bv->signal C)
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
                               #:CLK (bv->signal CLK)
                               #:CREG (bv->signal CREG)
                               #:D (bv->signal D)
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
                              'P)))
    (list P)))

(define (compile-ultrascale-plus-dsp48e2 dsp p-name clk-name a-name b-name c-name ce-name reset-name)
  (format
   #<<here-string-delimiter
    DSP48E2 #(
        // Feature Control Attributes: Data Path Selection
        .AMULTSEL("A"),                    // Selects A input to multiplier (A, AD)
        .A_INPUT("DIRECT"),                // Selects A input source, "DIRECT" (A port) or "CASCADE" (ACIN port)
        .BMULTSEL("B"),                    // Selects B input to multiplier (AD, B)
        .B_INPUT("DIRECT"),                // Selects B input source, "DIRECT" (B port) or "CASCADE" (BCIN port)
        .PREADDINSEL("A"),                 // Selects input to pre-adder (A, B)
        .RND(48'h000000000000),            // Rounding Constant
        .USE_MULT("MULTIPLY"),             // Select multiplier usage (DYNAMIC, MULTIPLY, NONE)
        .USE_SIMD("ONE48"),                // SIMD selection (FOUR12, ONE48, TWO24)
        .USE_WIDEXOR("FALSE"),             // Use the Wide XOR function (FALSE, TRUE)
        .XORSIMD("XOR24_48_96"),           // Mode of operation for the Wide XOR (XOR12, XOR24_48_96)
        // Pattern Detector Attributes: Pattern Detection Configuration
        .AUTORESET_PATDET("NO_RESET"),     // NO_RESET, RESET_MATCH, RESET_NOT_MATCH
        .AUTORESET_PRIORITY("RESET"),      // Priority of AUTORESET vs. CEP (CEP, RESET).
        .MASK(48'h3fffffffffff),           // 48-bit mask value for pattern detect (1=ignore)
        .PATTERN(48'h000000000000),        // 48-bit pattern match for pattern detect
        .SEL_MASK("MASK"),                 // C, MASK, ROUNDING_MODE1, ROUNDING_MODE2
        .SEL_PATTERN("PATTERN"),           // Select pattern value (C, PATTERN)
        .USE_PATTERN_DETECT("NO_PATDET"),  // Enable pattern detect (NO_PATDET, PATDET)
        // Programmable Inversion Attributes: Specifies built-in programmable inversion on specific pins
        .IS_ALUMODE_INVERTED(4'b0000),     // Optional inversion for ALUMODE
        .IS_CARRYIN_INVERTED(1'b0),        // Optional inversion for CARRYIN
        .IS_CLK_INVERTED(1'b0),            // Optional inversion for CLK
        .IS_INMODE_INVERTED(5'b00000),     // Optional inversion for INMODE
        .IS_OPMODE_INVERTED(9'b000000000), // Optional inversion for OPMODE
        .IS_RSTALLCARRYIN_INVERTED(1'b0),  // Optional inversion for RSTALLCARRYIN
        .IS_RSTALUMODE_INVERTED(1'b0),     // Optional inversion for RSTALUMODE
        .IS_RSTA_INVERTED(1'b0),           // Optional inversion for RSTA
        .IS_RSTB_INVERTED(1'b0),           // Optional inversion for RSTB
        .IS_RSTCTRL_INVERTED(1'b0),        // Optional inversion for RSTCTRL
        .IS_RSTC_INVERTED(1'b0),           // Optional inversion for RSTC
        .IS_RSTD_INVERTED(1'b0),           // Optional inversion for RSTD
        .IS_RSTINMODE_INVERTED(1'b0),      // Optional inversion for RSTINMODE
        .IS_RSTM_INVERTED(1'b0),           // Optional inversion for RSTM
        .IS_RSTP_INVERTED(1'b0),           // Optional inversion for RSTP
        // Register Control Attributes: Pipeline Register Configuration
        .ACASCREG(0),                      // Number of pipeline stages between A/ACIN and ACOUT (0-2)
        .ADREG(0),                         // Pipeline stages for pre-adder (0-1)
        .ALUMODEREG(0),                    // Pipeline stages for ALUMODE (0-1)
        .AREG(0),                          // Pipeline stages for A (0-2)
        .BCASCREG(0),                      // Number of pipeline stages between B/BCIN and BCOUT (0-2)
        .BREG(0),                          // Pipeline stages for B (0-2)
        .CARRYINREG(0),                    // Pipeline stages for CARRYIN (0-1)
        .CARRYINSELREG(0),                 // Pipeline stages for CARRYINSEL (0-1)
        .CREG(0),                          // Pipeline stages for C (0-1)
        .DREG(0),                          // Pipeline stages for D (0-1)
        .INMODEREG(0),                     // Pipeline stages for INMODE (0-1)
        .MREG(0),                          // Multiplier pipeline stages (0-1)
        .OPMODEREG(0),                     // Pipeline stages for OPMODE (0-1)
        .PREG(0)                           // Number of pipeline stages for P (0-1)
    )
    DSP48E2_inst (
        // Cascade outputs: Cascade Ports
        .ACOUT(),                        // 30-bit output: A port cascade
        .BCOUT(),                        // 18-bit output: B cascade
        .CARRYCASCOUT(),                 // 1-bit output: Cascade carry
        .MULTSIGNOUT(),                  // 1-bit output: Multiplier sign cascade
        .PCOUT(),                        // 48-bit output: Cascade output
        // Control outputs: Control Inputs/Status Bits
        .OVERFLOW(),                     // 1-bit output: Overflow in add/acc
        .PATTERNBDETECT(),               // 1-bit output: Pattern bar detect
        .PATTERNDETECT(),                // 1-bit output: Pattern detect
        .UNDERFLOW(),                    // 1-bit output: Underflow in add/acc
        // Data outputs: Data Ports
        .CARRYOUT(),                     // 4-bit output: Carry
        .P(~a),                       // 48-bit output: Primary data
        .XOROUT(),                       // 8-bit output: XOR data
        // Cascade inputs: Cascade Ports
        .ACIN(30'd0),                    // 30-bit input: A cascade data
        .BCIN(18'd0),                    // 18-bit input: B cascade
        .CARRYCASCIN(1'b0),              // 1-bit input: Cascade carry
        .MULTSIGNIN(1'b0),               // 1-bit input: Multiplier sign cascade
        .PCIN(48'd0),                    // 48-bit input: P cascade
        // Control inputs: Control Inputs/Status Bits
        .ALUMODE(4'b0000),           // 4-bit input: ALU control
        .CARRYINSEL(3'd0),     // 3-bit input: Carry select
        .CLK(~a),                     // 1-bit input: Clock
        .INMODE(5'b00000),             // 5-bit input: INMODE control
        .OPMODE(9'b000000101),             // 9-bit input: Operation mode
        // Data inputs: Data Ports
        .A(~a),                       // 30-bit input: A data
        .B(~a),                       // 18-bit input: B data
        .C(~a),                       // 48-bit input: C data
        .CARRYIN(1'b0),                  // 1-bit input: Carry-in
        .D(27'd0),                       // 27-bit input: D data
        // Reset/Clock Enable inputs: Reset/Clock Enable Inputs
        .CEA1(~a),                       // 1-bit input: Clock enable for 1st stage AREG
        .CEA2(~a),                       // 1-bit input: Clock enable for 2nd stage AREG
        .CEAD(~a),                       // 1-bit input: Clock enable for ADREG
        .CEALUMODE(~a),                  // 1-bit input: Clock enable for ALUMODE
        .CEB1(~a),                       // 1-bit input: Clock enable for 1st stage BREG
        .CEB2(~a),                       // 1-bit input: Clock enable for 2nd stage BREG
        .CEC(~a),                        // 1-bit input: Clock enable for CREG
        .CECARRYIN(~a),                  // 1-bit input: Clock enable for CARRYINREG
        .CECTRL(~a),                     // 1-bit input: Clock enable for OPMODEREG and CARRYINSELREG
        .CED(~a),                        // 1-bit input: Clock enable for DREG
        .CEINMODE(~a),                   // 1-bit input: Clock enable for INMODEREG
        .CEM(~a),                        // 1-bit input: Clock enable for MREG
        .CEP(~a),                        // 1-bit input: Clock enable for PREG
        .RSTA(~a),                    // 1-bit input: Reset for AREG
        .RSTALLCARRYIN(~a),           // 1-bit input: Reset for CARRYINREG
        .RSTALUMODE(~a),              // 1-bit input: Reset for ALUMODEREG
        .RSTB(~a),                    // 1-bit input: Reset for BREG
        .RSTC(~a),                    // 1-bit input: Reset for CREG
        .RSTCTRL(~a),                 // 1-bit input: Reset for OPMODEREG and CARRYINSELREG
        .RSTD(~a),                    // 1-bit input: Reset for DREG and ADREG
        .RSTINMODE(~a),               // 1-bit input: Reset for INMODEREG
        .RSTM(~a),                    // 1-bit input: Reset for MREG
        .RSTP(~a)                     // 1-bit input: Reset for PREG
    );


here-string-delimiter
   ; prevents autoformatter from breaking here-string
   p-name
   clk-name
   a-name
   b-name
   c-name
   ce-name
   ce-name
   ce-name
   ce-name
   ce-name
   ce-name
   ce-name
   ce-name
   ce-name
   ce-name
   ce-name
   ce-name
   ce-name
   reset-name
   reset-name
   reset-name
   reset-name
   reset-name
   reset-name
   reset-name
   reset-name
   reset-name
   reset-name))

(define (dsp48e2-enum-val-to-str v)
  (match (bitvector->natural v)
    [0 "A"]
    [1 "B"]
    [2 "AD"]
    [3 "NO_RESET"]
    [4 "RESET_MATCH"]
    [5 "RESET_NOT_MATCH"]
    [6 "RESET"]
    [7 "DIRECT"]
    [8 "MASK"]
    [9 "PATTERN"]
    [10 "MULTIPLY"]
    [11 "NO_PATDET"]
    [12 "ONE48"]
    [13 "FALSE"]
    [14 "XOR24_48_96"]
    [15 "CASCADE"]
    [16 "CEP"]
    [17 "C"]
    [18 "DYNAMIC"]
    [19 "FOUR12"]
    [20 "NONE"]
    [21 "PATDET"]
    [22 "ROUNDING_MODE1"]
    [23 "ROUNDING_MODE2"]
    [24 "TRUE"]
    [25 "TWO24"]
    [26 "XOR12"]))

;;; Compile DSP.
;;;
;;; For now, the output is just a list with a single entry, where that entry is the output P.
(define (make-ultrascale-plus-dsp48e2 compile
                                      get-bits
                                      add-cell
                                      add-netname
                                      add-parameter-default-value
                                      expr)
  (match-let* ([P (get-bits 48)]
               [(ultrascale-plus-dsp48e2 A
                                         ACASCREG
                                         ACIN
                                         ADREG
                                         ALUMODE
                                         ALUMODEREG
                                         AMULTSEL
                                         AREG
                                         AUTORESET_PATDET
                                         AUTORESET_PRIORITY
                                         A_INPUT
                                         B
                                         BCASCREG
                                         BCIN
                                         BMULTSEL
                                         BREG
                                         B_INPUT
                                         C
                                         CARRYCASCIN
                                         CARRYIN
                                         CARRYINREG
                                         CARRYINSEL
                                         CARRYINSELREG
                                         CEA1
                                         CEA2
                                         CEAD
                                         CEALUMODE
                                         CEB1
                                         CEB2
                                         CEC
                                         CECARRYIN
                                         CECTRL
                                         CED
                                         CEINMODE
                                         CEM
                                         CEP
                                         CLK
                                         CREG
                                         D
                                         DREG
                                         INMODE
                                         INMODEREG
                                         IS_ALUMODE_INVERTED
                                         IS_CARRYIN_INVERTED
                                         IS_CLK_INVERTED
                                         IS_INMODE_INVERTED
                                         IS_OPMODE_INVERTED
                                         IS_RSTALLCARRYIN_INVERTED
                                         IS_RSTALUMODE_INVERTED
                                         IS_RSTA_INVERTED
                                         IS_RSTB_INVERTED
                                         IS_RSTCTRL_INVERTED
                                         IS_RSTC_INVERTED
                                         IS_RSTD_INVERTED
                                         IS_RSTINMODE_INVERTED
                                         IS_RSTM_INVERTED
                                         IS_RSTP_INVERTED
                                         MASK
                                         MREG
                                         MULTSIGNIN
                                         OPMODE
                                         OPMODEREG
                                         PATTERN
                                         PCIN
                                         PREADDINSEL
                                         PREG
                                         RND
                                         RSTA
                                         RSTALLCARRYIN
                                         RSTALUMODE
                                         RSTB
                                         RSTC
                                         RSTCTRL
                                         RSTD
                                         RSTINMODE
                                         RSTM
                                         RSTP
                                         SEL_MASK
                                         SEL_PATTERN
                                         USE_MULT
                                         USE_PATTERN_DETECT
                                         USE_SIMD
                                         USE_WIDEXOR
                                         XORSIMD
                                         unnamed-input-331
                                         unnamed-input-488
                                         unnamed-input-750
                                         unnamed-input-806
                                         unnamed-input-850) expr]
               [cell (make-cell "DSP48E2"
                                (make-cell-port-directions (list 'A
                                                                 'ACIN
                                                                 'ALUMODE
                                                                 'B
                                                                 'BCIN
                                                                 'C
                                                                 'CARRYCASCIN
                                                                 'CARRYIN
                                                                 'CARRYINSEL
                                                                 'CEA1
                                                                 'CEA2
                                                                 'CEAD
                                                                 'CEALUMODE
                                                                 'CEB1
                                                                 'CEB2
                                                                 'CEC
                                                                 'CECARRYIN
                                                                 'CECTRL
                                                                 'CED
                                                                 'CEINMODE
                                                                 'CEM
                                                                 'CEP
                                                                 'CLK
                                                                 'D
                                                                 'INMODE
                                                                 'MULTSIGNIN
                                                                 'OPMODE
                                                                 'PCIN
                                                                 'RSTA
                                                                 'RSTALLCARRYIN
                                                                 'RSTALUMODE
                                                                 'RSTB
                                                                 'RSTC
                                                                 'RSTCTRL
                                                                 'RSTD
                                                                 'RSTINMODE
                                                                 'RSTM
                                                                 'RSTP)
                                                           (list 'P))
                                (hash 'P
                                      P
                                      'A
                                      (compile A)
                                      'ACIN
                                      (compile ACIN)
                                      'ALUMODE
                                      (compile ALUMODE)
                                      'B
                                      (compile B)
                                      'BCIN
                                      (compile BCIN)
                                      'C
                                      (compile C)
                                      'CARRYCASCIN
                                      (compile CARRYCASCIN)
                                      'CARRYIN
                                      (compile CARRYIN)
                                      'CARRYINSEL
                                      (compile CARRYINSEL)
                                      'CEA1
                                      (compile CEA1)
                                      'CEA2
                                      (compile CEA2)
                                      'CEAD
                                      (compile CEAD)
                                      'CEALUMODE
                                      (compile CEALUMODE)
                                      'CEB1
                                      (compile CEB1)
                                      'CEB2
                                      (compile CEB2)
                                      'CEC
                                      (compile CEC)
                                      'CECARRYIN
                                      (compile CECARRYIN)
                                      'CECTRL
                                      (compile CECTRL)
                                      'CED
                                      (compile CED)
                                      'CEINMODE
                                      (compile CEINMODE)
                                      'CEM
                                      (compile CEM)
                                      'CEP
                                      (compile CEP)
                                      'CLK
                                      (compile CLK)
                                      'D
                                      (compile D)
                                      'INMODE
                                      (compile INMODE)
                                      'MULTSIGNIN
                                      (compile MULTSIGNIN)
                                      'OPMODE
                                      (compile OPMODE)
                                      'PCIN
                                      (compile PCIN)
                                      'RSTA
                                      (compile RSTA)
                                      'RSTALLCARRYIN
                                      (compile RSTALLCARRYIN)
                                      'RSTALUMODE
                                      (compile RSTALUMODE)
                                      'RSTB
                                      (compile RSTB)
                                      'RSTC
                                      (compile RSTC)
                                      'RSTCTRL
                                      (compile RSTCTRL)
                                      'RSTD
                                      (compile RSTD)
                                      'RSTINMODE
                                      (compile RSTINMODE)
                                      'RSTM
                                      (compile RSTM)
                                      'RSTP
                                      (compile RSTP))
                                #:params (hash 'AMULTSEL
                                               (dsp48e2-enum-val-to-str AMULTSEL)
                                               'A_INPUT
                                               (dsp48e2-enum-val-to-str A_INPUT)
                                               'BMULTSEL
                                               (dsp48e2-enum-val-to-str BMULTSEL)
                                               'B_INPUT
                                               (dsp48e2-enum-val-to-str B_INPUT)
                                               'PREADDINSEL
                                               (dsp48e2-enum-val-to-str PREADDINSEL)
                                               'RND
                                               (make-literal-value-from-bv RND)
                                               'USE_MULT
                                               (dsp48e2-enum-val-to-str USE_MULT)
                                               'USE_SIMD
                                               (dsp48e2-enum-val-to-str USE_SIMD)
                                               'USE_WIDEXOR
                                               (dsp48e2-enum-val-to-str USE_WIDEXOR)
                                               'XORSIMD
                                               (dsp48e2-enum-val-to-str XORSIMD)
                                               'AUTORESET_PATDET
                                               (dsp48e2-enum-val-to-str AUTORESET_PATDET)
                                               'AUTORESET_PRIORITY
                                               (dsp48e2-enum-val-to-str AUTORESET_PRIORITY)
                                               'MASK
                                               (make-literal-value-from-bv MASK)
                                               'PATTERN
                                               (make-literal-value-from-bv PATTERN)
                                               'SEL_MASK
                                               (dsp48e2-enum-val-to-str SEL_MASK)
                                               'SEL_PATTERN
                                               (dsp48e2-enum-val-to-str SEL_PATTERN)
                                               'USE_PATTERN_DETECT
                                               (dsp48e2-enum-val-to-str USE_PATTERN_DETECT)
                                               'IS_ALUMODE_INVERTED
                                               (make-literal-value-from-bv IS_ALUMODE_INVERTED)
                                               'IS_CARRYIN_INVERTED
                                               (make-literal-value-from-bv IS_CARRYIN_INVERTED)
                                               'IS_CLK_INVERTED
                                               (make-literal-value-from-bv IS_CLK_INVERTED)
                                               'IS_INMODE_INVERTED
                                               (make-literal-value-from-bv IS_INMODE_INVERTED)
                                               'IS_OPMODE_INVERTED
                                               (make-literal-value-from-bv IS_OPMODE_INVERTED)
                                               'IS_RSTALLCARRYIN_INVERTED
                                               (make-literal-value-from-bv IS_RSTALLCARRYIN_INVERTED)
                                               'IS_RSTALUMODE_INVERTED
                                               (make-literal-value-from-bv IS_RSTALUMODE_INVERTED)
                                               'IS_RSTA_INVERTED
                                               (make-literal-value-from-bv IS_RSTA_INVERTED)
                                               'IS_RSTB_INVERTED
                                               (make-literal-value-from-bv IS_RSTB_INVERTED)
                                               'IS_RSTCTRL_INVERTED
                                               (make-literal-value-from-bv IS_RSTCTRL_INVERTED)
                                               'IS_RSTC_INVERTED
                                               (make-literal-value-from-bv IS_RSTC_INVERTED)
                                               'IS_RSTD_INVERTED
                                               (make-literal-value-from-bv IS_RSTD_INVERTED)
                                               'IS_RSTINMODE_INVERTED
                                               (make-literal-value-from-bv IS_RSTINMODE_INVERTED)
                                               'IS_RSTM_INVERTED
                                               (make-literal-value-from-bv IS_RSTM_INVERTED)
                                               'IS_RSTP_INVERTED
                                               (make-literal-value-from-bv IS_RSTP_INVERTED)
                                               'ACASCREG
                                               (make-literal-value-from-bv ACASCREG)
                                               'ADREG
                                               (make-literal-value-from-bv ADREG)
                                               'ALUMODEREG
                                               (make-literal-value-from-bv ALUMODEREG)
                                               'AREG
                                               (make-literal-value-from-bv AREG)
                                               'BCASCREG
                                               (make-literal-value-from-bv BCASCREG)
                                               'BREG
                                               (make-literal-value-from-bv BREG)
                                               'CARRYINREG
                                               (make-literal-value-from-bv CARRYINREG)
                                               'CARRYINSELREG
                                               (make-literal-value-from-bv CARRYINSELREG)
                                               'CREG
                                               (make-literal-value-from-bv CREG)
                                               'DREG
                                               (make-literal-value-from-bv DREG)
                                               'INMODEREG
                                               (make-literal-value-from-bv INMODEREG)
                                               'MREG
                                               (make-literal-value-from-bv MREG)
                                               'OPMODEREG
                                               (make-literal-value-from-bv OPMODEREG)
                                               'PREG
                                               (make-literal-value-from-bv PREG)))])
    (add-netname 'P (make-net-details P))
    (add-cell 'DSP48E2 cell)
    (list P)))

(define (compile-xilinx-ultrascale-plus-carry8 compile
                                               get-bits
                                               add-cell
                                               add-netname
                                               add-parameter-default-value
                                               expr)
  (match-define (xilinx-ultrascale-plus-carry8 carry-type ci ci-top di s) expr)
  (define o (get-bits 8))
  (define co (get-bits 8))
  (add-netname 'o (make-net-details o))
  (add-netname 'co (make-net-details co))
  (define carry8-cell
    (make-cell "CARRY8"
               (make-cell-port-directions (list 'CARRY_TYPE 'CI 'CI_TOP 'DI 'S) (list 'CO 'O))
               (hasheq-helper 'CARRY_TYPE
                              (compile carry-type)
                              'CI
                              (compile ci)
                              'CI_TOP
                              (compile ci-top)
                              'DI
                              (compile di)
                              'S
                              (compile s)
                              'O
                              o
                              'CO
                              co)))
  (add-cell 'carry8 carry8-cell)
  (list co o))

(define (compile-xilinx-ultrascale-plus-lut6 compile
                                             get-bits
                                             add-cell
                                             add-netname
                                             add-parameter-default-value
                                             expr)
  (match-define (xilinx-ultrascale-plus-lut6 i0 i1 i2 i3 i4 i5 init) expr)
  (define o (get-bits 1))
  (add-netname 'O (make-net-details o))
  (define lut6-cell
    (make-cell "LUT6"
               (make-cell-port-directions (list 'I0 'I1 'I2 'I3 'I4 'I5) (list 'O))
               (hasheq-helper 'I0
                              (compile i0)
                              'I1
                              (compile i1)
                              'I2
                              (compile i2)
                              'I3
                              (compile i3)
                              'I4
                              (compile i4)
                              'I5
                              (compile i5)
                              'O
                              o)
               #:params (hasheq 'INIT (make-literal-value-from-bv init))))
  (add-cell 'lut6 lut6-cell)
  o)

(define (compile-xilinx-ultrascale-plus-lut6-2 compile
                                               get-bits
                                               add-cell
                                               add-netname
                                               add-parameter-default-value
                                               expr)
  (match-define (xilinx-ultrascale-plus-lut6-2 i0 i1 i2 i3 i4 i5 init) expr)
  (define o5 (get-bits 1))
  (define o6 (get-bits 1))
  (add-netname 'O5 (make-net-details o5))
  (add-netname 'O6 (make-net-details o6))
  (define lut6-2-cell
    (make-cell "LUT6_2"
               (make-cell-port-directions (list 'I0 'I1 'I2 'I3 'I4 'I5) (list 'O5 'O6))
               (hasheq-helper 'I0
                              (compile i0)
                              'I1
                              (compile i1)
                              'I2
                              (compile i2)
                              'I3
                              (compile i3)
                              'I4
                              (compile i4)
                              'I5
                              (compile i5)
                              'O5
                              o5
                              'O6
                              o6)
               #:params (hasheq 'INIT (make-literal-value-from-bv init))))
  (add-cell 'lut6-2 lut6-2-cell)
  (list o5 o6))
