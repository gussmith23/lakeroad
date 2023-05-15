#lang racket/base
(provide xilinx-ultrascale-plus-cfglut5)
(require (file "/Users/vishalc/files/CS/research/lakeroad/racket/signal.rkt"))
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
      (I4 (bv->signal (constant 'I4 (bitvector 1)))))
    (let* ((merged-input-state-hash (list))
           (init-hash
            (append
             (list (cons 'state17 (bv 1 (bitvector 1))))
             (append
              (list (cons 'state14 (bv 0 (bitvector 32))))
              (append (list (cons 'state12 (bv 0 (bitvector 32)))) (list)))))
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
           (btor11 (bv->signal (bv 0 (bitvector 32))))
           (btor12
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state12)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state12)))
                     ((assoc-has-key? init-hash 'state12)
                      (bv->signal (assoc-ref init-hash 'state12)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 32))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor14
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state14)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state14)))
                     ((assoc-has-key? init-hash 'state14)
                      (bv->signal (assoc-ref init-hash 'state14)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 32))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor16 (bv->signal (bv 1 (bitvector 1))))
           (btor17
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state17)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state17)))
                     ((assoc-has-key? init-hash 'state17)
                      (bv->signal (assoc-ref init-hash 'state17)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor19 (bitvector 2))
           (btor20
            (signal
             (concat (signal-value btor17) (signal-value btor4))
             (list)))
           (btor21 (bv->signal (bv 1 (bitvector 2))))
           (btor22
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor21)))
             (list)))
           (btor23 (if (bitvector->bool (signal-value btor22)) btor14 btor12))
           (btor24
            (signal
             (extract 31 31 (signal-value btor23))
             (signal-state btor23)))
           (btor26
            (signal (concat (signal-value btor6) (signal-value btor5)) (list)))
           (btor27 (bitvector 3))
           (btor28
            (signal
             (concat (signal-value btor7) (signal-value btor26))
             (list)))
           (btor29 (bitvector 4))
           (btor30
            (signal
             (concat (signal-value btor8) (signal-value btor28))
             (list)))
           (btor31
            (bv->signal
             (zero-extend (signal-value btor30) (bitvector 32))
             btor30))
           (btor32
            (signal
             (bvlshr (signal-value btor23) (signal-value btor31))
             (list)))
           (btor33
            (signal (extract 0 0 (signal-value btor32)) (signal-state btor32)))
           (btor35
            (signal (concat (signal-value btor6) (signal-value btor5)) (list)))
           (btor36
            (signal
             (concat (signal-value btor7) (signal-value btor35))
             (list)))
           (btor37
            (signal
             (concat (signal-value btor8) (signal-value btor36))
             (list)))
           (btor38 (bitvector 5))
           (btor39
            (signal
             (concat (signal-value btor9) (signal-value btor37))
             (list)))
           (btor40
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 32))
             btor39))
           (btor41
            (signal
             (bvlshr (signal-value btor23) (signal-value btor40))
             (list)))
           (btor42
            (signal (extract 0 0 (signal-value btor41)) (signal-state btor41)))
           (btor44
            (bv->signal
             (zero-extend (signal-value btor23) (bitvector 32))
             btor23))
           (btor45 (bv->signal (bv 0 (bitvector 1))))
           (btor46
            (bv->signal
             (zero-extend (signal-value btor45) (bitvector 1))
             btor45))
           (btor48 (bitvector 31))
           (btor49
            (signal
             (extract 30 0 (signal-value btor23))
             (signal-state btor23)))
           (btor50
            (signal
             (concat (signal-value btor49) (signal-value btor2))
             (list)))
           (btor51 (if (bitvector->bool (signal-value btor3)) btor50 btor23)))
      (list
       (cons
        'O5
        (signal
         (signal-value btor33)
         (append
          (list (cons 'state17 (signal-value btor4)))
          (append
           (list (cons 'state14 (signal-value btor51)))
           (append (list (cons 'state12 (signal-value btor23))) (list))))))
       (cons
        'CDO
        (signal
         (signal-value btor24)
         (append
          (list (cons 'state17 (signal-value btor4)))
          (append
           (list (cons 'state14 (signal-value btor51)))
           (append (list (cons 'state12 (signal-value btor23))) (list))))))
       (cons
        'O6
        (signal
         (signal-value btor42)
         (append
          (list (cons 'state17 (signal-value btor4)))
          (append
           (list (cons 'state14 (signal-value btor51)))
           (append (list (cons 'state12 (signal-value btor23))) (list))))))))))

