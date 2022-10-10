;;; Architecture description utilities.
;;;
;;; This file contains all necessary tools for handling architecture descriptions, including:
;;; - Definitions of all necessary structs.
;;; - Definitions of Lakeroad's supported interfaces.
;;; - Functions for parsing architecture descriptions from files.
;;; - Functions for instantiating instances of interfaces, given an architecture description.
#lang errortrace racket/base

(provide construct-interface
         (struct-out interface-identifier)
         xilinx-ultrascale-plus-architecture-description
         lattice-ecp5-architecture-description
         (struct-out lr:hw-module-instance)
         (struct-out module-instance-port)
         (struct-out module-instance-parameter)
         (struct-out lr:get-hw-module-instance-output))

(require rosette
         yaml
         "utils.rkt"
         (prefix-in lr: "language.rkt"))

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
  ;;; LUT4 definition.
  (list (interface-definition (interface-identifier "LUT" (hash "num_inputs" 4))
                              (list (interface-port "I0" 'input 1)
                                    (interface-port "I1" 'input 1)
                                    (interface-port "I2" 'input 1)
                                    (interface-port "I3" 'input 1)
                                    (interface-port "O" 'output 1)))
        ;;; MUX2 definition.
        (interface-definition (interface-identifier "MUX" (hash "num_inputs" 2))
                              (list (interface-port "I0" 'input 1)
                                    (interface-port "I1" 'input 1)
                                    (interface-port "S" 'input 1)
                                    (interface-port "O" 'output 1)))))

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
;;;
;;; TODO(@gussmith23): module-instance is a bad name for this. Too similar to lr:hw-module-instance,
;;; which is completely different.
(struct module-instance (module-name ports params filepath racket-import-filepath) #:transparent)

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
                                     (list (interface-port "I0" 'input 1)
                                           (interface-port "I1" 'input 1)
                                           (interface-port "I2" 'input 1)
                                           (interface-port "I3" 'input 1)
                                           (interface-port "O" 'output 1))))

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
         [ports (map (lambda (p)
                       (module-instance-port (module-instance-port-name p)
                                             (cdr (assoc (module-instance-port-value p) port-map))
                                             (module-instance-port-direction p)
                                             (module-instance-port-bitwidth p)))
                     ;;; Filter down the list of ports to just the inputs.
                     (filter (lambda (p) (equal? (module-instance-port-direction p) 'input))
                             (module-instance-ports module-instance)))]

         ;;; Construct the list of parameters, by mapping in the values provided in the internal state.
         ;;; - param-pair: pair of actual param name (string) to name given in internal state definition
         ;;;   (string).
         [parameters (map (lambda (parameter)
                            (module-instance-parameter
                             (module-instance-parameter-name parameter)
                             (cdr (assoc (module-instance-parameter-value parameter) internal-data))))
                          (module-instance-params module-instance))]
         [filepath (module-instance-filepath module-instance)])
    (list (lr:hw-module-instance name ports parameters filepath) internal-data)))

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
                   [(list (cons "INIT" v))
                    (check-true ((bitvector 16) v))
                    #t]
                   [else #f]))
     (check-true (match expr
                   [(lr:hw-module-instance "LUT4"
                                           (list (module-instance-port "A" v 'input 1)
                                                 (module-instance-port "B" v 'input 1)
                                                 (module-instance-port "C" v 'input 1)
                                                 (module-instance-port "D" v 'input 1))
                                           (list (module-instance-parameter "INIT" s))
                                           filepath-unchecked)
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
       (list mux-expr (list lut-0-internal-data lut-1-internal-data mux-internal-data)))]

    ;;; Case: They're asking for a smaller LUT, and we have a bigger LUT implemented.
    ;;;
    ;;; Research note: Even just the ordering of this cond clause with the above cond clause is a
    ;;; value judgement. We will first attempt to construct a LUT out of smaller LUTs, and then we
    ;;; will look for a bigger LUT. That's not always going to be the right thing to do.
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
                                  (cons (format "I~a" i) (bv 1 1))))]
          [(list out-lut-expr internal-data)
           (construct-interface-internal architecture-description
                                         larger-lut-interface-identifier
                                         new-port-map
                                         #:internal-data internal-data)])

       (list out-lut-expr internal-data))]

    [else
     (error
      "Interface not implemented, and no way to implement it with the interfaces already implemented: "
      interface-id)]))

(module+ test
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
                   [(list (list (cons "INIT" v0)) (list (cons "INIT" v1)) (list))
                    (check-true ((bitvector 16) v0))
                    (check-true ((bitvector 16) v1))
                    #t]
                   [else #f]))
     (check-true
      (match expr
        [(lr:hw-module-instance
          "L6MUX21"
          (list
           (module-instance-port "D0"
                                 (lr:hw-module-instance "LUT4"
                                                        (list (module-instance-port "A" v 'input 1)
                                                              (module-instance-port "B" v 'input 1)
                                                              (module-instance-port "C" v 'input 1)
                                                              (module-instance-port "D" v 'input 1))
                                                        (list (module-instance-parameter "INIT" s0))
                                                        lut4-filepath)
                                 'input
                                 1)
           (module-instance-port "D1"
                                 (lr:hw-module-instance "LUT4"
                                                        (list (module-instance-port "A" v 'input 1)
                                                              (module-instance-port "B" v 'input 1)
                                                              (module-instance-port "C" v 'input 1)
                                                              (module-instance-port "D" v 'input 1))
                                                        (list (module-instance-parameter "INIT" s1))
                                                        lut4-filepath)
                                 'input
                                 1)
           (module-instance-port "SD" selector-expr 'input 1))
          (list)
          mux-filepath)
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
    (module-instance module-name ports parameters filepath racket-import-filepath))

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

;;; Get architecture description of Xilinx UltraScale+.
(define (xilinx-ultrascale-plus-architecture-description)
  (parse-architecture-description-file
   (build-path (get-lakeroad-directory) "architecture_descriptions" "xilinx_ultrascale_plus.yml")))

;;; Get architecture description of Lattice ECP5.
(define (lattice-ecp5-architecture-description)
  (parse-architecture-description-file
   (build-path (get-lakeroad-directory) "architecture_descriptions" "lattice_ecp5.yml")))

(module+ test
  (test-equal? "Parse Xilinx UltraScale+ YAML"
               (xilinx-ultrascale-plus-architecture-description)
               (architecture-description
                (list (interface-implementation
                       (interface-identifier "LUT" (hash "num_inputs" 4))
                       (module-instance "LUT4"
                                        (list (module-instance-port "I0" "I0" 'input 1)
                                              (module-instance-port "I1" "I1" 'input 1)
                                              (module-instance-port "I2" "I2" 'input 1)
                                              (module-instance-port "I3" "I3" 'input 1)
                                              (module-instance-port "O" "O" 'output 1))
                                        (list (module-instance-parameter "INIT" "INIT"))
                                        "../verilator_xilinx/LUT4.v"
                                        "../modules_for_importing/xilinx_ultrascale_plus/LUT4.v")
                       (hash "INIT" 16)))))

  (test-equal?
   "Parse Lattice ECP5 YAML"
   (lattice-ecp5-architecture-description)
   (architecture-description
    (list (interface-implementation (interface-identifier "LUT" (hash "num_inputs" 4))
                                    (module-instance "LUT4"
                                                     (list (module-instance-port "A" "I0" 'input 1)
                                                           (module-instance-port "B" "I1" 'input 1)
                                                           (module-instance-port "C" "I2" 'input 1)
                                                           (module-instance-port "D" "I3" 'input 1)
                                                           (module-instance-port "Z" "O" 'output 1))
                                                     (list (module-instance-parameter "INIT" "INIT"))
                                                     "../f4pga-arch-defs/ecp5/primitives/slice/LUT4.v"
                                                     "../modules_for_importing/lattice_ecp5/LUT4.v")
                                    (hash "INIT" 16))
          (interface-implementation
           (interface-identifier "MUX" (hash "num_inputs" 2))
           (module-instance "L6MUX21"
                            (list (module-instance-port "D0" "I0" 'input 1)
                                  (module-instance-port "D1" "I1" 'input 1)
                                  (module-instance-port "SD" "S" 'input 1)
                                  (module-instance-port "Z" "O" 'output 1))
                            (list)
                            "../f4pga-arch-defs/ecp5/primitives/slice/L6MUX21.v"
                            "../f4pga-arch-defs/ecp5/primitives/slice/L6MUX21.v")
           (hash))))))

(module+ test
  (test-begin "Construct a LUT2 on Lattice from a LUT4."
              (match-let* ([(list expr internal-data)
                            (construct-interface (lattice-ecp5-architecture-description)
                                                 (interface-identifier "LUT" (hash "num_inputs" 2))
                                                 (list (cons "I0" (bv 0 1)) (cons "I1" (bv 0 1))))])
                (check-true (match internal-data
                              [(list (cons "INIT" v))
                               (check-true ((bitvector 16) v))
                               #t]
                              [else #f]))
                (check-true (match expr
                              [(lr:hw-module-instance "LUT4"
                                                      (list (module-instance-port "A" v0 'input 1)
                                                            (module-instance-port "B" v0 'input 1)
                                                            (module-instance-port "C" v1 'input 1)
                                                            (module-instance-port "D" v1 'input 1))
                                                      (list (module-instance-parameter "INIT" s0))
                                                      filepath-unchecked)
                               (check-equal? v0 (bv 0 1))
                               (check-equal? v1 (bv 1 1))
                               #t]
                              [else #f])))))
