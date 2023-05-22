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
      (I4 (bv->signal (constant 'I4 (bitvector 1))))
      #:INIT
      (INIT (bv->signal (constant 'INIT (bitvector 32)))))
    (let* ((merged-input-state-hash (list))
           (init-hash (list))
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
           (btor13
            (signal
             (extract 31 31 (signal-value btor12))
             (signal-state btor12)))
           (btor15 (bitvector 2))
           (btor16
            (signal (concat (signal-value btor6) (signal-value btor5)) (list)))
           (btor17 (bitvector 3))
           (btor18
            (signal
             (concat (signal-value btor7) (signal-value btor16))
             (list)))
           (btor19 (bitvector 4))
           (btor20
            (signal
             (concat (signal-value btor8) (signal-value btor18))
             (list)))
           (btor21
            (bv->signal
             (zero-extend (signal-value btor20) (bitvector 32))
             btor20))
           (btor22
            (signal
             (bvlshr (signal-value btor12) (signal-value btor21))
             (list)))
           (btor23
            (signal (extract 0 0 (signal-value btor22)) (signal-state btor22)))
           (btor25
            (signal (concat (signal-value btor6) (signal-value btor5)) (list)))
           (btor26
            (signal
             (concat (signal-value btor7) (signal-value btor25))
             (list)))
           (btor27
            (signal
             (concat (signal-value btor8) (signal-value btor26))
             (list)))
           (btor28 (bitvector 5))
           (btor29
            (signal
             (concat (signal-value btor9) (signal-value btor27))
             (list)))
           (btor30
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 32))
             btor29))
           (btor31
            (signal
             (bvlshr (signal-value btor12) (signal-value btor30))
             (list)))
           (btor32
            (signal (extract 0 0 (signal-value btor31)) (signal-state btor31)))
           (btor34
            (bv->signal
             (zero-extend (signal-value btor12) (bitvector 32))
             btor12))
           (btor35 (bv->signal (bv 1 (bitvector 1))))
           (btor36
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35)))
      (list
       (cons
        'O5
        (signal
         (signal-value btor23)
         (append (list (cons 'state12 (signal-value btor12))) (list))))
       (cons
        'CDO
        (signal
         (signal-value btor13)
         (append (list (cons 'state12 (signal-value btor12))) (list))))
       (cons
        'O6
        (signal
         (signal-value btor32)
         (append (list (cons 'state12 (signal-value btor12))) (list))))))))