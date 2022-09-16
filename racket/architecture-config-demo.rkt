#lang errortrace racket/base

(require rosette)

;;; Part 1: defining an interface.

;;; - ports: List of port definitions.
(struct interface-definition (ports))

;;; - name: String name of the port.
;;; - direction: 'input or 'output.
;;; - bitwidth: integer bitwidth of the port.
(struct port-definition (name direction bitwidth))

(define interfaces
  (list (cons "LUT4"
              (interface-definition (list (port-definition "I0" 'input 1)
                                          (port-definition "I1" 'input 1)
                                          (port-definition "I2" 'input 1)
                                          (port-definition "I3" 'input 1)
                                          (port-definition "O" 'output 1))))
        (cons "MUX2"
              (interface-definition (list (port-definition "I0" 'input 1)
                                          (port-definition "I1" 'input 1)
                                          (port-definition "S" 'input 1)
                                          (port-definition "O" 'output 1))))))

;;; Part 2: implementing an interface on a specific architecture.

;;; - module-name: String name of the Verilog module.
;;; - ports: List of port definitions, where each port definition is a list of (string port identifer,
;;;   string port value, direction ('input or 'output)). The port value can either be the name of an
;;;   interface port or the name of a piece of internal state.
;;; - params: List of parameter defintions, where each parameter definition is a pair, mapping a
;;;   string parameter identifier to a string parameter value. The parameter value must be the name of
;;;   a piece of internal state.
;;;
;;; TODO(@gussmith23): module-instance is a bad name for this. Too similar to lr:hw-module-instance,
;;; which is completely different.
(struct module-instance (module-name ports params))

;;; - module-instance: Module, representing how this interface is implemented. For now, we only
;;;   support a single module, but we should figure out how to support multiple. We can likely just
;;;   make this an association list of string module names to module instances.
;;; - internal-state: List of internal state variable defintions. Each internal state variable
;;;   definition is a pair, mapping a string variable name to an integer representing the bitwidth of
;;;   that variable.
(struct interface-implementation (module-instance internal-state))

;;; - interface-implementations: association list mapping string interface names to interface
;;;   implementations.
(struct architecture-configuration (interface-implementations))

(define lattice-ecp5-architecture-config
  (architecture-configuration
   (list (cons "LUT4"
               (interface-implementation (module-instance "LUT4"
                                                          (list (list "A" "I0" 'input)
                                                                (list "B" "I1" 'input)
                                                                (list "C" "I2" 'input)
                                                                (list "D" "I3" 'input)
                                                                (list "Z" "O" 'output))
                                                          (list (cons "INIT" "lutmem")))
                                         (list (cons "lutmem" 16))))
         (cons "MUX2"
               ;;; I'm not sure if this module actually exists in Lattice, but assume it does.
               (interface-implementation (module-instance "MUX2"
                                                          (list (list "I0" "I0" 'input)
                                                                (list "I1" "I1" 'input)
                                                                (list "S" "S" 'input)
                                                                (list "O" "O" 'output))
                                                          (list))
                                         (list))))))

;;; Part 3: constructing things using the architecture configuration.

;;; Lakeroad construct for a hardware module instance.
(struct lr:hw-module-instance (name ports params))

(define (find-interface-implementation architecture-configuration interface-name)
  (assoc interface-name
         (architecture-configuration-interface-implementations architecture-configuration)))

;;; Construct a fresh instance of the internal state for a given interface on a given architecture.
(define (construct-internal-state architecture-configuration interface-name)
  (define interface-implementation
    (cdr (find-interface-implementation architecture-configuration interface-name)))
  (define internal-state-definition
    (interface-implementation-internal-state interface-implementation))

  ;;; We loop over each pair and construct a fresh variable for it.
  ;;; - internal-state-definition-pair: pair of internal state variable name (string) and bitwidth
  ;;;   (integer).
  (map (lambda (internal-state-definition-pair)
         (define-symbolic* v (bitvector (cdr internal-state-definition-pair)))
         (cons (car internal-state-definition-pair) v))
       internal-state-definition))

;;; - port-map: Maps string port identifiers to expressions.
;;; - internal-state: Internal state constructed using construct-internal-state.
(define (construct-interface architecture-configuration
                             interface-name
                             port-map
                             #:internal-state [internal-state #f])
  (let* ([internal-state (if (not internal-state)
                             (construct-internal-state architecture-configuration interface-name)
                             internal-state)]
         [interface-implementation
          (cdr (find-interface-implementation architecture-configuration interface-name))]
         [module-instance (interface-implementation-module-instance interface-implementation)]
         [name (module-instance-module-name module-instance)]
         [interface-definition (cdr (assoc interface-name interfaces))]
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
          (map (lambda (param-pair) (cons (car param-pair) (assoc (cdr param-pair) internal-state)))
               (module-instance-params module-instance))])
    (list (lr:hw-module-instance name ports parameters) internal-state)))

(module+ test
  (require rackunit)
  (test-begin
   "Construct Lattice LUT4"
   (let* ([out (construct-interface lattice-ecp5-architecture-config
                                    "LUT4"
                                    (list (cons "I0" (bv 0 1))
                                          (cons "I1" (bv 0 1))
                                          (cons "I2" (bv 0 1))
                                          (cons "I3" (bv 0 1))))]
          [expr (first out)]
          [internal-state (second out)])
     (check-true (match internal-state
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

;;; Part 4: A smarter implementation of construct-interface, which handles some cases where some
;;; interfaces are not implemented.

;(construct-lut5-from-lut4 architecture-configuration ports)

;;; This is a more user-friendly wrapper over construct-interface, which is smart enough to handle
;;; cases where certain interfaces aren't implemented.
(define (construct-interface-smarter architecture-configuration
                                     interface-name
                                     port-map
                                     #:internal-state [internal-state #f])
  (cond
    ;;; If the interface is implemented, then we just construct it.
    [(find-interface-implementation architecture-configuration interface-name)
     (construct-interface architecture-configuration
                          interface-name
                          port-map
                          #:internal-state internal-state)]

    ;;; Case: they're asking for a LUT bigger than what we have (but we do have a LUT).
    ;;;
    ;;; In this case, we can construct the bigger LUT out of smaller LUTs by recursive calls to this
    ;;; function.
    [;;; Check: They're asking for a LUT.
     (and (regexp-match? #rx"LUT.*" interface-name)
          ;;; Check: The architecture configuration implements a smaller LUT.
          (findf (lambda (interface-impl)
                   (and (regexp-match #rx"LUT.*" (car interface-impl))
                        (< (string->number (substring (car interface-impl) 3))
                           (string->number (substring interface-name 3)))))
                 (architecture-configuration-interface-implementations architecture-configuration))
          ;;; TODO: Check that the arch config implements MUX2.
          )

     ;;; In this case, we recursively construct a LUT out of 2 LUTs of a smaller size, and mux them
     ;;; together. Note that we should probably also check that the arch configuration implements
     ;;; MUXes. For now we just assume it.
     (match-let*
         (;;; First, destruct the internal state. We know exactly what the internal state should look
          ;;; like at this point.
          [lut-0-internal-state (if internal-state (first internal-state) #f)]
          [lut-1-internal-state (if internal-state (second internal-state) #f)]
          [mux-internal-state (if internal-state (third internal-state) #f)]

          ;;; The name of the LUT which is 1 smaller than the one we're trying to construct.
          [smaller-lut-name
           (string-append "LUT"
                          (number->string (sub1 (string->number (substring interface-name 3)))))]

          ;;; The ports that should be passed to the smaller LUTs. This is easy to figure out: we just
          ;;; drop one of the inputs to the larger LUT! Then, we'll use that dropped input as the
          ;;; selector of the MUX2.
          [smaller-lut-ports (take port-map (sub1 (length port-map)))]
          [mux-selector (list-ref port-map (sub1 (length port-map)))]

          [(list lut-expr0 lut-0-internal-state)
           (construct-interface-smarter architecture-configuration
                                        smaller-lut-name
                                        smaller-lut-ports
                                        #:internal-state lut-0-internal-state)]
          [(list lut-expr1 lut-1-internal-state)
           (construct-interface-smarter architecture-configuration
                                        smaller-lut-name
                                        smaller-lut-ports
                                        #:internal-state lut-1-internal-state)]
          [(list mux-expr mux-internal-state)
           (construct-interface-smarter
            architecture-configuration
            "MUX2"
            (list (cons "I0" lut-expr0) (cons "I1" lut-expr1) (cons "S" mux-selector))
            #:internal-state mux-internal-state)])
       (list mux-expr (list lut-0-internal-state lut-1-internal-state mux-internal-state)))]))

(module+ test
  (test-begin "Construct a LUT5 on Lattice from LUT4s and a MUX2."
              (match-let* ([(list expr internal-state) (construct-interface-smarter
                                                        lattice-ecp5-architecture-config
                                                        "LUT5"
                                                        (list (cons "I0" (bv 0 1))
                                                              (cons "I1" (bv 0 1))
                                                              (cons "I2" (bv 0 1))
                                                              (cons "I3" (bv 0 1))
                                                              (cons "I4" (bv 0 1))))])
                (check-true (match internal-state
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
