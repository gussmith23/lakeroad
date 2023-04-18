;;; Imported with
;;;
;;; $LAKEROAD_DIR/bin/verilog_to_racket.py \
;;;   --infile ~/lakeroad-private/altera_mf/altera_mf_modified.v \
;;;   --top altmult_accum \
;;;   --parameter width_a=18 \
;;;   --parameter width_b=18 \
;;;   --parameter width_result=36 \
;;;   --function-name intel-altmult-accum
;;;
;;; Using the version of the file at
;;; https://github.com/uwsampl/lakeroad-private/blob/f74653c1bf0b08c88308ee9918e84746737562e2/altera_mf/altera_mf_modified.v
#lang racket/base
(provide intel-altmult-accum)
(require (file "../signal.rkt"))
(require rosette)
(define intel-altmult-accum
  (λ (#:accum_direction
      (accum_direction (bv->signal (constant 'accum_direction (bitvector 5))))
      #:accum_round
      (accum_round (bv->signal (constant 'accum_round (bitvector 1))))
      #:accum_round_aclr
      (accum_round_aclr
       (bv->signal (constant 'accum_round_aclr (bitvector 5))))
      #:accum_round_pipeline_aclr
      (accum_round_pipeline_aclr
       (bv->signal (constant 'accum_round_pipeline_aclr (bitvector 5))))
      #:accum_round_pipeline_reg
      (accum_round_pipeline_reg
       (bv->signal (constant 'accum_round_pipeline_reg (bitvector 5))))
      #:accum_round_reg
      (accum_round_reg (bv->signal (constant 'accum_round_reg (bitvector 5))))
      #:accum_saturation
      (accum_saturation
       (bv->signal (constant 'accum_saturation (bitvector 1))))
      #:accum_saturation_aclr
      (accum_saturation_aclr
       (bv->signal (constant 'accum_saturation_aclr (bitvector 5))))
      #:accum_saturation_pipeline_aclr
      (accum_saturation_pipeline_aclr
       (bv->signal (constant 'accum_saturation_pipeline_aclr (bitvector 5))))
      #:accum_saturation_pipeline_reg
      (accum_saturation_pipeline_reg
       (bv->signal (constant 'accum_saturation_pipeline_reg (bitvector 5))))
      #:accum_saturation_reg
      (accum_saturation_reg
       (bv->signal (constant 'accum_saturation_reg (bitvector 5))))
      #:accum_sload
      (accum_sload (bv->signal (constant 'accum_sload (bitvector 1))))
      #:accum_sload_aclr
      (accum_sload_aclr
       (bv->signal (constant 'accum_sload_aclr (bitvector 5))))
      #:accum_sload_pipeline_aclr
      (accum_sload_pipeline_aclr
       (bv->signal (constant 'accum_sload_pipeline_aclr (bitvector 5))))
      #:accum_sload_pipeline_reg
      (accum_sload_pipeline_reg
       (bv->signal (constant 'accum_sload_pipeline_reg (bitvector 5))))
      #:accum_sload_reg
      (accum_sload_reg (bv->signal (constant 'accum_sload_reg (bitvector 5))))
      #:accum_sload_upper_data
      (accum_sload_upper_data
       (bv->signal (constant 'accum_sload_upper_data (bitvector 1))))
      #:accum_sload_upper_data_aclr
      (accum_sload_upper_data_aclr
       (bv->signal (constant 'accum_sload_upper_data_aclr (bitvector 5))))
      #:accum_sload_upper_data_pipeline_aclr
      (accum_sload_upper_data_pipeline_aclr
       (bv->signal
        (constant 'accum_sload_upper_data_pipeline_aclr (bitvector 5))))
      #:accum_sload_upper_data_pipeline_reg
      (accum_sload_upper_data_pipeline_reg
       (bv->signal
        (constant 'accum_sload_upper_data_pipeline_reg (bitvector 5))))
      #:accum_sload_upper_data_reg
      (accum_sload_upper_data_reg
       (bv->signal (constant 'accum_sload_upper_data_reg (bitvector 5))))
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
      #:addnsub_aclr
      (addnsub_aclr (bv->signal (constant 'addnsub_aclr (bitvector 5))))
      #:addnsub_pipeline_aclr
      (addnsub_pipeline_aclr
       (bv->signal (constant 'addnsub_pipeline_aclr (bitvector 5))))
      #:addnsub_pipeline_reg
      (addnsub_pipeline_reg
       (bv->signal (constant 'addnsub_pipeline_reg (bitvector 5))))
      #:addnsub_reg
      (addnsub_reg (bv->signal (constant 'addnsub_reg (bitvector 5))))
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
      (dataa (bv->signal (constant 'dataa (bitvector 18))))
      #:datab
      (datab (bv->signal (constant 'datab (bitvector 18))))
      #:datac
      (datac (bv->signal (constant 'datac (bitvector 22))))
      #:dedicated_multiplier_circuitry
      (dedicated_multiplier_circuitry
       (bv->signal (constant 'dedicated_multiplier_circuitry (bitvector 5))))
      #:dsp_block_balancing
      (dsp_block_balancing
       (bv->signal (constant 'dsp_block_balancing (bitvector 5))))
      #:ena0
      (ena0 (bv->signal (constant 'ena0 (bitvector 1))))
      #:ena1
      (ena1 (bv->signal (constant 'ena1 (bitvector 1))))
      #:ena2
      (ena2 (bv->signal (constant 'ena2 (bitvector 1))))
      #:ena3
      (ena3 (bv->signal (constant 'ena3 (bitvector 1))))
      #:input_aclr_a
      (input_aclr_a (bv->signal (constant 'input_aclr_a (bitvector 5))))
      #:input_aclr_b
      (input_aclr_b (bv->signal (constant 'input_aclr_b (bitvector 5))))
      #:input_reg_a
      (input_reg_a (bv->signal (constant 'input_reg_a (bitvector 5))))
      #:input_reg_b
      (input_reg_b (bv->signal (constant 'input_reg_b (bitvector 5))))
      #:input_source_a
      (input_source_a (bv->signal (constant 'input_source_a (bitvector 5))))
      #:input_source_b
      (input_source_b (bv->signal (constant 'input_source_b (bitvector 5))))
      #:intended_device_family
      (intended_device_family
       (bv->signal (constant 'intended_device_family (bitvector 5))))
      #:lpm_hint
      (lpm_hint (bv->signal (constant 'lpm_hint (bitvector 5))))
      #:lpm_type
      (lpm_type (bv->signal (constant 'lpm_type (bitvector 5))))
      #:mult_round
      (mult_round (bv->signal (constant 'mult_round (bitvector 1))))
      #:mult_round_aclr
      (mult_round_aclr (bv->signal (constant 'mult_round_aclr (bitvector 5))))
      #:mult_round_reg
      (mult_round_reg (bv->signal (constant 'mult_round_reg (bitvector 5))))
      #:mult_saturation
      (mult_saturation (bv->signal (constant 'mult_saturation (bitvector 1))))
      #:mult_saturation_aclr
      (mult_saturation_aclr
       (bv->signal (constant 'mult_saturation_aclr (bitvector 5))))
      #:mult_saturation_reg
      (mult_saturation_reg
       (bv->signal (constant 'mult_saturation_reg (bitvector 5))))
      #:multiplier1_direction
      (multiplier1_direction
       (bv->signal (constant 'multiplier1_direction (bitvector 5))))
      #:multiplier3_direction
      (multiplier3_direction
       (bv->signal (constant 'multiplier3_direction (bitvector 5))))
      #:multiplier_aclr
      (multiplier_aclr (bv->signal (constant 'multiplier_aclr (bitvector 5))))
      #:multiplier_reg
      (multiplier_reg (bv->signal (constant 'multiplier_reg (bitvector 5))))
      #:output_aclr
      (output_aclr (bv->signal (constant 'output_aclr (bitvector 5))))
      #:output_reg
      (output_reg (bv->signal (constant 'output_reg (bitvector 5))))
      #:port_accum_is_saturated
      (port_accum_is_saturated
       (bv->signal (constant 'port_accum_is_saturated (bitvector 1))))
      #:port_addnsub
      (port_addnsub (bv->signal (constant 'port_addnsub (bitvector 5))))
      #:port_mult_is_saturated
      (port_mult_is_saturated
       (bv->signal (constant 'port_mult_is_saturated (bitvector 1))))
      #:port_signa
      (port_signa (bv->signal (constant 'port_signa (bitvector 5))))
      #:port_signb
      (port_signb (bv->signal (constant 'port_signb (bitvector 5))))
      #:representation_a
      (representation_a
       (bv->signal (constant 'representation_a (bitvector 5))))
      #:representation_b
      (representation_b
       (bv->signal (constant 'representation_b (bitvector 5))))
      #:scanina
      (scanina (bv->signal (constant 'scanina (bitvector 18))))
      #:scaninb
      (scaninb (bv->signal (constant 'scaninb (bitvector 18))))
      #:sign_aclr_a
      (sign_aclr_a (bv->signal (constant 'sign_aclr_a (bitvector 5))))
      #:sign_aclr_b
      (sign_aclr_b (bv->signal (constant 'sign_aclr_b (bitvector 5))))
      #:sign_pipeline_aclr_a
      (sign_pipeline_aclr_a
       (bv->signal (constant 'sign_pipeline_aclr_a (bitvector 5))))
      #:sign_pipeline_aclr_b
      (sign_pipeline_aclr_b
       (bv->signal (constant 'sign_pipeline_aclr_b (bitvector 5))))
      #:sign_pipeline_reg_a
      (sign_pipeline_reg_a
       (bv->signal (constant 'sign_pipeline_reg_a (bitvector 5))))
      #:sign_pipeline_reg_b
      (sign_pipeline_reg_b
       (bv->signal (constant 'sign_pipeline_reg_b (bitvector 5))))
      #:sign_reg_a
      (sign_reg_a (bv->signal (constant 'sign_reg_a (bitvector 5))))
      #:sign_reg_b
      (sign_reg_b (bv->signal (constant 'sign_reg_b (bitvector 5))))
      #:signa
      (signa (bv->signal (constant 'signa (bitvector 1))))
      #:signb
      (signb (bv->signal (constant 'signb (bitvector 1))))
      #:sourcea
      (sourcea (bv->signal (constant 'sourcea (bitvector 1))))
      #:sourceb
      (sourceb (bv->signal (constant 'sourceb (bitvector 1))))
      #:unnamed-input-494
      (unnamed-input-494
       (bv->signal (constant 'unnamed-input-494 (bitvector 1))))
      #:unnamed-input-496
      (unnamed-input-496
       (bv->signal (constant 'unnamed-input-496 (bitvector 1))))
      #:unnamed-input-1001
      (unnamed-input-1001
       (bv->signal (constant 'unnamed-input-1001 (bitvector 1))))
      #:unnamed-input-1003
      (unnamed-input-1003
       (bv->signal (constant 'unnamed-input-1003 (bitvector 36))))
      #:unnamed-input-1006
      (unnamed-input-1006
       (bv->signal (constant 'unnamed-input-1006 (bitvector 36))))
      #:unnamed-input-1028
      (unnamed-input-1028
       (bv->signal (constant 'unnamed-input-1028 (bitvector 1))))
      #:unnamed-input-1037
      (unnamed-input-1037
       (bv->signal (constant 'unnamed-input-1037 (bitvector 36))))
      #:unnamed-input-1044
      (unnamed-input-1044
       (bv->signal (constant 'unnamed-input-1044 (bitvector 36))))
      #:unnamed-input-1055
      (unnamed-input-1055
       (bv->signal (constant 'unnamed-input-1055 (bitvector 1))))
      #:unnamed-input-1058
      (unnamed-input-1058
       (bv->signal (constant 'unnamed-input-1058 (bitvector 1)))))
    (let* ((merged-input-state-hash (list))
           (init-hash
            (append
             (list (cons 'state929 (bv 1 (bitvector 1))))
             (append
              (list (cons 'state927 (bv 0 (bitvector 1))))
              (append
               (list (cons 'state925 (bv 0 (bitvector 1))))
               (append
                (list (cons 'state889 (bv 1 (bitvector 1))))
                (append
                 (list (cons 'state887 (bv 0 (bitvector 1))))
                 (append
                  (list (cons 'state885 (bv 0 (bitvector 1))))
                  (append
                   (list (cons 'state864 (bv 1 (bitvector 1))))
                   (append
                    (list (cons 'state862 (bv 0 (bitvector 1))))
                    (append
                     (list (cons 'state860 (bv 0 (bitvector 1))))
                     (append
                      (list (cons 'state850 (bv 1 (bitvector 1))))
                      (append
                       (list (cons 'state848 (bv 0 (bitvector 1))))
                       (append
                        (list (cons 'state846 (bv 0 (bitvector 1))))
                        (append
                         (list (cons 'state774 (bv 1 (bitvector 1))))
                         (append
                          (list (cons 'state772 (bv 0 (bitvector 1))))
                          (append
                           (list (cons 'state770 (bv 0 (bitvector 1))))
                           (append
                            (list (cons 'state717 (bv 1 (bitvector 1))))
                            (append
                             (list (cons 'state715 (bv 0 (bitvector 1))))
                             (append
                              (list (cons 'state713 (bv 0 (bitvector 1))))
                              (append
                               (list (cons 'state707 (bv 1 (bitvector 1))))
                               (append
                                (list (cons 'state705 (bv 0 (bitvector 36))))
                                (append
                                 (list (cons 'state703 (bv 0 (bitvector 36))))
                                 (append
                                  (list (cons 'state663 (bv 1 (bitvector 1))))
                                  (append
                                   (list
                                    (cons 'state661 (bv 0 (bitvector 36))))
                                   (append
                                    (list
                                     (cons 'state659 (bv 0 (bitvector 36))))
                                    (append
                                     (list
                                      (cons 'state619 (bv 1 (bitvector 1))))
                                     (append
                                      (list
                                       (cons 'state617 (bv 0 (bitvector 1))))
                                      (append
                                       (list
                                        (cons 'state615 (bv 0 (bitvector 1))))
                                       (append
                                        (list
                                         (cons 'state566 (bv 1 (bitvector 1))))
                                        (append
                                         (list
                                          (cons
                                           'state564
                                           (bv 0 (bitvector 1))))
                                         (append
                                          (list
                                           (cons
                                            'state562
                                            (bv 0 (bitvector 1))))
                                          (append
                                           (list
                                            (cons
                                             'state517
                                             (bv 1 (bitvector 1))))
                                           (append
                                            (list
                                             (cons
                                              'state515
                                              (bv 0 (bitvector 1))))
                                            (append
                                             (list
                                              (cons
                                               'state513
                                               (bv 0 (bitvector 1))))
                                             (append
                                              (list
                                               (cons
                                                'state402
                                                (bv 1 (bitvector 1))))
                                              (append
                                               (list
                                                (cons
                                                 'state400
                                                 (bv 0 (bitvector 1))))
                                               (append
                                                (list
                                                 (cons
                                                  'state398
                                                  (bv 0 (bitvector 1))))
                                                (append
                                                 (list
                                                  (cons
                                                   'state362
                                                   (bv 1 (bitvector 1))))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state360
                                                    (bv 0 (bitvector 1))))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state358
                                                     (bv 0 (bitvector 1))))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state279
                                                      (bv 1 (bitvector 1))))
                                                    (append
                                                     (list
                                                      (cons
                                                       'state277
                                                       (bv 0 (bitvector 1))))
                                                     (append
                                                      (list
                                                       (cons
                                                        'state275
                                                        (bv 0 (bitvector 1))))
                                                      (append
                                                       (list
                                                        (cons
                                                         'state269
                                                         (bv 1 (bitvector 1))))
                                                       (append
                                                        (list
                                                         (cons
                                                          'state267
                                                          (bv
                                                           0
                                                           (bitvector 36))))
                                                        (append
                                                         (list
                                                          (cons
                                                           'state265
                                                           (bv
                                                            0
                                                            (bitvector 36))))
                                                         (append
                                                          (list
                                                           (cons
                                                            'state218
                                                            (bv
                                                             1
                                                             (bitvector 1))))
                                                          (append
                                                           (list
                                                            (cons
                                                             'state216
                                                             (bv
                                                              0
                                                              (bitvector 18))))
                                                           (append
                                                            (list
                                                             (cons
                                                              'state214
                                                              (bv
                                                               0
                                                               (bitvector
                                                                18))))
                                                            (append
                                                             (list
                                                              (cons
                                                               'state166
                                                               (bv
                                                                1
                                                                (bitvector
                                                                 1))))
                                                             (append
                                                              (list
                                                               (cons
                                                                'state164
                                                                (bv
                                                                 0
                                                                 (bitvector
                                                                  18))))
                                                              (append
                                                               (list
                                                                (cons
                                                                 'state162
                                                                 (bv
                                                                  0
                                                                  (bitvector
                                                                   18))))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  'state155
                                                                  (bv
                                                                   1
                                                                   (bitvector
                                                                    1))))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   'state153
                                                                   (bv
                                                                    0
                                                                    (bitvector
                                                                     36))))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state151
                                                                    (bv
                                                                     0
                                                                     (bitvector
                                                                      36))))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state143
                                                                     (bv
                                                                      1
                                                                      (bitvector
                                                                       1))))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state141
                                                                      (bv
                                                                       0
                                                                       (bitvector
                                                                        1))))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state139
                                                                       (bv
                                                                        0
                                                                        (bitvector
                                                                         1))))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state133
                                                                        (bv
                                                                         1
                                                                         (bitvector
                                                                          1))))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state131
                                                                         (bv
                                                                          0
                                                                          (bitvector
                                                                           1))))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state129
                                                                          (bv
                                                                           0
                                                                           (bitvector
                                                                            1))))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state101
                                                                           (bv
                                                                            1
                                                                            (bitvector
                                                                             1))))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state98
                                                                            (bv
                                                                             0
                                                                             (bitvector
                                                                              1))))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             'state96
                                                                             (bv
                                                                              0
                                                                              (bitvector
                                                                               1))))
                                                                           (list)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
           (btor1 (bitvector 5))
           (btor2 accum_direction)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state accum_direction)))
           (btor3 (bitvector 1))
           (btor4 accum_round)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state accum_round)))
           (btor5 accum_round_aclr)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state accum_round_aclr)))
           (btor6 accum_round_pipeline_aclr)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state accum_round_pipeline_aclr)))
           (btor7 accum_round_pipeline_reg)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state accum_round_pipeline_reg)))
           (btor8 accum_round_reg)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state accum_round_reg)))
           (btor9 accum_saturation)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state accum_saturation)))
           (btor10 accum_saturation_aclr)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state accum_saturation_aclr)))
           (btor11 accum_saturation_pipeline_aclr)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state accum_saturation_pipeline_aclr)))
           (btor12 accum_saturation_pipeline_reg)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state accum_saturation_pipeline_reg)))
           (btor13 accum_saturation_reg)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state accum_saturation_reg)))
           (btor14 accum_sload)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state accum_sload)))
           (btor15 accum_sload_aclr)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state accum_sload_aclr)))
           (btor16 accum_sload_pipeline_aclr)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state accum_sload_pipeline_aclr)))
           (btor17 accum_sload_pipeline_reg)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state accum_sload_pipeline_reg)))
           (btor18 accum_sload_reg)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state accum_sload_reg)))
           (btor19 accum_sload_upper_data)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state accum_sload_upper_data)))
           (btor20 accum_sload_upper_data_aclr)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state accum_sload_upper_data_aclr)))
           (btor21 accum_sload_upper_data_pipeline_aclr)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state accum_sload_upper_data_pipeline_aclr)))
           (btor22 accum_sload_upper_data_pipeline_reg)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state accum_sload_upper_data_pipeline_reg)))
           (btor23 accum_sload_upper_data_reg)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state accum_sload_upper_data_reg)))
           (btor24 aclr0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state aclr0)))
           (btor25 aclr1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state aclr1)))
           (btor26 aclr2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state aclr2)))
           (btor27 aclr3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state aclr3)))
           (btor28 addnsub)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state addnsub)))
           (btor29 addnsub_aclr)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state addnsub_aclr)))
           (btor30 addnsub_pipeline_aclr)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state addnsub_pipeline_aclr)))
           (btor31 addnsub_pipeline_reg)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state addnsub_pipeline_reg)))
           (btor32 addnsub_reg)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state addnsub_reg)))
           (btor33 clock0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state clock0)))
           (btor34 clock1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state clock1)))
           (btor35 clock2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state clock2)))
           (btor36 clock3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state clock3)))
           (btor37 (bitvector 3))
           (btor38 coefsel0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state coefsel0)))
           (btor39 coefsel1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state coefsel1)))
           (btor40 coefsel2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state coefsel2)))
           (btor41 coefsel3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state coefsel3)))
           (btor42 (bitvector 18))
           (btor43 dataa)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state dataa)))
           (btor44 datab)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state datab)))
           (btor45 (bitvector 22))
           (btor46 datac)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state datac)))
           (btor47 dedicated_multiplier_circuitry)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state dedicated_multiplier_circuitry)))
           (btor48 dsp_block_balancing)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state dsp_block_balancing)))
           (btor49 ena0)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state ena0)))
           (btor50 ena1)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state ena1)))
           (btor51 ena2)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state ena2)))
           (btor52 ena3)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state ena3)))
           (btor53 input_aclr_a)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state input_aclr_a)))
           (btor54 input_aclr_b)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state input_aclr_b)))
           (btor55 input_reg_a)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state input_reg_a)))
           (btor56 input_reg_b)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state input_reg_b)))
           (btor57 input_source_a)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state input_source_a)))
           (btor58 input_source_b)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state input_source_b)))
           (btor59 intended_device_family)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state intended_device_family)))
           (btor60 lpm_hint)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state lpm_hint)))
           (btor61 lpm_type)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state lpm_type)))
           (btor62 mult_round)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state mult_round)))
           (btor63 mult_round_aclr)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state mult_round_aclr)))
           (btor64 mult_round_reg)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state mult_round_reg)))
           (btor65 mult_saturation)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state mult_saturation)))
           (btor66 mult_saturation_aclr)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state mult_saturation_aclr)))
           (btor67 mult_saturation_reg)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state mult_saturation_reg)))
           (btor68 multiplier1_direction)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state multiplier1_direction)))
           (btor69 multiplier3_direction)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state multiplier3_direction)))
           (btor70 multiplier_aclr)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state multiplier_aclr)))
           (btor71 multiplier_reg)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state multiplier_reg)))
           (btor72 output_aclr)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state output_aclr)))
           (btor73 output_reg)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state output_reg)))
           (btor74 port_accum_is_saturated)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state port_accum_is_saturated)))
           (btor75 port_addnsub)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state port_addnsub)))
           (btor76 port_mult_is_saturated)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state port_mult_is_saturated)))
           (btor77 port_signa)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state port_signa)))
           (btor78 port_signb)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state port_signb)))
           (btor79 representation_a)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state representation_a)))
           (btor80 representation_b)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state representation_b)))
           (btor81 scanina)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state scanina)))
           (btor82 scaninb)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state scaninb)))
           (btor83 sign_aclr_a)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state sign_aclr_a)))
           (btor84 sign_aclr_b)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state sign_aclr_b)))
           (btor85 sign_pipeline_aclr_a)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state sign_pipeline_aclr_a)))
           (btor86 sign_pipeline_aclr_b)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state sign_pipeline_aclr_b)))
           (btor87 sign_pipeline_reg_a)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state sign_pipeline_reg_a)))
           (btor88 sign_pipeline_reg_b)
           (merged-input-state-hash
            (append
             merged-input-state-hash
             (signal-state sign_pipeline_reg_b)))
           (btor89 sign_reg_a)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state sign_reg_a)))
           (btor90 sign_reg_b)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state sign_reg_b)))
           (btor91 signa)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state signa)))
           (btor92 signb)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state signb)))
           (btor93 sourcea)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state sourcea)))
           (btor94 sourceb)
           (merged-input-state-hash
            (append merged-input-state-hash (signal-state sourceb)))
           (btor95 (bv->signal (bv 0 (bitvector 1))))
           (btor96
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state96)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state96)))
                     ((assoc-has-key? init-hash 'state96)
                      (bv->signal (assoc-ref init-hash 'state96)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor98
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state98)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state98)))
                     ((assoc-has-key? init-hash 'state98)
                      (bv->signal (assoc-ref init-hash 'state98)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor100 (bv->signal (bv 1 (bitvector 1))))
           (btor101
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state101)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state101)))
                     ((assoc-has-key? init-hash 'state101)
                      (bv->signal (assoc-ref init-hash 'state101)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor103 (bitvector 4))
           (btor104 (bv->signal (bv 9 (bitvector 4))))
           (btor105
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor106
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor105)))
             (list)))
           (btor107
            (if (bitvector->bool (signal-value btor106)) btor36 btor95))
           (btor108 (bv->signal (bv 8 (bitvector 4))))
           (btor109
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor110
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor109)))
             (list)))
           (btor111
            (if (bitvector->bool (signal-value btor110)) btor35 btor107))
           (btor112 (bv->signal (bv 7 (bitvector 3))))
           (btor113
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor114
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor113)))
             (list)))
           (btor115
            (if (bitvector->bool (signal-value btor114)) btor34 btor111))
           (btor116 (bv->signal (bv 23 (bitvector 5))))
           (btor117
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor116)))
             (list)))
           (btor118
            (if (bitvector->bool (signal-value btor117)) btor95 btor115))
           (btor119 (bv->signal (bv 6 (bitvector 3))))
           (btor120
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor121
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor120)))
             (list)))
           (btor122
            (if (bitvector->bool (signal-value btor121)) btor33 btor118))
           (btor123 (bitvector 2))
           (btor124
            (signal
             (concat (signal-value btor122) (signal-value btor101))
             (list)))
           (btor125 (bv->signal (bv 2 (bitvector 2))))
           (btor126
            (signal
             (bool->bitvector
              (bveq (signal-value btor124) (signal-value btor125)))
             (list)))
           (btor127
            (if (bitvector->bool (signal-value btor126)) btor98 btor96))
           (btor129
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state129)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state129)))
                     ((assoc-has-key? init-hash 'state129)
                      (bv->signal (assoc-ref init-hash 'state129)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor131
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state131)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state131)))
                     ((assoc-has-key? init-hash 'state131)
                      (bv->signal (assoc-ref init-hash 'state131)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor133
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state133)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state133)))
                     ((assoc-has-key? init-hash 'state133)
                      (bv->signal (assoc-ref init-hash 'state133)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor135
            (signal
             (concat (signal-value btor122) (signal-value btor133))
             (list)))
           (btor136
            (signal
             (bool->bitvector
              (bveq (signal-value btor135) (signal-value btor125)))
             (list)))
           (btor137
            (if (bitvector->bool (signal-value btor136)) btor131 btor129))
           (btor139
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state139)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state139)))
                     ((assoc-has-key? init-hash 'state139)
                      (bv->signal (assoc-ref init-hash 'state139)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor141
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state141)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state141)))
                     ((assoc-has-key? init-hash 'state141)
                      (bv->signal (assoc-ref init-hash 'state141)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor143
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state143)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state143)))
                     ((assoc-has-key? init-hash 'state143)
                      (bv->signal (assoc-ref init-hash 'state143)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor145
            (signal
             (concat (signal-value btor122) (signal-value btor143))
             (list)))
           (btor146
            (signal
             (bool->bitvector
              (bveq (signal-value btor145) (signal-value btor125)))
             (list)))
           (btor147
            (if (bitvector->bool (signal-value btor146)) btor141 btor139))
           (btor149 (bitvector 36))
           (btor150 (bv->signal (bv 0 (bitvector 36))))
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
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor153
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state153)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state153)))
                     ((assoc-has-key? init-hash 'state153)
                      (bv->signal (assoc-ref init-hash 'state153)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor155
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state155)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state155)))
                     ((assoc-has-key? init-hash 'state155)
                      (bv->signal (assoc-ref init-hash 'state155)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor157
            (signal
             (concat (signal-value btor122) (signal-value btor155))
             (list)))
           (btor158
            (signal
             (bool->bitvector
              (bveq (signal-value btor157) (signal-value btor125)))
             (list)))
           (btor159
            (if (bitvector->bool (signal-value btor158)) btor153 btor151))
           (btor161 (bv->signal (bv 0 (bitvector 18))))
           (btor162
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state162)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state162)))
                     ((assoc-has-key? init-hash 'state162)
                      (bv->signal (assoc-ref init-hash 'state162)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor164
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state164)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state164)))
                     ((assoc-has-key? init-hash 'state164)
                      (bv->signal (assoc-ref init-hash 'state164)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor166
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state166)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state166)))
                     ((assoc-has-key? init-hash 'state166)
                      (bv->signal (assoc-ref init-hash 'state166)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor168
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor169
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor168)))
             (list)))
           (btor170
            (if (bitvector->bool (signal-value btor169)) btor36 btor95))
           (btor171
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor172
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor171)))
             (list)))
           (btor173
            (if (bitvector->bool (signal-value btor172)) btor35 btor170))
           (btor174
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor175
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor174)))
             (list)))
           (btor176
            (if (bitvector->bool (signal-value btor175)) btor34 btor173))
           (btor177
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor116)))
             (list)))
           (btor178
            (if (bitvector->bool (signal-value btor177)) btor95 btor176))
           (btor179
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor180
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor179)))
             (list)))
           (btor181
            (if (bitvector->bool (signal-value btor180)) btor33 btor178))
           (btor182
            (signal
             (concat (signal-value btor181) (signal-value btor166))
             (list)))
           (btor183
            (signal
             (bool->bitvector
              (bveq (signal-value btor182) (signal-value btor125)))
             (list)))
           (btor184
            (if (bitvector->bool (signal-value btor183)) btor164 btor162))
           (btor185
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor186
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor185)))
             (list)))
           (btor187
            (if (bitvector->bool (signal-value btor186)) btor26 btor95))
           (btor188
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor189
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor188)))
             (list)))
           (btor190
            (if (bitvector->bool (signal-value btor189)) btor25 btor187))
           (btor191
            (signal
             (apply bvor (bitvector->bits (signal-value btor53)))
             (signal-state btor53)))
           (btor192 (signal (bvnot (signal-value btor191)) (list)))
           (btor193
            (if (bitvector->bool (signal-value btor192)) btor24 btor190))
           (btor194 (bv->signal (bv 25 (bitvector 5))))
           (btor195
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor194)))
             (list)))
           (btor196
            (if (bitvector->bool (signal-value btor195)) btor95 btor193))
           (btor197 (bv->signal (bv 3 (bitvector 2))))
           (btor198
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor199
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor198)))
             (list)))
           (btor200
            (if (bitvector->bool (signal-value btor199)) btor27 btor196))
           (btor201
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state201)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state201)))
                     ((assoc-has-key? init-hash 'state201)
                      (bv->signal (assoc-ref init-hash 'state201)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor202
            (signal
             (bvor (signal-value btor200) (signal-value btor201))
             (list)))
           (btor203
            (if (bitvector->bool (signal-value btor202)) btor161 btor184))
           (btor204 (bv->signal (bv 17 (bitvector 5))))
           (btor205
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor204)))
             (list)))
           (btor206
            (signal
             (bvor (signal-value btor205) (signal-value btor93))
             (list)))
           (btor207
            (if (bitvector->bool (signal-value btor206)) btor81 btor43))
           (btor208 (bv->signal (bv 10 (bitvector 4))))
           (btor209
            (bv->signal
             (zero-extend (signal-value btor208) (bitvector 5))
             btor208))
           (btor210
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor209)))
             (list)))
           (btor211
            (if (bitvector->bool (signal-value btor210)) btor43 btor207))
           (btor212
            (if (bitvector->bool (signal-value btor177)) btor211 btor203))
           (btor214
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state214)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state214)))
                     ((assoc-has-key? init-hash 'state214)
                      (bv->signal (assoc-ref init-hash 'state214)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor216
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state216)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state216)))
                     ((assoc-has-key? init-hash 'state216)
                      (bv->signal (assoc-ref init-hash 'state216)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor218
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state218)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state218)))
                     ((assoc-has-key? init-hash 'state218)
                      (bv->signal (assoc-ref init-hash 'state218)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor220
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor221
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor220)))
             (list)))
           (btor222
            (if (bitvector->bool (signal-value btor221)) btor36 btor95))
           (btor223
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor224
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor223)))
             (list)))
           (btor225
            (if (bitvector->bool (signal-value btor224)) btor35 btor222))
           (btor226
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor227
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor226)))
             (list)))
           (btor228
            (if (bitvector->bool (signal-value btor227)) btor34 btor225))
           (btor229
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor116)))
             (list)))
           (btor230
            (if (bitvector->bool (signal-value btor229)) btor95 btor228))
           (btor231
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor232
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor231)))
             (list)))
           (btor233
            (if (bitvector->bool (signal-value btor232)) btor33 btor230))
           (btor234
            (signal
             (concat (signal-value btor233) (signal-value btor218))
             (list)))
           (btor235
            (signal
             (bool->bitvector
              (bveq (signal-value btor234) (signal-value btor125)))
             (list)))
           (btor236
            (if (bitvector->bool (signal-value btor235)) btor216 btor214))
           (btor237
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor238
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor237)))
             (list)))
           (btor239
            (if (bitvector->bool (signal-value btor238)) btor26 btor95))
           (btor240
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor241
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor240)))
             (list)))
           (btor242
            (if (bitvector->bool (signal-value btor241)) btor25 btor239))
           (btor243
            (signal
             (apply bvor (bitvector->bits (signal-value btor54)))
             (signal-state btor54)))
           (btor244 (signal (bvnot (signal-value btor243)) (list)))
           (btor245
            (if (bitvector->bool (signal-value btor244)) btor24 btor242))
           (btor246
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor194)))
             (list)))
           (btor247
            (if (bitvector->bool (signal-value btor246)) btor95 btor245))
           (btor248
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor249
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor248)))
             (list)))
           (btor250
            (if (bitvector->bool (signal-value btor249)) btor27 btor247))
           (btor251
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state251)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state251)))
                     ((assoc-has-key? init-hash 'state251)
                      (bv->signal (assoc-ref init-hash 'state251)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor252
            (signal
             (bvor (signal-value btor250) (signal-value btor251))
             (list)))
           (btor253
            (if (bitvector->bool (signal-value btor252)) btor161 btor236))
           (btor254 (bv->signal (bv 18 (bitvector 5))))
           (btor255
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor254)))
             (list)))
           (btor256
            (signal
             (bvor (signal-value btor255) (signal-value btor94))
             (list)))
           (btor257
            (if (bitvector->bool (signal-value btor256)) btor82 btor44))
           (btor258 (bv->signal (bv 11 (bitvector 4))))
           (btor259
            (bv->signal
             (zero-extend (signal-value btor258) (bitvector 5))
             btor258))
           (btor260
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor259)))
             (list)))
           (btor261
            (if (bitvector->bool (signal-value btor260)) btor44 btor257))
           (btor262
            (if (bitvector->bool (signal-value btor229)) btor261 btor253))
           (btor264
            (bv->signal
             (zero-extend (signal-value btor127) (bitvector 1))
             btor127))
           (btor265
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state265)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state265)))
                     ((assoc-has-key? init-hash 'state265)
                      (bv->signal (assoc-ref init-hash 'state265)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor267
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state267)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state267)))
                     ((assoc-has-key? init-hash 'state267)
                      (bv->signal (assoc-ref init-hash 'state267)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor269
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state269)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state269)))
                     ((assoc-has-key? init-hash 'state269)
                      (bv->signal (assoc-ref init-hash 'state269)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor271
            (signal
             (concat (signal-value btor122) (signal-value btor269))
             (list)))
           (btor272
            (signal
             (bool->bitvector
              (bveq (signal-value btor271) (signal-value btor125)))
             (list)))
           (btor273
            (if (bitvector->bool (signal-value btor272)) btor267 btor265))
           (btor274
            (bv->signal
             (zero-extend (signal-value btor273) (bitvector 36))
             btor273))
           (btor275
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state275)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state275)))
                     ((assoc-has-key? init-hash 'state275)
                      (bv->signal (assoc-ref init-hash 'state275)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor277
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state277)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state277)))
                     ((assoc-has-key? init-hash 'state277)
                      (bv->signal (assoc-ref init-hash 'state277)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor279
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state279)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state279)))
                     ((assoc-has-key? init-hash 'state279)
                      (bv->signal (assoc-ref init-hash 'state279)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor281
            (signal
             (concat (signal-value btor122) (signal-value btor279))
             (list)))
           (btor282
            (signal
             (bool->bitvector
              (bveq (signal-value btor281) (signal-value btor125)))
             (list)))
           (btor283
            (if (bitvector->bool (signal-value btor282)) btor277 btor275))
           (btor284
            (bv->signal
             (zero-extend (signal-value btor283) (bitvector 1))
             btor283))
           (btor285
            (bv->signal
             (zero-extend (signal-value btor19) (bitvector 1))
             btor19))
           (btor286
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor287
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor286)))
             (list)))
           (btor288
            (if (bitvector->bool (signal-value btor287)) btor36 btor95))
           (btor289
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor290
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor289)))
             (list)))
           (btor291
            (if (bitvector->bool (signal-value btor290)) btor35 btor288))
           (btor292
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor293
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor292)))
             (list)))
           (btor294
            (if (bitvector->bool (signal-value btor293)) btor34 btor291))
           (btor295
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor116)))
             (list)))
           (btor296
            (if (bitvector->bool (signal-value btor295)) btor95 btor294))
           (btor297
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor298
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor297)))
             (list)))
           (btor299
            (if (bitvector->bool (signal-value btor298)) btor33 btor296))
           (btor300
            (bv->signal
             (zero-extend (signal-value btor299) (bitvector 1))
             btor299))
           (btor301
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor302
            (signal
             (bool->bitvector
              (bveq (signal-value btor21) (signal-value btor301)))
             (list)))
           (btor303
            (if (bitvector->bool (signal-value btor302)) btor26 btor95))
           (btor304
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor305
            (signal
             (bool->bitvector
              (bveq (signal-value btor21) (signal-value btor304)))
             (list)))
           (btor306
            (if (bitvector->bool (signal-value btor305)) btor25 btor303))
           (btor307
            (signal
             (apply bvor (bitvector->bits (signal-value btor21)))
             (signal-state btor21)))
           (btor308 (signal (bvnot (signal-value btor307)) (list)))
           (btor309
            (if (bitvector->bool (signal-value btor308)) btor24 btor306))
           (btor310
            (signal
             (bool->bitvector
              (bveq (signal-value btor21) (signal-value btor194)))
             (list)))
           (btor311
            (if (bitvector->bool (signal-value btor310)) btor95 btor309))
           (btor312
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor313
            (signal
             (bool->bitvector
              (bveq (signal-value btor21) (signal-value btor312)))
             (list)))
           (btor314
            (if (bitvector->bool (signal-value btor313)) btor27 btor311))
           (btor315
            (bv->signal
             (zero-extend (signal-value btor314) (bitvector 1))
             btor314))
           (btor316
            (if (bitvector->bool (signal-value btor287)) btor52 btor100))
           (btor317
            (if (bitvector->bool (signal-value btor290)) btor51 btor316))
           (btor318
            (if (bitvector->bool (signal-value btor293)) btor50 btor317))
           (btor319
            (if (bitvector->bool (signal-value btor295)) btor100 btor318))
           (btor320
            (if (bitvector->bool (signal-value btor298)) btor49 btor319))
           (btor321
            (bv->signal
             (zero-extend (signal-value btor320) (bitvector 1))
             btor320))
           (btor322
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor323
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor322)))
             (list)))
           (btor324
            (if (bitvector->bool (signal-value btor323)) btor36 btor95))
           (btor325
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor326
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor325)))
             (list)))
           (btor327
            (if (bitvector->bool (signal-value btor326)) btor35 btor324))
           (btor328
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor329
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor328)))
             (list)))
           (btor330
            (if (bitvector->bool (signal-value btor329)) btor34 btor327))
           (btor331
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor116)))
             (list)))
           (btor332
            (if (bitvector->bool (signal-value btor331)) btor95 btor330))
           (btor333
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor334
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor333)))
             (list)))
           (btor335
            (if (bitvector->bool (signal-value btor334)) btor33 btor332))
           (btor336
            (bv->signal
             (zero-extend (signal-value btor335) (bitvector 1))
             btor335))
           (btor337
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor338
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor337)))
             (list)))
           (btor339
            (if (bitvector->bool (signal-value btor338)) btor26 btor95))
           (btor340
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor341
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor340)))
             (list)))
           (btor342
            (if (bitvector->bool (signal-value btor341)) btor25 btor339))
           (btor343
            (signal
             (apply bvor (bitvector->bits (signal-value btor20)))
             (signal-state btor20)))
           (btor344 (signal (bvnot (signal-value btor343)) (list)))
           (btor345
            (if (bitvector->bool (signal-value btor344)) btor24 btor342))
           (btor346
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor194)))
             (list)))
           (btor347
            (if (bitvector->bool (signal-value btor346)) btor95 btor345))
           (btor348
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor349
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor348)))
             (list)))
           (btor350
            (if (bitvector->bool (signal-value btor349)) btor27 btor347))
           (btor351
            (bv->signal
             (zero-extend (signal-value btor350) (bitvector 1))
             btor350))
           (btor352
            (if (bitvector->bool (signal-value btor323)) btor52 btor100))
           (btor353
            (if (bitvector->bool (signal-value btor326)) btor51 btor352))
           (btor354
            (if (bitvector->bool (signal-value btor329)) btor50 btor353))
           (btor355
            (if (bitvector->bool (signal-value btor331)) btor100 btor354))
           (btor356
            (if (bitvector->bool (signal-value btor334)) btor49 btor355))
           (btor357
            (bv->signal
             (zero-extend (signal-value btor356) (bitvector 1))
             btor356))
           (btor358
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state358)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state358)))
                     ((assoc-has-key? init-hash 'state358)
                      (bv->signal (assoc-ref init-hash 'state358)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor360
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state360)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state360)))
                     ((assoc-has-key? init-hash 'state360)
                      (bv->signal (assoc-ref init-hash 'state360)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor362
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state362)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state362)))
                     ((assoc-has-key? init-hash 'state362)
                      (bv->signal (assoc-ref init-hash 'state362)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor364
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor365
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor364)))
             (list)))
           (btor366
            (if (bitvector->bool (signal-value btor365)) btor36 btor95))
           (btor367
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor368
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor367)))
             (list)))
           (btor369
            (if (bitvector->bool (signal-value btor368)) btor35 btor366))
           (btor370
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor371
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor370)))
             (list)))
           (btor372
            (if (bitvector->bool (signal-value btor371)) btor34 btor369))
           (btor373
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor116)))
             (list)))
           (btor374
            (if (bitvector->bool (signal-value btor373)) btor95 btor372))
           (btor375
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor376
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor375)))
             (list)))
           (btor377
            (if (bitvector->bool (signal-value btor376)) btor33 btor374))
           (btor378
            (signal
             (concat (signal-value btor377) (signal-value btor362))
             (list)))
           (btor379
            (signal
             (bool->bitvector
              (bveq (signal-value btor378) (signal-value btor125)))
             (list)))
           (btor380
            (if (bitvector->bool (signal-value btor379)) btor360 btor358))
           (btor381
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor382
            (signal
             (bool->bitvector
              (bveq (signal-value btor30) (signal-value btor381)))
             (list)))
           (btor383
            (if (bitvector->bool (signal-value btor382)) btor26 btor95))
           (btor384
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor385
            (signal
             (bool->bitvector
              (bveq (signal-value btor30) (signal-value btor384)))
             (list)))
           (btor386
            (if (bitvector->bool (signal-value btor385)) btor25 btor383))
           (btor387
            (signal
             (apply bvor (bitvector->bits (signal-value btor30)))
             (signal-state btor30)))
           (btor388 (signal (bvnot (signal-value btor387)) (list)))
           (btor389
            (if (bitvector->bool (signal-value btor388)) btor24 btor386))
           (btor390
            (signal
             (bool->bitvector
              (bveq (signal-value btor30) (signal-value btor194)))
             (list)))
           (btor391
            (if (bitvector->bool (signal-value btor390)) btor95 btor389))
           (btor392
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor393
            (signal
             (bool->bitvector
              (bveq (signal-value btor30) (signal-value btor392)))
             (list)))
           (btor394
            (if (bitvector->bool (signal-value btor393)) btor27 btor391))
           (btor395
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state395)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state395)))
                     ((assoc-has-key? init-hash 'state395)
                      (bv->signal (assoc-ref init-hash 'state395)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor396
            (signal
             (bvor (signal-value btor394) (signal-value btor395))
             (list)))
           (btor397
            (if (bitvector->bool (signal-value btor396)) btor95 btor380))
           (btor398
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state398)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state398)))
                     ((assoc-has-key? init-hash 'state398)
                      (bv->signal (assoc-ref init-hash 'state398)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor400
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state400)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state400)))
                     ((assoc-has-key? init-hash 'state400)
                      (bv->signal (assoc-ref init-hash 'state400)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor402
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state402)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state402)))
                     ((assoc-has-key? init-hash 'state402)
                      (bv->signal (assoc-ref init-hash 'state402)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor404
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor405
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor404)))
             (list)))
           (btor406
            (if (bitvector->bool (signal-value btor405)) btor36 btor95))
           (btor407
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor408
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor407)))
             (list)))
           (btor409
            (if (bitvector->bool (signal-value btor408)) btor35 btor406))
           (btor410
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor411
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor410)))
             (list)))
           (btor412
            (if (bitvector->bool (signal-value btor411)) btor34 btor409))
           (btor413
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor116)))
             (list)))
           (btor414
            (if (bitvector->bool (signal-value btor413)) btor95 btor412))
           (btor415
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor416
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor415)))
             (list)))
           (btor417
            (if (bitvector->bool (signal-value btor416)) btor33 btor414))
           (btor418
            (signal
             (concat (signal-value btor417) (signal-value btor402))
             (list)))
           (btor419
            (signal
             (bool->bitvector
              (bveq (signal-value btor418) (signal-value btor125)))
             (list)))
           (btor420
            (if (bitvector->bool (signal-value btor419)) btor400 btor398))
           (btor421
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor422
            (signal
             (bool->bitvector
              (bveq (signal-value btor29) (signal-value btor421)))
             (list)))
           (btor423
            (if (bitvector->bool (signal-value btor422)) btor26 btor95))
           (btor424
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor425
            (signal
             (bool->bitvector
              (bveq (signal-value btor29) (signal-value btor424)))
             (list)))
           (btor426
            (if (bitvector->bool (signal-value btor425)) btor25 btor423))
           (btor427
            (signal
             (apply bvor (bitvector->bits (signal-value btor29)))
             (signal-state btor29)))
           (btor428 (signal (bvnot (signal-value btor427)) (list)))
           (btor429
            (if (bitvector->bool (signal-value btor428)) btor24 btor426))
           (btor430
            (signal
             (bool->bitvector
              (bveq (signal-value btor29) (signal-value btor194)))
             (list)))
           (btor431
            (if (bitvector->bool (signal-value btor430)) btor95 btor429))
           (btor432
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor433
            (signal
             (bool->bitvector
              (bveq (signal-value btor29) (signal-value btor432)))
             (list)))
           (btor434
            (if (bitvector->bool (signal-value btor433)) btor27 btor431))
           (btor435
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state435)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state435)))
                     ((assoc-has-key? init-hash 'state435)
                      (bv->signal (assoc-ref init-hash 'state435)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor436
            (signal
             (bvor (signal-value btor434) (signal-value btor435))
             (list)))
           (btor437
            (if (bitvector->bool (signal-value btor436)) btor95 btor420))
           (btor438
            (if (bitvector->bool (signal-value btor413)) btor28 btor437))
           (btor439
            (if (bitvector->bool (signal-value btor373)) btor438 btor397))
           (btor440 (bv->signal (bv 4 (bitvector 3))))
           (btor441
            (bv->signal
             (zero-extend (signal-value btor440) (bitvector 5))
             btor440))
           (btor442
            (signal
             (bool->bitvector
              (bveq (signal-value btor2) (signal-value btor441)))
             (list)))
           (btor443
            (if (bitvector->bool (signal-value btor442)) btor100 btor95))
           (btor444 (bv->signal (bv 15 (bitvector 4))))
           (btor445
            (bv->signal
             (zero-extend (signal-value btor444) (bitvector 5))
             btor444))
           (btor446
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor445)))
             (list)))
           (btor447
            (if (bitvector->bool (signal-value btor446)) btor443 btor439))
           (btor448 (bv->signal (bv 16 (bitvector 5))))
           (btor449
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor448)))
             (list)))
           (btor450
            (if (bitvector->bool (signal-value btor449)) btor439 btor447))
           (btor451
            (bv->signal
             (zero-extend (signal-value btor450) (bitvector 1))
             btor450))
           (btor452
            (bv->signal
             (zero-extend (signal-value btor438) (bitvector 1))
             btor438))
           (btor453
            (bv->signal
             (zero-extend (signal-value btor397) (bitvector 1))
             btor397))
           (btor454
            (bv->signal
             (zero-extend (signal-value btor439) (bitvector 1))
             btor439))
           (btor455
            (bv->signal
             (zero-extend (signal-value btor377) (bitvector 1))
             btor377))
           (btor456
            (bv->signal
             (zero-extend (signal-value btor394) (bitvector 1))
             btor394))
           (btor457
            (if (bitvector->bool (signal-value btor365)) btor52 btor100))
           (btor458
            (if (bitvector->bool (signal-value btor368)) btor51 btor457))
           (btor459
            (if (bitvector->bool (signal-value btor371)) btor50 btor458))
           (btor460
            (if (bitvector->bool (signal-value btor373)) btor100 btor459))
           (btor461
            (if (bitvector->bool (signal-value btor376)) btor49 btor460))
           (btor462
            (bv->signal
             (zero-extend (signal-value btor461) (bitvector 1))
             btor461))
           (btor463
            (bv->signal
             (zero-extend (signal-value btor437) (bitvector 1))
             btor437))
           (btor464
            (bv->signal
             (zero-extend (signal-value btor438) (bitvector 1))
             btor438))
           (btor465
            (bv->signal
             (zero-extend (signal-value btor417) (bitvector 1))
             btor417))
           (btor466
            (bv->signal
             (zero-extend (signal-value btor434) (bitvector 1))
             btor434))
           (btor467
            (if (bitvector->bool (signal-value btor405)) btor52 btor100))
           (btor468
            (if (bitvector->bool (signal-value btor408)) btor51 btor467))
           (btor469
            (if (bitvector->bool (signal-value btor411)) btor50 btor468))
           (btor470
            (if (bitvector->bool (signal-value btor413)) btor100 btor469))
           (btor471
            (if (bitvector->bool (signal-value btor416)) btor49 btor470))
           (btor472
            (bv->signal
             (zero-extend (signal-value btor471) (bitvector 1))
             btor471))
           (btor473
            (bv->signal
             (zero-extend (signal-value btor95) (bitvector 1))
             btor95))
           (btor474 (bitvector 32))
           (btor475 (bv->signal (bv 0 (bitvector 32))))
           (btor476
            (bv->signal
             (zero-extend (signal-value btor475) (bitvector 32))
             btor475))
           (btor477
            (bv->signal
             (zero-extend (signal-value btor475) (bitvector 32))
             btor475))
           (btor478
            (bv->signal
             (zero-extend (signal-value btor181) (bitvector 1))
             btor181))
           (btor479
            (bv->signal
             (zero-extend (signal-value btor200) (bitvector 1))
             btor200))
           (btor480
            (if (bitvector->bool (signal-value btor169)) btor52 btor100))
           (btor481
            (if (bitvector->bool (signal-value btor172)) btor51 btor480))
           (btor482
            (if (bitvector->bool (signal-value btor175)) btor50 btor481))
           (btor483
            (if (bitvector->bool (signal-value btor177)) btor100 btor482))
           (btor484
            (if (bitvector->bool (signal-value btor180)) btor49 btor483))
           (btor485
            (bv->signal
             (zero-extend (signal-value btor484) (bitvector 1))
             btor484))
           (btor486
            (bv->signal
             (zero-extend (signal-value btor233) (bitvector 1))
             btor233))
           (btor487
            (bv->signal
             (zero-extend (signal-value btor250) (bitvector 1))
             btor250))
           (btor488
            (if (bitvector->bool (signal-value btor221)) btor52 btor100))
           (btor489
            (if (bitvector->bool (signal-value btor224)) btor51 btor488))
           (btor490
            (if (bitvector->bool (signal-value btor227)) btor50 btor489))
           (btor491
            (if (bitvector->bool (signal-value btor229)) btor100 btor490))
           (btor492
            (if (bitvector->bool (signal-value btor232)) btor49 btor491))
           (btor493
            (bv->signal
             (zero-extend (signal-value btor492) (bitvector 1))
             btor492))
           (btor494 unnamed-input-494)
           (btor495
            (bv->signal
             (zero-extend (signal-value btor494) (bitvector 1))
             btor494))
           (btor496 unnamed-input-496)
           (btor497
            (bv->signal
             (zero-extend (signal-value btor496) (bitvector 1))
             btor496))
           (btor498 (bitvector 39))
           (btor499 (bv->signal (bv 0 (bitvector 39))))
           (btor500
            (bv->signal
             (zero-extend (signal-value btor499) (bitvector 39))
             btor499))
           (btor501
            (bv->signal
             (zero-extend (signal-value btor203) (bitvector 18))
             btor203))
           (btor502
            (bv->signal
             (zero-extend (signal-value btor211) (bitvector 18))
             btor211))
           (btor503
            (bv->signal
             (zero-extend (signal-value btor212) (bitvector 18))
             btor212))
           (btor504
            (bv->signal
             (zero-extend (signal-value btor253) (bitvector 18))
             btor253))
           (btor505
            (bv->signal
             (zero-extend (signal-value btor261) (bitvector 18))
             btor261))
           (btor506
            (bv->signal
             (zero-extend (signal-value btor262) (bitvector 18))
             btor262))
           (btor507
            (bv->signal
             (zero-extend (signal-value btor212) (bitvector 36))
             btor212))
           (btor508
            (bv->signal
             (zero-extend (signal-value btor262) (bitvector 36))
             btor262))
           (btor509
            (signal
             (bvmul (signal-value btor507) (signal-value btor508))
             (list)))
           (btor510
            (bv->signal
             (sign-extend (signal-value btor212) (bitvector 36))
             btor212))
           (btor511
            (bv->signal
             (sign-extend (signal-value btor262) (bitvector 36))
             btor262))
           (btor512
            (signal
             (bvmul (signal-value btor510) (signal-value btor511))
             (list)))
           (btor513
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state513)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state513)))
                     ((assoc-has-key? init-hash 'state513)
                      (bv->signal (assoc-ref init-hash 'state513)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor515
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state515)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state515)))
                     ((assoc-has-key? init-hash 'state515)
                      (bv->signal (assoc-ref init-hash 'state515)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor517
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state517)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state517)))
                     ((assoc-has-key? init-hash 'state517)
                      (bv->signal (assoc-ref init-hash 'state517)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor519
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor520
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor519)))
             (list)))
           (btor521
            (if (bitvector->bool (signal-value btor520)) btor36 btor95))
           (btor522
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor523
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor522)))
             (list)))
           (btor524
            (if (bitvector->bool (signal-value btor523)) btor35 btor521))
           (btor525
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor526
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor525)))
             (list)))
           (btor527
            (if (bitvector->bool (signal-value btor526)) btor34 btor524))
           (btor528
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor116)))
             (list)))
           (btor529
            (if (bitvector->bool (signal-value btor528)) btor95 btor527))
           (btor530
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor531
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor530)))
             (list)))
           (btor532
            (if (bitvector->bool (signal-value btor531)) btor33 btor529))
           (btor533
            (signal
             (concat (signal-value btor532) (signal-value btor517))
             (list)))
           (btor534
            (signal
             (bool->bitvector
              (bveq (signal-value btor533) (signal-value btor125)))
             (list)))
           (btor535
            (if (bitvector->bool (signal-value btor534)) btor515 btor513))
           (btor536
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor537
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor536)))
             (list)))
           (btor538
            (if (bitvector->bool (signal-value btor537)) btor26 btor95))
           (btor539
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor540
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor539)))
             (list)))
           (btor541
            (if (bitvector->bool (signal-value btor540)) btor25 btor538))
           (btor542
            (signal
             (apply bvor (bitvector->bits (signal-value btor83)))
             (signal-state btor83)))
           (btor543 (signal (bvnot (signal-value btor542)) (list)))
           (btor544
            (if (bitvector->bool (signal-value btor543)) btor24 btor541))
           (btor545
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor194)))
             (list)))
           (btor546
            (if (bitvector->bool (signal-value btor545)) btor95 btor544))
           (btor547
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor548
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor547)))
             (list)))
           (btor549
            (if (bitvector->bool (signal-value btor548)) btor27 btor546))
           (btor550
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state550)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state550)))
                     ((assoc-has-key? init-hash 'state550)
                      (bv->signal (assoc-ref init-hash 'state550)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor551
            (signal
             (bvor (signal-value btor549) (signal-value btor550))
             (list)))
           (btor552
            (if (bitvector->bool (signal-value btor551)) btor95 btor535))
           (btor553
            (if (bitvector->bool (signal-value btor528)) btor91 btor552))
           (btor554 (bv->signal (bv 19 (bitvector 5))))
           (btor555
            (signal
             (bool->bitvector
              (bveq (signal-value btor79) (signal-value btor554)))
             (list)))
           (btor556
            (if (bitvector->bool (signal-value btor555)) btor100 btor95))
           (btor557
            (bv->signal
             (zero-extend (signal-value btor444) (bitvector 5))
             btor444))
           (btor558
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor557)))
             (list)))
           (btor559
            (if (bitvector->bool (signal-value btor558)) btor556 btor553))
           (btor560
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor448)))
             (list)))
           (btor561
            (if (bitvector->bool (signal-value btor560)) btor553 btor559))
           (btor562
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state562)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state562)))
                     ((assoc-has-key? init-hash 'state562)
                      (bv->signal (assoc-ref init-hash 'state562)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor564
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state564)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state564)))
                     ((assoc-has-key? init-hash 'state564)
                      (bv->signal (assoc-ref init-hash 'state564)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor566
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state566)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state566)))
                     ((assoc-has-key? init-hash 'state566)
                      (bv->signal (assoc-ref init-hash 'state566)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor568
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor569
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor568)))
             (list)))
           (btor570
            (if (bitvector->bool (signal-value btor569)) btor36 btor95))
           (btor571
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor572
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor571)))
             (list)))
           (btor573
            (if (bitvector->bool (signal-value btor572)) btor35 btor570))
           (btor574
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor575
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor574)))
             (list)))
           (btor576
            (if (bitvector->bool (signal-value btor575)) btor34 btor573))
           (btor577
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor116)))
             (list)))
           (btor578
            (if (bitvector->bool (signal-value btor577)) btor95 btor576))
           (btor579
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor580
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor579)))
             (list)))
           (btor581
            (if (bitvector->bool (signal-value btor580)) btor33 btor578))
           (btor582
            (signal
             (concat (signal-value btor581) (signal-value btor566))
             (list)))
           (btor583
            (signal
             (bool->bitvector
              (bveq (signal-value btor582) (signal-value btor125)))
             (list)))
           (btor584
            (if (bitvector->bool (signal-value btor583)) btor564 btor562))
           (btor585
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor586
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor585)))
             (list)))
           (btor587
            (if (bitvector->bool (signal-value btor586)) btor26 btor95))
           (btor588
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor589
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor588)))
             (list)))
           (btor590
            (if (bitvector->bool (signal-value btor589)) btor25 btor587))
           (btor591
            (signal
             (apply bvor (bitvector->bits (signal-value btor84)))
             (signal-state btor84)))
           (btor592 (signal (bvnot (signal-value btor591)) (list)))
           (btor593
            (if (bitvector->bool (signal-value btor592)) btor24 btor590))
           (btor594
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor194)))
             (list)))
           (btor595
            (if (bitvector->bool (signal-value btor594)) btor95 btor593))
           (btor596
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor597
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor596)))
             (list)))
           (btor598
            (if (bitvector->bool (signal-value btor597)) btor27 btor595))
           (btor599
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state599)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state599)))
                     ((assoc-has-key? init-hash 'state599)
                      (bv->signal (assoc-ref init-hash 'state599)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor600
            (signal
             (bvor (signal-value btor598) (signal-value btor599))
             (list)))
           (btor601
            (if (bitvector->bool (signal-value btor600)) btor95 btor584))
           (btor602
            (if (bitvector->bool (signal-value btor577)) btor92 btor601))
           (btor603
            (signal
             (bool->bitvector
              (bveq (signal-value btor80) (signal-value btor554)))
             (list)))
           (btor604
            (if (bitvector->bool (signal-value btor603)) btor100 btor95))
           (btor605
            (bv->signal
             (zero-extend (signal-value btor444) (bitvector 5))
             btor444))
           (btor606
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor605)))
             (list)))
           (btor607
            (if (bitvector->bool (signal-value btor606)) btor604 btor602))
           (btor608
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor448)))
             (list)))
           (btor609
            (if (bitvector->bool (signal-value btor608)) btor602 btor607))
           (btor610
            (signal
             (bvand (signal-value btor561) (signal-value btor609))
             (list)))
           (btor611
            (if (bitvector->bool (signal-value btor610)) btor512 btor509))
           (btor612
            (bv->signal
             (zero-extend (signal-value btor611) (bitvector 36))
             btor611))
           (btor613
            (bv->signal
             (zero-extend (signal-value btor137) (bitvector 1))
             btor137))
           (btor614
            (bv->signal
             (zero-extend (signal-value btor95) (bitvector 1))
             btor95))
           (btor615
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state615)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state615)))
                     ((assoc-has-key? init-hash 'state615)
                      (bv->signal (assoc-ref init-hash 'state615)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor617
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state617)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state617)))
                     ((assoc-has-key? init-hash 'state617)
                      (bv->signal (assoc-ref init-hash 'state617)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor619
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state619)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state619)))
                     ((assoc-has-key? init-hash 'state619)
                      (bv->signal (assoc-ref init-hash 'state619)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor621
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor622
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor621)))
             (list)))
           (btor623
            (if (bitvector->bool (signal-value btor622)) btor36 btor95))
           (btor624
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor625
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor624)))
             (list)))
           (btor626
            (if (bitvector->bool (signal-value btor625)) btor35 btor623))
           (btor627
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor628
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor627)))
             (list)))
           (btor629
            (if (bitvector->bool (signal-value btor628)) btor34 btor626))
           (btor630
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor116)))
             (list)))
           (btor631
            (if (bitvector->bool (signal-value btor630)) btor95 btor629))
           (btor632
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor633
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor632)))
             (list)))
           (btor634
            (if (bitvector->bool (signal-value btor633)) btor33 btor631))
           (btor635
            (signal
             (concat (signal-value btor634) (signal-value btor619))
             (list)))
           (btor636
            (signal
             (bool->bitvector
              (bveq (signal-value btor635) (signal-value btor125)))
             (list)))
           (btor637
            (if (bitvector->bool (signal-value btor636)) btor617 btor615))
           (btor638
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor639
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor638)))
             (list)))
           (btor640
            (if (bitvector->bool (signal-value btor639)) btor26 btor95))
           (btor641
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor642
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor641)))
             (list)))
           (btor643
            (if (bitvector->bool (signal-value btor642)) btor25 btor640))
           (btor644
            (signal
             (apply bvor (bitvector->bits (signal-value btor70)))
             (signal-state btor70)))
           (btor645 (signal (bvnot (signal-value btor644)) (list)))
           (btor646
            (if (bitvector->bool (signal-value btor645)) btor24 btor643))
           (btor647
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor194)))
             (list)))
           (btor648
            (if (bitvector->bool (signal-value btor647)) btor95 btor646))
           (btor649
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor650
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor649)))
             (list)))
           (btor651
            (if (bitvector->bool (signal-value btor650)) btor27 btor648))
           (btor652
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state652)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state652)))
                     ((assoc-has-key? init-hash 'state652)
                      (bv->signal (assoc-ref init-hash 'state652)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor653
            (signal
             (bvor (signal-value btor651) (signal-value btor652))
             (list)))
           (btor654
            (if (bitvector->bool (signal-value btor653)) btor95 btor637))
           (btor655
            (bv->signal
             (zero-extend (signal-value btor654) (bitvector 1))
             btor654))
           (btor656
            (if (bitvector->bool (signal-value btor630)) btor95 btor654))
           (btor657
            (bv->signal
             (zero-extend (signal-value btor656) (bitvector 1))
             btor656))
           (btor658
            (bv->signal
             (zero-extend (signal-value btor611) (bitvector 36))
             btor611))
           (btor659
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state659)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state659)))
                     ((assoc-has-key? init-hash 'state659)
                      (bv->signal (assoc-ref init-hash 'state659)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor661
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state661)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state661)))
                     ((assoc-has-key? init-hash 'state661)
                      (bv->signal (assoc-ref init-hash 'state661)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor663
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state663)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state663)))
                     ((assoc-has-key? init-hash 'state663)
                      (bv->signal (assoc-ref init-hash 'state663)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor665
            (signal
             (concat (signal-value btor634) (signal-value btor663))
             (list)))
           (btor666
            (signal
             (bool->bitvector
              (bveq (signal-value btor665) (signal-value btor125)))
             (list)))
           (btor667
            (if (bitvector->bool (signal-value btor666)) btor661 btor659))
           (btor668
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state668)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state668)))
                     ((assoc-has-key? init-hash 'state668)
                      (bv->signal (assoc-ref init-hash 'state668)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor669
            (signal
             (bvor (signal-value btor651) (signal-value btor668))
             (list)))
           (btor670
            (if (bitvector->bool (signal-value btor669)) btor150 btor667))
           (btor671
            (bv->signal
             (zero-extend (signal-value btor670) (bitvector 36))
             btor670))
           (btor672
            (bv->signal
             (zero-extend (signal-value btor95) (bitvector 1))
             btor95))
           (btor673
            (bv->signal
             (zero-extend (signal-value btor634) (bitvector 1))
             btor634))
           (btor674
            (bv->signal
             (zero-extend (signal-value btor651) (bitvector 1))
             btor651))
           (btor675
            (if (bitvector->bool (signal-value btor622)) btor52 btor100))
           (btor676
            (if (bitvector->bool (signal-value btor625)) btor51 btor675))
           (btor677
            (if (bitvector->bool (signal-value btor628)) btor50 btor676))
           (btor678
            (if (bitvector->bool (signal-value btor630)) btor100 btor677))
           (btor679
            (if (bitvector->bool (signal-value btor633)) btor49 btor678))
           (btor680
            (bv->signal
             (zero-extend (signal-value btor679) (bitvector 1))
             btor679))
           (btor681
            (bv->signal
             (zero-extend (signal-value btor122) (bitvector 1))
             btor122))
           (btor682
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor683
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor682)))
             (list)))
           (btor684
            (if (bitvector->bool (signal-value btor683)) btor26 btor95))
           (btor685
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor686
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor685)))
             (list)))
           (btor687
            (if (bitvector->bool (signal-value btor686)) btor25 btor684))
           (btor688
            (signal
             (apply bvor (bitvector->bits (signal-value btor72)))
             (signal-state btor72)))
           (btor689 (signal (bvnot (signal-value btor688)) (list)))
           (btor690
            (if (bitvector->bool (signal-value btor689)) btor24 btor687))
           (btor691
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor194)))
             (list)))
           (btor692
            (if (bitvector->bool (signal-value btor691)) btor95 btor690))
           (btor693
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor694
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor693)))
             (list)))
           (btor695
            (if (bitvector->bool (signal-value btor694)) btor27 btor692))
           (btor696
            (bv->signal
             (zero-extend (signal-value btor695) (bitvector 1))
             btor695))
           (btor697
            (if (bitvector->bool (signal-value btor106)) btor52 btor100))
           (btor698
            (if (bitvector->bool (signal-value btor110)) btor51 btor697))
           (btor699
            (if (bitvector->bool (signal-value btor114)) btor50 btor698))
           (btor700
            (if (bitvector->bool (signal-value btor117)) btor100 btor699))
           (btor701
            (if (bitvector->bool (signal-value btor121)) btor49 btor700))
           (btor702
            (bv->signal
             (zero-extend (signal-value btor701) (bitvector 1))
             btor701))
           (btor703
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state703)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state703)))
                     ((assoc-has-key? init-hash 'state703)
                      (bv->signal (assoc-ref init-hash 'state703)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor705
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state705)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state705)))
                     ((assoc-has-key? init-hash 'state705)
                      (bv->signal (assoc-ref init-hash 'state705)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor707
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state707)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state707)))
                     ((assoc-has-key? init-hash 'state707)
                      (bv->signal (assoc-ref init-hash 'state707)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor709
            (signal
             (concat (signal-value btor122) (signal-value btor707))
             (list)))
           (btor710
            (signal
             (bool->bitvector
              (bveq (signal-value btor709) (signal-value btor125)))
             (list)))
           (btor711
            (if (bitvector->bool (signal-value btor710)) btor705 btor703))
           (btor712
            (bv->signal
             (zero-extend (signal-value btor711) (bitvector 36))
             btor711))
           (btor713
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state713)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state713)))
                     ((assoc-has-key? init-hash 'state713)
                      (bv->signal (assoc-ref init-hash 'state713)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor715
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state715)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state715)))
                     ((assoc-has-key? init-hash 'state715)
                      (bv->signal (assoc-ref init-hash 'state715)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor717
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state717)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state717)))
                     ((assoc-has-key? init-hash 'state717)
                      (bv->signal (assoc-ref init-hash 'state717)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor719
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor720
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor719)))
             (list)))
           (btor721
            (if (bitvector->bool (signal-value btor720)) btor36 btor95))
           (btor722
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor723
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor722)))
             (list)))
           (btor724
            (if (bitvector->bool (signal-value btor723)) btor35 btor721))
           (btor725
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor726
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor725)))
             (list)))
           (btor727
            (if (bitvector->bool (signal-value btor726)) btor34 btor724))
           (btor728
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor116)))
             (list)))
           (btor729
            (if (bitvector->bool (signal-value btor728)) btor95 btor727))
           (btor730
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor731
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor730)))
             (list)))
           (btor732
            (if (bitvector->bool (signal-value btor731)) btor33 btor729))
           (btor733
            (signal
             (concat (signal-value btor732) (signal-value btor717))
             (list)))
           (btor734
            (signal
             (bool->bitvector
              (bveq (signal-value btor733) (signal-value btor125)))
             (list)))
           (btor735
            (if (bitvector->bool (signal-value btor734)) btor715 btor713))
           (btor736
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor737
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor736)))
             (list)))
           (btor738
            (if (bitvector->bool (signal-value btor737)) btor26 btor95))
           (btor739
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor740
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor739)))
             (list)))
           (btor741
            (if (bitvector->bool (signal-value btor740)) btor25 btor738))
           (btor742
            (signal
             (apply bvor (bitvector->bits (signal-value btor85)))
             (signal-state btor85)))
           (btor743 (signal (bvnot (signal-value btor742)) (list)))
           (btor744
            (if (bitvector->bool (signal-value btor743)) btor24 btor741))
           (btor745
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor194)))
             (list)))
           (btor746
            (if (bitvector->bool (signal-value btor745)) btor95 btor744))
           (btor747
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor748
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor747)))
             (list)))
           (btor749
            (if (bitvector->bool (signal-value btor748)) btor27 btor746))
           (btor750
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state750)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state750)))
                     ((assoc-has-key? init-hash 'state750)
                      (bv->signal (assoc-ref init-hash 'state750)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor751
            (signal
             (bvor (signal-value btor749) (signal-value btor750))
             (list)))
           (btor752
            (if (bitvector->bool (signal-value btor751)) btor95 btor735))
           (btor753
            (if (bitvector->bool (signal-value btor728)) btor553 btor752))
           (btor754
            (if (bitvector->bool (signal-value btor558)) btor556 btor753))
           (btor755
            (if (bitvector->bool (signal-value btor560)) btor753 btor754))
           (btor756
            (bv->signal
             (zero-extend (signal-value btor755) (bitvector 1))
             btor755))
           (btor757
            (bv->signal
             (zero-extend (signal-value btor752) (bitvector 1))
             btor752))
           (btor758
            (bv->signal
             (zero-extend (signal-value btor753) (bitvector 1))
             btor753))
           (btor759
            (bv->signal
             (zero-extend (signal-value btor552) (bitvector 1))
             btor552))
           (btor760
            (bv->signal
             (zero-extend (signal-value btor561) (bitvector 1))
             btor561))
           (btor761
            (bv->signal
             (zero-extend (signal-value btor553) (bitvector 1))
             btor553))
           (btor762
            (bv->signal
             (zero-extend (signal-value btor532) (bitvector 1))
             btor532))
           (btor763
            (bv->signal
             (zero-extend (signal-value btor549) (bitvector 1))
             btor549))
           (btor764
            (if (bitvector->bool (signal-value btor520)) btor52 btor100))
           (btor765
            (if (bitvector->bool (signal-value btor523)) btor51 btor764))
           (btor766
            (if (bitvector->bool (signal-value btor526)) btor50 btor765))
           (btor767
            (if (bitvector->bool (signal-value btor528)) btor100 btor766))
           (btor768
            (if (bitvector->bool (signal-value btor531)) btor49 btor767))
           (btor769
            (bv->signal
             (zero-extend (signal-value btor768) (bitvector 1))
             btor768))
           (btor770
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state770)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state770)))
                     ((assoc-has-key? init-hash 'state770)
                      (bv->signal (assoc-ref init-hash 'state770)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor772
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state772)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state772)))
                     ((assoc-has-key? init-hash 'state772)
                      (bv->signal (assoc-ref init-hash 'state772)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor774
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state774)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state774)))
                     ((assoc-has-key? init-hash 'state774)
                      (bv->signal (assoc-ref init-hash 'state774)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor776
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor777
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor776)))
             (list)))
           (btor778
            (if (bitvector->bool (signal-value btor777)) btor36 btor95))
           (btor779
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor780
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor779)))
             (list)))
           (btor781
            (if (bitvector->bool (signal-value btor780)) btor35 btor778))
           (btor782
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor783
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor782)))
             (list)))
           (btor784
            (if (bitvector->bool (signal-value btor783)) btor34 btor781))
           (btor785
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor116)))
             (list)))
           (btor786
            (if (bitvector->bool (signal-value btor785)) btor95 btor784))
           (btor787
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor788
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor787)))
             (list)))
           (btor789
            (if (bitvector->bool (signal-value btor788)) btor33 btor786))
           (btor790
            (signal
             (concat (signal-value btor789) (signal-value btor774))
             (list)))
           (btor791
            (signal
             (bool->bitvector
              (bveq (signal-value btor790) (signal-value btor125)))
             (list)))
           (btor792
            (if (bitvector->bool (signal-value btor791)) btor772 btor770))
           (btor793
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor794
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor793)))
             (list)))
           (btor795
            (if (bitvector->bool (signal-value btor794)) btor26 btor95))
           (btor796
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor797
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor796)))
             (list)))
           (btor798
            (if (bitvector->bool (signal-value btor797)) btor25 btor795))
           (btor799
            (signal
             (apply bvor (bitvector->bits (signal-value btor86)))
             (signal-state btor86)))
           (btor800 (signal (bvnot (signal-value btor799)) (list)))
           (btor801
            (if (bitvector->bool (signal-value btor800)) btor24 btor798))
           (btor802
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor194)))
             (list)))
           (btor803
            (if (bitvector->bool (signal-value btor802)) btor95 btor801))
           (btor804
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor805
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor804)))
             (list)))
           (btor806
            (if (bitvector->bool (signal-value btor805)) btor27 btor803))
           (btor807
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state807)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state807)))
                     ((assoc-has-key? init-hash 'state807)
                      (bv->signal (assoc-ref init-hash 'state807)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor808
            (signal
             (bvor (signal-value btor806) (signal-value btor807))
             (list)))
           (btor809
            (if (bitvector->bool (signal-value btor808)) btor95 btor792))
           (btor810
            (if (bitvector->bool (signal-value btor785)) btor602 btor809))
           (btor811
            (if (bitvector->bool (signal-value btor606)) btor604 btor810))
           (btor812
            (if (bitvector->bool (signal-value btor608)) btor810 btor811))
           (btor813
            (bv->signal
             (zero-extend (signal-value btor812) (bitvector 1))
             btor812))
           (btor814
            (bv->signal
             (zero-extend (signal-value btor809) (bitvector 1))
             btor809))
           (btor815
            (bv->signal
             (zero-extend (signal-value btor810) (bitvector 1))
             btor810))
           (btor816
            (bv->signal
             (zero-extend (signal-value btor601) (bitvector 1))
             btor601))
           (btor817
            (bv->signal
             (zero-extend (signal-value btor609) (bitvector 1))
             btor609))
           (btor818
            (bv->signal
             (zero-extend (signal-value btor602) (bitvector 1))
             btor602))
           (btor819
            (bv->signal
             (zero-extend (signal-value btor581) (bitvector 1))
             btor581))
           (btor820
            (bv->signal
             (zero-extend (signal-value btor598) (bitvector 1))
             btor598))
           (btor821
            (if (bitvector->bool (signal-value btor569)) btor52 btor100))
           (btor822
            (if (bitvector->bool (signal-value btor572)) btor51 btor821))
           (btor823
            (if (bitvector->bool (signal-value btor575)) btor50 btor822))
           (btor824
            (if (bitvector->bool (signal-value btor577)) btor100 btor823))
           (btor825
            (if (bitvector->bool (signal-value btor580)) btor49 btor824))
           (btor826
            (bv->signal
             (zero-extend (signal-value btor825) (bitvector 1))
             btor825))
           (btor827
            (bv->signal
             (zero-extend (signal-value btor732) (bitvector 1))
             btor732))
           (btor828
            (bv->signal
             (zero-extend (signal-value btor749) (bitvector 1))
             btor749))
           (btor829
            (if (bitvector->bool (signal-value btor720)) btor52 btor100))
           (btor830
            (if (bitvector->bool (signal-value btor723)) btor51 btor829))
           (btor831
            (if (bitvector->bool (signal-value btor726)) btor50 btor830))
           (btor832
            (if (bitvector->bool (signal-value btor728)) btor100 btor831))
           (btor833
            (if (bitvector->bool (signal-value btor731)) btor49 btor832))
           (btor834
            (bv->signal
             (zero-extend (signal-value btor833) (bitvector 1))
             btor833))
           (btor835
            (bv->signal
             (zero-extend (signal-value btor789) (bitvector 1))
             btor789))
           (btor836
            (bv->signal
             (zero-extend (signal-value btor806) (bitvector 1))
             btor806))
           (btor837
            (if (bitvector->bool (signal-value btor777)) btor52 btor100))
           (btor838
            (if (bitvector->bool (signal-value btor780)) btor51 btor837))
           (btor839
            (if (bitvector->bool (signal-value btor783)) btor50 btor838))
           (btor840
            (if (bitvector->bool (signal-value btor785)) btor100 btor839))
           (btor841
            (if (bitvector->bool (signal-value btor788)) btor49 btor840))
           (btor842
            (bv->signal
             (zero-extend (signal-value btor841) (bitvector 1))
             btor841))
           (btor843
            (bv->signal
             (zero-extend (signal-value btor553) (bitvector 1))
             btor553))
           (btor844
            (bv->signal
             (zero-extend (signal-value btor602) (bitvector 1))
             btor602))
           (btor845
            (bv->signal
             (zero-extend (signal-value btor512) (bitvector 36))
             btor512))
           (btor846
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state846)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state846)))
                     ((assoc-has-key? init-hash 'state846)
                      (bv->signal (assoc-ref init-hash 'state846)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor848
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state848)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state848)))
                     ((assoc-has-key? init-hash 'state848)
                      (bv->signal (assoc-ref init-hash 'state848)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor850
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state850)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state850)))
                     ((assoc-has-key? init-hash 'state850)
                      (bv->signal (assoc-ref init-hash 'state850)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor852
            (signal
             (concat (signal-value btor335) (signal-value btor850))
             (list)))
           (btor853
            (signal
             (bool->bitvector
              (bveq (signal-value btor852) (signal-value btor125)))
             (list)))
           (btor854
            (if (bitvector->bool (signal-value btor853)) btor848 btor846))
           (btor855
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state855)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state855)))
                     ((assoc-has-key? init-hash 'state855)
                      (bv->signal (assoc-ref init-hash 'state855)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor856
            (signal
             (bvor (signal-value btor350) (signal-value btor855))
             (list)))
           (btor857
            (if (bitvector->bool (signal-value btor856)) btor95 btor854))
           (btor858
            (if (bitvector->bool (signal-value btor331)) btor19 btor857))
           (btor859
            (bv->signal
             (zero-extend (signal-value btor858) (bitvector 1))
             btor858))
           (btor860
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state860)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state860)))
                     ((assoc-has-key? init-hash 'state860)
                      (bv->signal (assoc-ref init-hash 'state860)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor862
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state862)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state862)))
                     ((assoc-has-key? init-hash 'state862)
                      (bv->signal (assoc-ref init-hash 'state862)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor864
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state864)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state864)))
                     ((assoc-has-key? init-hash 'state864)
                      (bv->signal (assoc-ref init-hash 'state864)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor866
            (signal
             (concat (signal-value btor299) (signal-value btor864))
             (list)))
           (btor867
            (signal
             (bool->bitvector
              (bveq (signal-value btor866) (signal-value btor125)))
             (list)))
           (btor868
            (if (bitvector->bool (signal-value btor867)) btor862 btor860))
           (btor869
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state869)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state869)))
                     ((assoc-has-key? init-hash 'state869)
                      (bv->signal (assoc-ref init-hash 'state869)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor870
            (signal
             (bvor (signal-value btor314) (signal-value btor869))
             (list)))
           (btor871
            (if (bitvector->bool (signal-value btor870)) btor95 btor868))
           (btor872
            (bv->signal
             (zero-extend (signal-value btor871) (bitvector 1))
             btor871))
           (btor873 (bitvector 35))
           (btor874 (bv->signal (bv 0 (bitvector 35))))
           (btor875
            (signal
             (concat (signal-value btor871) (signal-value btor874))
             (list)))
           (btor876
            (signal
             (concat (signal-value btor858) (signal-value btor874))
             (list)))
           (btor877
            (if (bitvector->bool (signal-value btor295)) btor876 btor875))
           (btor878
            (bv->signal
             (zero-extend (signal-value btor877) (bitvector 36))
             btor877))
           (btor879
            (bv->signal
             (zero-extend (signal-value btor857) (bitvector 1))
             btor857))
           (btor880
            (bv->signal
             (zero-extend (signal-value btor858) (bitvector 1))
             btor858))
           (btor881
            (bv->signal
             (zero-extend (signal-value btor611) (bitvector 36))
             btor611))
           (btor882
            (bv->signal
             (zero-extend (signal-value btor150) (bitvector 36))
             btor150))
           (btor883
            (bv->signal
             (zero-extend (signal-value btor150) (bitvector 36))
             btor150))
           (btor884
            (bv->signal
             (zero-extend (signal-value btor509) (bitvector 36))
             btor509))
           (btor885
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state885)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state885)))
                     ((assoc-has-key? init-hash 'state885)
                      (bv->signal (assoc-ref init-hash 'state885)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor887
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state887)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state887)))
                     ((assoc-has-key? init-hash 'state887)
                      (bv->signal (assoc-ref init-hash 'state887)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor889
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state889)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state889)))
                     ((assoc-has-key? init-hash 'state889)
                      (bv->signal (assoc-ref init-hash 'state889)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor891
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor892
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor891)))
             (list)))
           (btor893
            (if (bitvector->bool (signal-value btor892)) btor36 btor95))
           (btor894
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor895
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor894)))
             (list)))
           (btor896
            (if (bitvector->bool (signal-value btor895)) btor35 btor893))
           (btor897
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor898
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor897)))
             (list)))
           (btor899
            (if (bitvector->bool (signal-value btor898)) btor34 btor896))
           (btor900
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor116)))
             (list)))
           (btor901
            (if (bitvector->bool (signal-value btor900)) btor95 btor899))
           (btor902
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor903
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor902)))
             (list)))
           (btor904
            (if (bitvector->bool (signal-value btor903)) btor33 btor901))
           (btor905
            (signal
             (concat (signal-value btor904) (signal-value btor889))
             (list)))
           (btor906
            (signal
             (bool->bitvector
              (bveq (signal-value btor905) (signal-value btor125)))
             (list)))
           (btor907
            (if (bitvector->bool (signal-value btor906)) btor887 btor885))
           (btor908
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor909
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor908)))
             (list)))
           (btor910
            (if (bitvector->bool (signal-value btor909)) btor26 btor95))
           (btor911
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor912
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor911)))
             (list)))
           (btor913
            (if (bitvector->bool (signal-value btor912)) btor25 btor910))
           (btor914
            (signal
             (apply bvor (bitvector->bits (signal-value btor16)))
             (signal-state btor16)))
           (btor915 (signal (bvnot (signal-value btor914)) (list)))
           (btor916
            (if (bitvector->bool (signal-value btor915)) btor24 btor913))
           (btor917
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor194)))
             (list)))
           (btor918
            (if (bitvector->bool (signal-value btor917)) btor95 btor916))
           (btor919
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor920
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor919)))
             (list)))
           (btor921
            (if (bitvector->bool (signal-value btor920)) btor27 btor918))
           (btor922
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state922)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state922)))
                     ((assoc-has-key? init-hash 'state922)
                      (bv->signal (assoc-ref init-hash 'state922)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor923
            (signal
             (bvor (signal-value btor921) (signal-value btor922))
             (list)))
           (btor924
            (if (bitvector->bool (signal-value btor923)) btor95 btor907))
           (btor925
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state925)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state925)))
                     ((assoc-has-key? init-hash 'state925)
                      (bv->signal (assoc-ref init-hash 'state925)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor927
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state927)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state927)))
                     ((assoc-has-key? init-hash 'state927)
                      (bv->signal (assoc-ref init-hash 'state927)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor929
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state929)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state929)))
                     ((assoc-has-key? init-hash 'state929)
                      (bv->signal (assoc-ref init-hash 'state929)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor931
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor932
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor931)))
             (list)))
           (btor933
            (if (bitvector->bool (signal-value btor932)) btor36 btor95))
           (btor934
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor935
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor934)))
             (list)))
           (btor936
            (if (bitvector->bool (signal-value btor935)) btor35 btor933))
           (btor937
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor938
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor937)))
             (list)))
           (btor939
            (if (bitvector->bool (signal-value btor938)) btor34 btor936))
           (btor940
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor116)))
             (list)))
           (btor941
            (if (bitvector->bool (signal-value btor940)) btor95 btor939))
           (btor942
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor943
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor942)))
             (list)))
           (btor944
            (if (bitvector->bool (signal-value btor943)) btor33 btor941))
           (btor945
            (signal
             (concat (signal-value btor944) (signal-value btor929))
             (list)))
           (btor946
            (signal
             (bool->bitvector
              (bveq (signal-value btor945) (signal-value btor125)))
             (list)))
           (btor947
            (if (bitvector->bool (signal-value btor946)) btor927 btor925))
           (btor948
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor949
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor948)))
             (list)))
           (btor950
            (if (bitvector->bool (signal-value btor949)) btor26 btor95))
           (btor951
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor952
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor951)))
             (list)))
           (btor953
            (if (bitvector->bool (signal-value btor952)) btor25 btor950))
           (btor954
            (signal
             (apply bvor (bitvector->bits (signal-value btor15)))
             (signal-state btor15)))
           (btor955 (signal (bvnot (signal-value btor954)) (list)))
           (btor956
            (if (bitvector->bool (signal-value btor955)) btor24 btor953))
           (btor957
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor194)))
             (list)))
           (btor958
            (if (bitvector->bool (signal-value btor957)) btor95 btor956))
           (btor959
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor960
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor959)))
             (list)))
           (btor961
            (if (bitvector->bool (signal-value btor960)) btor27 btor958))
           (btor962
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state962)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state962)))
                     ((assoc-has-key? init-hash 'state962)
                      (bv->signal (assoc-ref init-hash 'state962)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor963
            (signal
             (bvor (signal-value btor961) (signal-value btor962))
             (list)))
           (btor964
            (if (bitvector->bool (signal-value btor963)) btor95 btor947))
           (btor965
            (if (bitvector->bool (signal-value btor940)) btor14 btor964))
           (btor966
            (if (bitvector->bool (signal-value btor900)) btor965 btor924))
           (btor967
            (bv->signal
             (zero-extend (signal-value btor966) (bitvector 1))
             btor966))
           (btor968
            (bv->signal
             (zero-extend (signal-value btor924) (bitvector 1))
             btor924))
           (btor969
            (bv->signal
             (zero-extend (signal-value btor966) (bitvector 1))
             btor966))
           (btor970
            (bv->signal
             (zero-extend (signal-value btor964) (bitvector 1))
             btor964))
           (btor971
            (bv->signal
             (zero-extend (signal-value btor965) (bitvector 1))
             btor965))
           (btor972
            (bv->signal
             (zero-extend (signal-value btor904) (bitvector 1))
             btor904))
           (btor973
            (bv->signal
             (zero-extend (signal-value btor921) (bitvector 1))
             btor921))
           (btor974
            (if (bitvector->bool (signal-value btor892)) btor52 btor100))
           (btor975
            (if (bitvector->bool (signal-value btor895)) btor51 btor974))
           (btor976
            (if (bitvector->bool (signal-value btor898)) btor50 btor975))
           (btor977
            (if (bitvector->bool (signal-value btor900)) btor100 btor976))
           (btor978
            (if (bitvector->bool (signal-value btor903)) btor49 btor977))
           (btor979
            (bv->signal
             (zero-extend (signal-value btor978) (bitvector 1))
             btor978))
           (btor980
            (bv->signal
             (zero-extend (signal-value btor944) (bitvector 1))
             btor944))
           (btor981
            (bv->signal
             (zero-extend (signal-value btor961) (bitvector 1))
             btor961))
           (btor982
            (if (bitvector->bool (signal-value btor932)) btor52 btor100))
           (btor983
            (if (bitvector->bool (signal-value btor935)) btor51 btor982))
           (btor984
            (if (bitvector->bool (signal-value btor938)) btor50 btor983))
           (btor985
            (if (bitvector->bool (signal-value btor940)) btor100 btor984))
           (btor986
            (if (bitvector->bool (signal-value btor943)) btor49 btor985))
           (btor987
            (bv->signal
             (zero-extend (signal-value btor986) (bitvector 1))
             btor986))
           (btor988
            (bv->signal
             (zero-extend (signal-value btor965) (bitvector 1))
             btor965))
           (btor990
            (if (bitvector->bool (signal-value btor496)) btor95 btor283))
           (btor991
            (if (bitvector->bool (signal-value btor701)) btor990 btor127))
           (btor992
            (if (bitvector->bool (signal-value btor695)) btor95 btor991))
           (btor996
            (if (bitvector->bool (signal-value btor701)) btor656 btor137))
           (btor997
            (if (bitvector->bool (signal-value btor695)) btor95 btor996))
           (btor1001 unnamed-input-1001)
           (btor1002
            (if (bitvector->bool (signal-value btor966)) btor877 btor711))
           (btor1003 unnamed-input-1003)
           (btor1004
            (if (bitvector->bool (signal-value btor630)) btor611 btor670))
           (btor1005
            (if (bitvector->bool (signal-value btor701)) btor1004 btor1003))
           (btor1006 unnamed-input-1006)
           (btor1007
            (if (bitvector->bool (signal-value btor695)) btor1006 btor1005))
           (btor1008
            (signal
             (bool->bitvector
              (bvuge (signal-value btor1002) (signal-value btor1007)))
             (list)))
           (btor1009
            (if (bitvector->bool (signal-value btor1008)) btor100 btor95))
           (btor1010
            (if (bitvector->bool (signal-value btor966)) btor150 btor711))
           (btor1011
            (signal
             (bool->bitvector
              (bvuge (signal-value btor1010) (signal-value btor1007)))
             (list)))
           (btor1012
            (if (bitvector->bool (signal-value btor1011)) btor100 btor95))
           (btor1013 (signal (bvnot (signal-value btor496)) (list)))
           (btor1014 (signal (bvnot (signal-value btor494)) (list)))
           (btor1015
            (signal
             (bvand (signal-value btor1013) (signal-value btor1014))
             (list)))
           (btor1016
            (if (bitvector->bool (signal-value btor1015)) btor1012 btor1009))
           (btor1017 (bitvector 37))
           (btor1018
            (bv->signal
             (zero-extend (signal-value btor1002) (bitvector 37))
             btor1002))
           (btor1019
            (bv->signal
             (zero-extend (signal-value btor1007) (bitvector 37))
             btor1007))
           (btor1020
            (signal
             (bvadd (signal-value btor1018) (signal-value btor1019))
             (list)))
           (btor1021
            (bv->signal
             (zero-extend (signal-value btor1010) (bitvector 37))
             btor1010))
           (btor1022
            (bv->signal
             (zero-extend (signal-value btor1007) (bitvector 37))
             btor1007))
           (btor1023
            (signal
             (bvadd (signal-value btor1021) (signal-value btor1022))
             (list)))
           (btor1024
            (if (bitvector->bool (signal-value btor1015)) btor1023 btor1020))
           (btor1025
            (signal
             (extract 36 36 (signal-value btor1024))
             (signal-state btor1024)))
           (btor1026
            (if (bitvector->bool (signal-value btor450)) btor1025 btor1016))
           (btor1027
            (if (bitvector->bool (signal-value btor701)) btor1026 btor1001))
           (btor1028 unnamed-input-1028)
           (btor1029
            (if (bitvector->bool (signal-value btor695)) btor1028 btor1027))
           (btor1030 (signal (bvnot (signal-value btor1029)) (list)))
           (btor1031
            (if (bitvector->bool (signal-value btor450)) btor1029 btor1030))
           (btor1032
            (signal
             (extract 35 35 (signal-value btor1007))
             (signal-state btor1007)))
           (btor1033
            (signal
             (extract 35 35 (signal-value btor711))
             (signal-state btor711)))
           (btor1034
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor1032)
              (signal-value btor1033))
             (list)))
           (btor1035 (signal (bvnot (signal-value btor450)) (list)))
           (btor1036
            (signal
             (bvxor (signal-value btor1034) (signal-value btor1035))
             (list)))
           (btor1037 unnamed-input-1037)
           (btor1038
            (signal
             (bvsub (signal-value btor1002) (signal-value btor1007))
             (list)))
           (btor1039
            (signal
             (bvsub (signal-value btor1010) (signal-value btor1007))
             (list)))
           (btor1040
            (if (bitvector->bool (signal-value btor1015)) btor1039 btor1038))
           (btor1041
            (signal
             (extract 35 0 (signal-value btor1024))
             (signal-state btor1024)))
           (btor1042
            (if (bitvector->bool (signal-value btor450)) btor1041 btor1040))
           (btor1043
            (if (bitvector->bool (signal-value btor701)) btor1042 btor1037))
           (btor1044 unnamed-input-1044)
           (btor1045
            (if (bitvector->bool (signal-value btor695)) btor1044 btor1043))
           (btor1046
            (signal
             (extract 35 35 (signal-value btor1045))
             (signal-state btor1045)))
           (btor1047
            (signal
             (bvxor (signal-value btor1033) (signal-value btor1046))
             (list)))
           (btor1048
            (signal
             (bvand (signal-value btor1036) (signal-value btor1047))
             (list)))
           (btor1049
            (signal
             (extract 35 35 (signal-value btor877))
             (signal-state btor877)))
           (btor1050
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor1032)
              (signal-value btor1049))
             (list)))
           (btor1051
            (signal
             (bvxor (signal-value btor1050) (signal-value btor1035))
             (list)))
           (btor1052
            (signal
             (bvxor (signal-value btor1049) (signal-value btor1046))
             (list)))
           (btor1053
            (signal
             (bvand (signal-value btor1051) (signal-value btor1052))
             (list)))
           (btor1054
            (if (bitvector->bool (signal-value btor966)) btor1053 btor1048))
           (btor1055 unnamed-input-1055)
           (btor1056
            (signal
             (bvor (signal-value btor755) (signal-value btor812))
             (list)))
           (btor1057
            (if (bitvector->bool (signal-value btor701)) btor1056 btor1055))
           (btor1058 unnamed-input-1058)
           (btor1059
            (if (bitvector->bool (signal-value btor695)) btor1058 btor1057))
           (btor1060
            (signal
             (apply bvor (bitvector->bits (signal-value btor1007)))
             (signal-state btor1007)))
           (btor1061
            (signal
             (bvand (signal-value btor1059) (signal-value btor1060))
             (list)))
           (btor1062
            (if (bitvector->bool (signal-value btor1061)) btor1054 btor1031))
           (btor1063
            (if (bitvector->bool (signal-value btor701)) btor1062 btor147))
           (btor1064
            (if (bitvector->bool (signal-value btor695)) btor95 btor1063))
           (btor1068
            (if (bitvector->bool (signal-value btor496)) btor1045 btor273))
           (btor1069
            (if (bitvector->bool (signal-value btor496)) btor1068 btor1045))
           (btor1070
            (if (bitvector->bool (signal-value btor701)) btor1069 btor159))
           (btor1071
            (if (bitvector->bool (signal-value btor695)) btor150 btor1070))
           (btor1075
            (if (bitvector->bool (signal-value btor93)) btor81 btor43))
           (btor1076 (bv->signal (bv 26 (bitvector 5))))
           (btor1077
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor1076)))
             (list)))
           (btor1078
            (if (bitvector->bool (signal-value btor1077)) btor1075 btor203))
           (btor1079
            (if (bitvector->bool (signal-value btor205)) btor81 btor1078))
           (btor1080
            (if (bitvector->bool (signal-value btor210)) btor43 btor1079))
           (btor1081
            (if (bitvector->bool (signal-value btor484)) btor1080 btor203))
           (btor1086
            (if (bitvector->bool (signal-value btor94)) btor82 btor44))
           (btor1087
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor1076)))
             (list)))
           (btor1088
            (if (bitvector->bool (signal-value btor1087)) btor1086 btor253))
           (btor1089
            (if (bitvector->bool (signal-value btor255)) btor82 btor1088))
           (btor1090
            (if (bitvector->bool (signal-value btor260)) btor44 btor1089))
           (btor1091
            (if (bitvector->bool (signal-value btor492)) btor1090 btor253))
           (btor1096
            (if (bitvector->bool (signal-value btor701)) btor1068 btor273))
           (btor1097
            (if (bitvector->bool (signal-value btor695)) btor150 btor1096))
           (btor1101
            (if (bitvector->bool (signal-value btor701)) btor990 btor283))
           (btor1102
            (if (bitvector->bool (signal-value btor695)) btor95 btor1101))
           (btor1106
            (if (bitvector->bool (signal-value btor461)) btor438 btor397))
           (btor1111
            (if (bitvector->bool (signal-value btor471)) btor28 btor437))
           (btor1116
            (if (bitvector->bool (signal-value btor768)) btor91 btor552))
           (btor1121
            (if (bitvector->bool (signal-value btor825)) btor92 btor601))
           (btor1126
            (if (bitvector->bool (signal-value btor679)) btor95 btor654))
           (btor1131
            (if (bitvector->bool (signal-value btor679)) btor611 btor670))
           (btor1136
            (if (bitvector->bool (signal-value btor701)) btor1069 btor711))
           (btor1137
            (if (bitvector->bool (signal-value btor695)) btor150 btor1136))
           (btor1141
            (if (bitvector->bool (signal-value btor833)) btor553 btor752))
           (btor1146
            (if (bitvector->bool (signal-value btor841)) btor602 btor809))
           (btor1151
            (if (bitvector->bool (signal-value btor356)) btor19 btor857))
           (btor1156
            (if (bitvector->bool (signal-value btor320)) btor858 btor871))
           (btor1161
            (if (bitvector->bool (signal-value btor978)) btor965 btor924))
           (btor1166
            (if (bitvector->bool (signal-value btor986)) btor14 btor964)))
      (list
       (cons
        'scanouta
        (signal
         (signal-value btor212)
         (append
          (list (cons 'state962 (signal-value btor961)))
          (append
           (list (cons 'state929 (signal-value btor944)))
           (append
            (list (cons 'state927 (signal-value btor1166)))
            (append
             (list (cons 'state925 (signal-value btor964)))
             (append
              (list (cons 'state922 (signal-value btor921)))
              (append
               (list (cons 'state889 (signal-value btor904)))
               (append
                (list (cons 'state887 (signal-value btor1161)))
                (append
                 (list (cons 'state885 (signal-value btor924)))
                 (append
                  (list (cons 'state869 (signal-value btor314)))
                  (append
                   (list (cons 'state864 (signal-value btor299)))
                   (append
                    (list (cons 'state862 (signal-value btor1156)))
                    (append
                     (list (cons 'state860 (signal-value btor871)))
                     (append
                      (list (cons 'state855 (signal-value btor350)))
                      (append
                       (list (cons 'state850 (signal-value btor335)))
                       (append
                        (list (cons 'state848 (signal-value btor1151)))
                        (append
                         (list (cons 'state846 (signal-value btor857)))
                         (append
                          (list (cons 'state807 (signal-value btor806)))
                          (append
                           (list (cons 'state774 (signal-value btor789)))
                           (append
                            (list (cons 'state772 (signal-value btor1146)))
                            (append
                             (list (cons 'state770 (signal-value btor809)))
                             (append
                              (list (cons 'state750 (signal-value btor749)))
                              (append
                               (list (cons 'state717 (signal-value btor732)))
                               (append
                                (list (cons 'state715 (signal-value btor1141)))
                                (append
                                 (list (cons 'state713 (signal-value btor752)))
                                 (append
                                  (list
                                   (cons 'state707 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state705 (signal-value btor1137)))
                                   (append
                                    (list
                                     (cons 'state703 (signal-value btor711)))
                                    (append
                                     (list
                                      (cons 'state668 (signal-value btor651)))
                                     (append
                                      (list
                                       (cons 'state663 (signal-value btor634)))
                                      (append
                                       (list
                                        (cons
                                         'state661
                                         (signal-value btor1131)))
                                       (append
                                        (list
                                         (cons
                                          'state659
                                          (signal-value btor670)))
                                        (append
                                         (list
                                          (cons
                                           'state652
                                           (signal-value btor651)))
                                         (append
                                          (list
                                           (cons
                                            'state619
                                            (signal-value btor634)))
                                          (append
                                           (list
                                            (cons
                                             'state617
                                             (signal-value btor1126)))
                                           (append
                                            (list
                                             (cons
                                              'state615
                                              (signal-value btor654)))
                                            (append
                                             (list
                                              (cons
                                               'state599
                                               (signal-value btor598)))
                                             (append
                                              (list
                                               (cons
                                                'state566
                                                (signal-value btor581)))
                                              (append
                                               (list
                                                (cons
                                                 'state564
                                                 (signal-value btor1121)))
                                               (append
                                                (list
                                                 (cons
                                                  'state562
                                                  (signal-value btor601)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state550
                                                   (signal-value btor549)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state517
                                                    (signal-value btor532)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state515
                                                     (signal-value btor1116)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state513
                                                      (signal-value btor552)))
                                                    (append
                                                     (list
                                                      (cons
                                                       'state435
                                                       (signal-value btor434)))
                                                     (append
                                                      (list
                                                       (cons
                                                        'state402
                                                        (signal-value
                                                         btor417)))
                                                      (append
                                                       (list
                                                        (cons
                                                         'state400
                                                         (signal-value
                                                          btor1111)))
                                                       (append
                                                        (list
                                                         (cons
                                                          'state398
                                                          (signal-value
                                                           btor437)))
                                                        (append
                                                         (list
                                                          (cons
                                                           'state395
                                                           (signal-value
                                                            btor394)))
                                                         (append
                                                          (list
                                                           (cons
                                                            'state362
                                                            (signal-value
                                                             btor377)))
                                                          (append
                                                           (list
                                                            (cons
                                                             'state360
                                                             (signal-value
                                                              btor1106)))
                                                           (append
                                                            (list
                                                             (cons
                                                              'state358
                                                              (signal-value
                                                               btor397)))
                                                            (append
                                                             (list
                                                              (cons
                                                               'state279
                                                               (signal-value
                                                                btor122)))
                                                             (append
                                                              (list
                                                               (cons
                                                                'state277
                                                                (signal-value
                                                                 btor1102)))
                                                              (append
                                                               (list
                                                                (cons
                                                                 'state275
                                                                 (signal-value
                                                                  btor283)))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  'state269
                                                                  (signal-value
                                                                   btor122)))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   'state267
                                                                   (signal-value
                                                                    btor1097)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state265
                                                                    (signal-value
                                                                     btor273)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state251
                                                                     (signal-value
                                                                      btor250)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state218
                                                                      (signal-value
                                                                       btor233)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state216
                                                                       (signal-value
                                                                        btor1091)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state214
                                                                        (signal-value
                                                                         btor253)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state201
                                                                         (signal-value
                                                                          btor200)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state166
                                                                          (signal-value
                                                                           btor181)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state164
                                                                           (signal-value
                                                                            btor1081)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state162
                                                                            (signal-value
                                                                             btor203)))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             'state155
                                                                             (signal-value
                                                                              btor122)))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              'state153
                                                                              (signal-value
                                                                               btor1071)))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               'state151
                                                                               (signal-value
                                                                                btor159)))
                                                                             (append
                                                                              (list
                                                                               (cons
                                                                                'state143
                                                                                (signal-value
                                                                                 btor122)))
                                                                              (append
                                                                               (list
                                                                                (cons
                                                                                 'state141
                                                                                 (signal-value
                                                                                  btor1064)))
                                                                               (append
                                                                                (list
                                                                                 (cons
                                                                                  'state139
                                                                                  (signal-value
                                                                                   btor147)))
                                                                                (append
                                                                                 (list
                                                                                  (cons
                                                                                   'state133
                                                                                   (signal-value
                                                                                    btor122)))
                                                                                 (append
                                                                                  (list
                                                                                   (cons
                                                                                    'state131
                                                                                    (signal-value
                                                                                     btor997)))
                                                                                  (append
                                                                                   (list
                                                                                    (cons
                                                                                     'state129
                                                                                     (signal-value
                                                                                      btor137)))
                                                                                   (append
                                                                                    (list
                                                                                     (cons
                                                                                      'state101
                                                                                      (signal-value
                                                                                       btor122)))
                                                                                    (append
                                                                                     (list
                                                                                      (cons
                                                                                       'state98
                                                                                       (signal-value
                                                                                        btor992)))
                                                                                     (append
                                                                                      (list
                                                                                       (cons
                                                                                        'state96
                                                                                        (signal-value
                                                                                         btor127)))
                                                                                      (list))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
       (cons
        'accum_is_saturated
        (signal
         (signal-value btor127)
         (append
          (list (cons 'state962 (signal-value btor961)))
          (append
           (list (cons 'state929 (signal-value btor944)))
           (append
            (list (cons 'state927 (signal-value btor1166)))
            (append
             (list (cons 'state925 (signal-value btor964)))
             (append
              (list (cons 'state922 (signal-value btor921)))
              (append
               (list (cons 'state889 (signal-value btor904)))
               (append
                (list (cons 'state887 (signal-value btor1161)))
                (append
                 (list (cons 'state885 (signal-value btor924)))
                 (append
                  (list (cons 'state869 (signal-value btor314)))
                  (append
                   (list (cons 'state864 (signal-value btor299)))
                   (append
                    (list (cons 'state862 (signal-value btor1156)))
                    (append
                     (list (cons 'state860 (signal-value btor871)))
                     (append
                      (list (cons 'state855 (signal-value btor350)))
                      (append
                       (list (cons 'state850 (signal-value btor335)))
                       (append
                        (list (cons 'state848 (signal-value btor1151)))
                        (append
                         (list (cons 'state846 (signal-value btor857)))
                         (append
                          (list (cons 'state807 (signal-value btor806)))
                          (append
                           (list (cons 'state774 (signal-value btor789)))
                           (append
                            (list (cons 'state772 (signal-value btor1146)))
                            (append
                             (list (cons 'state770 (signal-value btor809)))
                             (append
                              (list (cons 'state750 (signal-value btor749)))
                              (append
                               (list (cons 'state717 (signal-value btor732)))
                               (append
                                (list (cons 'state715 (signal-value btor1141)))
                                (append
                                 (list (cons 'state713 (signal-value btor752)))
                                 (append
                                  (list
                                   (cons 'state707 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state705 (signal-value btor1137)))
                                   (append
                                    (list
                                     (cons 'state703 (signal-value btor711)))
                                    (append
                                     (list
                                      (cons 'state668 (signal-value btor651)))
                                     (append
                                      (list
                                       (cons 'state663 (signal-value btor634)))
                                      (append
                                       (list
                                        (cons
                                         'state661
                                         (signal-value btor1131)))
                                       (append
                                        (list
                                         (cons
                                          'state659
                                          (signal-value btor670)))
                                        (append
                                         (list
                                          (cons
                                           'state652
                                           (signal-value btor651)))
                                         (append
                                          (list
                                           (cons
                                            'state619
                                            (signal-value btor634)))
                                          (append
                                           (list
                                            (cons
                                             'state617
                                             (signal-value btor1126)))
                                           (append
                                            (list
                                             (cons
                                              'state615
                                              (signal-value btor654)))
                                            (append
                                             (list
                                              (cons
                                               'state599
                                               (signal-value btor598)))
                                             (append
                                              (list
                                               (cons
                                                'state566
                                                (signal-value btor581)))
                                              (append
                                               (list
                                                (cons
                                                 'state564
                                                 (signal-value btor1121)))
                                               (append
                                                (list
                                                 (cons
                                                  'state562
                                                  (signal-value btor601)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state550
                                                   (signal-value btor549)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state517
                                                    (signal-value btor532)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state515
                                                     (signal-value btor1116)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state513
                                                      (signal-value btor552)))
                                                    (append
                                                     (list
                                                      (cons
                                                       'state435
                                                       (signal-value btor434)))
                                                     (append
                                                      (list
                                                       (cons
                                                        'state402
                                                        (signal-value
                                                         btor417)))
                                                      (append
                                                       (list
                                                        (cons
                                                         'state400
                                                         (signal-value
                                                          btor1111)))
                                                       (append
                                                        (list
                                                         (cons
                                                          'state398
                                                          (signal-value
                                                           btor437)))
                                                        (append
                                                         (list
                                                          (cons
                                                           'state395
                                                           (signal-value
                                                            btor394)))
                                                         (append
                                                          (list
                                                           (cons
                                                            'state362
                                                            (signal-value
                                                             btor377)))
                                                          (append
                                                           (list
                                                            (cons
                                                             'state360
                                                             (signal-value
                                                              btor1106)))
                                                           (append
                                                            (list
                                                             (cons
                                                              'state358
                                                              (signal-value
                                                               btor397)))
                                                            (append
                                                             (list
                                                              (cons
                                                               'state279
                                                               (signal-value
                                                                btor122)))
                                                             (append
                                                              (list
                                                               (cons
                                                                'state277
                                                                (signal-value
                                                                 btor1102)))
                                                              (append
                                                               (list
                                                                (cons
                                                                 'state275
                                                                 (signal-value
                                                                  btor283)))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  'state269
                                                                  (signal-value
                                                                   btor122)))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   'state267
                                                                   (signal-value
                                                                    btor1097)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state265
                                                                    (signal-value
                                                                     btor273)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state251
                                                                     (signal-value
                                                                      btor250)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state218
                                                                      (signal-value
                                                                       btor233)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state216
                                                                       (signal-value
                                                                        btor1091)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state214
                                                                        (signal-value
                                                                         btor253)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state201
                                                                         (signal-value
                                                                          btor200)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state166
                                                                          (signal-value
                                                                           btor181)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state164
                                                                           (signal-value
                                                                            btor1081)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state162
                                                                            (signal-value
                                                                             btor203)))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             'state155
                                                                             (signal-value
                                                                              btor122)))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              'state153
                                                                              (signal-value
                                                                               btor1071)))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               'state151
                                                                               (signal-value
                                                                                btor159)))
                                                                             (append
                                                                              (list
                                                                               (cons
                                                                                'state143
                                                                                (signal-value
                                                                                 btor122)))
                                                                              (append
                                                                               (list
                                                                                (cons
                                                                                 'state141
                                                                                 (signal-value
                                                                                  btor1064)))
                                                                               (append
                                                                                (list
                                                                                 (cons
                                                                                  'state139
                                                                                  (signal-value
                                                                                   btor147)))
                                                                                (append
                                                                                 (list
                                                                                  (cons
                                                                                   'state133
                                                                                   (signal-value
                                                                                    btor122)))
                                                                                 (append
                                                                                  (list
                                                                                   (cons
                                                                                    'state131
                                                                                    (signal-value
                                                                                     btor997)))
                                                                                  (append
                                                                                   (list
                                                                                    (cons
                                                                                     'state129
                                                                                     (signal-value
                                                                                      btor137)))
                                                                                   (append
                                                                                    (list
                                                                                     (cons
                                                                                      'state101
                                                                                      (signal-value
                                                                                       btor122)))
                                                                                    (append
                                                                                     (list
                                                                                      (cons
                                                                                       'state98
                                                                                       (signal-value
                                                                                        btor992)))
                                                                                     (append
                                                                                      (list
                                                                                       (cons
                                                                                        'state96
                                                                                        (signal-value
                                                                                         btor127)))
                                                                                      (list))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
       (cons
        'result
        (signal
         (signal-value btor159)
         (append
          (list (cons 'state962 (signal-value btor961)))
          (append
           (list (cons 'state929 (signal-value btor944)))
           (append
            (list (cons 'state927 (signal-value btor1166)))
            (append
             (list (cons 'state925 (signal-value btor964)))
             (append
              (list (cons 'state922 (signal-value btor921)))
              (append
               (list (cons 'state889 (signal-value btor904)))
               (append
                (list (cons 'state887 (signal-value btor1161)))
                (append
                 (list (cons 'state885 (signal-value btor924)))
                 (append
                  (list (cons 'state869 (signal-value btor314)))
                  (append
                   (list (cons 'state864 (signal-value btor299)))
                   (append
                    (list (cons 'state862 (signal-value btor1156)))
                    (append
                     (list (cons 'state860 (signal-value btor871)))
                     (append
                      (list (cons 'state855 (signal-value btor350)))
                      (append
                       (list (cons 'state850 (signal-value btor335)))
                       (append
                        (list (cons 'state848 (signal-value btor1151)))
                        (append
                         (list (cons 'state846 (signal-value btor857)))
                         (append
                          (list (cons 'state807 (signal-value btor806)))
                          (append
                           (list (cons 'state774 (signal-value btor789)))
                           (append
                            (list (cons 'state772 (signal-value btor1146)))
                            (append
                             (list (cons 'state770 (signal-value btor809)))
                             (append
                              (list (cons 'state750 (signal-value btor749)))
                              (append
                               (list (cons 'state717 (signal-value btor732)))
                               (append
                                (list (cons 'state715 (signal-value btor1141)))
                                (append
                                 (list (cons 'state713 (signal-value btor752)))
                                 (append
                                  (list
                                   (cons 'state707 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state705 (signal-value btor1137)))
                                   (append
                                    (list
                                     (cons 'state703 (signal-value btor711)))
                                    (append
                                     (list
                                      (cons 'state668 (signal-value btor651)))
                                     (append
                                      (list
                                       (cons 'state663 (signal-value btor634)))
                                      (append
                                       (list
                                        (cons
                                         'state661
                                         (signal-value btor1131)))
                                       (append
                                        (list
                                         (cons
                                          'state659
                                          (signal-value btor670)))
                                        (append
                                         (list
                                          (cons
                                           'state652
                                           (signal-value btor651)))
                                         (append
                                          (list
                                           (cons
                                            'state619
                                            (signal-value btor634)))
                                          (append
                                           (list
                                            (cons
                                             'state617
                                             (signal-value btor1126)))
                                           (append
                                            (list
                                             (cons
                                              'state615
                                              (signal-value btor654)))
                                            (append
                                             (list
                                              (cons
                                               'state599
                                               (signal-value btor598)))
                                             (append
                                              (list
                                               (cons
                                                'state566
                                                (signal-value btor581)))
                                              (append
                                               (list
                                                (cons
                                                 'state564
                                                 (signal-value btor1121)))
                                               (append
                                                (list
                                                 (cons
                                                  'state562
                                                  (signal-value btor601)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state550
                                                   (signal-value btor549)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state517
                                                    (signal-value btor532)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state515
                                                     (signal-value btor1116)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state513
                                                      (signal-value btor552)))
                                                    (append
                                                     (list
                                                      (cons
                                                       'state435
                                                       (signal-value btor434)))
                                                     (append
                                                      (list
                                                       (cons
                                                        'state402
                                                        (signal-value
                                                         btor417)))
                                                      (append
                                                       (list
                                                        (cons
                                                         'state400
                                                         (signal-value
                                                          btor1111)))
                                                       (append
                                                        (list
                                                         (cons
                                                          'state398
                                                          (signal-value
                                                           btor437)))
                                                        (append
                                                         (list
                                                          (cons
                                                           'state395
                                                           (signal-value
                                                            btor394)))
                                                         (append
                                                          (list
                                                           (cons
                                                            'state362
                                                            (signal-value
                                                             btor377)))
                                                          (append
                                                           (list
                                                            (cons
                                                             'state360
                                                             (signal-value
                                                              btor1106)))
                                                           (append
                                                            (list
                                                             (cons
                                                              'state358
                                                              (signal-value
                                                               btor397)))
                                                            (append
                                                             (list
                                                              (cons
                                                               'state279
                                                               (signal-value
                                                                btor122)))
                                                             (append
                                                              (list
                                                               (cons
                                                                'state277
                                                                (signal-value
                                                                 btor1102)))
                                                              (append
                                                               (list
                                                                (cons
                                                                 'state275
                                                                 (signal-value
                                                                  btor283)))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  'state269
                                                                  (signal-value
                                                                   btor122)))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   'state267
                                                                   (signal-value
                                                                    btor1097)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state265
                                                                    (signal-value
                                                                     btor273)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state251
                                                                     (signal-value
                                                                      btor250)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state218
                                                                      (signal-value
                                                                       btor233)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state216
                                                                       (signal-value
                                                                        btor1091)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state214
                                                                        (signal-value
                                                                         btor253)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state201
                                                                         (signal-value
                                                                          btor200)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state166
                                                                          (signal-value
                                                                           btor181)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state164
                                                                           (signal-value
                                                                            btor1081)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state162
                                                                            (signal-value
                                                                             btor203)))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             'state155
                                                                             (signal-value
                                                                              btor122)))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              'state153
                                                                              (signal-value
                                                                               btor1071)))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               'state151
                                                                               (signal-value
                                                                                btor159)))
                                                                             (append
                                                                              (list
                                                                               (cons
                                                                                'state143
                                                                                (signal-value
                                                                                 btor122)))
                                                                              (append
                                                                               (list
                                                                                (cons
                                                                                 'state141
                                                                                 (signal-value
                                                                                  btor1064)))
                                                                               (append
                                                                                (list
                                                                                 (cons
                                                                                  'state139
                                                                                  (signal-value
                                                                                   btor147)))
                                                                                (append
                                                                                 (list
                                                                                  (cons
                                                                                   'state133
                                                                                   (signal-value
                                                                                    btor122)))
                                                                                 (append
                                                                                  (list
                                                                                   (cons
                                                                                    'state131
                                                                                    (signal-value
                                                                                     btor997)))
                                                                                  (append
                                                                                   (list
                                                                                    (cons
                                                                                     'state129
                                                                                     (signal-value
                                                                                      btor137)))
                                                                                   (append
                                                                                    (list
                                                                                     (cons
                                                                                      'state101
                                                                                      (signal-value
                                                                                       btor122)))
                                                                                    (append
                                                                                     (list
                                                                                      (cons
                                                                                       'state98
                                                                                       (signal-value
                                                                                        btor992)))
                                                                                     (append
                                                                                      (list
                                                                                       (cons
                                                                                        'state96
                                                                                        (signal-value
                                                                                         btor127)))
                                                                                      (list))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
       (cons
        'mult_is_saturated
        (signal
         (signal-value btor137)
         (append
          (list (cons 'state962 (signal-value btor961)))
          (append
           (list (cons 'state929 (signal-value btor944)))
           (append
            (list (cons 'state927 (signal-value btor1166)))
            (append
             (list (cons 'state925 (signal-value btor964)))
             (append
              (list (cons 'state922 (signal-value btor921)))
              (append
               (list (cons 'state889 (signal-value btor904)))
               (append
                (list (cons 'state887 (signal-value btor1161)))
                (append
                 (list (cons 'state885 (signal-value btor924)))
                 (append
                  (list (cons 'state869 (signal-value btor314)))
                  (append
                   (list (cons 'state864 (signal-value btor299)))
                   (append
                    (list (cons 'state862 (signal-value btor1156)))
                    (append
                     (list (cons 'state860 (signal-value btor871)))
                     (append
                      (list (cons 'state855 (signal-value btor350)))
                      (append
                       (list (cons 'state850 (signal-value btor335)))
                       (append
                        (list (cons 'state848 (signal-value btor1151)))
                        (append
                         (list (cons 'state846 (signal-value btor857)))
                         (append
                          (list (cons 'state807 (signal-value btor806)))
                          (append
                           (list (cons 'state774 (signal-value btor789)))
                           (append
                            (list (cons 'state772 (signal-value btor1146)))
                            (append
                             (list (cons 'state770 (signal-value btor809)))
                             (append
                              (list (cons 'state750 (signal-value btor749)))
                              (append
                               (list (cons 'state717 (signal-value btor732)))
                               (append
                                (list (cons 'state715 (signal-value btor1141)))
                                (append
                                 (list (cons 'state713 (signal-value btor752)))
                                 (append
                                  (list
                                   (cons 'state707 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state705 (signal-value btor1137)))
                                   (append
                                    (list
                                     (cons 'state703 (signal-value btor711)))
                                    (append
                                     (list
                                      (cons 'state668 (signal-value btor651)))
                                     (append
                                      (list
                                       (cons 'state663 (signal-value btor634)))
                                      (append
                                       (list
                                        (cons
                                         'state661
                                         (signal-value btor1131)))
                                       (append
                                        (list
                                         (cons
                                          'state659
                                          (signal-value btor670)))
                                        (append
                                         (list
                                          (cons
                                           'state652
                                           (signal-value btor651)))
                                         (append
                                          (list
                                           (cons
                                            'state619
                                            (signal-value btor634)))
                                          (append
                                           (list
                                            (cons
                                             'state617
                                             (signal-value btor1126)))
                                           (append
                                            (list
                                             (cons
                                              'state615
                                              (signal-value btor654)))
                                            (append
                                             (list
                                              (cons
                                               'state599
                                               (signal-value btor598)))
                                             (append
                                              (list
                                               (cons
                                                'state566
                                                (signal-value btor581)))
                                              (append
                                               (list
                                                (cons
                                                 'state564
                                                 (signal-value btor1121)))
                                               (append
                                                (list
                                                 (cons
                                                  'state562
                                                  (signal-value btor601)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state550
                                                   (signal-value btor549)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state517
                                                    (signal-value btor532)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state515
                                                     (signal-value btor1116)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state513
                                                      (signal-value btor552)))
                                                    (append
                                                     (list
                                                      (cons
                                                       'state435
                                                       (signal-value btor434)))
                                                     (append
                                                      (list
                                                       (cons
                                                        'state402
                                                        (signal-value
                                                         btor417)))
                                                      (append
                                                       (list
                                                        (cons
                                                         'state400
                                                         (signal-value
                                                          btor1111)))
                                                       (append
                                                        (list
                                                         (cons
                                                          'state398
                                                          (signal-value
                                                           btor437)))
                                                        (append
                                                         (list
                                                          (cons
                                                           'state395
                                                           (signal-value
                                                            btor394)))
                                                         (append
                                                          (list
                                                           (cons
                                                            'state362
                                                            (signal-value
                                                             btor377)))
                                                          (append
                                                           (list
                                                            (cons
                                                             'state360
                                                             (signal-value
                                                              btor1106)))
                                                           (append
                                                            (list
                                                             (cons
                                                              'state358
                                                              (signal-value
                                                               btor397)))
                                                            (append
                                                             (list
                                                              (cons
                                                               'state279
                                                               (signal-value
                                                                btor122)))
                                                             (append
                                                              (list
                                                               (cons
                                                                'state277
                                                                (signal-value
                                                                 btor1102)))
                                                              (append
                                                               (list
                                                                (cons
                                                                 'state275
                                                                 (signal-value
                                                                  btor283)))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  'state269
                                                                  (signal-value
                                                                   btor122)))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   'state267
                                                                   (signal-value
                                                                    btor1097)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state265
                                                                    (signal-value
                                                                     btor273)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state251
                                                                     (signal-value
                                                                      btor250)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state218
                                                                      (signal-value
                                                                       btor233)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state216
                                                                       (signal-value
                                                                        btor1091)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state214
                                                                        (signal-value
                                                                         btor253)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state201
                                                                         (signal-value
                                                                          btor200)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state166
                                                                          (signal-value
                                                                           btor181)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state164
                                                                           (signal-value
                                                                            btor1081)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state162
                                                                            (signal-value
                                                                             btor203)))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             'state155
                                                                             (signal-value
                                                                              btor122)))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              'state153
                                                                              (signal-value
                                                                               btor1071)))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               'state151
                                                                               (signal-value
                                                                                btor159)))
                                                                             (append
                                                                              (list
                                                                               (cons
                                                                                'state143
                                                                                (signal-value
                                                                                 btor122)))
                                                                              (append
                                                                               (list
                                                                                (cons
                                                                                 'state141
                                                                                 (signal-value
                                                                                  btor1064)))
                                                                               (append
                                                                                (list
                                                                                 (cons
                                                                                  'state139
                                                                                  (signal-value
                                                                                   btor147)))
                                                                                (append
                                                                                 (list
                                                                                  (cons
                                                                                   'state133
                                                                                   (signal-value
                                                                                    btor122)))
                                                                                 (append
                                                                                  (list
                                                                                   (cons
                                                                                    'state131
                                                                                    (signal-value
                                                                                     btor997)))
                                                                                  (append
                                                                                   (list
                                                                                    (cons
                                                                                     'state129
                                                                                     (signal-value
                                                                                      btor137)))
                                                                                   (append
                                                                                    (list
                                                                                     (cons
                                                                                      'state101
                                                                                      (signal-value
                                                                                       btor122)))
                                                                                    (append
                                                                                     (list
                                                                                      (cons
                                                                                       'state98
                                                                                       (signal-value
                                                                                        btor992)))
                                                                                     (append
                                                                                      (list
                                                                                       (cons
                                                                                        'state96
                                                                                        (signal-value
                                                                                         btor127)))
                                                                                      (list))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
       (cons
        'overflow
        (signal
         (signal-value btor147)
         (append
          (list (cons 'state962 (signal-value btor961)))
          (append
           (list (cons 'state929 (signal-value btor944)))
           (append
            (list (cons 'state927 (signal-value btor1166)))
            (append
             (list (cons 'state925 (signal-value btor964)))
             (append
              (list (cons 'state922 (signal-value btor921)))
              (append
               (list (cons 'state889 (signal-value btor904)))
               (append
                (list (cons 'state887 (signal-value btor1161)))
                (append
                 (list (cons 'state885 (signal-value btor924)))
                 (append
                  (list (cons 'state869 (signal-value btor314)))
                  (append
                   (list (cons 'state864 (signal-value btor299)))
                   (append
                    (list (cons 'state862 (signal-value btor1156)))
                    (append
                     (list (cons 'state860 (signal-value btor871)))
                     (append
                      (list (cons 'state855 (signal-value btor350)))
                      (append
                       (list (cons 'state850 (signal-value btor335)))
                       (append
                        (list (cons 'state848 (signal-value btor1151)))
                        (append
                         (list (cons 'state846 (signal-value btor857)))
                         (append
                          (list (cons 'state807 (signal-value btor806)))
                          (append
                           (list (cons 'state774 (signal-value btor789)))
                           (append
                            (list (cons 'state772 (signal-value btor1146)))
                            (append
                             (list (cons 'state770 (signal-value btor809)))
                             (append
                              (list (cons 'state750 (signal-value btor749)))
                              (append
                               (list (cons 'state717 (signal-value btor732)))
                               (append
                                (list (cons 'state715 (signal-value btor1141)))
                                (append
                                 (list (cons 'state713 (signal-value btor752)))
                                 (append
                                  (list
                                   (cons 'state707 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state705 (signal-value btor1137)))
                                   (append
                                    (list
                                     (cons 'state703 (signal-value btor711)))
                                    (append
                                     (list
                                      (cons 'state668 (signal-value btor651)))
                                     (append
                                      (list
                                       (cons 'state663 (signal-value btor634)))
                                      (append
                                       (list
                                        (cons
                                         'state661
                                         (signal-value btor1131)))
                                       (append
                                        (list
                                         (cons
                                          'state659
                                          (signal-value btor670)))
                                        (append
                                         (list
                                          (cons
                                           'state652
                                           (signal-value btor651)))
                                         (append
                                          (list
                                           (cons
                                            'state619
                                            (signal-value btor634)))
                                          (append
                                           (list
                                            (cons
                                             'state617
                                             (signal-value btor1126)))
                                           (append
                                            (list
                                             (cons
                                              'state615
                                              (signal-value btor654)))
                                            (append
                                             (list
                                              (cons
                                               'state599
                                               (signal-value btor598)))
                                             (append
                                              (list
                                               (cons
                                                'state566
                                                (signal-value btor581)))
                                              (append
                                               (list
                                                (cons
                                                 'state564
                                                 (signal-value btor1121)))
                                               (append
                                                (list
                                                 (cons
                                                  'state562
                                                  (signal-value btor601)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state550
                                                   (signal-value btor549)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state517
                                                    (signal-value btor532)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state515
                                                     (signal-value btor1116)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state513
                                                      (signal-value btor552)))
                                                    (append
                                                     (list
                                                      (cons
                                                       'state435
                                                       (signal-value btor434)))
                                                     (append
                                                      (list
                                                       (cons
                                                        'state402
                                                        (signal-value
                                                         btor417)))
                                                      (append
                                                       (list
                                                        (cons
                                                         'state400
                                                         (signal-value
                                                          btor1111)))
                                                       (append
                                                        (list
                                                         (cons
                                                          'state398
                                                          (signal-value
                                                           btor437)))
                                                        (append
                                                         (list
                                                          (cons
                                                           'state395
                                                           (signal-value
                                                            btor394)))
                                                         (append
                                                          (list
                                                           (cons
                                                            'state362
                                                            (signal-value
                                                             btor377)))
                                                          (append
                                                           (list
                                                            (cons
                                                             'state360
                                                             (signal-value
                                                              btor1106)))
                                                           (append
                                                            (list
                                                             (cons
                                                              'state358
                                                              (signal-value
                                                               btor397)))
                                                            (append
                                                             (list
                                                              (cons
                                                               'state279
                                                               (signal-value
                                                                btor122)))
                                                             (append
                                                              (list
                                                               (cons
                                                                'state277
                                                                (signal-value
                                                                 btor1102)))
                                                              (append
                                                               (list
                                                                (cons
                                                                 'state275
                                                                 (signal-value
                                                                  btor283)))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  'state269
                                                                  (signal-value
                                                                   btor122)))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   'state267
                                                                   (signal-value
                                                                    btor1097)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state265
                                                                    (signal-value
                                                                     btor273)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state251
                                                                     (signal-value
                                                                      btor250)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state218
                                                                      (signal-value
                                                                       btor233)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state216
                                                                       (signal-value
                                                                        btor1091)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state214
                                                                        (signal-value
                                                                         btor253)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state201
                                                                         (signal-value
                                                                          btor200)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state166
                                                                          (signal-value
                                                                           btor181)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state164
                                                                           (signal-value
                                                                            btor1081)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state162
                                                                            (signal-value
                                                                             btor203)))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             'state155
                                                                             (signal-value
                                                                              btor122)))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              'state153
                                                                              (signal-value
                                                                               btor1071)))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               'state151
                                                                               (signal-value
                                                                                btor159)))
                                                                             (append
                                                                              (list
                                                                               (cons
                                                                                'state143
                                                                                (signal-value
                                                                                 btor122)))
                                                                              (append
                                                                               (list
                                                                                (cons
                                                                                 'state141
                                                                                 (signal-value
                                                                                  btor1064)))
                                                                               (append
                                                                                (list
                                                                                 (cons
                                                                                  'state139
                                                                                  (signal-value
                                                                                   btor147)))
                                                                                (append
                                                                                 (list
                                                                                  (cons
                                                                                   'state133
                                                                                   (signal-value
                                                                                    btor122)))
                                                                                 (append
                                                                                  (list
                                                                                   (cons
                                                                                    'state131
                                                                                    (signal-value
                                                                                     btor997)))
                                                                                  (append
                                                                                   (list
                                                                                    (cons
                                                                                     'state129
                                                                                     (signal-value
                                                                                      btor137)))
                                                                                   (append
                                                                                    (list
                                                                                     (cons
                                                                                      'state101
                                                                                      (signal-value
                                                                                       btor122)))
                                                                                    (append
                                                                                     (list
                                                                                      (cons
                                                                                       'state98
                                                                                       (signal-value
                                                                                        btor992)))
                                                                                     (append
                                                                                      (list
                                                                                       (cons
                                                                                        'state96
                                                                                        (signal-value
                                                                                         btor127)))
                                                                                      (list))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
       (cons
        'scanoutb
        (signal
         (signal-value btor262)
         (append
          (list (cons 'state962 (signal-value btor961)))
          (append
           (list (cons 'state929 (signal-value btor944)))
           (append
            (list (cons 'state927 (signal-value btor1166)))
            (append
             (list (cons 'state925 (signal-value btor964)))
             (append
              (list (cons 'state922 (signal-value btor921)))
              (append
               (list (cons 'state889 (signal-value btor904)))
               (append
                (list (cons 'state887 (signal-value btor1161)))
                (append
                 (list (cons 'state885 (signal-value btor924)))
                 (append
                  (list (cons 'state869 (signal-value btor314)))
                  (append
                   (list (cons 'state864 (signal-value btor299)))
                   (append
                    (list (cons 'state862 (signal-value btor1156)))
                    (append
                     (list (cons 'state860 (signal-value btor871)))
                     (append
                      (list (cons 'state855 (signal-value btor350)))
                      (append
                       (list (cons 'state850 (signal-value btor335)))
                       (append
                        (list (cons 'state848 (signal-value btor1151)))
                        (append
                         (list (cons 'state846 (signal-value btor857)))
                         (append
                          (list (cons 'state807 (signal-value btor806)))
                          (append
                           (list (cons 'state774 (signal-value btor789)))
                           (append
                            (list (cons 'state772 (signal-value btor1146)))
                            (append
                             (list (cons 'state770 (signal-value btor809)))
                             (append
                              (list (cons 'state750 (signal-value btor749)))
                              (append
                               (list (cons 'state717 (signal-value btor732)))
                               (append
                                (list (cons 'state715 (signal-value btor1141)))
                                (append
                                 (list (cons 'state713 (signal-value btor752)))
                                 (append
                                  (list
                                   (cons 'state707 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state705 (signal-value btor1137)))
                                   (append
                                    (list
                                     (cons 'state703 (signal-value btor711)))
                                    (append
                                     (list
                                      (cons 'state668 (signal-value btor651)))
                                     (append
                                      (list
                                       (cons 'state663 (signal-value btor634)))
                                      (append
                                       (list
                                        (cons
                                         'state661
                                         (signal-value btor1131)))
                                       (append
                                        (list
                                         (cons
                                          'state659
                                          (signal-value btor670)))
                                        (append
                                         (list
                                          (cons
                                           'state652
                                           (signal-value btor651)))
                                         (append
                                          (list
                                           (cons
                                            'state619
                                            (signal-value btor634)))
                                          (append
                                           (list
                                            (cons
                                             'state617
                                             (signal-value btor1126)))
                                           (append
                                            (list
                                             (cons
                                              'state615
                                              (signal-value btor654)))
                                            (append
                                             (list
                                              (cons
                                               'state599
                                               (signal-value btor598)))
                                             (append
                                              (list
                                               (cons
                                                'state566
                                                (signal-value btor581)))
                                              (append
                                               (list
                                                (cons
                                                 'state564
                                                 (signal-value btor1121)))
                                               (append
                                                (list
                                                 (cons
                                                  'state562
                                                  (signal-value btor601)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state550
                                                   (signal-value btor549)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state517
                                                    (signal-value btor532)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state515
                                                     (signal-value btor1116)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state513
                                                      (signal-value btor552)))
                                                    (append
                                                     (list
                                                      (cons
                                                       'state435
                                                       (signal-value btor434)))
                                                     (append
                                                      (list
                                                       (cons
                                                        'state402
                                                        (signal-value
                                                         btor417)))
                                                      (append
                                                       (list
                                                        (cons
                                                         'state400
                                                         (signal-value
                                                          btor1111)))
                                                       (append
                                                        (list
                                                         (cons
                                                          'state398
                                                          (signal-value
                                                           btor437)))
                                                        (append
                                                         (list
                                                          (cons
                                                           'state395
                                                           (signal-value
                                                            btor394)))
                                                         (append
                                                          (list
                                                           (cons
                                                            'state362
                                                            (signal-value
                                                             btor377)))
                                                          (append
                                                           (list
                                                            (cons
                                                             'state360
                                                             (signal-value
                                                              btor1106)))
                                                           (append
                                                            (list
                                                             (cons
                                                              'state358
                                                              (signal-value
                                                               btor397)))
                                                            (append
                                                             (list
                                                              (cons
                                                               'state279
                                                               (signal-value
                                                                btor122)))
                                                             (append
                                                              (list
                                                               (cons
                                                                'state277
                                                                (signal-value
                                                                 btor1102)))
                                                              (append
                                                               (list
                                                                (cons
                                                                 'state275
                                                                 (signal-value
                                                                  btor283)))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  'state269
                                                                  (signal-value
                                                                   btor122)))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   'state267
                                                                   (signal-value
                                                                    btor1097)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state265
                                                                    (signal-value
                                                                     btor273)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state251
                                                                     (signal-value
                                                                      btor250)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state218
                                                                      (signal-value
                                                                       btor233)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state216
                                                                       (signal-value
                                                                        btor1091)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state214
                                                                        (signal-value
                                                                         btor253)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state201
                                                                         (signal-value
                                                                          btor200)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state166
                                                                          (signal-value
                                                                           btor181)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state164
                                                                           (signal-value
                                                                            btor1081)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state162
                                                                            (signal-value
                                                                             btor203)))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             'state155
                                                                             (signal-value
                                                                              btor122)))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              'state153
                                                                              (signal-value
                                                                               btor1071)))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               'state151
                                                                               (signal-value
                                                                                btor159)))
                                                                             (append
                                                                              (list
                                                                               (cons
                                                                                'state143
                                                                                (signal-value
                                                                                 btor122)))
                                                                              (append
                                                                               (list
                                                                                (cons
                                                                                 'state141
                                                                                 (signal-value
                                                                                  btor1064)))
                                                                               (append
                                                                                (list
                                                                                 (cons
                                                                                  'state139
                                                                                  (signal-value
                                                                                   btor147)))
                                                                                (append
                                                                                 (list
                                                                                  (cons
                                                                                   'state133
                                                                                   (signal-value
                                                                                    btor122)))
                                                                                 (append
                                                                                  (list
                                                                                   (cons
                                                                                    'state131
                                                                                    (signal-value
                                                                                     btor997)))
                                                                                  (append
                                                                                   (list
                                                                                    (cons
                                                                                     'state129
                                                                                     (signal-value
                                                                                      btor137)))
                                                                                   (append
                                                                                    (list
                                                                                     (cons
                                                                                      'state101
                                                                                      (signal-value
                                                                                       btor122)))
                                                                                    (append
                                                                                     (list
                                                                                      (cons
                                                                                       'state98
                                                                                       (signal-value
                                                                                        btor992)))
                                                                                     (append
                                                                                      (list
                                                                                       (cons
                                                                                        'state96
                                                                                        (signal-value
                                                                                         btor127)))
                                                                                      (list))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

