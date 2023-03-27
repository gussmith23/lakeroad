;;; Generated with
;;; $LAKEROAD_DIR/bin/verilog_to_racket.py \
;;;   --infile ~/lakeroad-private/altera_mf/altera_mf_modified_2nd_attempt.v \
;;;   --top altmult_accum \
;;;   --function-name intel-altmult-accum
;;;
;;; with this version of the file: https://github.com/uwsampl/lakeroad-private/blob/a5a5b32f1fbb54b4cedbf2328098793dd4a1ffa6/altera_mf/altera_mf_modified_2nd_attempt.v#L309
;;;
;;; Plus manually replacing the erroneous #f with 0.
#lang racket/base
(provide intel-altmult-accum)
(require (file "/Users/gus/lakeroad/racket/signal.rkt"))
(require rosette)
(define intel-altmult-accum
  (λ (#:accum_round
      (accum_round (bv->signal (constant 'accum_round (bitvector 1))))
      #:accum_saturation
      (accum_saturation
       (bv->signal (constant 'accum_saturation (bitvector 1))))
      #:accum_sload
      (accum_sload (bv->signal (constant 'accum_sload (bitvector 1))))
      #:accum_sload_upper_data
      (accum_sload_upper_data
       (bv->signal (constant 'accum_sload_upper_data (bitvector 1))))
      #:aclr0
      (aclr0 (bv->signal (constant 'aclr0 (bitvector 1))))
      #:aclr1
      (aclr1 (bv->signal (constant 'aclr1 (bitvector 1))))
      #:aclr2
      (aclr2 (bv->signal (constant 'aclr2 (bitvector 1))))
      #:aclr3
      (aclr3 (bv->signal (constant 'aclr3 (bitvector 1))))
      #:addnsub
      (addnsub (bv->signal (constant 'addnsub (bitvector 1))))
      #:clock0
      (clock0 (bv->signal (constant 'clock0 (bitvector 1))))
      #:clock1
      (clock1 (bv->signal (constant 'clock1 (bitvector 1))))
      #:clock2
      (clock2 (bv->signal (constant 'clock2 (bitvector 1))))
      #:clock3
      (clock3 (bv->signal (constant 'clock3 (bitvector 1))))
      #:coefsel0
      (coefsel0 (bv->signal (constant 'coefsel0 (bitvector 3))))
      #:coefsel1
      (coefsel1 (bv->signal (constant 'coefsel1 (bitvector 3))))
      #:coefsel2
      (coefsel2 (bv->signal (constant 'coefsel2 (bitvector 3))))
      #:coefsel3
      (coefsel3 (bv->signal (constant 'coefsel3 (bitvector 3))))
      #:dataa
      (dataa (bv->signal (constant 'dataa (bitvector 2))))
      #:datab
      (datab (bv->signal (constant 'datab (bitvector 2))))
      #:datac
      (datac (bv->signal (constant 'datac (bitvector 22))))
      #:ena0
      (ena0 (bv->signal (constant 'ena0 (bitvector 1))))
      #:ena1
      (ena1 (bv->signal (constant 'ena1 (bitvector 1))))
      #:ena2
      (ena2 (bv->signal (constant 'ena2 (bitvector 1))))
      #:ena3
      (ena3 (bv->signal (constant 'ena3 (bitvector 1))))
      #:mult_round
      (mult_round (bv->signal (constant 'mult_round (bitvector 1))))
      #:mult_saturation
      (mult_saturation (bv->signal (constant 'mult_saturation (bitvector 1))))
      #:scanina
      (scanina (bv->signal (constant 'scanina (bitvector 2))))
      #:scaninb
      (scaninb (bv->signal (constant 'scaninb (bitvector 2))))
      #:signa
      (signa (bv->signal (constant 'signa (bitvector 1))))
      #:signb
      (signb (bv->signal (constant 'signb (bitvector 1))))
      #:sourcea
      (sourcea (bv->signal (constant 'sourcea (bitvector 1))))
      #:sourceb
      (sourceb (bv->signal (constant 'sourceb (bitvector 1))))
      #:unnamed-input-123
      (unnamed-input-123
       (bv->signal (constant 'unnamed-input-123 (bitvector 1))))
      #:unnamed-input-125
      (unnamed-input-125
       (bv->signal (constant 'unnamed-input-125 (bitvector 1))))
      #:unnamed-input-168
      (unnamed-input-168
       (bv->signal (constant 'unnamed-input-168 (bitvector 4))))
      #:unnamed-input-269
      (unnamed-input-269
       (bv->signal (constant 'unnamed-input-269 (bitvector 1))))
      #:unnamed-input-271
      (unnamed-input-271
       (bv->signal (constant 'unnamed-input-271 (bitvector 5))))
      #:unnamed-input-304
      (unnamed-input-304
       (bv->signal (constant 'unnamed-input-304 (bitvector 5))))
      #:unnamed-input-319
      (unnamed-input-319
       (bv->signal (constant 'unnamed-input-319 (bitvector 1)))))
    (let* ((merged-input-state-hash (list))
           (init-hash
            (append
             (list (cons 'state257 (bv 0 (bitvector 1))))
             (append
              (list (cons 'state247 (bv 0 (bitvector 1))))
              (append
               (list (cons 'state236 (bv 0 (bitvector 1))))
               (append
                (list (cons 'state232 (bv 0 (bitvector 1))))
                (append
                 (list (cons 'state211 (bv 0 (bitvector 1))))
                 (append
                  (list (cons 'state198 (bv 0 (bitvector 1))))
                  (append
                   (list (cons 'state178 (bv 0 (bitvector 4))))
                   (append
                    (list (cons 'state151 (bv 0 (bitvector 1))))
                    (append
                     (list (cons 'state134 (bv 0 (bitvector 1))))
                     (append
                      (list (cons 'state97 (bv 1 (bitvector 1))))
                      (append
                       (list (cons 'state89 (bv 1 (bitvector 1))))
                       (append
                        (list (cons 'state59 (bv 0 (bitvector 5))))
                        (append
                         (list (cons 'state55 (bv 0 (bitvector 2))))
                         (append
                          (list (cons 'state51 (bv 0 (bitvector 2))))
                          (append
                           (list (cons 'state46 (bv 0 (bitvector 5))))
                           (append
                            (list (cons 'state40 (bv 0 (bitvector 1))))
                            (list))))))))))))))))))
           (btor1 (bitvector 1))
           (btor2 accum_round)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state accum_round)))
           (btor3 accum_saturation)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state accum_saturation)))
           (btor4 accum_sload)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state accum_sload)))
           (btor5 accum_sload_upper_data)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state accum_sload_upper_data)))
           (btor6 aclr0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state aclr0)))
           (btor7 aclr1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state aclr1)))
           (btor8 aclr2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state aclr2)))
           (btor9 aclr3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state aclr3)))
           (btor10 addnsub)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state addnsub)))
           (btor11 clock0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state clock0)))
           (btor12 clock1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state clock1)))
           (btor13 clock2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state clock2)))
           (btor14 clock3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state clock3)))
           (btor15 (bitvector 3))
           (btor16 coefsel0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state coefsel0)))
           (btor17 coefsel1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state coefsel1)))
           (btor18 coefsel2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state coefsel2)))
           (btor19 coefsel3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state coefsel3)))
           (btor20 (bitvector 2))
           (btor21 dataa)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state dataa)))
           (btor22 datab)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state datab)))
           (btor23 (bitvector 22))
           (btor24 datac)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state datac)))
           (btor25 ena0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state ena0)))
           (btor26 ena1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state ena1)))
           (btor27 ena2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state ena2)))
           (btor28 ena3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state ena3)))
           (btor29 mult_round)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state mult_round)))
           (btor30 mult_saturation)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state mult_saturation)))
           (btor31 scanina)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state scanina)))
           (btor32 scaninb)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state scaninb)))
           (btor33 signa)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state signa)))
           (btor34 signb)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state signb)))
           (btor35 sourcea)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state sourcea)))
           (btor36 sourceb)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state sourceb)))
           (btor37 (bv->signal (bv 0 (bitvector 1))))
           (btor40
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state40)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state40)))
                     ((assoc-has-key? init-hash 'state40)
                      (bv->signal (assoc-ref init-hash 'state40)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor42 (if (bitvector->bool (signal-value btor9)) btor37 btor40))
           (btor44 (bitvector 5))
           (btor45 (bv->signal (bv 0 (bitvector 5))))
           (btor46
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state46)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state46)))
                     ((assoc-has-key? init-hash 'state46)
                      (bv->signal (assoc-ref init-hash 'state46)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 5))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor48 (if (bitvector->bool (signal-value btor9)) btor45 btor46))
           (btor50 (bv->signal (bv 0 (bitvector 2))))
           (btor51
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state51)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state51)))
                     ((assoc-has-key? init-hash 'state51)
                      (bv->signal (assoc-ref init-hash 'state51)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 2))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor53 (if (bitvector->bool (signal-value btor9)) btor50 btor51))
           (btor55
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state55)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state55)))
                     ((assoc-has-key? init-hash 'state55)
                      (bv->signal (assoc-ref init-hash 'state55)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 2))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor57 (if (bitvector->bool (signal-value btor9)) btor50 btor55))
           (btor59
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state59)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state59)))
                     ((assoc-has-key? init-hash 'state59)
                      (bv->signal (assoc-ref init-hash 'state59)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 5))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor61 (if (bitvector->bool (signal-value btor9)) btor45 btor59))
           (btor62
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 5))
             btor61))
           (btor63
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor64
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor65
            (bv->signal
             (zero-extend (signal-value btor25) (bitvector 1))
             btor25))
           (btor66
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor67
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor68
            (bv->signal
             (zero-extend (signal-value btor25) (bitvector 1))
             btor25))
           (btor69
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor70
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor71
            (bv->signal
             (zero-extend (signal-value btor25) (bitvector 1))
             btor25))
           (btor72
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor73
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor74
            (bv->signal
             (zero-extend (signal-value btor25) (bitvector 1))
             btor25))
           (btor75 (bv->signal (bv 0 (bitvector 1))))
           (btor76
            (signal
             (bool->bitvector
              (bveq (signal-value btor5) (signal-value btor75)))
             (list)))
           (btor77
            (signal
             (bool->bitvector
              (bveq (signal-value btor11) (signal-value btor75)))
             (list)))
           (btor78
            (signal (bvor (signal-value btor76) (signal-value btor77)) (list)))
           (btor79
            (signal (bvor (signal-value btor78) (signal-value btor77)) (list)))
           (btor80 (if (bitvector->bool (signal-value btor79)) btor37 btor5))
           (btor81
            (bv->signal
             (zero-extend (signal-value btor80) (bitvector 1))
             btor80))
           (btor82
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor83
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor84
            (bv->signal
             (zero-extend (signal-value btor25) (bitvector 1))
             btor25))
           (btor85
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor86
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor87
            (bv->signal
             (zero-extend (signal-value btor25) (bitvector 1))
             btor25))
           (btor88 (bv->signal (bv 1 (bitvector 1))))
           (btor89
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state89)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state89)))
                     ((assoc-has-key? init-hash 'state89)
                      (bv->signal (assoc-ref init-hash 'state89)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor91 (if (bitvector->bool (signal-value btor9)) btor37 btor89))
           (btor92
            (signal
             (bool->bitvector
              (bveq (signal-value btor10) (signal-value btor75)))
             (list)))
           (btor93
            (signal (bvor (signal-value btor92) (signal-value btor77)) (list)))
           (btor94
            (signal (bvor (signal-value btor93) (signal-value btor77)) (list)))
           (btor95 (if (bitvector->bool (signal-value btor94)) btor88 btor91))
           (btor96
            (bv->signal
             (zero-extend (signal-value btor95) (bitvector 1))
             btor95))
           (btor97
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state97)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state97)))
                     ((assoc-has-key? init-hash 'state97)
                      (bv->signal (assoc-ref init-hash 'state97)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor99 (if (bitvector->bool (signal-value btor9)) btor37 btor97))
           (btor100
            (bv->signal
             (zero-extend (signal-value btor99) (bitvector 1))
             btor99))
           (btor101
            (bv->signal
             (zero-extend (signal-value btor91) (bitvector 1))
             btor91))
           (btor102
            (bv->signal
             (zero-extend (signal-value btor91) (bitvector 1))
             btor91))
           (btor103
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor104
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor105
            (bv->signal
             (zero-extend (signal-value btor25) (bitvector 1))
             btor25))
           (btor106
            (bv->signal
             (zero-extend (signal-value btor99) (bitvector 1))
             btor99))
           (btor107
            (bv->signal
             (zero-extend (signal-value btor99) (bitvector 1))
             btor99))
           (btor108
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor109
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor110
            (bv->signal
             (zero-extend (signal-value btor25) (bitvector 1))
             btor25))
           (btor111 (bitvector 32))
           (btor112 (bv->signal (bv 0 (bitvector 32))))
           (btor113
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 32))
             btor112))
           (btor114
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 32))
             btor112))
           (btor115 (bv->signal (bv 4 (bitvector 32))))
           (btor116
            (bv->signal
             (zero-extend (signal-value btor115) (bitvector 32))
             btor115))
           (btor117
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor118
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor119
            (bv->signal
             (zero-extend (signal-value btor25) (bitvector 1))
             btor25))
           (btor120
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor121
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor122
            (bv->signal
             (zero-extend (signal-value btor25) (bitvector 1))
             btor25))
           (btor123 unnamed-input-123)
           (btor124
            (bv->signal
             (zero-extend (signal-value btor123) (bitvector 1))
             btor123))
           (btor125 unnamed-input-125)
           (btor126
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 1))
             btor125))
           (btor127 (bitvector 8))
           (btor128 (bv->signal (bv 0 (bitvector 8))))
           (btor129
            (bv->signal
             (zero-extend (signal-value btor128) (bitvector 8))
             btor128))
           (btor130 (signal (bvnot (signal-value btor53)) (list)))
           (btor131
            (bv->signal
             (zero-extend (signal-value btor88) (bitvector 2))
             btor88))
           (btor132
            (signal
             (bvadd (signal-value btor130) (signal-value btor131))
             (list)))
           (btor133
            (signal (extract 1 1 (signal-value btor53)) (signal-state btor53)))
           (btor134
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state134)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state134)))
                     ((assoc-has-key? init-hash 'state134)
                      (bv->signal (assoc-ref init-hash 'state134)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor136 (if (bitvector->bool (signal-value btor9)) btor37 btor134))
           (btor137
            (signal
             (bool->bitvector
              (bveq (signal-value btor33) (signal-value btor75)))
             (list)))
           (btor138
            (signal
             (bvor (signal-value btor137) (signal-value btor77))
             (list)))
           (btor139
            (signal
             (bvor (signal-value btor138) (signal-value btor77))
             (list)))
           (btor140
            (if (bitvector->bool (signal-value btor139)) btor37 btor136))
           (btor141
            (signal
             (bvand (signal-value btor133) (signal-value btor140))
             (list)))
           (btor142
            (if (bitvector->bool (signal-value btor141)) btor132 btor53))
           (btor143
            (bv->signal
             (zero-extend (signal-value btor142) (bitvector 2))
             btor142))
           (btor144
            (bv->signal
             (zero-extend (signal-value btor53) (bitvector 2))
             btor53))
           (btor145
            (bv->signal
             (zero-extend (signal-value btor21) (bitvector 2))
             btor21))
           (btor146
            (bv->signal
             (zero-extend (signal-value btor53) (bitvector 2))
             btor53))
           (btor147 (signal (bvnot (signal-value btor57)) (list)))
           (btor148
            (bv->signal
             (zero-extend (signal-value btor88) (bitvector 2))
             btor88))
           (btor149
            (signal
             (bvadd (signal-value btor147) (signal-value btor148))
             (list)))
           (btor150
            (signal (extract 1 1 (signal-value btor57)) (signal-state btor57)))
           (btor151
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state151)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state151)))
                     ((assoc-has-key? init-hash 'state151)
                      (bv->signal (assoc-ref init-hash 'state151)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor153 (if (bitvector->bool (signal-value btor9)) btor37 btor151))
           (btor154
            (signal
             (bool->bitvector
              (bveq (signal-value btor34) (signal-value btor75)))
             (list)))
           (btor155
            (signal
             (bvor (signal-value btor154) (signal-value btor77))
             (list)))
           (btor156
            (signal
             (bvor (signal-value btor155) (signal-value btor77))
             (list)))
           (btor157
            (if (bitvector->bool (signal-value btor156)) btor37 btor153))
           (btor158
            (signal
             (bvand (signal-value btor150) (signal-value btor157))
             (list)))
           (btor159
            (if (bitvector->bool (signal-value btor158)) btor149 btor57))
           (btor160
            (bv->signal
             (zero-extend (signal-value btor159) (bitvector 2))
             btor159))
           (btor161
            (bv->signal
             (zero-extend (signal-value btor57) (bitvector 2))
             btor57))
           (btor162
            (bv->signal
             (zero-extend (signal-value btor22) (bitvector 2))
             btor22))
           (btor163
            (bv->signal
             (zero-extend (signal-value btor57) (bitvector 2))
             btor57))
           (btor164 (bitvector 4))
           (btor165
            (bv->signal
             (zero-extend (signal-value btor142) (bitvector 4))
             btor142))
           (btor166
            (bv->signal
             (zero-extend (signal-value btor159) (bitvector 4))
             btor159))
           (btor167
            (signal
             (bvmul (signal-value btor165) (signal-value btor166))
             (list)))
           (btor168 unnamed-input-168)
           (btor169
            (signal
             (bvsub (signal-value btor168) (signal-value btor167))
             (list)))
           (btor170
            (signal
             (bvxor (signal-value btor141) (signal-value btor158))
             (list)))
           (btor171
            (if (bitvector->bool (signal-value btor170)) btor169 btor167))
           (btor172
            (bv->signal
             (zero-extend (signal-value btor171) (bitvector 4))
             btor171))
           (btor173
            (bv->signal
             (zero-extend (signal-value btor171) (bitvector 4))
             btor171))
           (btor174
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor175
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor176
            (bv->signal
             (zero-extend (signal-value btor25) (bitvector 1))
             btor25))
           (btor177 (bv->signal (bv 0 (bitvector 4))))
           (btor178
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state178)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state178)))
                     ((assoc-has-key? init-hash 'state178)
                      (bv->signal (assoc-ref init-hash 'state178)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor180
            (if (bitvector->bool (signal-value btor9)) btor177 btor178))
           (btor181
            (bv->signal
             (zero-extend (signal-value btor180) (bitvector 4))
             btor180))
           (btor182
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor183
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor184
            (bv->signal
             (zero-extend (signal-value btor25) (bitvector 1))
             btor25))
           (btor185
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor186
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor187
            (bv->signal
             (zero-extend (signal-value btor25) (bitvector 1))
             btor25))
           (btor188
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor189
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor190
            (bv->signal
             (zero-extend (signal-value btor25) (bitvector 1))
             btor25))
           (btor191
            (bv->signal
             (zero-extend (signal-value btor141) (bitvector 1))
             btor141))
           (btor192
            (bv->signal
             (zero-extend (signal-value btor158) (bitvector 1))
             btor158))
           (btor193
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor194
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor195
            (bv->signal
             (zero-extend (signal-value btor25) (bitvector 1))
             btor25))
           (btor196
            (bv->signal
             (zero-extend (signal-value btor42) (bitvector 1))
             btor42))
           (btor197
            (bv->signal
             (zero-extend (signal-value btor48) (bitvector 5))
             btor48))
           (btor198
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state198)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state198)))
                     ((assoc-has-key? init-hash 'state198)
                      (bv->signal (assoc-ref init-hash 'state198)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor200 (if (bitvector->bool (signal-value btor9)) btor37 btor198))
           (btor201
            (if (bitvector->bool (signal-value btor139)) btor37 btor200))
           (btor202
            (bv->signal
             (zero-extend (signal-value btor201) (bitvector 1))
             btor201))
           (btor203
            (bv->signal
             (zero-extend (signal-value btor200) (bitvector 1))
             btor200))
           (btor204
            (bv->signal
             (zero-extend (signal-value btor200) (bitvector 1))
             btor200))
           (btor205
            (bv->signal
             (zero-extend (signal-value btor136) (bitvector 1))
             btor136))
           (btor206
            (bv->signal
             (zero-extend (signal-value btor140) (bitvector 1))
             btor140))
           (btor207
            (bv->signal
             (zero-extend (signal-value btor136) (bitvector 1))
             btor136))
           (btor208
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor209
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor210
            (bv->signal
             (zero-extend (signal-value btor25) (bitvector 1))
             btor25))
           (btor211
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state211)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state211)))
                     ((assoc-has-key? init-hash 'state211)
                      (bv->signal (assoc-ref init-hash 'state211)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor213 (if (bitvector->bool (signal-value btor9)) btor37 btor211))
           (btor214
            (if (bitvector->bool (signal-value btor156)) btor37 btor213))
           (btor215
            (bv->signal
             (zero-extend (signal-value btor214) (bitvector 1))
             btor214))
           (btor216
            (bv->signal
             (zero-extend (signal-value btor213) (bitvector 1))
             btor213))
           (btor217
            (bv->signal
             (zero-extend (signal-value btor213) (bitvector 1))
             btor213))
           (btor218
            (bv->signal
             (zero-extend (signal-value btor153) (bitvector 1))
             btor153))
           (btor219
            (bv->signal
             (zero-extend (signal-value btor157) (bitvector 1))
             btor157))
           (btor220
            (bv->signal
             (zero-extend (signal-value btor153) (bitvector 1))
             btor153))
           (btor221
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor222
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor223
            (bv->signal
             (zero-extend (signal-value btor25) (bitvector 1))
             btor25))
           (btor224
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor225
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor226
            (bv->signal
             (zero-extend (signal-value btor25) (bitvector 1))
             btor25))
           (btor227
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor228
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor229
            (bv->signal
             (zero-extend (signal-value btor25) (bitvector 1))
             btor25))
           (btor230
            (bv->signal
             (zero-extend (signal-value btor136) (bitvector 1))
             btor136))
           (btor231
            (bv->signal
             (zero-extend (signal-value btor153) (bitvector 1))
             btor153))
           (btor232
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state232)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state232)))
                     ((assoc-has-key? init-hash 'state232)
                      (bv->signal (assoc-ref init-hash 'state232)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor234 (if (bitvector->bool (signal-value btor9)) btor37 btor232))
           (btor235
            (bv->signal
             (zero-extend (signal-value btor234) (bitvector 1))
             btor234))
           (btor236
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state236)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state236)))
                     ((assoc-has-key? init-hash 'state236)
                      (bv->signal (assoc-ref init-hash 'state236)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor238 (if (bitvector->bool (signal-value btor9)) btor37 btor236))
           (btor239
            (bv->signal
             (zero-extend (signal-value btor238) (bitvector 1))
             btor238))
           (btor240
            (signal
             (concat (signal-value btor238) (signal-value btor177))
             (list)))
           (btor241
            (bv->signal
             (zero-extend (signal-value btor240) (bitvector 5))
             btor240))
           (btor242
            (bv->signal
             (zero-extend (signal-value btor234) (bitvector 1))
             btor234))
           (btor243
            (bv->signal
             (zero-extend (signal-value btor234) (bitvector 1))
             btor234))
           (btor244
            (bv->signal
             (zero-extend (signal-value btor171) (bitvector 4))
             btor171))
           (btor245
            (bv->signal
             (zero-extend (signal-value btor167) (bitvector 4))
             btor167))
           (btor246
            (bv->signal
             (zero-extend (signal-value btor168) (bitvector 4))
             btor168))
           (btor247
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state247)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state247)))
                     ((assoc-has-key? init-hash 'state247)
                      (bv->signal (assoc-ref init-hash 'state247)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor249 (if (bitvector->bool (signal-value btor9)) btor37 btor247))
           (btor250
            (signal
             (bool->bitvector
              (bveq (signal-value btor4) (signal-value btor75)))
             (list)))
           (btor251
            (signal
             (bvor (signal-value btor250) (signal-value btor77))
             (list)))
           (btor252
            (signal
             (bvor (signal-value btor251) (signal-value btor77))
             (list)))
           (btor253
            (if (bitvector->bool (signal-value btor252)) btor37 btor249))
           (btor254
            (bv->signal
             (zero-extend (signal-value btor253) (bitvector 1))
             btor253))
           (btor255
            (bv->signal
             (zero-extend (signal-value btor249) (bitvector 1))
             btor249))
           (btor256
            (bv->signal
             (zero-extend (signal-value btor249) (bitvector 1))
             btor249))
           (btor257
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state257)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state257)))
                     ((assoc-has-key? init-hash 'state257)
                      (bv->signal (assoc-ref init-hash 'state257)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor259 (if (bitvector->bool (signal-value btor9)) btor37 btor257))
           (btor260
            (bv->signal
             (zero-extend (signal-value btor259) (bitvector 1))
             btor259))
           (btor261
            (bv->signal
             (zero-extend (signal-value btor259) (bitvector 1))
             btor259))
           (btor262
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor263
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor264
            (bv->signal
             (zero-extend (signal-value btor25) (bitvector 1))
             btor25))
           (btor265
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor266
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor267
            (bv->signal
             (zero-extend (signal-value btor25) (bitvector 1))
             btor25))
           (btor268
            (bv->signal
             (zero-extend (signal-value btor259) (bitvector 1))
             btor259))
           (btor269 unnamed-input-269)
           (btor270
            (if (bitvector->bool (signal-value btor253)) btor240 btor48))
           (btor271 unnamed-input-271)
           (btor272
            (signal
             (bvor (signal-value btor201) (signal-value btor214))
             (list)))
           (btor273
            (signal
             (extract 3 3 (signal-value btor180))
             (signal-state btor180)))
           (btor274
            (signal
             (bvand (signal-value btor272) (signal-value btor273))
             (list)))
           (btor275
            (signal
             (concat (signal-value btor274) (signal-value btor180))
             (list)))
           (btor276
            (if (bitvector->bool (signal-value btor25)) btor275 btor271))
           (btor277
            (signal
             (bool->bitvector
              (bvuge (signal-value btor270) (signal-value btor276)))
             (list)))
           (btor278
            (if (bitvector->bool (signal-value btor277)) btor88 btor37))
           (btor279
            (if (bitvector->bool (signal-value btor253)) btor45 btor48))
           (btor280
            (signal
             (bool->bitvector
              (bvuge (signal-value btor279) (signal-value btor276)))
             (list)))
           (btor281
            (if (bitvector->bool (signal-value btor280)) btor88 btor37))
           (btor282 (signal (bvnot (signal-value btor125)) (list)))
           (btor283 (signal (bvnot (signal-value btor123)) (list)))
           (btor284
            (signal
             (bvand (signal-value btor282) (signal-value btor283))
             (list)))
           (btor285
            (if (bitvector->bool (signal-value btor284)) btor281 btor278))
           (btor286 (bitvector 6))
           (btor287
            (bv->signal
             (zero-extend (signal-value btor270) (bitvector 6))
             btor270))
           (btor288
            (bv->signal
             (zero-extend (signal-value btor276) (bitvector 6))
             btor276))
           (btor289
            (signal
             (bvadd (signal-value btor287) (signal-value btor288))
             (list)))
           (btor290
            (bv->signal
             (zero-extend (signal-value btor279) (bitvector 6))
             btor279))
           (btor291
            (bv->signal
             (zero-extend (signal-value btor276) (bitvector 6))
             btor276))
           (btor292
            (signal
             (bvadd (signal-value btor290) (signal-value btor291))
             (list)))
           (btor293
            (if (bitvector->bool (signal-value btor284)) btor292 btor289))
           (btor294
            (signal
             (extract 5 5 (signal-value btor293))
             (signal-state btor293)))
           (btor295
            (if (bitvector->bool (signal-value btor95)) btor294 btor285))
           (btor296
            (if (bitvector->bool (signal-value btor25)) btor295 btor269))
           (btor297 (signal (bvnot (signal-value btor296)) (list)))
           (btor298
            (if (bitvector->bool (signal-value btor95)) btor296 btor297))
           (btor299
            (signal
             (extract 3 3 (signal-value btor276))
             (signal-state btor276)))
           (btor300
            (signal (extract 4 4 (signal-value btor48)) (signal-state btor48)))
           (btor301
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor299)
              (signal-value btor300))
             (list)))
           (btor302 (signal (bvnot (signal-value btor95)) (list)))
           (btor303
            (signal
             (bvxor (signal-value btor301) (signal-value btor302))
             (list)))
           (btor304 unnamed-input-304)
           (btor305
            (signal
             (bvsub (signal-value btor270) (signal-value btor276))
             (list)))
           (btor306
            (signal
             (bvsub (signal-value btor279) (signal-value btor276))
             (list)))
           (btor307
            (if (bitvector->bool (signal-value btor284)) btor306 btor305))
           (btor308
            (signal
             (extract 4 0 (signal-value btor293))
             (signal-state btor293)))
           (btor309
            (if (bitvector->bool (signal-value btor95)) btor308 btor307))
           (btor310
            (if (bitvector->bool (signal-value btor25)) btor309 btor304))
           (btor311
            (signal
             (extract 4 4 (signal-value btor310))
             (signal-state btor310)))
           (btor312
            (signal
             (bvxor (signal-value btor300) (signal-value btor311))
             (list)))
           (btor313
            (signal
             (bvand (signal-value btor303) (signal-value btor312))
             (list)))
           (btor314
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor299)
              (signal-value btor238))
             (list)))
           (btor315
            (signal
             (bvxor (signal-value btor314) (signal-value btor302))
             (list)))
           (btor316
            (signal
             (bvxor (signal-value btor238) (signal-value btor311))
             (list)))
           (btor317
            (signal
             (bvand (signal-value btor315) (signal-value btor316))
             (list)))
           (btor318
            (if (bitvector->bool (signal-value btor253)) btor317 btor313))
           (btor319 unnamed-input-319)
           (btor320
            (if (bitvector->bool (signal-value btor25)) btor272 btor319))
           (btor321
            (signal
             (apply bvor (bitvector->bits (signal-value btor276)))
             (signal-state btor276)))
           (btor322
            (signal
             (bvand (signal-value btor320) (signal-value btor321))
             (list)))
           (btor323
            (if (bitvector->bool (signal-value btor322)) btor318 btor298))
           (btor324
            (if (bitvector->bool (signal-value btor25)) btor323 btor42))
           (btor325 (if (bitvector->bool (signal-value btor9)) btor37 btor324))
           (btor327
            (if (bitvector->bool (signal-value btor125)) btor310 btor61))
           (btor328
            (if (bitvector->bool (signal-value btor125)) btor327 btor310))
           (btor329
            (if (bitvector->bool (signal-value btor25)) btor328 btor48))
           (btor330 (if (bitvector->bool (signal-value btor9)) btor45 btor329))
           (btor332
            (signal
             (bvand (signal-value btor11) (signal-value btor25))
             (list)))
           (btor333
            (if (bitvector->bool (signal-value btor332)) btor21 btor53))
           (btor334 (if (bitvector->bool (signal-value btor9)) btor50 btor333))
           (btor336
            (if (bitvector->bool (signal-value btor332)) btor22 btor57))
           (btor337 (if (bitvector->bool (signal-value btor9)) btor50 btor336))
           (btor339
            (if (bitvector->bool (signal-value btor25)) btor327 btor61))
           (btor340 (if (bitvector->bool (signal-value btor9)) btor45 btor339))
           (btor342
            (if (bitvector->bool (signal-value btor332)) btor99 btor91))
           (btor343 (if (bitvector->bool (signal-value btor9)) btor37 btor342))
           (btor345
            (if (bitvector->bool (signal-value btor332)) btor10 btor99))
           (btor346 (if (bitvector->bool (signal-value btor9)) btor37 btor345))
           (btor348
            (if (bitvector->bool (signal-value btor332)) btor33 btor136))
           (btor349 (if (bitvector->bool (signal-value btor9)) btor37 btor348))
           (btor351
            (if (bitvector->bool (signal-value btor332)) btor34 btor153))
           (btor352 (if (bitvector->bool (signal-value btor9)) btor37 btor351))
           (btor354
            (if (bitvector->bool (signal-value btor332)) btor171 btor180))
           (btor355
            (if (bitvector->bool (signal-value btor9)) btor177 btor354))
           (btor357
            (if (bitvector->bool (signal-value btor332)) btor136 btor200))
           (btor358 (if (bitvector->bool (signal-value btor9)) btor37 btor357))
           (btor360
            (if (bitvector->bool (signal-value btor332)) btor153 btor213))
           (btor361 (if (bitvector->bool (signal-value btor9)) btor37 btor360))
           (btor363
            (if (bitvector->bool (signal-value btor332)) btor80 btor234))
           (btor364 (if (bitvector->bool (signal-value btor9)) btor37 btor363))
           (btor366
            (if (bitvector->bool (signal-value btor332)) btor234 btor238))
           (btor367 (if (bitvector->bool (signal-value btor9)) btor37 btor366))
           (btor369
            (if (bitvector->bool (signal-value btor332)) btor259 btor249))
           (btor370 (if (bitvector->bool (signal-value btor9)) btor37 btor369))
           (btor372
            (if (bitvector->bool (signal-value btor332)) btor4 btor259))
           (btor373
            (if (bitvector->bool (signal-value btor9)) btor37 btor372)))
      (list
       (cons
        'scanouta
        (signal
         (signal-value btor53)
         (append
          (list (cons 'state257 (signal-value btor373)))
          (append
           (list (cons 'state247 (signal-value btor370)))
           (append
            (list (cons 'state236 (signal-value btor367)))
            (append
             (list (cons 'state232 (signal-value btor364)))
             (append
              (list (cons 'state211 (signal-value btor361)))
              (append
               (list (cons 'state198 (signal-value btor358)))
               (append
                (list (cons 'state178 (signal-value btor355)))
                (append
                 (list (cons 'state151 (signal-value btor352)))
                 (append
                  (list (cons 'state134 (signal-value btor349)))
                  (append
                   (list (cons 'state97 (signal-value btor346)))
                   (append
                    (list (cons 'state89 (signal-value btor343)))
                    (append
                     (list (cons 'state59 (signal-value btor340)))
                     (append
                      (list (cons 'state55 (signal-value btor337)))
                      (append
                       (list (cons 'state51 (signal-value btor334)))
                       (append
                        (list (cons 'state46 (signal-value btor330)))
                        (append
                         (list (cons 'state40 (signal-value btor325)))
                         (list)))))))))))))))))))
       (cons
        'accum_is_saturated
        (signal
         (signal-value btor37)
         (append
          (list (cons 'state257 (signal-value btor373)))
          (append
           (list (cons 'state247 (signal-value btor370)))
           (append
            (list (cons 'state236 (signal-value btor367)))
            (append
             (list (cons 'state232 (signal-value btor364)))
             (append
              (list (cons 'state211 (signal-value btor361)))
              (append
               (list (cons 'state198 (signal-value btor358)))
               (append
                (list (cons 'state178 (signal-value btor355)))
                (append
                 (list (cons 'state151 (signal-value btor352)))
                 (append
                  (list (cons 'state134 (signal-value btor349)))
                  (append
                   (list (cons 'state97 (signal-value btor346)))
                   (append
                    (list (cons 'state89 (signal-value btor343)))
                    (append
                     (list (cons 'state59 (signal-value btor340)))
                     (append
                      (list (cons 'state55 (signal-value btor337)))
                      (append
                       (list (cons 'state51 (signal-value btor334)))
                       (append
                        (list (cons 'state46 (signal-value btor330)))
                        (append
                         (list (cons 'state40 (signal-value btor325)))
                         (list)))))))))))))))))))
       (cons
        'result
        (signal
         (signal-value btor48)
         (append
          (list (cons 'state257 (signal-value btor373)))
          (append
           (list (cons 'state247 (signal-value btor370)))
           (append
            (list (cons 'state236 (signal-value btor367)))
            (append
             (list (cons 'state232 (signal-value btor364)))
             (append
              (list (cons 'state211 (signal-value btor361)))
              (append
               (list (cons 'state198 (signal-value btor358)))
               (append
                (list (cons 'state178 (signal-value btor355)))
                (append
                 (list (cons 'state151 (signal-value btor352)))
                 (append
                  (list (cons 'state134 (signal-value btor349)))
                  (append
                   (list (cons 'state97 (signal-value btor346)))
                   (append
                    (list (cons 'state89 (signal-value btor343)))
                    (append
                     (list (cons 'state59 (signal-value btor340)))
                     (append
                      (list (cons 'state55 (signal-value btor337)))
                      (append
                       (list (cons 'state51 (signal-value btor334)))
                       (append
                        (list (cons 'state46 (signal-value btor330)))
                        (append
                         (list (cons 'state40 (signal-value btor325)))
                         (list)))))))))))))))))))
       (cons
        'mult_is_saturated
        (signal
         (signal-value btor37)
         (append
          (list (cons 'state257 (signal-value btor373)))
          (append
           (list (cons 'state247 (signal-value btor370)))
           (append
            (list (cons 'state236 (signal-value btor367)))
            (append
             (list (cons 'state232 (signal-value btor364)))
             (append
              (list (cons 'state211 (signal-value btor361)))
              (append
               (list (cons 'state198 (signal-value btor358)))
               (append
                (list (cons 'state178 (signal-value btor355)))
                (append
                 (list (cons 'state151 (signal-value btor352)))
                 (append
                  (list (cons 'state134 (signal-value btor349)))
                  (append
                   (list (cons 'state97 (signal-value btor346)))
                   (append
                    (list (cons 'state89 (signal-value btor343)))
                    (append
                     (list (cons 'state59 (signal-value btor340)))
                     (append
                      (list (cons 'state55 (signal-value btor337)))
                      (append
                       (list (cons 'state51 (signal-value btor334)))
                       (append
                        (list (cons 'state46 (signal-value btor330)))
                        (append
                         (list (cons 'state40 (signal-value btor325)))
                         (list)))))))))))))))))))
       (cons
        'overflow
        (signal
         (signal-value btor42)
         (append
          (list (cons 'state257 (signal-value btor373)))
          (append
           (list (cons 'state247 (signal-value btor370)))
           (append
            (list (cons 'state236 (signal-value btor367)))
            (append
             (list (cons 'state232 (signal-value btor364)))
             (append
              (list (cons 'state211 (signal-value btor361)))
              (append
               (list (cons 'state198 (signal-value btor358)))
               (append
                (list (cons 'state178 (signal-value btor355)))
                (append
                 (list (cons 'state151 (signal-value btor352)))
                 (append
                  (list (cons 'state134 (signal-value btor349)))
                  (append
                   (list (cons 'state97 (signal-value btor346)))
                   (append
                    (list (cons 'state89 (signal-value btor343)))
                    (append
                     (list (cons 'state59 (signal-value btor340)))
                     (append
                      (list (cons 'state55 (signal-value btor337)))
                      (append
                       (list (cons 'state51 (signal-value btor334)))
                       (append
                        (list (cons 'state46 (signal-value btor330)))
                        (append
                         (list (cons 'state40 (signal-value btor325)))
                         (list)))))))))))))))))))
       (cons
        'scanoutb
        (signal
         (signal-value btor57)
         (append
          (list (cons 'state257 (signal-value btor373)))
          (append
           (list (cons 'state247 (signal-value btor370)))
           (append
            (list (cons 'state236 (signal-value btor367)))
            (append
             (list (cons 'state232 (signal-value btor364)))
             (append
              (list (cons 'state211 (signal-value btor361)))
              (append
               (list (cons 'state198 (signal-value btor358)))
               (append
                (list (cons 'state178 (signal-value btor355)))
                (append
                 (list (cons 'state151 (signal-value btor352)))
                 (append
                  (list (cons 'state134 (signal-value btor349)))
                  (append
                   (list (cons 'state97 (signal-value btor346)))
                   (append
                    (list (cons 'state89 (signal-value btor343)))
                    (append
                     (list (cons 'state59 (signal-value btor340)))
                     (append
                      (list (cons 'state55 (signal-value btor337)))
                      (append
                       (list (cons 'state51 (signal-value btor334)))
                       (append
                        (list (cons 'state46 (signal-value btor330)))
                        (append
                         (list (cons 'state40 (signal-value btor325)))
                         (list)))))))))))))))))))))))

