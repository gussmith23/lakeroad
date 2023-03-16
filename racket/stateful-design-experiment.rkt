#lang racket
;;; In this file, I experiment with representing circuit state. I do so using the "signal" struct,
;;; which can be thought of as a wrapper over a Rosette bitvector, which carries along with it some
;;; hidden state. I think this may be a monad-ish idea...?

;;; (provide signal
;;;          signal?
;;;          bv->signal
;;;          signal-value
;;;          signal-state
;;;          merge-state)

(require rosette
         racket/hash
         "./signal.rkt")

;;; value: (bv?). Represents the outwardly visible value tied to this signal.
;;;
;;; state: hash map of identifiers (strings? symbols?) to (bv?). Represents the internal
;;; state tied to this signal.
;;;
;;; TODO(@gussmith): We rely heavily on hash tables for this implementation. Hash tables are not
;;; lifted in Rosette, and thus we have to be very careful with them. In general, I think these are
;;; the rules to obey when using hash tables in Rosette:
;;; - Only use immutable hash tables.
;;; - Keys should never be symbolic. They should always be concrete.

;;; Lift bitvector into signal, optionally taking the state from an existing signal.
;;; (define (bv->signal bv [with-state-from (signal '() (hash))])
;;;   (signal bv (signal-state with-state-from)))

;;; Gets state from a signal.
;;; (define (signal-state-value signal k)
;;;   (hash-ref (signal-state signal) k))


;;; New interpreter definition over signals.
(define (experimental-interpreter expr)
  (match expr
    ;;; Pass signals through.
    [(? signal?) expr]
    ;;; Lift bitvectors to signals.
    [(? bv?) (bv->signal expr)]))

(module+ test
  (let ([s (bv->signal (bv 0 1))]) (check-equal? (experimental-interpreter s) s))
  (let ([b (bv 0 1)]) (check-equal? (experimental-interpreter b) (bv->signal b))))

;;; Helper to detect a rising edge. old and current are the old and current values (bitvectors).
(define (rising-edge old current)
  (and (bvzero? old) (not (bvzero? current))))

;;; The define-bounded syntax rule helps us "finitize" in Rosette, described in here:
;;; https://docs.racket-lang.org/rosette-guide/ch_essentials.html
;;; See 2.4.3.
;;; fuel determines the maximum depth we will attempt.
(define fuel (make-parameter 10))
(define-syntax-rule (define-bounded (id param ...) body ...)
  (define (id param ...)
    (assert (> (fuel) 0) "Out of fuel.")
    (parameterize ([fuel (sub1 (fuel))])
      body ...)))

(module+ test
  (require rosette/solver/smt/boolector
           rackunit
           rosette)
  (current-solver (boolector))

  ;;; Simple counter.
  (define (counter clk)
    ;;; we need a way to check previous state while also having current state.
    ;;; oh, i guess the clock is technically an input, huh?

    (let* (;
           ;;; TODO(@gussmith23): How to handle default state? (see below)
           [old-clk
            (if (hash-has-key? (signal-state clk) 'clk) (signal-state-value clk 'clk) (bv 0 1))]
           [current-clk (signal-value clk)]
           ;;; Clock "ticks" when we have a rising edge (0->1) on the clock.
           [clock-ticked (rising-edge old-clk current-clk)]
           ;;; Old counter value.
           ;;;
           ;;; TODO: what if there are multiple inputs? Where do we draw the old state from?
           ;;;
           ;;; TODO(@gussmith23): How to handle default/init values? These are explicitly specified
           ;;; in Verilog, so we should probably have a norm for handling them here.
           [old-counter
            (if (hash-has-key? (signal-state clk) 'counter)
                (signal-state-value clk 'counter)
                ;;; Defaulting to an 8-bit counter. Ideally bitwidth would be parameterizable.
                (bv 0 8))]
           ;;; Counter increases when the clock ticks.
           [new-counter (if clock-ticked (bvadd1 old-counter) old-counter)]
           ;;; Output is the new counter, wrapped in a signal, with the signals states being the
           ;;; current clock value and the new counter value.
           ;;;
           ;;; TODO(@gussmith23): Easy way to shoot yourself in the foot is to forget to pass out
           ;;; the necessary state. However, in that case, the state just won't exist, which is an
           ;;; easy error to catch and fix. It's better than accidentally passing out the wrong
           ;;; state (e.g. passing old-clk or old-counter here, which seems unlikely.)
           [out (signal new-counter (hash 'clk current-clk 'counter new-counter))])
      out))

  (test-case
   "Ticking a counter manually"
   (begin ;

     (let* ([out0 (experimental-interpreter (counter (bv->signal (bv 0 1))))]
            [out1 (experimental-interpreter (counter (bv->signal (bv 0 1) out0)))]
            ;;; TODO(@gussmith23): Potential footgun: Have to remember to use the right with-state-from
            ;;; signal. E.g. here we have to make sure to use out1 and not out0.
            [out2 (experimental-interpreter (counter (bv->signal (bv 0 1) out1)))]
            [out3 (experimental-interpreter (counter (bv->signal (bv 1 1) out2)))]
            [out4 (experimental-interpreter (counter (bv->signal (bv 1 1) out3)))]
            [out5 (experimental-interpreter (counter (bv->signal (bv 1 1) out4)))]
            [out6 (experimental-interpreter (counter (bv->signal (bv 0 1) out5)))]
            [out7 (experimental-interpreter (counter (bv->signal (bv 1 1) out6)))]
            [out8 (experimental-interpreter (counter (bv->signal (bv 0 1) out7)))]
            [out9 (experimental-interpreter (counter (bv->signal (bv 1 1) out8)))])

       (check-equal? out0 (signal (bv 0 8) (hash 'clk (bv 0 1) 'counter (bv 0 8))))
       (check-equal? out1 (signal (bv 0 8) (hash 'clk (bv 0 1) 'counter (bv 0 8))))
       (check-equal? out2 (signal (bv 0 8) (hash 'clk (bv 0 1) 'counter (bv 0 8))))
       (check-equal? out3 (signal (bv 1 8) (hash 'clk (bv 1 1) 'counter (bv 1 8))))
       (check-equal? out4 (signal (bv 1 8) (hash 'clk (bv 1 1) 'counter (bv 1 8))))
       (check-equal? out5 (signal (bv 1 8) (hash 'clk (bv 1 1) 'counter (bv 1 8))))
       (check-equal? out6 (signal (bv 1 8) (hash 'clk (bv 0 1) 'counter (bv 1 8))))
       (check-equal? out7 (signal (bv 2 8) (hash 'clk (bv 1 1) 'counter (bv 2 8))))
       (check-equal? out8 (signal (bv 2 8) (hash 'clk (bv 0 1) 'counter (bv 2 8))))
       (check-equal? out9 (signal (bv 3 8) (hash 'clk (bv 1 1) 'counter (bv 3 8)))))))

  (test-case
   "Simple synthesis: how many cycles to get the expected output?"
   (begin ;

     ;;; Tick the counter n times. previous-value is the previous return value of the counter, which
     ;;; defaults to the initial result of a counter.
     ;;;
     ;;; TODO(@gussmith23): defaulting to an empty signal is weird.
     ;;;
     ;;; TODO(@gussmith23): Ticking a clock will be a common pattern; it'd be nice to have a helper
     ;;; function for it.
     (define-bounded (tick-counter n [previous-value (counter (bv->signal (bv 0 1)))])
                     (if (bvzero? n)
                         ;;; If we've run all requested ticks, return the previous value.
                         previous-value
                         ;;; Else, recurse.
                         (let* ([out0 (counter (bv->signal (bv 0 1) previous-value))]
                                [out1 (counter (bv->signal (bv 1 1) out0))])
                           (tick-counter (bvsub1 n) out1))))

     (check-equal? (signal-value (experimental-interpreter (tick-counter (bv 8 8)))) (bv 8 8))

     ;;; Now let's do synthesis over the number of clock ticks! Here, we'll ask Rosette to figure out
     ;;; how many clock ticks it takes to achieve the desired state.

     ;;; The number of clock ticks to run. Note: it's symbolic!
     (define bw 8)
     (define-symbolic clock-ticks (bitvector bw))

     ;;; To get the counter to 0, we need 0 clock ticks.
     (check-equal?
      (evaluate clock-ticks
                (solve (begin
                         (assert (bveq (bv 0 8) (signal-value (tick-counter clock-ticks)))))))
      (bv 0 bw))

     ;;; To get the counter to 9, we need 9 clock ticks.
     (check-equal?
      (evaluate clock-ticks
                (solve (begin
                         (assert (bveq (bv 9 8) (signal-value (tick-counter clock-ticks)))))))
      (bv 9 bw))))

  ;;; (Simulated) pipelined multiplier, that gives its output in 3 cycles.
  (define (pipelined-multiplier clk a b)
    (let* (;
           [merged-state (merge-state (list clk a b))]
           [old-clk (if (hash-has-key? merged-state 'clk) (hash-ref merged-state 'clk) (bv 0 1))]
           [current-clk (signal-value clk)]
           [clock-ticked (rising-edge old-clk current-clk)]
           [old-pipeline-register-0 (if (hash-has-key? merged-state 'pipeline-register-0)
                                        (hash-ref merged-state 'pipeline-register-0)
                                        (bv 0 8))]
           [old-pipeline-register-1 (if (hash-has-key? merged-state 'pipeline-register-1)
                                        (hash-ref merged-state 'pipeline-register-1)
                                        (bv 0 8))]
           [old-pipeline-register-2 (if (hash-has-key? merged-state 'pipeline-register-0)
                                        (hash-ref merged-state 'pipeline-register-2)
                                        (bv 0 8))]
           [new-pipeline-register-0
            (if clock-ticked (bvmul (signal-value a) (signal-value b)) old-pipeline-register-0)]
           [new-pipeline-register-1 (if clock-ticked old-pipeline-register-0 old-pipeline-register-1)]
           [new-pipeline-register-2 (if clock-ticked old-pipeline-register-1 old-pipeline-register-2)]
           [out (signal new-pipeline-register-2
                        (hash 'clk
                              current-clk
                              'pipeline-register-0
                              new-pipeline-register-0
                              'pipeline-register-1
                              new-pipeline-register-1
                              'pipeline-register-2
                              new-pipeline-register-2))])
      out))

  (test-case
   "Figuring out how many cycles it takes to get the output from a pipelined multiplier"
   (begin ;

     ;;; Tick the counter n times. previous-value is the previous return value of the counter, which
     ;;; defaults to the initial result of a counter.
     ;;;
     ;;; TODO(@gussmith23): defaulting to an empty signal is weird.
     ;;;
     ;;; TODO(@gussmith23): Ticking a clock will be a common pattern; it'd be nice to have a helper
     ;;; function for it.
     (define-bounded (tick-clock n
                                 [a (bv 0 8)]
                                 [b (bv 0 8)]
                                 #:previous-value [previous-value
                                                   (pipelined-multiplier (bv->signal (bv 0 1))
                                                                         (bv->signal (bv 0 8))
                                                                         (bv->signal (bv 0 8)))])
                     (if (bvzero? n)
                         ;;; If we've run all requested ticks, return the previous value.
                         previous-value
                         ;;; Else, recurse.
                         (let* ([out0 (pipelined-multiplier (bv->signal (bv 0 1) previous-value)
                                                            (bv->signal a)
                                                            (bv->signal b))]
                                [out1 (pipelined-multiplier (bv->signal (bv 1 1) out0)
                                                            (bv->signal a)
                                                            (bv->signal b))])
                           (tick-clock (bvsub1 n) #:previous-value out1))))

     (check-equal? (signal-value (experimental-interpreter (tick-clock (bv 0 8) (bv 8 8) (bv 2 8))))
                   (bv 0 8))
     (check-equal? (signal-value (experimental-interpreter (tick-clock (bv 1 8) (bv 8 8) (bv 2 8))))
                   (bv 0 8))
     (check-equal? (signal-value (experimental-interpreter (tick-clock (bv 2 8) (bv 8 8) (bv 2 8))))
                   (bv 0 8))
     (check-equal? (signal-value (experimental-interpreter (tick-clock (bv 3 8) (bv 8 8) (bv 2 8))))
                   (bv 16 8))

     ;;; Now let's do synthesis over the number of clock ticks! Here, we'll ask Rosette to figure out
     ;;; how many clock ticks it takes to do a multiply with this multiplier.

     ;;; The number of clock ticks to run. Note: it's symbolic!
     (define bw 8)
     (define-symbolic clock-ticks (bitvector bw))
     (define-symbolic a b (bitvector 8))

     ;;; Ask Rosette: how many clock-ticks do we need such that the output of the multiplier is always
     ;;; a*b (for any a and b) after clock-ticks cycles? The answer is 3!
     (check-equal?
      (evaluate clock-ticks
                (synthesize #:forall (list a b)
                            #:guarantee (begin
                                          (assert (bveq (bvmul a b)
                                                        (signal-value
                                                         (tick-clock clock-ticks a b)))))))
      (bv 3 bw))))

  ;; (Simulated) Bit Serial Adder
  (define (bit-serial-adder clk a b)
    (let* (;
           [merged-state (merge-state (list clk a b))]
           [old-clk (if (hash-has-key? merged-state 'clk) (hash-ref merged-state 'clk) (bv 0 1))]
           [current-clk (signal-value clk)]
           [clock-ticked (rising-edge old-clk current-clk)]
           [current-a (signal-value a)]
           [current-b (signal-value b)]
           [rst-reg (if (hash-has-key? merged-state 'rst) (hash-ref merged-state 'rst) (bv 0 1))]
           [carry-reg
            (if (hash-has-key? merged-state 'carry) (hash-ref merged-state 'carry) (bv 0 1))]
           [new-rst-reg
            (if clock-ticked (concat (bvxor carry-reg current-a current-b) rst-reg) rst-reg)]
           [new-carry-reg (if clock-ticked
                              (bvor (bvand current-a current-b)
                                    (bvand carry-reg current-a)
                                    (bvand carry-reg current-b))
                              carry-reg)]
           [out (signal new-rst-reg (hash 'clk current-clk 'rst new-rst-reg 'carry new-carry-reg))])
      out))

  (test-case
   "Test bit-serial adder"
   (begin ;
     ;;;
     (define-bounded
      (tick-clock n a b #:previous-value [previous-value (bv->signal (bv 0 1))])
      (if (= n 0)
          previous-value
          (let* ([out0 (bit-serial-adder (bv->signal (bv 0 1) previous-value)
                                         (bv->signal (lsb a))
                                         (bv->signal (lsb b)))]
                 [out1 (bit-serial-adder (bv->signal (bv 1 1) out0)
                                         (bv->signal (lsb a))
                                         (bv->signal (lsb b)))])
            (tick-clock (- n 1) (rotate-right 1 a) (rotate-right 1 b) #:previous-value out1))))
     (check-equal? (signal-value (experimental-interpreter (tick-clock 8 (bv 7 8) (bv 8 8))))
                   (concat (bv 15 8) (bv 0 1)))
     (check-equal? (signal-value (experimental-interpreter (tick-clock 8 (bv 5 8) (bv 6 8))))
                   (concat (bv 11 8) (bv 0 1)))
     (check-equal? (signal-value (experimental-interpreter (tick-clock 8 (bv 64 8) (bv 16 8))))
                   (concat (bv 80 8) (bv 0 1))))))
