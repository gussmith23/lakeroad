#lang racket

; A library for compiling to JSON to match the nextpnr spec, roughly defined at:
; https://github.com/YosysHQ/yosys/blob/63c9c9be5c0b0cc2b7f4588f1ac8e72eabc6bd0a/backends/json/json.cc#L340
;

(require json
         racket/format
         rosette)

(provide hasheq-helper
         as-symbol
         make-literal-value
         make-literal-value-from-bv
         make-literal-value-list
         make-lakeroad-json-doc
         ; module level functions
         get-modules
         make-module
         add-module
         add-module-to-doc
         get-module
         get-module-from-doc
         make-module-attributes
         get-module-attribute
         make-module-attributes
         ; port functions
         make-ports
         make-port-details
         add-port
         get-port
         ; cell functions
         make-cells
         make-cell-port-directions
         make-cell-connections
         make-cell
         get-cell-port-direction
         get-cell-port-connection
         add-cell
         add-cell-to-module-in-doc
         get-cell
         get-cell-from-module-in-doc
         ; netname functions
         make-netnames
         make-net-details
         add-net-details
         get-net-details
         get-net-details-from-module-in-doc)

; A helper function: keys in json dicts must be symbols, not strings.
; To make this easier we allow strings to be passed in as names and then
; sanitize them to symbols
(define (as-symbol s)
  (cond
    [(symbol? s) s]
    [(string? s) (string->symbol s)]
    [else (error (format "(as-symbol ~a): Unrecognized type" s))]))

(define (make-literal-value n prec)
  (~a (number->string n 2) #:width prec #:align 'right #:pad-string "0"))

(define (make-literal-value-from-bv bv)
  (make-literal-value (bitvector->natural bv) (length (bitvector->bits bv))))

(define (make-literal-value-list ns prec)
  (for/list ([n ns])
    (make-literal-value n prec)))

(module+ test
  (require rackunit)
  (check-equal? (as-symbol 'a) 'a)
  (check-equal? (as-symbol 'xyz) 'xyz)
  (check-equal? (as-symbol "abc") 'abc))

; A helper function to make mutable hasheqs.
;
; The default behavior is to translate keys to `symbols` (this is required by
; the `json` library for the resulting hash table to be a `jsexpr?`).
;
; This default can be customized by specifying a `#:keyfn`
;
; Parameters:
; -----------
;
; + vals: a list of key/values. If `vals` has odd length an error is thrown
; + #:base: a base hasheq to add to (defaults to an empty hasheq)
; + #:keyfn: a function to apply to keys before they are inserted. This allows
;       this helper function to be customized. Default is the `as-symbol`
;       function (this)
; + #:valfn: a function to apply to values before they are inserted. This allows
;       this helper function to be customized. Default is the `identity`
;       function
(define (hasheq-helper #:base [base 'nil] #:keyfn [keyfn as-symbol] #:valfn [valfn identity] . vals)
  (when (odd? (length vals))
    (error (format "hasheq-helper expects even number of values: ~a" vals)))

  ; This helper:
  ; + double checks that `k` is either a string or a symbol
  ; + Translates k to a symbol
  ; + Ensures that `k` isn't already a key in the table
  ; + Inserts a key-value pair into the table
  (define (helper-insert ht k v)
    (or (string? k) (symbol? k) (error (format "Invalid key ~a: expected string? or symbol?" k)))
    (let ([k2 (keyfn k)] [v2 (valfn v)])
      (when (hash-has-key? ht k)
        (error (format "Table ~a already has key ~a (from key ~a)" ht k2 k)))
      (hash-set! ht k2 v2)))

  ; Recursively match key-value pairs and insert them
  (define (helper-traverse ht xs)
    (match xs
      [(cons k (cons v xs))
       (begin
         (helper-insert ht k v)
         (helper-traverse ht xs))]
      [(cons x '()) (error (format "Single trailing element ~a" x))]
      ['() ht]
      [_ (error "Illegal state")]))
  (let ([ht (if (equal? base 'nil) (make-hasheq) base)]) (helper-traverse ht vals)))

; Create a top-level Lakeroad JSON document
;
; Spec: https://github.com/uwsampl/lakeroad-evaluation/blob/461d27016826b5b4bcbbab6325343638cfb01639/instructions/pnr-experiments/nextpnr-json-docs.txt#L15
(define (make-lakeroad-json-doc #:modules [modules '()] #:creator [creator "Lakeroad"])
  (hasheq-helper 'creator creator 'modules (apply hasheq-helper modules)))

(module+ test
  (require rackunit)
  (let ([json-doc (make-lakeroad-json-doc)])
    ; Sanity check base template
    (check-equal? json-doc
                  (make-hasheq (list (cons 'creator "Lakeroad") (cons 'modules (hasheq-helper)))))))

(define (get-modules doc)
  (hash-ref doc 'modules))
; Create a module.
;
; This returns a (jsexpr?) of the form
;
; #hasheq((attributes . ATTRS)
;         (ports      . PORTS)
;         (cells      . CELLS)
;         (netnames   . NETNAMES))
;
; where:
; + ATTRS: module attributes defined in `make-module-attributes`
; + PORTS: describes input and output ports for module, defined in
;          `make-mod-ports`
; + CELLS: describes the primitives/components (LUTs, MUXs, etc), defined in
;          `make-cells`
; + NETNAMES: TODO: I don't know why this exists outside of PORTS, defined in
;            `make-netnames`
;
; Spec: https://github.com/uwsampl/lakeroad-evaluation/blob/461d27016826b5b4bcbbab6325343638cfb01639/instructions/pnr-experiments/nextpnr-json-docs.txt#L18-L43
(define (make-module ports
                     cells
                     netnames
                     #:attributes [attrs '()]
                     #:memories [mems '()]
                     #:parameter-default-values [parameter-default-values '()])
  (let ([modul (hasheq-helper 'ports ports 'cells cells 'netnames netnames)])
    (when (not (empty? attrs))
      (hash-set! modul 'attributes attrs))
    (when (not (empty? mems))
      (hash-set! modul 'memories mems))
    (when (not (empty? parameter-default-values))
      (hash-set! modul 'parameter_default_values parameter-default-values))
    modul))

; Add a module to the `modules` map, checking to ensure that there isn't a name
; conflict.
;
; Modules should be created with `make-module`
(define (add-module modules mod-name mod)
  (let ([mod-name (as-symbol mod-name)])
    (when (hash-has-key? mod mod-name)
      (error (format "Encountered duplicate module name ~a while generating lut4" mod-name)))
    (hash-set! modules mod-name mod)))

(define (add-module-to-doc doc mod-name mod)
  (let* ([modules (get-modules doc)] [mod-name (as-symbol mod-name)])
    (when (hash-has-key? mod mod-name)
      (error (format "Encountered duplicate module name ~a while generating lut4" mod-name)))
    (hash-set! modules mod-name mod)))
; A helper function to get a module from modules by name.
;
; Performs automatic string->symbol conversion on the name
(define (get-module modules mod-name)
  (hash-ref modules
            (as-symbol mod-name)
            (lambda () (error (format "Modules ~a does not contain module ~a" modules mod-name)))))

(define (get-module-from-doc doc mod-name)
  (get-module (get-modules doc) mod-name))

(define (get-module-attribute mod attr)
  (let* ([attrs (hash-ref mod 'attributes (lambda () (hasheq)))]
         [a (hash-ref attrs
                      (as-symbol attr)
                      (lambda () (error (format "Attributes ~a has no attribute ~a" attrs attr))))])
    a))

; Create attributes for a module.
;
; Make module level attributes. This format is taken from Yosys output, where
; + hdlname: the HDL module name (e.g., the Verilog module name)
; + top: TODO: what is `top`? Topology? Seems to default to 1
; + src: TODO: what is `src`?
(define make-module-attributes hasheq-helper)

(module+ test
  ; This test ensures that a Lakeroad JSON file, created by `make-lakeroad-json`,
  ; is well formed.
  (require rackunit)
  (let* ([json-doc (make-lakeroad-json-doc)]
         [modules (get-modules json-doc)]
         [attrs (make-module-attributes 'hdlname "my-module")]
         [a (make-port-details "input" (list 2 3 4 5))]
         [b (make-port-details "input" (list 6 7 8 9))]
         [out (make-port-details "input" (list 10 11 12 13))]
         [ports (make-ports 'a a 'b b 'out out)]
         [cells "todo"]
         [netnames "todo"]
         [modul (make-module ports cells netnames #:attributes attrs)])
    (check-true (jsexpr? ports))
    (check-true (jsexpr? cells))
    (check-true (jsexpr? attrs))
    (check-true (jsexpr? netnames) (format "Netnames ~a is not a jsexpr" netnames))

    (add-module-to-doc json-doc "test-module" modul)

    (check-true (jsexpr? modul) (format "Module ~a is not a jsexpr" modul))
    (check-true (jsexpr? json-doc) (format "Lakeroad JSON File ~a is not a jsexpr" json-doc))

    ; Let's check modules for well-formedness
    (let* ([ms (hash-ref json-doc 'modules)] [m (get-module ms "test-module")])
      (check-true (jsexpr? ms))
      (check-true (hash-has-key? ms 'test-module))
      (check-false (hash-has-key? ms "test-module"))
      (check-equal? (hash-ref m 'cells) "todo")
      (check-equal? (hash-ref m 'netnames) "todo")
      (check-equal? (hash-ref m 'ports) ports)
      (check-equal? (hash-ref m 'attributes) (hasheq-helper 'hdlname "my-module"))
      (check-equal? (get-module-attribute m "hdlname") "my-module")
      (check-equal? (get-module-attribute m 'hdlname) "my-module"))))

; Make a fresh `ports` map
(define make-ports hasheq-helper)

; A `port-detail` contains:
;
; + direction: <"input" | "output" | "inout">
; + bits: an array of bits (e.g., [2, 3, 4, 5])
;
; as well as optionally (default to `0` if not present):
;
; + signed: 1 if port is signed, 0 otherwise (defaults to 1 if not presented)
; + offset: the lowest bit index in use
; + upto: 1 if bit indexing is MSB first
;
; Spec: https://github.com/uwsampl/lakeroad-evaluation/blob/461d27016826b5b4bcbbab6325343638cfb01639/instructions/pnr-experiments/nextpnr-json-docs.txt#L52-L58
(define (make-port-details direction bits #:signed [signed 0] #:offset [offset 0] #:upto [upto 0])
  ; ensure that `direction` is valid
  (when (not (set-member? (set "input" "output" "inout") direction))
    (error (format "Invalid port direction ~a: must ben in <\"input\", \"output\", \"inout\">"
                   direction)))
  (let ([port-details (make-ports 'direction direction 'bits bits)])
    ; Then add optional port details
    (when (not (zero? signed))
      (hash-set! port-details 'signed 1))
    (when (not (zero? offset))
      (hash-set! port-details 'offset offset))
    (when (not (zero? upto))
      (hash-set! port-details 'upto 1))
    port-details))

; Modify a `ports` hash-eq to map a name to a `port-details`.  `port-details`
; should be created with `(make-port-details)`
(define (add-port ports name port-details)
  (let ([name (as-symbol name)])
    (when (hash-has-key? ports name)
      (error (format "Encountered duplicate port name ~a" name)))
    (hash-set! ports name port-details)))

; Helper function to return a port given a name.
(define (get-port ports port-name)
  (hash-ref ports
            (as-symbol port-name)
            (lambda () (error (format "Ports ~a does not contain port ~a" ports port-name)))))

(module+ test
  (require rackunit)
  (let ([pd (make-port-details "input" (list 2 3 4))])
    (check-equal? (hash-ref pd 'direction) "input")
    (check-equal? (hash-ref pd 'bits) (list 2 3 4))
    (check-equal? (hash-ref pd 'signed 'NOT-PRESENT) 'NOT-PRESENT)
    (check-equal? (hash-ref pd 'offset 'NOT-PRESENT) 'NOT-PRESENT)
    (check-equal? (hash-ref pd 'upto 'NOT-PRESENT) 'NOT-PRESENT))

  ; Checking optional arguments
  (let ([pd (make-port-details "input" (list 2 3 4) #:signed 1 #:offset 3)])
    (check-equal? (hash-ref pd 'signed 'NOT-PRESENT) 1)
    (check-equal? (hash-ref pd 'offset 'NOT-PRESENT) 3)
    (check-equal? (hash-ref pd 'upto 'NOT-PRESENT) 'NOT-PRESENT))

  (let ([pd (make-port-details "input" (list 2 3 4) #:upto 1)])
    (check-equal? (hash-ref pd 'upto 'NOT-PRESENT) 1))

  (let* ([ports (make-ports)]
         [a (make-port-details "input" (list 2 3 4 5))]
         [b (make-port-details "input" (list 6 7 8 9))]
         [out (make-port-details "output" (list 10 11 12 13))])
    (add-port ports "a" a)
    (check-true (hash-has-key? ports 'a))
    (check-equal? (get-port ports "a") a)
    (add-port ports "b" b)
    (check-true (hash-has-key? ports 'b))
    (check-equal? (get-port ports "b") b)
    (add-port ports "out" out)
    (check-true (hash-has-key? ports 'out))
    (check-equal? (get-port ports "out") out)
    (check-true (jsexpr? ports))))

(define make-cells hasheq-helper)

(define (make-cell-port-directions inputs outputs)
  (apply hasheq-helper
         (flatten (list (for/list ([input inputs])
                          (cons input "input"))
                        (for/list ([output outputs])
                          (cons output "output"))))))

;;; TODO I don't think this is always what you want. e.g. (make-cell-connections 'signal signal) where signal is a list.
(define make-cell-connections (curry hasheq-helper #:valfn list))

(define (make-cell type
                   port-directions
                   connections
                   #:attrs [attrs (hasheq)]
                   #:hide-name [hide-name 0]
                   #:params [params (hasheq-helper)])
  (let ([cell (hasheq-helper 'type
                             type
                             'port_directions
                             port-directions
                             'connections
                             connections
                             'attributes
                             attrs
                             'hide_name
                             hide-name
                             'parameters
                             params)])
    (when (not (empty? params))
      (hash-set! cell 'parameters params))
    cell))

(define (get-cell-port-direction cell port)
  (hash-ref (hash-ref cell 'port_directions) (as-symbol port)))

(define (get-cell-port-connection cell port)
  (hash-ref (hash-ref cell 'connections) (as-symbol port)))

; Modify a `cells` hash-eq to map a name to a `cell`.  `cell`
; should be created with `(make-port-details)`
(define (add-cell cells name cell)
  (let ([name (as-symbol name)])
    (when (hash-has-key? cells name)
      (error (format "Encountered duplicate cell name ~a" name)))
    (hash-set! cells name cell)))

(define (add-cell-to-module-in-doc doc mod-name cell-name cell)
  (let* ([mod (get-module-from-doc doc mod-name)] [cells (hash-ref 'cells mod)])
    (add-cell cells cell-name cell)))

; A helper function to get a module from modules by name.
;
; Performs automatic string->symbol conversion on the name
(define (get-cell cells cell-name)
  (hash-ref cells
            (as-symbol cell-name)
            (lambda () (error (format "Cells ~a does not contain cell name ~a" cells cell-name)))))

(define (get-cell-from-module-in-doc doc mod-name cell-name)
  (get-cell (hash-ref (get-module-from-doc doc mod-name) 'cells) cell-name))

(module+ test
  (require rackunit)
  (let* ([type "LUT4"]
         [directions (make-cell-port-directions (list "A" "B" "C" "D") (list "Z"))]
         [connections (make-cell-connections "A" "0" "B" "0" "C" 2 "D" 6 "Z" 10)]
         [cell (make-cell type directions connections)])
    (check-equal? (get-cell-port-direction cell "A") "input")
    (check-equal? (get-cell-port-direction cell "B") "input")
    (check-equal? (get-cell-port-direction cell "C") "input")
    (check-equal? (get-cell-port-direction cell "D") "input")
    (check-equal? (get-cell-port-direction cell "Z") "output")

    (check-equal? (get-cell-port-connection cell "A") (list "0"))
    (check-equal? (get-cell-port-connection cell "B") (list "0"))
    (check-equal? (get-cell-port-connection cell "C") (list 2))
    (check-equal? (get-cell-port-connection cell "D") (list 6))
    (check-equal? (get-cell-port-connection cell "Z") (list 10))))

(define make-netnames hasheq-helper)

(define (make-net-details bits
                          #:hide-name [hide-name 0]
                          #:attributes [attrs '()]
                          #:upto [upto 0]
                          #:signed [signed 0]
                          #:offset [offset 0])
  (let* ([nn (hasheq-helper 'bits bits 'hide_name hide-name)])
    (when (not (empty? attrs))
      (hash-set! nn 'attributes attrs))
    (when (not (zero? upto))
      (hash-set! nn 'upto upto))
    (when (not (zero? signed))
      (hash-set! nn 'signed signed))
    (when (not (zero? offset))
      (hash-set! nn 'offset offset))
    nn))

(define (add-net-details netnames name net-details)
  (let ([name (as-symbol name)])
    (when (hash-has-key? netnames name)
      (error (format "Encountered duplicate netnames name ~a" name)))
    (hash-set! netnames name net-details)))

(define (get-net-details netnames net-name)
  (hash-ref
   netnames
   (as-symbol net-name)
   (lambda () (error (format "Netnames ~a does not contain net-name ~a" netnames net-name)))))

(define (get-net-details-from-module-in-doc doc mod-name net-name)
  (get-cell (hash-ref (get-module-from-doc doc mod-name) 'netnames) net-name))

(module+ test
  (require rackunit)
  (let* ([a (make-net-details (list 2 3 4 5))]
         [b (make-net-details (list 6 7 8 9))]
         [out (make-net-details (list 10 11 12 13))]
         [LUT_Z_1_B (make-net-details (list 14) #:hide-name 1)]

         [netnames (make-netnames 'a a 'b b 'out out 'LUT_Z_1_B LUT_Z_1_B)])
    (check-equal? (hash-ref (get-net-details netnames 'a) 'bits) (list 2 3 4 5))
    (check-equal? (hash-ref (get-net-details netnames 'b) 'bits) (list 6 7 8 9))
    (check-equal? (hash-ref (get-net-details netnames 'out) 'bits) (list 10 11 12 13))
    (check-equal? (hash-ref (get-net-details netnames 'LUT_Z_1_B) 'bits) (list 14))

    (check-equal? (hash-ref (get-net-details netnames 'a) 'hide_name) 0)
    (check-equal? (hash-ref (get-net-details netnames 'b) 'hide_name) 0)
    (check-equal? (hash-ref (get-net-details netnames 'out) 'hide_name) 0)
    (check-equal? (hash-ref (get-net-details netnames 'LUT_Z_1_B) 'hide_name) 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  Lattice Stuff (for now, just to test the implementation)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-lattice-lut4 init-mem A B C D Z #:attrs [attrs (hasheq)])
  (make-cell "LUT4"
             (make-cell-port-directions (list 'A 'B 'C 'D) (list 'Z))
             (make-cell-connections 'A A 'B B 'C C 'D D 'Z Z)
             #:params (hasheq 'INIT init-mem)))

; This function makes a 2-bit adder with the following design:
;
;        +---------+
; 1'0 ---|A       Z| ----------------+
; 1'0 ---|B        |                 |
; a[0]---|C        |                 |
; b[0]---|D        |                 |
;        +---------+                 +-------> out[0]
;        (  LUT1   )                 +-------> out[1]
;        ( 0x0ff0  )                 |
;                                    |
;        +---------+                 |
; a[0]---|A       Z| ----------------+
; b[0]---|B        |
; a[1]---|C        |
; b[1]---|D        |
;        +---------+
;        (  LUT2   )
;        ( 0x8778  )
;
; This takes in two 2-bit inputs, `a` and `b`, and results in 2-bit output `out`
;
; In our design:
; + input  `a`   corresponds to bits 2 and 3
; + input  `b`   corresponds to bits 4 and 5
; + output `out` corresponds to bits 6 and 7
(define (make-lattice-ecp5-2-bit-adder)
  ;
  (let* ([doc (make-lakeroad-json-doc)]
         ; [====== Make Ports  ======]
         ; We need to make two input ports, a and b, and one output port
         ; + input  `a`   corresponds to bits 2 and 3
         ; + input  `b`   corresponds to bits 4 and 5
         ; + output `out` corresponds to bits 6 and 7
         [a (make-port-details "input" (list 2 3))]
         [b (make-port-details "input" (list 4 5))]
         [out (make-port-details "output" (list 6 7))]

         ; We store these in a `ports` map with `make-ports`
         [ports (make-ports 'a a 'b b 'out out)]

         ; [====== LUT 1  ======]
         ; First we make LUT1 from our above diagram. This lut is assigned ot
         ; out[0] in our HDL, which is translated to bit 6 in this
         ; representation
         ;
         [A (make-literal-value 0 1)] ; LUT1.A gets literal bit '0'
         [B (make-literal-value 0 1)] ; LUT1.B gets literal bit '0'
         [C 2] ; LUT1.C gets a[0] (i.e., bit 2)
         [D 4] ; LUT1.D gets b[0] (i.e., bit 4)
         [Z 6] ; LUT1.Z goes to out[0] (i.e., bit 6)
         [INIT (make-literal-value #x0ff0 16)]
         [LUT1 (make-lattice-lut4 INIT A B C D Z)]

         ; [====== LUT 2  ======]
         ; Next we make LUT2 from our above diagram. This lut is assigned to
         ; out[1] in our HDL, which is translated to bit 7 in this
         ; representation
         ;
         [A 2] ; LUT2.A gets a[0] (i.e., bit 2)
         [B 4] ; LUT2.B gets b[0] (i.e., bit 4)
         [C 3] ; LUT2.C gets a[1] (i.e., bit 3)
         [D 5] ; LUT2.D gets b[1] (i.e., bit 5)
         [Z 7] ; LUT2.Z goes to out[1] (i.e., bit 7)
         [INIT (make-literal-value #x8778 16)]
         [LUT2 (make-lattice-lut4 INIT A B C D Z)]
         [cells (make-cells 'LUT1 LUT1 'LUT2 LUT2)]

         ; [====== Netnames ======]
         ; Now let's specify how things are linked together. This is pretty
         ; straightforward since this design is so simple
         [nn-a (make-net-details (list 2 3))]
         [nn-b (make-net-details (list 4 5))]
         [nn-out (make-net-details (list 6 7))]
         [netnames (make-netnames 'a nn-a 'b nn-b 'out nn-out)]

         ; [====== Module ======]
         ; Finally, let's combine this into a module and add it to our Lakeroad
         ; JSON file.
         [adder-2-bit (make-module ports cells netnames)])
    (add-module-to-doc doc '2-bit-adder adder-2-bit)
    doc))
