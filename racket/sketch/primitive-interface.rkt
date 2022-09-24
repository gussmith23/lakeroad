#lang errortrace racket

(provide primitive-interface
         interface-signature
         make-interface-signature
         make-primitive-interface
         (struct-out primitive-interface)
         (struct-out interface-signature)
         primitive-interface-num-inputs
         primitive-interface-num-outputs
         lut4-interface
         mux21-interface
         lut?
         mux?
         make-interface-signature-of-shape)

; Normalize a list of values. A "normal" value has type (list symbol? integer?)
; To make things a bit nicer we accept raw symbols and transform them into
; (list symbol 1).
;
; E.g., (normalize-values (list '(a 1) b (c 2)))
; becomes (list '(a 1) '(b 1) '(c 2))
(define (normalize-signature-values values #:name-base [name-base #f])
  (if (integer? values)
      ; values is an integer so we make a default list of the given length
      (begin
        (when (< 0 values)
          (error (format "Signature value that is an integer must be non-negative: ~a" values)))
        (when (not name-base)
          (error
           "Cannot make a default signature values list of a given length without a name-base: use the #:name-base keyword argument to specify a name-base"))
        (for/list ([i values])
          (list (string->symbol (format "~a~a" name-base i)) 1)))
      ; values is not an integer so we iterate over it
      (for/list ([v values])
        (match v
          [(? symbol?) (list v 1)]
          [(list (? symbol?) (? integer?)) v]))))

(module* helpers #f
  (provide normalize-signature-values))

(struct interface-signature (inputs outputs) #:transparent)
(struct primitive-interface (type sig inputs) #:transparent)

(define (primitive-interface-num-inputs prim)
  (length (interface-signature-inputs (primitive-interface-sig prim))))
(define (primitive-interface-num-outputs prim)
  (length (interface-signature-outputs (primitive-interface-sig prim))))
(define (primitive-interface-type? prim type)
  (equal? (primitive-interface-type prim) type))

(define (make-interface-signature-of-shape num-inputs num-outputs)
  (interface-signature (normalize-signature-values num-inputs #:base-name 'I)
                       (normalize-signature-values num-outputs #:base-name 'O)))

; NOTE: We rename-out this to `primitive-interface` to mask the struct's constructor
(define (make-primitive-interface type sig inputs)
  ; Let's sanity check types!
  (when (not (symbol? type))
    (error "primitive-interface type must be a symbol?"))
  (when (not (interface-signature? sig))
    (error "primitive-interface sig must be a interface-signature?"))
  (when (not (list? inputs))
    (error "primitive-interface inputs must be a list?"))
  ; We need to ensure that the inputs are the right size
  (when (not (equal? (length inputs) (length (interface-signature-inputs sig))))
    (error (format
            "primitive interface ~a: length of actual inputs ~a does not match signature's inputs ~a"
            type
            inputs
            (interface-signature-inputs sig))))
  (primitive-interface type sig inputs))

; NOTE: We rename-out this to `interface-signature` to mask the struct's constructor
(define (make-interface-signature formal-inputs formal-outputs)
  (interface-signature (normalize-signature-values formal-inputs)
                       (normalize-signature-values formal-outputs)))

(define (lut4-interface inputs)
  (make-primitive-interface 'LUT (make-interface-signature '(I0 I1 I2 I3) '(O)) inputs))

(define (mux21-interface D0 D1 S)
  (primitive-interface 'MUX (make-interface-signature '(D0 D1 S) '(O)) (list D0 D1 S)))

; Test if a value is a lakeroad lut primitive, and optionally test input and
; output arity
(define (lut? val #:input-arity [input-arity #f] #:output-arity [output-arity #f])
  (and (primitive-interface? val)
       (eq? (primitive-interface-type val) 'LUT)
       (if input-arity (= (primitive-interface-num-inputs val) input-arity) #t)
       (if output-arity (= (primitive-interface-num-outputs val) output-arity) #t)))

(define (mux? val)
  (and (primitive-interface? val) (primitive-interface-type? val 'MUX)))

(module+ test
  (require rackunit)
  (check-true (lut? (lut4-interface '(1 2 3 4))))
  (check-false (mux? (lut4-interface '(1 2 3 4))))
  (check-true (mux? (mux21-interface 1 2 3)))
  (check-false (lut? (mux21-interface 1 2 3))))
