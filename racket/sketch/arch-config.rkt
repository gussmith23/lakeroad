#lang errortrace racket
(require (prefix-in lr: "../language.rkt")
         (submod "primitive-interface.rkt" helpers)
         "../utils.rkt"
         "primitive-interface.rkt"
         rosette
         racket/pretty)

(provide make-signature
         (struct-out signature)
         arch-config
         make-primitive
         primitive
         implement-primitive-interface)

; A signature captures all input, output, and paramter information provided by a
; verilog file. Each inputs/outputs/parameters are a list of name/bitwidth
; tuples, e.g.
;
;    '((A 1) (B 1) (C 1) (D 1))
;    '((INIT 16))
;
; Names are symbols and bitwidths are integers
(struct signature (inputs outputs parameters))

(define (make-signature inputs outputs parameters)
  (signature (normalize-signature-values inputs)
             (normalize-signature-values outputs)
             (normalize-signature-values parameters)))

; Represents an architecture-specific primitive
;
; + architecture: the name of the architecture
; + name: the name of the primitive (this is the Verilog module name, e.g. 'LUT4)
; + type: the type of this primitive, if applicable (e.g., 'LUT, 'MUX', 'DSP, 'OTHER)
; + signature: the signature of this
(struct primitive (architecture name type signature))

; make-primitive: a wrapper around the `primitive` constructor. This gives a
; static description of an architecture-specific primitive and is later
; translated to a lr:primitive during sketch generation.
;
; Parameters
; ----------
; + architecture: the name of the architecture
; + name: name of the primitive (this should be the Verilog module name, e.g. 'LUT4)
; + signature: a `signature` object representing names and types of inputs,
;   ouptuts, and paramaters: use (signature ...) to construct (defined above as
;   make-signature and renamed-out to signature)
; + #:type: the type of this primitive, defaults to 'OTHER
(define (make-primitive architecture name type signature)
  (primitive architecture name type signature))

; arch-config
;
; An arch-config struct represents an architecture configuration used during sketch generation.
; This struct contains the following data:
;
; + arch-name: the string-name of the architecture that this config applies to
; + primitives: a list of the raw `primitive` structs contained by this
;   arch-config
; + implementations: this is a function with the signature:
;
;     f: arch-config, primitive-interface, #:symbolic-state -> (cons lr:primitive symbolic-state)
;
; In detail, implementations takes the following inputs and outputs
;
; `implementations` inputs
; ------------------------
; + an arch-config describing the architecture that will be implementing the
;   primtive-interface
; + a primitive-interface to be implemented with the arch-config
; + Optionally, a keyword argument #:symbolic-state that defaults to #f. This
;   can be used to pass in an opaque reference to some symbolic state to be
;   reused from another primitive. We describe the motivation for this parameter
;   in more detail below
;
; `implementations` outputs
;
(struct arch-config (arch-name primitives implementations) #:transparent)

; implement-primitive-interface: ask an arch-config for an implementation of a
; primitive interface, optionally using some already allocated symbolic state
(define (implement-primitive-interface config prim-interface #:symbolic-state [sym-state #f])
  ((arch-config-implementations config) config prim-interface #:symbolic-state #f))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   HELPER FUNCTIONS   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; get-interface-impl
;
; This is a helper function to pull out an arch-config's `implementions`
; function and use it to impelemnt a primtive-interface.
(define (get-interface-impl config primitive-interface #:symbolic-state [symbolic-state #f])
  (let ([fn (arch-config-implementations config)]) (fn config primitive-interface symbolic-state)))

; This is an architecture-agnostic helper function that recursively creates a
; LUT-N from smaller LUTs. This function breaks the problem of creating a LUT N
; down into two LUT N-1s.
;
; This API also allows for already-allocated symbolic state to be passed in. The
; expected form is:
;
;     (list
;       mux-symbolic-state
;       left-sub-lut-symbolic-state
;       right-sub-lut-symbolic-state)
;
; By default #f is passed as symbolic state: this causes new symbolic state to
; be allocated.
(define (recursively-create-lut arch-config lut-prim-interface #:symbolic-state [symbolic-state #f])
  (match-let*
      (; First, destructure the primitive-interface
       [(primitive-interface 'LUT _ params actual-inputs) lut-prim-interface]

       ; Get the relevent parameters (num-inputs and num-outputs)
       [(cons _ num-inputs) (assoc 'num-inputs params)]
       [(cons _ num-outputs) (assoc 'num-outputs params)]

       ; Reuse or allocate symbolic state
       [(list mux-sym-state left-sym-state right-sym-state)
        (match symbolic-state
          [(list left mux right) symbolic-state]
          [#f (list #f #f #f)]
          [else
           (error (format "Invalid symbolic state ~a for recursively creating a lut"
                          symbolic-state))])]
       [(cons selector-bit rest-actual-inputs) actual-inputs]
       [smaller-prim-interface (make-lut-interface (sub1 num-inputs) num-outputs rest-actual-inputs)]
       [impl-fn-tmp (arch-config-implementations arch-config)]
       ; Convenience function to implement smaller primitives
       [impl-fn (lambda (prim symstate) (impl-fn-tmp arch-config prim #:symbolic-state symstate))]

       ; Get the two LUTs
       [(cons left-result left-state) (impl-fn smaller-prim-interface left-sym-state)]
       [(cons right-result right-state) (impl-fn smaller-prim-interface right-sym-state)]
       ; Then, combine the two recursively-defined LUTs w/ a mux.
       ;
       ; First, make a MUX21 primitive:
       [mux-prim (mux21-interface (lr:first left-result) (lr:first right-result) selector-bit)]
       ; Then ask the impl-fn for an implementation of this primitive
       [(cons mux mux-state) (impl-fn mux-prim mux-sym-state)]
       ; Combine the symbolic state from the two LUTs and the MUX into a single list
       [sym-state (list mux-state left-state right-state)])
    ; Finally we return a lr:primitive/symbolic-state pair
    (cons mux sym-state)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    EXAMPLES    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ============================================================================ ;
;;;;;;;;;;;;;;;;;;;;  A Sample Lattice ECP5 Implementation ;;;;;;;;;;;;;;;;;;;;;
; ============================================================================ ;

; ---------------------------------------------------------------------------- ;
; This simplified lattice implementation is for testing purposes only and      ;
; not be used for production. The defined ecp5 components, including:          ;
;                                                                              ;
;   + ecp5:lut4                                                                ;
;   + ecp5:pfumx                                                               ;
;   + ecp5:impl                                                                ;
;                                                                              ;
; are provided in sub-module ecp5:test-values                                  ;
; ---------------------------------------------------------------------------- ;

(define ecp5:lut4
  (make-primitive 'Lattice-ECP5 'LUT4 'LUT (signature '((A 1) (B 1) (C 1) (D 1)) '(Z) '((INIT 16)))))

; Example of a L6MUX21 Primitive for lattice ecp5
; Verilog:
;     module L6MUX21 (input D0, D1, SD, output Z);
(define ecp5:l6mux21
  (make-primitive 'Lattice-ECP5 'L6MUX21 'MUX (signature '((A 1) (B 1) (C 1) (D 1)) '((Z 1)) '())))

; This function is responsible for implementing primitive interfaces for
; lattice-ecp5. This will be used as the `implementations` field of the
; `arch-config` struct
(define (ecp5:impl config prim-interface #:symbolic-state [symbolic-state #f])
  (match-define (primitive-interface type (interface-signature formal-ins formal-outs) params actuals)
    prim-interface)
  (when (and (list? actuals) (not (= (length actuals) (length formal-ins))))
    (format
     (error "invalid state: length of formal inputs ~a does not match length of actual inputs ~a")
     formal-ins
     actuals))

  ; Helper funtion for readability
  (define (get-param param)
    (primitive-interface-get-param prim-interface param))
  (define (make-lut4 actuals params)
    (lr:primitive 'LUT4 (lr:map cons (list '(A B C D) actuals)) params))
  (define (make-pfumx actuals)
    (lr:primitive 'PFUMX (lr:map cons (list '(ALUT BLUT C0) actuals)) '()))
  (define (make-ccu2c actuals-a actuals-b cin params)
    (let* ([actuals-a (lr:map cons (list '(A0 B0 C0 D0) actuals-a))]
           [actuals-b (lr:map cons (list '(A1 B1 C1 D1) actuals-b))]
           [actuals (cons (cons 'CIN cin) (append actuals-a actuals-b))])
      (lr:primitive 'CCU2C actuals params)))
  ; This is a helper function for CCU2C. We want to fold over inputs two at a
  ; time, so we make inputs into a list of (cons .. ..). We add a default value
  ; at the end if needed of size bits-per-lut
  (define (inputs->pairs inputs bits-per-lut)
    (match inputs
      ['() '()]
      [(list x) (list (cons x (make-list bits-per-lut (bv 1 1))))]
      [(list a b c ...) (cons (cons a b) (inputs->pairs c bits-per-lut))]))

  (match type
    ['LUT
     (let ([num-inputs (get-param 'num-inputs)])
       (cond
         [(< num-inputs 4) ; Pad extra constant bitvectors to inputs and use for LUT4
          (let* ([pad-size (- 4 num-inputs)]
                 [pads (make-list pad-size (bv 1 1))] ; Default to padding to high
                 [padded-actuals (lr:append (list actuals pads))] ; We pad inputs to the right
                 [sym-state (match symbolic-state
                              ; If no symbolic state is present we build up an
                              ; assoc list mapping the only parameter (INIT) to
                              ; fresh symbolic state
                              ;
                              ; TODO: sym state allocation should be done
                              ; automatically based off of the primitive
                              ; definition
                              [#f (list (cons 'INIT (??* (bitvector 16))))]
                              [(list (cons 'INIT hole)) symbolic-state]
                              [_
                               (error (string-append "Invalid symbolic state for ECP5 LUT4:\n"
                                                     "Expected (list (cons 'INIT _)) but got"
                                                     symbolic-state))])])
            (cons (make-lut4 padded-actuals sym-state) sym-state))]
         [(= num-inputs 4)
          (let* ([sym-state (match symbolic-state
                              ; TODO: sym state allocation should be done
                              ; automatically based off of the primitive
                              ; definition
                              [#f (list (cons 'INIT (??* (bitvector 16))))]
                              [(list (cons 'INIT hole)) symbolic-state]
                              [else
                               (error (string-append "Invalid symbolic state for ECP5 LUT4:\n"
                                                     "Expected (list (cons 'INIT _)) but got"
                                                     symbolic-state))])])
            (cons (make-lut4 actuals sym-state) sym-state))]
         [(> num-inputs 4)
          (recursively-create-lut config prim-interface #:symbolic-state symbolic-state)]))]
    ['MUX
     (let ([num-inputs (get-param 'num-inputs)])
       (when (not (= num-inputs 2))
         (error "Only MUX21 are currently supported"))
       (cons (make-pfumx actuals) '()))]
    ['LUT-WITH-CARRY
     (match-let*
         ([num-luts (get-param 'num-luts)]
          [inputs-per-lut (get-param 'inputs-per-lut)]
          [num-inputs (get-param 'num-inputs)]
          [num-outputs (get-param 'num-outputs)]
          ; Destructure symbolic state: if it's passed in it will be of the form
          [sym-state
           (if symbolic-state
               symbolic-state
               (cons (list (cons 'INIT (??* (bitvector 16))) ('INJECT1 (??* (bitvector 1))))))]
          [(cons sum-lut-state extra-lut-state) sym-state]
          ; Now we want a procedure to fold over CCU2Cs. This takes two inputs:
          ; + the list of remaining physical inputs
          ; + the accumulator data value, a list comprising:
          ;   1. a list of the generated sum-bits
          ;   2. the carry-out from the previous ccu2c
          ;
          ; Symbolic state is of form (cons SUM-LUT-STATE EXTRA-LUT-STATE),
          ; where
          ;   - SUM-LUT-STATE is the state of a SUM lut (the main kind of lut),
          ;     and is used for all LUTs in CCU2Cs except for maybe the final
          ;     LUT in the case of odd arity.
          ;
          ;   - EXTRA-LUT-STATE is state for a LUT that isn't used in a CCU2C.
          ;     However, it might need to pass some carry information along, so
          ;     we need to synthesize over it. EXTRA-LUT-STATE is only used when
          ;     an odd number of sum-bits are computed, and only for the last
          ;     LUT created to represent such an expression.
          ;
          ; NOTE: We need to start folding on the LSB and build up to the MSB.
          ; This is because the MSB requires the carry-in from the previous
          ; CCU2C.
          ;
          ; Inputs are expected to look like this:
          ;
          ; **Convention:** CCU2Cs each have two LUTs. I'm calling the lut lower
          ; on the carry chain (i.e., the lut that may generate a carry signal
          ; that propegates to the other LUT) LUT-a. The other LUT is LUT-b.  In
          ; a normal adding type operation LUT-a is the LSB and LUT-b is the
          ; MSB.
          ;
          [proc (lambda (phys-inputs acc)
                  (match-let* ([(cons actuals-a actuals-b) phys-inputs]
                               ; First, destructure the accumulator value
                               [(list sum-bits cin) acc]
                               [num-luts-left (- num-luts (length sum-bits))]
                               [_ (when (>= 0 num-luts-left (error "Illegal state"))
                                    )]
                               ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                               ;                      SYMBOLIC STATE
                               ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                               ; Over the next few lines we build up symbolic state for
                               ; LUT-a and LUT-b
                               ;
                               ;                        LUT-a
                               ; By construction there is at least one sum lut, so LUT-a
                               ; always uses the sum-lut symbolic state state
                               [sym-state-a
                                (list (cons 'INIT0 (cdr (assoc 'INIT sum-lut-state)))
                                      (cons 'INJECT1_0 (cdr (assoc 'INJECT1 sum-lut-state))))]
                               ;                        LUT-b
                               ; LUT-b uses a sum-lut-state whenever num-luts-left is
                               ; greater than 1. Otherwise it uses extra-lut-state
                               [sym-state-b
                                (if (equal? 1 num-luts-left)
                                    (list (cons 'INIT1 (cdr (assoc 'INIT extra-lut-state)))
                                          (cons 'INJECT1_1 (cdr (assoc 'INJECT1 extra-lut-state))))
                                    (list (cons 'INIT1 (cdr (assoc 'INIT sum-lut-state)))
                                          (cons 'INJECT1_1 (cdr (assoc 'INJECT1 sum-lut-state)))))]
                               ; combine these into a single ccu2c params assoc list. It
                               ; should have four entries: INIT0 INJECT1_0 INIT1 INJECT1_1
                               [ccu2c-params (append sym-state-b sym-state-a)]
                               [ccu2c (make-ccu2c actuals-a actuals-b cin ccu2c-params)]
                               ; Now, let's get the sum bits and carry-out bits from the ccu2c
                               [s0 (lr:list-ref ccu2c 0)]
                               [s1 (lr:list-ref ccu2c 1)]
                               [cout (lr:list-ref ccu2c 2)]
                               [sum-bits (cons s1 (cons s0 sum-bits))])
                    (list sum-bits cout (- num-luts-left 2))))]
          [paired-inputs (inputs-to-pairs actuals inputs-per-lut)]
          [base (list '() (bv 0 1))] ; The base accumulator
          [result (foldr proc base paired-inputs)])
       (cons result sym-state))]
    [else (error (format "unsupported primitive type ~a" type))]))

(define ecp5:config (arch-config 'Lattice-ECP5 (list ecp5:lut4 ecp5:l6mux21) ecp5:impl))

(module* test-values #f
  (provide ecp5:lut4
           ecp5:l6mux21
           ecp5:config))
