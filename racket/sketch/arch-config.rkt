#lang errortrace racket
(require racket/generic
         (prefix-in lr: "../language.rkt")
         (submod "primitive-interface.rkt" helpers)
         "symbolic-allocator.rkt"
         "primitive-interface.rkt")

(provide arch-config-get-lut
         (rename-out [make-signature signature]
                     [make-arch-config arch-config]
                     [make-primitive primitive]))

; This is a _primitive interface_ that primitive structs implement. This allows a
; primitive struct to register which abstract Lakeroad primitives it implements
; by providing a procedure to do so.
;
; This involves implementing two methods in the `primtive` struct:
;
; 1. register-implementation: register an implementation procedure for a
;    lakeroad primitive.
;    TODO: what exactly does this function look like?
; 2. get-implementation: request the primitive struct for an implementation of
;    the lakeroad primitive. This can act as a simple hash lookup, or it may do
;    more complicated logic to combine simpler primitives into a more complex
;    primitive
;    TODO: how exactly should this work?
(define-generics lr-primitive-implementation
                 (register-implementation lr-primitive-implementation lr-primitive implementation)
                 (implement-primitive lr-primitive-implementation lr-primitive))

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
; + arch: the name of the architecture
; + name: the name of the primitive (this is the Verilog module name, e.g. "LUT4")
; + type: the 'type' of this primitive (e.g., 'LUT, 'MUX)
;
;         TODO: `type` is redundant to `implementations` but I haven't figured
;         out how `implementations` will work yet
; + signature: the signature of this
; + implementations: TODO: This is not used currently but should specify how to
;   use this arch-specific primitive to implement primitive interfaces. This will
;   make `type` redundant.
; + inputs
(struct primitive (arch name type signature implementations))

; NOTE: We rename-out this to `primitive` to mask the struct's constructor
(define (make-primitive arch name type signature #:implementations [implementations #f])
  (let ([impls (or implementations (make-hash))]) (primitive arch name type signature (make-hash))))

; architecture: name of the architecture
; primitives: a list of all primitives in this architecture
; luts: list of lut primitives supported by the architecture
; muxes: list of mux primitives supported by the architecture
; other: list of other primitives supported by the architecture
(struct arch-config (architecture primitives luts muxes other) #:transparent)

; NOTE: We rename-out this to `arch-config` to mask the struct's constructor
(define (make-arch-config architecture primitives)
  (let* ([luts (for/list ([prim primitives] #:when (eq? (primitive-type prim) 'LUT))
                 prim)]
         [muxes (for/list ([prim primitives] #:when (eq? (primitive-type prim) 'MUX))
                  prim)]
         [other (for/list ([prim primitives]
                           #:when (and (not (eq? (primitive-type prim) 'LUT))
                                       (not (eq? (primitive-type prim) 'MUX))))
                  prim)])
    (arch-config architecture primitives luts muxes other)))

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

; Get a arch-specific lakeroad expression for a LUT.
; TODO: how should we handle
; TODO: handle multiple output sizes
; TODO: handle larger luts
(define (arch-config-get-lut config inputs params)
  (let* (; get luts sorted by length of inputs
         [num-input-bits (length inputs)]
         [luts (sort (arch-config-luts config)
                     (lambda (a b)
                       (< (length (signature-inputs (primitive-signature a)))
                          (length (signature-inputs (primitive-signature b))))))]

         ; Get all luts that are big enough to handle num-input-bits and use the
         ; smallest one.
         ;
         ; Also: I like big LUTs and I cannot lie
         [big-luts (filter (lambda (l)
                             (>= (length (signature-inputs (primitive-signature l))) num-input-bits))
                           luts)]
         [lr-expr (if (empty? big-luts)
                      (error "TODO: create larger lut")
                      (match (first big-luts)
                        [(primitive arch name type sig implementations)
                         (let ([bound-inputs (bind-inputs-to-sig inputs sig)]
                               [bound-params (bind-params-to-sig params sig)])
                           (lr:primitive name bound-inputs bound-params))]))])
    lr-expr))

; This function provides a way for Sketch Generation to get an
; architecture-specific primitive to replace a primitive-interface in a sketch.
;
; PARAMS
; ======
; + config: the `arch-config` that will generate the architecture-specific
;   primitive
; + primitive: the primitive-interface that is to be replaced
; + inputs: the lakeroad expressions that will be created
(define (arch-config-get-primitive config primitive inputs)
  (or (primitive-interface? primitive)
      (error (format "arch-config-get-primitive expected a primitive-interface? but got ~a"
                     primitive)))
  (define type (primitive-interface-type primitive))
  (define num-inputs (primitive-interface-num-inputs))
  (define num-outputs (primitive-interface-num-outputs))
  (match type
    ['LUT (arch-config-get-lut config num-inputs num-outputs)]
    ['MUX (error "todo")]
    [_ (error "todo")]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    EXAMPLES    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
