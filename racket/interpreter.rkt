;;; Interpreter for the Lakeroad FPGA modeling DSL.
#lang racket

(provide interpret
         report-memoization)

(require racket/pretty
         "logical-to-physical.rkt"
         "utils.rkt"
         "lut.rkt"
         rosette
         rosette/lib/destruct
         (prefix-in lr: "language.rkt")
         "architecture-description.rkt"
         "signal.rkt")

(define interp-memoization-hits 0)
(define interp-memoization-misses 0)
(define (report-memoization)
  (printf "Memozation Report: HITS: ~a  MISSES: ~a  HITS/MISSES: ~a\n"
          interp-memoization-hits
          interp-memoization-misses
          (/ (exact->inexact interp-memoization-hits) interp-memoization-misses)))

;;; module-semantics: association list of functions mapping (cons module-name filepath) to a function
;;; implementing the semantics for that module.
;;;
;;; environment: association list of (cons var-name (string) value (signal)).
;;;
;;; TODO(@gussmith23): This might be better as an argument to interpret, but I'm implementing this
;;; during crunch time, so this is easier.
;;;(define module-semantics (make-parameter '()))
(define (interpret expr #:module-semantics [module-semantics '()] #:environment [environment '()])
  (set! interp-memoization-hits 0)
  (set! interp-memoization-misses 0)
  (define interpreter-memo-hash (make-hasheq))
  (define (interpret-helper expr)
    (if (hash-has-key? interpreter-memo-hash expr)
        (begin
          (set! interp-memoization-hits (add1 interp-memoization-hits))
          (hash-ref interpreter-memo-hash expr))
        (begin
          (set! interp-memoization-misses (add1 interp-memoization-misses))
          (define out
            (destruct
             expr
             [(lr:var name bw)
              (cdr (or (assoc name environment) (error "variable " name " not found")))]
             [(lr:symbol s) s]
             [(lr:make-immutable-hash list-expr) (interpret-helper list-expr)]
             [(lr:cons v0-expr v1-expr) (cons (interpret-helper v0-expr) (interpret-helper v1-expr))]
             [(lr:hash-remap-keys h-expr ks)
              (let* ([h (interpret-helper h-expr)]
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
              (let* ([h (interpret-helper h-expr)]
                     [out (cdr (or (assoc k h) (error "key " k " not found")))])
                out)]
             [(lr:hw-module-instance name ports params filepath)
              (let* ([module-semantics-fn (cdr (or (assoc (cons name filepath) module-semantics)
                                                   (error "No semantics for module: "
                                                          (cons name filepath)
                                                          " in semantics association list "
                                                          module-semantics)))]
                     ;;; Filter down to just the list of input ports.
                     [ports (filter (lambda (p) (equal? 'input (module-instance-port-direction p)))
                                    ports)]

                     ;;; Generate keyword arguments.
                     [port-names (map module-instance-port-name ports)]
                     [param-names (map module-instance-parameter-name params)]
                     [all-names (append port-names param-names)]
                     [all-names-as-keywords (map string->keyword all-names)]

                     ;;; Generate values to be paired with the arguments.
                     [port-values (map module-instance-port-value ports)]
                     [param-values (map module-instance-parameter-value params)]
                     [all-values (append port-values param-values)]
                     ;;; Interpret values.
                     [all-values (map interpret-helper all-values)]

                     ;;; Pair them.
                     [pairs (map cons all-names-as-keywords all-values)]

                     ;;; Append #:name argument.
                     ;;;
                     ;;; NOTE: We currently give each module a unique name based on the hash code of
                     ;;; its expression. There's really no reason why this is correct, and we should
                     ;;; definitely have a smarter solution! This was just a quick solution for giving
                     ;;; each module a unique name.
                     [pairs (cons (cons (string->keyword "name")
                                        (number->string (equal-hash-code expr)))
                                  pairs)]

                     ;;; Sort them by keyword<.
                     [pairs (sort pairs keyword<? #:key car)]

                     ;;; Call the function.
                     [out (keyword-apply module-semantics-fn (map car pairs) (map cdr pairs) '())])
                ;;; Warn if we didn't pass all arguments (except for unnamed inputs).
                ;;; TODO(@gussmith23): handle unnammed inputs more intelligently, maybe in yml?
                (match-define-values (_ keywords) (procedure-keywords module-semantics-fn))
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
                out)]
             ;;; Lakeroad language.
             [(logical-to-physical-mapping f inputs)
              (interpret-logical-to-physical-mapping interpret-helper f inputs)]
             [(physical-to-logical-mapping f outputs)
              (interpret-physical-to-logical-mapping interpret-helper f outputs)]
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
             [(lr:carry width architecture cin di s)
              (let* (;;; Returns the carry out bit at each stage.
                     [cin (interpret-helper cin)]
                     [di (interpret-helper di)]
                     [s (interpret-helper s)]
                     [calc-couts (λ (di s cins) (cons (if (bvzero? s) di (first cins)) cins))]
                     [couts-list
                      (foldl calc-couts (list cin) (bitvector->bits di) (bitvector->bits s))]
                     [cout (first couts-list)]
                     [cins (apply concat (drop couts-list 1))])
                (list (bvxor cins s) cout))]
             ;;; Racket functions lifted to our language.
             [(lr:first lst) (first (interpret-helper lst))]
             [(lr:append lsts) (apply append (interpret-helper lsts))]
             [(lr:take l n) (take (interpret-helper l) (interpret-helper n))]
             [(lr:drop l n) (drop (interpret-helper l) (interpret-helper n))]
             [(lr:list-ref l n)
              (for/all ([n (interpret-helper n) #:exhaustive]) (list-ref (interpret-helper l) n))]
             [(lr:map f lsts) (apply map f (interpret-helper lsts))]
             ;;; Rosette functions lifted to our language.
             [(lr:zero-extend v bv)
              (let* ([v (interpret-helper v)]
                     [bv (interpret-helper bv)]
                     [state (merge-state (list v))])
                (signal (zero-extend (signal-value v) bv) state))]
             [(lr:sign-extend v bv)
              (let* ([v (interpret-helper v)]
                     [bv (interpret-helper bv)]
                     [state (merge-state (list v))])
                (signal (sign-extend (signal-value v) bv) state))]
             ;;; TODO: without this wacky syntax, Rosette will aggressively merge things into symbolic unions.
             ;;; E.g. (choose `(zero-extend v b) `(dup-extend v b)) becomes
             ;;; ((union zero-extend dup-extend) v b) instead of (union (zero-extend v b) (dup-extend v b)).
             ;;; The latter is a lot harder to deal with in the interpreter. How to stop this?
             ;;; [`(dup-extend this-is-a-hack-for-dup-extend ,v ,bv)
             ;;; (dup-extend (interpret-helper v) bv)]
             [(lr:dup-extend v bv)
              (let* ([v (interpret-helper v)]
                     [bv (interpret-helper bv)]
                     [state (merge-state (list v))])
                (signal (dup-extend (signal-value v) bv) state))]
             [(lr:extract h l v)
              (begin
                ;;; We need these for/alls to decompose h and l in weird situations where the indices
                ;;; are concrete but there are multiple possible values.
                (let ([v (interpret-helper v)])
                  (for/all ([h (interpret-helper h) #:exhaustive])
                           (for/all ([l (interpret-helper l) #:exhaustive])
                                    (signal (extract h l (signal-value v))
                                            (merge-state (list v)))))))]
             [(lr:concat vs)
              (let* ([vs (interpret-helper vs)]
                     [state (merge-state vs)]
                     [bv-list (map signal-value vs)])
                (signal (apply concat bv-list) state))]
             ;;; Datatypes.
             [(lr:bv v) v]
             [(lr:bitvector v) v]
             ;;; Why did we have this? Do we need it after switching to destruct?
             ;;; [(? bitvector? v) v]
             [(lr:integer v) v]
             ;;; This needs to be near the end, as nearly everything's a list!
             ;;; Maybe make this tighter somehow? If it's a list of specific types?
             [(lr:list v) (map interpret-helper v)]))
          (hash-set! interpreter-memo-hash expr out)
          out)))
  (interpret-helper expr))

(module+ test
  (require rackunit
           rosette)

  (check-equal?
   (map signal-value
        (interpret (physical-to-logical-mapping (ptol-bitwise)
                                                (lr:list (list (lr:bv (bv->signal (bv #b1 1)))
                                                               (lr:bv (bv->signal (bv #b0 1))))))))
   (list (bv #b01 2)))

  (check-equal?
   (map signal-value
        (interpret (logical-to-physical-mapping (ltop-bitwise)
                                                (lr:list (list (lr:bv (bv->signal (bv 1 1)))
                                                               (lr:bv (bv->signal (bv 0 1))))))))
   (list (bv #b01 2))))
