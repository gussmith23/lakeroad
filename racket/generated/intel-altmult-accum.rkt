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
;;; https://github.com/uwsampl/lakeroad-private/blob/8413eeb52ddef8de34ae7fb11384f0687fc84a90/altera_mf/altera_mf_modified.v
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
      #:unnamed-input-621
      (unnamed-input-621
       (bv->signal (constant 'unnamed-input-621 (bitvector 36))))
      #:unnamed-input-1014
      (unnamed-input-1014
       (bv->signal (constant 'unnamed-input-1014 (bitvector 1))))
      #:unnamed-input-1016
      (unnamed-input-1016
       (bv->signal (constant 'unnamed-input-1016 (bitvector 36))))
      #:unnamed-input-1019
      (unnamed-input-1019
       (bv->signal (constant 'unnamed-input-1019 (bitvector 36))))
      #:unnamed-input-1041
      (unnamed-input-1041
       (bv->signal (constant 'unnamed-input-1041 (bitvector 1))))
      #:unnamed-input-1050
      (unnamed-input-1050
       (bv->signal (constant 'unnamed-input-1050 (bitvector 36))))
      #:unnamed-input-1057
      (unnamed-input-1057
       (bv->signal (constant 'unnamed-input-1057 (bitvector 36))))
      #:unnamed-input-1068
      (unnamed-input-1068
       (bv->signal (constant 'unnamed-input-1068 (bitvector 1))))
      #:unnamed-input-1071
      (unnamed-input-1071
       (bv->signal (constant 'unnamed-input-1071 (bitvector 1)))))
    (let* ((merged-input-state-hash (list))
           (init-hash
            (append
             (list (cons 'state942 (bv 1 (bitvector 1))))
             (append
              (list (cons 'state940 (bv 0 (bitvector 1))))
              (append
               (list (cons 'state938 (bv 0 (bitvector 1))))
               (append
                (list (cons 'state902 (bv 1 (bitvector 1))))
                (append
                 (list (cons 'state900 (bv 0 (bitvector 1))))
                 (append
                  (list (cons 'state898 (bv 0 (bitvector 1))))
                  (append
                   (list (cons 'state878 (bv 1 (bitvector 1))))
                   (append
                    (list (cons 'state876 (bv 0 (bitvector 1))))
                    (append
                     (list (cons 'state874 (bv 0 (bitvector 1))))
                     (append
                      (list (cons 'state864 (bv 1 (bitvector 1))))
                      (append
                       (list (cons 'state862 (bv 0 (bitvector 1))))
                       (append
                        (list (cons 'state860 (bv 0 (bitvector 1))))
                        (append
                         (list (cons 'state789 (bv 1 (bitvector 1))))
                         (append
                          (list (cons 'state787 (bv 0 (bitvector 1))))
                          (append
                           (list (cons 'state785 (bv 0 (bitvector 1))))
                           (append
                            (list (cons 'state732 (bv 1 (bitvector 1))))
                            (append
                             (list (cons 'state730 (bv 0 (bitvector 1))))
                             (append
                              (list (cons 'state728 (bv 0 (bitvector 1))))
                              (append
                               (list (cons 'state722 (bv 1 (bitvector 1))))
                               (append
                                (list (cons 'state720 (bv 0 (bitvector 36))))
                                (append
                                 (list (cons 'state718 (bv 0 (bitvector 36))))
                                 (append
                                  (list (cons 'state676 (bv 1 (bitvector 1))))
                                  (append
                                   (list
                                    (cons 'state674 (bv 0 (bitvector 36))))
                                   (append
                                    (list
                                     (cons 'state672 (bv 0 (bitvector 36))))
                                    (append
                                     (list
                                      (cons 'state632 (bv 1 (bitvector 1))))
                                     (append
                                      (list
                                       (cons 'state630 (bv 0 (bitvector 1))))
                                      (append
                                       (list
                                        (cons 'state628 (bv 0 (bitvector 1))))
                                       (append
                                        (list
                                         (cons 'state568 (bv 1 (bitvector 1))))
                                        (append
                                         (list
                                          (cons
                                           'state566
                                           (bv 0 (bitvector 1))))
                                         (append
                                          (list
                                           (cons
                                            'state564
                                            (bv 0 (bitvector 1))))
                                          (append
                                           (list
                                            (cons
                                             'state509
                                             (bv 1 (bitvector 1))))
                                           (append
                                            (list
                                             (cons
                                              'state507
                                              (bv 0 (bitvector 1))))
                                            (append
                                             (list
                                              (cons
                                               'state505
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
           (btor501 (signal (bvnot (signal-value btor212)) (list)))
           (btor502
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 18))
             btor100))
           (btor503
            (signal
             (bvadd (signal-value btor501) (signal-value btor502))
             (list)))
           (btor504
            (signal
             (extract 17 17 (signal-value btor212))
             (signal-state btor212)))
           (btor505
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state505)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state505)))
                     ((assoc-has-key? init-hash 'state505)
                      (bv->signal (assoc-ref init-hash 'state505)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor507
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state507)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state507)))
                     ((assoc-has-key? init-hash 'state507)
                      (bv->signal (assoc-ref init-hash 'state507)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor509
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state509)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state509)))
                     ((assoc-has-key? init-hash 'state509)
                      (bv->signal (assoc-ref init-hash 'state509)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor511
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor512
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor511)))
             (list)))
           (btor513
            (if (bitvector->bool (signal-value btor512)) btor36 btor95))
           (btor514
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor515
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor514)))
             (list)))
           (btor516
            (if (bitvector->bool (signal-value btor515)) btor35 btor513))
           (btor517
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor518
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor517)))
             (list)))
           (btor519
            (if (bitvector->bool (signal-value btor518)) btor34 btor516))
           (btor520
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor116)))
             (list)))
           (btor521
            (if (bitvector->bool (signal-value btor520)) btor95 btor519))
           (btor522
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor523
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor522)))
             (list)))
           (btor524
            (if (bitvector->bool (signal-value btor523)) btor33 btor521))
           (btor525
            (signal
             (concat (signal-value btor524) (signal-value btor509))
             (list)))
           (btor526
            (signal
             (bool->bitvector
              (bveq (signal-value btor525) (signal-value btor125)))
             (list)))
           (btor527
            (if (bitvector->bool (signal-value btor526)) btor507 btor505))
           (btor528
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor529
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor528)))
             (list)))
           (btor530
            (if (bitvector->bool (signal-value btor529)) btor26 btor95))
           (btor531
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor532
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor531)))
             (list)))
           (btor533
            (if (bitvector->bool (signal-value btor532)) btor25 btor530))
           (btor534
            (signal
             (apply bvor (bitvector->bits (signal-value btor83)))
             (signal-state btor83)))
           (btor535 (signal (bvnot (signal-value btor534)) (list)))
           (btor536
            (if (bitvector->bool (signal-value btor535)) btor24 btor533))
           (btor537
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor194)))
             (list)))
           (btor538
            (if (bitvector->bool (signal-value btor537)) btor95 btor536))
           (btor539
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor540
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor539)))
             (list)))
           (btor541
            (if (bitvector->bool (signal-value btor540)) btor27 btor538))
           (btor542
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state542)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state542)))
                     ((assoc-has-key? init-hash 'state542)
                      (bv->signal (assoc-ref init-hash 'state542)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor543
            (signal
             (bvor (signal-value btor541) (signal-value btor542))
             (list)))
           (btor544
            (if (bitvector->bool (signal-value btor543)) btor95 btor527))
           (btor545
            (if (bitvector->bool (signal-value btor520)) btor91 btor544))
           (btor546 (bv->signal (bv 19 (bitvector 5))))
           (btor547
            (signal
             (bool->bitvector
              (bveq (signal-value btor79) (signal-value btor546)))
             (list)))
           (btor548
            (if (bitvector->bool (signal-value btor547)) btor100 btor95))
           (btor549
            (bv->signal
             (zero-extend (signal-value btor444) (bitvector 5))
             btor444))
           (btor550
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor549)))
             (list)))
           (btor551
            (if (bitvector->bool (signal-value btor550)) btor548 btor545))
           (btor552
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor448)))
             (list)))
           (btor553
            (if (bitvector->bool (signal-value btor552)) btor545 btor551))
           (btor554
            (signal
             (bvand (signal-value btor504) (signal-value btor553))
             (list)))
           (btor555
            (if (bitvector->bool (signal-value btor554)) btor503 btor212))
           (btor556
            (bv->signal
             (zero-extend (signal-value btor555) (bitvector 18))
             btor555))
           (btor557
            (bv->signal
             (zero-extend (signal-value btor203) (bitvector 18))
             btor203))
           (btor558
            (bv->signal
             (zero-extend (signal-value btor211) (bitvector 18))
             btor211))
           (btor559
            (bv->signal
             (zero-extend (signal-value btor212) (bitvector 18))
             btor212))
           (btor560 (signal (bvnot (signal-value btor262)) (list)))
           (btor561
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 18))
             btor100))
           (btor562
            (signal
             (bvadd (signal-value btor560) (signal-value btor561))
             (list)))
           (btor563
            (signal
             (extract 17 17 (signal-value btor262))
             (signal-state btor262)))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state568)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state568)))
                     ((assoc-has-key? init-hash 'state568)
                      (bv->signal (assoc-ref init-hash 'state568)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor570
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor571
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor570)))
             (list)))
           (btor572
            (if (bitvector->bool (signal-value btor571)) btor36 btor95))
           (btor573
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor574
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor573)))
             (list)))
           (btor575
            (if (bitvector->bool (signal-value btor574)) btor35 btor572))
           (btor576
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor577
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor576)))
             (list)))
           (btor578
            (if (bitvector->bool (signal-value btor577)) btor34 btor575))
           (btor579
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor116)))
             (list)))
           (btor580
            (if (bitvector->bool (signal-value btor579)) btor95 btor578))
           (btor581
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor582
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor581)))
             (list)))
           (btor583
            (if (bitvector->bool (signal-value btor582)) btor33 btor580))
           (btor584
            (signal
             (concat (signal-value btor583) (signal-value btor568))
             (list)))
           (btor585
            (signal
             (bool->bitvector
              (bveq (signal-value btor584) (signal-value btor125)))
             (list)))
           (btor586
            (if (bitvector->bool (signal-value btor585)) btor566 btor564))
           (btor587
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor588
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor587)))
             (list)))
           (btor589
            (if (bitvector->bool (signal-value btor588)) btor26 btor95))
           (btor590
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor591
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor590)))
             (list)))
           (btor592
            (if (bitvector->bool (signal-value btor591)) btor25 btor589))
           (btor593
            (signal
             (apply bvor (bitvector->bits (signal-value btor84)))
             (signal-state btor84)))
           (btor594 (signal (bvnot (signal-value btor593)) (list)))
           (btor595
            (if (bitvector->bool (signal-value btor594)) btor24 btor592))
           (btor596
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor194)))
             (list)))
           (btor597
            (if (bitvector->bool (signal-value btor596)) btor95 btor595))
           (btor598
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor599
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor598)))
             (list)))
           (btor600
            (if (bitvector->bool (signal-value btor599)) btor27 btor597))
           (btor601
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state601)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state601)))
                     ((assoc-has-key? init-hash 'state601)
                      (bv->signal (assoc-ref init-hash 'state601)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor602
            (signal
             (bvor (signal-value btor600) (signal-value btor601))
             (list)))
           (btor603
            (if (bitvector->bool (signal-value btor602)) btor95 btor586))
           (btor604
            (if (bitvector->bool (signal-value btor579)) btor92 btor603))
           (btor605
            (signal
             (bool->bitvector
              (bveq (signal-value btor80) (signal-value btor546)))
             (list)))
           (btor606
            (if (bitvector->bool (signal-value btor605)) btor100 btor95))
           (btor607
            (bv->signal
             (zero-extend (signal-value btor444) (bitvector 5))
             btor444))
           (btor608
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor607)))
             (list)))
           (btor609
            (if (bitvector->bool (signal-value btor608)) btor606 btor604))
           (btor610
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor448)))
             (list)))
           (btor611
            (if (bitvector->bool (signal-value btor610)) btor604 btor609))
           (btor612
            (signal
             (bvand (signal-value btor563) (signal-value btor611))
             (list)))
           (btor613
            (if (bitvector->bool (signal-value btor612)) btor562 btor262))
           (btor614
            (bv->signal
             (zero-extend (signal-value btor613) (bitvector 18))
             btor613))
           (btor615
            (bv->signal
             (zero-extend (signal-value btor253) (bitvector 18))
             btor253))
           (btor616
            (bv->signal
             (zero-extend (signal-value btor261) (bitvector 18))
             btor261))
           (btor617
            (bv->signal
             (zero-extend (signal-value btor262) (bitvector 18))
             btor262))
           (btor618
            (bv->signal
             (zero-extend (signal-value btor555) (bitvector 36))
             btor555))
           (btor619
            (bv->signal
             (zero-extend (signal-value btor613) (bitvector 36))
             btor613))
           (btor620
            (signal
             (bvmul (signal-value btor618) (signal-value btor619))
             (list)))
           (btor621 unnamed-input-621)
           (btor622
            (signal
             (bvsub (signal-value btor621) (signal-value btor620))
             (list)))
           (btor623
            (signal
             (bvxor (signal-value btor554) (signal-value btor612))
             (list)))
           (btor624
            (if (bitvector->bool (signal-value btor623)) btor622 btor620))
           (btor625
            (bv->signal
             (zero-extend (signal-value btor624) (bitvector 36))
             btor624))
           (btor626
            (bv->signal
             (zero-extend (signal-value btor137) (bitvector 1))
             btor137))
           (btor627
            (bv->signal
             (zero-extend (signal-value btor95) (bitvector 1))
             btor95))
           (btor628
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state628)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state628)))
                     ((assoc-has-key? init-hash 'state628)
                      (bv->signal (assoc-ref init-hash 'state628)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor630
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state630)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state630)))
                     ((assoc-has-key? init-hash 'state630)
                      (bv->signal (assoc-ref init-hash 'state630)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor632
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state632)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state632)))
                     ((assoc-has-key? init-hash 'state632)
                      (bv->signal (assoc-ref init-hash 'state632)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor634
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor635
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor634)))
             (list)))
           (btor636
            (if (bitvector->bool (signal-value btor635)) btor36 btor95))
           (btor637
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor638
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor637)))
             (list)))
           (btor639
            (if (bitvector->bool (signal-value btor638)) btor35 btor636))
           (btor640
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor641
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor640)))
             (list)))
           (btor642
            (if (bitvector->bool (signal-value btor641)) btor34 btor639))
           (btor643
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor116)))
             (list)))
           (btor644
            (if (bitvector->bool (signal-value btor643)) btor95 btor642))
           (btor645
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor646
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor645)))
             (list)))
           (btor647
            (if (bitvector->bool (signal-value btor646)) btor33 btor644))
           (btor648
            (signal
             (concat (signal-value btor647) (signal-value btor632))
             (list)))
           (btor649
            (signal
             (bool->bitvector
              (bveq (signal-value btor648) (signal-value btor125)))
             (list)))
           (btor650
            (if (bitvector->bool (signal-value btor649)) btor630 btor628))
           (btor651
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor652
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor651)))
             (list)))
           (btor653
            (if (bitvector->bool (signal-value btor652)) btor26 btor95))
           (btor654
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor655
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor654)))
             (list)))
           (btor656
            (if (bitvector->bool (signal-value btor655)) btor25 btor653))
           (btor657
            (signal
             (apply bvor (bitvector->bits (signal-value btor70)))
             (signal-state btor70)))
           (btor658 (signal (bvnot (signal-value btor657)) (list)))
           (btor659
            (if (bitvector->bool (signal-value btor658)) btor24 btor656))
           (btor660
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor194)))
             (list)))
           (btor661
            (if (bitvector->bool (signal-value btor660)) btor95 btor659))
           (btor662
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor663
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor662)))
             (list)))
           (btor664
            (if (bitvector->bool (signal-value btor663)) btor27 btor661))
           (btor665
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state665)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state665)))
                     ((assoc-has-key? init-hash 'state665)
                      (bv->signal (assoc-ref init-hash 'state665)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor666
            (signal
             (bvor (signal-value btor664) (signal-value btor665))
             (list)))
           (btor667
            (if (bitvector->bool (signal-value btor666)) btor95 btor650))
           (btor668
            (bv->signal
             (zero-extend (signal-value btor667) (bitvector 1))
             btor667))
           (btor669
            (if (bitvector->bool (signal-value btor643)) btor95 btor667))
           (btor670
            (bv->signal
             (zero-extend (signal-value btor669) (bitvector 1))
             btor669))
           (btor671
            (bv->signal
             (zero-extend (signal-value btor624) (bitvector 36))
             btor624))
           (btor672
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state672)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state672)))
                     ((assoc-has-key? init-hash 'state672)
                      (bv->signal (assoc-ref init-hash 'state672)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor674
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state674)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state674)))
                     ((assoc-has-key? init-hash 'state674)
                      (bv->signal (assoc-ref init-hash 'state674)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor676
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state676)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state676)))
                     ((assoc-has-key? init-hash 'state676)
                      (bv->signal (assoc-ref init-hash 'state676)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor678
            (signal
             (concat (signal-value btor647) (signal-value btor676))
             (list)))
           (btor679
            (signal
             (bool->bitvector
              (bveq (signal-value btor678) (signal-value btor125)))
             (list)))
           (btor680
            (if (bitvector->bool (signal-value btor679)) btor674 btor672))
           (btor681
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state681)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state681)))
                     ((assoc-has-key? init-hash 'state681)
                      (bv->signal (assoc-ref init-hash 'state681)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor682
            (signal
             (bvor (signal-value btor664) (signal-value btor681))
             (list)))
           (btor683
            (if (bitvector->bool (signal-value btor682)) btor150 btor680))
           (btor684
            (bv->signal
             (zero-extend (signal-value btor683) (bitvector 36))
             btor683))
           (btor685
            (bv->signal
             (zero-extend (signal-value btor95) (bitvector 1))
             btor95))
           (btor686
            (bv->signal
             (zero-extend (signal-value btor647) (bitvector 1))
             btor647))
           (btor687
            (bv->signal
             (zero-extend (signal-value btor664) (bitvector 1))
             btor664))
           (btor688
            (if (bitvector->bool (signal-value btor635)) btor52 btor100))
           (btor689
            (if (bitvector->bool (signal-value btor638)) btor51 btor688))
           (btor690
            (if (bitvector->bool (signal-value btor641)) btor50 btor689))
           (btor691
            (if (bitvector->bool (signal-value btor643)) btor100 btor690))
           (btor692
            (if (bitvector->bool (signal-value btor646)) btor49 btor691))
           (btor693
            (bv->signal
             (zero-extend (signal-value btor692) (bitvector 1))
             btor692))
           (btor694
            (bv->signal
             (zero-extend (signal-value btor554) (bitvector 1))
             btor554))
           (btor695
            (bv->signal
             (zero-extend (signal-value btor612) (bitvector 1))
             btor612))
           (btor696
            (bv->signal
             (zero-extend (signal-value btor122) (bitvector 1))
             btor122))
           (btor697
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor698
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor697)))
             (list)))
           (btor699
            (if (bitvector->bool (signal-value btor698)) btor26 btor95))
           (btor700
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor701
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor700)))
             (list)))
           (btor702
            (if (bitvector->bool (signal-value btor701)) btor25 btor699))
           (btor703
            (signal
             (apply bvor (bitvector->bits (signal-value btor72)))
             (signal-state btor72)))
           (btor704 (signal (bvnot (signal-value btor703)) (list)))
           (btor705
            (if (bitvector->bool (signal-value btor704)) btor24 btor702))
           (btor706
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor194)))
             (list)))
           (btor707
            (if (bitvector->bool (signal-value btor706)) btor95 btor705))
           (btor708
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor709
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor708)))
             (list)))
           (btor710
            (if (bitvector->bool (signal-value btor709)) btor27 btor707))
           (btor711
            (bv->signal
             (zero-extend (signal-value btor710) (bitvector 1))
             btor710))
           (btor712
            (if (bitvector->bool (signal-value btor106)) btor52 btor100))
           (btor713
            (if (bitvector->bool (signal-value btor110)) btor51 btor712))
           (btor714
            (if (bitvector->bool (signal-value btor114)) btor50 btor713))
           (btor715
            (if (bitvector->bool (signal-value btor117)) btor100 btor714))
           (btor716
            (if (bitvector->bool (signal-value btor121)) btor49 btor715))
           (btor717
            (bv->signal
             (zero-extend (signal-value btor716) (bitvector 1))
             btor716))
           (btor718
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state718)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state718)))
                     ((assoc-has-key? init-hash 'state718)
                      (bv->signal (assoc-ref init-hash 'state718)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor720
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state720)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state720)))
                     ((assoc-has-key? init-hash 'state720)
                      (bv->signal (assoc-ref init-hash 'state720)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor722
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state722)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state722)))
                     ((assoc-has-key? init-hash 'state722)
                      (bv->signal (assoc-ref init-hash 'state722)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor724
            (signal
             (concat (signal-value btor122) (signal-value btor722))
             (list)))
           (btor725
            (signal
             (bool->bitvector
              (bveq (signal-value btor724) (signal-value btor125)))
             (list)))
           (btor726
            (if (bitvector->bool (signal-value btor725)) btor720 btor718))
           (btor727
            (bv->signal
             (zero-extend (signal-value btor726) (bitvector 36))
             btor726))
           (btor728
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state728)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state728)))
                     ((assoc-has-key? init-hash 'state728)
                      (bv->signal (assoc-ref init-hash 'state728)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor730
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state730)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state730)))
                     ((assoc-has-key? init-hash 'state730)
                      (bv->signal (assoc-ref init-hash 'state730)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor732
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state732)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state732)))
                     ((assoc-has-key? init-hash 'state732)
                      (bv->signal (assoc-ref init-hash 'state732)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor734
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor735
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor734)))
             (list)))
           (btor736
            (if (bitvector->bool (signal-value btor735)) btor36 btor95))
           (btor737
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor738
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor737)))
             (list)))
           (btor739
            (if (bitvector->bool (signal-value btor738)) btor35 btor736))
           (btor740
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor741
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor740)))
             (list)))
           (btor742
            (if (bitvector->bool (signal-value btor741)) btor34 btor739))
           (btor743
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor116)))
             (list)))
           (btor744
            (if (bitvector->bool (signal-value btor743)) btor95 btor742))
           (btor745
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor746
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor745)))
             (list)))
           (btor747
            (if (bitvector->bool (signal-value btor746)) btor33 btor744))
           (btor748
            (signal
             (concat (signal-value btor747) (signal-value btor732))
             (list)))
           (btor749
            (signal
             (bool->bitvector
              (bveq (signal-value btor748) (signal-value btor125)))
             (list)))
           (btor750
            (if (bitvector->bool (signal-value btor749)) btor730 btor728))
           (btor751
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor752
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor751)))
             (list)))
           (btor753
            (if (bitvector->bool (signal-value btor752)) btor26 btor95))
           (btor754
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor755
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor754)))
             (list)))
           (btor756
            (if (bitvector->bool (signal-value btor755)) btor25 btor753))
           (btor757
            (signal
             (apply bvor (bitvector->bits (signal-value btor85)))
             (signal-state btor85)))
           (btor758 (signal (bvnot (signal-value btor757)) (list)))
           (btor759
            (if (bitvector->bool (signal-value btor758)) btor24 btor756))
           (btor760
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor194)))
             (list)))
           (btor761
            (if (bitvector->bool (signal-value btor760)) btor95 btor759))
           (btor762
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor763
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor762)))
             (list)))
           (btor764
            (if (bitvector->bool (signal-value btor763)) btor27 btor761))
           (btor765
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state765)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state765)))
                     ((assoc-has-key? init-hash 'state765)
                      (bv->signal (assoc-ref init-hash 'state765)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor766
            (signal
             (bvor (signal-value btor764) (signal-value btor765))
             (list)))
           (btor767
            (if (bitvector->bool (signal-value btor766)) btor95 btor750))
           (btor768
            (if (bitvector->bool (signal-value btor743)) btor545 btor767))
           (btor769
            (if (bitvector->bool (signal-value btor550)) btor548 btor768))
           (btor770
            (if (bitvector->bool (signal-value btor552)) btor768 btor769))
           (btor771
            (bv->signal
             (zero-extend (signal-value btor770) (bitvector 1))
             btor770))
           (btor772
            (bv->signal
             (zero-extend (signal-value btor767) (bitvector 1))
             btor767))
           (btor773
            (bv->signal
             (zero-extend (signal-value btor768) (bitvector 1))
             btor768))
           (btor774
            (bv->signal
             (zero-extend (signal-value btor544) (bitvector 1))
             btor544))
           (btor775
            (bv->signal
             (zero-extend (signal-value btor553) (bitvector 1))
             btor553))
           (btor776
            (bv->signal
             (zero-extend (signal-value btor545) (bitvector 1))
             btor545))
           (btor777
            (bv->signal
             (zero-extend (signal-value btor524) (bitvector 1))
             btor524))
           (btor778
            (bv->signal
             (zero-extend (signal-value btor541) (bitvector 1))
             btor541))
           (btor779
            (if (bitvector->bool (signal-value btor512)) btor52 btor100))
           (btor780
            (if (bitvector->bool (signal-value btor515)) btor51 btor779))
           (btor781
            (if (bitvector->bool (signal-value btor518)) btor50 btor780))
           (btor782
            (if (bitvector->bool (signal-value btor520)) btor100 btor781))
           (btor783
            (if (bitvector->bool (signal-value btor523)) btor49 btor782))
           (btor784
            (bv->signal
             (zero-extend (signal-value btor783) (bitvector 1))
             btor783))
           (btor785
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state785)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state785)))
                     ((assoc-has-key? init-hash 'state785)
                      (bv->signal (assoc-ref init-hash 'state785)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor787
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state787)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state787)))
                     ((assoc-has-key? init-hash 'state787)
                      (bv->signal (assoc-ref init-hash 'state787)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor789
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state789)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state789)))
                     ((assoc-has-key? init-hash 'state789)
                      (bv->signal (assoc-ref init-hash 'state789)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor791
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor792
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor791)))
             (list)))
           (btor793
            (if (bitvector->bool (signal-value btor792)) btor36 btor95))
           (btor794
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor795
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor794)))
             (list)))
           (btor796
            (if (bitvector->bool (signal-value btor795)) btor35 btor793))
           (btor797
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor798
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor797)))
             (list)))
           (btor799
            (if (bitvector->bool (signal-value btor798)) btor34 btor796))
           (btor800
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor116)))
             (list)))
           (btor801
            (if (bitvector->bool (signal-value btor800)) btor95 btor799))
           (btor802
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor803
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor802)))
             (list)))
           (btor804
            (if (bitvector->bool (signal-value btor803)) btor33 btor801))
           (btor805
            (signal
             (concat (signal-value btor804) (signal-value btor789))
             (list)))
           (btor806
            (signal
             (bool->bitvector
              (bveq (signal-value btor805) (signal-value btor125)))
             (list)))
           (btor807
            (if (bitvector->bool (signal-value btor806)) btor787 btor785))
           (btor808
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor809
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor808)))
             (list)))
           (btor810
            (if (bitvector->bool (signal-value btor809)) btor26 btor95))
           (btor811
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor812
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor811)))
             (list)))
           (btor813
            (if (bitvector->bool (signal-value btor812)) btor25 btor810))
           (btor814
            (signal
             (apply bvor (bitvector->bits (signal-value btor86)))
             (signal-state btor86)))
           (btor815 (signal (bvnot (signal-value btor814)) (list)))
           (btor816
            (if (bitvector->bool (signal-value btor815)) btor24 btor813))
           (btor817
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor194)))
             (list)))
           (btor818
            (if (bitvector->bool (signal-value btor817)) btor95 btor816))
           (btor819
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor820
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor819)))
             (list)))
           (btor821
            (if (bitvector->bool (signal-value btor820)) btor27 btor818))
           (btor822
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state822)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state822)))
                     ((assoc-has-key? init-hash 'state822)
                      (bv->signal (assoc-ref init-hash 'state822)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor823
            (signal
             (bvor (signal-value btor821) (signal-value btor822))
             (list)))
           (btor824
            (if (bitvector->bool (signal-value btor823)) btor95 btor807))
           (btor825
            (if (bitvector->bool (signal-value btor800)) btor604 btor824))
           (btor826
            (if (bitvector->bool (signal-value btor608)) btor606 btor825))
           (btor827
            (if (bitvector->bool (signal-value btor610)) btor825 btor826))
           (btor828
            (bv->signal
             (zero-extend (signal-value btor827) (bitvector 1))
             btor827))
           (btor829
            (bv->signal
             (zero-extend (signal-value btor824) (bitvector 1))
             btor824))
           (btor830
            (bv->signal
             (zero-extend (signal-value btor825) (bitvector 1))
             btor825))
           (btor831
            (bv->signal
             (zero-extend (signal-value btor603) (bitvector 1))
             btor603))
           (btor832
            (bv->signal
             (zero-extend (signal-value btor611) (bitvector 1))
             btor611))
           (btor833
            (bv->signal
             (zero-extend (signal-value btor604) (bitvector 1))
             btor604))
           (btor834
            (bv->signal
             (zero-extend (signal-value btor583) (bitvector 1))
             btor583))
           (btor835
            (bv->signal
             (zero-extend (signal-value btor600) (bitvector 1))
             btor600))
           (btor836
            (if (bitvector->bool (signal-value btor571)) btor52 btor100))
           (btor837
            (if (bitvector->bool (signal-value btor574)) btor51 btor836))
           (btor838
            (if (bitvector->bool (signal-value btor577)) btor50 btor837))
           (btor839
            (if (bitvector->bool (signal-value btor579)) btor100 btor838))
           (btor840
            (if (bitvector->bool (signal-value btor582)) btor49 btor839))
           (btor841
            (bv->signal
             (zero-extend (signal-value btor840) (bitvector 1))
             btor840))
           (btor842
            (bv->signal
             (zero-extend (signal-value btor747) (bitvector 1))
             btor747))
           (btor843
            (bv->signal
             (zero-extend (signal-value btor764) (bitvector 1))
             btor764))
           (btor844
            (if (bitvector->bool (signal-value btor735)) btor52 btor100))
           (btor845
            (if (bitvector->bool (signal-value btor738)) btor51 btor844))
           (btor846
            (if (bitvector->bool (signal-value btor741)) btor50 btor845))
           (btor847
            (if (bitvector->bool (signal-value btor743)) btor100 btor846))
           (btor848
            (if (bitvector->bool (signal-value btor746)) btor49 btor847))
           (btor849
            (bv->signal
             (zero-extend (signal-value btor848) (bitvector 1))
             btor848))
           (btor850
            (bv->signal
             (zero-extend (signal-value btor804) (bitvector 1))
             btor804))
           (btor851
            (bv->signal
             (zero-extend (signal-value btor821) (bitvector 1))
             btor821))
           (btor852
            (if (bitvector->bool (signal-value btor792)) btor52 btor100))
           (btor853
            (if (bitvector->bool (signal-value btor795)) btor51 btor852))
           (btor854
            (if (bitvector->bool (signal-value btor798)) btor50 btor853))
           (btor855
            (if (bitvector->bool (signal-value btor800)) btor100 btor854))
           (btor856
            (if (bitvector->bool (signal-value btor803)) btor49 btor855))
           (btor857
            (bv->signal
             (zero-extend (signal-value btor856) (bitvector 1))
             btor856))
           (btor858
            (bv->signal
             (zero-extend (signal-value btor545) (bitvector 1))
             btor545))
           (btor859
            (bv->signal
             (zero-extend (signal-value btor604) (bitvector 1))
             btor604))
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
             (concat (signal-value btor335) (signal-value btor864))
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
             (bvor (signal-value btor350) (signal-value btor869))
             (list)))
           (btor871
            (if (bitvector->bool (signal-value btor870)) btor95 btor868))
           (btor872
            (if (bitvector->bool (signal-value btor331)) btor19 btor871))
           (btor873
            (bv->signal
             (zero-extend (signal-value btor872) (bitvector 1))
             btor872))
           (btor874
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state874)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state874)))
                     ((assoc-has-key? init-hash 'state874)
                      (bv->signal (assoc-ref init-hash 'state874)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor876
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state876)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state876)))
                     ((assoc-has-key? init-hash 'state876)
                      (bv->signal (assoc-ref init-hash 'state876)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor878
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state878)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state878)))
                     ((assoc-has-key? init-hash 'state878)
                      (bv->signal (assoc-ref init-hash 'state878)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor880
            (signal
             (concat (signal-value btor299) (signal-value btor878))
             (list)))
           (btor881
            (signal
             (bool->bitvector
              (bveq (signal-value btor880) (signal-value btor125)))
             (list)))
           (btor882
            (if (bitvector->bool (signal-value btor881)) btor876 btor874))
           (btor883
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state883)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state883)))
                     ((assoc-has-key? init-hash 'state883)
                      (bv->signal (assoc-ref init-hash 'state883)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor884
            (signal
             (bvor (signal-value btor314) (signal-value btor883))
             (list)))
           (btor885
            (if (bitvector->bool (signal-value btor884)) btor95 btor882))
           (btor886
            (bv->signal
             (zero-extend (signal-value btor885) (bitvector 1))
             btor885))
           (btor887 (bitvector 35))
           (btor888 (bv->signal (bv 0 (bitvector 35))))
           (btor889
            (signal
             (concat (signal-value btor885) (signal-value btor888))
             (list)))
           (btor890
            (signal
             (concat (signal-value btor872) (signal-value btor888))
             (list)))
           (btor891
            (if (bitvector->bool (signal-value btor295)) btor890 btor889))
           (btor892
            (bv->signal
             (zero-extend (signal-value btor891) (bitvector 36))
             btor891))
           (btor893
            (bv->signal
             (zero-extend (signal-value btor871) (bitvector 1))
             btor871))
           (btor894
            (bv->signal
             (zero-extend (signal-value btor872) (bitvector 1))
             btor872))
           (btor895
            (bv->signal
             (zero-extend (signal-value btor624) (bitvector 36))
             btor624))
           (btor896
            (bv->signal
             (zero-extend (signal-value btor620) (bitvector 36))
             btor620))
           (btor897
            (bv->signal
             (zero-extend (signal-value btor621) (bitvector 36))
             btor621))
           (btor898
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state898)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state898)))
                     ((assoc-has-key? init-hash 'state898)
                      (bv->signal (assoc-ref init-hash 'state898)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor900
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state900)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state900)))
                     ((assoc-has-key? init-hash 'state900)
                      (bv->signal (assoc-ref init-hash 'state900)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor902
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state902)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state902)))
                     ((assoc-has-key? init-hash 'state902)
                      (bv->signal (assoc-ref init-hash 'state902)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor904
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor905
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor904)))
             (list)))
           (btor906
            (if (bitvector->bool (signal-value btor905)) btor36 btor95))
           (btor907
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor908
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor907)))
             (list)))
           (btor909
            (if (bitvector->bool (signal-value btor908)) btor35 btor906))
           (btor910
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor911
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor910)))
             (list)))
           (btor912
            (if (bitvector->bool (signal-value btor911)) btor34 btor909))
           (btor913
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor116)))
             (list)))
           (btor914
            (if (bitvector->bool (signal-value btor913)) btor95 btor912))
           (btor915
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor916
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor915)))
             (list)))
           (btor917
            (if (bitvector->bool (signal-value btor916)) btor33 btor914))
           (btor918
            (signal
             (concat (signal-value btor917) (signal-value btor902))
             (list)))
           (btor919
            (signal
             (bool->bitvector
              (bveq (signal-value btor918) (signal-value btor125)))
             (list)))
           (btor920
            (if (bitvector->bool (signal-value btor919)) btor900 btor898))
           (btor921
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor922
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor921)))
             (list)))
           (btor923
            (if (bitvector->bool (signal-value btor922)) btor26 btor95))
           (btor924
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor925
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor924)))
             (list)))
           (btor926
            (if (bitvector->bool (signal-value btor925)) btor25 btor923))
           (btor927
            (signal
             (apply bvor (bitvector->bits (signal-value btor16)))
             (signal-state btor16)))
           (btor928 (signal (bvnot (signal-value btor927)) (list)))
           (btor929
            (if (bitvector->bool (signal-value btor928)) btor24 btor926))
           (btor930
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor194)))
             (list)))
           (btor931
            (if (bitvector->bool (signal-value btor930)) btor95 btor929))
           (btor932
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor933
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor932)))
             (list)))
           (btor934
            (if (bitvector->bool (signal-value btor933)) btor27 btor931))
           (btor935
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state935)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state935)))
                     ((assoc-has-key? init-hash 'state935)
                      (bv->signal (assoc-ref init-hash 'state935)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor936
            (signal
             (bvor (signal-value btor934) (signal-value btor935))
             (list)))
           (btor937
            (if (bitvector->bool (signal-value btor936)) btor95 btor920))
           (btor938
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state938)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state938)))
                     ((assoc-has-key? init-hash 'state938)
                      (bv->signal (assoc-ref init-hash 'state938)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor940
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state940)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state940)))
                     ((assoc-has-key? init-hash 'state940)
                      (bv->signal (assoc-ref init-hash 'state940)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor942
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state942)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state942)))
                     ((assoc-has-key? init-hash 'state942)
                      (bv->signal (assoc-ref init-hash 'state942)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor944
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor945
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor944)))
             (list)))
           (btor946
            (if (bitvector->bool (signal-value btor945)) btor36 btor95))
           (btor947
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor948
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor947)))
             (list)))
           (btor949
            (if (bitvector->bool (signal-value btor948)) btor35 btor946))
           (btor950
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor951
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor950)))
             (list)))
           (btor952
            (if (bitvector->bool (signal-value btor951)) btor34 btor949))
           (btor953
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor116)))
             (list)))
           (btor954
            (if (bitvector->bool (signal-value btor953)) btor95 btor952))
           (btor955
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor956
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor955)))
             (list)))
           (btor957
            (if (bitvector->bool (signal-value btor956)) btor33 btor954))
           (btor958
            (signal
             (concat (signal-value btor957) (signal-value btor942))
             (list)))
           (btor959
            (signal
             (bool->bitvector
              (bveq (signal-value btor958) (signal-value btor125)))
             (list)))
           (btor960
            (if (bitvector->bool (signal-value btor959)) btor940 btor938))
           (btor961
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor962
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor961)))
             (list)))
           (btor963
            (if (bitvector->bool (signal-value btor962)) btor26 btor95))
           (btor964
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor965
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor964)))
             (list)))
           (btor966
            (if (bitvector->bool (signal-value btor965)) btor25 btor963))
           (btor967
            (signal
             (apply bvor (bitvector->bits (signal-value btor15)))
             (signal-state btor15)))
           (btor968 (signal (bvnot (signal-value btor967)) (list)))
           (btor969
            (if (bitvector->bool (signal-value btor968)) btor24 btor966))
           (btor970
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor194)))
             (list)))
           (btor971
            (if (bitvector->bool (signal-value btor970)) btor95 btor969))
           (btor972
            (bv->signal
             (zero-extend (signal-value btor197) (bitvector 5))
             btor197))
           (btor973
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor972)))
             (list)))
           (btor974
            (if (bitvector->bool (signal-value btor973)) btor27 btor971))
           (btor975
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state975)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state975)))
                     ((assoc-has-key? init-hash 'state975)
                      (bv->signal (assoc-ref init-hash 'state975)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor976
            (signal
             (bvor (signal-value btor974) (signal-value btor975))
             (list)))
           (btor977
            (if (bitvector->bool (signal-value btor976)) btor95 btor960))
           (btor978
            (if (bitvector->bool (signal-value btor953)) btor14 btor977))
           (btor979
            (if (bitvector->bool (signal-value btor913)) btor978 btor937))
           (btor980
            (bv->signal
             (zero-extend (signal-value btor979) (bitvector 1))
             btor979))
           (btor981
            (bv->signal
             (zero-extend (signal-value btor937) (bitvector 1))
             btor937))
           (btor982
            (bv->signal
             (zero-extend (signal-value btor979) (bitvector 1))
             btor979))
           (btor983
            (bv->signal
             (zero-extend (signal-value btor977) (bitvector 1))
             btor977))
           (btor984
            (bv->signal
             (zero-extend (signal-value btor978) (bitvector 1))
             btor978))
           (btor985
            (bv->signal
             (zero-extend (signal-value btor917) (bitvector 1))
             btor917))
           (btor986
            (bv->signal
             (zero-extend (signal-value btor934) (bitvector 1))
             btor934))
           (btor987
            (if (bitvector->bool (signal-value btor905)) btor52 btor100))
           (btor988
            (if (bitvector->bool (signal-value btor908)) btor51 btor987))
           (btor989
            (if (bitvector->bool (signal-value btor911)) btor50 btor988))
           (btor990
            (if (bitvector->bool (signal-value btor913)) btor100 btor989))
           (btor991
            (if (bitvector->bool (signal-value btor916)) btor49 btor990))
           (btor992
            (bv->signal
             (zero-extend (signal-value btor991) (bitvector 1))
             btor991))
           (btor993
            (bv->signal
             (zero-extend (signal-value btor957) (bitvector 1))
             btor957))
           (btor994
            (bv->signal
             (zero-extend (signal-value btor974) (bitvector 1))
             btor974))
           (btor995
            (if (bitvector->bool (signal-value btor945)) btor52 btor100))
           (btor996
            (if (bitvector->bool (signal-value btor948)) btor51 btor995))
           (btor997
            (if (bitvector->bool (signal-value btor951)) btor50 btor996))
           (btor998
            (if (bitvector->bool (signal-value btor953)) btor100 btor997))
           (btor999
            (if (bitvector->bool (signal-value btor956)) btor49 btor998))
           (btor1000
            (bv->signal
             (zero-extend (signal-value btor999) (bitvector 1))
             btor999))
           (btor1001
            (bv->signal
             (zero-extend (signal-value btor978) (bitvector 1))
             btor978))
           (btor1003
            (if (bitvector->bool (signal-value btor496)) btor95 btor283))
           (btor1004
            (if (bitvector->bool (signal-value btor716)) btor1003 btor127))
           (btor1005
            (if (bitvector->bool (signal-value btor710)) btor95 btor1004))
           (btor1009
            (if (bitvector->bool (signal-value btor716)) btor669 btor137))
           (btor1010
            (if (bitvector->bool (signal-value btor710)) btor95 btor1009))
           (btor1014 unnamed-input-1014)
           (btor1015
            (if (bitvector->bool (signal-value btor979)) btor891 btor726))
           (btor1016 unnamed-input-1016)
           (btor1017
            (if (bitvector->bool (signal-value btor643)) btor624 btor683))
           (btor1018
            (if (bitvector->bool (signal-value btor716)) btor1017 btor1016))
           (btor1019 unnamed-input-1019)
           (btor1020
            (if (bitvector->bool (signal-value btor710)) btor1019 btor1018))
           (btor1021
            (signal
             (bool->bitvector
              (bvuge (signal-value btor1015) (signal-value btor1020)))
             (list)))
           (btor1022
            (if (bitvector->bool (signal-value btor1021)) btor100 btor95))
           (btor1023
            (if (bitvector->bool (signal-value btor979)) btor150 btor726))
           (btor1024
            (signal
             (bool->bitvector
              (bvuge (signal-value btor1023) (signal-value btor1020)))
             (list)))
           (btor1025
            (if (bitvector->bool (signal-value btor1024)) btor100 btor95))
           (btor1026 (signal (bvnot (signal-value btor496)) (list)))
           (btor1027 (signal (bvnot (signal-value btor494)) (list)))
           (btor1028
            (signal
             (bvand (signal-value btor1026) (signal-value btor1027))
             (list)))
           (btor1029
            (if (bitvector->bool (signal-value btor1028)) btor1025 btor1022))
           (btor1030 (bitvector 37))
           (btor1031
            (bv->signal
             (zero-extend (signal-value btor1015) (bitvector 37))
             btor1015))
           (btor1032
            (bv->signal
             (zero-extend (signal-value btor1020) (bitvector 37))
             btor1020))
           (btor1033
            (signal
             (bvadd (signal-value btor1031) (signal-value btor1032))
             (list)))
           (btor1034
            (bv->signal
             (zero-extend (signal-value btor1023) (bitvector 37))
             btor1023))
           (btor1035
            (bv->signal
             (zero-extend (signal-value btor1020) (bitvector 37))
             btor1020))
           (btor1036
            (signal
             (bvadd (signal-value btor1034) (signal-value btor1035))
             (list)))
           (btor1037
            (if (bitvector->bool (signal-value btor1028)) btor1036 btor1033))
           (btor1038
            (signal
             (extract 36 36 (signal-value btor1037))
             (signal-state btor1037)))
           (btor1039
            (if (bitvector->bool (signal-value btor450)) btor1038 btor1029))
           (btor1040
            (if (bitvector->bool (signal-value btor716)) btor1039 btor1014))
           (btor1041 unnamed-input-1041)
           (btor1042
            (if (bitvector->bool (signal-value btor710)) btor1041 btor1040))
           (btor1043 (signal (bvnot (signal-value btor1042)) (list)))
           (btor1044
            (if (bitvector->bool (signal-value btor450)) btor1042 btor1043))
           (btor1045
            (signal
             (extract 35 35 (signal-value btor1020))
             (signal-state btor1020)))
           (btor1046
            (signal
             (extract 35 35 (signal-value btor726))
             (signal-state btor726)))
           (btor1047
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor1045)
              (signal-value btor1046))
             (list)))
           (btor1048 (signal (bvnot (signal-value btor450)) (list)))
           (btor1049
            (signal
             (bvxor (signal-value btor1047) (signal-value btor1048))
             (list)))
           (btor1050 unnamed-input-1050)
           (btor1051
            (signal
             (bvsub (signal-value btor1015) (signal-value btor1020))
             (list)))
           (btor1052
            (signal
             (bvsub (signal-value btor1023) (signal-value btor1020))
             (list)))
           (btor1053
            (if (bitvector->bool (signal-value btor1028)) btor1052 btor1051))
           (btor1054
            (signal
             (extract 35 0 (signal-value btor1037))
             (signal-state btor1037)))
           (btor1055
            (if (bitvector->bool (signal-value btor450)) btor1054 btor1053))
           (btor1056
            (if (bitvector->bool (signal-value btor716)) btor1055 btor1050))
           (btor1057 unnamed-input-1057)
           (btor1058
            (if (bitvector->bool (signal-value btor710)) btor1057 btor1056))
           (btor1059
            (signal
             (extract 35 35 (signal-value btor1058))
             (signal-state btor1058)))
           (btor1060
            (signal
             (bvxor (signal-value btor1046) (signal-value btor1059))
             (list)))
           (btor1061
            (signal
             (bvand (signal-value btor1049) (signal-value btor1060))
             (list)))
           (btor1062
            (signal
             (extract 35 35 (signal-value btor891))
             (signal-state btor891)))
           (btor1063
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor1045)
              (signal-value btor1062))
             (list)))
           (btor1064
            (signal
             (bvxor (signal-value btor1063) (signal-value btor1048))
             (list)))
           (btor1065
            (signal
             (bvxor (signal-value btor1062) (signal-value btor1059))
             (list)))
           (btor1066
            (signal
             (bvand (signal-value btor1064) (signal-value btor1065))
             (list)))
           (btor1067
            (if (bitvector->bool (signal-value btor979)) btor1066 btor1061))
           (btor1068 unnamed-input-1068)
           (btor1069
            (signal
             (bvor (signal-value btor770) (signal-value btor827))
             (list)))
           (btor1070
            (if (bitvector->bool (signal-value btor716)) btor1069 btor1068))
           (btor1071 unnamed-input-1071)
           (btor1072
            (if (bitvector->bool (signal-value btor710)) btor1071 btor1070))
           (btor1073
            (signal
             (apply bvor (bitvector->bits (signal-value btor1020)))
             (signal-state btor1020)))
           (btor1074
            (signal
             (bvand (signal-value btor1072) (signal-value btor1073))
             (list)))
           (btor1075
            (if (bitvector->bool (signal-value btor1074)) btor1067 btor1044))
           (btor1076
            (if (bitvector->bool (signal-value btor716)) btor1075 btor147))
           (btor1077
            (if (bitvector->bool (signal-value btor710)) btor95 btor1076))
           (btor1081
            (if (bitvector->bool (signal-value btor496)) btor1058 btor273))
           (btor1082
            (if (bitvector->bool (signal-value btor496)) btor1081 btor1058))
           (btor1083
            (if (bitvector->bool (signal-value btor716)) btor1082 btor159))
           (btor1084
            (if (bitvector->bool (signal-value btor710)) btor150 btor1083))
           (btor1088
            (if (bitvector->bool (signal-value btor93)) btor81 btor43))
           (btor1089 (bv->signal (bv 26 (bitvector 5))))
           (btor1090
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor1089)))
             (list)))
           (btor1091
            (if (bitvector->bool (signal-value btor1090)) btor1088 btor203))
           (btor1092
            (if (bitvector->bool (signal-value btor205)) btor81 btor1091))
           (btor1093
            (if (bitvector->bool (signal-value btor210)) btor43 btor1092))
           (btor1094
            (if (bitvector->bool (signal-value btor484)) btor1093 btor203))
           (btor1099
            (if (bitvector->bool (signal-value btor94)) btor82 btor44))
           (btor1100
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor1089)))
             (list)))
           (btor1101
            (if (bitvector->bool (signal-value btor1100)) btor1099 btor253))
           (btor1102
            (if (bitvector->bool (signal-value btor255)) btor82 btor1101))
           (btor1103
            (if (bitvector->bool (signal-value btor260)) btor44 btor1102))
           (btor1104
            (if (bitvector->bool (signal-value btor492)) btor1103 btor253))
           (btor1109
            (if (bitvector->bool (signal-value btor716)) btor1081 btor273))
           (btor1110
            (if (bitvector->bool (signal-value btor710)) btor150 btor1109))
           (btor1114
            (if (bitvector->bool (signal-value btor716)) btor1003 btor283))
           (btor1115
            (if (bitvector->bool (signal-value btor710)) btor95 btor1114))
           (btor1119
            (if (bitvector->bool (signal-value btor461)) btor438 btor397))
           (btor1124
            (if (bitvector->bool (signal-value btor471)) btor28 btor437))
           (btor1129
            (if (bitvector->bool (signal-value btor783)) btor91 btor544))
           (btor1134
            (if (bitvector->bool (signal-value btor840)) btor92 btor603))
           (btor1139
            (if (bitvector->bool (signal-value btor692)) btor95 btor667))
           (btor1144
            (if (bitvector->bool (signal-value btor692)) btor624 btor683))
           (btor1149
            (if (bitvector->bool (signal-value btor716)) btor1082 btor726))
           (btor1150
            (if (bitvector->bool (signal-value btor710)) btor150 btor1149))
           (btor1154
            (if (bitvector->bool (signal-value btor848)) btor545 btor767))
           (btor1159
            (if (bitvector->bool (signal-value btor856)) btor604 btor824))
           (btor1164
            (if (bitvector->bool (signal-value btor356)) btor19 btor871))
           (btor1169
            (if (bitvector->bool (signal-value btor320)) btor872 btor885))
           (btor1174
            (if (bitvector->bool (signal-value btor991)) btor978 btor937))
           (btor1179
            (if (bitvector->bool (signal-value btor999)) btor14 btor977)))
      (list
       (cons
        'scanouta
        (signal
         (signal-value btor212)
         (append
          (list (cons 'state975 (signal-value btor974)))
          (append
           (list (cons 'state942 (signal-value btor957)))
           (append
            (list (cons 'state940 (signal-value btor1179)))
            (append
             (list (cons 'state938 (signal-value btor977)))
             (append
              (list (cons 'state935 (signal-value btor934)))
              (append
               (list (cons 'state902 (signal-value btor917)))
               (append
                (list (cons 'state900 (signal-value btor1174)))
                (append
                 (list (cons 'state898 (signal-value btor937)))
                 (append
                  (list (cons 'state883 (signal-value btor314)))
                  (append
                   (list (cons 'state878 (signal-value btor299)))
                   (append
                    (list (cons 'state876 (signal-value btor1169)))
                    (append
                     (list (cons 'state874 (signal-value btor885)))
                     (append
                      (list (cons 'state869 (signal-value btor350)))
                      (append
                       (list (cons 'state864 (signal-value btor335)))
                       (append
                        (list (cons 'state862 (signal-value btor1164)))
                        (append
                         (list (cons 'state860 (signal-value btor871)))
                         (append
                          (list (cons 'state822 (signal-value btor821)))
                          (append
                           (list (cons 'state789 (signal-value btor804)))
                           (append
                            (list (cons 'state787 (signal-value btor1159)))
                            (append
                             (list (cons 'state785 (signal-value btor824)))
                             (append
                              (list (cons 'state765 (signal-value btor764)))
                              (append
                               (list (cons 'state732 (signal-value btor747)))
                               (append
                                (list (cons 'state730 (signal-value btor1154)))
                                (append
                                 (list (cons 'state728 (signal-value btor767)))
                                 (append
                                  (list
                                   (cons 'state722 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state720 (signal-value btor1150)))
                                   (append
                                    (list
                                     (cons 'state718 (signal-value btor726)))
                                    (append
                                     (list
                                      (cons 'state681 (signal-value btor664)))
                                     (append
                                      (list
                                       (cons 'state676 (signal-value btor647)))
                                      (append
                                       (list
                                        (cons
                                         'state674
                                         (signal-value btor1144)))
                                       (append
                                        (list
                                         (cons
                                          'state672
                                          (signal-value btor683)))
                                        (append
                                         (list
                                          (cons
                                           'state665
                                           (signal-value btor664)))
                                         (append
                                          (list
                                           (cons
                                            'state632
                                            (signal-value btor647)))
                                          (append
                                           (list
                                            (cons
                                             'state630
                                             (signal-value btor1139)))
                                           (append
                                            (list
                                             (cons
                                              'state628
                                              (signal-value btor667)))
                                            (append
                                             (list
                                              (cons
                                               'state601
                                               (signal-value btor600)))
                                             (append
                                              (list
                                               (cons
                                                'state568
                                                (signal-value btor583)))
                                              (append
                                               (list
                                                (cons
                                                 'state566
                                                 (signal-value btor1134)))
                                               (append
                                                (list
                                                 (cons
                                                  'state564
                                                  (signal-value btor603)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state542
                                                   (signal-value btor541)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state509
                                                    (signal-value btor524)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state507
                                                     (signal-value btor1129)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state505
                                                      (signal-value btor544)))
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
                                                          btor1124)))
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
                                                              btor1119)))
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
                                                                 btor1115)))
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
                                                                    btor1110)))
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
                                                                        btor1104)))
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
                                                                            btor1094)))
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
                                                                               btor1084)))
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
                                                                                  btor1077)))
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
                                                                                     btor1010)))
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
                                                                                        btor1005)))
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
          (list (cons 'state975 (signal-value btor974)))
          (append
           (list (cons 'state942 (signal-value btor957)))
           (append
            (list (cons 'state940 (signal-value btor1179)))
            (append
             (list (cons 'state938 (signal-value btor977)))
             (append
              (list (cons 'state935 (signal-value btor934)))
              (append
               (list (cons 'state902 (signal-value btor917)))
               (append
                (list (cons 'state900 (signal-value btor1174)))
                (append
                 (list (cons 'state898 (signal-value btor937)))
                 (append
                  (list (cons 'state883 (signal-value btor314)))
                  (append
                   (list (cons 'state878 (signal-value btor299)))
                   (append
                    (list (cons 'state876 (signal-value btor1169)))
                    (append
                     (list (cons 'state874 (signal-value btor885)))
                     (append
                      (list (cons 'state869 (signal-value btor350)))
                      (append
                       (list (cons 'state864 (signal-value btor335)))
                       (append
                        (list (cons 'state862 (signal-value btor1164)))
                        (append
                         (list (cons 'state860 (signal-value btor871)))
                         (append
                          (list (cons 'state822 (signal-value btor821)))
                          (append
                           (list (cons 'state789 (signal-value btor804)))
                           (append
                            (list (cons 'state787 (signal-value btor1159)))
                            (append
                             (list (cons 'state785 (signal-value btor824)))
                             (append
                              (list (cons 'state765 (signal-value btor764)))
                              (append
                               (list (cons 'state732 (signal-value btor747)))
                               (append
                                (list (cons 'state730 (signal-value btor1154)))
                                (append
                                 (list (cons 'state728 (signal-value btor767)))
                                 (append
                                  (list
                                   (cons 'state722 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state720 (signal-value btor1150)))
                                   (append
                                    (list
                                     (cons 'state718 (signal-value btor726)))
                                    (append
                                     (list
                                      (cons 'state681 (signal-value btor664)))
                                     (append
                                      (list
                                       (cons 'state676 (signal-value btor647)))
                                      (append
                                       (list
                                        (cons
                                         'state674
                                         (signal-value btor1144)))
                                       (append
                                        (list
                                         (cons
                                          'state672
                                          (signal-value btor683)))
                                        (append
                                         (list
                                          (cons
                                           'state665
                                           (signal-value btor664)))
                                         (append
                                          (list
                                           (cons
                                            'state632
                                            (signal-value btor647)))
                                          (append
                                           (list
                                            (cons
                                             'state630
                                             (signal-value btor1139)))
                                           (append
                                            (list
                                             (cons
                                              'state628
                                              (signal-value btor667)))
                                            (append
                                             (list
                                              (cons
                                               'state601
                                               (signal-value btor600)))
                                             (append
                                              (list
                                               (cons
                                                'state568
                                                (signal-value btor583)))
                                              (append
                                               (list
                                                (cons
                                                 'state566
                                                 (signal-value btor1134)))
                                               (append
                                                (list
                                                 (cons
                                                  'state564
                                                  (signal-value btor603)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state542
                                                   (signal-value btor541)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state509
                                                    (signal-value btor524)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state507
                                                     (signal-value btor1129)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state505
                                                      (signal-value btor544)))
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
                                                          btor1124)))
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
                                                              btor1119)))
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
                                                                 btor1115)))
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
                                                                    btor1110)))
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
                                                                        btor1104)))
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
                                                                            btor1094)))
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
                                                                               btor1084)))
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
                                                                                  btor1077)))
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
                                                                                     btor1010)))
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
                                                                                        btor1005)))
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
          (list (cons 'state975 (signal-value btor974)))
          (append
           (list (cons 'state942 (signal-value btor957)))
           (append
            (list (cons 'state940 (signal-value btor1179)))
            (append
             (list (cons 'state938 (signal-value btor977)))
             (append
              (list (cons 'state935 (signal-value btor934)))
              (append
               (list (cons 'state902 (signal-value btor917)))
               (append
                (list (cons 'state900 (signal-value btor1174)))
                (append
                 (list (cons 'state898 (signal-value btor937)))
                 (append
                  (list (cons 'state883 (signal-value btor314)))
                  (append
                   (list (cons 'state878 (signal-value btor299)))
                   (append
                    (list (cons 'state876 (signal-value btor1169)))
                    (append
                     (list (cons 'state874 (signal-value btor885)))
                     (append
                      (list (cons 'state869 (signal-value btor350)))
                      (append
                       (list (cons 'state864 (signal-value btor335)))
                       (append
                        (list (cons 'state862 (signal-value btor1164)))
                        (append
                         (list (cons 'state860 (signal-value btor871)))
                         (append
                          (list (cons 'state822 (signal-value btor821)))
                          (append
                           (list (cons 'state789 (signal-value btor804)))
                           (append
                            (list (cons 'state787 (signal-value btor1159)))
                            (append
                             (list (cons 'state785 (signal-value btor824)))
                             (append
                              (list (cons 'state765 (signal-value btor764)))
                              (append
                               (list (cons 'state732 (signal-value btor747)))
                               (append
                                (list (cons 'state730 (signal-value btor1154)))
                                (append
                                 (list (cons 'state728 (signal-value btor767)))
                                 (append
                                  (list
                                   (cons 'state722 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state720 (signal-value btor1150)))
                                   (append
                                    (list
                                     (cons 'state718 (signal-value btor726)))
                                    (append
                                     (list
                                      (cons 'state681 (signal-value btor664)))
                                     (append
                                      (list
                                       (cons 'state676 (signal-value btor647)))
                                      (append
                                       (list
                                        (cons
                                         'state674
                                         (signal-value btor1144)))
                                       (append
                                        (list
                                         (cons
                                          'state672
                                          (signal-value btor683)))
                                        (append
                                         (list
                                          (cons
                                           'state665
                                           (signal-value btor664)))
                                         (append
                                          (list
                                           (cons
                                            'state632
                                            (signal-value btor647)))
                                          (append
                                           (list
                                            (cons
                                             'state630
                                             (signal-value btor1139)))
                                           (append
                                            (list
                                             (cons
                                              'state628
                                              (signal-value btor667)))
                                            (append
                                             (list
                                              (cons
                                               'state601
                                               (signal-value btor600)))
                                             (append
                                              (list
                                               (cons
                                                'state568
                                                (signal-value btor583)))
                                              (append
                                               (list
                                                (cons
                                                 'state566
                                                 (signal-value btor1134)))
                                               (append
                                                (list
                                                 (cons
                                                  'state564
                                                  (signal-value btor603)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state542
                                                   (signal-value btor541)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state509
                                                    (signal-value btor524)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state507
                                                     (signal-value btor1129)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state505
                                                      (signal-value btor544)))
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
                                                          btor1124)))
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
                                                              btor1119)))
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
                                                                 btor1115)))
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
                                                                    btor1110)))
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
                                                                        btor1104)))
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
                                                                            btor1094)))
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
                                                                               btor1084)))
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
                                                                                  btor1077)))
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
                                                                                     btor1010)))
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
                                                                                        btor1005)))
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
          (list (cons 'state975 (signal-value btor974)))
          (append
           (list (cons 'state942 (signal-value btor957)))
           (append
            (list (cons 'state940 (signal-value btor1179)))
            (append
             (list (cons 'state938 (signal-value btor977)))
             (append
              (list (cons 'state935 (signal-value btor934)))
              (append
               (list (cons 'state902 (signal-value btor917)))
               (append
                (list (cons 'state900 (signal-value btor1174)))
                (append
                 (list (cons 'state898 (signal-value btor937)))
                 (append
                  (list (cons 'state883 (signal-value btor314)))
                  (append
                   (list (cons 'state878 (signal-value btor299)))
                   (append
                    (list (cons 'state876 (signal-value btor1169)))
                    (append
                     (list (cons 'state874 (signal-value btor885)))
                     (append
                      (list (cons 'state869 (signal-value btor350)))
                      (append
                       (list (cons 'state864 (signal-value btor335)))
                       (append
                        (list (cons 'state862 (signal-value btor1164)))
                        (append
                         (list (cons 'state860 (signal-value btor871)))
                         (append
                          (list (cons 'state822 (signal-value btor821)))
                          (append
                           (list (cons 'state789 (signal-value btor804)))
                           (append
                            (list (cons 'state787 (signal-value btor1159)))
                            (append
                             (list (cons 'state785 (signal-value btor824)))
                             (append
                              (list (cons 'state765 (signal-value btor764)))
                              (append
                               (list (cons 'state732 (signal-value btor747)))
                               (append
                                (list (cons 'state730 (signal-value btor1154)))
                                (append
                                 (list (cons 'state728 (signal-value btor767)))
                                 (append
                                  (list
                                   (cons 'state722 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state720 (signal-value btor1150)))
                                   (append
                                    (list
                                     (cons 'state718 (signal-value btor726)))
                                    (append
                                     (list
                                      (cons 'state681 (signal-value btor664)))
                                     (append
                                      (list
                                       (cons 'state676 (signal-value btor647)))
                                      (append
                                       (list
                                        (cons
                                         'state674
                                         (signal-value btor1144)))
                                       (append
                                        (list
                                         (cons
                                          'state672
                                          (signal-value btor683)))
                                        (append
                                         (list
                                          (cons
                                           'state665
                                           (signal-value btor664)))
                                         (append
                                          (list
                                           (cons
                                            'state632
                                            (signal-value btor647)))
                                          (append
                                           (list
                                            (cons
                                             'state630
                                             (signal-value btor1139)))
                                           (append
                                            (list
                                             (cons
                                              'state628
                                              (signal-value btor667)))
                                            (append
                                             (list
                                              (cons
                                               'state601
                                               (signal-value btor600)))
                                             (append
                                              (list
                                               (cons
                                                'state568
                                                (signal-value btor583)))
                                              (append
                                               (list
                                                (cons
                                                 'state566
                                                 (signal-value btor1134)))
                                               (append
                                                (list
                                                 (cons
                                                  'state564
                                                  (signal-value btor603)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state542
                                                   (signal-value btor541)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state509
                                                    (signal-value btor524)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state507
                                                     (signal-value btor1129)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state505
                                                      (signal-value btor544)))
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
                                                          btor1124)))
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
                                                              btor1119)))
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
                                                                 btor1115)))
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
                                                                    btor1110)))
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
                                                                        btor1104)))
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
                                                                            btor1094)))
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
                                                                               btor1084)))
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
                                                                                  btor1077)))
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
                                                                                     btor1010)))
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
                                                                                        btor1005)))
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
          (list (cons 'state975 (signal-value btor974)))
          (append
           (list (cons 'state942 (signal-value btor957)))
           (append
            (list (cons 'state940 (signal-value btor1179)))
            (append
             (list (cons 'state938 (signal-value btor977)))
             (append
              (list (cons 'state935 (signal-value btor934)))
              (append
               (list (cons 'state902 (signal-value btor917)))
               (append
                (list (cons 'state900 (signal-value btor1174)))
                (append
                 (list (cons 'state898 (signal-value btor937)))
                 (append
                  (list (cons 'state883 (signal-value btor314)))
                  (append
                   (list (cons 'state878 (signal-value btor299)))
                   (append
                    (list (cons 'state876 (signal-value btor1169)))
                    (append
                     (list (cons 'state874 (signal-value btor885)))
                     (append
                      (list (cons 'state869 (signal-value btor350)))
                      (append
                       (list (cons 'state864 (signal-value btor335)))
                       (append
                        (list (cons 'state862 (signal-value btor1164)))
                        (append
                         (list (cons 'state860 (signal-value btor871)))
                         (append
                          (list (cons 'state822 (signal-value btor821)))
                          (append
                           (list (cons 'state789 (signal-value btor804)))
                           (append
                            (list (cons 'state787 (signal-value btor1159)))
                            (append
                             (list (cons 'state785 (signal-value btor824)))
                             (append
                              (list (cons 'state765 (signal-value btor764)))
                              (append
                               (list (cons 'state732 (signal-value btor747)))
                               (append
                                (list (cons 'state730 (signal-value btor1154)))
                                (append
                                 (list (cons 'state728 (signal-value btor767)))
                                 (append
                                  (list
                                   (cons 'state722 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state720 (signal-value btor1150)))
                                   (append
                                    (list
                                     (cons 'state718 (signal-value btor726)))
                                    (append
                                     (list
                                      (cons 'state681 (signal-value btor664)))
                                     (append
                                      (list
                                       (cons 'state676 (signal-value btor647)))
                                      (append
                                       (list
                                        (cons
                                         'state674
                                         (signal-value btor1144)))
                                       (append
                                        (list
                                         (cons
                                          'state672
                                          (signal-value btor683)))
                                        (append
                                         (list
                                          (cons
                                           'state665
                                           (signal-value btor664)))
                                         (append
                                          (list
                                           (cons
                                            'state632
                                            (signal-value btor647)))
                                          (append
                                           (list
                                            (cons
                                             'state630
                                             (signal-value btor1139)))
                                           (append
                                            (list
                                             (cons
                                              'state628
                                              (signal-value btor667)))
                                            (append
                                             (list
                                              (cons
                                               'state601
                                               (signal-value btor600)))
                                             (append
                                              (list
                                               (cons
                                                'state568
                                                (signal-value btor583)))
                                              (append
                                               (list
                                                (cons
                                                 'state566
                                                 (signal-value btor1134)))
                                               (append
                                                (list
                                                 (cons
                                                  'state564
                                                  (signal-value btor603)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state542
                                                   (signal-value btor541)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state509
                                                    (signal-value btor524)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state507
                                                     (signal-value btor1129)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state505
                                                      (signal-value btor544)))
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
                                                          btor1124)))
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
                                                              btor1119)))
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
                                                                 btor1115)))
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
                                                                    btor1110)))
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
                                                                        btor1104)))
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
                                                                            btor1094)))
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
                                                                               btor1084)))
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
                                                                                  btor1077)))
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
                                                                                     btor1010)))
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
                                                                                        btor1005)))
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
          (list (cons 'state975 (signal-value btor974)))
          (append
           (list (cons 'state942 (signal-value btor957)))
           (append
            (list (cons 'state940 (signal-value btor1179)))
            (append
             (list (cons 'state938 (signal-value btor977)))
             (append
              (list (cons 'state935 (signal-value btor934)))
              (append
               (list (cons 'state902 (signal-value btor917)))
               (append
                (list (cons 'state900 (signal-value btor1174)))
                (append
                 (list (cons 'state898 (signal-value btor937)))
                 (append
                  (list (cons 'state883 (signal-value btor314)))
                  (append
                   (list (cons 'state878 (signal-value btor299)))
                   (append
                    (list (cons 'state876 (signal-value btor1169)))
                    (append
                     (list (cons 'state874 (signal-value btor885)))
                     (append
                      (list (cons 'state869 (signal-value btor350)))
                      (append
                       (list (cons 'state864 (signal-value btor335)))
                       (append
                        (list (cons 'state862 (signal-value btor1164)))
                        (append
                         (list (cons 'state860 (signal-value btor871)))
                         (append
                          (list (cons 'state822 (signal-value btor821)))
                          (append
                           (list (cons 'state789 (signal-value btor804)))
                           (append
                            (list (cons 'state787 (signal-value btor1159)))
                            (append
                             (list (cons 'state785 (signal-value btor824)))
                             (append
                              (list (cons 'state765 (signal-value btor764)))
                              (append
                               (list (cons 'state732 (signal-value btor747)))
                               (append
                                (list (cons 'state730 (signal-value btor1154)))
                                (append
                                 (list (cons 'state728 (signal-value btor767)))
                                 (append
                                  (list
                                   (cons 'state722 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state720 (signal-value btor1150)))
                                   (append
                                    (list
                                     (cons 'state718 (signal-value btor726)))
                                    (append
                                     (list
                                      (cons 'state681 (signal-value btor664)))
                                     (append
                                      (list
                                       (cons 'state676 (signal-value btor647)))
                                      (append
                                       (list
                                        (cons
                                         'state674
                                         (signal-value btor1144)))
                                       (append
                                        (list
                                         (cons
                                          'state672
                                          (signal-value btor683)))
                                        (append
                                         (list
                                          (cons
                                           'state665
                                           (signal-value btor664)))
                                         (append
                                          (list
                                           (cons
                                            'state632
                                            (signal-value btor647)))
                                          (append
                                           (list
                                            (cons
                                             'state630
                                             (signal-value btor1139)))
                                           (append
                                            (list
                                             (cons
                                              'state628
                                              (signal-value btor667)))
                                            (append
                                             (list
                                              (cons
                                               'state601
                                               (signal-value btor600)))
                                             (append
                                              (list
                                               (cons
                                                'state568
                                                (signal-value btor583)))
                                              (append
                                               (list
                                                (cons
                                                 'state566
                                                 (signal-value btor1134)))
                                               (append
                                                (list
                                                 (cons
                                                  'state564
                                                  (signal-value btor603)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state542
                                                   (signal-value btor541)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state509
                                                    (signal-value btor524)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state507
                                                     (signal-value btor1129)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state505
                                                      (signal-value btor544)))
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
                                                          btor1124)))
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
                                                              btor1119)))
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
                                                                 btor1115)))
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
                                                                    btor1110)))
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
                                                                        btor1104)))
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
                                                                            btor1094)))
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
                                                                               btor1084)))
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
                                                                                  btor1077)))
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
                                                                                     btor1010)))
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
                                                                                        btor1005)))
                                                                                     (append
                                                                                      (list
                                                                                       (cons
                                                                                        'state96
                                                                                        (signal-value
                                                                                         btor127)))
                                                                                      (list))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

