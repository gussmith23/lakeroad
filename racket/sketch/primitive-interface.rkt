#lang errortrace racket

(provide primitive-interface
         interface-signature
         make-interface-signature
         make-primitive-interface
         (struct-out primitive-interface)
         (struct-out interface-signature)
         primitive-interface-num-inputs
         primitive-interface-num-outputs
         primitive-interface-get-param
         make-mux-interface
         make-lut-interface
         mux21-interface
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
        (when (> 0 values)
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
(struct primitive-interface (type sig params inputs) #:transparent)

(define (primitive-interface-num-inputs prim)
  (length (interface-signature-inputs (primitive-interface-sig prim))))
(define (primitive-interface-num-outputs prim)
  (length (interface-signature-outputs (primitive-interface-sig prim))))
(define (primitive-interface-type? prim type)
  (equal? (primitive-interface-type prim) type))

; Retrieve a parameter from a primitive-interface: if no such paramter is
; stored, returns #f
(define (primitive-interface-get-param prim param)
  (let* ([params (primitive-interface-params prim)] [pair (assoc param params)])
    (if pair (cdr pair) #f)))

(define (make-interface-signature-of-shape num-inputs num-outputs)
  (interface-signature (normalize-signature-values num-inputs #:name-base 'I)
                       (normalize-signature-values num-outputs #:name-base 'O)))

; NOTE: We rename-out this to `primitive-interface` to mask the struct's constructor
(define (make-primitive-interface type sig inputs #:parameters [parameters '()])
  ; Let's sanity check types!
  (when (not (symbol? type))
    (error "primitive-interface type must be a symbol?"))
  (when (not (interface-signature? sig))
    (error "primitive-interface sig must be a interface-signature?"))
  ; We need to ensure that the inputs are the right size
  ; TODO: at creation time we actually can't tell the length of inputs because
  ;       they are wrapped in an opaque `logical-to-physical-mapping` struct.
  ;       Thus we only perform this check when inputs is a list, but it would be
  ;       good to find a way to perform this check even when inputs is _not_ a
  ;       list (or to find a way to make inputs always a list)
  (when (and (list? inputs) (not (equal? (length inputs) (length (interface-signature-inputs sig)))))
    (error (format
            "primitive interface ~a: length of actual inputs ~a does not match signature's inputs ~a"
            type
            inputs
            (interface-signature-inputs sig))))
  ; Paramters must be a list of (cons symbol _)
  (match parameters
    ['() '()]
    [(list (cons (? symbol?) _) ...) '()]
    [_
     (error (format "Invalid paramters: expected a list of (cons (? symbol?) _) but found ~a"
                    parameters))])

  (primitive-interface type sig parameters inputs))

; NOTE: We rename-out this to `interface-signature` to mask the struct's constructor
(define (make-interface-signature formal-inputs formal-outputs)
  (interface-signature (normalize-signature-values formal-inputs)
                       (normalize-signature-values formal-outputs)))

; Create a LUT interface on N inputs and M outputs
(define (make-lut-interface num-inputs num-outputs inputs)
  (when (or (< num-inputs 1) (< num-outputs 1))
    (error "lut interface must have at least one input and one output"))
  (let ([sig (make-interface-signature-of-shape num-inputs num-outputs)]
        [params (list (cons 'num-inputs num-inputs) (cons 'num-outputs num-outputs))])
    (make-primitive-interface 'LUT sig inputs #:parameters params)))

; Create a MUX interface to select over N inputs
;
; Currently only muxing over single bits (we could, for instance, mux over 2
; 8-bit numbers a and b, but we don't support this yet. I don't think we
; actually would need to modify much to handle this)
(define (make-mux-interface num-inputs inputs)
  (when (or (< num-inputs 2))
    (error "mux interface must have at least two inputs"))
  (let* ([signal-names (for/list ([i num-inputs])
                         (list (string->symbol (format "~a~a" 'D i)) 1))]
         [formals (append signal-names '(S))]
         [sig (make-interface-signature formals '(O))]
         [params (list (cons 'num-inputs num-inputs))])
    (make-primitive-interface 'MUX sig inputs #:parameters params)))

; A LUT With Carry interface represents N LUT-Ms hooked up to a carry chain.
; This interface expects N * M + 1 inputs and produces N + 1 outputs.  Inputs
; should be in the order (note the last input is a carry-in bit):
;
;     (list
;         lut-1-input-1
;         lut-1-input-2
;            ...
;         lut-1-input-M
;         lut-2-input-1
;         lut-2-input-2
;            ...
;         lut-2-input-M
;            ...
;            ...
;         lut-N-input-1
;         lut-N-input-2
;            ...
;         lut-N-input-M
;         carry-in)
;
; Outputs should be in order:
;
;     (list
;         lut-1-output
;         lut-2-output
;            ...
;         lut-N-output
;         carry-out)
;
; This has the following parameters:
;  + num-luts
;  + inputs-per-lut
;  + num-inputs: always equal to (add1 (* num-luts inputs-per-lut))
;  + num-outputs always equal to (add1 num-luts)
(define (make-lut-with-carry-interface num-luts inputs-per-lut inputs)
  (when (or (< inputs-per-lut 1) (< num-luts 1))
    (error "lut-with-carry interface must have at least one input per lut and at least one lut"))
  (let* (; A lut with a carry has num-luts * inputs-per-lut + 1 inputs,
         ; where the +1 comes from the carry-in
         [num-inputs (add1 (* inputs-per-lut num-luts))]
         ; A lut with carry has an output for each lut plus a carry out
         [num-outputs (add1 num-luts)]
         [formal-inputs (append (for*/list ([lut-n num-luts] [lut-idx inputs-per-lut])
                                  (list (string->symbol (format "I~a_~a" lut-n lut-idx)) 1))
                                (list (list 'CIN 1)))]
         [formal-outputs (append (for*/list ([lut-n num-luts])
                                   (list (string->symbol (format "O~a" lut-n)) 1))
                                 (list (list 'COUT 1)))]
         [sig (make-interface-signature formal-inputs formal-outputs)]
         [params (list (cons 'num-luts num-luts)
                       (cons 'inputs-per-lut inputs-per-lut)
                       (cons 'num-inputs num-inputs)
                       (cons 'num-outputs num-outputs))])
    (make-primitive-interface 'LUT-WITH-CARRY sig inputs #:parameters params)))

(define (lut4-interface inputs)
  (make-lut-interface 4 1 inputs))

(define (mux21-interface D0 D1 S)
  (make-mux-interface 2 (list D0 D1 S)))

(module+ test
  (require rackunit)
  (check-match (lut4-interface '(1 2 3 4))
               (primitive-interface 'LUT
                                    (interface-signature '((I0 1) (I1 1) (I2 1) (I3 1)) '((O0 1)))
                                    (list (cons 'num-inputs 4) (cons 'num-outputs 1))
                                    '(1 2 3 4)))
  (check-match (mux21-interface 1 2 3)
               (primitive-interface 'MUX
                                    (interface-signature '((D0 1) (D1 1) (S 1)) '((O 1)))
                                    '((num-inputs . 2))
                                    '(1 2 3)))
  (let ([carry-3-2 (make-lut-with-carry-interface 3 2 '(1 2 3 4 5 6 7))])
    ;; Check form of carr-3-2
    (check-match carry-3-2
                 (primitive-interface
                  'LUT-WITH-CARRY
                  (interface-signature
                   '((I0_0 1) (I0_1 1) (I1_0 1) (I1_1 1) (I2_0 1) (I2_1 1) (CIN 1))
                   '((O0 1) (O1 1) (O2 1) (COUT 1)))
                  _
                  '(1 2 3 4 5 6 7)))
    ;; Check parameters
    (check-equal? (primitive-interface-get-param carry-3-2 'num-luts) 3)
    (check-equal? (primitive-interface-get-param carry-3-2 'inputs-per-lut) 2)
    (check-equal? (primitive-interface-get-param carry-3-2 'num-inputs) 7)
    (check-equal? (primitive-interface-get-param carry-3-2 'num-outputs) 4)))
