;;; Interpreter for the Lakeroad FPGA modeling DSL.
#lang racket

(provide interpret
         report-memoization
         generate-initial-state-map)

(require "logical-to-physical.rkt"
         "utils.rkt"
         rosette
         rosette/lib/destruct
         (prefix-in lr: "language.rkt")
         "architecture-description.rkt")

(define interp-memoization-hits 0)
(define interp-memoization-misses 0)
(define (report-memoization)
  (printf "Memozation Report: HITS: ~a  MISSES: ~a  HITS/MISSES: ~a\n"
          interp-memoization-hits
          interp-memoization-misses
          (/ (exact->inexact interp-memoization-hits) interp-memoization-misses)))

;;; module-semantics: association list of functions mapping (cons module-name filepath) to a function
;;; implementing the semantics for that module. Module semantics is a list, the order of which is
;;; defined in main.rkt.
;;;
;;; environment: association list of (cons var-name (string) value (signal)).
;;;
;;; TODO(@gussmith23): This might be better as an argument to interpret, but I'm implementing this
;;; during crunch time, so this is easier.
;;;(define module-semantics (make-parameter '()))
;;;
;;; Returns
(define (interpret expr
                   state
                   #:module-semantics [module-semantics '()]
                   #:environment [environment '()])
  (set! interp-memoization-hits 0)
  (set! interp-memoization-misses 0)
  (define interpreter-memo-hash (make-hasheq))
  ; Clone state hash.
  (define out-state (hash-copy state))
  (define (interpret-helper expr state)
    (if (hash-has-key? interpreter-memo-hash expr)
        (begin
          (set! interp-memoization-hits (add1 interp-memoization-hits))
          (hash-ref interpreter-memo-hash expr))
        (begin
          (set! interp-memoization-misses (add1 interp-memoization-misses))
          (define out
            (destruct
             expr
             [(lr:var name _)
              (cdr (or (assoc name environment) (error "variable " name " not found")))]
             [(lr:make-immutable-hash list-expr) (interpret-helper list-expr state)]
             [(lr:cons v0-expr v1-expr)
              (cons (interpret-helper v0-expr state) (interpret-helper v1-expr state))]
             [(lr:symbol s) s]
             [(lr:hash-remap-keys h-expr ks)
              (let* ([h (interpret-helper h-expr state)]
                     [_ (when (not (list? h))
                          (error "hash-remap-keys: expected h to be assoc list, got: " h))]
                     [new-h
                      (map
                       (λ (pair)
                         (let ([k (car pair)] [v (cdr pair)])
                           (cons
                            (cdr (or (assoc k ks)
                                     (error (format
                                             "old key ~a not found in list: ~a. original hash map: ~a"
                                             k
                                             ks
                                             h))))
                            v)))
                       h)])
                new-h)]
             [(lr:hash-ref h-expr k)
              (let* ([h (interpret-helper h-expr state)]
                     [out (cdr (or (assoc k h) (error "key " k " not found")))])
                out)]
             [(lr:hw-module-instance module-name inst-name ports params filepath)
              (let* (; List of functions for this module. See main.rkt for the expected order.
                     [fns (cdr (or (assoc (cons module-name filepath) module-semantics)
                                   (error "No semantics for module: "
                                          (cons module-name filepath)
                                          " in semantics association list "
                                          module-semantics)))]
                     [module-semantics-fn (fourth fns)]
                     ;;; Filter down to just the list of input ports.
                     [ports (filter (lambda (p) (equal? 'input (module-instance-port-direction p)))
                                    ports)]

                     ;;; Generate keyword arguments.
                     [port-names (map module-instance-port-name ports)]
                     [param-names (map module-instance-parameter-name params)]
                     [all-names (append port-names param-names)]

                     ;;; Generate values to be paired with the arguments.
                     [port-values (map module-instance-port-value ports)]
                     [param-values (map module-instance-parameter-value params)]
                     [all-values (append port-values param-values)]
                     ;;; Interpret values.
                     [all-values (map (lambda (v) (interpret-helper v state)) all-values)]

                     ;;; Pair them.
                     [pairs (map cons all-names all-values)]

                     ;;; Construct the inputs.
                     [inputs-fn (first fns)]
                     [inputs (inputs-fn pairs)]

                     [this-module-instance-state
                      (hash-ref state
                                inst-name
                                (lambda ()
                                  (error (format "No state for module instance: ~a~nState:~n~a"
                                                 inst-name
                                                 state))))]
                     [outputs-and-state (module-semantics-fn inputs this-module-instance-state)]
                     [outputs (car outputs-and-state)]
                     [new-state (cdr outputs-and-state)]

                     [output-helper-fn (second fns)]
                     [outputs-assoc (output-helper-fn outputs)]

                     ; TODO(@gusssmith23): Another symbol/string hack spot. Would really like to get
                     ; this sorted out. Here, we convert the keys to symbols, as the rest of the
                     ; downstream flow expects symbols as keys, though the Yosys helpers use strings
                     ; (which I think is saner).
                     [outputs-assoc
                      (map (λ (pair)
                             (cons (if (symbol? (car pair)) (car pair) (string->symbol (car pair)))
                                   (cdr pair)))
                           outputs-assoc)])

                ; Update the state.
                (hash-set! state inst-name new-state)

                ;;; Warn if we didn't pass all arguments (except for unnamed inputs).
                ;;; TODO(@gussmith23): handle unnammed inputs more intelligently, maybe in yml?
                (match-define-values (_ keywords) (procedure-keywords inputs-fn))
                ;;; Filter out unnamed inputs, which are an artifact of the Verilog-to-Racket
                ;;; importer. Also filter out #:name.
                (define keywords-minus-unnamed
                  (apply set
                         (filter (λ (k) (not (string-prefix? (keyword->string k) "unnamed-input-")))
                                 keywords)))
                (define env-keys-set (apply set (map car pairs)))
                (define missing-keys (set-subtract keywords-minus-unnamed env-keys-set))
                (when (not (equal? 0 (set-count missing-keys)))
                  ;;; TODO(@gussmith23): Figure out how to use Racket logging...
                  (displayln (format "WARNING: Not passing all inputs to module semantics, Missing ~a"
                                     missing-keys)
                             (current-error-port)))
                outputs-assoc)]
             ;;; Lakeroad language.
             [(lr:logical-to-physical-mapping f inputs)
              (interpret-logical-to-physical-mapping (lambda (e) (interpret-helper e state))
                                                     f
                                                     inputs)]
             [(lr:physical-to-logical-mapping f outputs)
              (interpret-physical-to-logical-mapping (lambda (e) (interpret-helper e state))
                                                     f
                                                     outputs)]
             ;;; Returns a list of:
             ;;; - a (bitvector n): the result of the addition.
             ;;; - a (bitvector 1): the carry out.
             ;;;
             ;;; Inputs:
             ;;; - cin: the carry in.
             ;;; - di: the data input to the mux within the carry. Usually set to one of the inputs of the
             ;;;   addition, when implementing addition.
             ;;; - s: the select signal for the mux. Usually set to the partial sums of the addition (i.e. the
             ;;;   bitwise XORs of the inputs) when performing addition.
             [(lr:carry _ _ cin di s)
              (let* (;;; Returns the carry out bit at each stage.
                     [cin (interpret-helper cin state)]
                     [di (interpret-helper di state)]
                     [s (interpret-helper s state)]
                     [calc-couts (λ (di s cins) (cons (if (bvzero? s) di (first cins)) cins))]
                     [couts-list
                      (foldl calc-couts (list cin) (bitvector->bits di) (bitvector->bits s))]
                     [cout (first couts-list)]
                     [cins (apply concat (drop couts-list 1))])
                (list (bvxor cins s) cout))]
             ;;; Racket functions lifted to our language.
             [(lr:first lst) (first (interpret-helper lst state))]
             [(lr:append lsts) (apply append (interpret-helper lsts state))]
             [(lr:take l n) (take (interpret-helper l state) (interpret-helper n state))]
             [(lr:drop l n) (drop (interpret-helper l state) (interpret-helper n state))]
             [(lr:list-ref l n)
              (for/all ([n (interpret-helper n state) #:exhaustive])
                       (list-ref (interpret-helper l state) n))]
             [(lr:map f lsts) (apply map f (interpret-helper lsts state))]
             ;;; Rosette functions lifted to our language.
             [(lr:zero-extend v bv)
              (let* ([v (interpret-helper v state)] [bv (interpret-helper bv state)])
                (zero-extend v bv))]
             [(lr:sign-extend v bv)
              (let* ([v (interpret-helper v state)] [bv (interpret-helper bv state)])
                (sign-extend v bv))]
             ;;; TODO: without this wacky syntax, Rosette will aggressively merge things into symbolic unions.
             ;;; E.g. (choose `(zero-extend v b) `(dup-extend v b)) becomes
             ;;; ((union zero-extend dup-extend) v b) instead of (union (zero-extend v b) (dup-extend v b)).
             ;;; The latter is a lot harder to deal with in the interpreter. How to stop this?
             ;;; [`(dup-extend this-is-a-hack-for-dup-extend ,v ,bv)
             ;;; (dup-extend (interpret-helper v state) bv)]
             [(lr:dup-extend v bv)
              (let* ([v (interpret-helper v state)] [bv (interpret-helper v state)])
                (dup-extend v bv))]
             [(lr:extract h l v)
              (begin
                ;;; We need these for/alls to decompose h and l in weird situations where the indices
                ;;; are concrete but there are multiple possible values.
                (let ([v (interpret-helper v state)])
                  (for/all ([h (interpret-helper h state) #:exhaustive])
                           (for/all ([l (interpret-helper l state) #:exhaustive]) (extract h l v)))))]
             [(lr:concat vs)
              (let* ([vs (interpret-helper vs state)] [bv-list vs]) (apply concat bv-list))]
             ;;; Datatypes.
             [(lr:bv v) v]
             [(lr:bitvector v) v]
             ;;; Why did we have this? Do we need it after switching to destruct?
             ;;; [(? bitvector? v) v]
             [(lr:integer v) v]
             ;;; This needs to be near the end, as nearly everything's a list!
             ;;; Maybe make this tighter somehow? If it's a list of specific types?
             [(lr:list v) (map (lambda (e) (interpret-helper e state)) v)]))
          (hash-set! interpreter-memo-hash expr out)
          out)))
  (list (interpret-helper expr out-state) out-state))

; Generates the initial state map for a given Lakeroad expression.
; - funcs is an association list of (cons module-name (list input-struct output-struct state-struct
;   initial-state semantics-fn)). This is the format generated by main.rkt.
;
; Returns a hash table mapping instance names to their initial states.
;
; TODO(@gussmith23): should have a generic way to implement these kinds of functions. This would also
; be easier if LR expressions distinguished between params and expression arguments.
(define (generate-initial-state-map expr funcs)
  (define state-map (make-hash))
  (define (helper expr)
    (for/all
     ([expr expr #:exhaustive])
     (match expr
       ; Do nothing for these.
       [(or (lr:var _ _) (lr:symbol _)) (void)]
       [(module-instance-port _ value direction _)
        (when (equal? 'input direction)
          (helper value))]
       [(lr:hw-module-instance module-name inst-name ports _ filepath)
        ; Recurse on input port expressions.
        (for ([port ports])
          (helper port))
        (define initial
          (third (cdr (or (assoc (cons module-name filepath) funcs)
                          (error "No entry found for module and filepath: " module-name filepath)))))

        (hash-set! state-map inst-name initial)]
       [(or (lr:logical-to-physical-mapping _ inputs) (lr:physical-to-logical-mapping _ inputs))
        (helper inputs)]
       [(lr:bv _) (void)]
       [(lr:first lst) (helper lst)]
       [(lr:list lst) (map helper lst)]
       [(lr:hash-ref h _) (helper h)]
       [(lr:make-immutable-hash list-expr) (helper list-expr)]
       [(lr:cons v0 v1)
        (begin
          (helper v0)
          (helper v1))]
       [(lr:extract _ _ v) (helper v)]
       [(lr:concat vs) (helper vs)]
       [(or (lr:sign-extend v _) (lr:zero-extend v _)) (helper v)]
       [_
        (let ([message (format "Not yet implemented: ~a" (object-name expr))])
          (log-error message)
          (error message))])))

  (helper expr)

  state-map)

(module+ test
  (require rackunit
           rosette)

  (check-equal? (first (interpret (lr:physical-to-logical-mapping (lr:ptol-bitwise)
                                                                  (lr:list (list (lr:bv (bv #b1 1))
                                                                                 (lr:bv (bv #b0 1)))))
                                  (hash)))
                (list (bv #b01 2)))

  (check-equal? (first (interpret (lr:logical-to-physical-mapping (lr:ltop-bitwise)
                                                                  (lr:list (list (lr:bv (bv 1 1))
                                                                                 (lr:bv (bv 0 1)))))
                                  (hash)))
                (list (bv #b01 2))))

(module+ test
  (require (only-in "architecture-description.rkt" module-instance-port))
  (test-case "generate initial state for nested modules"
    (define expr
      (lr:hw-module-instance
       "modtype1"
       "instance1"
       (list (module-instance-port
              "input1"
              (lr:hash-ref (lr:hw-module-instance "modtype2" "instance2" (list) (list) 'unused)
                           'dataout)
              'input
              36))
       (list)
       'unused))
    (define initial-state
      (generate-initial-state-map
       expr
       (list (cons (cons "modtype1" 'unused) (list 'unused 'unused 'unused '((input1 . (bv #b0 36)))))
             (cons (cons "modtype2" 'unused)
                   (list 'unused 'unused 'unused '((dataout . (bv #b0 36))))))))

    ; Make sure both modules are present.
    (check-true (hash-has-key? initial-state "instance1"))
    (check-true (hash-has-key? initial-state "instance2"))))
