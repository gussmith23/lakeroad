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
     (let* ([num-luts (get-param 'num-luts)]
            [inputs-per-lut (get-param 'inputs-per-lut)]
            [num-inputs (get-param 'num-inputs)]
            [num-outputs (get-param 'num-outputs)]
            [sum-lut-state (list (cons 'INIT (??* (bitvector 16))) ('INJECT1 (??* (bitvector 1))))]
            [extra-lut-state (list (cons 'INIT (??* (bitvector 16))) ('INJECT1 (??* (bitvector 1))))]
            [sym-state (sum-lut-state extra-lut-state)]
            ; Now we want a procedure to fold over CCU2Cs. This takes two inputs:
            ; + the list of remaining physical inputs
            ; + the accumulator data value, a list comprising:
            ;   1. a list of the generated sum-bits
            ;   2. the carry-out from the previous ccu2c
            ;
            ; Symbolic state is of form (cons SUM-LUT-STATE EXTRA-LUT-STATE),
            ; where
            ;   - SUM-LUT-STATE is the state of a SUM lut (the main kind of
            ;     lut), and is used for all LUTs in CCU2Cs except for maybe the
            ;     final LUT in the case of odd arity.
            ;
            ;   - EXTRA-LUT-STATE is state for a LUT that isn't used in a CCU2C.
            ;     However, it might need to pass some carry information along,
            ;     so we need to synthesize over it. EXTRA-LUT-STATE is only used
            ;     when an odd number of sum-bits are computed, and only for the
            ;     last LUT created to represent such an expression.
            ;
            ; Both SUM-LUT-STATE and EXTRA-LUT-STATE are either #f (unallocated)
            ; or an assoc list of the form:
            ;
            ;   (list (cons 'INIT (bitvector 16)) (cons 'INJECT1 (bitvector 1)))
            ;
            ; NOTE: We need to start folding on the LSB and build up to the MSB.
            ; This is because the MSB requires the carry-in from the previous
            ; CCU2C.
            ;
            ; Inputs are expected to look like this:
            ;
            [proc
             (lambda (phys-inputs acc)
               (match-let*
                   (; First, destructure the accumulator value
                    [(list sum-bits cin) acc]
                    [num-luts-left (- num-luts (length sum-bits))]
                    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    ;                      SYMBOLIC STATE
                    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    ; Let's get symbolic state sorted. By construction we have
                    ; at least one sum lut, so this will be our LUTA
                    [(cons sum-lut-state extra-lut-state) sym-state]
                    [sym-state-a (list (cons 'INIT0 (cdr (assoc 'INIT sum-lut-state)))
                                       (cons 'INJECT1_0 (cdr (assoc 'INJECT1 sum-lut-state))))]
                    ; Our sym-state-b depends on whether or not this is a sum
                    ; lut or an extra lut. This is determined by num-luts-left.
                    ; If this is > 1 then we need at least another sum-lut.
                    ; Otherwise, this is an extra lut
                    [sym-state-b (if (equal? 1 num-luts-left)
                                     (list (cons 'INIT1 (cdr (assoc 'INIT extra-lut-state)))
                                           (cons 'INJECT1_1 (cdr (assoc 'INJECT1 extra-lut-state))))
                                     (list (cons 'INIT1 (cdr (assoc 'INIT sum-lut-state)))
                                           (cons 'INJECT1_1 (cdr (assoc 'INJECT1 sum-lut-state)))))]
                    ; combine these into a single ccu2c params
                    [ccu2c-params (append sym-state-b sym-state-a)]

                    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    ;                      ACTUAL INPUTS
                    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    ; As with the above symbolic state we know that, by
                    ; construction, we always have inputs for a
                    [(cons actuals-a phys-inputs) phys-inputs]

                    ; The actual inputs to b and the remaining physical-inputs
                    ; depend on predicate (equal? num-luts-left 1), so as with
                    ; sym-state-b we build these values conditioned on this
                    ; predicate.
                    [(cons actuals-b phys-inputs) (if (equal? num-luts-left 1)
                                                      ; we are creating 'dummy'
                                                      ; inputs, so just a bunch
                                                      ; of bits wired to high
                                                      (cons (for/list ([i inputs-per-lut])
                                                              (bv 1 1))
                                                            '())
                                                      ; we are taking and
                                                      ; dropping as normal
                                                      phys-inputs)]
                    [ccu2c (make-ccu2c actuals-a actuals-b cin ccu2c-params)]
                    ; Now, let's get the sum bits and carry-out bits from the ccu2c
                    [s0 (lr:list-ref ccu2c 0)]
                    [s1 (lr:list-ref ccu2c 1)]
                    [cout (lr:list-ref ccu2c 2)]
                    [sum-bits (cons s1 (cons s0 sum-bits))])
                 (list sum-bits cout (- num-luts-left 2))))])
       (error "todo"))]
    [else (error (format "unsupported primitive type ~a" type))]))

(define ecp5:config (arch-config 'Lattice-ECP5 (list ecp5:lut4 ecp5:l6mux21) ecp5:impl))

(module* test-values #f
  (provide ecp5:lut4
           ecp5:l6mux21
           ecp5:config))

(module+ test
  (require rackunit)

  ; ========================================================================== ;
  ; Test smaller LUT implementations (> 4 inputs)                              ;
  ;                                                                            ;
  ; This test checks that ecp5:impl works correctly on LUT implementations     ;
  ; with 4 or fewer inputs                                                     ;
  ; ========================================================================== ;
  (test-begin
   (check-equal? (arch-config-primitives ecp5:config) (list ecp5:lut4 ecp5:l6mux21))
   ; ------------------------------------------------------------------------- ;
   ; Define inputs of different widths. Each input begins with (bv 0 1) and    ;
   ; the remaining inputs are all (bv 1 1). This allows us to check ordering   ;
   ; ------------------------------------------------------------------------- ;
   (define inputs-4 (list (bv 0 1) (bv 1 1) (bv 1 1) (bv 1 1)))
   (define inputs-3 (list (bv 0 1) (bv 1 1) (bv 1 1)))
   (define inputs-2 (list (bv 0 1) (bv 1 1)))
   (define inputs-1 (list (bv 0 1)))
   ; ------------------------------------------------------------------------- ;
   ; Define lut interfaces of varying widths. These should all be implemented  ;
   ; with a Lattice LUT4 primitive (we test larger luts requiring multiple     ;
   ; LUT4 primitives below.                                                    ;
   ; ------------------------------------------------------------------------- ;
   (define lut4-interface (make-lut-interface 4 1 inputs-4))
   (define lut3-interface (make-lut-interface 3 1 inputs-3))
   (define lut2-interface (make-lut-interface 2 1 inputs-2))
   (define lut1-interface (make-lut-interface 1 1 inputs-1))
   ; ------------------------------------------------------------------------- ;
   ; Implement the above lut primitive interfaces.                             ;
   ; ------------------------------------------------------------------------- ;
   (match-define (cons lut4-prim lut4-sym-state)
     (ecp5:impl ecp5:config lut4-interface #:symbolic-state #f))
   (match-define (cons lut3-prim lut3-sym-state)
     (ecp5:impl ecp5:config lut3-interface #:symbolic-state #f))
   (match-define (cons lut2-prim lut2-sym-state)
     (ecp5:impl ecp5:config lut2-interface #:symbolic-state #f))
   (match-define (cons lut1-prim lut1-sym-state)
     (ecp5:impl ecp5:config lut1-interface #:symbolic-state #f))
   ; ------------------------------------------------------------------------- ;
   ; Test that these implementations are all the correct form.                 ;
   ; ------------------------------------------------------------------------- ;
   ; helper: this function takes an expected inputs list and returns a lambda
   ; that takes an actual inputs as observed by running the ecp5:impl function
   ; and compares them.
   ;
   ; When the inputs list is too short (< 4) the returned lambda right pads with
   ; (bv 1 1) to make it conform with the implementation [if a LUT4 is passed
   ; bits (list a b) as inputs it gets padded to (list a b (bv 1 1) (bv 1 1)) so
   ; that all LUT4 input ports are defined].
   (define (helper expected-xs)
     (lambda (actual-xs)
       (equal? (lr:append (list expected-xs (make-list (- 4 (length expected-xs)) (bv 1 1))))
               actual-xs)))
   (check-match lut4-prim (lr:primitive 'LUT4 inputs-4 (list (cons 'INIT _))))
   ; TODO: i'm having trouble getting the (bv _ _)s to match when I change them
   ; to literals (bv #b1 1)
   (check-match lut3-prim
                (lr:primitive
                 'LUT4
                 (lr:map cons (list '(A B C D) (lr:append (list inputs-3 (list (bv _ _))))))
                 (list (cons 'INIT _))))
   (check-match lut2-prim
                (lr:primitive
                 'LUT4
                 (lr:map cons (list '(A B C D) (lr:append (list inputs-2 (list (bv _ _) (bv _ _))))))
                 (list (cons 'INIT _))))
   (check-match
    lut1-prim
    (lr:primitive
     'LUT4
     (lr:map cons (list '(A B C D) (lr:append (list inputs-1 (list (bv _ _) (bv _ _) (bv _ _))))))
     (list (cons 'INIT _))))
   ; ------------------------------------------------------------------------- ;
   ; Test that symbolic states are of the correct form                         ;
   ;                                                                           ;
   ; Each symbolic state should be of the form (list (cons 'INIT ??))          ;
   ; ------------------------------------------------------------------------- ;
   (check-match lut4-sym-state (list (cons 'INIT _)))
   (check-match lut3-sym-state (list (cons 'INIT _)))
   (check-match lut2-sym-state (list (cons 'INIT _)))
   (check-match lut1-sym-state (list (cons 'INIT _)))
   ; ------------------------------------------------------------------------- ;
   ; Test that fresh symbolic states are allocated                             ;
   ;                                                                           ;
   ; When #:symbolic-state #f is passed (or no value is specified) fresh       ;
   ; symbolic state should be allocated. To test this we rerun ecp5:impl and   ;
   ; ensure that the symbolic states are not equal.                            ;
   ;                                                                           ;
   ; To sanity check that the symbolic states are of the correct form we will  ;
   ; rerun the rpevious tests and then assert that previuos sym state and this ;
   ; newly defined fresh symbolic state are not equal. This means that the     ;
   ; only thing that is possibly different is the wild card that is matched .  ;
   ; ------------------------------------------------------------------------- ;
   ; Define fresh symbolic state
   (match-define (cons _ lut4-sym-state-fresh)
     (ecp5:impl ecp5:config lut4-interface #:symbolic-state #f))
   (match-define (cons _ lut3-sym-state-fresh)
     (ecp5:impl ecp5:config lut3-interface #:symbolic-state #f))
   (match-define (cons _ lut2-sym-state-fresh)
     (ecp5:impl ecp5:config lut2-interface #:symbolic-state #f))
   (match-define (cons _ lut1-sym-state-fresh)
     (ecp5:impl ecp5:config lut1-interface #:symbolic-state #f))
   (check-match lut4-sym-state-fresh (list (cons 'INIT _)))
   (check-match lut3-sym-state-fresh (list (cons 'INIT _)))
   (check-match lut2-sym-state-fresh (list (cons 'INIT _)))
   (check-match lut1-sym-state-fresh (list (cons 'INIT _)))
   (check-not-equal? lut4-sym-state-fresh lut4-sym-state)
   (check-not-equal? lut3-sym-state-fresh lut3-sym-state)
   (check-not-equal? lut2-sym-state-fresh lut2-sym-state)
   (check-not-equal? lut1-sym-state-fresh lut1-sym-state)
   ; ------------------------------------------------------------------------- ;
   ; Test that symbolic states are reused when specified                       ;
   ;                                                                           ;
   ; When #:symbolic-state is passed a previously allocated symbolic state     ;
   ; that state should be reused.
   ;                                                                           ;
   ; To test this we rerun ecp5:impl and ensure that the symbolic states are   ;
   ; equal.                                                                    ;
   ; ------------------------------------------------------------------------- ;
   ; Define fresh symbolic state
   (match-define (cons _ lut4-sym-state-reused)
     (ecp5:impl ecp5:config lut4-interface #:symbolic-state lut4-sym-state))
   (match-define (cons _ lut3-sym-state-reused)
     (ecp5:impl ecp5:config lut3-interface #:symbolic-state lut3-sym-state))
   (match-define (cons _ lut2-sym-state-reused)
     (ecp5:impl ecp5:config lut2-interface #:symbolic-state lut2-sym-state))
   (match-define (cons _ lut1-sym-state-reused)
     (ecp5:impl ecp5:config lut1-interface #:symbolic-state lut1-sym-state))
   (check-equal? lut4-sym-state-reused lut4-sym-state)
   (check-equal? lut3-sym-state-reused lut3-sym-state)
   (check-equal? lut2-sym-state-reused lut2-sym-state)
   (check-equal? lut1-sym-state-reused lut1-sym-state))

  ; ========================================================================== ;
  ; Test larger LUT implementations (> 4 inputs)                               ;
  ;                                                                            ;
  ; This test checks that ecp5:impl works correctly on LUT implementations     ;
  ; with 5 or more inputs                                                      ;
  ; ========================================================================== ;
  (test-begin
   (check-equal? (arch-config-primitives ecp5:config) (list ecp5:lut4 ecp5:l6mux21))
   ; ------------------------------------------------------------------------- ;
   ; Define inputs of different widths. Inputs are defined as integers 0..N.   ;
   ; This allows for easier testing and assertions but in practice these       ;
   ; should by symbolic/concrete bitvectors... in particular, these inputs     ;
   ; will lead to failures at interpretation time!                             ;
   ; ------------------------------------------------------------------------- ;
   (define inputs-5 (list 0 1 2 3 4))
   (define inputs-6 (list 0 1 2 3 4 5))
   ; ------------------------------------------------------------------------- ;
   ; Define lut interfaces of varying widths. These should all be implemented  ;
   ; with a Lattice LUT4 primitive (we test larger luts requiring multiple     ;
   ; LUT4 primitives below.                                                    ;
   ; ------------------------------------------------------------------------- ;
   (define lut5-interface (make-lut-interface 5 1 inputs-5))
   (define lut6-interface (make-lut-interface 6 1 inputs-6))
   ; ------------------------------------------------------------------------- ;
   ; Implement the above lut primitive interfaces.                             ;
   ; ------------------------------------------------------------------------- ;
   (match-define (cons lut5-prim lut5-sym-state)
     (ecp5:impl ecp5:config lut5-interface #:symbolic-state #f))
   (match-define (cons lut6-prim lut6-sym-state)
     (ecp5:impl ecp5:config lut6-interface #:symbolic-state #f))
   ; ------------------------------------------------------------------------- ;
   ; Test that these implementations are all the correct form.                 ;
   ; ------------------------------------------------------------------------- ;
   ; Destructure the lut5 primitive. We do this step by step:
   (match-let* ([(lr:primitive
                  'PFUMX
                  (lr:map _ (list '(ALUT BLUT C0) (list (lr:first lut-a) (lr:first lut-b) selector)))
                  '()) lut5-prim]
                [(lr:primitive 'LUT4
                               (lr:map _ (list '(A B C D) (list 1 2 3 4)))
                               (list (cons 'INIT sym-state-a))) lut-a]
                [(lr:primitive 'LUT4
                               (lr:map _ (list '(A B C D) (list 1 2 3 4)))
                               (list (cons 'INIT sym-state-b))) lut-b])
     (check-equal? 0 selector)
     (check-not-equal? sym-state-a sym-state-b)
     (check-true ((bitvector 16) sym-state-a))
     (check-true ((bitvector 16) sym-state-b)))
   ; Destructure the lut6 primitive. We do this step by step:
   (match-define (lr:primitive 'PFUMX
                               (lr:map _
                                       (list '(ALUT BLUT C0)
                                             (list (lr:first lut5-a) (lr:first lut5-b) selector-1)))
                               '())
     lut6-prim)
   ; Destructure second layer of PFUMXs. In this layer we bind lut4-a..lut4-d
   (match-define (lr:primitive 'PFUMX
                               (lr:map _
                                       (list '(ALUT BLUT C0)
                                             (list (lr:first lut4-a) (lr:first lut4-b) selector-2-a)))
                               '())
     lut5-a)
   (match-define (lr:primitive 'PFUMX
                               (lr:map _
                                       (list '(ALUT BLUT C0)
                                             (list (lr:first lut4-c) (lr:first lut4-d) selector-2-b)))
                               '())
     lut5-b)
   ; Destructure third layer of LUT4s. In this layer we bind
   ; sym-state-a..sym-state-d
   (match-define (lr:primitive 'LUT4
                               (lr:map _ (list '(A B C D) (list 2 3 4 5)))
                               (list (cons 'INIT sym-state-a)))
     lut4-a)
   (match-define (lr:primitive 'LUT4
                               (lr:map _ (list '(A B C D) (list 2 3 4 5)))
                               (list (cons 'INIT sym-state-b)))
     lut4-b)
   (match-define (lr:primitive 'LUT4
                               (lr:map _ (list '(A B C D) (list 2 3 4 5)))
                               (list (cons 'INIT sym-state-c)))
     lut4-c)
   (match-define (lr:primitive 'LUT4
                               (lr:map _ (list '(A B C D) (list 2 3 4 5)))
                               (list (cons 'INIT sym-state-d)))
     lut4-d)
   ; Commence the test!
   (check-equal? 0 selector-1)
   (check-equal? 1 selector-2-a)
   (check-equal? 1 selector-2-b)
   (check-not-equal? sym-state-a sym-state-b)
   (check-not-equal? sym-state-a sym-state-c)
   (check-not-equal? sym-state-a sym-state-d)
   (check-not-equal? sym-state-b sym-state-c)
   (check-not-equal? sym-state-b sym-state-d)
   (check-not-equal? sym-state-c sym-state-d)
   (check-true ((bitvector 16) sym-state-a))
   (check-true ((bitvector 16) sym-state-b))
   (check-true ((bitvector 16) sym-state-c))
   (check-true ((bitvector 16) sym-state-d))
   ; ------------------------------------------------------------------------- ;
   ; Test that the 'opaque' symbolic state values that are returned by         ;
   ; ecp5:impl are correct                                                     ;
   ; ------------------------------------------------------------------------- ;
   (check-match lut5-sym-state
                (list ; Second Layer Of MUX (mux 1)
                 '() ; mux state is always empty
                 (list (cons INIT (? (bitvector 16))))
                 (list (cons INIT (? (bitvector 16))))))
   (check-match
    lut6-sym-state
    (list '()
          (list '() (list (cons INIT (? (bitvector 16)))) (list (cons INIT (? (bitvector 16)))))
          (list '() (list (cons INIT (? (bitvector 16)))) (list (cons INIT (? (bitvector 16)))))))
   ; ------------------------------------------------------------------------- ;
   ; Test that symbolic states are reallocated correctly.                      ;
   ;                                                                           ;
   ; This involves redefining and re-destructuring the larger luts with and    ;
   ; without providing #:symbolic-state fields.                                ;
   ; ------------------------------------------------------------------------- ;
   (match-define (cons _ lut5-sym-state-fresh)
     (ecp5:impl ecp5:config lut5-interface #:symbolic-state #f))
   (match-define (cons _ lut6-sym-state-fresh)
     (ecp5:impl ecp5:config lut6-interface #:symbolic-state #f))
   (check-not-equal? lut5-sym-state lut5-sym-state-fresh)
   (check-not-equal? lut6-sym-state lut6-sym-state-fresh)
   ; ------------------------------------------------------------------------- ;
   ; Test that symbolic states are reused correctly.                           ;
   ; ------------------------------------------------------------------------- ;
   (match-define (cons _ lut5-sym-state-reuse)
     (ecp5:impl ecp5:config lut5-interface #:symbolic-state lut5-sym-state))
   (match-define (cons _ lut6-sym-state-reuse)
     (ecp5:impl ecp5:config lut6-interface #:symbolic-state lut6-sym-state))
   (check-equal? lut5-sym-state lut5-sym-state-reuse)
   (check-equal? lut6-sym-state lut6-sym-state-reuse)))