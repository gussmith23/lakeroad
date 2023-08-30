#lang racket/base
(provide xilinx-ultrascale-plus-cfglut5)
(require (file "../signal.rkt"))
(require rosette)
(define xilinx-ultrascale-plus-cfglut5
  (λ (#:CDI
      (CDI (bv->signal (constant 'CDI (bitvector 1))))
      #:CE
      (CE (bv->signal (constant 'CE (bitvector 1))))
      #:CLK
      (CLK (bv->signal (constant 'CLK (bitvector 1))))
      #:I0
      (I0 (bv->signal (constant 'I0 (bitvector 1))))
      #:I1
      (I1 (bv->signal (constant 'I1 (bitvector 1))))
      #:I2
      (I2 (bv->signal (constant 'I2 (bitvector 1))))
      #:I3
      (I3 (bv->signal (constant 'I3 (bitvector 1))))
      #:I4
      (I4 (bv->signal (constant 'I4 (bitvector 1))))
      #:INIT
      (INIT (bv->signal (constant 'INIT (bitvector 32))))
      #:name
      (name ""))
    (let* ((merged-input-state-hash (list))
           (init-hash
            (append
             (list
              (cons
               (string->symbol (string-append name "state19"))
               (bv 1 (bitvector 1))))
             (append
              (list
               (cons
                (string->symbol (string-append name "state16"))
                (signal-value INIT)))
              (append
               (list
                (cons
                 (string->symbol (string-append name "state13"))
                 (signal-value INIT)))
               (list)))))
           (btor1 (bitvector 1))
           (btor2 CDI)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CDI)))
           (btor3 CE)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CE)))
           (btor4 CLK)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state CLK)))
           (btor5 I0)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state I0)))
           (btor6 I1)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state I1)))
           (btor7 I2)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state I2)))
           (btor8 I3)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state I3)))
           (btor9 I4)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state I4)))
           (btor10 (bitvector 32))
           (btor11 INIT)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state INIT)))
           (btor12 (bv->signal (bv 1667982708 (bitvector 32))))
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
                          (bv 0 32))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor15 (bv->signal (bv 0 (bitvector 32))))
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
                          (bv 0 32))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor18 (bv->signal (bv 1 (bitvector 1))))
           (btor19
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state19")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state19"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state19")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state19")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor21 (bitvector 2))
           (btor22
            (signal
             (concat (signal-value btor19) (signal-value btor4))
             (list)))
           (btor23
            (bv->signal
             (zero-extend (signal-value btor18) (bitvector 2))
             btor18))
           (btor24
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor23)))
             (list)))
           (btor25 (if (bitvector->bool (signal-value btor24)) btor16 btor13))
           (btor26
            (signal
             (extract 31 31 (signal-value btor25))
             (signal-state btor25)))
           (btor28
            (signal (concat (signal-value btor6) (signal-value btor5)) (list)))
           (btor29 (bitvector 3))
           (btor30
            (signal
             (concat (signal-value btor7) (signal-value btor28))
             (list)))
           (btor31 (bitvector 4))
           (btor32
            (signal
             (concat (signal-value btor8) (signal-value btor30))
             (list)))
           (btor33
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 32))
             btor32))
           (btor34
            (signal
             (bvlshr (signal-value btor25) (signal-value btor33))
             (list)))
           (btor35
            (signal (extract 0 0 (signal-value btor34)) (signal-state btor34)))
           (btor37
            (signal (concat (signal-value btor6) (signal-value btor5)) (list)))
           (btor38
            (signal
             (concat (signal-value btor7) (signal-value btor37))
             (list)))
           (btor39
            (signal
             (concat (signal-value btor8) (signal-value btor38))
             (list)))
           (btor40 (bitvector 5))
           (btor41
            (signal
             (concat (signal-value btor9) (signal-value btor39))
             (list)))
           (btor42
            (bv->signal
             (zero-extend (signal-value btor41) (bitvector 32))
             btor41))
           (btor43
            (signal
             (bvlshr (signal-value btor25) (signal-value btor42))
             (list)))
           (btor44
            (signal (extract 0 0 (signal-value btor43)) (signal-state btor43)))
           (btor46
            (bv->signal
             (zero-extend (signal-value btor25) (bitvector 32))
             btor25))
           (btor48 (bitvector 31))
           (btor49
            (signal
             (extract 30 0 (signal-value btor25))
             (signal-state btor25)))
           (btor50
            (signal
             (concat (signal-value btor49) (signal-value btor2))
             (list)))
           (btor51 (if (bitvector->bool (signal-value btor3)) btor50 btor25))
           (output-state
            (remove-duplicates
             (append
              (append
               (list
                (cons
                 (string->symbol (string-append name "state19"))
                 (cons
                  (signal-value btor4)
                  (if (assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state19")))
                    (add1
                     (cdr
                      (assoc-ref
                       merged-input-state-hash
                       (string->symbol (string-append name "state19")))))
                    0))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state16"))
                  (cons
                   (signal-value btor51)
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
                    (signal-value btor25)
                    (if (assoc-has-key?
                         merged-input-state-hash
                         (string->symbol (string-append name "state13")))
                      (add1
                       (cdr
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state13")))))
                      0))))
                 (list))))
              merged-input-state-hash)
             equal?
             #:key
             car)))
      (list
       (cons 'O5 (signal (signal-value btor35) output-state))
       (cons 'CDO (signal (signal-value btor26) output-state))
       (cons 'O6 (signal (signal-value btor44) output-state))))))