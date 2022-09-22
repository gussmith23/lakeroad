#lang errortrace racket
(require (prefix-in lr: "../language.rkt")
         (submod "primitive-interface.rkt" helpers)
         "../utils.rkt"
         "primitive-interface.rkt"
         rosette
         racket/pretty)

(provide make-signature
         signature
         make-arch-config
         arch-config
         make-primitive
         primitive)

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

; make-arch-config: a wrapper around the `arch-config` constructor.
;
; TODO: document function
; NOTE: We rename-out this to `arch-config` to mask the struct's constructor
(define (make-arch-config architecture primitives implementations)
  (arch-config architecture primitives implementations))

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

(define (recursively-create-lut arch-config lut-prim-interface #:symbolic-state [symbolic-state #f])
  (match-let*
      (; First, destructure the primitive-interface
       [(primitive-interface type interface-sig actual-inputs) lut-prim-interface]
       [(interface-signature interface-inputs interface-outputs) interface-sig]
       [(list mux-sym-state left-sym-state right-sym-state)
        (match symbolic-state
          [(list left mux right) symbolic-state]
          [#f (list #f #f #f)]
          [else
           (error (format "Invalid symbolic state ~a for recursively creating a lut"
                          symbolic-state))])]
       [(cons selector-bit rest-actual-inputs) actual-inputs]
       [(cons next-interface-input-sig rest-interface-input-sigs) interface-inputs]
       [smaller-sig (make-interface-signature rest-interface-input-sigs interface-outputs)]
       [smaller-prim-interface (make-primitive-interface type smaller-sig rest-actual-inputs)]
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
;   + ecp5:l6mux21                                                             ;
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
  (match-define (primitive-interface type (interface-signature formal-ins formal-outs) actuals)
    prim-interface)
  (when (not (= (length actuals) (length formal-ins)))
    (format
     (error "invalid state: length of formal inputs ~a does not match length of actual inputs ~a")
     formal-ins
     actuals))

  (define num-inputs (length formal-ins))
  (match type
    ['LUT
     (cond
       [(< num-inputs 4) ; Pad extra constant bitvectors to inputs and use for LUT4
        (let* ([pad-size (- 4 num-inputs)]
               [pads (make-list pad-size (bv 1 1))] ; Default to padding to high
               [padded-actuals (append actuals pads)] ; We pad inputs to the right
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
          (cons (lr:primitive 'LUT4 padded-actuals sym-state) sym-state))]
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
          (cons (lr:primitive 'LUT4 actuals sym-state) sym-state))]
       [(> num-inputs 4)
        (recursively-create-lut config prim-interface #:symbolic-state symbolic-state)])]
    ['MUX
     (if (= num-inputs 3)
         (cons (lr:primitive 'PFUMX21 actuals '()) '())
         (error "Only MUX21 are currently supported"))]
    [else (error (format "unsupported primitive type ~a" type))]))

(define ecp5:config (make-arch-config 'Lattice-ECP5 (list ecp5:lut4 ecp5:l6mux21) ecp5:impl))

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
   (define lut4-interface
     (make-primitive-interface 'LUT (make-interface-signature '(I0 I1 I2 I3) '(O)) inputs-4))
   (define lut3-interface
     (make-primitive-interface 'LUT (make-interface-signature '(I0 I1 I2) '(O)) inputs-3))
   (define lut2-interface
     (make-primitive-interface 'LUT (make-interface-signature '(I0 I1) '(O)) inputs-2))
   (define lut1-interface
     (make-primitive-interface 'LUT (make-interface-signature '(I0) '(O)) inputs-1))
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
     (lambda (actual-xs) (equal? (take (append expected-xs (make-list 4 (bv 1 1))) 4) actual-xs)))
   (check-match lut4-prim (lr:primitive 'LUT4 (? (helper inputs-4)) (list (cons 'INIT _))))
   (check-match lut3-prim (lr:primitive 'LUT4 (? (helper inputs-3)) (list (cons 'INIT _))))
   (check-match lut2-prim (lr:primitive 'LUT4 (? (helper inputs-2)) (list (cons 'INIT _))))
   (check-match lut1-prim (lr:primitive 'LUT4 (? (helper inputs-1)) (list (cons 'INIT _))))
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
   (define lut5-interface
     (make-primitive-interface 'LUT (make-interface-signature '(I0 I1 I2 I3 I4) '(O)) inputs-5))
   (define lut6-interface
     (make-primitive-interface 'LUT (make-interface-signature '(I0 I1 I2 I3 I4 I5) '(O)) inputs-6))
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
   (match-let* ([(lr:primitive 'PFUMX21 (list (lr:first lut-a) (lr:first lut-b) selector) '())
                 lut5-prim]
                [(lr:primitive 'LUT4 (list 1 2 3 4) (list (cons 'INIT sym-state-a))) lut-a]
                [(lr:primitive 'LUT4 (list 1 2 3 4) (list (cons 'INIT sym-state-b))) lut-b])
     (check-equal? 0 selector)
     (check-not-equal? sym-state-a sym-state-b)
     (check-true ((bitvector 16) sym-state-a))
     (check-true ((bitvector 16) sym-state-b)))
   ; Destructure the lut6 primitive. We do this step by step:
   (match-define (lr:primitive 'PFUMX21 (list (lr:first lut5-a) (lr:first lut5-b) selector-1) '())
     lut6-prim)
   ; Destructure second layer of PFUMXs. In this layer we bind lut4-a..lut4-d
   (match-define (lr:primitive 'PFUMX21 (list (lr:first lut4-a) (lr:first lut4-b) selector-2-a) '())
     lut5-a)
   (match-define (lr:primitive 'PFUMX21 (list (lr:first lut4-c) (lr:first lut4-d) selector-2-b) '())
     lut5-b)
   ; Destructure third layer of LUT4s. In this layer we bind
   ; sym-state-a..sym-state-d
   (match-define (lr:primitive 'LUT4 (list 2 3 4 5) (list (cons 'INIT sym-state-a))) lut4-a)
   (match-define (lr:primitive 'LUT4 (list 2 3 4 5) (list (cons 'INIT sym-state-b))) lut4-b)
   (match-define (lr:primitive 'LUT4 (list 2 3 4 5) (list (cons 'INIT sym-state-c))) lut4-c)
   (match-define (lr:primitive 'LUT4 (list 2 3 4 5) (list (cons 'INIT sym-state-d))) lut4-d)
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