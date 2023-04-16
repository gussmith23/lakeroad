;;; Imported with
;;;
;;; $LAKEROAD_DIR/bin/verilog_to_racket.py \
;;;   --infile ~/lakeroad-private/altera_mf/altera_mf_modified.v \
;;;   --top altmult_accum \
;;;   --parameter width_a=18 \
;;;   --parameter width_b=18 \
;;;   --parameter width_result=18 \
;;;   --function-name intel-altmult-accum
;;;
;;; Using the version of the file at
;;; https://github.com/uwsampl/lakeroad-private/blob/6e42ec036244726011879f8b98d6f25c85619596/altera_mf/altera_mf_modified.v
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
      #:unnamed-input-622
      (unnamed-input-622
       (bv->signal (constant 'unnamed-input-622 (bitvector 36))))
      #:unnamed-input-1115
      (unnamed-input-1115
       (bv->signal (constant 'unnamed-input-1115 (bitvector 1))))
      #:unnamed-input-1117
      (unnamed-input-1117
       (bv->signal (constant 'unnamed-input-1117 (bitvector 35))))
      #:unnamed-input-1122
      (unnamed-input-1122
       (bv->signal (constant 'unnamed-input-1122 (bitvector 35))))
      #:unnamed-input-1143
      (unnamed-input-1143
       (bv->signal (constant 'unnamed-input-1143 (bitvector 1))))
      #:unnamed-input-1147
      (unnamed-input-1147
       (bv->signal (constant 'unnamed-input-1147 (bitvector 1))))
      #:unnamed-input-1152
      (unnamed-input-1152
       (bv->signal (constant 'unnamed-input-1152 (bitvector 35))))
      #:unnamed-input-1159
      (unnamed-input-1159
       (bv->signal (constant 'unnamed-input-1159 (bitvector 35))))
      #:unnamed-input-1164
      (unnamed-input-1164
       (bv->signal (constant 'unnamed-input-1164 (bitvector 1))))
      #:unnamed-input-1171
      (unnamed-input-1171
       (bv->signal (constant 'unnamed-input-1171 (bitvector 1))))
      #:unnamed-input-1173
      (unnamed-input-1173
       (bv->signal (constant 'unnamed-input-1173 (bitvector 1)))))
    (let* ((merged-input-state-hash (list))
           (init-hash
            (append
             (list (cons 'state1043 (bv 1 (bitvector 1))))
             (append
              (list (cons 'state1041 (bv 0 (bitvector 1))))
              (append
               (list (cons 'state1039 (bv 0 (bitvector 1))))
               (append
                (list (cons 'state1003 (bv 1 (bitvector 1))))
                (append
                 (list (cons 'state1001 (bv 0 (bitvector 1))))
                 (append
                  (list (cons 'state999 (bv 0 (bitvector 1))))
                  (append
                   (list (cons 'state880 (bv 1 (bitvector 1))))
                   (append
                    (list (cons 'state878 (bv 0 (bitvector 1))))
                    (append
                     (list (cons 'state876 (bv 0 (bitvector 1))))
                     (append
                      (list (cons 'state866 (bv 1 (bitvector 1))))
                      (append
                       (list (cons 'state864 (bv 0 (bitvector 1))))
                       (append
                        (list (cons 'state862 (bv 0 (bitvector 1))))
                        (append
                         (list (cons 'state791 (bv 1 (bitvector 1))))
                         (append
                          (list (cons 'state789 (bv 0 (bitvector 1))))
                          (append
                           (list (cons 'state787 (bv 0 (bitvector 1))))
                           (append
                            (list (cons 'state734 (bv 1 (bitvector 1))))
                            (append
                             (list (cons 'state732 (bv 0 (bitvector 1))))
                             (append
                              (list (cons 'state730 (bv 0 (bitvector 1))))
                              (append
                               (list (cons 'state724 (bv 1 (bitvector 1))))
                               (append
                                (list (cons 'state722 (bv 0 (bitvector 35))))
                                (append
                                 (list (cons 'state720 (bv 0 (bitvector 35))))
                                 (append
                                  (list (cons 'state678 (bv 1 (bitvector 1))))
                                  (append
                                   (list
                                    (cons 'state676 (bv 0 (bitvector 36))))
                                   (append
                                    (list
                                     (cons 'state674 (bv 0 (bitvector 36))))
                                    (append
                                     (list
                                      (cons 'state633 (bv 1 (bitvector 1))))
                                     (append
                                      (list
                                       (cons 'state631 (bv 0 (bitvector 1))))
                                      (append
                                       (list
                                        (cons 'state629 (bv 0 (bitvector 1))))
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
                                                           (bitvector 35))))
                                                        (append
                                                         (list
                                                          (cons
                                                           'state265
                                                           (bv
                                                            0
                                                            (bitvector 35))))
                                                         (append
                                                          (list
                                                           (cons
                                                            'state216
                                                            (bv
                                                             1
                                                             (bitvector 1))))
                                                          (append
                                                           (list
                                                            (cons
                                                             'state214
                                                             (bv
                                                              0
                                                              (bitvector 18))))
                                                           (append
                                                            (list
                                                             (cons
                                                              'state212
                                                              (bv
                                                               0
                                                               (bitvector
                                                                18))))
                                                            (append
                                                             (list
                                                              (cons
                                                               'state164
                                                               (bv
                                                                1
                                                                (bitvector
                                                                 1))))
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
                                                                 'state160
                                                                 (bv
                                                                  0
                                                                  (bitvector
                                                                   18))))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  'state154
                                                                  (bv
                                                                   1
                                                                   (bitvector
                                                                    1))))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   'state152
                                                                   (bv
                                                                    0
                                                                    (bitvector
                                                                     18))))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state150
                                                                    (bv
                                                                     0
                                                                     (bitvector
                                                                      18))))
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
           (btor149 (bv->signal (bv 0 (bitvector 18))))
           (btor150
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state150)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state150)))
                     ((assoc-has-key? init-hash 'state150)
                      (bv->signal (assoc-ref init-hash 'state150)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor152
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state152)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state152)))
                     ((assoc-has-key? init-hash 'state152)
                      (bv->signal (assoc-ref init-hash 'state152)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor154
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state154)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state154)))
                     ((assoc-has-key? init-hash 'state154)
                      (bv->signal (assoc-ref init-hash 'state154)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor156
            (signal
             (concat (signal-value btor122) (signal-value btor154))
             (list)))
           (btor157
            (signal
             (bool->bitvector
              (bveq (signal-value btor156) (signal-value btor125)))
             (list)))
           (btor158
            (if (bitvector->bool (signal-value btor157)) btor152 btor150))
           (btor160
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state160)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state160)))
                     ((assoc-has-key? init-hash 'state160)
                      (bv->signal (assoc-ref init-hash 'state160)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor166
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor167
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor166)))
             (list)))
           (btor168
            (if (bitvector->bool (signal-value btor167)) btor36 btor95))
           (btor169
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor170
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor169)))
             (list)))
           (btor171
            (if (bitvector->bool (signal-value btor170)) btor35 btor168))
           (btor172
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor173
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor172)))
             (list)))
           (btor174
            (if (bitvector->bool (signal-value btor173)) btor34 btor171))
           (btor175
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor116)))
             (list)))
           (btor176
            (if (bitvector->bool (signal-value btor175)) btor95 btor174))
           (btor177
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor178
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor177)))
             (list)))
           (btor179
            (if (bitvector->bool (signal-value btor178)) btor33 btor176))
           (btor180
            (signal
             (concat (signal-value btor179) (signal-value btor164))
             (list)))
           (btor181
            (signal
             (bool->bitvector
              (bveq (signal-value btor180) (signal-value btor125)))
             (list)))
           (btor182
            (if (bitvector->bool (signal-value btor181)) btor162 btor160))
           (btor183
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor184
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor183)))
             (list)))
           (btor185
            (if (bitvector->bool (signal-value btor184)) btor26 btor95))
           (btor186
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor187
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor186)))
             (list)))
           (btor188
            (if (bitvector->bool (signal-value btor187)) btor25 btor185))
           (btor189
            (signal
             (apply bvor (bitvector->bits (signal-value btor53)))
             (signal-state btor53)))
           (btor190 (signal (bvnot (signal-value btor189)) (list)))
           (btor191
            (if (bitvector->bool (signal-value btor190)) btor24 btor188))
           (btor192 (bv->signal (bv 25 (bitvector 5))))
           (btor193
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor192)))
             (list)))
           (btor194
            (if (bitvector->bool (signal-value btor193)) btor95 btor191))
           (btor195 (bv->signal (bv 3 (bitvector 2))))
           (btor196
            (bv->signal
             (zero-extend (signal-value btor195) (bitvector 5))
             btor195))
           (btor197
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor196)))
             (list)))
           (btor198
            (if (bitvector->bool (signal-value btor197)) btor27 btor194))
           (btor199
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state199)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state199)))
                     ((assoc-has-key? init-hash 'state199)
                      (bv->signal (assoc-ref init-hash 'state199)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor200
            (signal
             (bvor (signal-value btor198) (signal-value btor199))
             (list)))
           (btor201
            (if (bitvector->bool (signal-value btor200)) btor149 btor182))
           (btor202 (bv->signal (bv 17 (bitvector 5))))
           (btor203
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor202)))
             (list)))
           (btor204
            (signal
             (bvor (signal-value btor203) (signal-value btor93))
             (list)))
           (btor205
            (if (bitvector->bool (signal-value btor204)) btor81 btor43))
           (btor206 (bv->signal (bv 10 (bitvector 4))))
           (btor207
            (bv->signal
             (zero-extend (signal-value btor206) (bitvector 5))
             btor206))
           (btor208
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor207)))
             (list)))
           (btor209
            (if (bitvector->bool (signal-value btor208)) btor43 btor205))
           (btor210
            (if (bitvector->bool (signal-value btor175)) btor209 btor201))
           (btor212
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state212)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state212)))
                     ((assoc-has-key? init-hash 'state212)
                      (bv->signal (assoc-ref init-hash 'state212)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor218
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor219
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor218)))
             (list)))
           (btor220
            (if (bitvector->bool (signal-value btor219)) btor36 btor95))
           (btor221
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor222
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor221)))
             (list)))
           (btor223
            (if (bitvector->bool (signal-value btor222)) btor35 btor220))
           (btor224
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor225
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor224)))
             (list)))
           (btor226
            (if (bitvector->bool (signal-value btor225)) btor34 btor223))
           (btor227
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor116)))
             (list)))
           (btor228
            (if (bitvector->bool (signal-value btor227)) btor95 btor226))
           (btor229
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor230
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor229)))
             (list)))
           (btor231
            (if (bitvector->bool (signal-value btor230)) btor33 btor228))
           (btor232
            (signal
             (concat (signal-value btor231) (signal-value btor216))
             (list)))
           (btor233
            (signal
             (bool->bitvector
              (bveq (signal-value btor232) (signal-value btor125)))
             (list)))
           (btor234
            (if (bitvector->bool (signal-value btor233)) btor214 btor212))
           (btor235
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor236
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor235)))
             (list)))
           (btor237
            (if (bitvector->bool (signal-value btor236)) btor26 btor95))
           (btor238
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor239
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor238)))
             (list)))
           (btor240
            (if (bitvector->bool (signal-value btor239)) btor25 btor237))
           (btor241
            (signal
             (apply bvor (bitvector->bits (signal-value btor54)))
             (signal-state btor54)))
           (btor242 (signal (bvnot (signal-value btor241)) (list)))
           (btor243
            (if (bitvector->bool (signal-value btor242)) btor24 btor240))
           (btor244
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor192)))
             (list)))
           (btor245
            (if (bitvector->bool (signal-value btor244)) btor95 btor243))
           (btor246
            (bv->signal
             (zero-extend (signal-value btor195) (bitvector 5))
             btor195))
           (btor247
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor246)))
             (list)))
           (btor248
            (if (bitvector->bool (signal-value btor247)) btor27 btor245))
           (btor249
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state249)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state249)))
                     ((assoc-has-key? init-hash 'state249)
                      (bv->signal (assoc-ref init-hash 'state249)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor250
            (signal
             (bvor (signal-value btor248) (signal-value btor249))
             (list)))
           (btor251
            (if (bitvector->bool (signal-value btor250)) btor149 btor234))
           (btor252 (bv->signal (bv 18 (bitvector 5))))
           (btor253
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor252)))
             (list)))
           (btor254
            (signal
             (bvor (signal-value btor253) (signal-value btor94))
             (list)))
           (btor255
            (if (bitvector->bool (signal-value btor254)) btor82 btor44))
           (btor256 (bv->signal (bv 11 (bitvector 4))))
           (btor257
            (bv->signal
             (zero-extend (signal-value btor256) (bitvector 5))
             btor256))
           (btor258
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor257)))
             (list)))
           (btor259
            (if (bitvector->bool (signal-value btor258)) btor44 btor255))
           (btor260
            (if (bitvector->bool (signal-value btor227)) btor259 btor251))
           (btor262
            (bv->signal
             (zero-extend (signal-value btor127) (bitvector 1))
             btor127))
           (btor263 (bitvector 35))
           (btor264 (bv->signal (bv 0 (bitvector 35))))
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
                          (bv 0 35))))))))
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
                          (bv 0 35))))))))
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
             (zero-extend (signal-value btor273) (bitvector 35))
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
              (bveq (signal-value btor21) (signal-value btor192)))
             (list)))
           (btor311
            (if (bitvector->bool (signal-value btor310)) btor95 btor309))
           (btor312
            (bv->signal
             (zero-extend (signal-value btor195) (bitvector 5))
             btor195))
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
              (bveq (signal-value btor20) (signal-value btor192)))
             (list)))
           (btor347
            (if (bitvector->bool (signal-value btor346)) btor95 btor345))
           (btor348
            (bv->signal
             (zero-extend (signal-value btor195) (bitvector 5))
             btor195))
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
              (bveq (signal-value btor30) (signal-value btor192)))
             (list)))
           (btor391
            (if (bitvector->bool (signal-value btor390)) btor95 btor389))
           (btor392
            (bv->signal
             (zero-extend (signal-value btor195) (bitvector 5))
             btor195))
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
              (bveq (signal-value btor29) (signal-value btor192)))
             (list)))
           (btor431
            (if (bitvector->bool (signal-value btor430)) btor95 btor429))
           (btor432
            (bv->signal
             (zero-extend (signal-value btor195) (bitvector 5))
             btor195))
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
             (zero-extend (signal-value btor179) (bitvector 1))
             btor179))
           (btor479
            (bv->signal
             (zero-extend (signal-value btor198) (bitvector 1))
             btor198))
           (btor480
            (if (bitvector->bool (signal-value btor167)) btor52 btor100))
           (btor481
            (if (bitvector->bool (signal-value btor170)) btor51 btor480))
           (btor482
            (if (bitvector->bool (signal-value btor173)) btor50 btor481))
           (btor483
            (if (bitvector->bool (signal-value btor175)) btor100 btor482))
           (btor484
            (if (bitvector->bool (signal-value btor178)) btor49 btor483))
           (btor485
            (bv->signal
             (zero-extend (signal-value btor484) (bitvector 1))
             btor484))
           (btor486
            (bv->signal
             (zero-extend (signal-value btor231) (bitvector 1))
             btor231))
           (btor487
            (bv->signal
             (zero-extend (signal-value btor248) (bitvector 1))
             btor248))
           (btor488
            (if (bitvector->bool (signal-value btor219)) btor52 btor100))
           (btor489
            (if (bitvector->bool (signal-value btor222)) btor51 btor488))
           (btor490
            (if (bitvector->bool (signal-value btor225)) btor50 btor489))
           (btor491
            (if (bitvector->bool (signal-value btor227)) btor100 btor490))
           (btor492
            (if (bitvector->bool (signal-value btor230)) btor49 btor491))
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
           (btor498 (bitvector 21))
           (btor499 (bv->signal (bv 0 (bitvector 21))))
           (btor500
            (bv->signal
             (zero-extend (signal-value btor499) (bitvector 21))
             btor499))
           (btor501 (signal (bvnot (signal-value btor210)) (list)))
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
             (extract 17 17 (signal-value btor210))
             (signal-state btor210)))
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
              (bveq (signal-value btor83) (signal-value btor192)))
             (list)))
           (btor538
            (if (bitvector->bool (signal-value btor537)) btor95 btor536))
           (btor539
            (bv->signal
             (zero-extend (signal-value btor195) (bitvector 5))
             btor195))
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
            (if (bitvector->bool (signal-value btor554)) btor503 btor210))
           (btor556
            (bv->signal
             (zero-extend (signal-value btor555) (bitvector 18))
             btor555))
           (btor557
            (bv->signal
             (zero-extend (signal-value btor201) (bitvector 18))
             btor201))
           (btor558
            (bv->signal
             (zero-extend (signal-value btor209) (bitvector 18))
             btor209))
           (btor559
            (bv->signal
             (zero-extend (signal-value btor210) (bitvector 18))
             btor210))
           (btor560 (signal (bvnot (signal-value btor260)) (list)))
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
             (extract 17 17 (signal-value btor260))
             (signal-state btor260)))
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
              (bveq (signal-value btor84) (signal-value btor192)))
             (list)))
           (btor597
            (if (bitvector->bool (signal-value btor596)) btor95 btor595))
           (btor598
            (bv->signal
             (zero-extend (signal-value btor195) (bitvector 5))
             btor195))
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
            (if (bitvector->bool (signal-value btor612)) btor562 btor260))
           (btor614
            (bv->signal
             (zero-extend (signal-value btor613) (bitvector 18))
             btor613))
           (btor615
            (bv->signal
             (zero-extend (signal-value btor251) (bitvector 18))
             btor251))
           (btor616
            (bv->signal
             (zero-extend (signal-value btor259) (bitvector 18))
             btor259))
           (btor617
            (bv->signal
             (zero-extend (signal-value btor260) (bitvector 18))
             btor260))
           (btor618 (bitvector 36))
           (btor619
            (bv->signal
             (zero-extend (signal-value btor555) (bitvector 36))
             btor555))
           (btor620
            (bv->signal
             (zero-extend (signal-value btor613) (bitvector 36))
             btor613))
           (btor621
            (signal
             (bvmul (signal-value btor619) (signal-value btor620))
             (list)))
           (btor622 unnamed-input-622)
           (btor623
            (signal
             (bvsub (signal-value btor622) (signal-value btor621))
             (list)))
           (btor624
            (signal
             (bvxor (signal-value btor554) (signal-value btor612))
             (list)))
           (btor625
            (if (bitvector->bool (signal-value btor624)) btor623 btor621))
           (btor626
            (bv->signal
             (zero-extend (signal-value btor625) (bitvector 36))
             btor625))
           (btor627
            (bv->signal
             (zero-extend (signal-value btor137) (bitvector 1))
             btor137))
           (btor628
            (bv->signal
             (zero-extend (signal-value btor95) (bitvector 1))
             btor95))
           (btor629
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state629)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state629)))
                     ((assoc-has-key? init-hash 'state629)
                      (bv->signal (assoc-ref init-hash 'state629)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor631
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state631)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state631)))
                     ((assoc-has-key? init-hash 'state631)
                      (bv->signal (assoc-ref init-hash 'state631)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor633
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state633)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state633)))
                     ((assoc-has-key? init-hash 'state633)
                      (bv->signal (assoc-ref init-hash 'state633)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor635
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor636
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor635)))
             (list)))
           (btor637
            (if (bitvector->bool (signal-value btor636)) btor36 btor95))
           (btor638
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor639
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor638)))
             (list)))
           (btor640
            (if (bitvector->bool (signal-value btor639)) btor35 btor637))
           (btor641
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor642
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor641)))
             (list)))
           (btor643
            (if (bitvector->bool (signal-value btor642)) btor34 btor640))
           (btor644
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor116)))
             (list)))
           (btor645
            (if (bitvector->bool (signal-value btor644)) btor95 btor643))
           (btor646
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor647
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor646)))
             (list)))
           (btor648
            (if (bitvector->bool (signal-value btor647)) btor33 btor645))
           (btor649
            (signal
             (concat (signal-value btor648) (signal-value btor633))
             (list)))
           (btor650
            (signal
             (bool->bitvector
              (bveq (signal-value btor649) (signal-value btor125)))
             (list)))
           (btor651
            (if (bitvector->bool (signal-value btor650)) btor631 btor629))
           (btor652
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor653
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor652)))
             (list)))
           (btor654
            (if (bitvector->bool (signal-value btor653)) btor26 btor95))
           (btor655
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor656
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor655)))
             (list)))
           (btor657
            (if (bitvector->bool (signal-value btor656)) btor25 btor654))
           (btor658
            (signal
             (apply bvor (bitvector->bits (signal-value btor70)))
             (signal-state btor70)))
           (btor659 (signal (bvnot (signal-value btor658)) (list)))
           (btor660
            (if (bitvector->bool (signal-value btor659)) btor24 btor657))
           (btor661
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor192)))
             (list)))
           (btor662
            (if (bitvector->bool (signal-value btor661)) btor95 btor660))
           (btor663
            (bv->signal
             (zero-extend (signal-value btor195) (bitvector 5))
             btor195))
           (btor664
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor663)))
             (list)))
           (btor665
            (if (bitvector->bool (signal-value btor664)) btor27 btor662))
           (btor666
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state666)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state666)))
                     ((assoc-has-key? init-hash 'state666)
                      (bv->signal (assoc-ref init-hash 'state666)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor667
            (signal
             (bvor (signal-value btor665) (signal-value btor666))
             (list)))
           (btor668
            (if (bitvector->bool (signal-value btor667)) btor95 btor651))
           (btor669
            (bv->signal
             (zero-extend (signal-value btor668) (bitvector 1))
             btor668))
           (btor670
            (if (bitvector->bool (signal-value btor644)) btor95 btor668))
           (btor671
            (bv->signal
             (zero-extend (signal-value btor670) (bitvector 1))
             btor670))
           (btor672
            (bv->signal
             (zero-extend (signal-value btor625) (bitvector 36))
             btor625))
           (btor673 (bv->signal (bv 0 (bitvector 36))))
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
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor678
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state678)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state678)))
                     ((assoc-has-key? init-hash 'state678)
                      (bv->signal (assoc-ref init-hash 'state678)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor680
            (signal
             (concat (signal-value btor648) (signal-value btor678))
             (list)))
           (btor681
            (signal
             (bool->bitvector
              (bveq (signal-value btor680) (signal-value btor125)))
             (list)))
           (btor682
            (if (bitvector->bool (signal-value btor681)) btor676 btor674))
           (btor683
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state683)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state683)))
                     ((assoc-has-key? init-hash 'state683)
                      (bv->signal (assoc-ref init-hash 'state683)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor684
            (signal
             (bvor (signal-value btor665) (signal-value btor683))
             (list)))
           (btor685
            (if (bitvector->bool (signal-value btor684)) btor673 btor682))
           (btor686
            (bv->signal
             (zero-extend (signal-value btor685) (bitvector 36))
             btor685))
           (btor687
            (bv->signal
             (zero-extend (signal-value btor95) (bitvector 1))
             btor95))
           (btor688
            (bv->signal
             (zero-extend (signal-value btor648) (bitvector 1))
             btor648))
           (btor689
            (bv->signal
             (zero-extend (signal-value btor665) (bitvector 1))
             btor665))
           (btor690
            (if (bitvector->bool (signal-value btor636)) btor52 btor100))
           (btor691
            (if (bitvector->bool (signal-value btor639)) btor51 btor690))
           (btor692
            (if (bitvector->bool (signal-value btor642)) btor50 btor691))
           (btor693
            (if (bitvector->bool (signal-value btor644)) btor100 btor692))
           (btor694
            (if (bitvector->bool (signal-value btor647)) btor49 btor693))
           (btor695
            (bv->signal
             (zero-extend (signal-value btor694) (bitvector 1))
             btor694))
           (btor696
            (bv->signal
             (zero-extend (signal-value btor554) (bitvector 1))
             btor554))
           (btor697
            (bv->signal
             (zero-extend (signal-value btor612) (bitvector 1))
             btor612))
           (btor698
            (bv->signal
             (zero-extend (signal-value btor122) (bitvector 1))
             btor122))
           (btor699
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor700
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor699)))
             (list)))
           (btor701
            (if (bitvector->bool (signal-value btor700)) btor26 btor95))
           (btor702
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor703
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor702)))
             (list)))
           (btor704
            (if (bitvector->bool (signal-value btor703)) btor25 btor701))
           (btor705
            (signal
             (apply bvor (bitvector->bits (signal-value btor72)))
             (signal-state btor72)))
           (btor706 (signal (bvnot (signal-value btor705)) (list)))
           (btor707
            (if (bitvector->bool (signal-value btor706)) btor24 btor704))
           (btor708
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor192)))
             (list)))
           (btor709
            (if (bitvector->bool (signal-value btor708)) btor95 btor707))
           (btor710
            (bv->signal
             (zero-extend (signal-value btor195) (bitvector 5))
             btor195))
           (btor711
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor710)))
             (list)))
           (btor712
            (if (bitvector->bool (signal-value btor711)) btor27 btor709))
           (btor713
            (bv->signal
             (zero-extend (signal-value btor712) (bitvector 1))
             btor712))
           (btor714
            (if (bitvector->bool (signal-value btor106)) btor52 btor100))
           (btor715
            (if (bitvector->bool (signal-value btor110)) btor51 btor714))
           (btor716
            (if (bitvector->bool (signal-value btor114)) btor50 btor715))
           (btor717
            (if (bitvector->bool (signal-value btor117)) btor100 btor716))
           (btor718
            (if (bitvector->bool (signal-value btor121)) btor49 btor717))
           (btor719
            (bv->signal
             (zero-extend (signal-value btor718) (bitvector 1))
             btor718))
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
                          (bv 0 35))))))))
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
                          (bv 0 35))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor724
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state724)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state724)))
                     ((assoc-has-key? init-hash 'state724)
                      (bv->signal (assoc-ref init-hash 'state724)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor726
            (signal
             (concat (signal-value btor122) (signal-value btor724))
             (list)))
           (btor727
            (signal
             (bool->bitvector
              (bveq (signal-value btor726) (signal-value btor125)))
             (list)))
           (btor728
            (if (bitvector->bool (signal-value btor727)) btor722 btor720))
           (btor729
            (bv->signal
             (zero-extend (signal-value btor728) (bitvector 35))
             btor728))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state734)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state734)))
                     ((assoc-has-key? init-hash 'state734)
                      (bv->signal (assoc-ref init-hash 'state734)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor736
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor737
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor736)))
             (list)))
           (btor738
            (if (bitvector->bool (signal-value btor737)) btor36 btor95))
           (btor739
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor740
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor739)))
             (list)))
           (btor741
            (if (bitvector->bool (signal-value btor740)) btor35 btor738))
           (btor742
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor743
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor742)))
             (list)))
           (btor744
            (if (bitvector->bool (signal-value btor743)) btor34 btor741))
           (btor745
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor116)))
             (list)))
           (btor746
            (if (bitvector->bool (signal-value btor745)) btor95 btor744))
           (btor747
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor748
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor747)))
             (list)))
           (btor749
            (if (bitvector->bool (signal-value btor748)) btor33 btor746))
           (btor750
            (signal
             (concat (signal-value btor749) (signal-value btor734))
             (list)))
           (btor751
            (signal
             (bool->bitvector
              (bveq (signal-value btor750) (signal-value btor125)))
             (list)))
           (btor752
            (if (bitvector->bool (signal-value btor751)) btor732 btor730))
           (btor753
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor754
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor753)))
             (list)))
           (btor755
            (if (bitvector->bool (signal-value btor754)) btor26 btor95))
           (btor756
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor757
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor756)))
             (list)))
           (btor758
            (if (bitvector->bool (signal-value btor757)) btor25 btor755))
           (btor759
            (signal
             (apply bvor (bitvector->bits (signal-value btor85)))
             (signal-state btor85)))
           (btor760 (signal (bvnot (signal-value btor759)) (list)))
           (btor761
            (if (bitvector->bool (signal-value btor760)) btor24 btor758))
           (btor762
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor192)))
             (list)))
           (btor763
            (if (bitvector->bool (signal-value btor762)) btor95 btor761))
           (btor764
            (bv->signal
             (zero-extend (signal-value btor195) (bitvector 5))
             btor195))
           (btor765
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor764)))
             (list)))
           (btor766
            (if (bitvector->bool (signal-value btor765)) btor27 btor763))
           (btor767
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state767)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state767)))
                     ((assoc-has-key? init-hash 'state767)
                      (bv->signal (assoc-ref init-hash 'state767)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor768
            (signal
             (bvor (signal-value btor766) (signal-value btor767))
             (list)))
           (btor769
            (if (bitvector->bool (signal-value btor768)) btor95 btor752))
           (btor770
            (if (bitvector->bool (signal-value btor745)) btor545 btor769))
           (btor771
            (if (bitvector->bool (signal-value btor550)) btor548 btor770))
           (btor772
            (if (bitvector->bool (signal-value btor552)) btor770 btor771))
           (btor773
            (bv->signal
             (zero-extend (signal-value btor772) (bitvector 1))
             btor772))
           (btor774
            (bv->signal
             (zero-extend (signal-value btor769) (bitvector 1))
             btor769))
           (btor775
            (bv->signal
             (zero-extend (signal-value btor770) (bitvector 1))
             btor770))
           (btor776
            (bv->signal
             (zero-extend (signal-value btor544) (bitvector 1))
             btor544))
           (btor777
            (bv->signal
             (zero-extend (signal-value btor553) (bitvector 1))
             btor553))
           (btor778
            (bv->signal
             (zero-extend (signal-value btor545) (bitvector 1))
             btor545))
           (btor779
            (bv->signal
             (zero-extend (signal-value btor524) (bitvector 1))
             btor524))
           (btor780
            (bv->signal
             (zero-extend (signal-value btor541) (bitvector 1))
             btor541))
           (btor781
            (if (bitvector->bool (signal-value btor512)) btor52 btor100))
           (btor782
            (if (bitvector->bool (signal-value btor515)) btor51 btor781))
           (btor783
            (if (bitvector->bool (signal-value btor518)) btor50 btor782))
           (btor784
            (if (bitvector->bool (signal-value btor520)) btor100 btor783))
           (btor785
            (if (bitvector->bool (signal-value btor523)) btor49 btor784))
           (btor786
            (bv->signal
             (zero-extend (signal-value btor785) (bitvector 1))
             btor785))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state791)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state791)))
                     ((assoc-has-key? init-hash 'state791)
                      (bv->signal (assoc-ref init-hash 'state791)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor793
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor794
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor793)))
             (list)))
           (btor795
            (if (bitvector->bool (signal-value btor794)) btor36 btor95))
           (btor796
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor797
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor796)))
             (list)))
           (btor798
            (if (bitvector->bool (signal-value btor797)) btor35 btor795))
           (btor799
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor800
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor799)))
             (list)))
           (btor801
            (if (bitvector->bool (signal-value btor800)) btor34 btor798))
           (btor802
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor116)))
             (list)))
           (btor803
            (if (bitvector->bool (signal-value btor802)) btor95 btor801))
           (btor804
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor805
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor804)))
             (list)))
           (btor806
            (if (bitvector->bool (signal-value btor805)) btor33 btor803))
           (btor807
            (signal
             (concat (signal-value btor806) (signal-value btor791))
             (list)))
           (btor808
            (signal
             (bool->bitvector
              (bveq (signal-value btor807) (signal-value btor125)))
             (list)))
           (btor809
            (if (bitvector->bool (signal-value btor808)) btor789 btor787))
           (btor810
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor811
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor810)))
             (list)))
           (btor812
            (if (bitvector->bool (signal-value btor811)) btor26 btor95))
           (btor813
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor814
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor813)))
             (list)))
           (btor815
            (if (bitvector->bool (signal-value btor814)) btor25 btor812))
           (btor816
            (signal
             (apply bvor (bitvector->bits (signal-value btor86)))
             (signal-state btor86)))
           (btor817 (signal (bvnot (signal-value btor816)) (list)))
           (btor818
            (if (bitvector->bool (signal-value btor817)) btor24 btor815))
           (btor819
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor192)))
             (list)))
           (btor820
            (if (bitvector->bool (signal-value btor819)) btor95 btor818))
           (btor821
            (bv->signal
             (zero-extend (signal-value btor195) (bitvector 5))
             btor195))
           (btor822
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor821)))
             (list)))
           (btor823
            (if (bitvector->bool (signal-value btor822)) btor27 btor820))
           (btor824
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state824)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state824)))
                     ((assoc-has-key? init-hash 'state824)
                      (bv->signal (assoc-ref init-hash 'state824)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor825
            (signal
             (bvor (signal-value btor823) (signal-value btor824))
             (list)))
           (btor826
            (if (bitvector->bool (signal-value btor825)) btor95 btor809))
           (btor827
            (if (bitvector->bool (signal-value btor802)) btor604 btor826))
           (btor828
            (if (bitvector->bool (signal-value btor608)) btor606 btor827))
           (btor829
            (if (bitvector->bool (signal-value btor610)) btor827 btor828))
           (btor830
            (bv->signal
             (zero-extend (signal-value btor829) (bitvector 1))
             btor829))
           (btor831
            (bv->signal
             (zero-extend (signal-value btor826) (bitvector 1))
             btor826))
           (btor832
            (bv->signal
             (zero-extend (signal-value btor827) (bitvector 1))
             btor827))
           (btor833
            (bv->signal
             (zero-extend (signal-value btor603) (bitvector 1))
             btor603))
           (btor834
            (bv->signal
             (zero-extend (signal-value btor611) (bitvector 1))
             btor611))
           (btor835
            (bv->signal
             (zero-extend (signal-value btor604) (bitvector 1))
             btor604))
           (btor836
            (bv->signal
             (zero-extend (signal-value btor583) (bitvector 1))
             btor583))
           (btor837
            (bv->signal
             (zero-extend (signal-value btor600) (bitvector 1))
             btor600))
           (btor838
            (if (bitvector->bool (signal-value btor571)) btor52 btor100))
           (btor839
            (if (bitvector->bool (signal-value btor574)) btor51 btor838))
           (btor840
            (if (bitvector->bool (signal-value btor577)) btor50 btor839))
           (btor841
            (if (bitvector->bool (signal-value btor579)) btor100 btor840))
           (btor842
            (if (bitvector->bool (signal-value btor582)) btor49 btor841))
           (btor843
            (bv->signal
             (zero-extend (signal-value btor842) (bitvector 1))
             btor842))
           (btor844
            (bv->signal
             (zero-extend (signal-value btor749) (bitvector 1))
             btor749))
           (btor845
            (bv->signal
             (zero-extend (signal-value btor766) (bitvector 1))
             btor766))
           (btor846
            (if (bitvector->bool (signal-value btor737)) btor52 btor100))
           (btor847
            (if (bitvector->bool (signal-value btor740)) btor51 btor846))
           (btor848
            (if (bitvector->bool (signal-value btor743)) btor50 btor847))
           (btor849
            (if (bitvector->bool (signal-value btor745)) btor100 btor848))
           (btor850
            (if (bitvector->bool (signal-value btor748)) btor49 btor849))
           (btor851
            (bv->signal
             (zero-extend (signal-value btor850) (bitvector 1))
             btor850))
           (btor852
            (bv->signal
             (zero-extend (signal-value btor806) (bitvector 1))
             btor806))
           (btor853
            (bv->signal
             (zero-extend (signal-value btor823) (bitvector 1))
             btor823))
           (btor854
            (if (bitvector->bool (signal-value btor794)) btor52 btor100))
           (btor855
            (if (bitvector->bool (signal-value btor797)) btor51 btor854))
           (btor856
            (if (bitvector->bool (signal-value btor800)) btor50 btor855))
           (btor857
            (if (bitvector->bool (signal-value btor802)) btor100 btor856))
           (btor858
            (if (bitvector->bool (signal-value btor805)) btor49 btor857))
           (btor859
            (bv->signal
             (zero-extend (signal-value btor858) (bitvector 1))
             btor858))
           (btor860
            (bv->signal
             (zero-extend (signal-value btor545) (bitvector 1))
             btor545))
           (btor861
            (bv->signal
             (zero-extend (signal-value btor604) (bitvector 1))
             btor604))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state866)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state866)))
                     ((assoc-has-key? init-hash 'state866)
                      (bv->signal (assoc-ref init-hash 'state866)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor868
            (signal
             (concat (signal-value btor335) (signal-value btor866))
             (list)))
           (btor869
            (signal
             (bool->bitvector
              (bveq (signal-value btor868) (signal-value btor125)))
             (list)))
           (btor870
            (if (bitvector->bool (signal-value btor869)) btor864 btor862))
           (btor871
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state871)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state871)))
                     ((assoc-has-key? init-hash 'state871)
                      (bv->signal (assoc-ref init-hash 'state871)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor872
            (signal
             (bvor (signal-value btor350) (signal-value btor871))
             (list)))
           (btor873
            (if (bitvector->bool (signal-value btor872)) btor95 btor870))
           (btor874
            (if (bitvector->bool (signal-value btor331)) btor19 btor873))
           (btor875
            (bv->signal
             (zero-extend (signal-value btor874) (bitvector 1))
             btor874))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state880)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state880)))
                     ((assoc-has-key? init-hash 'state880)
                      (bv->signal (assoc-ref init-hash 'state880)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor882
            (signal
             (concat (signal-value btor299) (signal-value btor880))
             (list)))
           (btor883
            (signal
             (bool->bitvector
              (bveq (signal-value btor882) (signal-value btor125)))
             (list)))
           (btor884
            (if (bitvector->bool (signal-value btor883)) btor878 btor876))
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
           (btor886
            (signal
             (bvor (signal-value btor314) (signal-value btor885))
             (list)))
           (btor887
            (if (bitvector->bool (signal-value btor886)) btor95 btor884))
           (btor888
            (bv->signal
             (zero-extend (signal-value btor887) (bitvector 1))
             btor887))
           (btor889 (bitvector 17))
           (btor890 (bv->signal (bv 0 (bitvector 17))))
           (btor891
            (signal
             (concat (signal-value btor887) (signal-value btor887))
             (list)))
           (btor892
            (signal
             (concat (signal-value btor887) (signal-value btor891))
             (list)))
           (btor893
            (signal
             (concat (signal-value btor887) (signal-value btor892))
             (list)))
           (btor894
            (signal
             (concat (signal-value btor887) (signal-value btor893))
             (list)))
           (btor895 (bitvector 6))
           (btor896
            (signal
             (concat (signal-value btor887) (signal-value btor894))
             (list)))
           (btor897 (bitvector 7))
           (btor898
            (signal
             (concat (signal-value btor887) (signal-value btor896))
             (list)))
           (btor899 (bitvector 8))
           (btor900
            (signal
             (concat (signal-value btor887) (signal-value btor898))
             (list)))
           (btor901 (bitvector 9))
           (btor902
            (signal
             (concat (signal-value btor887) (signal-value btor900))
             (list)))
           (btor903 (bitvector 10))
           (btor904
            (signal
             (concat (signal-value btor887) (signal-value btor902))
             (list)))
           (btor905 (bitvector 11))
           (btor906
            (signal
             (concat (signal-value btor887) (signal-value btor904))
             (list)))
           (btor907 (bitvector 12))
           (btor908
            (signal
             (concat (signal-value btor887) (signal-value btor906))
             (list)))
           (btor909 (bitvector 13))
           (btor910
            (signal
             (concat (signal-value btor887) (signal-value btor908))
             (list)))
           (btor911 (bitvector 14))
           (btor912
            (signal
             (concat (signal-value btor887) (signal-value btor910))
             (list)))
           (btor913 (bitvector 15))
           (btor914
            (signal
             (concat (signal-value btor887) (signal-value btor912))
             (list)))
           (btor915 (bitvector 16))
           (btor916
            (signal
             (concat (signal-value btor887) (signal-value btor914))
             (list)))
           (btor917
            (signal
             (concat (signal-value btor887) (signal-value btor916))
             (list)))
           (btor918
            (signal
             (concat (signal-value btor887) (signal-value btor917))
             (list)))
           (btor919 (bitvector 19))
           (btor920
            (signal
             (concat (signal-value btor887) (signal-value btor918))
             (list)))
           (btor921 (bitvector 20))
           (btor922
            (signal
             (concat (signal-value btor887) (signal-value btor920))
             (list)))
           (btor923
            (signal
             (concat (signal-value btor887) (signal-value btor922))
             (list)))
           (btor924
            (signal
             (concat (signal-value btor887) (signal-value btor923))
             (list)))
           (btor925 (bitvector 23))
           (btor926
            (signal
             (concat (signal-value btor887) (signal-value btor924))
             (list)))
           (btor927 (bitvector 24))
           (btor928
            (signal
             (concat (signal-value btor887) (signal-value btor926))
             (list)))
           (btor929 (bitvector 25))
           (btor930
            (signal
             (concat (signal-value btor887) (signal-value btor928))
             (list)))
           (btor931 (bitvector 26))
           (btor932
            (signal
             (concat (signal-value btor887) (signal-value btor930))
             (list)))
           (btor933 (bitvector 27))
           (btor934
            (signal
             (concat (signal-value btor887) (signal-value btor932))
             (list)))
           (btor935 (bitvector 28))
           (btor936
            (signal
             (concat (signal-value btor887) (signal-value btor934))
             (list)))
           (btor937 (bitvector 29))
           (btor938
            (signal
             (concat (signal-value btor887) (signal-value btor936))
             (list)))
           (btor939 (bitvector 30))
           (btor940
            (signal
             (concat (signal-value btor887) (signal-value btor938))
             (list)))
           (btor941 (bitvector 31))
           (btor942
            (signal
             (concat (signal-value btor887) (signal-value btor940))
             (list)))
           (btor943
            (signal
             (concat (signal-value btor887) (signal-value btor942))
             (list)))
           (btor944 (bitvector 33))
           (btor945
            (signal
             (concat (signal-value btor887) (signal-value btor943))
             (list)))
           (btor946 (bitvector 34))
           (btor947
            (signal
             (concat (signal-value btor887) (signal-value btor945))
             (list)))
           (btor948
            (signal
             (concat (signal-value btor887) (signal-value btor947))
             (list)))
           (btor949
            (signal
             (bvor (signal-value btor772) (signal-value btor829))
             (list)))
           (btor950
            (if (bitvector->bool (signal-value btor949)) btor948 btor264))
           (btor951
            (signal
             (concat (signal-value btor887) (signal-value btor890))
             (list)))
           (btor952
            (signal
             (extract 34 18 (signal-value btor950))
             (signal-state btor950)))
           (btor953
            (signal
             (concat (signal-value btor952) (signal-value btor951))
             (list)))
           (btor954
            (signal
             (concat (signal-value btor874) (signal-value btor874))
             (list)))
           (btor955
            (signal
             (concat (signal-value btor874) (signal-value btor954))
             (list)))
           (btor956
            (signal
             (concat (signal-value btor874) (signal-value btor955))
             (list)))
           (btor957
            (signal
             (concat (signal-value btor874) (signal-value btor956))
             (list)))
           (btor958
            (signal
             (concat (signal-value btor874) (signal-value btor957))
             (list)))
           (btor959
            (signal
             (concat (signal-value btor874) (signal-value btor958))
             (list)))
           (btor960
            (signal
             (concat (signal-value btor874) (signal-value btor959))
             (list)))
           (btor961
            (signal
             (concat (signal-value btor874) (signal-value btor960))
             (list)))
           (btor962
            (signal
             (concat (signal-value btor874) (signal-value btor961))
             (list)))
           (btor963
            (signal
             (concat (signal-value btor874) (signal-value btor962))
             (list)))
           (btor964
            (signal
             (concat (signal-value btor874) (signal-value btor963))
             (list)))
           (btor965
            (signal
             (concat (signal-value btor874) (signal-value btor964))
             (list)))
           (btor966
            (signal
             (concat (signal-value btor874) (signal-value btor965))
             (list)))
           (btor967
            (signal
             (concat (signal-value btor874) (signal-value btor966))
             (list)))
           (btor968
            (signal
             (concat (signal-value btor874) (signal-value btor967))
             (list)))
           (btor969
            (signal
             (concat (signal-value btor874) (signal-value btor968))
             (list)))
           (btor970
            (signal
             (concat (signal-value btor874) (signal-value btor969))
             (list)))
           (btor971
            (signal
             (concat (signal-value btor874) (signal-value btor970))
             (list)))
           (btor972
            (signal
             (concat (signal-value btor874) (signal-value btor971))
             (list)))
           (btor973
            (signal
             (concat (signal-value btor874) (signal-value btor972))
             (list)))
           (btor974
            (signal
             (concat (signal-value btor874) (signal-value btor973))
             (list)))
           (btor975
            (signal
             (concat (signal-value btor874) (signal-value btor974))
             (list)))
           (btor976
            (signal
             (concat (signal-value btor874) (signal-value btor975))
             (list)))
           (btor977
            (signal
             (concat (signal-value btor874) (signal-value btor976))
             (list)))
           (btor978
            (signal
             (concat (signal-value btor874) (signal-value btor977))
             (list)))
           (btor979
            (signal
             (concat (signal-value btor874) (signal-value btor978))
             (list)))
           (btor980
            (signal
             (concat (signal-value btor874) (signal-value btor979))
             (list)))
           (btor981
            (signal
             (concat (signal-value btor874) (signal-value btor980))
             (list)))
           (btor982
            (signal
             (concat (signal-value btor874) (signal-value btor981))
             (list)))
           (btor983
            (signal
             (concat (signal-value btor874) (signal-value btor982))
             (list)))
           (btor984
            (signal
             (concat (signal-value btor874) (signal-value btor983))
             (list)))
           (btor985
            (signal
             (concat (signal-value btor874) (signal-value btor984))
             (list)))
           (btor986
            (signal
             (concat (signal-value btor874) (signal-value btor985))
             (list)))
           (btor987
            (signal
             (concat (signal-value btor874) (signal-value btor986))
             (list)))
           (btor988
            (if (bitvector->bool (signal-value btor949)) btor987 btor264))
           (btor989
            (signal
             (concat (signal-value btor874) (signal-value btor890))
             (list)))
           (btor990
            (signal
             (extract 34 18 (signal-value btor988))
             (signal-state btor988)))
           (btor991
            (signal
             (concat (signal-value btor990) (signal-value btor989))
             (list)))
           (btor992
            (if (bitvector->bool (signal-value btor295)) btor991 btor953))
           (btor993
            (bv->signal
             (zero-extend (signal-value btor992) (bitvector 35))
             btor992))
           (btor994
            (bv->signal
             (zero-extend (signal-value btor873) (bitvector 1))
             btor873))
           (btor995
            (bv->signal
             (zero-extend (signal-value btor874) (bitvector 1))
             btor874))
           (btor996
            (bv->signal
             (zero-extend (signal-value btor625) (bitvector 36))
             btor625))
           (btor997
            (bv->signal
             (zero-extend (signal-value btor621) (bitvector 36))
             btor621))
           (btor998
            (bv->signal
             (zero-extend (signal-value btor622) (bitvector 36))
             btor622))
           (btor999
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state999)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state999)))
                     ((assoc-has-key? init-hash 'state999)
                      (bv->signal (assoc-ref init-hash 'state999)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1001
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state1001)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state1001)))
                     ((assoc-has-key? init-hash 'state1001)
                      (bv->signal (assoc-ref init-hash 'state1001)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1003
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state1003)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state1003)))
                     ((assoc-has-key? init-hash 'state1003)
                      (bv->signal (assoc-ref init-hash 'state1003)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1005
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor1006
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor1005)))
             (list)))
           (btor1007
            (if (bitvector->bool (signal-value btor1006)) btor36 btor95))
           (btor1008
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor1009
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor1008)))
             (list)))
           (btor1010
            (if (bitvector->bool (signal-value btor1009)) btor35 btor1007))
           (btor1011
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor1012
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor1011)))
             (list)))
           (btor1013
            (if (bitvector->bool (signal-value btor1012)) btor34 btor1010))
           (btor1014
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor116)))
             (list)))
           (btor1015
            (if (bitvector->bool (signal-value btor1014)) btor95 btor1013))
           (btor1016
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor1017
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor1016)))
             (list)))
           (btor1018
            (if (bitvector->bool (signal-value btor1017)) btor33 btor1015))
           (btor1019
            (signal
             (concat (signal-value btor1018) (signal-value btor1003))
             (list)))
           (btor1020
            (signal
             (bool->bitvector
              (bveq (signal-value btor1019) (signal-value btor125)))
             (list)))
           (btor1021
            (if (bitvector->bool (signal-value btor1020)) btor1001 btor999))
           (btor1022
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor1023
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor1022)))
             (list)))
           (btor1024
            (if (bitvector->bool (signal-value btor1023)) btor26 btor95))
           (btor1025
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor1026
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor1025)))
             (list)))
           (btor1027
            (if (bitvector->bool (signal-value btor1026)) btor25 btor1024))
           (btor1028
            (signal
             (apply bvor (bitvector->bits (signal-value btor16)))
             (signal-state btor16)))
           (btor1029 (signal (bvnot (signal-value btor1028)) (list)))
           (btor1030
            (if (bitvector->bool (signal-value btor1029)) btor24 btor1027))
           (btor1031
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor192)))
             (list)))
           (btor1032
            (if (bitvector->bool (signal-value btor1031)) btor95 btor1030))
           (btor1033
            (bv->signal
             (zero-extend (signal-value btor195) (bitvector 5))
             btor195))
           (btor1034
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor1033)))
             (list)))
           (btor1035
            (if (bitvector->bool (signal-value btor1034)) btor27 btor1032))
           (btor1036
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state1036)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state1036)))
                     ((assoc-has-key? init-hash 'state1036)
                      (bv->signal (assoc-ref init-hash 'state1036)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1037
            (signal
             (bvor (signal-value btor1035) (signal-value btor1036))
             (list)))
           (btor1038
            (if (bitvector->bool (signal-value btor1037)) btor95 btor1021))
           (btor1039
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state1039)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state1039)))
                     ((assoc-has-key? init-hash 'state1039)
                      (bv->signal (assoc-ref init-hash 'state1039)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1041
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state1041)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state1041)))
                     ((assoc-has-key? init-hash 'state1041)
                      (bv->signal (assoc-ref init-hash 'state1041)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1043
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state1043)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state1043)))
                     ((assoc-has-key? init-hash 'state1043)
                      (bv->signal (assoc-ref init-hash 'state1043)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1045
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor1046
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor1045)))
             (list)))
           (btor1047
            (if (bitvector->bool (signal-value btor1046)) btor36 btor95))
           (btor1048
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor1049
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor1048)))
             (list)))
           (btor1050
            (if (bitvector->bool (signal-value btor1049)) btor35 btor1047))
           (btor1051
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor1052
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor1051)))
             (list)))
           (btor1053
            (if (bitvector->bool (signal-value btor1052)) btor34 btor1050))
           (btor1054
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor116)))
             (list)))
           (btor1055
            (if (bitvector->bool (signal-value btor1054)) btor95 btor1053))
           (btor1056
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor1057
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor1056)))
             (list)))
           (btor1058
            (if (bitvector->bool (signal-value btor1057)) btor33 btor1055))
           (btor1059
            (signal
             (concat (signal-value btor1058) (signal-value btor1043))
             (list)))
           (btor1060
            (signal
             (bool->bitvector
              (bveq (signal-value btor1059) (signal-value btor125)))
             (list)))
           (btor1061
            (if (bitvector->bool (signal-value btor1060)) btor1041 btor1039))
           (btor1062
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor1063
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor1062)))
             (list)))
           (btor1064
            (if (bitvector->bool (signal-value btor1063)) btor26 btor95))
           (btor1065
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor1066
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor1065)))
             (list)))
           (btor1067
            (if (bitvector->bool (signal-value btor1066)) btor25 btor1064))
           (btor1068
            (signal
             (apply bvor (bitvector->bits (signal-value btor15)))
             (signal-state btor15)))
           (btor1069 (signal (bvnot (signal-value btor1068)) (list)))
           (btor1070
            (if (bitvector->bool (signal-value btor1069)) btor24 btor1067))
           (btor1071
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor192)))
             (list)))
           (btor1072
            (if (bitvector->bool (signal-value btor1071)) btor95 btor1070))
           (btor1073
            (bv->signal
             (zero-extend (signal-value btor195) (bitvector 5))
             btor195))
           (btor1074
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor1073)))
             (list)))
           (btor1075
            (if (bitvector->bool (signal-value btor1074)) btor27 btor1072))
           (btor1076
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state1076)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state1076)))
                     ((assoc-has-key? init-hash 'state1076)
                      (bv->signal (assoc-ref init-hash 'state1076)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1077
            (signal
             (bvor (signal-value btor1075) (signal-value btor1076))
             (list)))
           (btor1078
            (if (bitvector->bool (signal-value btor1077)) btor95 btor1061))
           (btor1079
            (if (bitvector->bool (signal-value btor1054)) btor14 btor1078))
           (btor1080
            (if (bitvector->bool (signal-value btor1014)) btor1079 btor1038))
           (btor1081
            (bv->signal
             (zero-extend (signal-value btor1080) (bitvector 1))
             btor1080))
           (btor1082
            (bv->signal
             (zero-extend (signal-value btor1038) (bitvector 1))
             btor1038))
           (btor1083
            (bv->signal
             (zero-extend (signal-value btor1080) (bitvector 1))
             btor1080))
           (btor1084
            (bv->signal
             (zero-extend (signal-value btor1078) (bitvector 1))
             btor1078))
           (btor1085
            (bv->signal
             (zero-extend (signal-value btor1079) (bitvector 1))
             btor1079))
           (btor1086
            (bv->signal
             (zero-extend (signal-value btor1018) (bitvector 1))
             btor1018))
           (btor1087
            (bv->signal
             (zero-extend (signal-value btor1035) (bitvector 1))
             btor1035))
           (btor1088
            (if (bitvector->bool (signal-value btor1006)) btor52 btor100))
           (btor1089
            (if (bitvector->bool (signal-value btor1009)) btor51 btor1088))
           (btor1090
            (if (bitvector->bool (signal-value btor1012)) btor50 btor1089))
           (btor1091
            (if (bitvector->bool (signal-value btor1014)) btor100 btor1090))
           (btor1092
            (if (bitvector->bool (signal-value btor1017)) btor49 btor1091))
           (btor1093
            (bv->signal
             (zero-extend (signal-value btor1092) (bitvector 1))
             btor1092))
           (btor1094
            (bv->signal
             (zero-extend (signal-value btor1058) (bitvector 1))
             btor1058))
           (btor1095
            (bv->signal
             (zero-extend (signal-value btor1075) (bitvector 1))
             btor1075))
           (btor1096
            (if (bitvector->bool (signal-value btor1046)) btor52 btor100))
           (btor1097
            (if (bitvector->bool (signal-value btor1049)) btor51 btor1096))
           (btor1098
            (if (bitvector->bool (signal-value btor1052)) btor50 btor1097))
           (btor1099
            (if (bitvector->bool (signal-value btor1054)) btor100 btor1098))
           (btor1100
            (if (bitvector->bool (signal-value btor1057)) btor49 btor1099))
           (btor1101
            (bv->signal
             (zero-extend (signal-value btor1100) (bitvector 1))
             btor1100))
           (btor1102
            (bv->signal
             (zero-extend (signal-value btor1079) (bitvector 1))
             btor1079))
           (btor1104
            (if (bitvector->bool (signal-value btor496)) btor95 btor283))
           (btor1105
            (if (bitvector->bool (signal-value btor718)) btor1104 btor127))
           (btor1106
            (if (bitvector->bool (signal-value btor712)) btor95 btor1105))
           (btor1110
            (if (bitvector->bool (signal-value btor718)) btor670 btor137))
           (btor1111
            (if (bitvector->bool (signal-value btor712)) btor95 btor1110))
           (btor1115 unnamed-input-1115)
           (btor1116
            (if (bitvector->bool (signal-value btor1080)) btor992 btor728))
           (btor1117 unnamed-input-1117)
           (btor1118
            (signal
             (extract 34 0 (signal-value btor685))
             (signal-state btor685)))
           (btor1119
            (signal
             (extract 34 0 (signal-value btor625))
             (signal-state btor625)))
           (btor1120
            (if (bitvector->bool (signal-value btor644)) btor1119 btor1118))
           (btor1121
            (if (bitvector->bool (signal-value btor718)) btor1120 btor1117))
           (btor1122 unnamed-input-1122)
           (btor1123
            (if (bitvector->bool (signal-value btor712)) btor1122 btor1121))
           (btor1124
            (signal
             (bool->bitvector
              (bvuge (signal-value btor1116) (signal-value btor1123)))
             (list)))
           (btor1125
            (if (bitvector->bool (signal-value btor1124)) btor100 btor95))
           (btor1126
            (if (bitvector->bool (signal-value btor1080)) btor264 btor728))
           (btor1127
            (signal
             (bool->bitvector
              (bvuge (signal-value btor1126) (signal-value btor1123)))
             (list)))
           (btor1128
            (if (bitvector->bool (signal-value btor1127)) btor100 btor95))
           (btor1129 (signal (bvnot (signal-value btor496)) (list)))
           (btor1130 (signal (bvnot (signal-value btor494)) (list)))
           (btor1131
            (signal
             (bvand (signal-value btor1129) (signal-value btor1130))
             (list)))
           (btor1132
            (if (bitvector->bool (signal-value btor1131)) btor1128 btor1125))
           (btor1133
            (bv->signal
             (zero-extend (signal-value btor1116) (bitvector 36))
             btor1116))
           (btor1134
            (bv->signal
             (zero-extend (signal-value btor1123) (bitvector 36))
             btor1123))
           (btor1135
            (signal
             (bvadd (signal-value btor1133) (signal-value btor1134))
             (list)))
           (btor1136
            (bv->signal
             (zero-extend (signal-value btor1126) (bitvector 36))
             btor1126))
           (btor1137
            (bv->signal
             (zero-extend (signal-value btor1123) (bitvector 36))
             btor1123))
           (btor1138
            (signal
             (bvadd (signal-value btor1136) (signal-value btor1137))
             (list)))
           (btor1139
            (if (bitvector->bool (signal-value btor1131)) btor1138 btor1135))
           (btor1140
            (signal
             (extract 35 35 (signal-value btor1139))
             (signal-state btor1139)))
           (btor1141
            (if (bitvector->bool (signal-value btor450)) btor1140 btor1132))
           (btor1142
            (if (bitvector->bool (signal-value btor718)) btor1141 btor1115))
           (btor1143 unnamed-input-1143)
           (btor1144
            (if (bitvector->bool (signal-value btor712)) btor1143 btor1142))
           (btor1145 (signal (bvnot (signal-value btor1144)) (list)))
           (btor1146
            (if (bitvector->bool (signal-value btor450)) btor1144 btor1145))
           (btor1147 unnamed-input-1147)
           (btor1148
            (signal
             (extract 34 34 (signal-value btor728))
             (signal-state btor728)))
           (btor1149
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor1147)
              (signal-value btor1148))
             (list)))
           (btor1150 (signal (bvnot (signal-value btor450)) (list)))
           (btor1151
            (signal
             (bvxor (signal-value btor1149) (signal-value btor1150))
             (list)))
           (btor1152 unnamed-input-1152)
           (btor1153
            (signal
             (bvsub (signal-value btor1116) (signal-value btor1123))
             (list)))
           (btor1154
            (signal
             (bvsub (signal-value btor1126) (signal-value btor1123))
             (list)))
           (btor1155
            (if (bitvector->bool (signal-value btor1131)) btor1154 btor1153))
           (btor1156
            (signal
             (extract 34 0 (signal-value btor1139))
             (signal-state btor1139)))
           (btor1157
            (if (bitvector->bool (signal-value btor450)) btor1156 btor1155))
           (btor1158
            (if (bitvector->bool (signal-value btor718)) btor1157 btor1152))
           (btor1159 unnamed-input-1159)
           (btor1160
            (if (bitvector->bool (signal-value btor712)) btor1159 btor1158))
           (btor1161
            (signal
             (extract 34 34 (signal-value btor1160))
             (signal-state btor1160)))
           (btor1162
            (signal
             (bvxor (signal-value btor1148) (signal-value btor1161))
             (list)))
           (btor1163
            (signal
             (bvand (signal-value btor1151) (signal-value btor1162))
             (list)))
           (btor1164 unnamed-input-1164)
           (btor1165
            (signal
             (extract 34 34 (signal-value btor992))
             (signal-state btor992)))
           (btor1166
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor1164)
              (signal-value btor1165))
             (list)))
           (btor1167
            (signal
             (bvxor (signal-value btor1166) (signal-value btor1150))
             (list)))
           (btor1168
            (signal
             (bvxor (signal-value btor1165) (signal-value btor1161))
             (list)))
           (btor1169
            (signal
             (bvand (signal-value btor1167) (signal-value btor1168))
             (list)))
           (btor1170
            (if (bitvector->bool (signal-value btor1080)) btor1169 btor1163))
           (btor1171 unnamed-input-1171)
           (btor1172
            (if (bitvector->bool (signal-value btor718)) btor949 btor1171))
           (btor1173 unnamed-input-1173)
           (btor1174
            (if (bitvector->bool (signal-value btor712)) btor1173 btor1172))
           (btor1175
            (signal
             (apply bvor (bitvector->bits (signal-value btor1123)))
             (signal-state btor1123)))
           (btor1176
            (signal
             (bvand (signal-value btor1174) (signal-value btor1175))
             (list)))
           (btor1177
            (if (bitvector->bool (signal-value btor1176)) btor1170 btor1146))
           (btor1178
            (if (bitvector->bool (signal-value btor718)) btor1177 btor147))
           (btor1179
            (if (bitvector->bool (signal-value btor712)) btor95 btor1178))
           (btor1183
            (if (bitvector->bool (signal-value btor496)) btor1160 btor273))
           (btor1184
            (if (bitvector->bool (signal-value btor496)) btor1183 btor1160))
           (btor1185
            (signal
             (extract 17 0 (signal-value btor1184))
             (signal-state btor1184)))
           (btor1186
            (if (bitvector->bool (signal-value btor718)) btor1185 btor158))
           (btor1187
            (if (bitvector->bool (signal-value btor712)) btor149 btor1186))
           (btor1191
            (if (bitvector->bool (signal-value btor93)) btor81 btor43))
           (btor1192 (bv->signal (bv 26 (bitvector 5))))
           (btor1193
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor1192)))
             (list)))
           (btor1194
            (if (bitvector->bool (signal-value btor1193)) btor1191 btor201))
           (btor1195
            (if (bitvector->bool (signal-value btor203)) btor81 btor1194))
           (btor1196
            (if (bitvector->bool (signal-value btor208)) btor43 btor1195))
           (btor1197
            (if (bitvector->bool (signal-value btor484)) btor1196 btor201))
           (btor1202
            (if (bitvector->bool (signal-value btor94)) btor82 btor44))
           (btor1203
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor1192)))
             (list)))
           (btor1204
            (if (bitvector->bool (signal-value btor1203)) btor1202 btor251))
           (btor1205
            (if (bitvector->bool (signal-value btor253)) btor82 btor1204))
           (btor1206
            (if (bitvector->bool (signal-value btor258)) btor44 btor1205))
           (btor1207
            (if (bitvector->bool (signal-value btor492)) btor1206 btor251))
           (btor1212
            (if (bitvector->bool (signal-value btor718)) btor1183 btor273))
           (btor1213
            (if (bitvector->bool (signal-value btor712)) btor264 btor1212))
           (btor1217
            (if (bitvector->bool (signal-value btor718)) btor1104 btor283))
           (btor1218
            (if (bitvector->bool (signal-value btor712)) btor95 btor1217))
           (btor1222
            (if (bitvector->bool (signal-value btor461)) btor438 btor397))
           (btor1227
            (if (bitvector->bool (signal-value btor471)) btor28 btor437))
           (btor1232
            (if (bitvector->bool (signal-value btor785)) btor91 btor544))
           (btor1237
            (if (bitvector->bool (signal-value btor842)) btor92 btor603))
           (btor1242
            (if (bitvector->bool (signal-value btor694)) btor95 btor668))
           (btor1247
            (if (bitvector->bool (signal-value btor694)) btor625 btor685))
           (btor1252
            (if (bitvector->bool (signal-value btor718)) btor1184 btor728))
           (btor1253
            (if (bitvector->bool (signal-value btor712)) btor264 btor1252))
           (btor1257
            (if (bitvector->bool (signal-value btor850)) btor545 btor769))
           (btor1262
            (if (bitvector->bool (signal-value btor858)) btor604 btor826))
           (btor1267
            (if (bitvector->bool (signal-value btor356)) btor19 btor873))
           (btor1272
            (if (bitvector->bool (signal-value btor320)) btor874 btor887))
           (btor1277
            (if (bitvector->bool (signal-value btor1092)) btor1079 btor1038))
           (btor1282
            (if (bitvector->bool (signal-value btor1100)) btor14 btor1078)))
      (list
       (cons
        'scanouta
        (signal
         (signal-value btor210)
         (append
          (list (cons 'state1076 (signal-value btor1075)))
          (append
           (list (cons 'state1043 (signal-value btor1058)))
           (append
            (list (cons 'state1041 (signal-value btor1282)))
            (append
             (list (cons 'state1039 (signal-value btor1078)))
             (append
              (list (cons 'state1036 (signal-value btor1035)))
              (append
               (list (cons 'state1003 (signal-value btor1018)))
               (append
                (list (cons 'state1001 (signal-value btor1277)))
                (append
                 (list (cons 'state999 (signal-value btor1038)))
                 (append
                  (list (cons 'state885 (signal-value btor314)))
                  (append
                   (list (cons 'state880 (signal-value btor299)))
                   (append
                    (list (cons 'state878 (signal-value btor1272)))
                    (append
                     (list (cons 'state876 (signal-value btor887)))
                     (append
                      (list (cons 'state871 (signal-value btor350)))
                      (append
                       (list (cons 'state866 (signal-value btor335)))
                       (append
                        (list (cons 'state864 (signal-value btor1267)))
                        (append
                         (list (cons 'state862 (signal-value btor873)))
                         (append
                          (list (cons 'state824 (signal-value btor823)))
                          (append
                           (list (cons 'state791 (signal-value btor806)))
                           (append
                            (list (cons 'state789 (signal-value btor1262)))
                            (append
                             (list (cons 'state787 (signal-value btor826)))
                             (append
                              (list (cons 'state767 (signal-value btor766)))
                              (append
                               (list (cons 'state734 (signal-value btor749)))
                               (append
                                (list (cons 'state732 (signal-value btor1257)))
                                (append
                                 (list (cons 'state730 (signal-value btor769)))
                                 (append
                                  (list
                                   (cons 'state724 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state722 (signal-value btor1253)))
                                   (append
                                    (list
                                     (cons 'state720 (signal-value btor728)))
                                    (append
                                     (list
                                      (cons 'state683 (signal-value btor665)))
                                     (append
                                      (list
                                       (cons 'state678 (signal-value btor648)))
                                      (append
                                       (list
                                        (cons
                                         'state676
                                         (signal-value btor1247)))
                                       (append
                                        (list
                                         (cons
                                          'state674
                                          (signal-value btor685)))
                                        (append
                                         (list
                                          (cons
                                           'state666
                                           (signal-value btor665)))
                                         (append
                                          (list
                                           (cons
                                            'state633
                                            (signal-value btor648)))
                                          (append
                                           (list
                                            (cons
                                             'state631
                                             (signal-value btor1242)))
                                           (append
                                            (list
                                             (cons
                                              'state629
                                              (signal-value btor668)))
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
                                                 (signal-value btor1237)))
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
                                                     (signal-value btor1232)))
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
                                                          btor1227)))
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
                                                              btor1222)))
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
                                                                 btor1218)))
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
                                                                    btor1213)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state265
                                                                    (signal-value
                                                                     btor273)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state249
                                                                     (signal-value
                                                                      btor248)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state216
                                                                      (signal-value
                                                                       btor231)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state214
                                                                       (signal-value
                                                                        btor1207)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state212
                                                                        (signal-value
                                                                         btor251)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state199
                                                                         (signal-value
                                                                          btor198)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state164
                                                                          (signal-value
                                                                           btor179)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state162
                                                                           (signal-value
                                                                            btor1197)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state160
                                                                            (signal-value
                                                                             btor201)))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             'state154
                                                                             (signal-value
                                                                              btor122)))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              'state152
                                                                              (signal-value
                                                                               btor1187)))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               'state150
                                                                               (signal-value
                                                                                btor158)))
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
                                                                                  btor1179)))
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
                                                                                     btor1111)))
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
                                                                                        btor1106)))
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
          (list (cons 'state1076 (signal-value btor1075)))
          (append
           (list (cons 'state1043 (signal-value btor1058)))
           (append
            (list (cons 'state1041 (signal-value btor1282)))
            (append
             (list (cons 'state1039 (signal-value btor1078)))
             (append
              (list (cons 'state1036 (signal-value btor1035)))
              (append
               (list (cons 'state1003 (signal-value btor1018)))
               (append
                (list (cons 'state1001 (signal-value btor1277)))
                (append
                 (list (cons 'state999 (signal-value btor1038)))
                 (append
                  (list (cons 'state885 (signal-value btor314)))
                  (append
                   (list (cons 'state880 (signal-value btor299)))
                   (append
                    (list (cons 'state878 (signal-value btor1272)))
                    (append
                     (list (cons 'state876 (signal-value btor887)))
                     (append
                      (list (cons 'state871 (signal-value btor350)))
                      (append
                       (list (cons 'state866 (signal-value btor335)))
                       (append
                        (list (cons 'state864 (signal-value btor1267)))
                        (append
                         (list (cons 'state862 (signal-value btor873)))
                         (append
                          (list (cons 'state824 (signal-value btor823)))
                          (append
                           (list (cons 'state791 (signal-value btor806)))
                           (append
                            (list (cons 'state789 (signal-value btor1262)))
                            (append
                             (list (cons 'state787 (signal-value btor826)))
                             (append
                              (list (cons 'state767 (signal-value btor766)))
                              (append
                               (list (cons 'state734 (signal-value btor749)))
                               (append
                                (list (cons 'state732 (signal-value btor1257)))
                                (append
                                 (list (cons 'state730 (signal-value btor769)))
                                 (append
                                  (list
                                   (cons 'state724 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state722 (signal-value btor1253)))
                                   (append
                                    (list
                                     (cons 'state720 (signal-value btor728)))
                                    (append
                                     (list
                                      (cons 'state683 (signal-value btor665)))
                                     (append
                                      (list
                                       (cons 'state678 (signal-value btor648)))
                                      (append
                                       (list
                                        (cons
                                         'state676
                                         (signal-value btor1247)))
                                       (append
                                        (list
                                         (cons
                                          'state674
                                          (signal-value btor685)))
                                        (append
                                         (list
                                          (cons
                                           'state666
                                           (signal-value btor665)))
                                         (append
                                          (list
                                           (cons
                                            'state633
                                            (signal-value btor648)))
                                          (append
                                           (list
                                            (cons
                                             'state631
                                             (signal-value btor1242)))
                                           (append
                                            (list
                                             (cons
                                              'state629
                                              (signal-value btor668)))
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
                                                 (signal-value btor1237)))
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
                                                     (signal-value btor1232)))
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
                                                          btor1227)))
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
                                                              btor1222)))
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
                                                                 btor1218)))
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
                                                                    btor1213)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state265
                                                                    (signal-value
                                                                     btor273)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state249
                                                                     (signal-value
                                                                      btor248)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state216
                                                                      (signal-value
                                                                       btor231)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state214
                                                                       (signal-value
                                                                        btor1207)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state212
                                                                        (signal-value
                                                                         btor251)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state199
                                                                         (signal-value
                                                                          btor198)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state164
                                                                          (signal-value
                                                                           btor179)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state162
                                                                           (signal-value
                                                                            btor1197)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state160
                                                                            (signal-value
                                                                             btor201)))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             'state154
                                                                             (signal-value
                                                                              btor122)))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              'state152
                                                                              (signal-value
                                                                               btor1187)))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               'state150
                                                                               (signal-value
                                                                                btor158)))
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
                                                                                  btor1179)))
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
                                                                                     btor1111)))
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
                                                                                        btor1106)))
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
         (signal-value btor158)
         (append
          (list (cons 'state1076 (signal-value btor1075)))
          (append
           (list (cons 'state1043 (signal-value btor1058)))
           (append
            (list (cons 'state1041 (signal-value btor1282)))
            (append
             (list (cons 'state1039 (signal-value btor1078)))
             (append
              (list (cons 'state1036 (signal-value btor1035)))
              (append
               (list (cons 'state1003 (signal-value btor1018)))
               (append
                (list (cons 'state1001 (signal-value btor1277)))
                (append
                 (list (cons 'state999 (signal-value btor1038)))
                 (append
                  (list (cons 'state885 (signal-value btor314)))
                  (append
                   (list (cons 'state880 (signal-value btor299)))
                   (append
                    (list (cons 'state878 (signal-value btor1272)))
                    (append
                     (list (cons 'state876 (signal-value btor887)))
                     (append
                      (list (cons 'state871 (signal-value btor350)))
                      (append
                       (list (cons 'state866 (signal-value btor335)))
                       (append
                        (list (cons 'state864 (signal-value btor1267)))
                        (append
                         (list (cons 'state862 (signal-value btor873)))
                         (append
                          (list (cons 'state824 (signal-value btor823)))
                          (append
                           (list (cons 'state791 (signal-value btor806)))
                           (append
                            (list (cons 'state789 (signal-value btor1262)))
                            (append
                             (list (cons 'state787 (signal-value btor826)))
                             (append
                              (list (cons 'state767 (signal-value btor766)))
                              (append
                               (list (cons 'state734 (signal-value btor749)))
                               (append
                                (list (cons 'state732 (signal-value btor1257)))
                                (append
                                 (list (cons 'state730 (signal-value btor769)))
                                 (append
                                  (list
                                   (cons 'state724 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state722 (signal-value btor1253)))
                                   (append
                                    (list
                                     (cons 'state720 (signal-value btor728)))
                                    (append
                                     (list
                                      (cons 'state683 (signal-value btor665)))
                                     (append
                                      (list
                                       (cons 'state678 (signal-value btor648)))
                                      (append
                                       (list
                                        (cons
                                         'state676
                                         (signal-value btor1247)))
                                       (append
                                        (list
                                         (cons
                                          'state674
                                          (signal-value btor685)))
                                        (append
                                         (list
                                          (cons
                                           'state666
                                           (signal-value btor665)))
                                         (append
                                          (list
                                           (cons
                                            'state633
                                            (signal-value btor648)))
                                          (append
                                           (list
                                            (cons
                                             'state631
                                             (signal-value btor1242)))
                                           (append
                                            (list
                                             (cons
                                              'state629
                                              (signal-value btor668)))
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
                                                 (signal-value btor1237)))
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
                                                     (signal-value btor1232)))
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
                                                          btor1227)))
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
                                                              btor1222)))
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
                                                                 btor1218)))
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
                                                                    btor1213)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state265
                                                                    (signal-value
                                                                     btor273)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state249
                                                                     (signal-value
                                                                      btor248)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state216
                                                                      (signal-value
                                                                       btor231)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state214
                                                                       (signal-value
                                                                        btor1207)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state212
                                                                        (signal-value
                                                                         btor251)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state199
                                                                         (signal-value
                                                                          btor198)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state164
                                                                          (signal-value
                                                                           btor179)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state162
                                                                           (signal-value
                                                                            btor1197)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state160
                                                                            (signal-value
                                                                             btor201)))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             'state154
                                                                             (signal-value
                                                                              btor122)))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              'state152
                                                                              (signal-value
                                                                               btor1187)))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               'state150
                                                                               (signal-value
                                                                                btor158)))
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
                                                                                  btor1179)))
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
                                                                                     btor1111)))
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
                                                                                        btor1106)))
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
          (list (cons 'state1076 (signal-value btor1075)))
          (append
           (list (cons 'state1043 (signal-value btor1058)))
           (append
            (list (cons 'state1041 (signal-value btor1282)))
            (append
             (list (cons 'state1039 (signal-value btor1078)))
             (append
              (list (cons 'state1036 (signal-value btor1035)))
              (append
               (list (cons 'state1003 (signal-value btor1018)))
               (append
                (list (cons 'state1001 (signal-value btor1277)))
                (append
                 (list (cons 'state999 (signal-value btor1038)))
                 (append
                  (list (cons 'state885 (signal-value btor314)))
                  (append
                   (list (cons 'state880 (signal-value btor299)))
                   (append
                    (list (cons 'state878 (signal-value btor1272)))
                    (append
                     (list (cons 'state876 (signal-value btor887)))
                     (append
                      (list (cons 'state871 (signal-value btor350)))
                      (append
                       (list (cons 'state866 (signal-value btor335)))
                       (append
                        (list (cons 'state864 (signal-value btor1267)))
                        (append
                         (list (cons 'state862 (signal-value btor873)))
                         (append
                          (list (cons 'state824 (signal-value btor823)))
                          (append
                           (list (cons 'state791 (signal-value btor806)))
                           (append
                            (list (cons 'state789 (signal-value btor1262)))
                            (append
                             (list (cons 'state787 (signal-value btor826)))
                             (append
                              (list (cons 'state767 (signal-value btor766)))
                              (append
                               (list (cons 'state734 (signal-value btor749)))
                               (append
                                (list (cons 'state732 (signal-value btor1257)))
                                (append
                                 (list (cons 'state730 (signal-value btor769)))
                                 (append
                                  (list
                                   (cons 'state724 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state722 (signal-value btor1253)))
                                   (append
                                    (list
                                     (cons 'state720 (signal-value btor728)))
                                    (append
                                     (list
                                      (cons 'state683 (signal-value btor665)))
                                     (append
                                      (list
                                       (cons 'state678 (signal-value btor648)))
                                      (append
                                       (list
                                        (cons
                                         'state676
                                         (signal-value btor1247)))
                                       (append
                                        (list
                                         (cons
                                          'state674
                                          (signal-value btor685)))
                                        (append
                                         (list
                                          (cons
                                           'state666
                                           (signal-value btor665)))
                                         (append
                                          (list
                                           (cons
                                            'state633
                                            (signal-value btor648)))
                                          (append
                                           (list
                                            (cons
                                             'state631
                                             (signal-value btor1242)))
                                           (append
                                            (list
                                             (cons
                                              'state629
                                              (signal-value btor668)))
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
                                                 (signal-value btor1237)))
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
                                                     (signal-value btor1232)))
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
                                                          btor1227)))
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
                                                              btor1222)))
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
                                                                 btor1218)))
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
                                                                    btor1213)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state265
                                                                    (signal-value
                                                                     btor273)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state249
                                                                     (signal-value
                                                                      btor248)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state216
                                                                      (signal-value
                                                                       btor231)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state214
                                                                       (signal-value
                                                                        btor1207)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state212
                                                                        (signal-value
                                                                         btor251)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state199
                                                                         (signal-value
                                                                          btor198)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state164
                                                                          (signal-value
                                                                           btor179)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state162
                                                                           (signal-value
                                                                            btor1197)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state160
                                                                            (signal-value
                                                                             btor201)))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             'state154
                                                                             (signal-value
                                                                              btor122)))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              'state152
                                                                              (signal-value
                                                                               btor1187)))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               'state150
                                                                               (signal-value
                                                                                btor158)))
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
                                                                                  btor1179)))
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
                                                                                     btor1111)))
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
                                                                                        btor1106)))
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
          (list (cons 'state1076 (signal-value btor1075)))
          (append
           (list (cons 'state1043 (signal-value btor1058)))
           (append
            (list (cons 'state1041 (signal-value btor1282)))
            (append
             (list (cons 'state1039 (signal-value btor1078)))
             (append
              (list (cons 'state1036 (signal-value btor1035)))
              (append
               (list (cons 'state1003 (signal-value btor1018)))
               (append
                (list (cons 'state1001 (signal-value btor1277)))
                (append
                 (list (cons 'state999 (signal-value btor1038)))
                 (append
                  (list (cons 'state885 (signal-value btor314)))
                  (append
                   (list (cons 'state880 (signal-value btor299)))
                   (append
                    (list (cons 'state878 (signal-value btor1272)))
                    (append
                     (list (cons 'state876 (signal-value btor887)))
                     (append
                      (list (cons 'state871 (signal-value btor350)))
                      (append
                       (list (cons 'state866 (signal-value btor335)))
                       (append
                        (list (cons 'state864 (signal-value btor1267)))
                        (append
                         (list (cons 'state862 (signal-value btor873)))
                         (append
                          (list (cons 'state824 (signal-value btor823)))
                          (append
                           (list (cons 'state791 (signal-value btor806)))
                           (append
                            (list (cons 'state789 (signal-value btor1262)))
                            (append
                             (list (cons 'state787 (signal-value btor826)))
                             (append
                              (list (cons 'state767 (signal-value btor766)))
                              (append
                               (list (cons 'state734 (signal-value btor749)))
                               (append
                                (list (cons 'state732 (signal-value btor1257)))
                                (append
                                 (list (cons 'state730 (signal-value btor769)))
                                 (append
                                  (list
                                   (cons 'state724 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state722 (signal-value btor1253)))
                                   (append
                                    (list
                                     (cons 'state720 (signal-value btor728)))
                                    (append
                                     (list
                                      (cons 'state683 (signal-value btor665)))
                                     (append
                                      (list
                                       (cons 'state678 (signal-value btor648)))
                                      (append
                                       (list
                                        (cons
                                         'state676
                                         (signal-value btor1247)))
                                       (append
                                        (list
                                         (cons
                                          'state674
                                          (signal-value btor685)))
                                        (append
                                         (list
                                          (cons
                                           'state666
                                           (signal-value btor665)))
                                         (append
                                          (list
                                           (cons
                                            'state633
                                            (signal-value btor648)))
                                          (append
                                           (list
                                            (cons
                                             'state631
                                             (signal-value btor1242)))
                                           (append
                                            (list
                                             (cons
                                              'state629
                                              (signal-value btor668)))
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
                                                 (signal-value btor1237)))
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
                                                     (signal-value btor1232)))
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
                                                          btor1227)))
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
                                                              btor1222)))
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
                                                                 btor1218)))
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
                                                                    btor1213)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state265
                                                                    (signal-value
                                                                     btor273)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state249
                                                                     (signal-value
                                                                      btor248)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state216
                                                                      (signal-value
                                                                       btor231)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state214
                                                                       (signal-value
                                                                        btor1207)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state212
                                                                        (signal-value
                                                                         btor251)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state199
                                                                         (signal-value
                                                                          btor198)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state164
                                                                          (signal-value
                                                                           btor179)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state162
                                                                           (signal-value
                                                                            btor1197)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state160
                                                                            (signal-value
                                                                             btor201)))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             'state154
                                                                             (signal-value
                                                                              btor122)))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              'state152
                                                                              (signal-value
                                                                               btor1187)))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               'state150
                                                                               (signal-value
                                                                                btor158)))
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
                                                                                  btor1179)))
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
                                                                                     btor1111)))
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
                                                                                        btor1106)))
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
         (signal-value btor260)
         (append
          (list (cons 'state1076 (signal-value btor1075)))
          (append
           (list (cons 'state1043 (signal-value btor1058)))
           (append
            (list (cons 'state1041 (signal-value btor1282)))
            (append
             (list (cons 'state1039 (signal-value btor1078)))
             (append
              (list (cons 'state1036 (signal-value btor1035)))
              (append
               (list (cons 'state1003 (signal-value btor1018)))
               (append
                (list (cons 'state1001 (signal-value btor1277)))
                (append
                 (list (cons 'state999 (signal-value btor1038)))
                 (append
                  (list (cons 'state885 (signal-value btor314)))
                  (append
                   (list (cons 'state880 (signal-value btor299)))
                   (append
                    (list (cons 'state878 (signal-value btor1272)))
                    (append
                     (list (cons 'state876 (signal-value btor887)))
                     (append
                      (list (cons 'state871 (signal-value btor350)))
                      (append
                       (list (cons 'state866 (signal-value btor335)))
                       (append
                        (list (cons 'state864 (signal-value btor1267)))
                        (append
                         (list (cons 'state862 (signal-value btor873)))
                         (append
                          (list (cons 'state824 (signal-value btor823)))
                          (append
                           (list (cons 'state791 (signal-value btor806)))
                           (append
                            (list (cons 'state789 (signal-value btor1262)))
                            (append
                             (list (cons 'state787 (signal-value btor826)))
                             (append
                              (list (cons 'state767 (signal-value btor766)))
                              (append
                               (list (cons 'state734 (signal-value btor749)))
                               (append
                                (list (cons 'state732 (signal-value btor1257)))
                                (append
                                 (list (cons 'state730 (signal-value btor769)))
                                 (append
                                  (list
                                   (cons 'state724 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state722 (signal-value btor1253)))
                                   (append
                                    (list
                                     (cons 'state720 (signal-value btor728)))
                                    (append
                                     (list
                                      (cons 'state683 (signal-value btor665)))
                                     (append
                                      (list
                                       (cons 'state678 (signal-value btor648)))
                                      (append
                                       (list
                                        (cons
                                         'state676
                                         (signal-value btor1247)))
                                       (append
                                        (list
                                         (cons
                                          'state674
                                          (signal-value btor685)))
                                        (append
                                         (list
                                          (cons
                                           'state666
                                           (signal-value btor665)))
                                         (append
                                          (list
                                           (cons
                                            'state633
                                            (signal-value btor648)))
                                          (append
                                           (list
                                            (cons
                                             'state631
                                             (signal-value btor1242)))
                                           (append
                                            (list
                                             (cons
                                              'state629
                                              (signal-value btor668)))
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
                                                 (signal-value btor1237)))
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
                                                     (signal-value btor1232)))
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
                                                          btor1227)))
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
                                                              btor1222)))
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
                                                                 btor1218)))
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
                                                                    btor1213)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state265
                                                                    (signal-value
                                                                     btor273)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state249
                                                                     (signal-value
                                                                      btor248)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state216
                                                                      (signal-value
                                                                       btor231)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state214
                                                                       (signal-value
                                                                        btor1207)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state212
                                                                        (signal-value
                                                                         btor251)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state199
                                                                         (signal-value
                                                                          btor198)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state164
                                                                          (signal-value
                                                                           btor179)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state162
                                                                           (signal-value
                                                                            btor1197)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state160
                                                                            (signal-value
                                                                             btor201)))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             'state154
                                                                             (signal-value
                                                                              btor122)))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              'state152
                                                                              (signal-value
                                                                               btor1187)))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               'state150
                                                                               (signal-value
                                                                                btor158)))
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
                                                                                  btor1179)))
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
                                                                                     btor1111)))
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
                                                                                        btor1106)))
                                                                                     (append
                                                                                      (list
                                                                                       (cons
                                                                                        'state96
                                                                                        (signal-value
                                                                                         btor127)))
                                                                                      (list))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

