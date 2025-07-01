#lang racket
;;; Synthesis routines for the various architectures.
;;;
;;; TODO provide a top-level synthesis procedure?

(provide rosette-synthesize)

(require "interpreter.rkt"
         rosette
         (prefix-in lr: "language.rkt")
         "architecture-description.rkt")

; Convert a simple Rosette bitvector expression to the list format expected by `rosette-synthesize`.
; - expr: A Rosette bitvector expression.
; - output-name: The name of the output port. This should be the same as the name of the output port
;     you'll use in the call to `rosette-synthesize`.
(define (convert-bv-expr-to-spec-list expr output-name)
  (list
   (lambda _ (void))
   ; output function just returns whatever is input; input should be expr!
   (lambda (in)
     (match in
       [(list (cons _ _)) in]
       [_
        (error
         "input to output-fn should be a list of the form (list (cons <output-name> <expr>)), as produced via the function defined below this message.")]))
   (lambda _ (void))
   (lambda _ (list (list (cons output-name expr)) 'this-should-not-be-used))))

;;; Returns a concrete Lakeroad expression, or #f if synthesis failed.
;;;
;;; Args:
;;; - spec: A list of functions and objects defining the spec to synthesize against:
;;;    1. input-fn: A function which takes inputs as an association list mapping strings to bitvectors
;;;                 and returns them in the form expected by the spec function.
;;;    2. output-fn: A function which takes the outputs returned by the spec function and returns them
;;;                  as an association list mapping strings to bitvectors.
;;;    3. initial-state: A struct representing the initial state values for the spec.
;;;    4. spec-fn: A function such that (spec-fn (input-fn ...) initial-state) returns
;;;                a (list out state), and furthermore that (output-fn out) is an association list
;;;                giving the expected outputs for the given inputs.
;;; - spec-envs/lr-expr-envs: Environments used to evaluate the bitvector and Lakeroad expressions.
;;;     A list of association lists. Each association list is the environment for one
;;;     call to the interpreter. The interpreter is called once for each association list, and the
;;;     state from each call is passed to the next call. The final bitvector expression is used for
;;;     synthesis.
;;; - inputs: A list of bitvectors to use as inputs to the spec function. These are used as the
;;;     forall inputs in synthesis.
;;; - module-semantics: The semantics of hardware modules. See the corresponding interpreter argument.
;;;   Module semantics mirror the values in the `spec` list.
;;; - assert-equal-on: A list of booleans the same legth as bv/lr-sequential, indicating which
;;;   evaluation stages' outputs we should make assertions over. #f means no assertion at this stage,
;;;   #t means an assertion at this stage. If #f, we default to making assertions only at the last
;;;   stage.
;;; - assumes: A list of Rosette expressions to assume.
;;; - output-ports: A list of output ports that will be asserted equal. Currently expected to be
;;;   length 1.
;;;   TODO(@gussmith23): Support synthesis of multiple output ports.
;;;   To implement this correctly, we will also need to change the sketches so that they don't get
;;;   the output port, i.e. they return the full hash map.
(define (rosette-synthesize spec
                            lr-expr
                            inputs
                            spec-envs
                            lr-expr-envs
                            output-ports
                            #:module-semantics [module-semantics '()]
                            #:assert-equal-on [assert-equal-on #f]
                            #:assumes [assumes '()])

  (when (not (equal? 1 (length output-ports)))
    (error "Currently exactly one output port is expected. See lakeroad/issues/503."))
  (define output-port (first output-ports))

  (when (empty? spec-envs)
    (error
     "spec-envs must not be empty. If you're using convert-bv-expr-to-spec-list, you should pass a list with one element: (list (list))"))
  (when (empty? lr-expr-envs)
    (error
     "lr-expr-envs must not be empty. If the expression has no variables, you should pass a list of one empty environment: (list (list))"))

  (match-define (list spec-input-fn spec-output-fn spec-initial-state spec-fn) spec)

  (when (not (equal? assert-equal-on #f))
    (when (not (and (equal? (length lr-expr-envs) (length spec-envs))
                    (equal? (length spec-envs) (length assert-equal-on))))
      (error "if not #f, assert-equal-on should be the same length as spec-envs and lr-expr-envs")))

  (define spec-evaluated
    (let* ([interpret-one-iter
            (lambda (this-iter-env prev-values)
              (match-let* ([(cons out state) (spec-fn (spec-input-fn this-iter-env)
                                                      ;;; Last iteration's state.
                                                      (second (first prev-values)))])
                (cons (list (spec-output-fn out) state) prev-values)))]
           [final-value (foldl interpret-one-iter (list (list 'unused spec-initial-state)) spec-envs)]
           ;;; Fold to get the list of values from each step; map to get the values and ignore the states,
           ;;; reverse to get the values in the right order (newest last); cdr to drop the
           ;;; initial value.
           [spec-evaluated (map first (drop (reverse final-value) 1))]

           ; TODO(#503): This logic should be colocated with similar logic for lr-expr-evaluated when we
           ; implement #503.
           [spec-evaluated
            (map (lambda (assoc-list)
                   (cdr (or (assoc output-port assoc-list)
                            (error (format "output ~a not found in ~a" output-port assoc-list)))))
                 spec-evaluated)])
      spec-evaluated))

  (define lr-expr-initial-state (generate-initial-state-map lr-expr module-semantics))

  ; TODO(#503): In the future, this should end up producing a list of hashmaps/assoc lists, which we
  ; then need to index using the output ports.
  (define lr-expr-evaluated
    (let* (;;; Interpret the Lakeroad expression once, using one of the environments from `envs`
           ;;; (stored in `this-iter-env`). `prev-values` are the values from the previous call to
           ;;; the interpreter, newest first.
           [interpret-one-iter (lambda (this-iter-env prev-values)
                                 (cons (interpret lr-expr
                                                  ; Last iteration's state.
                                                  (second (first prev-values))
                                                  #:module-semantics module-semantics
                                                  #:environment this-iter-env)
                                       prev-values))]
           [final-value
            (foldl interpret-one-iter (list (list 'unused lr-expr-initial-state)) lr-expr-envs)])
      (map first (drop (reverse final-value) 1))))

  (log-debug "spec-evaluated: ~a" spec-evaluated)
  (log-debug "lr-expr-evaluated: ~a" lr-expr-evaluated)

  ;;; This block of code should be restructured. Instead of running synthesis in here, this `define`
  ;;; should interpret the Lakeroad expression, and then synthesis should be moved to another define.
  (define soln
    (synthesize ;;; [this comment just helps force a prettier formatting]
     #:forall inputs
     #:guarantee ;;; [this comment just helps force a prettier formatting]
     (begin
       (for ([assumption assumes])
         (log-debug (format "Assuming: ~a" assumption))
         (assume assumption))
       (match assert-equal-on
         [#f
          (log-debug "asserting: ~a" (bveq (last spec-evaluated) (last lr-expr-evaluated)))
          ; TODO(@gussmith23): This is captured by Rosette, but we really want it to actually raise
          ; the error all the way to the user.
          ; (when (not (bveq (last spec-evaluated) (last lr-expr-evaluated)))
          ;   (error
          ;    (format
          ;     "spec and lakeroad-expr are trivially not equal. spec-evaluated:~n~a~nlr-expr-evaluated:~n~a"
          ;     spec-evaluated
          ;     lr-expr-evaluated)))
          (assert (bveq (last spec-evaluated) (last lr-expr-evaluated)))]
         [(list bools ...)
          (for ([i (in-range (length bools))])
            (when (list-ref bools i)
              (assert (bveq (list-ref spec-evaluated i) (list-ref lr-expr-evaluated i)))))]))))

  (if (sat? soln)
      (evaluate
       lr-expr
       ;;; Complete the solution: fill in any symbolic values that *aren't* the logical inputs.
       (complete-solution soln
                          (set->list (set-subtract (list->set (symbolics lr-expr))
                                                   (list->set (symbolics spec-evaluated))))))
      #f))

(module+ test
  (require rackunit)

  (test-case "sequential synthesis test"
    (begin

      ;;; Two-stage adder, taking two clock ticks to produce an output.
      (struct two-stage-adder-inputs (a b clk) #:transparent)
      (struct two-stage-adder-outputs (o) #:transparent)
      (struct two-stage-adder-state (old-a old-b old-clk) #:transparent)
      (define two-stage-adder-initial-state (two-stage-adder-state (bv 0 8) (bv 0 8) (bv 0 1)))
      (define (two-stage-adder inputs state)
        (let* ([clk (two-stage-adder-inputs-clk inputs)]
               [a (two-stage-adder-inputs-a inputs)]
               [b (two-stage-adder-inputs-b inputs)]
               [old-clk (two-stage-adder-state-old-clk state)]
               [old-a (two-stage-adder-state-old-a state)]
               [old-b (two-stage-adder-state-old-b state)]
               [clk-ticked (and (bveq clk (bv 1 1)) (bveq old-clk (bv 0 1)))]
               [new-a (if clk-ticked a old-a)]
               [new-b (if clk-ticked b old-b)]
               [out (two-stage-adder-outputs (bvadd old-a old-b))])
          (cons out (two-stage-adder-state new-a new-b clk))))
      ;;; Helper function used by the below tests.
      (define (make-env clk a b)
        (list (cons "a" a) (cons "b" b) (cons "clk" clk)))

      (define-symbolic a b (bitvector 8))

      ;;; The Lakeroad program just calls the two-stage adder and gets the O output.
      (define lr-expr
        (lr:hash-ref
         (lr:hw-module-instance "two-stage-adder"
                                "two-stage-adder"
                                (list (module-instance-port "a" (lr:bv a) 'input 8)
                                      (module-instance-port "b" (lr:bv b) 'input 8)
                                      (module-instance-port "clk" (lr:var "clk" 1) 'input 1)
                                      (module-instance-port "O" "O" 'output 8))
                                '()
                                "unused filepath")
         "O"))

      ;;; The next two checks test the `lr-sequential` argument to `rosette-synthesize`.

      ;;; Check: we *can't* synthesize an add with a single clock cycle.
      (check-false (rosette-synthesize
                    (convert-bv-expr-to-spec-list (bvadd a b) "O")
                    lr-expr
                    (list a b)
                    ; Empty, because we're using a simple bitvector expression.
                    (list (list))
                    ;;; Tick the clock once (eval with clk=0, eval with clk=1).
                    (list (make-env (bv 0 1) a b) (make-env (bv 1 1) a b))
                    ; output
                    (list "O")
                    #:module-semantics
                    (list (cons (cons "two-stage-adder" "unused filepath")
                                (list (lambda (in)
                                        (two-stage-adder-inputs (cdr (assoc "a" in))
                                                                (cdr (assoc "b" in))
                                                                (cdr (assoc "clk" in))))
                                      (lambda (out) (list (cons "O" (two-stage-adder-outputs-o out))))
                                      two-stage-adder-initial-state
                                      two-stage-adder)))))

      ;;; Check: we *can* successfully synthesize an add with two clock cycles.
      ;;;
      ;;; Note that "synthesis" here is actually equivalent to `verify` in Rosette, because there are
      ;;; no free symbolics to be solved for. So `rosette-synthesize` actually just verifies whether
      ;;; bv-expr == lr-expr for all inputs.
      (check-not-false (rosette-synthesize
                        (convert-bv-expr-to-spec-list (bvadd a b) "O")
                        lr-expr
                        (list a b)
                        ; Don't need to pass envs for bv-expr, as it's already evaluated.
                        (list '())
                        ;;; Tick the clock twice.
                        (list (make-env (bv 0 1) a b)
                              (make-env (bv 1 1) a b)
                              (make-env (bv 0 1) (bv 0 8) (bv 0 8))
                              (make-env (bv 1 1) (bv 0 8) (bv 0 8)))
                        (list "O")
                        #:module-semantics
                        (list (cons (cons "two-stage-adder" "unused filepath")
                                    (list (lambda (in)
                                            (two-stage-adder-inputs (cdr (assoc "a" in))
                                                                    (cdr (assoc "b" in))
                                                                    (cdr (assoc "clk" in))))
                                          (lambda (out)
                                            (list (cons "O" (two-stage-adder-outputs-o out))))
                                          two-stage-adder-initial-state
                                          two-stage-adder)))))

      ;;; The next check tests the `bv-sequential` argument to `rosette-synthesize`.

      ;;; Two-stage adder that does its add on the first clock tick. This will serve as our `bv-expr`
      ;;; input to synthesis. It's just a different way to implement the same adder. We could have also
      ;;; made it one stage or three stages.
      (struct two-stage-adder-2-state (old-sum old-clk) #:transparent)
      (define (two-stage-adder-2 inputs state)
        (let* ([clk (two-stage-adder-inputs-clk inputs)]
               [a (two-stage-adder-inputs-a inputs)]
               [b (two-stage-adder-inputs-b inputs)]
               [old-clk (two-stage-adder-2-state-old-clk state)]
               [old-sum (two-stage-adder-2-state-old-sum state)]
               [sum (bvadd a b)]
               [clk-ticked (and (bveq clk (bv 1 1)) (bveq old-clk (bv 0 1)))]
               [new-sum (if clk-ticked sum old-sum)]
               [out (two-stage-adder-outputs old-sum)])
          (cons out (two-stage-adder-2-state new-sum clk))))
      (define two-stage-adder-2-initial-state (two-stage-adder-2-state (bv 0 8) (bv 0 1)))

      ;;; Check that we can successfully "synthesize" (same note as above re: "synthesis" being
      ;;; equivalent to verification in this case) a Lakeroad expression that implements our
      ;;; `two-stage-adder-2` spec.
      (check-not-false
       (rosette-synthesize
        (list
         (lambda (in)
           (two-stage-adder-inputs (cdr (assoc "a" in)) (cdr (assoc "b" in)) (cdr (assoc "clk" in))))
         (lambda (out) (list (cons "O" (two-stage-adder-outputs-o out))))
         two-stage-adder-2-initial-state
         two-stage-adder-2)
        lr-expr
        (list a b)
        ;;; Tick the clock twice, on both designs.
        (list (make-env (bv 0 1) a b)
              (make-env (bv 1 1) a b)
              (make-env (bv 0 1) (bv 0 8) (bv 0 8))
              (make-env (bv 1 1) (bv 0 8) (bv 0 8)))
        (list (make-env (bv 0 1) a b)
              (make-env (bv 1 1) a b)
              (make-env (bv 0 1) (bv 0 8) (bv 0 8))
              (make-env (bv 1 1) (bv 0 8) (bv 0 8)))
        (list "O")
        #:module-semantics
        (list (cons (cons "two-stage-adder" "unused filepath")
                    (list (lambda (in)
                            (two-stage-adder-inputs (cdr (assoc "a" in))
                                                    (cdr (assoc "b" in))
                                                    (cdr (assoc "clk" in))))
                          (lambda (out) (list (cons "O" (two-stage-adder-outputs-o out))))
                          two-stage-adder-initial-state
                          two-stage-adder)))))

      ;;; If you don't tick the clock twice on the `bv-expr`, then the synthesis will fail.
      (check-false (rosette-synthesize
                    (list (lambda (in)
                            (two-stage-adder-inputs (cdr (assoc "a" in))
                                                    (cdr (assoc "b" in))
                                                    (cdr (assoc "clk" in))))
                          (lambda (out) (list (cons "O" (two-stage-adder-outputs-o out))))
                          two-stage-adder-2-initial-state
                          two-stage-adder-2)
                    lr-expr
                    (list a b)
                    (list (make-env (bv 0 1) a b) (make-env (bv 1 1) a b))
                    (list (make-env (bv 0 1) a b)
                          (make-env (bv 1 1) a b)
                          (make-env (bv 0 1) (bv 0 8) (bv 0 8))
                          (make-env (bv 1 1) (bv 0 8) (bv 0 8)))
                    (list "O")
                    #:module-semantics
                    (list (cons (cons "two-stage-adder" "unused filepath")
                                (list (lambda (in)
                                        (two-stage-adder-inputs (cdr (assoc "a" in))
                                                                (cdr (assoc "b" in))
                                                                (cdr (assoc "clk" in))))
                                      (lambda (out) (list (cons "O" (two-stage-adder-outputs-o out))))
                                      two-stage-adder-initial-state
                                      two-stage-adder))))))))
