#lang racket/base
(provide intel-cyclone10lp-mac-mult)
(require "../signal.rkt")
(require rosette)
(define intel-cyclone10lp-mac-mult
  (λ (#:aclr
      (aclr (bv->signal (constant 'aclr (bitvector 1))))
      #:clk
      (clk (bv->signal (constant 'clk (bitvector 1))))
      #:dataa
      (dataa (bv->signal (constant 'dataa (bitvector 18))))
      #:dataa_clock
      (dataa_clock (bv->signal (constant 'dataa_clock (bitvector 1))))
      #:datab
      (datab (bv->signal (constant 'datab (bitvector 18))))
      #:datab_clock
      (datab_clock (bv->signal (constant 'datab_clock (bitvector 1))))
      #:devclrn
      (devclrn (bv->signal (constant 'devclrn (bitvector 1))))
      #:devpor
      (devpor (bv->signal (constant 'devpor (bitvector 1))))
      #:ena
      (ena (bv->signal (constant 'ena (bitvector 1))))
      #:signa
      (signa (bv->signal (constant 'signa (bitvector 1))))
      #:signa_clock
      (signa_clock (bv->signal (constant 'signa_clock (bitvector 1))))
      #:signb
      (signb (bv->signal (constant 'signb (bitvector 1))))
      #:signb_clock
      (signb_clock (bv->signal (constant 'signb_clock (bitvector 1))))
      #:name
      (name ""))
    (let* ((merged-input-state-hash (list))
           (init-hash
            (append
             (list
              (cons
               (string->symbol (string-append name "state65"))
               (bv 0 (bitvector 1))))
             (append
              (list
               (cons
                (string->symbol (string-append name "state63"))
                (bv 0 (bitvector 1))))
              (append
               (list
                (cons
                 (string->symbol (string-append name "state55"))
                 (bv 0 (bitvector 18))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state53"))
                  (bv 0 (bitvector 18))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state40"))
                   (bv 0 (bitvector 1))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state38"))
                    (bv 0 (bitvector 1))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state31"))
                     (bv 0 (bitvector 1))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state23"))
                      (bv 1 (bitvector 1))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state20"))
                       (bv 0 (bitvector 18))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state18"))
                        (bv 0 (bitvector 18))))
                      (list))))))))))))
           (btor1 (bitvector 1))
           (btor2 aclr)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state aclr)))
           (btor3 clk)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state clk)))
           (btor4 (bitvector 18))
           (btor5 dataa)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state dataa)))
           (btor6 dataa_clock)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state dataa_clock)))
           (btor7 datab)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state datab)))
           (btor8 datab_clock)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state datab_clock)))
           (btor9 devclrn)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state devclrn)))
           (btor10 devpor)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state devpor)))
           (btor11 ena)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state ena)))
           (btor12 signa)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state signa)))
           (btor13 signa_clock)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state signa_clock)))
           (btor14 signb)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state signb)))
           (btor15 signb_clock)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state signb_clock)))
           (btor16 (bitvector 36))
           (btor17 (bv->signal (bv 0 (bitvector 18))))
           (btor18
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state18")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state18"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state18")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state18")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor20
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state20")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state20"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state20")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state20")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor22 (bv->signal (bv 1 (bitvector 1))))
           (btor23
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state23")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state23"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state23")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state23")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor25 (bitvector 2))
           (btor26
            (signal
             (concat (signal-value btor23) (signal-value btor3))
             (list)))
           (btor27
            (bv->signal
             (zero-extend (signal-value btor22) (bitvector 2))
             btor22))
           (btor28
            (signal
             (bool->bitvector
              (bveq (signal-value btor26) (signal-value btor27)))
             (list)))
           (btor29 (if (bitvector->bool (signal-value btor28)) btor20 btor18))
           (btor30 (bv->signal (bv 0 (bitvector 1))))
           (btor31
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state31")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state31"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state31")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state31")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor33 (if (bitvector->bool (signal-value btor31)) btor17 btor29))
           (btor34 (if (bitvector->bool (signal-value btor2)) btor17 btor33))
           (btor35 (if (bitvector->bool (signal-value btor6)) btor22 btor30))
           (btor36 (if (bitvector->bool (signal-value btor35)) btor34 btor5))
           (btor37 (signal (bvneg (signal-value btor36)) (list)))
           (btor38
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state38")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state38"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state38")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state38")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor40
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state40")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state40"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state40")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state40")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor42 (if (bitvector->bool (signal-value btor28)) btor40 btor38))
           (btor43 (if (bitvector->bool (signal-value btor31)) btor30 btor42))
           (btor44 (if (bitvector->bool (signal-value btor2)) btor30 btor43))
           (btor45 (if (bitvector->bool (signal-value btor13)) btor22 btor30))
           (btor46 (if (bitvector->bool (signal-value btor45)) btor44 btor12))
           (btor47 (signal (bvnot (signal-value btor46)) (list)))
           (btor48
            (signal
             (extract 17 17 (signal-value btor36))
             (signal-state btor36)))
           (btor49 (signal (bvnot (signal-value btor48)) (list)))
           (btor50
            (signal (bvor (signal-value btor47) (signal-value btor49)) (list)))
           (btor51 (if (bitvector->bool (signal-value btor50)) btor36 btor37))
           (btor52
            (bv->signal
             (zero-extend (signal-value btor51) (bitvector 36))
             btor51))
           (btor53
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state53")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state53"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state53")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state53")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor55
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state55")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state55"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state55")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state55")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor57 (if (bitvector->bool (signal-value btor28)) btor55 btor53))
           (btor58 (if (bitvector->bool (signal-value btor31)) btor17 btor57))
           (btor59 (if (bitvector->bool (signal-value btor2)) btor17 btor58))
           (btor60 (if (bitvector->bool (signal-value btor8)) btor22 btor30))
           (btor61 (if (bitvector->bool (signal-value btor60)) btor59 btor7))
           (btor62 (signal (bvneg (signal-value btor61)) (list)))
           (btor63
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state63")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state63"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state63")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state63")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor65
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state65")))
                      (bv->signal
                       (car
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state65"))))))
                     ((assoc-has-key?
                       init-hash
                       (string->symbol (string-append name "state65")))
                      (bv->signal
                       (assoc-ref
                        init-hash
                        (string->symbol (string-append name "state65")))))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor67 (if (bitvector->bool (signal-value btor28)) btor65 btor63))
           (btor68 (if (bitvector->bool (signal-value btor31)) btor30 btor67))
           (btor69 (if (bitvector->bool (signal-value btor2)) btor30 btor68))
           (btor70 (if (bitvector->bool (signal-value btor15)) btor22 btor30))
           (btor71 (if (bitvector->bool (signal-value btor70)) btor69 btor14))
           (btor72 (signal (bvnot (signal-value btor71)) (list)))
           (btor73
            (signal
             (extract 17 17 (signal-value btor61))
             (signal-state btor61)))
           (btor74 (signal (bvnot (signal-value btor73)) (list)))
           (btor75
            (signal (bvor (signal-value btor72) (signal-value btor74)) (list)))
           (btor76 (if (bitvector->bool (signal-value btor75)) btor61 btor62))
           (btor77
            (bv->signal
             (zero-extend (signal-value btor76) (bitvector 36))
             btor76))
           (btor78
            (signal
             (bvmul (signal-value btor52) (signal-value btor77))
             (list)))
           (btor79 (signal (bvneg (signal-value btor78)) (list)))
           (btor80
            (signal
             (bvxor (signal-value btor50) (signal-value btor75))
             (list)))
           (btor81 (if (bitvector->bool (signal-value btor80)) btor79 btor78))
           (btor83
            (bv->signal
             (zero-extend (signal-value btor5) (bitvector 18))
             btor5))
           (btor84
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 1))
             btor2))
           (btor85
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 1))
             btor2))
           (btor86
            (bv->signal
             (zero-extend (signal-value btor3) (bitvector 1))
             btor3))
           (btor87
            (bv->signal
             (zero-extend (signal-value btor3) (bitvector 1))
             btor3))
           (btor88
            (bv->signal
             (zero-extend (signal-value btor5) (bitvector 18))
             btor5))
           (btor89
            (bv->signal
             (zero-extend (signal-value btor5) (bitvector 18))
             btor5))
           (btor90
            (bv->signal
             (zero-extend (signal-value btor34) (bitvector 18))
             btor34))
           (btor91
            (bv->signal
             (zero-extend (signal-value btor34) (bitvector 18))
             btor34))
           (btor92
            (bv->signal
             (zero-extend (signal-value btor34) (bitvector 18))
             btor34))
           (btor93
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor94
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor95
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor96
            (bv->signal
             (zero-extend (signal-value btor7) (bitvector 18))
             btor7))
           (btor97
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 1))
             btor2))
           (btor98
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 1))
             btor2))
           (btor99
            (bv->signal
             (zero-extend (signal-value btor3) (bitvector 1))
             btor3))
           (btor100
            (bv->signal
             (zero-extend (signal-value btor3) (bitvector 1))
             btor3))
           (btor101
            (bv->signal
             (zero-extend (signal-value btor7) (bitvector 18))
             btor7))
           (btor102
            (bv->signal
             (zero-extend (signal-value btor7) (bitvector 18))
             btor7))
           (btor103
            (bv->signal
             (zero-extend (signal-value btor59) (bitvector 18))
             btor59))
           (btor104
            (bv->signal
             (zero-extend (signal-value btor59) (bitvector 18))
             btor59))
           (btor105
            (bv->signal
             (zero-extend (signal-value btor59) (bitvector 18))
             btor59))
           (btor106
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor107
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor108
            (bv->signal
             (zero-extend (signal-value btor60) (bitvector 1))
             btor60))
           (btor109 (bv->signal (bv 262143 (bitvector 18))))
           (btor110
            (bv->signal
             (zero-extend (signal-value btor109) (bitvector 18))
             btor109))
           (btor111
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 18))
             btor36))
           (btor112
            (bv->signal
             (zero-extend (signal-value btor34) (bitvector 18))
             btor34))
           (btor113
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 18))
             btor61))
           (btor114
            (bv->signal
             (zero-extend (signal-value btor59) (bitvector 18))
             btor59))
           (btor115
            (bv->signal
             (zero-extend (signal-value btor46) (bitvector 1))
             btor46))
           (btor116
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 1))
             btor44))
           (btor117
            (bv->signal
             (zero-extend (signal-value btor71) (bitvector 1))
             btor71))
           (btor118
            (bv->signal
             (zero-extend (signal-value btor69) (bitvector 1))
             btor69))
           (btor119
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 18))
             btor36))
           (btor120
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 18))
             btor36))
           (btor121
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 18))
             btor61))
           (btor122
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 18))
             btor61))
           (btor123
            (bv->signal
             (zero-extend (signal-value btor81) (bitvector 36))
             btor81))
           (btor124
            (bv->signal
             (zero-extend (signal-value btor81) (bitvector 36))
             btor81))
           (btor125
            (bv->signal
             (zero-extend (signal-value btor109) (bitvector 18))
             btor109))
           (btor126
            (bv->signal
             (zero-extend (signal-value btor50) (bitvector 1))
             btor50))
           (btor127
            (bv->signal
             (zero-extend (signal-value btor51) (bitvector 18))
             btor51))
           (btor128
            (bv->signal
             (zero-extend (signal-value btor76) (bitvector 18))
             btor76))
           (btor129
            (bv->signal
             (zero-extend (signal-value btor78) (bitvector 36))
             btor78))
           (btor130
            (bv->signal
             (zero-extend (signal-value btor75) (bitvector 1))
             btor75))
           (btor131
            (bv->signal
             (zero-extend (signal-value btor46) (bitvector 1))
             btor46))
           (btor132
            (bv->signal
             (zero-extend (signal-value btor46) (bitvector 1))
             btor46))
           (btor133
            (bv->signal
             (zero-extend (signal-value btor71) (bitvector 1))
             btor71))
           (btor134
            (bv->signal
             (zero-extend (signal-value btor71) (bitvector 1))
             btor71))
           (btor135
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 1))
             btor2))
           (btor136
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 1))
             btor2))
           (btor137
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 1))
             btor2))
           (btor138
            (bv->signal
             (zero-extend (signal-value btor3) (bitvector 1))
             btor3))
           (btor139
            (bv->signal
             (zero-extend (signal-value btor3) (bitvector 1))
             btor3))
           (btor140
            (bv->signal
             (zero-extend (signal-value btor12) (bitvector 1))
             btor12))
           (btor141
            (bv->signal
             (zero-extend (signal-value btor12) (bitvector 1))
             btor12))
           (btor142
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor143
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor144
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 1))
             btor44))
           (btor145
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 1))
             btor44))
           (btor146
            (bv->signal
             (zero-extend (signal-value btor45) (bitvector 1))
             btor45))
           (btor147
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 1))
             btor2))
           (btor148
            (bv->signal
             (zero-extend (signal-value btor2) (bitvector 1))
             btor2))
           (btor149
            (bv->signal
             (zero-extend (signal-value btor3) (bitvector 1))
             btor3))
           (btor150
            (bv->signal
             (zero-extend (signal-value btor3) (bitvector 1))
             btor3))
           (btor151
            (bv->signal
             (zero-extend (signal-value btor14) (bitvector 1))
             btor14))
           (btor152
            (bv->signal
             (zero-extend (signal-value btor14) (bitvector 1))
             btor14))
           (btor153
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor154
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor155
            (bv->signal
             (zero-extend (signal-value btor69) (bitvector 1))
             btor69))
           (btor156
            (bv->signal
             (zero-extend (signal-value btor69) (bitvector 1))
             btor69))
           (btor157
            (bv->signal
             (zero-extend (signal-value btor70) (bitvector 1))
             btor70))
           (btor159
            (signal
             (bool->bitvector
              (bveq (signal-value btor11) (signal-value btor22)))
             (list)))
           (btor160 (if (bitvector->bool (signal-value btor159)) btor5 btor34))
           (btor165 (if (bitvector->bool (signal-value btor11)) btor12 btor44))
           (btor168 (if (bitvector->bool (signal-value btor159)) btor7 btor59))
           (btor171 (if (bitvector->bool (signal-value btor11)) btor14 btor69))
           (output-state
            (remove-duplicates
             (append
              (append
               (list
                (cons
                 (string->symbol (string-append name "state65"))
                 (cons
                  (signal-value btor171)
                  (if (assoc-has-key?
                       merged-input-state-hash
                       (string->symbol (string-append name "state65")))
                    (add1
                     (cdr
                      (assoc-ref
                       merged-input-state-hash
                       (string->symbol (string-append name "state65")))))
                    0))))
               (append
                (list
                 (cons
                  (string->symbol (string-append name "state63"))
                  (cons
                   (signal-value btor69)
                   (if (assoc-has-key?
                        merged-input-state-hash
                        (string->symbol (string-append name "state63")))
                     (add1
                      (cdr
                       (assoc-ref
                        merged-input-state-hash
                        (string->symbol (string-append name "state63")))))
                     0))))
                (append
                 (list
                  (cons
                   (string->symbol (string-append name "state55"))
                   (cons
                    (signal-value btor168)
                    (if (assoc-has-key?
                         merged-input-state-hash
                         (string->symbol (string-append name "state55")))
                      (add1
                       (cdr
                        (assoc-ref
                         merged-input-state-hash
                         (string->symbol (string-append name "state55")))))
                      0))))
                 (append
                  (list
                   (cons
                    (string->symbol (string-append name "state53"))
                    (cons
                     (signal-value btor59)
                     (if (assoc-has-key?
                          merged-input-state-hash
                          (string->symbol (string-append name "state53")))
                       (add1
                        (cdr
                         (assoc-ref
                          merged-input-state-hash
                          (string->symbol (string-append name "state53")))))
                       0))))
                  (append
                   (list
                    (cons
                     (string->symbol (string-append name "state40"))
                     (cons
                      (signal-value btor165)
                      (if (assoc-has-key?
                           merged-input-state-hash
                           (string->symbol (string-append name "state40")))
                        (add1
                         (cdr
                          (assoc-ref
                           merged-input-state-hash
                           (string->symbol (string-append name "state40")))))
                        0))))
                   (append
                    (list
                     (cons
                      (string->symbol (string-append name "state38"))
                      (cons
                       (signal-value btor44)
                       (if (assoc-has-key?
                            merged-input-state-hash
                            (string->symbol (string-append name "state38")))
                         (add1
                          (cdr
                           (assoc-ref
                            merged-input-state-hash
                            (string->symbol (string-append name "state38")))))
                         0))))
                    (append
                     (list
                      (cons
                       (string->symbol (string-append name "state31"))
                       (cons
                        (signal-value btor2)
                        (if (assoc-has-key?
                             merged-input-state-hash
                             (string->symbol (string-append name "state31")))
                          (add1
                           (cdr
                            (assoc-ref
                             merged-input-state-hash
                             (string->symbol (string-append name "state31")))))
                          0))))
                     (append
                      (list
                       (cons
                        (string->symbol (string-append name "state23"))
                        (cons
                         (signal-value btor3)
                         (if (assoc-has-key?
                              merged-input-state-hash
                              (string->symbol (string-append name "state23")))
                           (add1
                            (cdr
                             (assoc-ref
                              merged-input-state-hash
                              (string->symbol
                               (string-append name "state23")))))
                           0))))
                      (append
                       (list
                        (cons
                         (string->symbol (string-append name "state20"))
                         (cons
                          (signal-value btor160)
                          (if (assoc-has-key?
                               merged-input-state-hash
                               (string->symbol (string-append name "state20")))
                            (add1
                             (cdr
                              (assoc-ref
                               merged-input-state-hash
                               (string->symbol
                                (string-append name "state20")))))
                            0))))
                       (append
                        (list
                         (cons
                          (string->symbol (string-append name "state18"))
                          (cons
                           (signal-value btor34)
                           (if (assoc-has-key?
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state18")))
                             (add1
                              (cdr
                               (assoc-ref
                                merged-input-state-hash
                                (string->symbol
                                 (string-append name "state18")))))
                             0))))
                        (list)))))))))))
              merged-input-state-hash)
             equal?
             #:key
             car)))
      (list (cons 'dataout (signal (signal-value btor81) output-state))))))
