#lang errortrace racket
(require (prefix-in lr: "../language.rkt")
         (submod "primitive-interface.rkt" helpers)
         "primitive-interface.rkt")

(provide arch-config-get-lut
         (rename-out [make-signature signature]
                     [make-arch-config arch-config]
                     [make-primitive primitive]))

; A signature captures all input, output, and paramter information provided by a
; verilog file. Each inputs/outputs/parameters are a list of name/bitwidth
; tuples, e.g.
;
;    '((A 1) (B 1) (C 1) (D 1))
;    '((INIT 16))
;
; Names are symbols and bitwidths are integers
(struct signature (inputs outputs parameters))

; NOTE: we rename-out this to `signature` to mask the struct's constructor
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
; NOTE: We rename-out this to `primitive` to mask the struct's constructor
(define (make-primitive architecture name signature #:type [type 'OTHER])
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
;     f: arch-config, primitive-interface, #:symbolic-state -> lr:primitive, symbolic-state
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
; LUT-n from smaller LUTs.
;
; This design takes the following pieces of data as arugments:
;
; Parameters
; ----------
; + lut-prim-interface: the `primitive-interface` that we are trying to implement
; + arch-specific-lut: a `primitive` struct of the architecture-specific LUT we
;       will be using to build a larger LUT. This is provided to determine when
;       a basecase is reached.
; + fn-make-arch-specific-lut: this is a function provided by the arch config to
;       create an arch-specific-lut. This is invoked by this function once a
;       basecase is reached
;       TODO: specify signature
; + fn-make-arch-specific-mux21: similar to fn-make-arch-specific-lut, this
;       function is provided by the arch-config to create an arch-specific mux
;       2->1. This is invoked to combine recursive calls
; + #:symbolic-state: optional symbolic state to be passed along recursively.
(define (recursively-create-lut lut-prim-interface
                                arch-specific-lut
                                fn-make-arch-specific-lut
                                fn-make-arch-specific-mux21
                                #:symbolic-state [symbolic-state #f])
  (match-let* (; First, destructure the primitive-interface
               [(primitive-interface type interface-sig actual-inputs) lut-prim-interface]
               [(interface-signature interface-inputs interface-outputs) interface-sig]
               ; Next, destructure the arch-specific primitive
               [(primitive arch name type arch-sig) arch-specific-lut]
               [(signature arch-inputs arch-outputs arch-params) arch-sig]

               ; Now we want to determine if the architecture can implement the
               ; primitive directly. This is equivalent to checking that the interface
               ; inputs is not longer than the arch-specific inputs
               [arch-can-impl-prim-interface (<= (length interface-inputs) (length arch-inputs))])
    (if (arch-can-impl-prim-interface)
        ; We can implement this w/ an arch primitive, so let's do it
        (fn-make-arch-specific-lut actual-inputs #:symbolic-state symbolic-state)

        ; We can't implement this directly so we build it recursively
        (begin
          ; We want to build this recursively. First, let's deconstruct symbolic
          ; state and make sure it looks right. There are two possible valid
          ; forms that symbolic state can take:
          ; 1. (list LEFT-LUT-STATE MUX-STATE RIGHT-LUT-STATE)
          ; 2. #f (which gets expanded to form 1: (list #f #f #f))
          (match-define (list left-sym-state mux-sym-state right-sym-state)
            (match symbolic-state
              [(list left mux right) symbolic-state]
              [#f (list #f #f #f)]
              [else
               (error (format "Invalid symbolic state ~a for recursively creating a lut"
                              symbolic-state))]))
          ; Next w build a LUT N out of two LUT N-1s and a MUX. We use Bit N as the
          ; MUX selector bit, and Bits 1..N-1 as the inputs to the two LUT N-1s.
          (match-let*
              (; Break up the actual inputs. We use the next (left-most)
               ; input as a selector bit for our MUX, and the rest are
               ; past down recursively
               [(cons selector-bit rest-actual-inputs) actual-inputs]
               ; Next, create a smaller primitive-interface for our
               ; recursive calls to target. We use the values that we
               ; destructured above at the start of this function
               [(cons next-interface-input-sig rest-interface-input-sigs) interface-inputs]
               [smaller-sig (interface-signature rest-interface-input-sig interface-outputs)]
               [smaller-prim-interface (primitive-interface type smaller-sig rest-actual-inputs)]

               ; Okay, we've built the smaller primitive interface and
               ; we use this to recursively build two new LUTs and get
               ; their associated symbolic state.
               [(cons left-result left-state)
                (recursively-create-lut smaller-prim-interface
                                        arch-specific-lut
                                        fn-make-arch-specific-lut
                                        fn-make-arch-specific-mux21
                                        #:symbolic-state left-sym-state)]
               [(cons right-result right-state)
                (recursively-create-lut smaller-prim-interface
                                        arch-specific-lut
                                        fn-make-arch-specific-lut
                                        fn-make-arch-specific-mux21
                                        #:symbolic-state right-sym-state)]
               ; Then, combine the two recursively-defined LUTs w/ a mux
               [(cons mux mux-state) (fn-make-arch-specific-mux21 selector-bit
                                                                  left-result
                                                                  right-result
                                                                  next-actual-input
                                                                  #:symbolic-state mux-sym-state)]
               ; Finally, combine the symbolic state from the two LUTs and the
               ; MUX into the opaque symbolic state representation
               [sym-state (list left-state mux-state right-state)])
            (cons mux sym-state))))))

; Create an association-list mapping input names defined in `sig` to the actual
; input values provided by `inputs`, effectively 'binding' the input values to
; the names provided by `sig`
(define (bind-inputs-to-sig inputs sig)
  (match sig
    [(signature formals _ _)
     (if (equal? (length formals) (length inputs))
         (for/list ([name-arity-pair formals] [input inputs])
           (cons (first name-arity-pair) input))
         (error (format "length of actual inputs ~a does not match formal inputs" inputs formals)))]))

; Create an association-list mapping output names defined in `sig` to the actual
; output values provided by `outputs`, effectively 'binding' the output values
; to the names provided by `sig`
(define (bind-outputs-to-sig outputs sig)
  (match sig
    [(signature _ formals _)
     (if (equal? (length formals) (length outputs))
         (for/list ([name-arity-pair formals] [output outputs])
           (cons (first name-arity-pair) output))
         (error
          (format "length of actual outputs ~a does not match formal outputs" outputs formals)))]))

; Create an association-list mapping parameter names defined in `sig` to the
; actual parameter values provided by `params`
(define (bind-params-to-sig params sig)
  (match sig
    [(signature _ _ formals)
     (if (equal? (length formals) (length params))
         (for/list ([name-arity-pair formals] [param params])
           (cons (first name-arity-pair) param))
         (error (format "length of actual parameters ~a does not match formal parameters"
                        params
                        formals)))]))

; Test our binding functions
(module+ test
  (require rackunit)
  (test-begin (let* ([sig (make-signature '(A B C D) '(Z) '((INIT 16)))]
                     [inputs '(A B C D)]
                     [outputs '(Z)]
                     [params '(INIT)]
                     [bound-inputs (bind-inputs-to-sig inputs sig)]
                     [bound-outputs (bind-outputs-to-sig outputs sig)]
                     [bound-params (bind-params-to-sig params sig)])
                (check-equal? (cdr (assoc 'A bound-inputs)) 'A)
                (check-equal? (cdr (assoc 'B bound-inputs)) 'B)
                (check-equal? (cdr (assoc 'C bound-inputs)) 'C)
                (check-equal? (cdr (assoc 'D bound-inputs)) 'D)

                (check-equal? (cdr (assoc 'Z bound-outputs)) 'Z)

                (check-equal? (cdr (assoc 'INIT bound-params)) 'INIT))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    EXAMPLES    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ---------------------------------------------------------------------------- ;
;;;;;;;;;;;;;;;;;;;;  A Sample Lattice ECP5 Implementation ;;;;;;;;;;;;;;;;;;;;;
; ---------------------------------------------------------------------------- ;

; This function is responsible for implementing primitive interfaces for
; lattice-ecp5. This will be used as the `implementations` field of the
; `arch-config` struct
(define (ecp5:lattice:impl config prim-interface #:symbolic-state [symbolic-state #f])
  (match-define
    (primitive-interface type (interface-signature formal-ins formal-outs) actuals)
    prim-interface)
  (match type
    ['LUT      ; Make a LUT
     (cond [(<= (length formal-ins ) 4) (error "todo")]
           [(> (length formal-ins ) 4) (error "todo")])]
    ['MUX
     (cond [_ (error "todo")])])
  )

(define ecp5:lut4
  (make-primitive "Lattice-ECP5"
                  "LUT4"
                  'LUT
                  (signature '((A 1) (B 1) (C 1) (D 1)) '(Z) '((INIT 16)))))

; Example of a L6MUX21 Primitive for lattice ecp5
; Verilog:
;     module L6MUX21 (input D0, D1, SD, output Z);
(define ecp5:l6mux21
  (make-primitive "Lattice-ECP5" "L6MUX21" 'MUX (signature '((A 1) (B 1) (C 1) (D 1)) '((Z 1)) '())))

(define ecp5:config (make-arch-config "lattice-ECP5" (list ecp5:lut4 ecp5:l6mux21)))

(module* test-values #f
  (provide ecp5:lut4
           ecp5:l6mux21
           ecp5:config))

(module+ test
  (require rackunit)
  ; Example of a LUT4 Primitive for lattice ecp5
  ; Verilog Sig:
  ;     module LUT4(input A, B, C, D, output Z);
  ;     parameter [15:0] INIT = 16'h0000;
  (test-begin (check-equal? (arch-config-luts ecp5:config) (list ecp5:lut4))
              (check-equal? (arch-config-muxes ecp5:config) (list ecp5:l6mux21))
              (check-equal? (arch-config-other ecp5:config) (list))))
