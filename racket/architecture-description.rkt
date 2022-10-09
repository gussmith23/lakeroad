;;; Architecture description utilities.
;;;
;;; This file contains all necessary tools for handling architecture descriptions, including:
;;; - Definitions of all necessary structs.
;;; - Definitions of Lakeroad's supported interfaces.
;;; - Functions for parsing architecture descriptions from files.
;;; - Functions for instantiating instances of interfaces, given an architecture description.
#lang errortrace racket/base

(provide construct-interface)

(require rosette
         yaml
         "utils.rkt")

;;; Part 1: defining an interface.

;;; Interface identifier.
;;;
;;; Uniquely identifies a parameterized interface, using a name (e.g. "LUT")
;;; and parameters (e.g. (hash "num_inputs" 4)).
(struct interface-identifier (name parameters) #:transparent)

;;; Interface definition.
;;; Represents a valid Lakeroad interface.
;;;
;;; - ports: List of port definitions.
(struct interface-definition (identifier ports) #:transparent)

;;; - name: String name of the port.
;;; - direction: 'input or 'output.
;;; - bitwidth: integer bitwidth of the port.
(struct port-definition (name direction bitwidth) #:transparent)

(define interfaces
  ;;; LUT4 definition.
  (list (interface-definition (interface-identifier "LUT" (hash "num_inputs" 4))
                              (list (port-definition "I0" 'input 1)
                                    (port-definition "I1" 'input 1)
                                    (port-definition "I2" 'input 1)
                                    (port-definition "I3" 'input 1)
                                    (port-definition "O" 'output 1)))
        ;;; MUX2 definition.
        (interface-definition (interface-identifier "MUX" (hash "num_inputs" 2))
                              (list (port-definition "I0" 'input 1)
                                    (port-definition "I1" 'input 1)
                                    (port-definition "S" 'input 1)
                                    (port-definition "O" 'output 1)))))

;;; Part 2: implementing an interface on a specific architecture.

;;; - module-name: String name of the Verilog module.
;;; - ports: List of port definitions, where each port definition is a list of (string port identifier,
;;;   string port value, direction ('input or 'output)). The port value can either be the name of an
;;;   interface port or the name of a piece of internal state.
;;; - params: List of parameter defintions, where each parameter definition is a pair, mapping a
;;;   string parameter identifier to a string parameter value. The parameter value must be the name of
;;;   a piece of internal state.
;;;
;;; TODO(@gussmith23): module-instance is a bad name for this. Too similar to lr:hw-module-instance,
;;; which is completely different.
(struct module-instance (module-name ports params) #:transparent)

;;; - module-instance: Module, representing how this interface is implemented. For now, we only
;;;   support a single module, but we should figure out how to support multiple. We can likely just
;;;   make this an association list of string module names to module instances.
;;; - internal-data: List of internal state variable defintions. Each internal state variable
;;;   definition is a immutable hash, mapping a string variable name to an integer representing the
;;;   bitwidth of that variable.
(struct interface-implementation (identifier module-instance internal-data) #:transparent)

;;; Architecture description.
;;;
;;; - interface-implementations: association list mapping string interface names to interface
;;;   implementations.
(struct architecture-description (interface-implementations) #:transparent)

(define lattice-ecp5-architecture-description
  (architecture-description
   (list (interface-implementation (interface-identifier "LUT" (hash "num_inputs" 4))
                                   (module-instance "LUT4"
                                                    (list (list "A" "I0" 'input)
                                                          (list "B" "I1" 'input)
                                                          (list "C" "I2" 'input)
                                                          (list "D" "I3" 'input)
                                                          (list "Z" "O" 'output))
                                                    (list (cons "INIT" "lutmem")))
                                   (hash "lutmem" 16))
         ;;; I'm not sure if this module actually exists in Lattice, but assume it does.
         (interface-implementation (interface-identifier "MUX" (hash "num_inputs" 2))
                                   (module-instance "MUX2"
                                                    (list (list "I0" "I0" 'input)
                                                          (list "I1" "I1" 'input)
                                                          (list "S" "S" 'input)
                                                          (list "O" "O" 'output))
                                                    (list))
                                   (hash)))))

;;; Part 3: constructing things using the architecture description.

;;; Lakeroad construct for a hardware module instance.
(struct lr:hw-module-instance (name ports params) #:transparent)

(define (find-interface-implementation architecture-description id)
  (findf (lambda (impl) (equal? (interface-implementation-identifier impl) id))
         (architecture-description-interface-implementations architecture-description)))

;;; Construct a fresh instance of the internal state for a given interface on a given architecture.
(define (construct-internal-data architecture-description interface-name)
  (define interface-implementation
    (or (find-interface-implementation architecture-description interface-name)
        (error "No implementation for interface "
               interface-name
               " on architecture "
               architecture-description)))
  (define internal-data-definition (interface-implementation-internal-data interface-implementation))

  ;;; We loop over each pair and construct a fresh variable for it.
  ;;; - internal-data-definition-pair: pair of internal state variable name (string) and bitwidth
  ;;;   (integer).
  (map (lambda (internal-data-definition-pair)
         (define-symbolic* v (bitvector (cdr internal-data-definition-pair)))
         (cons (car internal-data-definition-pair) v))
       (hash->list internal-data-definition)))

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
                                     (list (port-definition "I0" 'input 1)
                                           (port-definition "I1" 'input 1)
                                           (port-definition "I2" 'input 1)
                                           (port-definition "I3" 'input 1)
                                           (port-definition "O" 'output 1))))

  (test-false "find-interface-definition returns #f"
              (find-interface-definition
               (interface-identifier "NotARealInterface" (hash "num_inputs" 4)))))

;;; Internal implementation of construct-interface, which fails if the interface is not found.
;;; External users should use construct-interface.
;;;
;;; - port-map: Maps string port identifiers to expressions.
;;; - internal-data: Internal state constructed using construct-internal-data.
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
         [module-instance (interface-implementation-module-instance interface-implementation)]
         [name (module-instance-module-name module-instance)]
         [interface-definition (or (find-interface-definition interface-id)
                                   (error "Interface definition not found"))]
         ;;; Construct the list of ports, by mapping in the values provided in the port-map.
         ;;; - port-pair: pair of actual port name (string) to interface port name (string).
         [ports (map (lambda (port)
                       (list (first port) (cdr (assoc (second port) port-map)) (third port)))
                     ;;; Filter down the list of ports to just the inputs.
                     (filter (lambda (port) (equal? (third port) 'input))
                             (module-instance-ports module-instance)))]
         ;;; Construct the list of parameters, by mapping in the values provided in the internal state.
         ;;; - param-pair: pair of actual param name (string) to name given in internal state definition
         ;;;   (string).
         [parameters
          (map (lambda (param-pair) (cons (car param-pair) (assoc (cdr param-pair) internal-data)))
               (module-instance-params module-instance))])
    (list (lr:hw-module-instance name ports parameters) internal-data)))

(module+ test
  (require rackunit)
  (test-begin
   "Construct Lattice LUT4"
   (let* ([out (construct-interface-internal lattice-ecp5-architecture-description
                                             (interface-identifier "LUT" (hash "num_inputs" 4))
                                             (list (cons "I0" (bv 0 1))
                                                   (cons "I1" (bv 0 1))
                                                   (cons "I2" (bv 0 1))
                                                   (cons "I3" (bv 0 1))))]
          [expr (first out)]
          [internal-data (second out)])
     (check-true (match internal-data
                   [(list (cons "lutmem" v))
                    (check-true ((bitvector 16) v))
                    #t]
                   [else #f]))
     (check-true
      (match expr
        [(lr:hw-module-instance
          "LUT4"
          (list (list "A" v 'input) (list "B" v 'input) (list "C" v 'input) (list "D" v 'input))
          (list (cons "INIT" s)))
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
         (;;; First, destruct the internal state. We know exactly what the internal state should look
          ;;; like at this point.
          [lut-0-internal-data (if internal-data (first internal-data) #f)]
          [lut-1-internal-data (if internal-data (second internal-data) #f)]
          [mux-internal-data (if internal-data (third internal-data) #f)]

          ;;; The name of the LUT which is 1 smaller than the one we're trying to construct.
          [smaller-lut-interface-identifier
           (interface-identifier
            "LUT"
            (hash "num_inputs"
                  (sub1 (hash-ref (interface-identifier-parameters interface-id) "num_inputs"))))]

          ;;; The ports that should be passed to the smaller LUTs. This is easy to figure out: we just
          ;;; drop one of the inputs to the larger LUT! Then, we'll use that dropped input as the
          ;;; selector of the MUX2.
          [smaller-lut-ports (take port-map (sub1 (length port-map)))]
          [mux-selector (list-ref port-map (sub1 (length port-map)))]

          [(list lut-expr0 lut-0-internal-data)
           (construct-interface architecture-description
                                smaller-lut-interface-identifier
                                smaller-lut-ports
                                #:internal-data lut-0-internal-data)]
          [(list lut-expr1 lut-1-internal-data)
           (construct-interface architecture-description
                                smaller-lut-interface-identifier
                                smaller-lut-ports
                                #:internal-data lut-1-internal-data)]
          [(list mux-expr mux-internal-data)
           (construct-interface
            architecture-description
            (interface-identifier "MUX" (hash "num_inputs" 2))
            (list (cons "I0" lut-expr0) (cons "I1" lut-expr1) (cons "S" mux-selector))
            #:internal-data mux-internal-data)])
       (list mux-expr (list lut-0-internal-data lut-1-internal-data mux-internal-data)))]))

(module+ test
  (test-begin "Construct a LUT5 on Lattice from LUT4s and a MUX2."
              (match-let* ([(list expr internal-data)
                            (construct-interface lattice-ecp5-architecture-description
                                                 (interface-identifier "LUT" (hash "num_inputs" 5))
                                                 (list (cons "I0" (bv 0 1))
                                                       (cons "I1" (bv 0 1))
                                                       (cons "I2" (bv 0 1))
                                                       (cons "I3" (bv 0 1))
                                                       (cons "I4" (bv 0 1))))])
                (check-true (match internal-data
                              [(list (list (cons "lutmem" v0)) (list (cons "lutmem" v1)) (list))
                               (check-true ((bitvector 16) v0))
                               (check-true ((bitvector 16) v1))
                               #t]
                              [else #f]))
                (check-true (match expr
                              [(lr:hw-module-instance
                                "MUX2"
                                (list (list "I0"
                                            (lr:hw-module-instance "LUT4"
                                                                   (list (list "A" v 'input)
                                                                         (list "B" v 'input)
                                                                         (list "C" v 'input)
                                                                         (list "D" v 'input))
                                                                   (list (cons "INIT" s0)))
                                            'input)
                                      (list "I1"
                                            (lr:hw-module-instance "LUT4"
                                                                   (list (list "A" v 'input)
                                                                         (list "B" v 'input)
                                                                         (list "C" v 'input)
                                                                         (list "D" v 'input))
                                                                   (list (cons "INIT" s1)))
                                            'input)
                                      (list "S" selector-expr 'input))
                                (list))
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

  ;;; Parse a module instance, which has three fields:
  ;;;
  ;;; - module_name: name of the Verilog module.
  ;;; - ports: port map, mapping actual port names to interface port names. Optional; if not
  ;;;     specified, then the port names are assumed to be the same as the interface port names.
  ;;; - parameters: parameter map, mapping any module parameter names to internal data names.
  ;;;     Optional.
  (define (parse-module-instance module-instance-yaml interface-definition)
    (define module-name (hash-ref module-instance-yaml "module_name"))
    (define port-map
      (convert-to-immutable
       (or
        (hash-ref module-instance-yaml "ports" #f)
        ;;; If it's not there, we assume that the port names are the same as the interface port names.
        (make-immutable-hash (for/list ([port (interface-definition-ports interface-definition)])
                               (cons (port-definition-name port) (port-definition-name port)))))))
    (define parameter-map
      (convert-to-immutable (or (hash-ref module-instance-yaml "parameters" #f) (hash))))

    (module-instance module-name port-map parameter-map))

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

    (when (not (equal? (length modules) 1))
      (error "Only one implementing module is currently supported."))

    (interface-implementation
     interface-identifier
     (first modules)
     (convert-to-immutable (or (hash-ref impl-yaml "internal_data" #f) (hash)))))

  (define implementations
    (for/list ([impl-yaml impls-yaml])
      (parse-impl impl-yaml)))

  (architecture-description implementations))

(module+ test
  (test-equal?
   "Parse Xilinx UltraScale+ YAML"
   (parse-architecture-description-file
    (build-path (get-lakeroad-directory) "architecture_descriptions" "xilinx_ultrascale_plus.yml"))
   (architecture-description
    (list
     (interface-implementation
      (interface-identifier "LUT" (hash "num_inputs" 4))
      (module-instance
       "LUT4"
       (make-immutable-hash
        (list (cons "I0" "I0") (cons "I1" "I1") (cons "I2" "I2") (cons "I3" "I3") (cons "O" "O")))
       (make-immutable-hash (list (cons "INIT" "INIT"))))
      (hash "INIT" 16)))))

  (test-equal?
   "Parse Lattice ECP5 YAML"
   (parse-architecture-description-file
    (build-path (get-lakeroad-directory) "architecture_descriptions" "lattice_ecp5.yml"))
   (architecture-description
    (list (interface-implementation
           (interface-identifier "LUT" (hash "num_inputs" 4))
           (module-instance
            "LUT4"
            (make-immutable-hash
             (list (cons "A" "I0") (cons "B" "I1") (cons "C" "I2") (cons "D" "I3") (cons "Z" "O")))
            (make-immutable-hash (list (cons "INIT" "INIT"))))
           (hash "INIT" 16))
          (interface-implementation
           (interface-identifier "MUX" (hash "num_inputs" 2))
           (module-instance "L6MUX21"
                            (make-immutable-hash
                             (list (cons "D0" "I0") (cons "D1" "I1") (cons "SD" "S") (cons "Z" "O")))
                            (hash))
           (hash))))))
