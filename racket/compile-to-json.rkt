#lang errortrace racket

(provide lakeroad->jsexpr)

(require "comp-json.rkt"
         "ultrascale.rkt"
         "lattice-ecp5.rkt"
         "logical-to-physical.rkt"
         rosette)

;;; Compile Lakeroad expr to a JSON jsexpr, which can then be used by Yosys.
;;;
;;; TODO Write helper function to convert Yosys JSON to Verilog.
(define (lakeroad->jsexpr expr #:module-name [module-name "top"])

  ;;; The next available bit id. Starts at 2, as Yosys reserves 0 and 1 for the literals 0 and 1.
  (define next-bit-id 2)

  ;;; Reserve requested number of bits. Returns a list of bit ids.
  (define (get-bits num-bits)
    (define out (range next-bit-id (+ next-bit-id num-bits)))
    (set! next-bit-id (+ next-bit-id num-bits))
    out)

  (define ports (hasheq-helper))
  (define (add-port k v)
    (hasheq-helper #:base ports k v))

  (define next-cell-id 0)
  (define cells (hasheq-helper))
  (define (add-cell k v)
    (hasheq-helper #:base cells
                   (string->symbol (string-append (symbol->string k) (format "_~a" next-cell-id)))
                   v)
    (set! next-cell-id (add1 next-cell-id))
    (void))

  (define next-netname-id 0)
  (define netnames (hasheq-helper))
  (define (add-netname k v)
    (hasheq-helper #:base netnames
                   (string->symbol (string-append (symbol->string k) (format "_~a" next-netname-id)))
                   v)
    (set! next-netname-id (add1 next-netname-id))
    (void))

  (define parameter-default-values (hasheq-helper))
  (define (add-parameter-default-value k v)
    (hasheq-helper #:base parameter-default-values k v))

  ;;; Generally: individual signals (symbolic constants e.g. 'a' or concrete constants e.g. (bv 1 2))
  ;;; return a list of integers representing bit ids. Note that, in the case that a bit is hardwired
  ;;; to 0 or 1, the id will instead be the strings "0" or "1" as per Yosys's JSON format definition.
  ;;; "Blocks" like physical-to-logical mappings or CLBs return lists of signals (so, a list of lists
  ;;; of integers).
  (define (compile expr)
    (match expr
      [`(ultrascale-plus-clb ,_ ...)
       (make-ultrascale-plus-clb compile
                                 get-bits
                                 add-cell
                                 add-netname
                                 add-parameter-default-value
                                 expr)]
      [`(lattice-ecp5-pfu ,_ ...)
       (lattice-pfu-helper compile get-bits add-cell add-netname add-parameter-default-value expr)]
      [`(ultrascale-plus-lut2 ,init ,inputs)
        (match-define (list i0 i1) (compile inputs))
       (define o (get-bits 1))
       (add-cell 'lut2
                 (make-cell "LUT2"
                            (make-cell-port-directions (list 'I0 'I1) (list 'O))
                            (make-cell-connections 'I0 i0 'I1 i1 'O o)
                            #:params (hasheq 'INIT (make-literal-value-from-bv init))))
       (list o)]
      [`(physical-to-logical-mapping ,_ ...) (compile-physical-to-logical-mapping compile expr)]
      [`(logical-to-physical-mapping ,_ ...) (compile-logical-to-physical-mapping compile expr)]

      ;;; Racket operators.
      [`(first ,v) (first (compile v))]
      [`(take ,l ,n) (take (compile l) n)]
      [`(list-ref ,l ,n) (list-ref (compile l) n)]

      ;;; Rosette operators.
      [(or (expression (== extract) high low v) `(extract ,high ,low ,v))
       (drop (take (compile v) (add1 high)) low)]
      [(expression (== zero-extend) v bv-type)
       (append (compile v) (make-list (- (bitvector-size bv-type) (bitvector-size (type-of v))) "0"))]
      [(or `(concat ,v0 ,v1) (expression (== concat) v0 v1)) (append (compile v1) (compile v0))]

      ;;; Symbolic bitvector constants correspond to module inputs!
      [(? bv? (? symbolic? (? constant? s)))
       ;;; Get the port details if they exist; create and return them if they don't.
       (define port-details
         (hash-ref ports
                   (string->symbol (~a s))
                   (lambda ()
                     (define bits (get-bits (bitvector-size (type-of s))))
                     (define port-details (make-port-details "input" bits))
                     (add-port (string->symbol (~a s)) port-details)
                     port-details)))

       ;;; Return the bits.
       (hash-ref port-details 'bits)]

      ;;; Concrete bitvectors become constants.
      [(? bv? (? concrete? s)) (map ~a (map bitvector->natural (bitvector->bits s)))]

      ;;; Should go near the bottom -- remember, nearly everything's a list underneath!
      [(? list? v) (map compile v)]))

  (define outputs (list (compile expr)))

  (for ([output-bits outputs] [i (range (length outputs))])
    (add-port (string->symbol (format "out~a" i)) (make-port-details "output" output-bits)))

  (define doc (make-lakeroad-json-doc))
  (add-module-to-doc
   doc
   (string->symbol module-name)
   (make-module ports cells netnames #:parameter-default-values parameter-default-values))

  doc)

(module+ test
  (require rosette/lib/synthax
           rosette/solver/smt/boolector
           rosette
           json
           rackunit
           "interpreter.rkt")

  ;;; Re-enable this test when we support multiple outputs.
  ;;; (test-begin (define-symbolic a b (bitvector 8))
  ;;;             (define out (lakeroad->jsexpr (list a b a)))
  ;;;             (define modules (hash-ref out 'modules))
  ;;;             (check-equal? (hash-count modules) 1)
  ;;;             (define module (hash-ref modules 'top))
  ;;;             (check-equal? (hash-count (hash-ref module 'ports)) 5))

  (test-begin
   (define out (lakeroad->jsexpr (bv #b000111 6)))
   (check-equal?
    (hash-ref (hash-ref (hash-ref out 'modules) 'top) 'ports)
    (hasheq-helper 'out0 (hasheq-helper 'bits '("1" "1" "1" "0" "0" "0") 'direction "output"))))

  (test-begin (current-solver (boolector))
              (define-symbolic a b (bitvector 8))
              (define expr
                `(first (physical-to-logical-mapping
                         (bitwise)
                         ;;; Take the 8 outputs from the LUTs; drop cout.
                         (take (ultrascale-plus-clb ,(?? (bitvector 1))
                                                    ,(?? (bitvector 64))
                                                    ,(?? (bitvector 64))
                                                    ,(?? (bitvector 64))
                                                    ,(?? (bitvector 64))
                                                    ,(?? (bitvector 64))
                                                    ,(?? (bitvector 64))
                                                    ,(?? (bitvector 64))
                                                    ,(?? (bitvector 64))
                                                    ,(?? (bitvector 2))
                                                    ,(?? (bitvector 2))
                                                    ,(?? (bitvector 2))
                                                    ,(?? (bitvector 2))
                                                    ,(?? (bitvector 2))
                                                    ,(?? (bitvector 2))
                                                    ,(?? (bitvector 2))
                                                    ,(?? (bitvector 2))
                                                    (logical-to-physical-mapping
                                                     (bitwise)
                                                     ,(list a b (bv 0 8) (bv 0 8) (bv 0 8) (bv 0 8))))
                               8))))
              (define soln
                (synthesize #:forall (list a b)
                            #:guarantee
                            (begin
                              ; Assert that the output of the CLB implements the requested function f.
                              (assert (bveq (bvand a b) (interpret expr))))))
              (check-true (sat? soln))
              (check-not-exn (thunk (lakeroad->jsexpr (evaluate expr soln))))))
