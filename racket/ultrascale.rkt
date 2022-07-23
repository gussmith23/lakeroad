#lang errortrace racket

(provide interpret-ultrascale-plus
         ultrascale-plus-clb
         ultrascale-plus-lut6-2
         compile-ultrascale-plus-dsp48e2
         interpret-ultrascale-plus-dsp48e2
         ultrascale-plus-dsp48e2
         ultrascale-plus-grammar
         make-ultrascale-plus-clb
         make-ultrascale-plus-dsp48e2
         interpret-ultrascale-plus-carry8)

(require rosette
         rosette/lib/synthax
         "comp-json.rkt"
         "lut.rkt")

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
  (match-let*
   ([`(ultrascale-plus-clb ,cin
                           ,lut-a
                           ,lut-b
                           ,lut-c
                           ,lut-d
                           ,lut-e
                           ,lut-f
                           ,lut-g
                           ,lut-h
                           ,mux-selector-a
                           ,mux-selector-b
                           ,mux-selector-c
                           ,mux-selector-d
                           ,mux-selector-e
                           ,mux-selector-f
                           ,mux-selector-g
                           ,mux-selector-h
                           ,inputs)
     expr]
    ;;; Compile input expression.
    [(list a-ins b-ins c-ins d-ins e-ins f-ins g-ins h-ins) (lakeroad->jsexpr inputs)]
    ;;; Index bitvector at bit id.
    [bit (lambda (n l) (list-ref l n))]
    ;;; Nets.
    [luts_O5 (get-bits 8)]
    [luts_O6 (get-bits 8)]
    [o (get-bits 8)]
    [co (get-bits 8)]
    [mux-helper
     (lambda (o5 o6 carry-o carry-co selector)
       (if (bveq selector (bv 0 2))
           o5
           (if (bveq selector (bv 1 2)) o6 (if (bveq selector (bv 2 2)) carry-o carry-co))))]
    [out
     (map mux-helper
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
    [A_LUT
     (apply make-ultrascale-plus-lut6-2
            (make-literal-value-from-bv lut-a)
            (append a-ins (list (bit 0 luts_O5) (bit 0 luts_O6))))]
    [B_LUT
     (apply make-ultrascale-plus-lut6-2
            (make-literal-value-from-bv lut-b)
            (append b-ins (list (bit 1 luts_O5) (bit 1 luts_O6))))]
    [C_LUT
     (apply make-ultrascale-plus-lut6-2
            (make-literal-value-from-bv lut-c)
            (append c-ins (list (bit 2 luts_O5) (bit 2 luts_O6))))]
    [D_LUT
     (apply make-ultrascale-plus-lut6-2
            (make-literal-value-from-bv lut-d)
            (append d-ins (list (bit 3 luts_O5) (bit 3 luts_O6))))]
    [E_LUT
     (apply make-ultrascale-plus-lut6-2
            (make-literal-value-from-bv lut-e)
            (append e-ins (list (bit 4 luts_O5) (bit 4 luts_O6))))]
    [F_LUT
     (apply make-ultrascale-plus-lut6-2
            (make-literal-value-from-bv lut-f)
            (append f-ins (list (bit 5 luts_O5) (bit 5 luts_O6))))]
    [G_LUT
     (apply make-ultrascale-plus-lut6-2
            (make-literal-value-from-bv lut-g)
            (append g-ins (list (bit 6 luts_O5) (bit 6 luts_O6))))]
    [H_LUT
     (apply make-ultrascale-plus-lut6-2
            (make-literal-value-from-bv lut-h)
            (append h-ins (list (bit 7 luts_O5) (bit 7 luts_O6))))]
    ;;; Carry.
    [carry (make-ultrascale-plus-carry8 "0" (bit 0 (lakeroad->jsexpr cin)) luts_O5 luts_O6 o co)])
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
  `(take (ultrascale-plus-clb
          ,(cin)
          ,(lutmem)
          ,(lutmem)
          ,(lutmem)
          ,(lutmem)
          ,(lutmem)
          ,(lutmem)
          ,(lutmem)
          ,(lutmem)
          ,(mux)
          ,(mux)
          ,(mux)
          ,(mux)
          ,(mux)
          ,(mux)
          ,(mux)
          ,(mux)
          (logical-to-physical-mapping ,(choose '(bitwise) '(bitwise-reverse)) ,(logical-list)))
         8)]
 [logical-list
  (choose (list (logical-8bit) (logical-8bit) (bv #xff 8) (bv #xff 8) (bv #xff 8) (bv #xff 8))
          `(physical-to-logical-mapping
            ,(choose '(bitwise) `(choose-one ,(bv 0 1)) '(bitwise-reverse))
            ,(physical-list)))]
 ;;; 8bit logical input
 ;;; Note: it's important that all unused inputs get set to HIGH. This is most important for the sixth
 ;;; input, as on Xilinx UltraScale+, the sixth input to each LUT must be held high to enable two
 ;;; distinct outputs. By providing #xff as a choosable constant, we let the synthesizer decide when
 ;;; to use it.
 [logical-8bit (choose (logical-input) (bv #xff 8) (bv #x00 8) `(first ,(logical-list)))])

; Contains the state for a LUT6_2.
; memory is the LUT's memory: (bitvector 64).
(struct ultrascale-plus-lut6-2 (memory))

(module+ test
  (require rackunit)
  (check-equal? (lut (bv #b0110 4) (bv 0 1)) (bv #b0 1))
  (check-equal? (lut (bv #b0110 4) (bv 1 1)) (bv #b1 1))
  (check-equal? (lut (bv #b0110 4) (bv 2 2)) (bv #b1 1))
  (check-equal? (lut (bv #b0110 4) (bv 3 2)) (bv #b0 1)))

(define (interpret-ultrascale-plus-lut6-2 interpreter expr)
  (match expr
    [`(ultrascale-plus-lut6-2 ,memory ,inputs)
     (interpret-ultrascale-plus-lut6-2-impl (ultrascale-plus-lut6-2 memory) (interpreter inputs))]))

; LUT6_2 primitive described on page 37 of
; https://www.xilinx.com/support/documentation/user_guides/ug574-ultrascale-clb.pdf
;
; lut is the lut6-2 struct.
;
; inputs is a 6-bit bitvector, corresponding to I0 (LSB) through I5 (MSB) in figure 3-1.
;
; Returns the O5 and O6 signals.
(define (interpret-ultrascale-plus-lut6-2-impl lut6-2 inputs)
  (let* ([memory (ultrascale-plus-lut6-2-memory lut6-2)]
         [lut5-0 (lut (extract 63 32 memory) (extract 4 0 inputs))]
         [lut5-1 (lut (extract 31 0 memory) (extract 4 0 inputs))]
         [O6 (if (bitvector->bool (bit 5 inputs)) lut5-0 lut5-1)]
         [O5 lut5-1])
    (list O5 O6)))

(module+ test
  (require rackunit)
  (check-equal? (second (interpret-ultrascale-plus-lut6-2
                         identity
                         `(ultrascale-plus-lut6-2 ,(bv #x0000000000000008 64) ,(bv 0 6))))
                (bv 0 1))
  (check-equal? (second (interpret-ultrascale-plus-lut6-2
                         identity
                         `(ultrascale-plus-lut6-2 ,(bv #x0000000000000008 64) ,(bv 1 6))))
                (bv 0 1))
  (check-equal? (second (interpret-ultrascale-plus-lut6-2
                         identity
                         `(ultrascale-plus-lut6-2 ,(bv #x0000000000000008 64) ,(bv 2 6))))
                (bv 0 1))
  (check-equal? (second (interpret-ultrascale-plus-lut6-2
                         identity
                         `(ultrascale-plus-lut6-2 ,(bv #x0000000000000008 64) ,(bv 3 6))))
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
(struct ultrascale-plus-clb
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
    [`(ultrascale-plus-dsp48e2 ,a ,b ,c ,d)
     (interpret-ultrascale-plus-dsp48e2-new (interpreter a)
                                            (interpreter b)
                                            (interpreter c)
                                            (interpreter d))]
    [`(ultrascale-plus-lut6-2 ,init ,inputs) (interpret-ultrascale-plus-lut6-2 interpreter expr)]
    [`(ultrascale-plus-lut3 ,init ,inputs) (lut init (interpreter inputs))]
    [`(ultrascale-plus-lut2 ,init ,inputs) (lut init (interpreter inputs))]
    [`(ultrascale-plus-lut1 ,init ,inputs) (lut init (interpreter inputs))]
    [`(ultrascale-plus-clb ,cin
                           ,lut-a
                           ,lut-b
                           ,lut-c
                           ,lut-d
                           ,lut-e
                           ,lut-f
                           ,lut-g
                           ,lut-h
                           ,mux-selector-a
                           ,mux-selector-b
                           ,mux-selector-c
                           ,mux-selector-d
                           ,mux-selector-e
                           ,mux-selector-f
                           ,mux-selector-g
                           ,mux-selector-h
                           ,inputs)

     (let* ([inputs (interpreter inputs)]
            [lut-input-a (first inputs)]
            [lut-input-b (second inputs)]
            [lut-input-c (third inputs)]
            [lut-input-d (fourth inputs)]
            [lut-input-e (fifth inputs)]
            [lut-input-f (sixth inputs)]
            [lut-input-g (seventh inputs)]
            [lut-input-h (eighth inputs)])
       (interpret-ultrascale-plus-clb-impl (ultrascale-plus-clb (ultrascale-plus-lut6-2 lut-a)
                                                                (ultrascale-plus-lut6-2 lut-b)
                                                                (ultrascale-plus-lut6-2 lut-c)
                                                                (ultrascale-plus-lut6-2 lut-d)
                                                                (ultrascale-plus-lut6-2 lut-e)
                                                                (ultrascale-plus-lut6-2 lut-f)
                                                                (ultrascale-plus-lut6-2 lut-g)
                                                                (ultrascale-plus-lut6-2 lut-h)
                                                                mux-selector-a
                                                                mux-selector-b
                                                                mux-selector-c
                                                                mux-selector-d
                                                                mux-selector-e
                                                                mux-selector-f
                                                                mux-selector-g
                                                                mux-selector-h)
                                           (interpreter cin)
                                           lut-input-a
                                           lut-input-b
                                           lut-input-c
                                           lut-input-d
                                           lut-input-e
                                           lut-input-f
                                           lut-input-g
                                           lut-input-h))]))

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
   ([(list a-o5 a-o6)
     (interpret-ultrascale-plus-lut6-2-impl (ultrascale-plus-clb-lut-a clb) lut-input-a)]
    [(list b-o5 b-o6)
     (interpret-ultrascale-plus-lut6-2-impl (ultrascale-plus-clb-lut-b clb) lut-input-b)]
    [(list c-o5 c-o6)
     (interpret-ultrascale-plus-lut6-2-impl (ultrascale-plus-clb-lut-c clb) lut-input-c)]
    [(list d-o5 d-o6)
     (interpret-ultrascale-plus-lut6-2-impl (ultrascale-plus-clb-lut-d clb) lut-input-d)]
    [(list e-o5 e-o6)
     (interpret-ultrascale-plus-lut6-2-impl (ultrascale-plus-clb-lut-e clb) lut-input-e)]
    [(list f-o5 f-o6)
     (interpret-ultrascale-plus-lut6-2-impl (ultrascale-plus-clb-lut-f clb) lut-input-f)]
    [(list g-o5 g-o6)
     (interpret-ultrascale-plus-lut6-2-impl (ultrascale-plus-clb-lut-g clb) lut-input-g)]
    [(list h-o5 h-o6)
     (interpret-ultrascale-plus-lut6-2-impl (ultrascale-plus-clb-lut-h clb) lut-input-h)]
    [(list carry-o carry-co)
     (interpret-ultrascale-plus-carry8 (concat h-o5 g-o5 f-o5 e-o5 d-o5 c-o5 b-o5 a-o5)
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
    [a-mux-out (mux-helper a-o5 a-o6 carry-o0 carry-co0 (ultrascale-plus-clb-mux-selector-a clb))]
    [b-mux-out (mux-helper b-o5 b-o6 carry-o1 carry-co1 (ultrascale-plus-clb-mux-selector-b clb))]
    [c-mux-out (mux-helper c-o5 c-o6 carry-o2 carry-co2 (ultrascale-plus-clb-mux-selector-c clb))]
    [d-mux-out (mux-helper d-o5 d-o6 carry-o3 carry-co3 (ultrascale-plus-clb-mux-selector-d clb))]
    [e-mux-out (mux-helper e-o5 e-o6 carry-o4 carry-co4 (ultrascale-plus-clb-mux-selector-e clb))]
    [f-mux-out (mux-helper f-o5 f-o6 carry-o5 carry-co5 (ultrascale-plus-clb-mux-selector-f clb))]
    [g-mux-out (mux-helper g-o5 g-o6 carry-o6 carry-co6 (ultrascale-plus-clb-mux-selector-g clb))]
    [h-mux-out (mux-helper h-o5 h-o6 carry-o7 carry-co7 (ultrascale-plus-clb-mux-selector-h clb))])
   (list a-mux-out b-mux-out c-mux-out d-mux-out e-mux-out f-mux-out g-mux-out h-mux-out cout)))

; Programmable state for DSP48E2. See spec in the spec-sheets dir.
(struct ultrascale-plus-dsp48e2 ())

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

; a: (bitvector 30)
; b: (bitvector 18)
; c: (bitvector 48)
; d: (bitvector 27)
; output: (bitvector 48)
(define (interpret-ultrascale-plus-dsp48e2-new
         a
         b
         c
         d
         #:AMULTSEL [AMULTSEL "A"] ;                   // Selects A input to multiplier (A, AD)
         #:A_INPUT
         [A_INPUT
          "DIRECT"] ;               // Selects A input source, "DIRECT" (A port) or "CASCADE" (ACIN port)
         #:BMULTSEL [BMULTSEL "B"] ;                   // Selects B input to multiplier (AD, B)
         #:B_INPUT
         [B_INPUT
          "DIRECT"] ;               // Selects B input source, "DIRECT" (B port) or "CASCADE" (BCIN port)
         #:PREADDINSEL [PREADDINSEL "A"] ;                // Selects input to pre-adder (A, B)
         #:RND [RND (bv 0 48)] ;           // Rounding Constant
         #:USE_MULT
         [USE_MULT "MULTIPLY"] ;            // Select multiplier usage (DYNAMIC, MULTIPLY, NONE)
         #:USE_SIMD [USE_SIMD "ONE48"] ;               // SIMD selection (FOUR12, ONE48, TWO24)
         #:USE_WIDEXOR [USE_WIDEXOR "FALSE"] ;            // Use the Wide XOR function (FALSE, TRUE)
         #:XORSIMD
         [XORSIMD "XOR24_48_96"] ;          // Mode of operation for the Wide XOR (XOR12, XOR24_48_96)
         #:AUTORESET_PATDET
         [AUTORESET_PATDET "NO_RESET"] ;    // NO_RESET, RESET_MATCH, RESET_NOT_MATCH
         #:AUTORESET_PRIORITY
         [AUTORESET_PRIORITY "RESET"] ;     // Priority of AUTORESET vs. CEP (CEP, RESET).
         #:MASK
         [MASK (bv #x3fffffffffff 48)] ;          // 48-bit mask value for pattern detect (1=ignore)
         #:PATTERN [PATTERN (bv 0 48)] ;       // 48-bit pattern match for pattern detect
         #:SEL_MASK [SEL_MASK "MASK"] ;                // C, MASK, ROUNDING_MODE1, ROUNDING_MODE2
         #:SEL_PATTERN [SEL_PATTERN "PATTERN"] ;          // Select pattern value (C, PATTERN)
         #:USE_PATTERN_DETECT
         [USE_PATTERN_DETECT "NO_PATDET"] ; // Enable pattern detect (NO_PATDET, PATDET)
         #:IS_ALUMODE_INVERTED [IS_ALUMODE_INVERTED (bv 0 4)] ;    // Optional inversion for ALUMODE
         #:IS_CARRYIN_INVERTED
         [IS_CARRYIN_INVERTED (bv 0 1)] ;       // Optional inversion for CARRYIN
         #:IS_CLK_INVERTED [IS_CLK_INVERTED (bv 0 1)] ;           // Optional inversion for CLK
         #:IS_INMODE_INVERTED [IS_INMODE_INVERTED (bv 0 5)] ;    // Optional inversion for INMODE
         #:IS_OPMODE_INVERTED [IS_OPMODE_INVERTED (bv 0 9)] ;// Optional inversion for OPMODE
         #:IS_RSTALLCARRYIN_INVERTED
         [IS_RSTALLCARRYIN_INVERTED (bv 0 1)] ; // Optional inversion for RSTALLCARRYIN
         #:IS_RSTALUMODE_INVERTED
         [IS_RSTALUMODE_INVERTED (bv 0 1)] ;    // Optional inversion for RSTALUMODE
         #:IS_RSTA_INVERTED [IS_RSTA_INVERTED (bv 0 1)] ;          // Optional inversion for RSTA
         #:IS_RSTB_INVERTED [IS_RSTB_INVERTED (bv 0 1)] ;          // Optional inversion for RSTB
         #:IS_RSTCTRL_INVERTED
         [IS_RSTCTRL_INVERTED (bv 0 1)] ;       // Optional inversion for RSTCTRL
         #:IS_RSTC_INVERTED [IS_RSTC_INVERTED (bv 0 1)] ;          // Optional inversion for RSTC
         #:IS_RSTD_INVERTED [IS_RSTD_INVERTED (bv 0 1)] ;          // Optional inversion for RSTD
         #:IS_RSTINMODE_INVERTED
         [IS_RSTINMODE_INVERTED (bv 0 1)] ;     // Optional inversion for RSTINMODE
         #:IS_RSTM_INVERTED [IS_RSTM_INVERTED (bv 0 1)] ;          // Optional inversion for RSTM
         #:IS_RSTP_INVERTED [IS_RSTP_INVERTED (bv 0 1)] ;          // Optional inversion for RSTP
         #:ACASCREG [ACASCREG 0] ; // Number of pipeline stages between A/ACIN and ACOUT (0-2)
         #:ADREG [ADREG 0] ; // Pipeline stages for pre-adder (0-1)
         #:ALUMODEREG [ALUMODEREG 0] ; // Pipeline stages for ALUMODE (0-1)
         #:AREG [AREG 0] ; // Pipeline stages for A (0-2)
         #:BCASCREG [BCASCREG 0] ; // Number of pipeline stages between B/BCIN and BCOUT (0-2)
         #:BREG [BREG 0] ; // Pipeline stages for B (0-2)
         #:CARRYINREG [CARRYINREG 0] ; // Pipeline stages for CARRYIN (0-1)
         #:CARRYINSELREG [CARRYINSELREG 0] ; // Pipeline stages for CARRYINSEL (0-1)
         #:CREG [CREG 0] ; // Pipeline stages for C (0-1)
         #:DREG [DREG 0] ; // Pipeline stages for D (0-1)
         #:INMODEREG [INMODEREG 0] ; // Pipeline stages for INMODE (0-1)
         #:MREG [MREG 0] ; // Multiplier pipeline stages (0-1)
         #:OPMODEREG [OPMODEREG 0] ; // Pipeline stages for OPMODE (0-1)
         #:PREG [PREG 0] ; // Number of pipeline stages for P (0-1)
         )
  (when (not (equal? AMULTSEL "A"))
    (error "not supported"))
  (when (not (equal? A_INPUT "DIRECT"))
    (error "not supported"))
  (when (not (equal? BMULTSEL "B"))
    (error "not supported"))
  (when (not (equal? B_INPUT "DIRECT"))
    (error "not supported"))
  (when (not (equal? PREADDINSEL "A"))
    (error "not supported"))
  (when (not (equal? RND (bv 0 48)))
    (error "not supported"))
  (when (not (equal? USE_MULT "MULTIPLY"))
    (error "not supported"))
  (when (not (equal? USE_SIMD "ONE48"))
    (error "not supported"))
  (when (not (equal? USE_WIDEXOR "FALSE"))
    (error "not supported"))
  (when (not (equal? XORSIMD "XOR24_48_96"))
    (error "not supported"))
  (when (not (equal? AUTORESET_PATDET "NO_RESET"))
    (error "not supported"))
  (when (not (equal? AUTORESET_PRIORITY "RESET"))
    (error "not supported"))
  (when (not (equal? MASK (bv #x3fffffffffff 48)))
    (error "not supported"))
  (when (not (equal? PATTERN (bv 0 48)))
    (error "not supported"))
  (when (not (equal? SEL_MASK "MASK"))
    (error "not supported"))
  (when (not (equal? SEL_PATTERN "PATTERN"))
    (error "not supported"))
  (when (not (equal? USE_PATTERN_DETECT "NO_PATDET"))
    (error "not supported"))
  (when (not (equal? IS_ALUMODE_INVERTED (bv 0 4)))
    (error "not supported"))
  (when (not (equal? IS_CARRYIN_INVERTED (bv 0 1)))
    (error "not supported"))
  (when (not (equal? IS_CLK_INVERTED (bv 0 1)))
    (error "not supported"))
  (when (not (equal? IS_INMODE_INVERTED (bv 0 5)))
    (error "not supported"))
  (when (not (equal? IS_OPMODE_INVERTED (bv 0 9)))
    (error "not supported"))
  (when (not (equal? IS_RSTALLCARRYIN_INVERTED (bv 0 1)))
    (error "not supported"))
  (when (not (equal? IS_RSTALUMODE_INVERTED (bv 0 1)))
    (error "not supported"))
  (when (not (equal? IS_RSTA_INVERTED (bv 0 1)))
    (error "not supported"))
  (when (not (equal? IS_RSTB_INVERTED (bv 0 1)))
    (error "not supported"))
  (when (not (equal? IS_RSTCTRL_INVERTED (bv 0 1)))
    (error "not supported"))
  (when (not (equal? IS_RSTC_INVERTED (bv 0 1)))
    (error "not supported"))
  (when (not (equal? IS_RSTD_INVERTED (bv 0 1)))
    (error "not supported"))
  (when (not (equal? IS_RSTINMODE_INVERTED (bv 0 1)))
    (error "not supported"))
  (when (not (equal? IS_RSTM_INVERTED (bv 0 1)))
    (error "not supported"))
  (when (not (equal? IS_RSTP_INVERTED (bv 0 1)))
    (error "not supported"))
  (when (not (equal? ACASCREG 0))
    (error "not supported"))
  (when (not (equal? ADREG 0))
    (error "not supported"))
  (when (not (equal? ALUMODEREG 0))
    (error "not supported"))
  (when (not (equal? AREG 0))
    (error "not supported"))
  (when (not (equal? BCASCREG 0))
    (error "not supported"))
  (when (not (equal? BREG 0))
    (error "not supported"))
  (when (not (equal? CARRYINREG 0))
    (error "not supported"))
  (when (not (equal? CARRYINSELREG 0))
    (error "not supported"))
  (when (not (equal? CREG 0))
    (error "not supported"))
  (when (not (equal? DREG 0))
    (error "not supported"))
  (when (not (equal? INMODEREG 0))
    (error "not supported"))
  (when (not (equal? MREG 0))
    (error "not supported"))
  (when (not (equal? OPMODEREG 0))
    (error "not supported"))
  (when (not (equal? PREG 0))
    (error "not supported"))
  (let* ([a (sign-extend a (bitvector 48))]
         [b (sign-extend b (bitvector 48))]
         [d (sign-extend d (bitvector 48))]
         [out (bvmul a b)])
    (list out)))

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

;;; Compile DSP.
;;;
;;; For now, the output is just a list with a single entry, where that entry is the output P.
(define (make-ultrascale-plus-dsp48e2 compile
                                      get-bits
                                      add-cell
                                      add-netname
                                      add-parameter-default-value
                                      expr)
  (match-let*
   ([P (get-bits 48)]
    [`(ultrascale-plus-dsp48e2 ,a ,b ,c ,d) expr]
    [cell
     (make-cell "DSP48E2"
                (make-cell-port-directions (list 'A 'B 'C 'D 'OPMODE) (list 'P))
                (hash 'A
                      (compile a)
                      'B
                      (compile b)
                      'D
                      (compile d)
                      'P
                      P
                      'OPMODE
                      (map ~a (map bitvector->natural (bitvector->bits (bv #b000000101 9)))))
                #:params (hash 'AMULTSEL
                               "A"
                               'A_INPUT
                               "DIRECT"
                               'BMULTSEL
                               "B"
                               'B_INPUT
                               "DIRECT"
                               'PREADDINSEL
                               "A"
                               'RND
                               (make-literal-value-from-bv (bv 0 48))
                               'USE_MULT
                               "MULTIPLY"
                               'USE_SIMD
                               "ONE48"
                               'USE_WIDEXOR
                               "FALSE"
                               'XORSIMD
                               "XOR24_48_96"
                               'AUTORESET_PATDET
                               "NO_RESET"
                               'AUTORESET_PRIORITY
                               "RESET"
                               'MASK
                               (make-literal-value-from-bv (bv #x3fffffffffff 48))
                               'PATTERN
                               (make-literal-value-from-bv (bv 0 48))
                               'SEL_MASK
                               "MASK"
                               'SEL_PATTERN
                               "PATTERN"
                               'USE_PATTERN_DETECT
                               "NO_PATDET"
                               'IS_ALUMODE_INVERTED
                               (make-literal-value-from-bv (bv 0 4))
                               'IS_CARRYIN_INVERTED
                               (make-literal-value-from-bv (bv 0 1))
                               'IS_CLK_INVERTED
                               (make-literal-value-from-bv (bv 0 1))
                               'IS_INMODE_INVERTED
                               (make-literal-value-from-bv (bv 0 5))
                               'IS_OPMODE_INVERTED
                               (make-literal-value-from-bv (bv 0 9))
                               'IS_RSTALLCARRYIN_INVERTED
                               (make-literal-value-from-bv (bv 0 1))
                               'IS_RSTALUMODE_INVERTED
                               (make-literal-value-from-bv (bv 0 1))
                               'IS_RSTA_INVERTED
                               (make-literal-value-from-bv (bv 0 1))
                               'IS_RSTB_INVERTED
                               (make-literal-value-from-bv (bv 0 1))
                               'IS_RSTCTRL_INVERTED
                               (make-literal-value-from-bv (bv 0 1))
                               'IS_RSTC_INVERTED
                               (make-literal-value-from-bv (bv 0 1))
                               'IS_RSTD_INVERTED
                               (make-literal-value-from-bv (bv 0 1))
                               'IS_RSTINMODE_INVERTED
                               (make-literal-value-from-bv (bv 0 1))
                               'IS_RSTM_INVERTED
                               (make-literal-value-from-bv (bv 0 1))
                               'IS_RSTP_INVERTED
                               (make-literal-value-from-bv (bv 0 1))
                               'ACASCREG
                               0
                               'ADREG
                               0
                               'ALUMODEREG
                               0
                               'AREG
                               0
                               'BCASCREG
                               0
                               'BREG
                               0
                               'CARRYINREG
                               0
                               'CARRYINSELREG
                               0
                               'CREG
                               0
                               'DREG
                               0
                               'INMODEREG
                               0
                               'MREG
                               0
                               'OPMODEREG
                               0
                               'PREG
                               0))])
   (add-netname 'P (make-net-details P))
   (add-cell 'DSP48E2 cell)
   (list P)))
