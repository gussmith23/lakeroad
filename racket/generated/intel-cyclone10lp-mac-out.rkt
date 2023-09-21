#lang racket/base
(provide intel-cyclone10lp-mac-out)
(require "../signal.rkt")
(require rosette)
(define intel-cyclone10lp-mac-out
  (λ (#:aclr
      (aclr (bv->signal (constant 'aclr (bitvector 1))))
      #:clk
      (clk (bv->signal (constant 'clk (bitvector 1))))
      #:dataa
      (dataa (bv->signal (constant 'dataa (bitvector 36))))
      #:devclrn
      (devclrn (bv->signal (constant 'devclrn (bitvector 1))))
      #:devpor
      (devpor (bv->signal (constant 'devpor (bitvector 1))))
      #:ena
      (ena (bv->signal (constant 'ena (bitvector 1))))
      #:output_clock
      (output_clock (bv->signal (constant 'output_clock (bitvector 1))))
      #:name
      (name ""))
    (let* ((merged-input-state-hash (list))
           (init-hash
            (append
             (list
              (cons
               (string->symbol (string-append name "state24"))
               (bv 0 (bitvector 1))))
             (append
              (list
               (cons
                (string->symbol (string-append name "state16"))
                (bv 1 (bitvector 1))))
              (append
               (list
                (cons
                 (string->symbol (string-append name "state13"))
                 (bv 0 (bitvector 36))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state11"))
                  (bv 0 (bitvector 36))))
                (list))))))
           (btor1 (bitvector 1))
           (btor2 aclr)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state aclr)))
           (btor3 clk)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state clk)))
           (btor4 (bitvector 36))
           (btor5 dataa)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state dataa)))
           (btor6 devclrn)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state devclrn)))
           (btor7 devpor)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state devpor)))
           (btor8 ena)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state ena)))
           (btor9 output_clock)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state output_clock)))
           (btor10 (bv->signal (bv 0 (bitvector 36))))
           (btor11
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state11")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state11"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state11")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state11")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor13
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state13")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state13"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state13")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state13")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor15 (bv->signal (bv 1 (bitvector 1))))
           (btor16
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state16")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state16"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state16")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state16")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor18 (bitvector 2))
           (btor19
            (signal
             (concat (signal-value btor16) (signal-value btor3))
             (list)))
           (btor20
            (bv->signal
             (zero-extend (signal-value btor15) (bitvector 2))
             btor15))
           (btor21
            (signal
             (bool->bitvector
              (bveq (signal-value btor19) (signal-value btor20)))
             (list)))
           (btor22 (if (bitvector->bool (signal-value btor21)) btor13 btor11))
           (btor23 (bv->signal (bv 0 (bitvector 1))))
           (btor24
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state24")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state24"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state24")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state24")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor26 (if (bitvector->bool (signal-value btor24)) btor10 btor22))
           (btor27 (if (bitvector->bool (signal-value btor2)) btor10 btor26))
           (btor28 (if (bitvector->bool (signal-value btor9)) btor15 btor23))
           (btor29 (if (bitvector->bool (signal-value btor28)) btor27 btor5))
           (btor31
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 1))
             btor2))
           (btor32
            (bv->signal
             (zero-extend (signal-value btor3) (bitvector 1))
             btor3))
           (btor33
            (bv->signal
             (zero-extend (signal-value btor5) (bitvector 36))
             btor5))
           (btor34
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 36))
             btor29))
           (btor35
            (bv->signal
             (zero-extend (signal-value btor8) (bitvector 1))
             btor8))
           (btor36
            (bv->signal
             (zero-extend (signal-value btor27) (bitvector 36))
             btor27))
           (btor37
            (bv->signal
             (zero-extend (signal-value btor28) (bitvector 1))
             btor28))
           (btor39 (if (bitvector->bool (signal-value btor8)) btor5 btor27))
           (output-state
            (remove-duplicates
             (append
              (append
               (list
                (cons
                 (string->symbol (string-append name "state24"))
                 (cons
                  (signal-value btor2)
                  (if (assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state24")))
                    (add1
                     (cdr
                      (assoc-ref
                       merged-input-state-hash
                       (string->symbol (string-append name "state24")))))
                    0))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state16"))
                  (cons
                   (signal-value btor3)
                   (if (assoc-has-key?
                        merged-input-state-hash
                        (string->symbol (string-append name "state16")))
                     (add1
                      (cdr
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state16")))))
                     0))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state13"))
                   (cons
                    (signal-value btor39)
                    (if (assoc-has-key?
                         merged-input-state-hash
                         (string->symbol (string-append name "state13")))
                      (add1
                       (cdr
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state13")))))
                      0))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state11"))
                    (cons
                     (signal-value btor27)
                     (if (assoc-has-key?
                          merged-input-state-hash
                          (string->symbol (string-append name "state11")))
                       (add1
                        (cdr
                         (assoc-ref
                          merged-input-state-hash
                          (string->symbol (string-append name "state11")))))
                       0))))
                  (list)))))
              merged-input-state-hash)
             equal?
             #:key
             car)))
      (list (cons 'dataout (signal (signal-value btor29) output-state))))))
