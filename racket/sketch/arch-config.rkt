#lang errortrace racket
(require racket/generic)
(provide arch-config-get-lut
         (rename-out [make-signature signature]
                     [make-arch-config arch-config]
                     [make-primitive primitive]))

; This is a _generic interface_ that primitive structs implement. This allows a
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

; NOTE: we rename-out this to `signature`
(define (make-signature inputs outputs parameters)
  ; Normalize a list of values. A "normal" value has type (list symbol? integer?)
  ; To make things a bit nicer we accept raw symbols and transform them into
  ; (list symbol 1).
  ;
  ; E.g., (normalize-values (list '(a 1) b (c 2)))
  ; becomes (list '(a 1) '(b 1) '(c 2))
  (define (normalize-values values)
    (for/list ([v values])
      (match v
        [(? symbol?) (list v 1)]
        [(list (? symbol?) (? integer?)) v])))
  (signature (normalize-values inputs) (normalize-values outputs) (normalize-values parameters)))

; Represents an architecture-specific primitive
;
; + arch: the name of the architecture
; + name: the name of the primitive (this is the Verilog module name, e.g. "LUT4")
; + type: the 'type' of this primitive (e.g., "lut", "mux")
;
;         TODO: `type` is redundant to `implementations` but I haven't figured
;         out how `implementations` will work yet
; + signature: the signature of this
; + implementations: TODO: This is not used currently but should specify how to
;   use this arch-specific primitive to implement generic primitives. This will
;   make `type` redundant.
; + inputs
(struct primitive (arch name type signature implementations inputs))

; NOTE: We rename-out this to `primitive`
(define (make-primitive arch name type signature inputs #:implementations [implementations #f])
  (let ([impls (or implementations (make-hash))])
    (primitive arch name type signature (make-hash) inputs)))

; architecture: name of the architecture
; luts: list of lut primitives supported by the architecture
; muxes: list of mux primitives supported by the architecture
; other: list of other primitives supported by the architecture
(struct arch-config (architecture luts muxes other) #:transparent)

(define (make-arch-config architecture primitives)
  (let* ([luts (for/list ([prim primitives] #:when (eq? (primitive-type prim) "lut"))
                 prim)]
         [muxes (for/list ([prim primitives] #:when (eq? (primitive-type prim) "mux"))
                  prim)]
         [other (for/list ([prim primitives]
                           #:when (and (not (eq? (primitive-type prim) "lut"))
                                       (not (eq? (primitive-type prim) "mux"))))
                  prim)])
    (arch-config architecture luts muxes other)))

; TODO: handle multiple output sizes
(define (arch-config-get-lut config num-input-bits)
  (let* (; get luts sorted by length of inputs
         [luts (sort (arch-config-luts config)
                     (lambda (a b)
                       (< (length (signature-inputs (primitive-signature a)))
                          (length (signature-inputs (primitive-signature b))))))]

         [biggest-lut (last luts)]
         ; Get all luts that are big enough to handle num-input-bits and use the
         ; smallest one.
         ;
         ; Also: I like big LUTs and I cannot lie
         [big-luts (filter (lambda (l)
                             (>= (length (signature-inputs (primitive-signature l))) num-input-bits))
                           luts)])
    (if (empty? big-luts) (error "TODO: create larger lut") (first big-luts))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    EXAMPLES    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define ecp5:lut4
  (lambda (inputs)
    (make-primitive "Lattice-ECP5"
                    "LUT4"
                    "lut"
                    (signature '((A 1) (B 1) (C 1) (D 1)) '(Z) '((INIT 16)))
                    inputs)))

; Example of a L6MUX21 Primitive for lattice ecp5
; Verilog:
;     module L6MUX21 (input D0, D1, SD, output Z);
(define ecp5:l6mux21
  (lambda (inputs)
    (make-primitive "Lattice-ECP5"
                    "L6MUX21"
                    "mux"
                    (signature '((A 1) (B 1) (C 1) (D 1)) '((Z 1)) '())
                    inputs)))

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
              (check-equal? (arch-config-other ecp5:config) (list))
              (check-equal? (arch-config-get-lut ecp5:config 4) ecp5:lut4)
              (check-equal? (arch-config-get-lut ecp5:config 3) ecp5:lut4)
              (check-equal? (arch-config-get-lut ecp5:config 2) ecp5:lut4)
              (check-equal? (arch-config-get-lut ecp5:config 1) ecp5:lut4)
              (check-exn exn:fail? (thunk (arch-config-get-lut ecp5:config 5)))))
