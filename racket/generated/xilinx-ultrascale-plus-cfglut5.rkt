
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
      
      #:NAME [name ""])
    (let* ((merged-input-state-hash (list))
           (init-hash
            (append
             (list (cons (string->symbol (string-append name 'state18)) (bv 1 (bitvector 1))))
             (append
              (list (cons (string->symbol (string-append name 'state15)) (signal-value INIT)))
              (append
               (list (cons (string->symbol (string-append name 'state13)) (signal-value INIT)))
               (list)))))
           (btor1 (bitvector 1))
           (btor2 CDI)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CDI)))
           (btor3 CE)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CE)))
           (btor4 CLK)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state CLK)))
           (btor5 I0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state I0)))
           (btor6 I1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state I1)))
           (btor7 I2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state I2)))
           (btor8 I3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state I3)))
           (btor9 I4)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state I4)))
           (btor10 (bitvector 32))
           (btor11 INIT)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state INIT)))
           (btor12 (bv->signal (bv 1667982708 (bitvector 32))))
           (btor13
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash (string->symbol (string-append name 'state13)))
                      (bv->signal
                       (assoc-ref merged-input-state-hash (string->symbol (string-append name 'state13)))))
                     ((assoc-has-key? init-hash (string->symbol (string-append name 'state13)))
                      (bv->signal (assoc-ref init-hash (string->symbol (string-append name 'state13)))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 32))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor15
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash (string->symbol (string-append name 'state15)))
                      (bv->signal
                       (assoc-ref merged-input-state-hash (string->symbol (string-append name 'state15)))))
                     ((assoc-has-key? init-hash (string->symbol (string-append name 'state15)))
                      (bv->signal (assoc-ref init-hash (string->symbol (string-append name 'state15)))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 32))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor17 (bv->signal (bv 1 (bitvector 1))))
           (btor18
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash (string->symbol (string-append name 'state18)))
                      (bv->signal
                       (assoc-ref merged-input-state-hash (string->symbol (string-append name 'state18)))))
                     ((assoc-has-key? init-hash (string->symbol (string-append name 'state18)))
                      (bv->signal (assoc-ref init-hash (string->symbol (string-append name 'state18)))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor20 (bitvector 2))
           (btor21
            (signal
             (concat (signal-value btor4) (signal-value btor18))
             (list)))
           (btor22 (bv->signal (bv 2 (bitvector 2))))
           (btor23
            (signal
             (bool->bitvector
              (bveq (signal-value btor21) (signal-value btor22)))
             (list)))
           (btor24 (if (bitvector->bool (signal-value btor23)) btor15 btor13))
           (btor25
            (signal
             (extract 31 31 (signal-value btor24))
             (signal-state btor24)))
           (btor27
            (signal (concat (signal-value btor6) (signal-value btor5)) (list)))
           (btor28 (bitvector 3))
           (btor29
            (signal
             (concat (signal-value btor7) (signal-value btor27))
             (list)))
           (btor30 (bitvector 4))
           (btor31
            (signal
             (concat (signal-value btor8) (signal-value btor29))
             (list)))
           (btor32
            (bv->signal
             (zero-extend (signal-value btor31) (bitvector 32))
             btor31))
           (btor33
            (signal
             (bvlshr (signal-value btor24) (signal-value btor32))
             (list)))
           (btor34
            (signal (extract 0 0 (signal-value btor33)) (signal-state btor33)))
           (btor36
            (signal (concat (signal-value btor6) (signal-value btor5)) (list)))
           (btor37
            (signal
             (concat (signal-value btor7) (signal-value btor36))
             (list)))
           (btor38
            (signal
             (concat (signal-value btor8) (signal-value btor37))
             (list)))
           (btor39 (bitvector 5))
           (btor40
            (signal
             (concat (signal-value btor9) (signal-value btor38))
             (list)))
           (btor41
            (bv->signal
             (zero-extend (signal-value btor40) (bitvector 32))
             btor40))
           (btor42
            (signal
             (bvlshr (signal-value btor24) (signal-value btor41))
             (list)))
           (btor43
            (signal (extract 0 0 (signal-value btor42)) (signal-state btor42)))
           (btor45
            (bv->signal
             (zero-extend (signal-value btor24) (bitvector 32))
             btor24))
           (btor47 (bitvector 31))
           (btor48
            (signal
             (extract 30 0 (signal-value btor24))
             (signal-state btor24)))
           (btor49
            (signal
             (concat (signal-value btor48) (signal-value btor2))
             (list)))
           (btor50 (if (bitvector->bool (signal-value btor3)) btor49 btor24)))
      (list
       (cons
        'O5
        (signal
         (signal-value btor34)
         (append
          (list (cons (string->symbol (string-append name 'state18)) (signal-value btor4)))
          (append
           (list (cons (string->symbol (string-append name 'state15)) (signal-value btor50)))
           (append (list (cons (string->symbol (string-append name 'state13)) (signal-value btor24))) (list))))))
       (cons
        'CDO
        (signal
         (signal-value btor25)
         (append
          (list (cons (string->symbol (string-append name 'state18)) (signal-value btor4)))
          (append
           (list (cons (string->symbol (string-append name 'state15)) (signal-value btor50)))
           (append (list (cons (string->symbol (string-append name 'state13)) (signal-value btor24))) (list))))))
       (cons
        'O6
        (signal
         (signal-value btor43)
         (append
          (list (cons (string->symbol (string-append name 'state18)) (signal-value btor4)))
          (append
           (list (cons (string->symbol (string-append name 'state15)) (signal-value btor50)))
           (append (list (cons (string->symbol (string-append name 'state13)) (signal-value btor24))) (list))))))))))