;;; Architecture description utilities.
;;;
;;; This file contains all necessary tools for handling architecture descriptions, including:
;;; - Definitions of all necessary structs.
;;; - Definitions of Lakeroad's supported interfaces.
;;; - Functions for parsing architecture descriptions from files.
;;; - Functions for instantiating instances of interfaces, given an architecture description.
#lang racket/base

(provide construct-interface
         (struct-out interface-identifier)
         xilinx-ultrascale-plus-architecture-description
         lattice-ecp5-architecture-description
         intel-architecture-description
         sofa-architecture-description
         find-biggest-lut-size
         densely-pack-inputs-into-luts
         (struct-out lr:hw-module-instance)
         (struct-out module-instance-port)
         (struct-out module-instance-parameter)
         (struct-out lr:hash-ref)
         (struct-out lr:make-immutable-hash)
         (struct-out lr:cons)
         (struct-out lr:hash-remap-keys))

(require rosette
         yaml
         "utils.rkt"
         (prefix-in lr: "language.rkt")
         rosette/lib/synthax
         rosette/lib/angelic
         "signal.rkt")

;;; Part 1: defining an interface.

;;; Interface identifier.
;;;
;;; Uniquely identifies a parameterized interface, using a name (e.g. "LUT")
;;; and parameters (e.g. (hash "num_inputs" 4)).
(struct interface-identifier (name parameters) #:transparent)

;;; Interface definition.
;;; Represents a valid Lakeroad interface.
;;;
;;; - ports: List of interface-ports.
(struct interface-definition (identifier ports) #:transparent)

;;; Declares a port exposed by an interface.
;;;
;;; - name: String name of the port.
;;; - direction: 'input or 'output.
;;; - bitwidth: integer bitwidth of the port.
(struct interface-port (name direction bitwidth) #:transparent)

(define interfaces
  ;;; LUT2 definition.
  (list (interface-definition (interface-identifier "LUT" (hash "num_inputs" 2))
                              (list (interface-port "I0" 'input 1)
                                    (interface-port "I1" 'input 1)
                                    (interface-port "O" 'output 1)))
        ;;; LUT4 definition.
        (interface-definition (interface-identifier "LUT" (hash "num_inputs" 4))
                              (list (interface-port "I0" 'input 1)
                                    (interface-port "I1" 'input 1)
                                    (interface-port "I2" 'input 1)
                                    (interface-port "I3" 'input 1)
                                    (interface-port "O" 'output 1)))
        ;;; LUT6 definition.
        (interface-definition (interface-identifier "LUT" (hash "num_inputs" 6))
                              (list (interface-port "I0" 'input 1)
                                    (interface-port "I1" 'input 1)
                                    (interface-port "I2" 'input 1)
                                    (interface-port "I3" 'input 1)
                                    (interface-port "I4" 'input 1)
                                    (interface-port "I5" 'input 1)
                                    (interface-port "O" 'output 1)))
        ;;; MUX2 definition.
        (interface-definition (interface-identifier "MUX" (hash "num_inputs" 2))
                              (list (interface-port "I0" 'input 1)
                                    (interface-port "I1" 'input 1)
                                    (interface-port "S" 'input 1)
                                    (interface-port "O" 'output 1)))
        ;;; carry 2 definition.
        (interface-definition (interface-identifier "carry" (hash "width" 2))
                              (list (interface-port "CI" 'input 1)
                                    (interface-port "DI" 'input 2)
                                    (interface-port "S" 'input 2)
                                    (interface-port "CO" 'output 1)
                                    (interface-port "O" 'output 2)))
        ;;; CARRY8 definition.
        (interface-definition (interface-identifier "carry" (hash "width" 8))
                              (list (interface-port "CI" 'input 1)
                                    (interface-port "DI" 'input 8)
                                    (interface-port "S" 'input 8)
                                    (interface-port "CO" 'output 1)
                                    (interface-port "O" 'output 8)))
        ;;; DSP definition.
        (interface-definition
         (interface-identifier "DSP" (hash "out-width" 16 "a-width" 16 "b-width" 16 "c-width" 16))
         (list (interface-port "A" 'input 16)
               (interface-port "B" 'input 16)
               (interface-port "C" 'input 16)
               (interface-port "clk" 'input 1)
               (interface-port "O" 'output 16)))
        (interface-definition
         (interface-identifier "DSP" (hash "out-width" 48 "a-width" 30 "b-width" 18 "c-width" 48))
         (list (interface-port "A" 'input 30)
               (interface-port "B" 'input 18)
               (interface-port "C" 'input 48)
               (interface-port "clk" 'input 1)
               (interface-port "O" 'output 48)))
        (interface-definition
         (interface-identifier "DSP" (hash "out-width" 36 "a-width" 18 "b-width" 18 "c-width" 36))
         (list (interface-port "A" 'input 36)
               (interface-port "B" 'input 18)
               (interface-port "C" 'input 36)
               (interface-port "clk" 'input 1)
               (interface-port "O" 'output 36)))
        (interface-definition
         (interface-identifier "DSP" (hash "out-width" 36 "a-width" 18 "b-width" 18 "c-width" 18))
         (list (interface-port "A" 'input 18)
               (interface-port "B" 'input 18)
               (interface-port "C" 'input 18)
               (interface-port "clk" 'input 1)
               (interface-port "O" 'output 36)))))

;;; Part 2: implementing an interface on a specific architecture.

;;; Represents a port connection in an instantiation of a module.
;;;
;;; - name: Name of the port.
;;; - value: Expression representing the value of the port. For now, this will just be the string name
;;;         of the interface port to connect to this actual port.
;;; - direction: 'input or 'output.
;;; - bitwidth: integer bitwidth of the port.
;;;
;;; I'm not sure whether direction and bitwidth are required yet.
(struct module-instance-port (name value direction bitwidth) #:transparent)
;;; Similar to above, but for parameters.
;;;
;;; TODO(@gussmith23): do we need bitwidth? Seems weird to not have it here but have it above.
(struct module-instance-parameter (name value) #:transparent)

;;; - module-name: String name of the Verilog module.
;;; - ports: List of module-instance-ports.
;;; - params: Immutable map of a string parameter identifier to a string parameter value. The
;;;   parameter value must be the name of a piece of internal state.
;;; - filepath: Filepath of the original Verilog file (this is the file that will be used during
;;;   Verilog simulation.)
;;; - racket-import-filepath: Filepath of the Verilog file modified for Racket importing. Ideally, the
;;;   Racket importer would be good enough to not need this, but there are still untested edge cases.
;;; - instance-name: String or #f, giving an optional name for this instance. Currently, instance
;;;   names are needed when one module instance references the output of another module instance.
;;;
;;; TODO(@gussmith23): module-instance is a bad name for this. Too similar to lr:hw-module-instance,
;;; which is completely different.
(struct module-instance (module-name ports params filepath racket-import-filepath instance-name)
  #:transparent)

;;; - identifier: an interface-identifier, e.g., (interface-identifier "LUT" (hash "num_inputs" 2))
;;; - module-instances: list of `module-instance`s, representing how this interface is implemented.
;;; - internal-data: List of internal state variable defintions. Each internal state variable
;;;   definition is a immutable hash, mapping a string variable name to an integer representing the
;;;   bitwidth of that variable.
;;; - output-map: hash map mapping interface outputs to expressions.
;;; - constraints: list of Rosette functions as strings serving as the argument to an (assert).
(struct interface-implementation (identifier module-instances internal-data output-map constraints)
  #:transparent)

;;; Architecture description.
;;;
;;; - interface-implementations: association list mapping string interface names to interface
;;;   implementations.
(struct architecture-description (interface-implementations) #:transparent)

;;; Return the size of the largest lut that is supported by this architecture
;;; description
(define (find-biggest-lut-size architecture-description)
  (apply max
         (map (lambda (impl)
                (let ([id (interface-implementation-identifier impl)])
                  (if (equal? (interface-identifier-name id) "LUT")
                      (hash-ref (interface-identifier-parameters id) "num_inputs")
                      0)))
              (architecture-description-interface-implementations architecture-description))))

;;; This densely packs a list of innputs into LUTs. By this we mean that
;;; if inputs = (list (list a0...an) (list b0...bn)), then a_i and b_i are
;;; always passed to the same LUT, and as many bits as possible are passed
;;; into a LUT before allocating another LUT.
;;;
;;; Example: suppose an architecture's largest LUT is a LUT4, and suppose we are
;;; passed an inputs-list (list a b) where a and b both have 8 bits. Rather
;;; than using 8 LUT4s, one per each a_i, we can use 4 LUT4s, where the first
;;; takes a0, b0, a1, b1, the second takes a2, b2, a3, b3, etc.
;;;
;;; Returns (list (list lr:hash ...) INTERNAL-DATA)
;;;
;;; TODO(@ninehusky): write the tests for this :)
(define (densely-pack-inputs-into-luts architecture-description
                                       inputs-list
                                       #:internal-data [internal-data #f])
  (match-let*
      ([num-inputs (length inputs-list)]
       [_ (when (or (> num-inputs 2) (= num-inputs 0))
            (error "Can only densely pack 1 or 2 logical inputs"))]
       [biggest-lut-size (find-biggest-lut-size architecture-description)]
       [window-size (if (odd? biggest-lut-size) (sub1 biggest-lut-size) biggest-lut-size)]
       [windowed-inputs (window (interleave inputs-list) window-size)]
       ; Now, pad each input so that it is the same size as the lut inputs.
       ; this handles cases where either our number of inputs isn't a divisor of
       ; biggest-lut-size OR when we have leftover bits (yum!)

       [symbolic-bit (lr:bv (bv->signal (?? (bitvector 1))))]
       [inputs (for/list ([w windowed-inputs])
                 (let* ([diff (- biggest-lut-size (length w))]
                        [right-pads (make-list diff symbolic-bit)])
                   (append w right-pads)))]
       ; [_ (printf "inputs: ~a" inputs)]
       ; get sharable internal data
       [(list _ lut-internal-data)
        (begin
          (let ([_ '()]
                ;;; Note that we don't care what the inputs are hooked up to here, because we are
                ;;; just trying to get the internal data.
                [port-map (for/list ([i biggest-lut-size])
                            (cons (format "I~a" i) (bv 0 1)))]
                [interface-id (interface-identifier "LUT" (hash "num_inputs" biggest-lut-size))])
            (construct-interface architecture-description
                                 interface-id
                                 port-map
                                 #:internal-data internal-data)))])

    (list (for/list ([lut-input inputs])
            (let ([port-map (for/list ([i (length lut-input)] [input lut-input])
                              (cons (format "I~a" i) input))])
              (lr:hash-ref (first (construct-interface
                                   architecture-description
                                   (interface-identifier "LUT" (hash "num_inputs" biggest-lut-size))
                                   port-map
                                   #:internal-data lut-internal-data))
                           'O)))
          lut-internal-data)))

;;; (module+ test
;;;   (require rackunit)
;;;   ((densely-pack-inputs-into-luts sofa-architecture-description (list (range 0 8) (range 8 16)))))

;;; Part 3: constructing things using the architecture description.

;;; Lakeroad construct for a hardware module instance.
;;;
;;; - ports: list of module-instance-ports.
;;; - filepath: Used to identify the module at interpretation time. We can use some other identifier.
(struct lr:hw-module-instance (name ports params filepath) #:transparent)

;;; Find interface implementation in architecture description.
;;;
;;; - ad: architecture description.
;;; - id: interface identifier.
(define (find-interface-implementation ad id)
  (findf (lambda (impl) (equal? (interface-implementation-identifier impl) id))
         (architecture-description-interface-implementations ad)))

;;; Parse an expression in the constraint DSL into a Rosette function.
;;; expr-str: string containing one constraint expression.
;;; lookup-symbol: function that takes a symbol and returns a piece of internal data.
(define (parse-constraint-dsl expr-str lookup-symbol)
  (let ([expr (read (open-input-string expr-str))])
    (letrec ([recursive-helper
              (lambda (expr)
                (match expr
                  [`(bv ,val ,width) (bv val width)]
                  [`(|| ,e ...) (apply || (map recursive-helper e))]
                  [`(&& ,e ...) (apply && (map recursive-helper e))]
                  [`(bveq ,e1 ,e2) (bveq (recursive-helper e1) (recursive-helper e2))]
                  [`(not ,e) (not (recursive-helper e))]
                  [`(extract ,i ,j ,bv) (extract i j (recursive-helper bv))]
                  [`(bvxor ,e1 ,e2) (bvxor (recursive-helper e1) (recursive-helper e2))]
                  [`(=> ,e1 ,e2) (=> (recursive-helper e1) (recursive-helper e2))]
                  [`(bvzero? ,e1) (bvzero? (recursive-helper e1))]
                  [(? symbol? s) (lookup-symbol s)]))])
      (recursive-helper expr))))

;;; Construct a fresh instance of the internal state for a given interface on a given architecture.
(define (construct-internal-data architecture-description interface-name)
  (define interface-implementation
    (or (find-interface-implementation architecture-description interface-name)
        (error "No implementation for interface "
               interface-name
               " on architecture "
               architecture-description)))
  (define constraints (interface-implementation-constraints interface-implementation))
  (define internal-data-definition (interface-implementation-internal-data interface-implementation))

  (define name-to-internal-data (make-hash))

  ;;; We loop over each pair and construct a fresh variable for it.
  ;;; - internal-data-definition-pair: pair of internal state variable name (string) and bitwidth
  ;;;   (integer).
  (define result
    (map (lambda (internal-data-definition-pair)
           (define-symbolic* internal-data (bitvector (cdr internal-data-definition-pair)))
           (hash-set! name-to-internal-data
                      (string->symbol (car internal-data-definition-pair))
                      internal-data)
           (cons (car internal-data-definition-pair) (lr:bv (bv->signal internal-data))))
         (hash->list internal-data-definition)))

  ;;; Iterate over each constraint, replacing variable names with their corresponding internal data
  ;;; before applying the constraint.
  (for ([constraint constraints])
    (assert (parse-constraint-dsl constraint (lambda (s) (hash-ref name-to-internal-data s #f)))))
  result)

;;; Get interface definition from list of interfaces.
;;
;;; Returns interface definition or #f.
(define (find-interface-definition identifier)
  (findf (lambda (interface-definition)
           (equal? (interface-definition-identifier interface-definition) identifier))
         interfaces))

(module+ test
  (require rackunit)
  (test-equal? "find-interface-definition finds LUT4"
               (find-interface-definition (interface-identifier "LUT" (hash "num_inputs" 4)))
               (interface-definition (interface-identifier "LUT" (hash "num_inputs" 4))
                                     (list (interface-port "I0" 'input 1)
                                           (interface-port "I1" 'input 1)
                                           (interface-port "I2" 'input 1)
                                           (interface-port "I3" 'input 1)
                                           (interface-port "O" 'output 1))))

  (test-false "find-interface-definition returns #f"
              (find-interface-definition
               (interface-identifier "NotARealInterface" (hash "num_inputs" 4)))))

(struct lr:hash-ref (h k) #:transparent)
;;; Remap the keys in h (a Lakeroad expression which produces a hashmap) using the association list
;;; ks, which maps old keys to new keys.
(struct lr:hash-remap-keys (h ks) #:transparent)

;;; Parse an expression in our small architecture description DSL.
;;;
;;; This DSL is used within the YAML architecture description. It mimics Lakeroad syntax and semantics
;;; in a simplified form.
;;;
;;; - lookup-symbol: a function which takes a symbol and maps it to an expression. This allows
;;;   parse-dsl to be used in various ways, where you might want to use a different function to look
;;;   up a symbol.
(define (parse-dsl expr-str lookup-symbol)
  (define expr (read (open-input-string expr-str)))
  (define (recursive-helper expr)
    (match expr
      [`(choose ,exprs ...) (apply choose* (map recursive-helper exprs))]
      [`(extract ,i ,j ,expr) (lr:extract (lr:integer i) (lr:integer j) (recursive-helper expr))]
      [`(bv ,val ,width) (lr:bv (bv->signal (bv val width)))]
      [`(bitvector ,val) (lr:bitvector (bitvector val))]
      [`(zero-extend ,val ,bv) (lr:zero-extend (recursive-helper val) (recursive-helper bv))]
      [`(bit ,i ,expr) (lr:extract (lr:integer i) (lr:integer i) (recursive-helper expr))]
      [`(concat ,v ...) (lr:concat (lr:list (map recursive-helper v)))]
      [(? symbol? s) (lookup-symbol s)]))
  (recursive-helper expr))

;;; Construct a Lakeroad expression (lr:hw-module-instance) for a module.
;;;
;;; - module-instance: a `module-instance` describing the module to be constructed.
;;; - internal-data: the internal data; used when looking up values for ports and parameters.
;;; - port-map: used when looking up values for ports.
(define (construct-module module-instance internal-data port-map)
  (let* ([name (module-instance-module-name module-instance)]
         ;;; Construct the list of new ports, by mapping in the values provided in the port-map for
         ;;; the inputs and leaving the outputs alone.
         [ports
          (map
           (lambda (p)
             (module-instance-port
              (module-instance-port-name p)
              (if (equal? (module-instance-port-direction p) 'input)
                  (parse-dsl
                   (module-instance-port-value p)
                   (λ (s)
                     (cdr
                      (or (assoc (symbol->string s) port-map)
                          (assoc (symbol->string s) internal-data)
                          (error
                           (format
                            "No value provided for port ~a in port map\n~a\nor internal data list\n~a"
                            s
                            port-map
                            internal-data))))))
                  (module-instance-port-value p))
              (module-instance-port-direction p)
              (module-instance-port-bitwidth p)))
           (module-instance-ports module-instance))]

         ;;; Construct the list of parameters, by mapping in the values provided in the internal state.
         [parameters (map (lambda (parameter)
                            (module-instance-parameter
                             (module-instance-parameter-name parameter)
                             (parse-dsl (module-instance-parameter-value parameter)
                                        (λ (s)
                                          (cdr (or (assoc (symbol->string s) internal-data)
                                                   (error (format "Did not find parameter ~a in ~a"
                                                                  s
                                                                  internal-data))))))))
                          (module-instance-params module-instance))]
         [filepath (module-instance-filepath module-instance)]

         ;;; Start building the expression. First, we put in an expression representing the hardware
         ;;; module.
         [expr (lr:hw-module-instance name ports parameters filepath)])
    expr))

;;; Internal implementation of construct-interface, which fails if the interface is not found.
;;; External users should use construct-interface.
;;;
;;; - port-map: Maps string port identifiers to expressions.
;;; - internal-data: Internal state constructed using construct-internal-data.
;;;
;;; Returns a Lakeroad expression representing the result of the interface, and the internal data
;;; constructed while generating the interface.
;;;
;;; (list lr:hash internal-data)
(define (construct-interface-internal architecture-description
                                      interface-id
                                      port-map
                                      #:internal-data [internal-data #f])

  (let* ([internal-data (if (not internal-data)
                            (construct-internal-data architecture-description interface-id)
                            internal-data)]
         [interface-implementation
          (or (find-interface-implementation architecture-description interface-id)
              (error "No implementation for interface "
                     interface-id
                     " on architecture "
                     architecture-description))]
         [module-instance
          (begin
            (when (> (length (interface-implementation-module-instances interface-implementation)) 1)
              (error "Interface implementation has more than one module instance"))
            (first (interface-implementation-module-instances interface-implementation)))]
         [interface-definition (or (find-interface-definition interface-id)
                                   (error "Interface definition not found"))]

         [expr (construct-module module-instance internal-data port-map)]

         ;;; Next, we remap the keys to the keys expected by the interface.
         [expr (lr:make-immutable-hash
                (lr:list (for/list ([p (hash->list (interface-implementation-output-map
                                                    interface-implementation))])

                           (lr:cons (lr:symbol (string->symbol (car p)))
                                    (parse-dsl (cdr p) (λ (s) (lr:hash-ref expr s)))))))])
    (list expr internal-data)))

(module+ test
  (require rackunit)
  (test-begin
    "Construct Lattice LUT4"
    (let* ([out (construct-interface-internal (lattice-ecp5-architecture-description)
                                              (interface-identifier "LUT" (hash "num_inputs" 4))
                                              (list (cons "I0" (bv 0 1))
                                                    (cons "I1" (bv 0 1))
                                                    (cons "I2" (bv 0 1))
                                                    (cons "I3" (bv 0 1))))]
           [expr (first out)]
           [internal-data (second out)])
      (check-true (match internal-data
                    [(list (cons "init" (lr:bv v)))
                     (check-true ((bitvector 16) (signal-value v)))
                     #t]
                    [else #f]))
      (check-true
       (match expr
         [(lr:make-immutable-hash
           (lr:list (list (lr:cons (lr:symbol 'O)
                                   (lr:hash-ref (lr:hw-module-instance
                                                 "LUT4"
                                                 (list (module-instance-port "A" v 'input 1)
                                                       (module-instance-port "B" v 'input 1)
                                                       (module-instance-port "C" v 'input 1)
                                                       (module-instance-port "D" v 'input 1)
                                                       (module-instance-port "Z" "O" 'output 1))
                                                 (list (module-instance-parameter "init" s))
                                                 filepath-unchecked)
                                                'Z)))))
          (check-equal? v (bv 0 1))
          #t]
         [else #f])))))

;;; Part 4: A smarter implementation of construct-interface-internal, which handles some cases where some
;;; interfaces are not implemented.

;(construct-lut5-from-lut4 architecture-description ports)

;;; This is a more user-friendly wrapper over construct-interface-internal, which is smart enough to
;;; handle cases where certain interfaces aren't implemented.
(define (construct-interface architecture-description
                             interface-id
                             port-map
                             #:internal-data [internal-data #f])
  (cond
    ;;; If the interface is implemented, then we just construct it.
    [(find-interface-implementation architecture-description interface-id)
     (construct-interface-internal architecture-description
                                   interface-id
                                   port-map
                                   #:internal-data internal-data)]

    ;;; Case: They're asking for a smaller LUT, and we have a bigger LUT implemented.
    ;;;
    ;;; Research note: Even just the ordering of this cond clause with the below cond clause is a
    ;;; value judgement. We will first attempt to construct a LUT out of larger LUTs, and then we
    ;;; will look for smaller LUTs. That's not always going to be the right thing to do.
    [;;; Check: They're asking for a LUT.
     (and (equal? "LUT" (interface-identifier-name interface-id))
          ;;; Check: The architecture description implements a larger LUT.
          (findf
           (lambda (impl)
             (and (equal? "LUT"
                          (interface-identifier-name (interface-implementation-identifier impl)))
                  (> (hash-ref (interface-identifier-parameters
                                (interface-implementation-identifier impl))
                               "num_inputs")
                     (hash-ref (interface-identifier-parameters interface-id) "num_inputs"))))
           (architecture-description-interface-implementations architecture-description)))

     (match-let*
         (;;; Note: a very important part of how this code works is that it's deterministic: if we ask
          ;;; for a LUT2 and it gets implemented on a LUT4, the next time we ask for a LUT2 it must
          ;;; again be implemented on a LUT4! Otherwise, our method of implementing opaque internal
          ;;; data will not work.

          ;;; TODO(@gussmith23): We should minimize the size of the LUT that we use to implement the
          ;;; smaller LUT. Currently, we just take the first thing that works.
          [larger-lut-interface-identifier
           (interface-implementation-identifier
            (or (findf
                 (lambda (impl)
                   (and
                    (equal? "LUT"
                            (interface-identifier-name (interface-implementation-identifier impl)))
                    (> (hash-ref (interface-identifier-parameters
                                  (interface-implementation-identifier impl))
                                 "num_inputs")
                       (hash-ref (interface-identifier-parameters interface-id) "num_inputs"))))
                 (architecture-description-interface-implementations architecture-description))
                (error)))]
          ;;; Size of the LUT requested by the user.
          [requested-lut-size (hash-ref (interface-identifier-parameters interface-id) "num_inputs")]
          ;;; Size of the larger LUT that we'll use to satisfy the request.
          [larger-lut-size
           (hash-ref (interface-identifier-parameters larger-lut-interface-identifier) "num_inputs")]
          ;;; The new port map is the old port map, with the extra inputs set to 1'b1. Note: the
          ;;; decision to set them to high is arbitrary, based on the fact that it's helpful when
          ;;; to set them to 1 on Xilinx. We should perhaps allow this to be configurable.
          [new-port-map (append port-map
                                (for/list ([i (range requested-lut-size larger-lut-size)])
                                  (cons (format "I~a" i) (lr:bv (bv->signal (bv 1 1))))))]
          [(list out-lut-expr internal-data)
           (construct-interface-internal architecture-description
                                         larger-lut-interface-identifier
                                         new-port-map
                                         #:internal-data internal-data)])

       (list out-lut-expr internal-data))]

    ;;; TODO(@gussmith23): This seems to be broken on Xilinx. Constructing a larger LUT out of LUT2s
    ;;; loops infinitely!
    ;;;
    ;;; Case: they're asking for a LUT bigger than what we have (but we do have a LUT).
    ;;;
    ;;; In this case, we can construct the bigger LUT out of smaller LUTs by recursive calls to this
    ;;; function.
    [;;; Check: They're asking for a LUT.
     (and (equal? "LUT" (interface-identifier-name interface-id))
          ;;; Check: The architecture description implements a smaller LUT.
          (findf
           (lambda (impl)
             (and (equal? "LUT"
                          (interface-identifier-name (interface-implementation-identifier impl)))
                  (< (hash-ref (interface-identifier-parameters
                                (interface-implementation-identifier impl))
                               "num_inputs")
                     (hash-ref (interface-identifier-parameters interface-id) "num_inputs"))))
           (architecture-description-interface-implementations architecture-description))
          ;;; TODO: Check that the architecture description implements MUX2.
          )

     ;;; In this case, we recursively construct a LUT out of 2 LUTs of a smaller size, and mux them
     ;;; together. Note that we should probably also check that the arch description implements
     ;;; MUXes. For now we just assume it.
     (match-let*
         (;;; first, destruct the internal state. we know exactly what the internal state should look
          ;;; like at this point.
          [lut-0-internal-data (if internal-data (first internal-data) #f)]
          [lut-1-internal-data (if internal-data (second internal-data) #f)]
          [mux-internal-data (if internal-data (third internal-data) #f)]

          ;;; the name of the lut which is 1 smaller than the one we're trying to construct.
          [smaller-lut-interface-identifier
           (interface-identifier
            "LUT"
            (hash "num_inputs"
                  (sub1 (hash-ref (interface-identifier-parameters interface-id) "num_inputs"))))]

          ;;; The ports that should be passed to the smaller LUTs. This is easy to figure out: we just
          ;;; drop one of the inputs to the larger LUT! Then, we'll use that dropped input as the
          ;;; selector of the MUX2.
          [smaller-lut-ports (take port-map (sub1 (length port-map)))]
          [mux-selector (cdr (list-ref port-map (sub1 (length port-map))))]

          [(list lut-expr0 lut-0-internal-data)
           (construct-interface architecture-description
                                smaller-lut-interface-identifier
                                smaller-lut-ports
                                #:internal-data lut-0-internal-data)]
          [lut-O-expr0 (lr:hash-ref lut-expr0 'O)]
          [(list lut-expr1 lut-1-internal-data)
           (construct-interface architecture-description
                                smaller-lut-interface-identifier
                                smaller-lut-ports
                                #:internal-data lut-1-internal-data)]
          [lut-O-expr1 (lr:hash-ref lut-expr1 'O)]
          ;;; TODO(@gussmith23): IT just so happens that the output of the mux and the output of the
          ;;; LUT are both named O. In the future, we will need to add support for remapping names.
          [(list mux-expr mux-internal-data)
           (construct-interface
            architecture-description
            (interface-identifier "MUX" (hash "num_inputs" 2))
            (list (cons "I0" lut-O-expr0) (cons "I1" lut-O-expr1) (cons "S" mux-selector))
            #:internal-data mux-internal-data)])
       (list mux-expr (list lut-0-internal-data lut-1-internal-data mux-internal-data)))]

    ;;; Implement a larger or smaller carry chain by chaining together an existing carry chain.
    [;;; Check: They're asking for a carry.
     (and (equal? "carry" (interface-identifier-name interface-id))
          ;;; Check: The architecture description implements any carry. Note that we have already
          ;;; checked whether the architecture description implements the exact carry requested, so we
          ;;; know this carry is not the correct size.
          (findf
           (lambda (impl)
             (equal? "carry" (interface-identifier-name (interface-implementation-identifier impl))))
           (architecture-description-interface-implementations architecture-description)))

     (match-let*
         ([_ 0] ;;; Dummy line to stop formatter from moving my comments.

          [ci-expr (cdr (or (assoc "CI" port-map) (error "Expected CI")))]
          [di-expr (cdr (or (assoc "DI" port-map) (error "Expected DI")))]
          [s-expr (cdr (or (assoc "S" port-map) (error "Expected S")))]

          ;;; Unpack internal data.
          [carry-internal-data (if internal-data (first internal-data) #f)]
          ;;; Padding values used to fill the potentially empty DI and S ports.
          [di-padding-val (if internal-data (second internal-data) (?? (bitvector 1)))]
          [s-padding-val (if internal-data (third internal-data) (?? (bitvector 1)))]

          ;;; The width requested by the user.
          [requested-width (hash-ref (interface-identifier-parameters interface-id) "width")]

          ;;; The carry we actually have implemented.
          ;;; TODO(@gussmith23) should probably find the largest one that works, or something.
          [our-carry-impl
           (findf (lambda (impl)
                    (equal? "carry"
                            (interface-identifier-name (interface-implementation-identifier impl))))
                  (architecture-description-interface-implementations architecture-description))]

          ;;; Our carry's width
          [our-carry-width (hash-ref (interface-identifier-parameters
                                      (interface-implementation-identifier our-carry-impl))
                                     "width")]

          ;;; The number of our carries needed to implement a carry of the requested size.
          [num-carries-needed (ceiling (/ requested-width our-carry-width))]

          ;;; Instantiate carry internal data to be shared across all of the carries.
          [(list _ carry-internal-data)
           (construct-interface-internal
            architecture-description
            (interface-implementation-identifier our-carry-impl)
            (list (cons "CI" 'unused) (cons "DI" 'unused) (cons "S" 'unused))
            #:internal-data carry-internal-data)]

          ;;; Function for fold call. We need a fold because the carryin/carryout is passed
          ;;; between each carry.
          ;;; - carry-i: The index of the carry to create next.
          ;;; - carry-expr: The carry expression built up so far.
          ;;; Generates a new carry expression, which takes the old carryout as the new carryin.
          [fold-fn
           (lambda (carry-i carry-expr)
             (match-let*
                 (;;; This carry's carryin is the previous carry's carryout.
                  [this-ci (if (equal? 'first carry-expr) ci-expr (lr:hash-ref carry-expr 'CO))]
                  ;;; This carry's DI/S signals are a portion of the overall DI/S signals provided by
                  ;;; the user.
                  ;;;
                  ;;; This function extracts the correct portion of the larger DI/S signal, and pads
                  ;;; it if necessary.
                  [extract-fn
                   (lambda (expr pad-val)
                     (let* ([h (min (sub1 (* (+ carry-i 1) our-carry-width)) (sub1 requested-width))]
                            [l (* carry-i our-carry-width)]
                            [padding (- our-carry-width (add1 (- h l)))]
                            [extract-expr (lr:extract (lr:integer h) (lr:integer l) expr)])
                       (if (equal? padding 0)
                           extract-expr
                           (lr:concat
                            (lr:list
                             (list (lr:bv (bv->signal (apply concat (make-list padding pad-val))))
                                   extract-expr))))))]
                  [this-di (extract-fn di-expr di-padding-val)]
                  [this-s (extract-fn s-expr s-padding-val)]
                  [this-carry (first (construct-interface-internal
                                      architecture-description
                                      (interface-implementation-identifier our-carry-impl)
                                      (list (cons "CI" this-ci) (cons "DI" this-di) (cons "S" this-s))
                                      #:internal-data carry-internal-data))]

                  ;;; The new carry expression concatenates the value of the previous carries' O with
                  ;;; the O output of this carry. The new carry's carryout is just the carryout of the
                  ;;; carry we just created.
                  [new-carry-expr
                   (lr:make-immutable-hash
                    (lr:list (list (lr:cons (lr:symbol 'CO) (lr:hash-ref this-carry 'CO))
                                   (lr:cons (lr:symbol 'O)
                                            ;;; The first time, we don't have a previous carry to
                                            ;;; concat with.
                                            (if (equal? 'first carry-expr)
                                                (lr:hash-ref this-carry 'O)
                                                (lr:concat (lr:list (list (lr:hash-ref this-carry 'O)
                                                                          (lr:hash-ref carry-expr
                                                                                       'O)))))))))])
               new-carry-expr))]

          ;;; Perform the fold.
          [out-expr (foldl fold-fn 'first (range num-carries-needed))]

          ;;; Finally, extract just the bits that we need from the O output. Leave CO the same.
          [out-expr (lr:make-immutable-hash
                     (lr:list (list (lr:cons (lr:symbol 'CO) (lr:hash-ref out-expr 'CO))
                                    (lr:cons (lr:symbol 'O)
                                             (lr:extract (lr:integer (sub1 requested-width))
                                                         (lr:integer 0)
                                                         (lr:hash-ref out-expr 'O))))))])

       (list out-expr (list carry-internal-data di-padding-val s-padding-val)))]

    ;;; Implement a carry chain when one doesn't exist.
    [;;; Check: They're asking for a carry.
     (and (equal? "carry" (interface-identifier-name interface-id))
          ;;; Check: The architecture description implements any LUT. TODO: actually, it needs to
          ;;; implement a LUT of size 2 or greater...
          (findf
           (lambda (impl)
             (equal? "LUT" (interface-identifier-name (interface-implementation-identifier impl))))
           (architecture-description-interface-implementations architecture-description))
          ;;; Check: the architecture doesn't implement a carry (otherwise we'll just implement this
          ;;; with a carry).
          (equal?
           #f
           (findf (lambda (impl)
                    (equal? "carry"
                            (interface-identifier-name (interface-implementation-identifier impl))))
                  (architecture-description-interface-implementations architecture-description))))

     (define width (hash-ref (interface-identifier-parameters interface-id) "width"))
     (define ci-expr (cdr (or (assoc "CI" port-map) (error "Expected CI"))))
     (define di-expr (cdr (or (assoc "DI" port-map) (error "Expected DI"))))
     (define s-expr (cdr (or (assoc "S" port-map) (error "Expected S"))))

     ;;; Carry is implemented recursively. An n-length carry chain can be seen as a 1-length carry
     ;;; chain connected to an n-1-length carry chain.
     (if (equal? width 1)
         ;;; Base case of recursion. Construct a carry of length 1, which is a mux and an XOR.
         (match-let*
             ([mux-internal-data (if (equal? #f internal-data) #f (first internal-data))]
              [lut-internal-data (if (equal? #f internal-data) #f (second internal-data))]
              ;;; Construct a mux that muxes the 1-bit DI and the carry in, using the 1-bit S (the sum
              ;;; signal) as the selector signal. Note that the fact that the selector signal is also
              ;;; named "S" is a coincidence: it's not the same signal as the sum signal.
              [(list mux-expr mux-internal-data)
               (construct-interface architecture-description
                                    (interface-identifier "MUX" (hash "num_inputs" 2))
                                    (list (cons "I0" di-expr) (cons "I1" ci-expr) (cons "S" s-expr))
                                    #:internal-data mux-internal-data)]

              ;;; Construct a LUT over the 1-bit S and the carry in, to compute the final sum.
              [(list lut-expr lut-internal-data)
               (construct-interface architecture-description
                                    (interface-identifier "LUT" (hash "num_inputs" 2))
                                    (list (cons "I0" s-expr) (cons "I1" ci-expr))
                                    #:internal-data lut-internal-data)]

              [out-expr (lr:make-immutable-hash
                         (lr:list (list (lr:cons (lr:symbol 'CO) (lr:hash-ref mux-expr 'O))
                                        (lr:cons (lr:symbol 'O) (lr:hash-ref lut-expr 'O)))))])

           (list out-expr (list mux-internal-data lut-internal-data)))
         ;;; Recursive case.
         (match-let*
             (;;; Construct a carry of length 1.
              [(list carry-0-expr internal-data)
               (construct-interface
                architecture-description
                (interface-identifier "carry" (hash "width" 1))
                (list
                 (cons "CI" ci-expr)
                 ;;; We use max to ensure that we don't try to extract at a negative number when width
                 ;;; = 1. When width = 1, we will hit the base case above upon recursion and DI and S
                 ;;; won't be accessed, so their values don't matter.
                 (cons "DI" (lr:extract (lr:integer 0) (lr:integer 0) di-expr))
                 (cons "S" (lr:extract (lr:integer 0) (lr:integer 0) s-expr)))
                #:internal-data internal-data)]
              ;;; Construct a carry of length n - 1.
              [(list carry-1-expr internal-data)
               (construct-interface
                architecture-description
                (interface-identifier "carry" (hash "width" (sub1 width)))
                ;;; Carry in is the carry out of the carry of length 1.
                (list (cons "CI" (lr:hash-ref carry-0-expr 'CO))
                      (cons "DI" (lr:extract (lr:integer (sub1 width)) (lr:integer 1) di-expr))
                      (cons "S" (lr:extract (lr:integer (sub1 width)) (lr:integer 1) s-expr)))
                #:internal-data internal-data)]

              [out-expr
               (lr:make-immutable-hash
                ;;; Carry-out is computed by the last mux.
                (lr:list (list (lr:cons (lr:symbol 'CO) (lr:hash-ref carry-1-expr 'CO))
                               ;;; Sum output of the entire carry is all of the output sum bits
                               ;;; concatted together. In the case of width=1, it's just the single
                               ;;; output sum bit computed by the lut.
                               (lr:cons (lr:symbol 'O)
                                        (lr:concat (lr:list (list (lr:hash-ref carry-1-expr 'O)
                                                                  (lr:hash-ref carry-0-expr
                                                                               'O))))))))])

           (list out-expr internal-data)))]

    ;;; Implement a mux2 with a LUT.
    ;;;
    ;;; TODO(@gussmith23): Generalize to multi-input mux.
    [;;; Check: They're asking for a mux2.
     (and
      (equal? "MUX" (interface-identifier-name interface-id))
      (equal? (hash-ref (interface-identifier-parameters interface-id) "num_inputs") 2)
      ;;; Check: The architecture description implements any LUT. TODO: actually, it needs to
      ;;; implement a LUT of size 2 or greater...
      (findf (lambda (impl)
               (equal? "LUT" (interface-identifier-name (interface-implementation-identifier impl))))
             (architecture-description-interface-implementations architecture-description))
      ;;; Check: the architecture doesn't implement a mux (otherwise we'll just implement this
      ;;; with a mux).
      (equal?
       #f
       (findf (lambda (impl)
                (equal? "MUX" (interface-identifier-name (interface-implementation-identifier impl))))
              (architecture-description-interface-implementations architecture-description))))

     (construct-interface architecture-description
                          (interface-identifier "LUT" (hash "num_inputs" 3))
                          (list (cons "I0" (cdr (or (assoc "I0" port-map) (error "Expected I0"))))
                                (cons "I1" (cdr (or (assoc "I1" port-map) (error "Expected I1"))))
                                (cons "I2" (cdr (or (assoc "S" port-map) (error "Expected S")))))
                          #:internal-data internal-data)]

    ;;; Implement a smaller DSP with a larger DSP.
    ;;; Specifically, if they requested a DSP with an output width smaller than what the implemented
    ;;; one supports, then it's fine. Also, if their requested input sizes are smaller than what the
    ;;; output supports, then it's also fine.
    [(let* ([their-dsp-impl
             (findf
              (lambda (impl)
                (equal? "DSP" (interface-identifier-name (interface-implementation-identifier impl))))
              (architecture-description-interface-implementations architecture-description))]
            [their-out-width (hash-ref (interface-identifier-parameters
                                        (interface-implementation-identifier their-dsp-impl))
                                       "out-width")]
            [requested-out-width
             (hash-ref (interface-identifier-parameters interface-id) "out-width")]
            [their-a-width (hash-ref (interface-identifier-parameters
                                      (interface-implementation-identifier their-dsp-impl))
                                     "a-width")]
            [requested-a-width (hash-ref (interface-identifier-parameters interface-id) "a-width")]
            [their-b-width (hash-ref (interface-identifier-parameters
                                      (interface-implementation-identifier their-dsp-impl))
                                     "b-width")]
            [requested-b-width (hash-ref (interface-identifier-parameters interface-id) "b-width")]
            [their-c-width (hash-ref (interface-identifier-parameters
                                      (interface-implementation-identifier their-dsp-impl))
                                     "c-width")]
            [requested-c-width (hash-ref (interface-identifier-parameters interface-id) "c-width")])

       ;;; Check: They're asking for a DSP.
       (and (equal? "DSP" (interface-identifier-name interface-id))
            ;;; Check: The architecture description implements a DSP.
            their-dsp-impl
            ;;; Check: the implemented DSP is larger than the requested DSP.
            (>= their-out-width requested-out-width)
            (>= their-a-width requested-a-width)
            (>= their-b-width requested-b-width)
            (>= their-c-width requested-c-width)))

     (match-let*
         ([their-dsp-impl
           (findf
            (lambda (impl)
              (equal? "DSP" (interface-identifier-name (interface-implementation-identifier impl))))
            (architecture-description-interface-implementations architecture-description))]
          [their-out-width (hash-ref (interface-identifier-parameters
                                      (interface-implementation-identifier their-dsp-impl))
                                     "out-width")]
          [requested-out-width (hash-ref (interface-identifier-parameters interface-id) "out-width")]
          [their-a-width (hash-ref (interface-identifier-parameters
                                    (interface-implementation-identifier their-dsp-impl))
                                   "a-width")]
          [requested-a-width (hash-ref (interface-identifier-parameters interface-id) "a-width")]
          [their-b-width (hash-ref (interface-identifier-parameters
                                    (interface-implementation-identifier their-dsp-impl))
                                   "b-width")]
          [requested-b-width (hash-ref (interface-identifier-parameters interface-id) "b-width")]
          [their-c-width (hash-ref (interface-identifier-parameters
                                    (interface-implementation-identifier their-dsp-impl))
                                   "c-width")]
          [requested-c-width (hash-ref (interface-identifier-parameters interface-id) "c-width")]

          [(list dsp-expr internal-data)
           (construct-interface
            architecture-description
            (interface-identifier "DSP"
                                  (hash "out-width"
                                        their-out-width
                                        "a-width"
                                        their-a-width
                                        "b-width"
                                        their-b-width
                                        "c-width"
                                        their-c-width))
            ;;; Either sign extend or zero extend the data inputs. Some multipliers handle signed
            ;;; inputs, some multipliers take sign as a separate argument.
            (list (cons "A"
                        (choose (lr:zero-extend (cdr (or (assoc "A" port-map) (error "Expected A")))
                                                (lr:bitvector (bitvector their-a-width)))
                                (lr:sign-extend (cdr (or (assoc "A" port-map) (error "Expected A")))
                                                (lr:bitvector (bitvector their-a-width)))))
                  (cons "B"
                        (choose (lr:zero-extend (cdr (or (assoc "B" port-map) (error "Expected B")))
                                                (lr:bitvector (bitvector their-b-width)))
                                (lr:sign-extend (cdr (or (assoc "B" port-map) (error "Expected B")))
                                                (lr:bitvector (bitvector their-b-width)))))
                  (cons "C"
                        (choose (lr:zero-extend (cdr (or (assoc "C" port-map) (error "Expected C")))
                                                (lr:bitvector (bitvector their-c-width)))
                                (lr:sign-extend (cdr (or (assoc "C" port-map) (error "Expected C")))
                                                (lr:bitvector (bitvector their-c-width)))))
                  (cons "clk" (cdr (or (assoc "clk" port-map) (error "Expected clk"))))
                  (cons "rst" (cdr (or (assoc "rst" port-map) (error "Expected rst")))))
            #:internal-data internal-data)])
       (list (lr:make-immutable-hash
              (lr:list (list (lr:cons (lr:symbol 'O)
                                      (lr:extract (lr:integer (- requested-out-width 1))
                                                  (lr:integer 0)
                                                  (lr:hash-ref dsp-expr 'O))))))
             internal-data))]

    [else
     (error
      "Interface not implemented, and no way to implement it with the interfaces already implemented: "
      interface-id)]))

(module+ test
  (test-case "Construct smaller DSP from larger DSP"
    (match-let* ([(list expr internal-data)
                  (construct-interface (xilinx-ultrascale-plus-architecture-description)
                                       (interface-identifier
                                        "DSP"
                                        (hash "out-width" 8 "a-width" 8 "b-width" 8 "c-width" 8))
                                       (list (cons "A" 'a-input-expr)
                                             (cons "B" 'b-input-expr)
                                             (cons "C" 'c-input-expr)
                                             (cons "rst" 'rst-expr)
                                             (cons "clk" 'clk-expr)))])
      (check-true
       (match expr
         [(lr:make-immutable-hash
           (lr:list
            (list (lr:cons
                   (lr:symbol 'O)
                   (lr:extract
                    (lr:integer 7)
                    (lr:integer 0)
                    (lr:hash-ref
                     (lr:make-immutable-hash
                      (lr:list (list (lr:cons (lr:symbol 'O)
                                              (lr:hash-ref
                                               (lr:hw-module-instance
                                                "DSP48E2"
                                                (list stuff ...
                                                      (module-instance-port "A" a-expr 'input 30)
                                                      stuff2 ...
                                                      (module-instance-port "B" b-expr 'input 18)
                                                      stuff3 ...
                                                      (module-instance-port "C" c-expr 'input 48)
                                                      stuff4 ...
                                                      (module-instance-port "CLK" 'clk-expr 'input 1)
                                                      stuff5 ...
                                                      (module-instance-port "P" "P" 'output 48)
                                                      others ...)
                                                params
                                                filepath)
                                               'P)))))
                     'O)))
                  others ...)))
          #t]
         [else #f]))))

  (test-begin
    "Construct a LUT5 on Lattice from LUT4s and a MUX2."
    (match-let* ([(list expr internal-data)
                  (construct-interface (lattice-ecp5-architecture-description)
                                       (interface-identifier "LUT" (hash "num_inputs" 5))
                                       (list (cons "I0" (bv 0 1))
                                             (cons "I1" (bv 0 1))
                                             (cons "I2" (bv 0 1))
                                             (cons "I3" (bv 0 1))
                                             (cons "I4" (bv 0 1))))])
      (check-true (match internal-data
                    [(list (list (cons "init" (lr:bv v0)))
                           (list (cons "init" (lr:bv v1)))
                           (list (cons "init" (lr:bv v2))))
                     (check-true ((bitvector 16) (signal-value v0)))
                     (check-true ((bitvector 16) (signal-value v1)))
                     (check-true ((bitvector 16) (signal-value v2)))
                     #t]
                    [else #f]))
      (check-true
       (match expr
         [(lr:make-immutable-hash
           (lr:list
            (list
             (lr:cons
              (lr:symbol 'O)
              (lr:hash-ref
               (lr:hw-module-instance
                "LUT4"
                (list (module-instance-port
                       "A"
                       (lr:hash-ref
                        (lr:make-immutable-hash
                         (lr:list (list (lr:cons (lr:symbol 'O)
                                                 (lr:hash-ref
                                                  (lr:hw-module-instance
                                                   "LUT4"
                                                   (list (module-instance-port "A" v 'input 1)
                                                         (module-instance-port "B" v 'input 1)
                                                         (module-instance-port "C" v 'input 1)
                                                         (module-instance-port "D" v 'input 1)
                                                         (module-instance-port "Z" "O" 'output 1))
                                                   (list (module-instance-parameter "init" s0))
                                                   lut4-filepath)
                                                  'Z)))))
                        'O)
                       'input
                       1)
                      (module-instance-port
                       "B"
                       (lr:hash-ref
                        (lr:make-immutable-hash
                         (lr:list (list (lr:cons (lr:symbol 'O)
                                                 (lr:hash-ref
                                                  (lr:hw-module-instance
                                                   "LUT4"
                                                   (list (module-instance-port "A" v 'input 1)
                                                         (module-instance-port "B" v 'input 1)
                                                         (module-instance-port "C" v 'input 1)
                                                         (module-instance-port "D" v 'input 1)
                                                         (module-instance-port "Z" "O" 'output 1))
                                                   (list (module-instance-parameter "init" s1))
                                                   lut4-filepath)
                                                  'Z)))))
                        'O)
                       'input
                       1)
                      (module-instance-port "C" (? (λ (v) (bveq v (bv 0 1)))) 'input 1)
                      (module-instance-port "D" unchecked-expr 'input 1)
                      (module-instance-port "Z" "O" 'output 1))
                (list (module-instance-parameter "init" s2))
                lut4-filepath)
               'Z)))))
          #t]
         [else #f])))))

;;; Parse an architecture description from a file.
(define (parse-architecture-description-file filepath)
  (define yaml (read-yaml (open-input-file filepath)))

  ;;; Converts any hash to an immutable hash.
  ;;;
  ;;; Annoyingly, the YAML library parses dictionaries into mutable hashes, and we have no power to
  ;;; control that. Thus, we must convert them to immutable hashes on our side. Forgetting to convert
  ;;; to immutable can lead to hard-to-find bugs, especially because mutable and immutable hashes look
  ;;; the same when displayed.
  (define (convert-to-immutable h)
    (make-immutable-hash (hash->list h)))

  (define impls-yaml
    (or (hash-ref yaml "implementations")
        (error "No interface implementations found in architecture description.")))

  (define (parse-interface-identifier y)
    (define name (hash-ref y "name"))
    (define parameters (convert-to-immutable (hash-ref y "parameters")))
    (interface-identifier name parameters))

  ;;; Parse a module instance's port definition.
  ;;;
  ;;; - y: port definition object, as parsed from YAML.
  (define (parse-port y)
    (module-instance-port (hash-ref y "name")
                          (hash-ref y "value")
                          (match (hash-ref y "direction")
                            ["input" 'input]
                            ["output" 'output]
                            [else (error "Unknown port direction: " (hash-ref y "direction"))])
                          (hash-ref y "bitwidth")))

  (define (parse-parameter y)
    (module-instance-parameter (hash-ref y "name") (hash-ref y "value")))

  ;;; Parse a module instance, which has three fields:
  ;;;
  ;;; - module_name: name of the Verilog module.
  ;;; - ports: port map, mapping actual port names to interface port names. Optional; if not
  ;;;     specified, then the port names are assumed to be the same as the interface port names.
  ;;; - parameters: parameter map, mapping any module parameter names to internal data names.
  ;;;     Optional.
  (define (parse-module-instance module-instance-yaml interface-definition)
    (define module-name (hash-ref module-instance-yaml "module_name"))
    (define ports (map parse-port (hash-ref module-instance-yaml "ports")))
    ;;; Parameters list is optional.
    (define parameters (map parse-parameter (hash-ref module-instance-yaml "parameters" (list))))
    (define filepath (hash-ref module-instance-yaml "filepath"))
    ;;; racket-import-filepath is optional, defaults to filepath if not specified.
    (define racket-import-filepath
      (or (hash-ref module-instance-yaml "racket_import_filepath" #f) filepath))
    ;;; instance-name is optional, defaults to #f.
    (define instance-name (hash-ref module-instance-yaml "instance_name" #f))
    (module-instance module-name ports parameters filepath racket-import-filepath instance-name))

  ;;; Parse list of modules.
  (define (parse-modules modules-yaml interface-definition)
    (for/list ([module-yaml modules-yaml])
      (parse-module-instance module-yaml interface-definition)))

  ;;; Parse internal data.

  ;;; Parse an implementation.
  (define (parse-impl impl-yaml)
    (define interface-identifier
      (parse-interface-identifier (or (hash-ref impl-yaml "interface" #f)
                                      (error "interface field not found"))))

    (define interface-definition
      (or (find-interface-definition interface-identifier)
          (error "Interface definition not found for" interface-identifier)))

    (define modules
      (parse-modules (or (hash-ref impl-yaml "modules" #f) (error "modules not found"))
                     interface-definition))

    (define output-map (or (hash-ref impl-yaml "outputs" #f) (error "outputs not found")))

    (define constraints (hash-ref impl-yaml "constraints" (list)))

    (interface-implementation
     interface-identifier
     modules
     (convert-to-immutable (or (hash-ref impl-yaml "internal_data" #f) (hash)))
     (convert-to-immutable output-map)
     constraints))

  (define implementations
    (for/list ([impl-yaml impls-yaml])
      (parse-impl impl-yaml)))

  (architecture-description implementations))

;;; Get architecture description of Xilinx UltraScale+.
(define (xilinx-ultrascale-plus-architecture-description)
  (parse-architecture-description-file
   (build-path (get-lakeroad-directory) "architecture_descriptions" "xilinx_ultrascale_plus.yml")))

;;; Get architecture description of Lattice ECP5.
(define (lattice-ecp5-architecture-description)
  (parse-architecture-description-file
   (build-path (get-lakeroad-directory) "architecture_descriptions" "lattice_ecp5.yml")))

;;; Get architecture description of SOFA.
(define (sofa-architecture-description)
  (parse-architecture-description-file
   (build-path (get-lakeroad-directory) "architecture_descriptions" "sofa.yml")))

;;; Get architecture description of Intel.
(define (intel-architecture-description)
  (parse-architecture-description-file
   (build-path (get-lakeroad-directory) "architecture_descriptions" "intel.yml")))

(module+ test
  (define-symbolic SOME_DATA (bitvector 32))
  (test-case "Test parsing of constraints."
    (check-eq? (parse-constraint-dsl "(|| (bveq SOME_DATA (bv 0 32)) (bveq SOME_DATA (bv 1 32)))"
                                     (lambda (s) (hash-ref (hash 'SOME_DATA SOME_DATA) s)))
               (|| (bveq SOME_DATA (bv 0 32)) (bveq SOME_DATA (bv 1 32))))))

(module+ test
  (test-case "Parse Intel YAML"
    (begin
      (check-true
       (match (intel-architecture-description)
         [(architecture-description
           (list (interface-implementation
                  (interface-identifier "DSP"
                                        (hash-table ("out-width" 36) ("a-width" 18) ("b-width" 18)))
                  module-instance
                  internal-data
                  output-map
                  constraints)))
          #t]
         [else #f])))))

(module+ test
  (test-case "Parse Xilinx UltraScale+ YAML"
    (begin
      (check-true
       (match (xilinx-ultrascale-plus-architecture-description)
         [(architecture-description
           (list (interface-implementation
                  (interface-identifier "LUT" (hash-table ("num_inputs" 2)))
                  (list (module-instance "LUT2"
                                         (list (module-instance-port "I0" "I0" 'input 1)
                                               (module-instance-port "I1" "I1" 'input 1)
                                               (module-instance-port "O" "O" 'output 1))
                                         (list (module-instance-parameter "INIT" "INIT"))
                                         "../verilator_xilinx/LUT2.v"
                                         "../verilator_xilinx/LUT2.v"
                                         #f))
                  (hash-table ("INIT" 4))
                  (hash-table ("O" "O"))
                  (list))
                 (interface-implementation
                  (interface-identifier "LUT" (hash-table ("num_inputs" 6)))
                  (list (module-instance "LUT6"
                                         (list (module-instance-port "I0" "I0" 'input 1)
                                               (module-instance-port "I1" "I1" 'input 1)
                                               (module-instance-port "I2" "I2" 'input 1)
                                               (module-instance-port "I3" "I3" 'input 1)
                                               (module-instance-port "I4" "I4" 'input 1)
                                               (module-instance-port "I5" "I5" 'input 1)
                                               (module-instance-port "O" "O" 'output 1))
                                         (list (module-instance-parameter "INIT" "INIT"))
                                         "../verilator_xilinx/LUT6.v"
                                         "../modules_for_importing/xilinx_ultrascale_plus/LUT6.v"
                                         #f))
                  (hash-table ("INIT" 64))
                  (hash-table ("O" "O"))
                  (list))
                 (interface-implementation
                  (interface-identifier "carry" (hash-table ("width" 8)))
                  (list (module-instance "CARRY8"
                                         (list (module-instance-port "CI" "CI" 'input 1)
                                               (module-instance-port "DI" "DI" 'input 8)
                                               (module-instance-port "S" "S" 'input 8)
                                               (module-instance-port "CO" "CO" 'output 8)
                                               (module-instance-port "O" "O" 'output 8))
                                         (list)
                                         "../verilator_xilinx/CARRY8.v"
                                         "../modules_for_importing/xilinx_ultrascale_plus/CARRY8.v"
                                         #f))
                  (hash-table)
                  (hash-table ("CO" "(bit 7 CO)") ("O" "O"))
                  (list))
                 (interface-implementation
                  (interface-identifier
                   "DSP"
                   (hash-table ("out-width" 48) ("a-width" 30) ("b-width" 18) ("c-width" 48)))
                  module-instances
                  internal-data
                  (hash-table ("O" "P"))
                  constraints)))

          (check-true
           (not
            (equal?
             (member
              "(|| (bveq AUTORESET_PATDET (bv 3 5)) (bveq AUTORESET_PATDET (bv 4 5)) (bveq AUTORESET_PATDET (bv 5 5)))"
              constraints)
             #f)))
          (check-true (not (equal? (member "(|| (bveq XORSIMD (bv 26 5)) (bveq XORSIMD (bv 14 5)))"
                                           constraints)
                                   #f)))
          (check-true
           (not
            (equal?
             (member
              "(|| (bveq SEL_PATTERN (bv 9 5)) (bveq SEL_PATTERN (bv 17 5)) (bveq SEL_PATTERN (bv 22 5)) (bveq SEL_PATTERN (bv 23 5)))"
              constraints)
             #f)))
          #t]
         [else #f]))))

  (test-case "Parse Lattice ECP5 YAML"
    (begin
      (check-true
       (match (lattice-ecp5-architecture-description)
         [(architecture-description
           (list
            (interface-implementation
             (interface-identifier "LUT" (hash-table ("num_inputs" 4)))
             (list (module-instance "LUT4"
                                    (list (module-instance-port "A" "I0" 'input 1)
                                          (module-instance-port "B" "I1" 'input 1)
                                          (module-instance-port "C" "I2" 'input 1)
                                          (module-instance-port "D" "I3" 'input 1)
                                          (module-instance-port "Z" "O" 'output 1))
                                    (list (module-instance-parameter "init" "init"))
                                    "../f4pga-arch-defs/ecp5/primitives/slice/LUT4.v"
                                    "../modules_for_importing/lattice_ecp5/LUT4.v"
                                    #f))
             (hash-table ("init" 16))
             (hash-table ("O" "Z"))
             (list))
            ;;; (interface-implementation
            ;;;  (interface-identifier "MUX" (hash "num_inputs" 2))
            ;;;  (module-instance "L6MUX21"
            ;;;                   (list (module-instance-port "D0" "I0" 'input 1)
            ;;;                         (module-instance-port "D1" "I1" 'input 1)
            ;;;                         (module-instance-port "SD" "S" 'input 1)
            ;;;                         (module-instance-port "Z" "O" 'output 1))
            ;;;                   (list)
            ;;;                   "../f4pga-arch-defs/ecp5/primitives/slice/L6MUX21.v"
            ;;;                   "../f4pga-arch-defs/ecp5/primitives/slice/L6MUX21.v"
            ;;;                   #f)
            ;;;  (hash)
            ;;;  (hash "O" "Z"))
            (interface-implementation
             (interface-identifier "carry" (hash-table ("width" 2)))
             (list (module-instance "CCU2C"
                                    (list (module-instance-port "CIN" "CI" 'input 1)
                                          (module-instance-port "A0" "(bit 0 DI)" 'input 1)
                                          (module-instance-port "A1" "(bit 1 DI)" 'input 1)
                                          (module-instance-port "B0" "(bit 0 S)" 'input 1)
                                          (module-instance-port "B1" "(bit 1 S)" 'input 1)
                                          (module-instance-port "C0" "(bv 1 1)" 'input 1)
                                          (module-instance-port "C1" "(bv 1 1)" 'input 1)
                                          (module-instance-port "D0" "(bv 1 1)" 'input 1)
                                          (module-instance-port "D1" "(bv 1 1)" 'input 1)
                                          (module-instance-port "S0" "unused" 'output 1)
                                          (module-instance-port "S1" "unused" 'output 1)
                                          (module-instance-port "COUT" "unused" 'output 1))
                                    (list (module-instance-parameter "INIT0" "INIT0")
                                          (module-instance-parameter "INIT1" "INIT1")
                                          (module-instance-parameter "INJECT1_0" "(bv 0 1)")
                                          (module-instance-parameter "INJECT1_1" "(bv 0 1)"))
                                    "../f4pga-arch-defs/ecp5/primitives/slice/CCU2C.v"
                                    "../modules_for_importing/lattice_ecp5/CCU2C.v"
                                    #f))
             (hash-table ("INIT0" 16) ("INIT1" 16))
             (hash-table ("CO" "COUT") ("O" "(concat S1 S0)"))
             (list))
            (interface-implementation
             (interface-identifier
              "DSP"
              (hash-table ("out-width" 36) ("a-width" 18) ("b-width" 18) ("c-width" 18)))
             (list (module-instance "MULT18X18D" ports params path path #f)
                   (module-instance "ALU54B" '() '() alu-path alu-path #f))
             internal-data
             (hash-table
              ("O"
               "(concat P35 P34 P33 P32 P31 P30 P29 P28 P27 P26 P25 P24 P23 P22 P21 P20 P19 P18 P17 P16 P15 P14 P13 P12 P11 P10 P9 P8 P7 P6 P5 P4 P3 P2 P1 P0)"))
             constraints)))
          #t]
         [else #f]))))

  (test-not-exn "Parse SOFA YAML" (λ () (sofa-architecture-description))))

(module+ test
  (test-begin
    "Construct a LUT2 on Lattice from a LUT4."
    (match-let* ([(list expr internal-data)
                  (construct-interface (lattice-ecp5-architecture-description)
                                       (interface-identifier "LUT" (hash "num_inputs" 2))
                                       (list (cons "I0" (lr:bv (bv->signal (bv 0 1))))
                                             (cons "I1" (lr:bv (bv->signal (bv 0 1))))))])
      (check-true (match internal-data
                    [(list (cons "init" (lr:bv v)))
                     (check-true ((bitvector 16) (signal-value v)))
                     #t]
                    [else #f]))
      (check-true
       (match expr
         [(lr:make-immutable-hash
           (lr:list (list (lr:cons (lr:symbol 'O)
                                   (lr:hash-ref (lr:hw-module-instance
                                                 "LUT4"
                                                 (list (module-instance-port "A" (lr:bv v0) 'input 1)
                                                       (module-instance-port "B" (lr:bv v0) 'input 1)
                                                       (module-instance-port "C" (lr:bv v1) 'input 1)
                                                       (module-instance-port "D" (lr:bv v1) 'input 1)
                                                       (module-instance-port "Z" "O" 'output 1))
                                                 (list (module-instance-parameter "init" (lr:bv s0)))
                                                 filepath-unchecked)
                                                'Z)))))
          (check-equal? (signal-value v0) (bv 0 1))
          (check-equal? (signal-value v1) (bv 1 1))
          #t]
         [else #f])))))

(struct lr:make-immutable-hash (list-expr) #:transparent)
(struct lr:cons (v0-expr v1-expr) #:transparent)

(module+ test
  (test-begin
    "Construct a CCU2C on Lattice."
    (match-define (list expr internal-data)
      (construct-interface (lattice-ecp5-architecture-description)
                           (interface-identifier "carry" (hash "width" 2))
                           (list (cons "CI" (lr:bv (bv->signal (bv 0 1))))
                                 (cons "DI" (lr:bv (bv->signal (bv 0 2))))
                                 (cons "S" (lr:bv (bv->signal (bv 0 2)))))))
    (check-true (match internal-data
                  [(list (cons "INIT0" (lr:bv (signal (? (bitvector 16) _) _)))
                         (cons "INIT1" (lr:bv (signal (? (bitvector 16) _) _))))
                   #t]
                  [else #f]))
    (match-define (lr:make-immutable-hash
                   (lr:list (list (lr:cons (lr:symbol 'O)
                                           (lr:concat (lr:list (list (lr:hash-ref mod-expr 'S1)
                                                                     (lr:hash-ref mod-expr 'S0)))))
                                  (lr:cons (lr:symbol 'CO) (lr:hash-ref mod-expr 'COUT)))))
      expr)
    (check-true
     (match mod-expr
       [(lr:hw-module-instance
         "CCU2C"
         (list
          (module-instance-port "CIN" (lr:bv v1) 'input 1)
          (module-instance-port "A0" (lr:extract (lr:integer 0) (lr:integer 0) (lr:bv v0)) 'input 1)
          (module-instance-port "A1" (lr:extract (lr:integer 1) (lr:integer 1) (lr:bv v0)) 'input 1)
          (module-instance-port "B0" (lr:extract (lr:integer 0) (lr:integer 0) (lr:bv v0)) 'input 1)
          (module-instance-port "B1" (lr:extract (lr:integer 1) (lr:integer 1) (lr:bv v0)) 'input 1)
          (module-instance-port "C0" (lr:bv (signal (? bv? _) _)) 'input 1)
          (module-instance-port "C1" (lr:bv (signal (? bv? _) _)) 'input 1)
          (module-instance-port "D0" (lr:bv (signal (? bv? _) _)) 'input 1)
          (module-instance-port "D1" (lr:bv (signal (? bv? _) _)) 'input 1)
          (module-instance-port "S0" "unused" 'output 1)
          (module-instance-port "S1" "unused" 'output 1)
          (module-instance-port "COUT" "unused" 'output 1))
         list
         filepath-unchecked)
        (check-equal? (signal-value v0) (bv 0 2))
        (check-equal? (signal-value v1) (bv 0 1))
        #t]

       [else #f])))

  (test-begin
    "Construct a frac_lut4 on sofa"
    (match-define (list expr internal-data)
      (construct-interface (sofa-architecture-description)
                           (interface-identifier "LUT" (hash "num_inputs" 4))
                           (list (cons "I0" (lr:bv (bv->signal (bv 0 1))))
                                 (cons "I1" (lr:bv (bv->signal (bv 0 1))))
                                 (cons "I2" (lr:bv (bv->signal (bv 0 1))))
                                 (cons "I3" (lr:bv (bv->signal (bv 0 1)))))))
    (check-true (match internal-data
                  [(list (cons "sram" (lr:bv (signal (? (bitvector 16) _) _)))) #t]
                  [else #f]))
    (match-define (lr:make-immutable-hash
                   (lr:list (list (lr:cons (lr:symbol 'O) (lr:hash-ref mod-expr 'lut4_out)))))
      expr)
    (check-true
     (match mod-expr
       [(lr:hw-module-instance
         "frac_lut4"
         ;;; (list
         ;;;  (module-instance-port "CIN" (lr:bv v1) 'input 1)
         ;;;  (module-instance-port "A0" (lr:extract (lr:integer 0) (lr:integer 0) (lr:bv v0)) 'input 1)
         ;;;  (module-instance-port "A1" (lr:extract (lr:integer 1) (lr:integer 1) (lr:bv v0)) 'input 1)
         ;;;  (module-instance-port "B0" (lr:extract (lr:integer 0) (lr:integer 0) (lr:bv v0)) 'input 1)
         ;;;  (module-instance-port "B1" (lr:extract (lr:integer 1) (lr:integer 1) (lr:bv v0)) 'input 1)
         ;;;  (module-instance-port "C0" (lr:bv (? bv? _)) 'input 1)
         ;;;  (module-instance-port "C1" (lr:bv (? bv? _)) 'input 1)
         ;;;  (module-instance-port "D0" (lr:bv (? bv? _)) 'input 1)
         ;;;  (module-instance-port "D1" (lr:bv (? bv? _)) 'input 1)
         ;;;  (module-instance-port "S0" "unused" 'output 1)
         ;;;  (module-instance-port "S1" "unused" 'output 1)
         ;;;  (module-instance-port "COUT" "unused" 'output 1))
         list0
         list
         filepath-unchecked)
        #t]

       [else #f]))))
