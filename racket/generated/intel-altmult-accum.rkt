;;; Note that this DSP has some parameters that are "baked in", and cannot be made symbolic. You can
;;; change them upon importing the code by setting --parameter flags.
;;;
;;; $LAKEROAD_DIR/bin/verilog_to_racket.py \
;;;   --infile ~/lakeroad-private/altera_mf/altera_mf_modified.v \
;;;   --top altmult_accum \
;;;   --parameter width_a=18 \
;;;   --parameter width_b=18 \
;;;   --parameter width_result=18 \
;;;   --function-name altmult-accum >> racket/generated/intel-altmult-accum.rkt
;;;
;;; With this version of the file:
;;; https://github.com/uwsampl/lakeroad-private/blob/1b0def3c6287409313bc06511a9d53728d5161db/altera_mf/altera_mf_modified.v
#lang racket/base
(provide intel-altmult-accum)
(require (file "/Users/gus/lakeroad/racket/signal.rkt"))
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
      #:unnamed-input-498
      (unnamed-input-498
       (bv->signal (constant 'unnamed-input-498 (bitvector 1))))
      #:unnamed-input-500
      (unnamed-input-500
       (bv->signal (constant 'unnamed-input-500 (bitvector 1))))
      #:unnamed-input-626
      (unnamed-input-626
       (bv->signal (constant 'unnamed-input-626 (bitvector 36))))
      #:unnamed-input-1164
      (unnamed-input-1164
       (bv->signal (constant 'unnamed-input-1164 (bitvector 35))))
      #:unnamed-input-1165
      (unnamed-input-1165
       (bv->signal (constant 'unnamed-input-1165 (bitvector 35))))
      #:unnamed-input-1167
      (unnamed-input-1167
       (bv->signal (constant 'unnamed-input-1167 (bitvector 35))))
      #:unnamed-input-1168
      (unnamed-input-1168
       (bv->signal (constant 'unnamed-input-1168 (bitvector 35))))
      #:unnamed-input-1174
      (unnamed-input-1174
       (bv->signal (constant 'unnamed-input-1174 (bitvector 35))))
      #:unnamed-input-1194
      (unnamed-input-1194
       (bv->signal (constant 'unnamed-input-1194 (bitvector 35))))
      #:unnamed-input-1245
      (unnamed-input-1245
       (bv->signal (constant 'unnamed-input-1245 (bitvector 1))))
      #:unnamed-input-1246
      (unnamed-input-1246
       (bv->signal (constant 'unnamed-input-1246 (bitvector 1))))
      #:unnamed-input-1256
      (unnamed-input-1256
       (bv->signal (constant 'unnamed-input-1256 (bitvector 1))))
      #:unnamed-input-1260
      (unnamed-input-1260
       (bv->signal (constant 'unnamed-input-1260 (bitvector 1))))
      #:unnamed-input-1268
      (unnamed-input-1268
       (bv->signal (constant 'unnamed-input-1268 (bitvector 1))))
      #:unnamed-input-1275
      (unnamed-input-1275
       (bv->signal (constant 'unnamed-input-1275 (bitvector 1))))
      #:unnamed-input-1276
      (unnamed-input-1276
       (bv->signal (constant 'unnamed-input-1276 (bitvector 1))))
      #:unnamed-input-1279
      (unnamed-input-1279
       (bv->signal (constant 'unnamed-input-1279 (bitvector 1)))))
    (let* ((merged-input-state-hash (list))
           (init-hash
            (append
             (list (cons 'state1057 (bv 1 (bitvector 1))))
             (append
              (list (cons 'state1055 (bv 0 (bitvector 1))))
              (append
               (list (cons 'state1053 (bv 0 (bitvector 1))))
               (append
                (list (cons 'state1017 (bv 1 (bitvector 1))))
                (append
                 (list (cons 'state1015 (bv 0 (bitvector 1))))
                 (append
                  (list (cons 'state1013 (bv 0 (bitvector 1))))
                  (append
                   (list (cons 'state894 (bv 1 (bitvector 1))))
                   (append
                    (list (cons 'state892 (bv 0 (bitvector 1))))
                    (append
                     (list (cons 'state890 (bv 0 (bitvector 1))))
                     (append
                      (list (cons 'state880 (bv 1 (bitvector 1))))
                      (append
                       (list (cons 'state878 (bv 0 (bitvector 1))))
                       (append
                        (list (cons 'state876 (bv 0 (bitvector 1))))
                        (append
                         (list (cons 'state805 (bv 1 (bitvector 1))))
                         (append
                          (list (cons 'state803 (bv 0 (bitvector 1))))
                          (append
                           (list (cons 'state801 (bv 0 (bitvector 1))))
                           (append
                            (list (cons 'state748 (bv 1 (bitvector 1))))
                            (append
                             (list (cons 'state746 (bv 0 (bitvector 1))))
                             (append
                              (list (cons 'state744 (bv 0 (bitvector 1))))
                              (append
                               (list (cons 'state738 (bv 1 (bitvector 1))))
                               (append
                                (list (cons 'state736 (bv 0 (bitvector 35))))
                                (append
                                 (list (cons 'state734 (bv 0 (bitvector 35))))
                                 (append
                                  (list (cons 'state728 (bv 1 (bitvector 1))))
                                  (append
                                   (list (cons 'state726 (bv 0 (bitvector 1))))
                                   (append
                                    (list
                                     (cons 'state724 (bv 0 (bitvector 1))))
                                    (append
                                     (list
                                      (cons 'state682 (bv 1 (bitvector 1))))
                                     (append
                                      (list
                                       (cons 'state680 (bv 0 (bitvector 36))))
                                      (append
                                       (list
                                        (cons 'state678 (bv 0 (bitvector 36))))
                                       (append
                                        (list
                                         (cons 'state637 (bv 1 (bitvector 1))))
                                        (append
                                         (list
                                          (cons
                                           'state635
                                           (bv 0 (bitvector 1))))
                                         (append
                                          (list
                                           (cons
                                            'state633
                                            (bv 0 (bitvector 1))))
                                          (append
                                           (list
                                            (cons
                                             'state572
                                             (bv 1 (bitvector 1))))
                                           (append
                                            (list
                                             (cons
                                              'state570
                                              (bv 0 (bitvector 1))))
                                            (append
                                             (list
                                              (cons
                                               'state568
                                               (bv 0 (bitvector 1))))
                                             (append
                                              (list
                                               (cons
                                                'state513
                                                (bv 1 (bitvector 1))))
                                              (append
                                               (list
                                                (cons
                                                 'state511
                                                 (bv 0 (bitvector 1))))
                                               (append
                                                (list
                                                 (cons
                                                  'state509
                                                  (bv 0 (bitvector 1))))
                                                (append
                                                 (list
                                                  (cons
                                                   'state406
                                                   (bv 1 (bitvector 1))))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state404
                                                    (bv 0 (bitvector 1))))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state402
                                                     (bv 0 (bitvector 1))))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state366
                                                      (bv 1 (bitvector 1))))
                                                    (append
                                                     (list
                                                      (cons
                                                       'state364
                                                       (bv 0 (bitvector 1))))
                                                     (append
                                                      (list
                                                       (cons
                                                        'state362
                                                        (bv 0 (bitvector 1))))
                                                      (append
                                                       (list
                                                        (cons
                                                         'state283
                                                         (bv 1 (bitvector 1))))
                                                       (append
                                                        (list
                                                         (cons
                                                          'state281
                                                          (bv
                                                           0
                                                           (bitvector 1))))
                                                        (append
                                                         (list
                                                          (cons
                                                           'state279
                                                           (bv
                                                            0
                                                            (bitvector 1))))
                                                         (append
                                                          (list
                                                           (cons
                                                            'state273
                                                            (bv
                                                             1
                                                             (bitvector 1))))
                                                          (append
                                                           (list
                                                            (cons
                                                             'state271
                                                             (bv
                                                              0
                                                              (bitvector 35))))
                                                           (append
                                                            (list
                                                             (cons
                                                              'state269
                                                              (bv
                                                               0
                                                               (bitvector
                                                                35))))
                                                            (append
                                                             (list
                                                              (cons
                                                               'state220
                                                               (bv
                                                                1
                                                                (bitvector
                                                                 1))))
                                                             (append
                                                              (list
                                                               (cons
                                                                'state218
                                                                (bv
                                                                 0
                                                                 (bitvector
                                                                  18))))
                                                              (append
                                                               (list
                                                                (cons
                                                                 'state216
                                                                 (bv
                                                                  0
                                                                  (bitvector
                                                                   18))))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  'state168
                                                                  (bv
                                                                   1
                                                                   (bitvector
                                                                    1))))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   'state166
                                                                   (bv
                                                                    0
                                                                    (bitvector
                                                                     18))))
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
                                                                     'state157
                                                                     (bv
                                                                      0
                                                                      (bitvector
                                                                       1))))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state149
                                                                      (bv
                                                                       0
                                                                       (bitvector
                                                                        1))))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state141
                                                                       (bv
                                                                        1
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
                                                                         'state137
                                                                         (bv
                                                                          0
                                                                          (bitvector
                                                                           1))))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state105
                                                                          (bv
                                                                           1
                                                                           (bitvector
                                                                            1))))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state102
                                                                           (bv
                                                                            0
                                                                            (bitvector
                                                                             1))))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state100
                                                                            (bv
                                                                             0
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
           (btor95
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state95)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state95)))
                     ((assoc-has-key? init-hash 'state95)
                      (bv->signal (assoc-ref init-hash 'state95)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
           (btor97 (bv->signal (bv 0 (bitvector 1))))
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
           (btor100
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state100)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state100)))
                     ((assoc-has-key? init-hash 'state100)
                      (bv->signal (assoc-ref init-hash 'state100)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor102
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state102)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state102)))
                     ((assoc-has-key? init-hash 'state102)
                      (bv->signal (assoc-ref init-hash 'state102)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor104 (bv->signal (bv 1 (bitvector 1))))
           (btor105
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state105)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state105)))
                     ((assoc-has-key? init-hash 'state105)
                      (bv->signal (assoc-ref init-hash 'state105)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor107 (bitvector 4))
           (btor108 (bv->signal (bv 9 (bitvector 4))))
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
            (if (bitvector->bool (signal-value btor110)) btor36 btor97))
           (btor112 (bv->signal (bv 8 (bitvector 4))))
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
            (if (bitvector->bool (signal-value btor114)) btor35 btor111))
           (btor116 (bv->signal (bv 7 (bitvector 3))))
           (btor117
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor118
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor117)))
             (list)))
           (btor119
            (if (bitvector->bool (signal-value btor118)) btor34 btor115))
           (btor120 (bv->signal (bv 23 (bitvector 5))))
           (btor121
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor120)))
             (list)))
           (btor122
            (if (bitvector->bool (signal-value btor121)) btor97 btor119))
           (btor123 (bv->signal (bv 6 (bitvector 3))))
           (btor124
            (bv->signal
             (zero-extend (signal-value btor123) (bitvector 5))
             btor123))
           (btor125
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor124)))
             (list)))
           (btor126
            (if (bitvector->bool (signal-value btor125)) btor33 btor122))
           (btor127 (bitvector 2))
           (btor128
            (signal
             (concat (signal-value btor126) (signal-value btor105))
             (list)))
           (btor129 (bv->signal (bv 2 (bitvector 2))))
           (btor130
            (signal
             (bool->bitvector
              (bveq (signal-value btor128) (signal-value btor129)))
             (list)))
           (btor131
            (if (bitvector->bool (signal-value btor130)) btor102 btor100))
           (btor132
            (signal
             (concat (signal-value btor131) (signal-value btor98))
             (list)))
           (btor133 (bv->signal (bv 1 (bitvector 2))))
           (btor134
            (signal
             (bool->bitvector
              (bveq (signal-value btor132) (signal-value btor133)))
             (list)))
           (btor135
            (if (bitvector->bool (signal-value btor134)) btor96 btor95))
           (btor137
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state137)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state137)))
                     ((assoc-has-key? init-hash 'state137)
                      (bv->signal (assoc-ref init-hash 'state137)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
            (signal
             (concat (signal-value btor126) (signal-value btor141))
             (list)))
           (btor144
            (signal
             (bool->bitvector
              (bveq (signal-value btor143) (signal-value btor129)))
             (list)))
           (btor145
            (if (bitvector->bool (signal-value btor144)) btor139 btor137))
           (btor147
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state147)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state147)))
                     ((assoc-has-key? init-hash 'state147)
                      (bv->signal (assoc-ref init-hash 'state147)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor148
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state148)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state148)))
                     ((assoc-has-key? init-hash 'state148)
                      (bv->signal (assoc-ref init-hash 'state148)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor149
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state149)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state149)))
                     ((assoc-has-key? init-hash 'state149)
                      (bv->signal (assoc-ref init-hash 'state149)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor151
            (signal
             (concat (signal-value btor131) (signal-value btor149))
             (list)))
           (btor152
            (signal
             (bool->bitvector
              (bveq (signal-value btor151) (signal-value btor133)))
             (list)))
           (btor153
            (if (bitvector->bool (signal-value btor152)) btor148 btor147))
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
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor156
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state156)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state156)))
                     ((assoc-has-key? init-hash 'state156)
                      (bv->signal (assoc-ref init-hash 'state156)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor157
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state157)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state157)))
                     ((assoc-has-key? init-hash 'state157)
                      (bv->signal (assoc-ref init-hash 'state157)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor159
            (signal
             (concat (signal-value btor131) (signal-value btor157))
             (list)))
           (btor160
            (signal
             (bool->bitvector
              (bveq (signal-value btor159) (signal-value btor133)))
             (list)))
           (btor161
            (if (bitvector->bool (signal-value btor160)) btor156 btor155))
           (btor163 (bv->signal (bv 0 (bitvector 18))))
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
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor168
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state168)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state168)))
                     ((assoc-has-key? init-hash 'state168)
                      (bv->signal (assoc-ref init-hash 'state168)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor170
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor171
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor170)))
             (list)))
           (btor172
            (if (bitvector->bool (signal-value btor171)) btor36 btor97))
           (btor173
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor174
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor173)))
             (list)))
           (btor175
            (if (bitvector->bool (signal-value btor174)) btor35 btor172))
           (btor176
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor177
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor176)))
             (list)))
           (btor178
            (if (bitvector->bool (signal-value btor177)) btor34 btor175))
           (btor179
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor120)))
             (list)))
           (btor180
            (if (bitvector->bool (signal-value btor179)) btor97 btor178))
           (btor181
            (bv->signal
             (zero-extend (signal-value btor123) (bitvector 5))
             btor123))
           (btor182
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor181)))
             (list)))
           (btor183
            (if (bitvector->bool (signal-value btor182)) btor33 btor180))
           (btor184
            (signal
             (concat (signal-value btor183) (signal-value btor168))
             (list)))
           (btor185
            (signal
             (bool->bitvector
              (bveq (signal-value btor184) (signal-value btor129)))
             (list)))
           (btor186
            (if (bitvector->bool (signal-value btor185)) btor166 btor164))
           (btor187
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 5))
             btor129))
           (btor188
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor187)))
             (list)))
           (btor189
            (if (bitvector->bool (signal-value btor188)) btor26 btor97))
           (btor190
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor191
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor190)))
             (list)))
           (btor192
            (if (bitvector->bool (signal-value btor191)) btor25 btor189))
           (btor193
            (signal
             (apply bvor (bitvector->bits (signal-value btor53)))
             (signal-state btor53)))
           (btor194 (signal (bvnot (signal-value btor193)) (list)))
           (btor195
            (if (bitvector->bool (signal-value btor194)) btor24 btor192))
           (btor196 (bv->signal (bv 25 (bitvector 5))))
           (btor197
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor196)))
             (list)))
           (btor198
            (if (bitvector->bool (signal-value btor197)) btor97 btor195))
           (btor199 (bv->signal (bv 3 (bitvector 2))))
           (btor200
            (bv->signal
             (zero-extend (signal-value btor199) (bitvector 5))
             btor199))
           (btor201
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor200)))
             (list)))
           (btor202
            (if (bitvector->bool (signal-value btor201)) btor27 btor198))
           (btor203
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state203)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state203)))
                     ((assoc-has-key? init-hash 'state203)
                      (bv->signal (assoc-ref init-hash 'state203)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor204
            (signal
             (bvor (signal-value btor202) (signal-value btor203))
             (list)))
           (btor205
            (if (bitvector->bool (signal-value btor204)) btor163 btor186))
           (btor206 (bv->signal (bv 17 (bitvector 5))))
           (btor207
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor206)))
             (list)))
           (btor208
            (signal
             (bvor (signal-value btor207) (signal-value btor93))
             (list)))
           (btor209
            (if (bitvector->bool (signal-value btor208)) btor81 btor43))
           (btor210 (bv->signal (bv 10 (bitvector 4))))
           (btor211
            (bv->signal
             (zero-extend (signal-value btor210) (bitvector 5))
             btor210))
           (btor212
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor211)))
             (list)))
           (btor213
            (if (bitvector->bool (signal-value btor212)) btor43 btor209))
           (btor214
            (if (bitvector->bool (signal-value btor179)) btor213 btor205))
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
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor220
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state220)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state220)))
                     ((assoc-has-key? init-hash 'state220)
                      (bv->signal (assoc-ref init-hash 'state220)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor222
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor223
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor222)))
             (list)))
           (btor224
            (if (bitvector->bool (signal-value btor223)) btor36 btor97))
           (btor225
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor226
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor225)))
             (list)))
           (btor227
            (if (bitvector->bool (signal-value btor226)) btor35 btor224))
           (btor228
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor229
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor228)))
             (list)))
           (btor230
            (if (bitvector->bool (signal-value btor229)) btor34 btor227))
           (btor231
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor120)))
             (list)))
           (btor232
            (if (bitvector->bool (signal-value btor231)) btor97 btor230))
           (btor233
            (bv->signal
             (zero-extend (signal-value btor123) (bitvector 5))
             btor123))
           (btor234
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor233)))
             (list)))
           (btor235
            (if (bitvector->bool (signal-value btor234)) btor33 btor232))
           (btor236
            (signal
             (concat (signal-value btor235) (signal-value btor220))
             (list)))
           (btor237
            (signal
             (bool->bitvector
              (bveq (signal-value btor236) (signal-value btor129)))
             (list)))
           (btor238
            (if (bitvector->bool (signal-value btor237)) btor218 btor216))
           (btor239
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 5))
             btor129))
           (btor240
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor239)))
             (list)))
           (btor241
            (if (bitvector->bool (signal-value btor240)) btor26 btor97))
           (btor242
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor243
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor242)))
             (list)))
           (btor244
            (if (bitvector->bool (signal-value btor243)) btor25 btor241))
           (btor245
            (signal
             (apply bvor (bitvector->bits (signal-value btor54)))
             (signal-state btor54)))
           (btor246 (signal (bvnot (signal-value btor245)) (list)))
           (btor247
            (if (bitvector->bool (signal-value btor246)) btor24 btor244))
           (btor248
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor196)))
             (list)))
           (btor249
            (if (bitvector->bool (signal-value btor248)) btor97 btor247))
           (btor250
            (bv->signal
             (zero-extend (signal-value btor199) (bitvector 5))
             btor199))
           (btor251
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor250)))
             (list)))
           (btor252
            (if (bitvector->bool (signal-value btor251)) btor27 btor249))
           (btor253
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state253)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state253)))
                     ((assoc-has-key? init-hash 'state253)
                      (bv->signal (assoc-ref init-hash 'state253)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor254
            (signal
             (bvor (signal-value btor252) (signal-value btor253))
             (list)))
           (btor255
            (if (bitvector->bool (signal-value btor254)) btor163 btor238))
           (btor256 (bv->signal (bv 18 (bitvector 5))))
           (btor257
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor256)))
             (list)))
           (btor258
            (signal
             (bvor (signal-value btor257) (signal-value btor94))
             (list)))
           (btor259
            (if (bitvector->bool (signal-value btor258)) btor82 btor44))
           (btor260 (bv->signal (bv 11 (bitvector 4))))
           (btor261
            (bv->signal
             (zero-extend (signal-value btor260) (bitvector 5))
             btor260))
           (btor262
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor261)))
             (list)))
           (btor263
            (if (bitvector->bool (signal-value btor262)) btor44 btor259))
           (btor264
            (if (bitvector->bool (signal-value btor231)) btor263 btor255))
           (btor266
            (bv->signal
             (zero-extend (signal-value btor135) (bitvector 1))
             btor135))
           (btor267 (bitvector 35))
           (btor268 (bv->signal (bv 0 (bitvector 35))))
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
                          (bv 0 35))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor271
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state271)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state271)))
                     ((assoc-has-key? init-hash 'state271)
                      (bv->signal (assoc-ref init-hash 'state271)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 35))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor273
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state273)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state273)))
                     ((assoc-has-key? init-hash 'state273)
                      (bv->signal (assoc-ref init-hash 'state273)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor275
            (signal
             (concat (signal-value btor126) (signal-value btor273))
             (list)))
           (btor276
            (signal
             (bool->bitvector
              (bveq (signal-value btor275) (signal-value btor129)))
             (list)))
           (btor277
            (if (bitvector->bool (signal-value btor276)) btor271 btor269))
           (btor278
            (bv->signal
             (zero-extend (signal-value btor277) (bitvector 35))
             btor277))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state281)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state281)))
                     ((assoc-has-key? init-hash 'state281)
                      (bv->signal (assoc-ref init-hash 'state281)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor283
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state283)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state283)))
                     ((assoc-has-key? init-hash 'state283)
                      (bv->signal (assoc-ref init-hash 'state283)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor285
            (signal
             (concat (signal-value btor126) (signal-value btor283))
             (list)))
           (btor286
            (signal
             (bool->bitvector
              (bveq (signal-value btor285) (signal-value btor129)))
             (list)))
           (btor287
            (if (bitvector->bool (signal-value btor286)) btor281 btor279))
           (btor288
            (bv->signal
             (zero-extend (signal-value btor287) (bitvector 1))
             btor287))
           (btor289
            (bv->signal
             (zero-extend (signal-value btor19) (bitvector 1))
             btor19))
           (btor290
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor291
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor290)))
             (list)))
           (btor292
            (if (bitvector->bool (signal-value btor291)) btor36 btor97))
           (btor293
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor294
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor293)))
             (list)))
           (btor295
            (if (bitvector->bool (signal-value btor294)) btor35 btor292))
           (btor296
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor297
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor296)))
             (list)))
           (btor298
            (if (bitvector->bool (signal-value btor297)) btor34 btor295))
           (btor299
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor120)))
             (list)))
           (btor300
            (if (bitvector->bool (signal-value btor299)) btor97 btor298))
           (btor301
            (bv->signal
             (zero-extend (signal-value btor123) (bitvector 5))
             btor123))
           (btor302
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor301)))
             (list)))
           (btor303
            (if (bitvector->bool (signal-value btor302)) btor33 btor300))
           (btor304
            (bv->signal
             (zero-extend (signal-value btor303) (bitvector 1))
             btor303))
           (btor305
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 5))
             btor129))
           (btor306
            (signal
             (bool->bitvector
              (bveq (signal-value btor21) (signal-value btor305)))
             (list)))
           (btor307
            (if (bitvector->bool (signal-value btor306)) btor26 btor97))
           (btor308
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor309
            (signal
             (bool->bitvector
              (bveq (signal-value btor21) (signal-value btor308)))
             (list)))
           (btor310
            (if (bitvector->bool (signal-value btor309)) btor25 btor307))
           (btor311
            (signal
             (apply bvor (bitvector->bits (signal-value btor21)))
             (signal-state btor21)))
           (btor312 (signal (bvnot (signal-value btor311)) (list)))
           (btor313
            (if (bitvector->bool (signal-value btor312)) btor24 btor310))
           (btor314
            (signal
             (bool->bitvector
              (bveq (signal-value btor21) (signal-value btor196)))
             (list)))
           (btor315
            (if (bitvector->bool (signal-value btor314)) btor97 btor313))
           (btor316
            (bv->signal
             (zero-extend (signal-value btor199) (bitvector 5))
             btor199))
           (btor317
            (signal
             (bool->bitvector
              (bveq (signal-value btor21) (signal-value btor316)))
             (list)))
           (btor318
            (if (bitvector->bool (signal-value btor317)) btor27 btor315))
           (btor319
            (bv->signal
             (zero-extend (signal-value btor318) (bitvector 1))
             btor318))
           (btor320
            (if (bitvector->bool (signal-value btor291)) btor52 btor104))
           (btor321
            (if (bitvector->bool (signal-value btor294)) btor51 btor320))
           (btor322
            (if (bitvector->bool (signal-value btor297)) btor50 btor321))
           (btor323
            (if (bitvector->bool (signal-value btor299)) btor104 btor322))
           (btor324
            (if (bitvector->bool (signal-value btor302)) btor49 btor323))
           (btor325
            (bv->signal
             (zero-extend (signal-value btor324) (bitvector 1))
             btor324))
           (btor326
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor327
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor326)))
             (list)))
           (btor328
            (if (bitvector->bool (signal-value btor327)) btor36 btor97))
           (btor329
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor330
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor329)))
             (list)))
           (btor331
            (if (bitvector->bool (signal-value btor330)) btor35 btor328))
           (btor332
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor333
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor332)))
             (list)))
           (btor334
            (if (bitvector->bool (signal-value btor333)) btor34 btor331))
           (btor335
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor120)))
             (list)))
           (btor336
            (if (bitvector->bool (signal-value btor335)) btor97 btor334))
           (btor337
            (bv->signal
             (zero-extend (signal-value btor123) (bitvector 5))
             btor123))
           (btor338
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor337)))
             (list)))
           (btor339
            (if (bitvector->bool (signal-value btor338)) btor33 btor336))
           (btor340
            (bv->signal
             (zero-extend (signal-value btor339) (bitvector 1))
             btor339))
           (btor341
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 5))
             btor129))
           (btor342
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor341)))
             (list)))
           (btor343
            (if (bitvector->bool (signal-value btor342)) btor26 btor97))
           (btor344
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor345
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor344)))
             (list)))
           (btor346
            (if (bitvector->bool (signal-value btor345)) btor25 btor343))
           (btor347
            (signal
             (apply bvor (bitvector->bits (signal-value btor20)))
             (signal-state btor20)))
           (btor348 (signal (bvnot (signal-value btor347)) (list)))
           (btor349
            (if (bitvector->bool (signal-value btor348)) btor24 btor346))
           (btor350
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor196)))
             (list)))
           (btor351
            (if (bitvector->bool (signal-value btor350)) btor97 btor349))
           (btor352
            (bv->signal
             (zero-extend (signal-value btor199) (bitvector 5))
             btor199))
           (btor353
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor352)))
             (list)))
           (btor354
            (if (bitvector->bool (signal-value btor353)) btor27 btor351))
           (btor355
            (bv->signal
             (zero-extend (signal-value btor354) (bitvector 1))
             btor354))
           (btor356
            (if (bitvector->bool (signal-value btor327)) btor52 btor104))
           (btor357
            (if (bitvector->bool (signal-value btor330)) btor51 btor356))
           (btor358
            (if (bitvector->bool (signal-value btor333)) btor50 btor357))
           (btor359
            (if (bitvector->bool (signal-value btor335)) btor104 btor358))
           (btor360
            (if (bitvector->bool (signal-value btor338)) btor49 btor359))
           (btor361
            (bv->signal
             (zero-extend (signal-value btor360) (bitvector 1))
             btor360))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state364)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state364)))
                     ((assoc-has-key? init-hash 'state364)
                      (bv->signal (assoc-ref init-hash 'state364)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor366
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state366)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state366)))
                     ((assoc-has-key? init-hash 'state366)
                      (bv->signal (assoc-ref init-hash 'state366)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor368
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor369
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor368)))
             (list)))
           (btor370
            (if (bitvector->bool (signal-value btor369)) btor36 btor97))
           (btor371
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor372
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor371)))
             (list)))
           (btor373
            (if (bitvector->bool (signal-value btor372)) btor35 btor370))
           (btor374
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor375
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor374)))
             (list)))
           (btor376
            (if (bitvector->bool (signal-value btor375)) btor34 btor373))
           (btor377
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor120)))
             (list)))
           (btor378
            (if (bitvector->bool (signal-value btor377)) btor97 btor376))
           (btor379
            (bv->signal
             (zero-extend (signal-value btor123) (bitvector 5))
             btor123))
           (btor380
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor379)))
             (list)))
           (btor381
            (if (bitvector->bool (signal-value btor380)) btor33 btor378))
           (btor382
            (signal
             (concat (signal-value btor381) (signal-value btor366))
             (list)))
           (btor383
            (signal
             (bool->bitvector
              (bveq (signal-value btor382) (signal-value btor129)))
             (list)))
           (btor384
            (if (bitvector->bool (signal-value btor383)) btor364 btor362))
           (btor385
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 5))
             btor129))
           (btor386
            (signal
             (bool->bitvector
              (bveq (signal-value btor30) (signal-value btor385)))
             (list)))
           (btor387
            (if (bitvector->bool (signal-value btor386)) btor26 btor97))
           (btor388
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor389
            (signal
             (bool->bitvector
              (bveq (signal-value btor30) (signal-value btor388)))
             (list)))
           (btor390
            (if (bitvector->bool (signal-value btor389)) btor25 btor387))
           (btor391
            (signal
             (apply bvor (bitvector->bits (signal-value btor30)))
             (signal-state btor30)))
           (btor392 (signal (bvnot (signal-value btor391)) (list)))
           (btor393
            (if (bitvector->bool (signal-value btor392)) btor24 btor390))
           (btor394
            (signal
             (bool->bitvector
              (bveq (signal-value btor30) (signal-value btor196)))
             (list)))
           (btor395
            (if (bitvector->bool (signal-value btor394)) btor97 btor393))
           (btor396
            (bv->signal
             (zero-extend (signal-value btor199) (bitvector 5))
             btor199))
           (btor397
            (signal
             (bool->bitvector
              (bveq (signal-value btor30) (signal-value btor396)))
             (list)))
           (btor398
            (if (bitvector->bool (signal-value btor397)) btor27 btor395))
           (btor399
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state399)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state399)))
                     ((assoc-has-key? init-hash 'state399)
                      (bv->signal (assoc-ref init-hash 'state399)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor400
            (signal
             (bvor (signal-value btor398) (signal-value btor399))
             (list)))
           (btor401
            (if (bitvector->bool (signal-value btor400)) btor97 btor384))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state404)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state404)))
                     ((assoc-has-key? init-hash 'state404)
                      (bv->signal (assoc-ref init-hash 'state404)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor406
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state406)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state406)))
                     ((assoc-has-key? init-hash 'state406)
                      (bv->signal (assoc-ref init-hash 'state406)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor408
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor409
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor408)))
             (list)))
           (btor410
            (if (bitvector->bool (signal-value btor409)) btor36 btor97))
           (btor411
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor412
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor411)))
             (list)))
           (btor413
            (if (bitvector->bool (signal-value btor412)) btor35 btor410))
           (btor414
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor415
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor414)))
             (list)))
           (btor416
            (if (bitvector->bool (signal-value btor415)) btor34 btor413))
           (btor417
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor120)))
             (list)))
           (btor418
            (if (bitvector->bool (signal-value btor417)) btor97 btor416))
           (btor419
            (bv->signal
             (zero-extend (signal-value btor123) (bitvector 5))
             btor123))
           (btor420
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor419)))
             (list)))
           (btor421
            (if (bitvector->bool (signal-value btor420)) btor33 btor418))
           (btor422
            (signal
             (concat (signal-value btor421) (signal-value btor406))
             (list)))
           (btor423
            (signal
             (bool->bitvector
              (bveq (signal-value btor422) (signal-value btor129)))
             (list)))
           (btor424
            (if (bitvector->bool (signal-value btor423)) btor404 btor402))
           (btor425
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 5))
             btor129))
           (btor426
            (signal
             (bool->bitvector
              (bveq (signal-value btor29) (signal-value btor425)))
             (list)))
           (btor427
            (if (bitvector->bool (signal-value btor426)) btor26 btor97))
           (btor428
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor429
            (signal
             (bool->bitvector
              (bveq (signal-value btor29) (signal-value btor428)))
             (list)))
           (btor430
            (if (bitvector->bool (signal-value btor429)) btor25 btor427))
           (btor431
            (signal
             (apply bvor (bitvector->bits (signal-value btor29)))
             (signal-state btor29)))
           (btor432 (signal (bvnot (signal-value btor431)) (list)))
           (btor433
            (if (bitvector->bool (signal-value btor432)) btor24 btor430))
           (btor434
            (signal
             (bool->bitvector
              (bveq (signal-value btor29) (signal-value btor196)))
             (list)))
           (btor435
            (if (bitvector->bool (signal-value btor434)) btor97 btor433))
           (btor436
            (bv->signal
             (zero-extend (signal-value btor199) (bitvector 5))
             btor199))
           (btor437
            (signal
             (bool->bitvector
              (bveq (signal-value btor29) (signal-value btor436)))
             (list)))
           (btor438
            (if (bitvector->bool (signal-value btor437)) btor27 btor435))
           (btor439
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state439)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state439)))
                     ((assoc-has-key? init-hash 'state439)
                      (bv->signal (assoc-ref init-hash 'state439)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor440
            (signal
             (bvor (signal-value btor438) (signal-value btor439))
             (list)))
           (btor441
            (if (bitvector->bool (signal-value btor440)) btor97 btor424))
           (btor442
            (if (bitvector->bool (signal-value btor417)) btor28 btor441))
           (btor443
            (if (bitvector->bool (signal-value btor377)) btor442 btor401))
           (btor444 (bv->signal (bv 4 (bitvector 3))))
           (btor445
            (bv->signal
             (zero-extend (signal-value btor444) (bitvector 5))
             btor444))
           (btor446
            (signal
             (bool->bitvector
              (bveq (signal-value btor2) (signal-value btor445)))
             (list)))
           (btor447
            (if (bitvector->bool (signal-value btor446)) btor104 btor97))
           (btor448 (bv->signal (bv 15 (bitvector 4))))
           (btor449
            (bv->signal
             (zero-extend (signal-value btor448) (bitvector 5))
             btor448))
           (btor450
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor449)))
             (list)))
           (btor451
            (if (bitvector->bool (signal-value btor450)) btor447 btor443))
           (btor452 (bv->signal (bv 16 (bitvector 5))))
           (btor453
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor452)))
             (list)))
           (btor454
            (if (bitvector->bool (signal-value btor453)) btor443 btor451))
           (btor455
            (bv->signal
             (zero-extend (signal-value btor454) (bitvector 1))
             btor454))
           (btor456
            (bv->signal
             (zero-extend (signal-value btor442) (bitvector 1))
             btor442))
           (btor457
            (bv->signal
             (zero-extend (signal-value btor401) (bitvector 1))
             btor401))
           (btor458
            (bv->signal
             (zero-extend (signal-value btor443) (bitvector 1))
             btor443))
           (btor459
            (bv->signal
             (zero-extend (signal-value btor381) (bitvector 1))
             btor381))
           (btor460
            (bv->signal
             (zero-extend (signal-value btor398) (bitvector 1))
             btor398))
           (btor461
            (if (bitvector->bool (signal-value btor369)) btor52 btor104))
           (btor462
            (if (bitvector->bool (signal-value btor372)) btor51 btor461))
           (btor463
            (if (bitvector->bool (signal-value btor375)) btor50 btor462))
           (btor464
            (if (bitvector->bool (signal-value btor377)) btor104 btor463))
           (btor465
            (if (bitvector->bool (signal-value btor380)) btor49 btor464))
           (btor466
            (bv->signal
             (zero-extend (signal-value btor465) (bitvector 1))
             btor465))
           (btor467
            (bv->signal
             (zero-extend (signal-value btor441) (bitvector 1))
             btor441))
           (btor468
            (bv->signal
             (zero-extend (signal-value btor442) (bitvector 1))
             btor442))
           (btor469
            (bv->signal
             (zero-extend (signal-value btor421) (bitvector 1))
             btor421))
           (btor470
            (bv->signal
             (zero-extend (signal-value btor438) (bitvector 1))
             btor438))
           (btor471
            (if (bitvector->bool (signal-value btor409)) btor52 btor104))
           (btor472
            (if (bitvector->bool (signal-value btor412)) btor51 btor471))
           (btor473
            (if (bitvector->bool (signal-value btor415)) btor50 btor472))
           (btor474
            (if (bitvector->bool (signal-value btor417)) btor104 btor473))
           (btor475
            (if (bitvector->bool (signal-value btor420)) btor49 btor474))
           (btor476
            (bv->signal
             (zero-extend (signal-value btor475) (bitvector 1))
             btor475))
           (btor477
            (bv->signal
             (zero-extend (signal-value btor131) (bitvector 1))
             btor131))
           (btor478 (bitvector 32))
           (btor479 (bv->signal (bv 0 (bitvector 32))))
           (btor480
            (bv->signal
             (zero-extend (signal-value btor479) (bitvector 32))
             btor479))
           (btor481
            (bv->signal
             (zero-extend (signal-value btor479) (bitvector 32))
             btor479))
           (btor482
            (bv->signal
             (zero-extend (signal-value btor183) (bitvector 1))
             btor183))
           (btor483
            (bv->signal
             (zero-extend (signal-value btor202) (bitvector 1))
             btor202))
           (btor484
            (if (bitvector->bool (signal-value btor171)) btor52 btor104))
           (btor485
            (if (bitvector->bool (signal-value btor174)) btor51 btor484))
           (btor486
            (if (bitvector->bool (signal-value btor177)) btor50 btor485))
           (btor487
            (if (bitvector->bool (signal-value btor179)) btor104 btor486))
           (btor488
            (if (bitvector->bool (signal-value btor182)) btor49 btor487))
           (btor489
            (bv->signal
             (zero-extend (signal-value btor488) (bitvector 1))
             btor488))
           (btor490
            (bv->signal
             (zero-extend (signal-value btor235) (bitvector 1))
             btor235))
           (btor491
            (bv->signal
             (zero-extend (signal-value btor252) (bitvector 1))
             btor252))
           (btor492
            (if (bitvector->bool (signal-value btor223)) btor52 btor104))
           (btor493
            (if (bitvector->bool (signal-value btor226)) btor51 btor492))
           (btor494
            (if (bitvector->bool (signal-value btor229)) btor50 btor493))
           (btor495
            (if (bitvector->bool (signal-value btor231)) btor104 btor494))
           (btor496
            (if (bitvector->bool (signal-value btor234)) btor49 btor495))
           (btor497
            (bv->signal
             (zero-extend (signal-value btor496) (bitvector 1))
             btor496))
           (btor498 unnamed-input-498)
           (btor499
            (bv->signal
             (zero-extend (signal-value btor498) (bitvector 1))
             btor498))
           (btor500 unnamed-input-500)
           (btor501
            (bv->signal
             (zero-extend (signal-value btor500) (bitvector 1))
             btor500))
           (btor502 (bitvector 21))
           (btor503 (bv->signal (bv 0 (bitvector 21))))
           (btor504
            (bv->signal
             (zero-extend (signal-value btor503) (bitvector 21))
             btor503))
           (btor505 (signal (bvnot (signal-value btor214)) (list)))
           (btor506
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 18))
             btor104))
           (btor507
            (signal
             (bvadd (signal-value btor505) (signal-value btor506))
             (list)))
           (btor508
            (signal
             (extract 17 17 (signal-value btor214))
             (signal-state btor214)))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state511)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state511)))
                     ((assoc-has-key? init-hash 'state511)
                      (bv->signal (assoc-ref init-hash 'state511)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor516
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor515)))
             (list)))
           (btor517
            (if (bitvector->bool (signal-value btor516)) btor36 btor97))
           (btor518
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor519
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor518)))
             (list)))
           (btor520
            (if (bitvector->bool (signal-value btor519)) btor35 btor517))
           (btor521
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor522
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor521)))
             (list)))
           (btor523
            (if (bitvector->bool (signal-value btor522)) btor34 btor520))
           (btor524
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor120)))
             (list)))
           (btor525
            (if (bitvector->bool (signal-value btor524)) btor97 btor523))
           (btor526
            (bv->signal
             (zero-extend (signal-value btor123) (bitvector 5))
             btor123))
           (btor527
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor526)))
             (list)))
           (btor528
            (if (bitvector->bool (signal-value btor527)) btor33 btor525))
           (btor529
            (signal
             (concat (signal-value btor528) (signal-value btor513))
             (list)))
           (btor530
            (signal
             (bool->bitvector
              (bveq (signal-value btor529) (signal-value btor129)))
             (list)))
           (btor531
            (if (bitvector->bool (signal-value btor530)) btor511 btor509))
           (btor532
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 5))
             btor129))
           (btor533
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor532)))
             (list)))
           (btor534
            (if (bitvector->bool (signal-value btor533)) btor26 btor97))
           (btor535
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor536
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor535)))
             (list)))
           (btor537
            (if (bitvector->bool (signal-value btor536)) btor25 btor534))
           (btor538
            (signal
             (apply bvor (bitvector->bits (signal-value btor83)))
             (signal-state btor83)))
           (btor539 (signal (bvnot (signal-value btor538)) (list)))
           (btor540
            (if (bitvector->bool (signal-value btor539)) btor24 btor537))
           (btor541
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor196)))
             (list)))
           (btor542
            (if (bitvector->bool (signal-value btor541)) btor97 btor540))
           (btor543
            (bv->signal
             (zero-extend (signal-value btor199) (bitvector 5))
             btor199))
           (btor544
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor543)))
             (list)))
           (btor545
            (if (bitvector->bool (signal-value btor544)) btor27 btor542))
           (btor546
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state546)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state546)))
                     ((assoc-has-key? init-hash 'state546)
                      (bv->signal (assoc-ref init-hash 'state546)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor547
            (signal
             (bvor (signal-value btor545) (signal-value btor546))
             (list)))
           (btor548
            (if (bitvector->bool (signal-value btor547)) btor97 btor531))
           (btor549
            (if (bitvector->bool (signal-value btor524)) btor91 btor548))
           (btor550 (bv->signal (bv 19 (bitvector 5))))
           (btor551
            (signal
             (bool->bitvector
              (bveq (signal-value btor79) (signal-value btor550)))
             (list)))
           (btor552
            (if (bitvector->bool (signal-value btor551)) btor104 btor97))
           (btor553
            (bv->signal
             (zero-extend (signal-value btor448) (bitvector 5))
             btor448))
           (btor554
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor553)))
             (list)))
           (btor555
            (if (bitvector->bool (signal-value btor554)) btor552 btor549))
           (btor556
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor452)))
             (list)))
           (btor557
            (if (bitvector->bool (signal-value btor556)) btor549 btor555))
           (btor558
            (signal
             (bvand (signal-value btor508) (signal-value btor557))
             (list)))
           (btor559
            (if (bitvector->bool (signal-value btor558)) btor507 btor214))
           (btor560
            (bv->signal
             (zero-extend (signal-value btor559) (bitvector 18))
             btor559))
           (btor561
            (bv->signal
             (zero-extend (signal-value btor205) (bitvector 18))
             btor205))
           (btor562
            (bv->signal
             (zero-extend (signal-value btor213) (bitvector 18))
             btor213))
           (btor563
            (bv->signal
             (zero-extend (signal-value btor214) (bitvector 18))
             btor214))
           (btor564 (signal (bvnot (signal-value btor264)) (list)))
           (btor565
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 18))
             btor104))
           (btor566
            (signal
             (bvadd (signal-value btor564) (signal-value btor565))
             (list)))
           (btor567
            (signal
             (extract 17 17 (signal-value btor264))
             (signal-state btor264)))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state570)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state570)))
                     ((assoc-has-key? init-hash 'state570)
                      (bv->signal (assoc-ref init-hash 'state570)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor572
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state572)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state572)))
                     ((assoc-has-key? init-hash 'state572)
                      (bv->signal (assoc-ref init-hash 'state572)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor574
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor575
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor574)))
             (list)))
           (btor576
            (if (bitvector->bool (signal-value btor575)) btor36 btor97))
           (btor577
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor578
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor577)))
             (list)))
           (btor579
            (if (bitvector->bool (signal-value btor578)) btor35 btor576))
           (btor580
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor581
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor580)))
             (list)))
           (btor582
            (if (bitvector->bool (signal-value btor581)) btor34 btor579))
           (btor583
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor120)))
             (list)))
           (btor584
            (if (bitvector->bool (signal-value btor583)) btor97 btor582))
           (btor585
            (bv->signal
             (zero-extend (signal-value btor123) (bitvector 5))
             btor123))
           (btor586
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor585)))
             (list)))
           (btor587
            (if (bitvector->bool (signal-value btor586)) btor33 btor584))
           (btor588
            (signal
             (concat (signal-value btor587) (signal-value btor572))
             (list)))
           (btor589
            (signal
             (bool->bitvector
              (bveq (signal-value btor588) (signal-value btor129)))
             (list)))
           (btor590
            (if (bitvector->bool (signal-value btor589)) btor570 btor568))
           (btor591
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 5))
             btor129))
           (btor592
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor591)))
             (list)))
           (btor593
            (if (bitvector->bool (signal-value btor592)) btor26 btor97))
           (btor594
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor595
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor594)))
             (list)))
           (btor596
            (if (bitvector->bool (signal-value btor595)) btor25 btor593))
           (btor597
            (signal
             (apply bvor (bitvector->bits (signal-value btor84)))
             (signal-state btor84)))
           (btor598 (signal (bvnot (signal-value btor597)) (list)))
           (btor599
            (if (bitvector->bool (signal-value btor598)) btor24 btor596))
           (btor600
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor196)))
             (list)))
           (btor601
            (if (bitvector->bool (signal-value btor600)) btor97 btor599))
           (btor602
            (bv->signal
             (zero-extend (signal-value btor199) (bitvector 5))
             btor199))
           (btor603
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor602)))
             (list)))
           (btor604
            (if (bitvector->bool (signal-value btor603)) btor27 btor601))
           (btor605
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state605)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state605)))
                     ((assoc-has-key? init-hash 'state605)
                      (bv->signal (assoc-ref init-hash 'state605)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor606
            (signal
             (bvor (signal-value btor604) (signal-value btor605))
             (list)))
           (btor607
            (if (bitvector->bool (signal-value btor606)) btor97 btor590))
           (btor608
            (if (bitvector->bool (signal-value btor583)) btor92 btor607))
           (btor609
            (signal
             (bool->bitvector
              (bveq (signal-value btor80) (signal-value btor550)))
             (list)))
           (btor610
            (if (bitvector->bool (signal-value btor609)) btor104 btor97))
           (btor611
            (bv->signal
             (zero-extend (signal-value btor448) (bitvector 5))
             btor448))
           (btor612
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor611)))
             (list)))
           (btor613
            (if (bitvector->bool (signal-value btor612)) btor610 btor608))
           (btor614
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor452)))
             (list)))
           (btor615
            (if (bitvector->bool (signal-value btor614)) btor608 btor613))
           (btor616
            (signal
             (bvand (signal-value btor567) (signal-value btor615))
             (list)))
           (btor617
            (if (bitvector->bool (signal-value btor616)) btor566 btor264))
           (btor618
            (bv->signal
             (zero-extend (signal-value btor617) (bitvector 18))
             btor617))
           (btor619
            (bv->signal
             (zero-extend (signal-value btor255) (bitvector 18))
             btor255))
           (btor620
            (bv->signal
             (zero-extend (signal-value btor263) (bitvector 18))
             btor263))
           (btor621
            (bv->signal
             (zero-extend (signal-value btor264) (bitvector 18))
             btor264))
           (btor622 (bitvector 36))
           (btor623
            (bv->signal
             (zero-extend (signal-value btor559) (bitvector 36))
             btor559))
           (btor624
            (bv->signal
             (zero-extend (signal-value btor617) (bitvector 36))
             btor617))
           (btor625
            (signal
             (bvmul (signal-value btor623) (signal-value btor624))
             (list)))
           (btor626 unnamed-input-626)
           (btor627
            (signal
             (bvsub (signal-value btor626) (signal-value btor625))
             (list)))
           (btor628
            (signal
             (bvxor (signal-value btor558) (signal-value btor616))
             (list)))
           (btor629
            (if (bitvector->bool (signal-value btor628)) btor627 btor625))
           (btor630
            (bv->signal
             (zero-extend (signal-value btor629) (bitvector 36))
             btor629))
           (btor631
            (bv->signal
             (zero-extend (signal-value btor145) (bitvector 1))
             btor145))
           (btor632
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 1))
             btor97))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state635)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state635)))
                     ((assoc-has-key? init-hash 'state635)
                      (bv->signal (assoc-ref init-hash 'state635)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor637
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state637)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state637)))
                     ((assoc-has-key? init-hash 'state637)
                      (bv->signal (assoc-ref init-hash 'state637)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor639
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor640
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor639)))
             (list)))
           (btor641
            (if (bitvector->bool (signal-value btor640)) btor36 btor97))
           (btor642
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor643
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor642)))
             (list)))
           (btor644
            (if (bitvector->bool (signal-value btor643)) btor35 btor641))
           (btor645
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor646
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor645)))
             (list)))
           (btor647
            (if (bitvector->bool (signal-value btor646)) btor34 btor644))
           (btor648
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor120)))
             (list)))
           (btor649
            (if (bitvector->bool (signal-value btor648)) btor97 btor647))
           (btor650
            (bv->signal
             (zero-extend (signal-value btor123) (bitvector 5))
             btor123))
           (btor651
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor650)))
             (list)))
           (btor652
            (if (bitvector->bool (signal-value btor651)) btor33 btor649))
           (btor653
            (signal
             (concat (signal-value btor652) (signal-value btor637))
             (list)))
           (btor654
            (signal
             (bool->bitvector
              (bveq (signal-value btor653) (signal-value btor129)))
             (list)))
           (btor655
            (if (bitvector->bool (signal-value btor654)) btor635 btor633))
           (btor656
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 5))
             btor129))
           (btor657
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor656)))
             (list)))
           (btor658
            (if (bitvector->bool (signal-value btor657)) btor26 btor97))
           (btor659
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor660
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor659)))
             (list)))
           (btor661
            (if (bitvector->bool (signal-value btor660)) btor25 btor658))
           (btor662
            (signal
             (apply bvor (bitvector->bits (signal-value btor70)))
             (signal-state btor70)))
           (btor663 (signal (bvnot (signal-value btor662)) (list)))
           (btor664
            (if (bitvector->bool (signal-value btor663)) btor24 btor661))
           (btor665
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor196)))
             (list)))
           (btor666
            (if (bitvector->bool (signal-value btor665)) btor97 btor664))
           (btor667
            (bv->signal
             (zero-extend (signal-value btor199) (bitvector 5))
             btor199))
           (btor668
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor667)))
             (list)))
           (btor669
            (if (bitvector->bool (signal-value btor668)) btor27 btor666))
           (btor670
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state670)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state670)))
                     ((assoc-has-key? init-hash 'state670)
                      (bv->signal (assoc-ref init-hash 'state670)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor671
            (signal
             (bvor (signal-value btor669) (signal-value btor670))
             (list)))
           (btor672
            (if (bitvector->bool (signal-value btor671)) btor97 btor655))
           (btor673
            (bv->signal
             (zero-extend (signal-value btor672) (bitvector 1))
             btor672))
           (btor674
            (if (bitvector->bool (signal-value btor648)) btor97 btor672))
           (btor675
            (bv->signal
             (zero-extend (signal-value btor674) (bitvector 1))
             btor674))
           (btor676
            (bv->signal
             (zero-extend (signal-value btor629) (bitvector 36))
             btor629))
           (btor677 (bv->signal (bv 0 (bitvector 36))))
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
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor680
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state680)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state680)))
                     ((assoc-has-key? init-hash 'state680)
                      (bv->signal (assoc-ref init-hash 'state680)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor682
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state682)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state682)))
                     ((assoc-has-key? init-hash 'state682)
                      (bv->signal (assoc-ref init-hash 'state682)))
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
             (concat (signal-value btor652) (signal-value btor682))
             (list)))
           (btor685
            (signal
             (bool->bitvector
              (bveq (signal-value btor684) (signal-value btor129)))
             (list)))
           (btor686
            (if (bitvector->bool (signal-value btor685)) btor680 btor678))
           (btor687
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state687)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state687)))
                     ((assoc-has-key? init-hash 'state687)
                      (bv->signal (assoc-ref init-hash 'state687)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor688
            (signal
             (bvor (signal-value btor669) (signal-value btor687))
             (list)))
           (btor689
            (if (bitvector->bool (signal-value btor688)) btor677 btor686))
           (btor690
            (bv->signal
             (zero-extend (signal-value btor689) (bitvector 36))
             btor689))
           (btor691
            (bv->signal
             (zero-extend (signal-value btor97) (bitvector 1))
             btor97))
           (btor692
            (bv->signal
             (zero-extend (signal-value btor652) (bitvector 1))
             btor652))
           (btor693
            (bv->signal
             (zero-extend (signal-value btor669) (bitvector 1))
             btor669))
           (btor694
            (if (bitvector->bool (signal-value btor640)) btor52 btor104))
           (btor695
            (if (bitvector->bool (signal-value btor643)) btor51 btor694))
           (btor696
            (if (bitvector->bool (signal-value btor646)) btor50 btor695))
           (btor697
            (if (bitvector->bool (signal-value btor648)) btor104 btor696))
           (btor698
            (if (bitvector->bool (signal-value btor651)) btor49 btor697))
           (btor699
            (bv->signal
             (zero-extend (signal-value btor698) (bitvector 1))
             btor698))
           (btor700
            (bv->signal
             (zero-extend (signal-value btor558) (bitvector 1))
             btor558))
           (btor701
            (bv->signal
             (zero-extend (signal-value btor616) (bitvector 1))
             btor616))
           (btor702
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 1))
             btor126))
           (btor703
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 5))
             btor129))
           (btor704
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor703)))
             (list)))
           (btor705
            (if (bitvector->bool (signal-value btor704)) btor26 btor97))
           (btor706
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor707
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor706)))
             (list)))
           (btor708
            (if (bitvector->bool (signal-value btor707)) btor25 btor705))
           (btor709
            (signal
             (apply bvor (bitvector->bits (signal-value btor72)))
             (signal-state btor72)))
           (btor710 (signal (bvnot (signal-value btor709)) (list)))
           (btor711
            (if (bitvector->bool (signal-value btor710)) btor24 btor708))
           (btor712
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor196)))
             (list)))
           (btor713
            (if (bitvector->bool (signal-value btor712)) btor97 btor711))
           (btor714
            (bv->signal
             (zero-extend (signal-value btor199) (bitvector 5))
             btor199))
           (btor715
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor714)))
             (list)))
           (btor716
            (if (bitvector->bool (signal-value btor715)) btor27 btor713))
           (btor717
            (bv->signal
             (zero-extend (signal-value btor716) (bitvector 1))
             btor716))
           (btor718
            (if (bitvector->bool (signal-value btor110)) btor52 btor104))
           (btor719
            (if (bitvector->bool (signal-value btor114)) btor51 btor718))
           (btor720
            (if (bitvector->bool (signal-value btor118)) btor50 btor719))
           (btor721
            (if (bitvector->bool (signal-value btor121)) btor104 btor720))
           (btor722
            (if (bitvector->bool (signal-value btor125)) btor49 btor721))
           (btor723
            (bv->signal
             (zero-extend (signal-value btor722) (bitvector 1))
             btor722))
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
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state726)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state726)))
                     ((assoc-has-key? init-hash 'state726)
                      (bv->signal (assoc-ref init-hash 'state726)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
            (signal
             (concat (signal-value btor126) (signal-value btor728))
             (list)))
           (btor731
            (signal
             (bool->bitvector
              (bveq (signal-value btor730) (signal-value btor129)))
             (list)))
           (btor732
            (if (bitvector->bool (signal-value btor731)) btor726 btor724))
           (btor733
            (bv->signal
             (zero-extend (signal-value btor732) (bitvector 1))
             btor732))
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
                          (bv 0 35))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor736
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state736)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state736)))
                     ((assoc-has-key? init-hash 'state736)
                      (bv->signal (assoc-ref init-hash 'state736)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 35))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor738
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state738)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state738)))
                     ((assoc-has-key? init-hash 'state738)
                      (bv->signal (assoc-ref init-hash 'state738)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor740
            (signal
             (concat (signal-value btor126) (signal-value btor738))
             (list)))
           (btor741
            (signal
             (bool->bitvector
              (bveq (signal-value btor740) (signal-value btor129)))
             (list)))
           (btor742
            (if (bitvector->bool (signal-value btor741)) btor736 btor734))
           (btor743
            (bv->signal
             (zero-extend (signal-value btor742) (bitvector 35))
             btor742))
           (btor744
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state744)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state744)))
                     ((assoc-has-key? init-hash 'state744)
                      (bv->signal (assoc-ref init-hash 'state744)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor746
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state746)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state746)))
                     ((assoc-has-key? init-hash 'state746)
                      (bv->signal (assoc-ref init-hash 'state746)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor748
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state748)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state748)))
                     ((assoc-has-key? init-hash 'state748)
                      (bv->signal (assoc-ref init-hash 'state748)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor750
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor751
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor750)))
             (list)))
           (btor752
            (if (bitvector->bool (signal-value btor751)) btor36 btor97))
           (btor753
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor754
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor753)))
             (list)))
           (btor755
            (if (bitvector->bool (signal-value btor754)) btor35 btor752))
           (btor756
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor757
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor756)))
             (list)))
           (btor758
            (if (bitvector->bool (signal-value btor757)) btor34 btor755))
           (btor759
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor120)))
             (list)))
           (btor760
            (if (bitvector->bool (signal-value btor759)) btor97 btor758))
           (btor761
            (bv->signal
             (zero-extend (signal-value btor123) (bitvector 5))
             btor123))
           (btor762
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor761)))
             (list)))
           (btor763
            (if (bitvector->bool (signal-value btor762)) btor33 btor760))
           (btor764
            (signal
             (concat (signal-value btor763) (signal-value btor748))
             (list)))
           (btor765
            (signal
             (bool->bitvector
              (bveq (signal-value btor764) (signal-value btor129)))
             (list)))
           (btor766
            (if (bitvector->bool (signal-value btor765)) btor746 btor744))
           (btor767
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 5))
             btor129))
           (btor768
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor767)))
             (list)))
           (btor769
            (if (bitvector->bool (signal-value btor768)) btor26 btor97))
           (btor770
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor771
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor770)))
             (list)))
           (btor772
            (if (bitvector->bool (signal-value btor771)) btor25 btor769))
           (btor773
            (signal
             (apply bvor (bitvector->bits (signal-value btor85)))
             (signal-state btor85)))
           (btor774 (signal (bvnot (signal-value btor773)) (list)))
           (btor775
            (if (bitvector->bool (signal-value btor774)) btor24 btor772))
           (btor776
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor196)))
             (list)))
           (btor777
            (if (bitvector->bool (signal-value btor776)) btor97 btor775))
           (btor778
            (bv->signal
             (zero-extend (signal-value btor199) (bitvector 5))
             btor199))
           (btor779
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor778)))
             (list)))
           (btor780
            (if (bitvector->bool (signal-value btor779)) btor27 btor777))
           (btor781
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state781)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state781)))
                     ((assoc-has-key? init-hash 'state781)
                      (bv->signal (assoc-ref init-hash 'state781)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor782
            (signal
             (bvor (signal-value btor780) (signal-value btor781))
             (list)))
           (btor783
            (if (bitvector->bool (signal-value btor782)) btor97 btor766))
           (btor784
            (if (bitvector->bool (signal-value btor759)) btor549 btor783))
           (btor785
            (if (bitvector->bool (signal-value btor554)) btor552 btor784))
           (btor786
            (if (bitvector->bool (signal-value btor556)) btor784 btor785))
           (btor787
            (bv->signal
             (zero-extend (signal-value btor786) (bitvector 1))
             btor786))
           (btor788
            (bv->signal
             (zero-extend (signal-value btor783) (bitvector 1))
             btor783))
           (btor789
            (bv->signal
             (zero-extend (signal-value btor784) (bitvector 1))
             btor784))
           (btor790
            (bv->signal
             (zero-extend (signal-value btor548) (bitvector 1))
             btor548))
           (btor791
            (bv->signal
             (zero-extend (signal-value btor557) (bitvector 1))
             btor557))
           (btor792
            (bv->signal
             (zero-extend (signal-value btor549) (bitvector 1))
             btor549))
           (btor793
            (bv->signal
             (zero-extend (signal-value btor528) (bitvector 1))
             btor528))
           (btor794
            (bv->signal
             (zero-extend (signal-value btor545) (bitvector 1))
             btor545))
           (btor795
            (if (bitvector->bool (signal-value btor516)) btor52 btor104))
           (btor796
            (if (bitvector->bool (signal-value btor519)) btor51 btor795))
           (btor797
            (if (bitvector->bool (signal-value btor522)) btor50 btor796))
           (btor798
            (if (bitvector->bool (signal-value btor524)) btor104 btor797))
           (btor799
            (if (bitvector->bool (signal-value btor527)) btor49 btor798))
           (btor800
            (bv->signal
             (zero-extend (signal-value btor799) (bitvector 1))
             btor799))
           (btor801
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state801)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state801)))
                     ((assoc-has-key? init-hash 'state801)
                      (bv->signal (assoc-ref init-hash 'state801)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor803
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state803)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state803)))
                     ((assoc-has-key? init-hash 'state803)
                      (bv->signal (assoc-ref init-hash 'state803)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor805
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state805)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state805)))
                     ((assoc-has-key? init-hash 'state805)
                      (bv->signal (assoc-ref init-hash 'state805)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor807
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor808
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor807)))
             (list)))
           (btor809
            (if (bitvector->bool (signal-value btor808)) btor36 btor97))
           (btor810
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor811
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor810)))
             (list)))
           (btor812
            (if (bitvector->bool (signal-value btor811)) btor35 btor809))
           (btor813
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor814
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor813)))
             (list)))
           (btor815
            (if (bitvector->bool (signal-value btor814)) btor34 btor812))
           (btor816
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor120)))
             (list)))
           (btor817
            (if (bitvector->bool (signal-value btor816)) btor97 btor815))
           (btor818
            (bv->signal
             (zero-extend (signal-value btor123) (bitvector 5))
             btor123))
           (btor819
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor818)))
             (list)))
           (btor820
            (if (bitvector->bool (signal-value btor819)) btor33 btor817))
           (btor821
            (signal
             (concat (signal-value btor820) (signal-value btor805))
             (list)))
           (btor822
            (signal
             (bool->bitvector
              (bveq (signal-value btor821) (signal-value btor129)))
             (list)))
           (btor823
            (if (bitvector->bool (signal-value btor822)) btor803 btor801))
           (btor824
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 5))
             btor129))
           (btor825
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor824)))
             (list)))
           (btor826
            (if (bitvector->bool (signal-value btor825)) btor26 btor97))
           (btor827
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor828
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor827)))
             (list)))
           (btor829
            (if (bitvector->bool (signal-value btor828)) btor25 btor826))
           (btor830
            (signal
             (apply bvor (bitvector->bits (signal-value btor86)))
             (signal-state btor86)))
           (btor831 (signal (bvnot (signal-value btor830)) (list)))
           (btor832
            (if (bitvector->bool (signal-value btor831)) btor24 btor829))
           (btor833
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor196)))
             (list)))
           (btor834
            (if (bitvector->bool (signal-value btor833)) btor97 btor832))
           (btor835
            (bv->signal
             (zero-extend (signal-value btor199) (bitvector 5))
             btor199))
           (btor836
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor835)))
             (list)))
           (btor837
            (if (bitvector->bool (signal-value btor836)) btor27 btor834))
           (btor838
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state838)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state838)))
                     ((assoc-has-key? init-hash 'state838)
                      (bv->signal (assoc-ref init-hash 'state838)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor839
            (signal
             (bvor (signal-value btor837) (signal-value btor838))
             (list)))
           (btor840
            (if (bitvector->bool (signal-value btor839)) btor97 btor823))
           (btor841
            (if (bitvector->bool (signal-value btor816)) btor608 btor840))
           (btor842
            (if (bitvector->bool (signal-value btor612)) btor610 btor841))
           (btor843
            (if (bitvector->bool (signal-value btor614)) btor841 btor842))
           (btor844
            (bv->signal
             (zero-extend (signal-value btor843) (bitvector 1))
             btor843))
           (btor845
            (bv->signal
             (zero-extend (signal-value btor840) (bitvector 1))
             btor840))
           (btor846
            (bv->signal
             (zero-extend (signal-value btor841) (bitvector 1))
             btor841))
           (btor847
            (bv->signal
             (zero-extend (signal-value btor607) (bitvector 1))
             btor607))
           (btor848
            (bv->signal
             (zero-extend (signal-value btor615) (bitvector 1))
             btor615))
           (btor849
            (bv->signal
             (zero-extend (signal-value btor608) (bitvector 1))
             btor608))
           (btor850
            (bv->signal
             (zero-extend (signal-value btor587) (bitvector 1))
             btor587))
           (btor851
            (bv->signal
             (zero-extend (signal-value btor604) (bitvector 1))
             btor604))
           (btor852
            (if (bitvector->bool (signal-value btor575)) btor52 btor104))
           (btor853
            (if (bitvector->bool (signal-value btor578)) btor51 btor852))
           (btor854
            (if (bitvector->bool (signal-value btor581)) btor50 btor853))
           (btor855
            (if (bitvector->bool (signal-value btor583)) btor104 btor854))
           (btor856
            (if (bitvector->bool (signal-value btor586)) btor49 btor855))
           (btor857
            (bv->signal
             (zero-extend (signal-value btor856) (bitvector 1))
             btor856))
           (btor858
            (bv->signal
             (zero-extend (signal-value btor763) (bitvector 1))
             btor763))
           (btor859
            (bv->signal
             (zero-extend (signal-value btor780) (bitvector 1))
             btor780))
           (btor860
            (if (bitvector->bool (signal-value btor751)) btor52 btor104))
           (btor861
            (if (bitvector->bool (signal-value btor754)) btor51 btor860))
           (btor862
            (if (bitvector->bool (signal-value btor757)) btor50 btor861))
           (btor863
            (if (bitvector->bool (signal-value btor759)) btor104 btor862))
           (btor864
            (if (bitvector->bool (signal-value btor762)) btor49 btor863))
           (btor865
            (bv->signal
             (zero-extend (signal-value btor864) (bitvector 1))
             btor864))
           (btor866
            (bv->signal
             (zero-extend (signal-value btor820) (bitvector 1))
             btor820))
           (btor867
            (bv->signal
             (zero-extend (signal-value btor837) (bitvector 1))
             btor837))
           (btor868
            (if (bitvector->bool (signal-value btor808)) btor52 btor104))
           (btor869
            (if (bitvector->bool (signal-value btor811)) btor51 btor868))
           (btor870
            (if (bitvector->bool (signal-value btor814)) btor50 btor869))
           (btor871
            (if (bitvector->bool (signal-value btor816)) btor104 btor870))
           (btor872
            (if (bitvector->bool (signal-value btor819)) btor49 btor871))
           (btor873
            (bv->signal
             (zero-extend (signal-value btor872) (bitvector 1))
             btor872))
           (btor874
            (bv->signal
             (zero-extend (signal-value btor549) (bitvector 1))
             btor549))
           (btor875
            (bv->signal
             (zero-extend (signal-value btor608) (bitvector 1))
             btor608))
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
             (concat (signal-value btor339) (signal-value btor880))
             (list)))
           (btor883
            (signal
             (bool->bitvector
              (bveq (signal-value btor882) (signal-value btor129)))
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
             (bvor (signal-value btor354) (signal-value btor885))
             (list)))
           (btor887
            (if (bitvector->bool (signal-value btor886)) btor97 btor884))
           (btor888
            (if (bitvector->bool (signal-value btor335)) btor19 btor887))
           (btor889
            (bv->signal
             (zero-extend (signal-value btor888) (bitvector 1))
             btor888))
           (btor890
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state890)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state890)))
                     ((assoc-has-key? init-hash 'state890)
                      (bv->signal (assoc-ref init-hash 'state890)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor892
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state892)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state892)))
                     ((assoc-has-key? init-hash 'state892)
                      (bv->signal (assoc-ref init-hash 'state892)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor894
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state894)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state894)))
                     ((assoc-has-key? init-hash 'state894)
                      (bv->signal (assoc-ref init-hash 'state894)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor896
            (signal
             (concat (signal-value btor303) (signal-value btor894))
             (list)))
           (btor897
            (signal
             (bool->bitvector
              (bveq (signal-value btor896) (signal-value btor129)))
             (list)))
           (btor898
            (if (bitvector->bool (signal-value btor897)) btor892 btor890))
           (btor899
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state899)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state899)))
                     ((assoc-has-key? init-hash 'state899)
                      (bv->signal (assoc-ref init-hash 'state899)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor900
            (signal
             (bvor (signal-value btor318) (signal-value btor899))
             (list)))
           (btor901
            (if (bitvector->bool (signal-value btor900)) btor97 btor898))
           (btor902
            (bv->signal
             (zero-extend (signal-value btor901) (bitvector 1))
             btor901))
           (btor903 (bitvector 17))
           (btor904 (bv->signal (bv 0 (bitvector 17))))
           (btor905
            (signal
             (concat (signal-value btor901) (signal-value btor901))
             (list)))
           (btor906
            (signal
             (concat (signal-value btor901) (signal-value btor905))
             (list)))
           (btor907
            (signal
             (concat (signal-value btor901) (signal-value btor906))
             (list)))
           (btor908
            (signal
             (concat (signal-value btor901) (signal-value btor907))
             (list)))
           (btor909 (bitvector 6))
           (btor910
            (signal
             (concat (signal-value btor901) (signal-value btor908))
             (list)))
           (btor911 (bitvector 7))
           (btor912
            (signal
             (concat (signal-value btor901) (signal-value btor910))
             (list)))
           (btor913 (bitvector 8))
           (btor914
            (signal
             (concat (signal-value btor901) (signal-value btor912))
             (list)))
           (btor915 (bitvector 9))
           (btor916
            (signal
             (concat (signal-value btor901) (signal-value btor914))
             (list)))
           (btor917 (bitvector 10))
           (btor918
            (signal
             (concat (signal-value btor901) (signal-value btor916))
             (list)))
           (btor919 (bitvector 11))
           (btor920
            (signal
             (concat (signal-value btor901) (signal-value btor918))
             (list)))
           (btor921 (bitvector 12))
           (btor922
            (signal
             (concat (signal-value btor901) (signal-value btor920))
             (list)))
           (btor923 (bitvector 13))
           (btor924
            (signal
             (concat (signal-value btor901) (signal-value btor922))
             (list)))
           (btor925 (bitvector 14))
           (btor926
            (signal
             (concat (signal-value btor901) (signal-value btor924))
             (list)))
           (btor927 (bitvector 15))
           (btor928
            (signal
             (concat (signal-value btor901) (signal-value btor926))
             (list)))
           (btor929 (bitvector 16))
           (btor930
            (signal
             (concat (signal-value btor901) (signal-value btor928))
             (list)))
           (btor931
            (signal
             (concat (signal-value btor901) (signal-value btor930))
             (list)))
           (btor932
            (signal
             (concat (signal-value btor901) (signal-value btor931))
             (list)))
           (btor933 (bitvector 19))
           (btor934
            (signal
             (concat (signal-value btor901) (signal-value btor932))
             (list)))
           (btor935 (bitvector 20))
           (btor936
            (signal
             (concat (signal-value btor901) (signal-value btor934))
             (list)))
           (btor937
            (signal
             (concat (signal-value btor901) (signal-value btor936))
             (list)))
           (btor938
            (signal
             (concat (signal-value btor901) (signal-value btor937))
             (list)))
           (btor939 (bitvector 23))
           (btor940
            (signal
             (concat (signal-value btor901) (signal-value btor938))
             (list)))
           (btor941 (bitvector 24))
           (btor942
            (signal
             (concat (signal-value btor901) (signal-value btor940))
             (list)))
           (btor943 (bitvector 25))
           (btor944
            (signal
             (concat (signal-value btor901) (signal-value btor942))
             (list)))
           (btor945 (bitvector 26))
           (btor946
            (signal
             (concat (signal-value btor901) (signal-value btor944))
             (list)))
           (btor947 (bitvector 27))
           (btor948
            (signal
             (concat (signal-value btor901) (signal-value btor946))
             (list)))
           (btor949 (bitvector 28))
           (btor950
            (signal
             (concat (signal-value btor901) (signal-value btor948))
             (list)))
           (btor951 (bitvector 29))
           (btor952
            (signal
             (concat (signal-value btor901) (signal-value btor950))
             (list)))
           (btor953 (bitvector 30))
           (btor954
            (signal
             (concat (signal-value btor901) (signal-value btor952))
             (list)))
           (btor955 (bitvector 31))
           (btor956
            (signal
             (concat (signal-value btor901) (signal-value btor954))
             (list)))
           (btor957
            (signal
             (concat (signal-value btor901) (signal-value btor956))
             (list)))
           (btor958 (bitvector 33))
           (btor959
            (signal
             (concat (signal-value btor901) (signal-value btor957))
             (list)))
           (btor960 (bitvector 34))
           (btor961
            (signal
             (concat (signal-value btor901) (signal-value btor959))
             (list)))
           (btor962
            (signal
             (concat (signal-value btor901) (signal-value btor961))
             (list)))
           (btor963
            (signal
             (bvor (signal-value btor786) (signal-value btor843))
             (list)))
           (btor964
            (if (bitvector->bool (signal-value btor963)) btor962 btor268))
           (btor965
            (signal
             (concat (signal-value btor901) (signal-value btor904))
             (list)))
           (btor966
            (signal
             (extract 34 18 (signal-value btor964))
             (signal-state btor964)))
           (btor967
            (signal
             (concat (signal-value btor966) (signal-value btor965))
             (list)))
           (btor968
            (signal
             (concat (signal-value btor888) (signal-value btor888))
             (list)))
           (btor969
            (signal
             (concat (signal-value btor888) (signal-value btor968))
             (list)))
           (btor970
            (signal
             (concat (signal-value btor888) (signal-value btor969))
             (list)))
           (btor971
            (signal
             (concat (signal-value btor888) (signal-value btor970))
             (list)))
           (btor972
            (signal
             (concat (signal-value btor888) (signal-value btor971))
             (list)))
           (btor973
            (signal
             (concat (signal-value btor888) (signal-value btor972))
             (list)))
           (btor974
            (signal
             (concat (signal-value btor888) (signal-value btor973))
             (list)))
           (btor975
            (signal
             (concat (signal-value btor888) (signal-value btor974))
             (list)))
           (btor976
            (signal
             (concat (signal-value btor888) (signal-value btor975))
             (list)))
           (btor977
            (signal
             (concat (signal-value btor888) (signal-value btor976))
             (list)))
           (btor978
            (signal
             (concat (signal-value btor888) (signal-value btor977))
             (list)))
           (btor979
            (signal
             (concat (signal-value btor888) (signal-value btor978))
             (list)))
           (btor980
            (signal
             (concat (signal-value btor888) (signal-value btor979))
             (list)))
           (btor981
            (signal
             (concat (signal-value btor888) (signal-value btor980))
             (list)))
           (btor982
            (signal
             (concat (signal-value btor888) (signal-value btor981))
             (list)))
           (btor983
            (signal
             (concat (signal-value btor888) (signal-value btor982))
             (list)))
           (btor984
            (signal
             (concat (signal-value btor888) (signal-value btor983))
             (list)))
           (btor985
            (signal
             (concat (signal-value btor888) (signal-value btor984))
             (list)))
           (btor986
            (signal
             (concat (signal-value btor888) (signal-value btor985))
             (list)))
           (btor987
            (signal
             (concat (signal-value btor888) (signal-value btor986))
             (list)))
           (btor988
            (signal
             (concat (signal-value btor888) (signal-value btor987))
             (list)))
           (btor989
            (signal
             (concat (signal-value btor888) (signal-value btor988))
             (list)))
           (btor990
            (signal
             (concat (signal-value btor888) (signal-value btor989))
             (list)))
           (btor991
            (signal
             (concat (signal-value btor888) (signal-value btor990))
             (list)))
           (btor992
            (signal
             (concat (signal-value btor888) (signal-value btor991))
             (list)))
           (btor993
            (signal
             (concat (signal-value btor888) (signal-value btor992))
             (list)))
           (btor994
            (signal
             (concat (signal-value btor888) (signal-value btor993))
             (list)))
           (btor995
            (signal
             (concat (signal-value btor888) (signal-value btor994))
             (list)))
           (btor996
            (signal
             (concat (signal-value btor888) (signal-value btor995))
             (list)))
           (btor997
            (signal
             (concat (signal-value btor888) (signal-value btor996))
             (list)))
           (btor998
            (signal
             (concat (signal-value btor888) (signal-value btor997))
             (list)))
           (btor999
            (signal
             (concat (signal-value btor888) (signal-value btor998))
             (list)))
           (btor1000
            (signal
             (concat (signal-value btor888) (signal-value btor999))
             (list)))
           (btor1001
            (signal
             (concat (signal-value btor888) (signal-value btor1000))
             (list)))
           (btor1002
            (if (bitvector->bool (signal-value btor963)) btor1001 btor268))
           (btor1003
            (signal
             (concat (signal-value btor888) (signal-value btor904))
             (list)))
           (btor1004
            (signal
             (extract 34 18 (signal-value btor1002))
             (signal-state btor1002)))
           (btor1005
            (signal
             (concat (signal-value btor1004) (signal-value btor1003))
             (list)))
           (btor1006
            (if (bitvector->bool (signal-value btor299)) btor1005 btor967))
           (btor1007
            (bv->signal
             (zero-extend (signal-value btor1006) (bitvector 35))
             btor1006))
           (btor1008
            (bv->signal
             (zero-extend (signal-value btor887) (bitvector 1))
             btor887))
           (btor1009
            (bv->signal
             (zero-extend (signal-value btor888) (bitvector 1))
             btor888))
           (btor1010
            (bv->signal
             (zero-extend (signal-value btor629) (bitvector 36))
             btor629))
           (btor1011
            (bv->signal
             (zero-extend (signal-value btor625) (bitvector 36))
             btor625))
           (btor1012
            (bv->signal
             (zero-extend (signal-value btor626) (bitvector 36))
             btor626))
           (btor1013
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state1013)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state1013)))
                     ((assoc-has-key? init-hash 'state1013)
                      (bv->signal (assoc-ref init-hash 'state1013)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1015
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state1015)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state1015)))
                     ((assoc-has-key? init-hash 'state1015)
                      (bv->signal (assoc-ref init-hash 'state1015)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1017
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state1017)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state1017)))
                     ((assoc-has-key? init-hash 'state1017)
                      (bv->signal (assoc-ref init-hash 'state1017)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1019
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor1020
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor1019)))
             (list)))
           (btor1021
            (if (bitvector->bool (signal-value btor1020)) btor36 btor97))
           (btor1022
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor1023
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor1022)))
             (list)))
           (btor1024
            (if (bitvector->bool (signal-value btor1023)) btor35 btor1021))
           (btor1025
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor1026
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor1025)))
             (list)))
           (btor1027
            (if (bitvector->bool (signal-value btor1026)) btor34 btor1024))
           (btor1028
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor120)))
             (list)))
           (btor1029
            (if (bitvector->bool (signal-value btor1028)) btor97 btor1027))
           (btor1030
            (bv->signal
             (zero-extend (signal-value btor123) (bitvector 5))
             btor123))
           (btor1031
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor1030)))
             (list)))
           (btor1032
            (if (bitvector->bool (signal-value btor1031)) btor33 btor1029))
           (btor1033
            (signal
             (concat (signal-value btor1032) (signal-value btor1017))
             (list)))
           (btor1034
            (signal
             (bool->bitvector
              (bveq (signal-value btor1033) (signal-value btor129)))
             (list)))
           (btor1035
            (if (bitvector->bool (signal-value btor1034)) btor1015 btor1013))
           (btor1036
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 5))
             btor129))
           (btor1037
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor1036)))
             (list)))
           (btor1038
            (if (bitvector->bool (signal-value btor1037)) btor26 btor97))
           (btor1039
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor1040
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor1039)))
             (list)))
           (btor1041
            (if (bitvector->bool (signal-value btor1040)) btor25 btor1038))
           (btor1042
            (signal
             (apply bvor (bitvector->bits (signal-value btor16)))
             (signal-state btor16)))
           (btor1043 (signal (bvnot (signal-value btor1042)) (list)))
           (btor1044
            (if (bitvector->bool (signal-value btor1043)) btor24 btor1041))
           (btor1045
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor196)))
             (list)))
           (btor1046
            (if (bitvector->bool (signal-value btor1045)) btor97 btor1044))
           (btor1047
            (bv->signal
             (zero-extend (signal-value btor199) (bitvector 5))
             btor199))
           (btor1048
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor1047)))
             (list)))
           (btor1049
            (if (bitvector->bool (signal-value btor1048)) btor27 btor1046))
           (btor1050
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state1050)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state1050)))
                     ((assoc-has-key? init-hash 'state1050)
                      (bv->signal (assoc-ref init-hash 'state1050)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1051
            (signal
             (bvor (signal-value btor1049) (signal-value btor1050))
             (list)))
           (btor1052
            (if (bitvector->bool (signal-value btor1051)) btor97 btor1035))
           (btor1053
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state1053)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state1053)))
                     ((assoc-has-key? init-hash 'state1053)
                      (bv->signal (assoc-ref init-hash 'state1053)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1055
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state1055)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state1055)))
                     ((assoc-has-key? init-hash 'state1055)
                      (bv->signal (assoc-ref init-hash 'state1055)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1057
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state1057)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state1057)))
                     ((assoc-has-key? init-hash 'state1057)
                      (bv->signal (assoc-ref init-hash 'state1057)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1059
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor1060
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor1059)))
             (list)))
           (btor1061
            (if (bitvector->bool (signal-value btor1060)) btor36 btor97))
           (btor1062
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor1063
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor1062)))
             (list)))
           (btor1064
            (if (bitvector->bool (signal-value btor1063)) btor35 btor1061))
           (btor1065
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor1066
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor1065)))
             (list)))
           (btor1067
            (if (bitvector->bool (signal-value btor1066)) btor34 btor1064))
           (btor1068
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor120)))
             (list)))
           (btor1069
            (if (bitvector->bool (signal-value btor1068)) btor97 btor1067))
           (btor1070
            (bv->signal
             (zero-extend (signal-value btor123) (bitvector 5))
             btor123))
           (btor1071
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor1070)))
             (list)))
           (btor1072
            (if (bitvector->bool (signal-value btor1071)) btor33 btor1069))
           (btor1073
            (signal
             (concat (signal-value btor1072) (signal-value btor1057))
             (list)))
           (btor1074
            (signal
             (bool->bitvector
              (bveq (signal-value btor1073) (signal-value btor129)))
             (list)))
           (btor1075
            (if (bitvector->bool (signal-value btor1074)) btor1055 btor1053))
           (btor1076
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 5))
             btor129))
           (btor1077
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor1076)))
             (list)))
           (btor1078
            (if (bitvector->bool (signal-value btor1077)) btor26 btor97))
           (btor1079
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor1080
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor1079)))
             (list)))
           (btor1081
            (if (bitvector->bool (signal-value btor1080)) btor25 btor1078))
           (btor1082
            (signal
             (apply bvor (bitvector->bits (signal-value btor15)))
             (signal-state btor15)))
           (btor1083 (signal (bvnot (signal-value btor1082)) (list)))
           (btor1084
            (if (bitvector->bool (signal-value btor1083)) btor24 btor1081))
           (btor1085
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor196)))
             (list)))
           (btor1086
            (if (bitvector->bool (signal-value btor1085)) btor97 btor1084))
           (btor1087
            (bv->signal
             (zero-extend (signal-value btor199) (bitvector 5))
             btor199))
           (btor1088
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor1087)))
             (list)))
           (btor1089
            (if (bitvector->bool (signal-value btor1088)) btor27 btor1086))
           (btor1090
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state1090)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state1090)))
                     ((assoc-has-key? init-hash 'state1090)
                      (bv->signal (assoc-ref init-hash 'state1090)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor1091
            (signal
             (bvor (signal-value btor1089) (signal-value btor1090))
             (list)))
           (btor1092
            (if (bitvector->bool (signal-value btor1091)) btor97 btor1075))
           (btor1093
            (if (bitvector->bool (signal-value btor1068)) btor14 btor1092))
           (btor1094
            (if (bitvector->bool (signal-value btor1028)) btor1093 btor1052))
           (btor1095
            (bv->signal
             (zero-extend (signal-value btor1094) (bitvector 1))
             btor1094))
           (btor1096
            (bv->signal
             (zero-extend (signal-value btor1052) (bitvector 1))
             btor1052))
           (btor1097
            (bv->signal
             (zero-extend (signal-value btor1094) (bitvector 1))
             btor1094))
           (btor1098
            (bv->signal
             (zero-extend (signal-value btor1092) (bitvector 1))
             btor1092))
           (btor1099
            (bv->signal
             (zero-extend (signal-value btor1093) (bitvector 1))
             btor1093))
           (btor1100
            (bv->signal
             (zero-extend (signal-value btor1032) (bitvector 1))
             btor1032))
           (btor1101
            (bv->signal
             (zero-extend (signal-value btor1049) (bitvector 1))
             btor1049))
           (btor1102
            (if (bitvector->bool (signal-value btor1020)) btor52 btor104))
           (btor1103
            (if (bitvector->bool (signal-value btor1023)) btor51 btor1102))
           (btor1104
            (if (bitvector->bool (signal-value btor1026)) btor50 btor1103))
           (btor1105
            (if (bitvector->bool (signal-value btor1028)) btor104 btor1104))
           (btor1106
            (if (bitvector->bool (signal-value btor1031)) btor49 btor1105))
           (btor1107
            (bv->signal
             (zero-extend (signal-value btor1106) (bitvector 1))
             btor1106))
           (btor1108
            (bv->signal
             (zero-extend (signal-value btor1072) (bitvector 1))
             btor1072))
           (btor1109
            (bv->signal
             (zero-extend (signal-value btor1089) (bitvector 1))
             btor1089))
           (btor1110
            (if (bitvector->bool (signal-value btor1060)) btor52 btor104))
           (btor1111
            (if (bitvector->bool (signal-value btor1063)) btor51 btor1110))
           (btor1112
            (if (bitvector->bool (signal-value btor1066)) btor50 btor1111))
           (btor1113
            (if (bitvector->bool (signal-value btor1068)) btor104 btor1112))
           (btor1114
            (if (bitvector->bool (signal-value btor1071)) btor49 btor1113))
           (btor1115
            (bv->signal
             (zero-extend (signal-value btor1114) (bitvector 1))
             btor1114))
           (btor1116
            (bv->signal
             (zero-extend (signal-value btor1093) (bitvector 1))
             btor1093))
           (btor1121 (signal (bvnot (signal-value btor131)) (list)))
           (btor1122
            (if (bitvector->bool (signal-value btor722)) btor1121 btor131))
           (btor1123
            (if (bitvector->bool (signal-value btor126)) btor1122 btor131))
           (btor1124
            (if (bitvector->bool (signal-value btor716)) btor1121 btor1123))
           (btor1128
            (if (bitvector->bool (signal-value btor722)) btor674 btor145))
           (btor1129
            (if (bitvector->bool (signal-value btor126)) btor1128 btor145))
           (btor1130
            (if (bitvector->bool (signal-value btor716)) btor97 btor1129))
           (btor1137
            (signal
             (extract 17 0 (signal-value btor742))
             (signal-state btor742)))
           (btor1141
            (if (bitvector->bool (signal-value btor93)) btor81 btor43))
           (btor1142 (bv->signal (bv 26 (bitvector 5))))
           (btor1143
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor1142)))
             (list)))
           (btor1144
            (if (bitvector->bool (signal-value btor1143)) btor1141 btor205))
           (btor1145
            (if (bitvector->bool (signal-value btor207)) btor81 btor1144))
           (btor1146
            (if (bitvector->bool (signal-value btor212)) btor43 btor1145))
           (btor1147
            (signal
             (bvand (signal-value btor183) (signal-value btor488))
             (list)))
           (btor1148
            (if (bitvector->bool (signal-value btor1147)) btor1146 btor205))
           (btor1153
            (if (bitvector->bool (signal-value btor94)) btor82 btor44))
           (btor1154
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor1142)))
             (list)))
           (btor1155
            (if (bitvector->bool (signal-value btor1154)) btor1153 btor255))
           (btor1156
            (if (bitvector->bool (signal-value btor257)) btor82 btor1155))
           (btor1157
            (if (bitvector->bool (signal-value btor262)) btor44 btor1156))
           (btor1158
            (signal
             (bvand (signal-value btor235) (signal-value btor496))
             (list)))
           (btor1159
            (if (bitvector->bool (signal-value btor1158)) btor1157 btor255))
           (btor1164 unnamed-input-1164)
           (btor1165 unnamed-input-1165)
           (btor1166
            (if (bitvector->bool (signal-value btor1094)) btor1006 btor742))
           (btor1167 unnamed-input-1167)
           (btor1168 unnamed-input-1168)
           (btor1169
            (signal
             (extract 34 0 (signal-value btor689))
             (signal-state btor689)))
           (btor1170
            (signal
             (extract 34 0 (signal-value btor629))
             (signal-state btor629)))
           (btor1171
            (if (bitvector->bool (signal-value btor648)) btor1170 btor1169))
           (btor1172
            (if (bitvector->bool (signal-value btor722)) btor1171 btor1168))
           (btor1173
            (if (bitvector->bool (signal-value btor126)) btor1172 btor1167))
           (btor1174 unnamed-input-1174)
           (btor1175
            (if (bitvector->bool (signal-value btor716)) btor1174 btor1173))
           (btor1176
            (signal
             (bvsub (signal-value btor1166) (signal-value btor1175))
             (list)))
           (btor1177
            (if (bitvector->bool (signal-value btor1094)) btor268 btor742))
           (btor1178
            (signal
             (bvsub (signal-value btor1177) (signal-value btor1175))
             (list)))
           (btor1179 (signal (bvnot (signal-value btor500)) (list)))
           (btor1180 (signal (bvnot (signal-value btor498)) (list)))
           (btor1181
            (signal
             (bvand (signal-value btor1179) (signal-value btor1180))
             (list)))
           (btor1182
            (if (bitvector->bool (signal-value btor1181)) btor1178 btor1176))
           (btor1183
            (bv->signal
             (zero-extend (signal-value btor1166) (bitvector 36))
             btor1166))
           (btor1184
            (bv->signal
             (zero-extend (signal-value btor1175) (bitvector 36))
             btor1175))
           (btor1185
            (signal
             (bvadd (signal-value btor1183) (signal-value btor1184))
             (list)))
           (btor1186
            (bv->signal
             (zero-extend (signal-value btor1177) (bitvector 36))
             btor1177))
           (btor1187
            (bv->signal
             (zero-extend (signal-value btor1175) (bitvector 36))
             btor1175))
           (btor1188
            (signal
             (bvadd (signal-value btor1186) (signal-value btor1187))
             (list)))
           (btor1189
            (if (bitvector->bool (signal-value btor1181)) btor1188 btor1185))
           (btor1190
            (signal
             (extract 34 0 (signal-value btor1189))
             (signal-state btor1189)))
           (btor1191
            (if (bitvector->bool (signal-value btor454)) btor1190 btor1182))
           (btor1192
            (if (bitvector->bool (signal-value btor722)) btor1191 btor1165))
           (btor1193
            (if (bitvector->bool (signal-value btor126)) btor1192 btor1164))
           (btor1194 unnamed-input-1194)
           (btor1195
            (if (bitvector->bool (signal-value btor716)) btor1194 btor1193))
           (btor1196
            (if (bitvector->bool (signal-value btor500)) btor1195 btor277))
           (btor1197
            (if (bitvector->bool (signal-value btor722)) btor1196 btor277))
           (btor1198
            (if (bitvector->bool (signal-value btor126)) btor1197 btor277))
           (btor1199
            (if (bitvector->bool (signal-value btor716)) btor268 btor1198))
           (btor1203
            (if (bitvector->bool (signal-value btor500)) btor97 btor287))
           (btor1204
            (if (bitvector->bool (signal-value btor722)) btor1203 btor287))
           (btor1205
            (if (bitvector->bool (signal-value btor126)) btor1204 btor287))
           (btor1206
            (if (bitvector->bool (signal-value btor716)) btor97 btor1205))
           (btor1210
            (signal
             (bvand (signal-value btor381) (signal-value btor465))
             (list)))
           (btor1211
            (if (bitvector->bool (signal-value btor1210)) btor442 btor401))
           (btor1216
            (signal
             (bvand (signal-value btor421) (signal-value btor475))
             (list)))
           (btor1217
            (if (bitvector->bool (signal-value btor1216)) btor28 btor441))
           (btor1222
            (signal
             (bvand (signal-value btor528) (signal-value btor799))
             (list)))
           (btor1223
            (if (bitvector->bool (signal-value btor1222)) btor91 btor548))
           (btor1228
            (signal
             (bvand (signal-value btor587) (signal-value btor856))
             (list)))
           (btor1229
            (if (bitvector->bool (signal-value btor1228)) btor92 btor607))
           (btor1234
            (signal
             (bvand (signal-value btor652) (signal-value btor698))
             (list)))
           (btor1235
            (if (bitvector->bool (signal-value btor1234)) btor97 btor672))
           (btor1240
            (if (bitvector->bool (signal-value btor1234)) btor629 btor689))
           (btor1245 unnamed-input-1245)
           (btor1246 unnamed-input-1246)
           (btor1247
            (signal
             (bool->bitvector
              (bvuge (signal-value btor1166) (signal-value btor1175)))
             (list)))
           (btor1248
            (if (bitvector->bool (signal-value btor1247)) btor104 btor97))
           (btor1249
            (signal
             (bool->bitvector
              (bvuge (signal-value btor1177) (signal-value btor1175)))
             (list)))
           (btor1250
            (if (bitvector->bool (signal-value btor1249)) btor104 btor97))
           (btor1251
            (if (bitvector->bool (signal-value btor1181)) btor1250 btor1248))
           (btor1252
            (signal
             (extract 35 35 (signal-value btor1189))
             (signal-state btor1189)))
           (btor1253
            (if (bitvector->bool (signal-value btor454)) btor1252 btor1251))
           (btor1254
            (if (bitvector->bool (signal-value btor722)) btor1253 btor1246))
           (btor1255
            (if (bitvector->bool (signal-value btor126)) btor1254 btor1245))
           (btor1256 unnamed-input-1256)
           (btor1257
            (if (bitvector->bool (signal-value btor716)) btor1256 btor1255))
           (btor1258 (signal (bvnot (signal-value btor1257)) (list)))
           (btor1259
            (if (bitvector->bool (signal-value btor454)) btor1257 btor1258))
           (btor1260 unnamed-input-1260)
           (btor1261
            (signal
             (extract 34 34 (signal-value btor742))
             (signal-state btor742)))
           (btor1262
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor1260)
              (signal-value btor1261))
             (list)))
           (btor1263 (signal (bvnot (signal-value btor454)) (list)))
           (btor1264
            (signal
             (bvxor (signal-value btor1262) (signal-value btor1263))
             (list)))
           (btor1265
            (signal
             (extract 34 34 (signal-value btor1195))
             (signal-state btor1195)))
           (btor1266
            (signal
             (bvxor (signal-value btor1261) (signal-value btor1265))
             (list)))
           (btor1267
            (signal
             (bvand (signal-value btor1264) (signal-value btor1266))
             (list)))
           (btor1268 unnamed-input-1268)
           (btor1269
            (signal
             (extract 34 34 (signal-value btor1006))
             (signal-state btor1006)))
           (btor1270
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor1268)
              (signal-value btor1269))
             (list)))
           (btor1271
            (signal
             (bvxor (signal-value btor1270) (signal-value btor1263))
             (list)))
           (btor1272
            (signal
             (bvxor (signal-value btor1269) (signal-value btor1265))
             (list)))
           (btor1273
            (signal
             (bvand (signal-value btor1271) (signal-value btor1272))
             (list)))
           (btor1274
            (if (bitvector->bool (signal-value btor1094)) btor1273 btor1267))
           (btor1275 unnamed-input-1275)
           (btor1276 unnamed-input-1276)
           (btor1277
            (if (bitvector->bool (signal-value btor722)) btor963 btor1276))
           (btor1278
            (if (bitvector->bool (signal-value btor126)) btor1277 btor1275))
           (btor1279 unnamed-input-1279)
           (btor1280
            (if (bitvector->bool (signal-value btor716)) btor1279 btor1278))
           (btor1281
            (signal
             (apply bvor (bitvector->bits (signal-value btor1175)))
             (signal-state btor1175)))
           (btor1282
            (signal
             (bvand (signal-value btor1280) (signal-value btor1281))
             (list)))
           (btor1283
            (if (bitvector->bool (signal-value btor1282)) btor1274 btor1259))
           (btor1284
            (if (bitvector->bool (signal-value btor722)) btor1283 btor732))
           (btor1285
            (if (bitvector->bool (signal-value btor126)) btor1284 btor732))
           (btor1286
            (if (bitvector->bool (signal-value btor716)) btor97 btor1285))
           (btor1290
            (if (bitvector->bool (signal-value btor500)) btor1196 btor1195))
           (btor1291
            (if (bitvector->bool (signal-value btor722)) btor1290 btor742))
           (btor1292
            (if (bitvector->bool (signal-value btor126)) btor1291 btor742))
           (btor1293
            (if (bitvector->bool (signal-value btor716)) btor268 btor1292))
           (btor1297
            (signal
             (bvand (signal-value btor763) (signal-value btor864))
             (list)))
           (btor1298
            (if (bitvector->bool (signal-value btor1297)) btor549 btor783))
           (btor1303
            (signal
             (bvand (signal-value btor820) (signal-value btor872))
             (list)))
           (btor1304
            (if (bitvector->bool (signal-value btor1303)) btor608 btor840))
           (btor1309
            (signal
             (bvand (signal-value btor339) (signal-value btor360))
             (list)))
           (btor1310
            (if (bitvector->bool (signal-value btor1309)) btor19 btor887))
           (btor1315
            (signal
             (bvand (signal-value btor303) (signal-value btor324))
             (list)))
           (btor1316
            (if (bitvector->bool (signal-value btor1315)) btor888 btor901))
           (btor1321
            (signal
             (bvand (signal-value btor1032) (signal-value btor1106))
             (list)))
           (btor1322
            (if (bitvector->bool (signal-value btor1321)) btor1093 btor1052))
           (btor1327
            (signal
             (bvand (signal-value btor1072) (signal-value btor1114))
             (list)))
           (btor1328
            (if (bitvector->bool (signal-value btor1327)) btor14 btor1092)))
      (list
       (cons
        'scanouta
        (signal
         (signal-value btor214)
         (append
          (list (cons 'state1090 (signal-value btor1089)))
          (append
           (list (cons 'state1057 (signal-value btor1072)))
           (append
            (list (cons 'state1055 (signal-value btor1328)))
            (append
             (list (cons 'state1053 (signal-value btor1092)))
             (append
              (list (cons 'state1050 (signal-value btor1049)))
              (append
               (list (cons 'state1017 (signal-value btor1032)))
               (append
                (list (cons 'state1015 (signal-value btor1322)))
                (append
                 (list (cons 'state1013 (signal-value btor1052)))
                 (append
                  (list (cons 'state899 (signal-value btor318)))
                  (append
                   (list (cons 'state894 (signal-value btor303)))
                   (append
                    (list (cons 'state892 (signal-value btor1316)))
                    (append
                     (list (cons 'state890 (signal-value btor901)))
                     (append
                      (list (cons 'state885 (signal-value btor354)))
                      (append
                       (list (cons 'state880 (signal-value btor339)))
                       (append
                        (list (cons 'state878 (signal-value btor1310)))
                        (append
                         (list (cons 'state876 (signal-value btor887)))
                         (append
                          (list (cons 'state838 (signal-value btor837)))
                          (append
                           (list (cons 'state805 (signal-value btor820)))
                           (append
                            (list (cons 'state803 (signal-value btor1304)))
                            (append
                             (list (cons 'state801 (signal-value btor840)))
                             (append
                              (list (cons 'state781 (signal-value btor780)))
                              (append
                               (list (cons 'state748 (signal-value btor763)))
                               (append
                                (list (cons 'state746 (signal-value btor1298)))
                                (append
                                 (list (cons 'state744 (signal-value btor783)))
                                 (append
                                  (list
                                   (cons 'state738 (signal-value btor126)))
                                  (append
                                   (list
                                    (cons 'state736 (signal-value btor1293)))
                                   (append
                                    (list
                                     (cons 'state734 (signal-value btor742)))
                                    (append
                                     (list
                                      (cons 'state728 (signal-value btor126)))
                                     (append
                                      (list
                                       (cons
                                        'state726
                                        (signal-value btor1286)))
                                      (append
                                       (list
                                        (cons
                                         'state724
                                         (signal-value btor732)))
                                       (append
                                        (list
                                         (cons
                                          'state687
                                          (signal-value btor669)))
                                        (append
                                         (list
                                          (cons
                                           'state682
                                           (signal-value btor652)))
                                         (append
                                          (list
                                           (cons
                                            'state680
                                            (signal-value btor1240)))
                                          (append
                                           (list
                                            (cons
                                             'state678
                                             (signal-value btor689)))
                                           (append
                                            (list
                                             (cons
                                              'state670
                                              (signal-value btor669)))
                                            (append
                                             (list
                                              (cons
                                               'state637
                                               (signal-value btor652)))
                                             (append
                                              (list
                                               (cons
                                                'state635
                                                (signal-value btor1235)))
                                              (append
                                               (list
                                                (cons
                                                 'state633
                                                 (signal-value btor672)))
                                               (append
                                                (list
                                                 (cons
                                                  'state605
                                                  (signal-value btor604)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state572
                                                   (signal-value btor587)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state570
                                                    (signal-value btor1229)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state568
                                                     (signal-value btor607)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state546
                                                      (signal-value btor545)))
                                                    (append
                                                     (list
                                                      (cons
                                                       'state513
                                                       (signal-value btor528)))
                                                     (append
                                                      (list
                                                       (cons
                                                        'state511
                                                        (signal-value
                                                         btor1223)))
                                                      (append
                                                       (list
                                                        (cons
                                                         'state509
                                                         (signal-value
                                                          btor548)))
                                                       (append
                                                        (list
                                                         (cons
                                                          'state439
                                                          (signal-value
                                                           btor438)))
                                                        (append
                                                         (list
                                                          (cons
                                                           'state406
                                                           (signal-value
                                                            btor421)))
                                                         (append
                                                          (list
                                                           (cons
                                                            'state404
                                                            (signal-value
                                                             btor1217)))
                                                          (append
                                                           (list
                                                            (cons
                                                             'state402
                                                             (signal-value
                                                              btor441)))
                                                           (append
                                                            (list
                                                             (cons
                                                              'state399
                                                              (signal-value
                                                               btor398)))
                                                            (append
                                                             (list
                                                              (cons
                                                               'state366
                                                               (signal-value
                                                                btor381)))
                                                             (append
                                                              (list
                                                               (cons
                                                                'state364
                                                                (signal-value
                                                                 btor1211)))
                                                              (append
                                                               (list
                                                                (cons
                                                                 'state362
                                                                 (signal-value
                                                                  btor401)))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  'state283
                                                                  (signal-value
                                                                   btor126)))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   'state281
                                                                   (signal-value
                                                                    btor1206)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state279
                                                                    (signal-value
                                                                     btor287)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state273
                                                                     (signal-value
                                                                      btor126)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state271
                                                                      (signal-value
                                                                       btor1199)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state269
                                                                       (signal-value
                                                                        btor277)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state253
                                                                        (signal-value
                                                                         btor252)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state220
                                                                         (signal-value
                                                                          btor235)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state218
                                                                          (signal-value
                                                                           btor1159)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state216
                                                                           (signal-value
                                                                            btor255)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state203
                                                                            (signal-value
                                                                             btor202)))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             'state168
                                                                             (signal-value
                                                                              btor183)))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              'state166
                                                                              (signal-value
                                                                               btor1148)))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               'state164
                                                                               (signal-value
                                                                                btor205)))
                                                                             (append
                                                                              (list
                                                                               (cons
                                                                                'state157
                                                                                (signal-value
                                                                                 btor131)))
                                                                              (append
                                                                               (list
                                                                                (cons
                                                                                 'state156
                                                                                 (signal-value
                                                                                  btor1137)))
                                                                               (append
                                                                                (list
                                                                                 (cons
                                                                                  'state155
                                                                                  (signal-value
                                                                                   btor161)))
                                                                                (append
                                                                                 (list
                                                                                  (cons
                                                                                   'state149
                                                                                   (signal-value
                                                                                    btor131)))
                                                                                 (append
                                                                                  (list
                                                                                   (cons
                                                                                    'state148
                                                                                    (signal-value
                                                                                     btor732)))
                                                                                  (append
                                                                                   (list
                                                                                    (cons
                                                                                     'state147
                                                                                     (signal-value
                                                                                      btor153)))
                                                                                   (append
                                                                                    (list
                                                                                     (cons
                                                                                      'state141
                                                                                      (signal-value
                                                                                       btor126)))
                                                                                    (append
                                                                                     (list
                                                                                      (cons
                                                                                       'state139
                                                                                       (signal-value
                                                                                        btor1130)))
                                                                                     (append
                                                                                      (list
                                                                                       (cons
                                                                                        'state137
                                                                                        (signal-value
                                                                                         btor145)))
                                                                                      (append
                                                                                       (list
                                                                                        (cons
                                                                                         'state105
                                                                                         (signal-value
                                                                                          btor126)))
                                                                                       (append
                                                                                        (list
                                                                                         (cons
                                                                                          'state102
                                                                                          (signal-value
                                                                                           btor1124)))
                                                                                        (append
                                                                                         (list
                                                                                          (cons
                                                                                           'state100
                                                                                           (signal-value
                                                                                            btor131)))
                                                                                         (append
                                                                                          (list
                                                                                           (cons
                                                                                            'state98
                                                                                            (signal-value
                                                                                             btor131)))
                                                                                          (append
                                                                                           (list
                                                                                            (cons
                                                                                             'state96
                                                                                             (signal-value
                                                                                              btor287)))
                                                                                           (append
                                                                                            (list
                                                                                             (cons
                                                                                              'state95
                                                                                              (signal-value
                                                                                               btor135)))
                                                                                            (list))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
       (cons
        'accum_is_saturated
        (signal
         (signal-value btor135)
         (append
          (list (cons 'state1090 (signal-value btor1089)))
          (append
           (list (cons 'state1057 (signal-value btor1072)))
           (append
            (list (cons 'state1055 (signal-value btor1328)))
            (append
             (list (cons 'state1053 (signal-value btor1092)))
             (append
              (list (cons 'state1050 (signal-value btor1049)))
              (append
               (list (cons 'state1017 (signal-value btor1032)))
               (append
                (list (cons 'state1015 (signal-value btor1322)))
                (append
                 (list (cons 'state1013 (signal-value btor1052)))
                 (append
                  (list (cons 'state899 (signal-value btor318)))
                  (append
                   (list (cons 'state894 (signal-value btor303)))
                   (append
                    (list (cons 'state892 (signal-value btor1316)))
                    (append
                     (list (cons 'state890 (signal-value btor901)))
                     (append
                      (list (cons 'state885 (signal-value btor354)))
                      (append
                       (list (cons 'state880 (signal-value btor339)))
                       (append
                        (list (cons 'state878 (signal-value btor1310)))
                        (append
                         (list (cons 'state876 (signal-value btor887)))
                         (append
                          (list (cons 'state838 (signal-value btor837)))
                          (append
                           (list (cons 'state805 (signal-value btor820)))
                           (append
                            (list (cons 'state803 (signal-value btor1304)))
                            (append
                             (list (cons 'state801 (signal-value btor840)))
                             (append
                              (list (cons 'state781 (signal-value btor780)))
                              (append
                               (list (cons 'state748 (signal-value btor763)))
                               (append
                                (list (cons 'state746 (signal-value btor1298)))
                                (append
                                 (list (cons 'state744 (signal-value btor783)))
                                 (append
                                  (list
                                   (cons 'state738 (signal-value btor126)))
                                  (append
                                   (list
                                    (cons 'state736 (signal-value btor1293)))
                                   (append
                                    (list
                                     (cons 'state734 (signal-value btor742)))
                                    (append
                                     (list
                                      (cons 'state728 (signal-value btor126)))
                                     (append
                                      (list
                                       (cons
                                        'state726
                                        (signal-value btor1286)))
                                      (append
                                       (list
                                        (cons
                                         'state724
                                         (signal-value btor732)))
                                       (append
                                        (list
                                         (cons
                                          'state687
                                          (signal-value btor669)))
                                        (append
                                         (list
                                          (cons
                                           'state682
                                           (signal-value btor652)))
                                         (append
                                          (list
                                           (cons
                                            'state680
                                            (signal-value btor1240)))
                                          (append
                                           (list
                                            (cons
                                             'state678
                                             (signal-value btor689)))
                                           (append
                                            (list
                                             (cons
                                              'state670
                                              (signal-value btor669)))
                                            (append
                                             (list
                                              (cons
                                               'state637
                                               (signal-value btor652)))
                                             (append
                                              (list
                                               (cons
                                                'state635
                                                (signal-value btor1235)))
                                              (append
                                               (list
                                                (cons
                                                 'state633
                                                 (signal-value btor672)))
                                               (append
                                                (list
                                                 (cons
                                                  'state605
                                                  (signal-value btor604)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state572
                                                   (signal-value btor587)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state570
                                                    (signal-value btor1229)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state568
                                                     (signal-value btor607)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state546
                                                      (signal-value btor545)))
                                                    (append
                                                     (list
                                                      (cons
                                                       'state513
                                                       (signal-value btor528)))
                                                     (append
                                                      (list
                                                       (cons
                                                        'state511
                                                        (signal-value
                                                         btor1223)))
                                                      (append
                                                       (list
                                                        (cons
                                                         'state509
                                                         (signal-value
                                                          btor548)))
                                                       (append
                                                        (list
                                                         (cons
                                                          'state439
                                                          (signal-value
                                                           btor438)))
                                                        (append
                                                         (list
                                                          (cons
                                                           'state406
                                                           (signal-value
                                                            btor421)))
                                                         (append
                                                          (list
                                                           (cons
                                                            'state404
                                                            (signal-value
                                                             btor1217)))
                                                          (append
                                                           (list
                                                            (cons
                                                             'state402
                                                             (signal-value
                                                              btor441)))
                                                           (append
                                                            (list
                                                             (cons
                                                              'state399
                                                              (signal-value
                                                               btor398)))
                                                            (append
                                                             (list
                                                              (cons
                                                               'state366
                                                               (signal-value
                                                                btor381)))
                                                             (append
                                                              (list
                                                               (cons
                                                                'state364
                                                                (signal-value
                                                                 btor1211)))
                                                              (append
                                                               (list
                                                                (cons
                                                                 'state362
                                                                 (signal-value
                                                                  btor401)))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  'state283
                                                                  (signal-value
                                                                   btor126)))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   'state281
                                                                   (signal-value
                                                                    btor1206)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state279
                                                                    (signal-value
                                                                     btor287)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state273
                                                                     (signal-value
                                                                      btor126)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state271
                                                                      (signal-value
                                                                       btor1199)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state269
                                                                       (signal-value
                                                                        btor277)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state253
                                                                        (signal-value
                                                                         btor252)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state220
                                                                         (signal-value
                                                                          btor235)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state218
                                                                          (signal-value
                                                                           btor1159)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state216
                                                                           (signal-value
                                                                            btor255)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state203
                                                                            (signal-value
                                                                             btor202)))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             'state168
                                                                             (signal-value
                                                                              btor183)))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              'state166
                                                                              (signal-value
                                                                               btor1148)))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               'state164
                                                                               (signal-value
                                                                                btor205)))
                                                                             (append
                                                                              (list
                                                                               (cons
                                                                                'state157
                                                                                (signal-value
                                                                                 btor131)))
                                                                              (append
                                                                               (list
                                                                                (cons
                                                                                 'state156
                                                                                 (signal-value
                                                                                  btor1137)))
                                                                               (append
                                                                                (list
                                                                                 (cons
                                                                                  'state155
                                                                                  (signal-value
                                                                                   btor161)))
                                                                                (append
                                                                                 (list
                                                                                  (cons
                                                                                   'state149
                                                                                   (signal-value
                                                                                    btor131)))
                                                                                 (append
                                                                                  (list
                                                                                   (cons
                                                                                    'state148
                                                                                    (signal-value
                                                                                     btor732)))
                                                                                  (append
                                                                                   (list
                                                                                    (cons
                                                                                     'state147
                                                                                     (signal-value
                                                                                      btor153)))
                                                                                   (append
                                                                                    (list
                                                                                     (cons
                                                                                      'state141
                                                                                      (signal-value
                                                                                       btor126)))
                                                                                    (append
                                                                                     (list
                                                                                      (cons
                                                                                       'state139
                                                                                       (signal-value
                                                                                        btor1130)))
                                                                                     (append
                                                                                      (list
                                                                                       (cons
                                                                                        'state137
                                                                                        (signal-value
                                                                                         btor145)))
                                                                                      (append
                                                                                       (list
                                                                                        (cons
                                                                                         'state105
                                                                                         (signal-value
                                                                                          btor126)))
                                                                                       (append
                                                                                        (list
                                                                                         (cons
                                                                                          'state102
                                                                                          (signal-value
                                                                                           btor1124)))
                                                                                        (append
                                                                                         (list
                                                                                          (cons
                                                                                           'state100
                                                                                           (signal-value
                                                                                            btor131)))
                                                                                         (append
                                                                                          (list
                                                                                           (cons
                                                                                            'state98
                                                                                            (signal-value
                                                                                             btor131)))
                                                                                          (append
                                                                                           (list
                                                                                            (cons
                                                                                             'state96
                                                                                             (signal-value
                                                                                              btor287)))
                                                                                           (append
                                                                                            (list
                                                                                             (cons
                                                                                              'state95
                                                                                              (signal-value
                                                                                               btor135)))
                                                                                            (list))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
       (cons
        'result
        (signal
         (signal-value btor161)
         (append
          (list (cons 'state1090 (signal-value btor1089)))
          (append
           (list (cons 'state1057 (signal-value btor1072)))
           (append
            (list (cons 'state1055 (signal-value btor1328)))
            (append
             (list (cons 'state1053 (signal-value btor1092)))
             (append
              (list (cons 'state1050 (signal-value btor1049)))
              (append
               (list (cons 'state1017 (signal-value btor1032)))
               (append
                (list (cons 'state1015 (signal-value btor1322)))
                (append
                 (list (cons 'state1013 (signal-value btor1052)))
                 (append
                  (list (cons 'state899 (signal-value btor318)))
                  (append
                   (list (cons 'state894 (signal-value btor303)))
                   (append
                    (list (cons 'state892 (signal-value btor1316)))
                    (append
                     (list (cons 'state890 (signal-value btor901)))
                     (append
                      (list (cons 'state885 (signal-value btor354)))
                      (append
                       (list (cons 'state880 (signal-value btor339)))
                       (append
                        (list (cons 'state878 (signal-value btor1310)))
                        (append
                         (list (cons 'state876 (signal-value btor887)))
                         (append
                          (list (cons 'state838 (signal-value btor837)))
                          (append
                           (list (cons 'state805 (signal-value btor820)))
                           (append
                            (list (cons 'state803 (signal-value btor1304)))
                            (append
                             (list (cons 'state801 (signal-value btor840)))
                             (append
                              (list (cons 'state781 (signal-value btor780)))
                              (append
                               (list (cons 'state748 (signal-value btor763)))
                               (append
                                (list (cons 'state746 (signal-value btor1298)))
                                (append
                                 (list (cons 'state744 (signal-value btor783)))
                                 (append
                                  (list
                                   (cons 'state738 (signal-value btor126)))
                                  (append
                                   (list
                                    (cons 'state736 (signal-value btor1293)))
                                   (append
                                    (list
                                     (cons 'state734 (signal-value btor742)))
                                    (append
                                     (list
                                      (cons 'state728 (signal-value btor126)))
                                     (append
                                      (list
                                       (cons
                                        'state726
                                        (signal-value btor1286)))
                                      (append
                                       (list
                                        (cons
                                         'state724
                                         (signal-value btor732)))
                                       (append
                                        (list
                                         (cons
                                          'state687
                                          (signal-value btor669)))
                                        (append
                                         (list
                                          (cons
                                           'state682
                                           (signal-value btor652)))
                                         (append
                                          (list
                                           (cons
                                            'state680
                                            (signal-value btor1240)))
                                          (append
                                           (list
                                            (cons
                                             'state678
                                             (signal-value btor689)))
                                           (append
                                            (list
                                             (cons
                                              'state670
                                              (signal-value btor669)))
                                            (append
                                             (list
                                              (cons
                                               'state637
                                               (signal-value btor652)))
                                             (append
                                              (list
                                               (cons
                                                'state635
                                                (signal-value btor1235)))
                                              (append
                                               (list
                                                (cons
                                                 'state633
                                                 (signal-value btor672)))
                                               (append
                                                (list
                                                 (cons
                                                  'state605
                                                  (signal-value btor604)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state572
                                                   (signal-value btor587)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state570
                                                    (signal-value btor1229)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state568
                                                     (signal-value btor607)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state546
                                                      (signal-value btor545)))
                                                    (append
                                                     (list
                                                      (cons
                                                       'state513
                                                       (signal-value btor528)))
                                                     (append
                                                      (list
                                                       (cons
                                                        'state511
                                                        (signal-value
                                                         btor1223)))
                                                      (append
                                                       (list
                                                        (cons
                                                         'state509
                                                         (signal-value
                                                          btor548)))
                                                       (append
                                                        (list
                                                         (cons
                                                          'state439
                                                          (signal-value
                                                           btor438)))
                                                        (append
                                                         (list
                                                          (cons
                                                           'state406
                                                           (signal-value
                                                            btor421)))
                                                         (append
                                                          (list
                                                           (cons
                                                            'state404
                                                            (signal-value
                                                             btor1217)))
                                                          (append
                                                           (list
                                                            (cons
                                                             'state402
                                                             (signal-value
                                                              btor441)))
                                                           (append
                                                            (list
                                                             (cons
                                                              'state399
                                                              (signal-value
                                                               btor398)))
                                                            (append
                                                             (list
                                                              (cons
                                                               'state366
                                                               (signal-value
                                                                btor381)))
                                                             (append
                                                              (list
                                                               (cons
                                                                'state364
                                                                (signal-value
                                                                 btor1211)))
                                                              (append
                                                               (list
                                                                (cons
                                                                 'state362
                                                                 (signal-value
                                                                  btor401)))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  'state283
                                                                  (signal-value
                                                                   btor126)))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   'state281
                                                                   (signal-value
                                                                    btor1206)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state279
                                                                    (signal-value
                                                                     btor287)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state273
                                                                     (signal-value
                                                                      btor126)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state271
                                                                      (signal-value
                                                                       btor1199)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state269
                                                                       (signal-value
                                                                        btor277)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state253
                                                                        (signal-value
                                                                         btor252)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state220
                                                                         (signal-value
                                                                          btor235)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state218
                                                                          (signal-value
                                                                           btor1159)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state216
                                                                           (signal-value
                                                                            btor255)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state203
                                                                            (signal-value
                                                                             btor202)))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             'state168
                                                                             (signal-value
                                                                              btor183)))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              'state166
                                                                              (signal-value
                                                                               btor1148)))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               'state164
                                                                               (signal-value
                                                                                btor205)))
                                                                             (append
                                                                              (list
                                                                               (cons
                                                                                'state157
                                                                                (signal-value
                                                                                 btor131)))
                                                                              (append
                                                                               (list
                                                                                (cons
                                                                                 'state156
                                                                                 (signal-value
                                                                                  btor1137)))
                                                                               (append
                                                                                (list
                                                                                 (cons
                                                                                  'state155
                                                                                  (signal-value
                                                                                   btor161)))
                                                                                (append
                                                                                 (list
                                                                                  (cons
                                                                                   'state149
                                                                                   (signal-value
                                                                                    btor131)))
                                                                                 (append
                                                                                  (list
                                                                                   (cons
                                                                                    'state148
                                                                                    (signal-value
                                                                                     btor732)))
                                                                                  (append
                                                                                   (list
                                                                                    (cons
                                                                                     'state147
                                                                                     (signal-value
                                                                                      btor153)))
                                                                                   (append
                                                                                    (list
                                                                                     (cons
                                                                                      'state141
                                                                                      (signal-value
                                                                                       btor126)))
                                                                                    (append
                                                                                     (list
                                                                                      (cons
                                                                                       'state139
                                                                                       (signal-value
                                                                                        btor1130)))
                                                                                     (append
                                                                                      (list
                                                                                       (cons
                                                                                        'state137
                                                                                        (signal-value
                                                                                         btor145)))
                                                                                      (append
                                                                                       (list
                                                                                        (cons
                                                                                         'state105
                                                                                         (signal-value
                                                                                          btor126)))
                                                                                       (append
                                                                                        (list
                                                                                         (cons
                                                                                          'state102
                                                                                          (signal-value
                                                                                           btor1124)))
                                                                                        (append
                                                                                         (list
                                                                                          (cons
                                                                                           'state100
                                                                                           (signal-value
                                                                                            btor131)))
                                                                                         (append
                                                                                          (list
                                                                                           (cons
                                                                                            'state98
                                                                                            (signal-value
                                                                                             btor131)))
                                                                                          (append
                                                                                           (list
                                                                                            (cons
                                                                                             'state96
                                                                                             (signal-value
                                                                                              btor287)))
                                                                                           (append
                                                                                            (list
                                                                                             (cons
                                                                                              'state95
                                                                                              (signal-value
                                                                                               btor135)))
                                                                                            (list))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
       (cons
        'mult_is_saturated
        (signal
         (signal-value btor145)
         (append
          (list (cons 'state1090 (signal-value btor1089)))
          (append
           (list (cons 'state1057 (signal-value btor1072)))
           (append
            (list (cons 'state1055 (signal-value btor1328)))
            (append
             (list (cons 'state1053 (signal-value btor1092)))
             (append
              (list (cons 'state1050 (signal-value btor1049)))
              (append
               (list (cons 'state1017 (signal-value btor1032)))
               (append
                (list (cons 'state1015 (signal-value btor1322)))
                (append
                 (list (cons 'state1013 (signal-value btor1052)))
                 (append
                  (list (cons 'state899 (signal-value btor318)))
                  (append
                   (list (cons 'state894 (signal-value btor303)))
                   (append
                    (list (cons 'state892 (signal-value btor1316)))
                    (append
                     (list (cons 'state890 (signal-value btor901)))
                     (append
                      (list (cons 'state885 (signal-value btor354)))
                      (append
                       (list (cons 'state880 (signal-value btor339)))
                       (append
                        (list (cons 'state878 (signal-value btor1310)))
                        (append
                         (list (cons 'state876 (signal-value btor887)))
                         (append
                          (list (cons 'state838 (signal-value btor837)))
                          (append
                           (list (cons 'state805 (signal-value btor820)))
                           (append
                            (list (cons 'state803 (signal-value btor1304)))
                            (append
                             (list (cons 'state801 (signal-value btor840)))
                             (append
                              (list (cons 'state781 (signal-value btor780)))
                              (append
                               (list (cons 'state748 (signal-value btor763)))
                               (append
                                (list (cons 'state746 (signal-value btor1298)))
                                (append
                                 (list (cons 'state744 (signal-value btor783)))
                                 (append
                                  (list
                                   (cons 'state738 (signal-value btor126)))
                                  (append
                                   (list
                                    (cons 'state736 (signal-value btor1293)))
                                   (append
                                    (list
                                     (cons 'state734 (signal-value btor742)))
                                    (append
                                     (list
                                      (cons 'state728 (signal-value btor126)))
                                     (append
                                      (list
                                       (cons
                                        'state726
                                        (signal-value btor1286)))
                                      (append
                                       (list
                                        (cons
                                         'state724
                                         (signal-value btor732)))
                                       (append
                                        (list
                                         (cons
                                          'state687
                                          (signal-value btor669)))
                                        (append
                                         (list
                                          (cons
                                           'state682
                                           (signal-value btor652)))
                                         (append
                                          (list
                                           (cons
                                            'state680
                                            (signal-value btor1240)))
                                          (append
                                           (list
                                            (cons
                                             'state678
                                             (signal-value btor689)))
                                           (append
                                            (list
                                             (cons
                                              'state670
                                              (signal-value btor669)))
                                            (append
                                             (list
                                              (cons
                                               'state637
                                               (signal-value btor652)))
                                             (append
                                              (list
                                               (cons
                                                'state635
                                                (signal-value btor1235)))
                                              (append
                                               (list
                                                (cons
                                                 'state633
                                                 (signal-value btor672)))
                                               (append
                                                (list
                                                 (cons
                                                  'state605
                                                  (signal-value btor604)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state572
                                                   (signal-value btor587)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state570
                                                    (signal-value btor1229)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state568
                                                     (signal-value btor607)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state546
                                                      (signal-value btor545)))
                                                    (append
                                                     (list
                                                      (cons
                                                       'state513
                                                       (signal-value btor528)))
                                                     (append
                                                      (list
                                                       (cons
                                                        'state511
                                                        (signal-value
                                                         btor1223)))
                                                      (append
                                                       (list
                                                        (cons
                                                         'state509
                                                         (signal-value
                                                          btor548)))
                                                       (append
                                                        (list
                                                         (cons
                                                          'state439
                                                          (signal-value
                                                           btor438)))
                                                        (append
                                                         (list
                                                          (cons
                                                           'state406
                                                           (signal-value
                                                            btor421)))
                                                         (append
                                                          (list
                                                           (cons
                                                            'state404
                                                            (signal-value
                                                             btor1217)))
                                                          (append
                                                           (list
                                                            (cons
                                                             'state402
                                                             (signal-value
                                                              btor441)))
                                                           (append
                                                            (list
                                                             (cons
                                                              'state399
                                                              (signal-value
                                                               btor398)))
                                                            (append
                                                             (list
                                                              (cons
                                                               'state366
                                                               (signal-value
                                                                btor381)))
                                                             (append
                                                              (list
                                                               (cons
                                                                'state364
                                                                (signal-value
                                                                 btor1211)))
                                                              (append
                                                               (list
                                                                (cons
                                                                 'state362
                                                                 (signal-value
                                                                  btor401)))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  'state283
                                                                  (signal-value
                                                                   btor126)))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   'state281
                                                                   (signal-value
                                                                    btor1206)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state279
                                                                    (signal-value
                                                                     btor287)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state273
                                                                     (signal-value
                                                                      btor126)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state271
                                                                      (signal-value
                                                                       btor1199)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state269
                                                                       (signal-value
                                                                        btor277)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state253
                                                                        (signal-value
                                                                         btor252)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state220
                                                                         (signal-value
                                                                          btor235)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state218
                                                                          (signal-value
                                                                           btor1159)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state216
                                                                           (signal-value
                                                                            btor255)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state203
                                                                            (signal-value
                                                                             btor202)))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             'state168
                                                                             (signal-value
                                                                              btor183)))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              'state166
                                                                              (signal-value
                                                                               btor1148)))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               'state164
                                                                               (signal-value
                                                                                btor205)))
                                                                             (append
                                                                              (list
                                                                               (cons
                                                                                'state157
                                                                                (signal-value
                                                                                 btor131)))
                                                                              (append
                                                                               (list
                                                                                (cons
                                                                                 'state156
                                                                                 (signal-value
                                                                                  btor1137)))
                                                                               (append
                                                                                (list
                                                                                 (cons
                                                                                  'state155
                                                                                  (signal-value
                                                                                   btor161)))
                                                                                (append
                                                                                 (list
                                                                                  (cons
                                                                                   'state149
                                                                                   (signal-value
                                                                                    btor131)))
                                                                                 (append
                                                                                  (list
                                                                                   (cons
                                                                                    'state148
                                                                                    (signal-value
                                                                                     btor732)))
                                                                                  (append
                                                                                   (list
                                                                                    (cons
                                                                                     'state147
                                                                                     (signal-value
                                                                                      btor153)))
                                                                                   (append
                                                                                    (list
                                                                                     (cons
                                                                                      'state141
                                                                                      (signal-value
                                                                                       btor126)))
                                                                                    (append
                                                                                     (list
                                                                                      (cons
                                                                                       'state139
                                                                                       (signal-value
                                                                                        btor1130)))
                                                                                     (append
                                                                                      (list
                                                                                       (cons
                                                                                        'state137
                                                                                        (signal-value
                                                                                         btor145)))
                                                                                      (append
                                                                                       (list
                                                                                        (cons
                                                                                         'state105
                                                                                         (signal-value
                                                                                          btor126)))
                                                                                       (append
                                                                                        (list
                                                                                         (cons
                                                                                          'state102
                                                                                          (signal-value
                                                                                           btor1124)))
                                                                                        (append
                                                                                         (list
                                                                                          (cons
                                                                                           'state100
                                                                                           (signal-value
                                                                                            btor131)))
                                                                                         (append
                                                                                          (list
                                                                                           (cons
                                                                                            'state98
                                                                                            (signal-value
                                                                                             btor131)))
                                                                                          (append
                                                                                           (list
                                                                                            (cons
                                                                                             'state96
                                                                                             (signal-value
                                                                                              btor287)))
                                                                                           (append
                                                                                            (list
                                                                                             (cons
                                                                                              'state95
                                                                                              (signal-value
                                                                                               btor135)))
                                                                                            (list))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
       (cons
        'overflow
        (signal
         (signal-value btor153)
         (append
          (list (cons 'state1090 (signal-value btor1089)))
          (append
           (list (cons 'state1057 (signal-value btor1072)))
           (append
            (list (cons 'state1055 (signal-value btor1328)))
            (append
             (list (cons 'state1053 (signal-value btor1092)))
             (append
              (list (cons 'state1050 (signal-value btor1049)))
              (append
               (list (cons 'state1017 (signal-value btor1032)))
               (append
                (list (cons 'state1015 (signal-value btor1322)))
                (append
                 (list (cons 'state1013 (signal-value btor1052)))
                 (append
                  (list (cons 'state899 (signal-value btor318)))
                  (append
                   (list (cons 'state894 (signal-value btor303)))
                   (append
                    (list (cons 'state892 (signal-value btor1316)))
                    (append
                     (list (cons 'state890 (signal-value btor901)))
                     (append
                      (list (cons 'state885 (signal-value btor354)))
                      (append
                       (list (cons 'state880 (signal-value btor339)))
                       (append
                        (list (cons 'state878 (signal-value btor1310)))
                        (append
                         (list (cons 'state876 (signal-value btor887)))
                         (append
                          (list (cons 'state838 (signal-value btor837)))
                          (append
                           (list (cons 'state805 (signal-value btor820)))
                           (append
                            (list (cons 'state803 (signal-value btor1304)))
                            (append
                             (list (cons 'state801 (signal-value btor840)))
                             (append
                              (list (cons 'state781 (signal-value btor780)))
                              (append
                               (list (cons 'state748 (signal-value btor763)))
                               (append
                                (list (cons 'state746 (signal-value btor1298)))
                                (append
                                 (list (cons 'state744 (signal-value btor783)))
                                 (append
                                  (list
                                   (cons 'state738 (signal-value btor126)))
                                  (append
                                   (list
                                    (cons 'state736 (signal-value btor1293)))
                                   (append
                                    (list
                                     (cons 'state734 (signal-value btor742)))
                                    (append
                                     (list
                                      (cons 'state728 (signal-value btor126)))
                                     (append
                                      (list
                                       (cons
                                        'state726
                                        (signal-value btor1286)))
                                      (append
                                       (list
                                        (cons
                                         'state724
                                         (signal-value btor732)))
                                       (append
                                        (list
                                         (cons
                                          'state687
                                          (signal-value btor669)))
                                        (append
                                         (list
                                          (cons
                                           'state682
                                           (signal-value btor652)))
                                         (append
                                          (list
                                           (cons
                                            'state680
                                            (signal-value btor1240)))
                                          (append
                                           (list
                                            (cons
                                             'state678
                                             (signal-value btor689)))
                                           (append
                                            (list
                                             (cons
                                              'state670
                                              (signal-value btor669)))
                                            (append
                                             (list
                                              (cons
                                               'state637
                                               (signal-value btor652)))
                                             (append
                                              (list
                                               (cons
                                                'state635
                                                (signal-value btor1235)))
                                              (append
                                               (list
                                                (cons
                                                 'state633
                                                 (signal-value btor672)))
                                               (append
                                                (list
                                                 (cons
                                                  'state605
                                                  (signal-value btor604)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state572
                                                   (signal-value btor587)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state570
                                                    (signal-value btor1229)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state568
                                                     (signal-value btor607)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state546
                                                      (signal-value btor545)))
                                                    (append
                                                     (list
                                                      (cons
                                                       'state513
                                                       (signal-value btor528)))
                                                     (append
                                                      (list
                                                       (cons
                                                        'state511
                                                        (signal-value
                                                         btor1223)))
                                                      (append
                                                       (list
                                                        (cons
                                                         'state509
                                                         (signal-value
                                                          btor548)))
                                                       (append
                                                        (list
                                                         (cons
                                                          'state439
                                                          (signal-value
                                                           btor438)))
                                                        (append
                                                         (list
                                                          (cons
                                                           'state406
                                                           (signal-value
                                                            btor421)))
                                                         (append
                                                          (list
                                                           (cons
                                                            'state404
                                                            (signal-value
                                                             btor1217)))
                                                          (append
                                                           (list
                                                            (cons
                                                             'state402
                                                             (signal-value
                                                              btor441)))
                                                           (append
                                                            (list
                                                             (cons
                                                              'state399
                                                              (signal-value
                                                               btor398)))
                                                            (append
                                                             (list
                                                              (cons
                                                               'state366
                                                               (signal-value
                                                                btor381)))
                                                             (append
                                                              (list
                                                               (cons
                                                                'state364
                                                                (signal-value
                                                                 btor1211)))
                                                              (append
                                                               (list
                                                                (cons
                                                                 'state362
                                                                 (signal-value
                                                                  btor401)))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  'state283
                                                                  (signal-value
                                                                   btor126)))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   'state281
                                                                   (signal-value
                                                                    btor1206)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state279
                                                                    (signal-value
                                                                     btor287)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state273
                                                                     (signal-value
                                                                      btor126)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state271
                                                                      (signal-value
                                                                       btor1199)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state269
                                                                       (signal-value
                                                                        btor277)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state253
                                                                        (signal-value
                                                                         btor252)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state220
                                                                         (signal-value
                                                                          btor235)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state218
                                                                          (signal-value
                                                                           btor1159)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state216
                                                                           (signal-value
                                                                            btor255)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state203
                                                                            (signal-value
                                                                             btor202)))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             'state168
                                                                             (signal-value
                                                                              btor183)))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              'state166
                                                                              (signal-value
                                                                               btor1148)))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               'state164
                                                                               (signal-value
                                                                                btor205)))
                                                                             (append
                                                                              (list
                                                                               (cons
                                                                                'state157
                                                                                (signal-value
                                                                                 btor131)))
                                                                              (append
                                                                               (list
                                                                                (cons
                                                                                 'state156
                                                                                 (signal-value
                                                                                  btor1137)))
                                                                               (append
                                                                                (list
                                                                                 (cons
                                                                                  'state155
                                                                                  (signal-value
                                                                                   btor161)))
                                                                                (append
                                                                                 (list
                                                                                  (cons
                                                                                   'state149
                                                                                   (signal-value
                                                                                    btor131)))
                                                                                 (append
                                                                                  (list
                                                                                   (cons
                                                                                    'state148
                                                                                    (signal-value
                                                                                     btor732)))
                                                                                  (append
                                                                                   (list
                                                                                    (cons
                                                                                     'state147
                                                                                     (signal-value
                                                                                      btor153)))
                                                                                   (append
                                                                                    (list
                                                                                     (cons
                                                                                      'state141
                                                                                      (signal-value
                                                                                       btor126)))
                                                                                    (append
                                                                                     (list
                                                                                      (cons
                                                                                       'state139
                                                                                       (signal-value
                                                                                        btor1130)))
                                                                                     (append
                                                                                      (list
                                                                                       (cons
                                                                                        'state137
                                                                                        (signal-value
                                                                                         btor145)))
                                                                                      (append
                                                                                       (list
                                                                                        (cons
                                                                                         'state105
                                                                                         (signal-value
                                                                                          btor126)))
                                                                                       (append
                                                                                        (list
                                                                                         (cons
                                                                                          'state102
                                                                                          (signal-value
                                                                                           btor1124)))
                                                                                        (append
                                                                                         (list
                                                                                          (cons
                                                                                           'state100
                                                                                           (signal-value
                                                                                            btor131)))
                                                                                         (append
                                                                                          (list
                                                                                           (cons
                                                                                            'state98
                                                                                            (signal-value
                                                                                             btor131)))
                                                                                          (append
                                                                                           (list
                                                                                            (cons
                                                                                             'state96
                                                                                             (signal-value
                                                                                              btor287)))
                                                                                           (append
                                                                                            (list
                                                                                             (cons
                                                                                              'state95
                                                                                              (signal-value
                                                                                               btor135)))
                                                                                            (list))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
       (cons
        'scanoutb
        (signal
         (signal-value btor264)
         (append
          (list (cons 'state1090 (signal-value btor1089)))
          (append
           (list (cons 'state1057 (signal-value btor1072)))
           (append
            (list (cons 'state1055 (signal-value btor1328)))
            (append
             (list (cons 'state1053 (signal-value btor1092)))
             (append
              (list (cons 'state1050 (signal-value btor1049)))
              (append
               (list (cons 'state1017 (signal-value btor1032)))
               (append
                (list (cons 'state1015 (signal-value btor1322)))
                (append
                 (list (cons 'state1013 (signal-value btor1052)))
                 (append
                  (list (cons 'state899 (signal-value btor318)))
                  (append
                   (list (cons 'state894 (signal-value btor303)))
                   (append
                    (list (cons 'state892 (signal-value btor1316)))
                    (append
                     (list (cons 'state890 (signal-value btor901)))
                     (append
                      (list (cons 'state885 (signal-value btor354)))
                      (append
                       (list (cons 'state880 (signal-value btor339)))
                       (append
                        (list (cons 'state878 (signal-value btor1310)))
                        (append
                         (list (cons 'state876 (signal-value btor887)))
                         (append
                          (list (cons 'state838 (signal-value btor837)))
                          (append
                           (list (cons 'state805 (signal-value btor820)))
                           (append
                            (list (cons 'state803 (signal-value btor1304)))
                            (append
                             (list (cons 'state801 (signal-value btor840)))
                             (append
                              (list (cons 'state781 (signal-value btor780)))
                              (append
                               (list (cons 'state748 (signal-value btor763)))
                               (append
                                (list (cons 'state746 (signal-value btor1298)))
                                (append
                                 (list (cons 'state744 (signal-value btor783)))
                                 (append
                                  (list
                                   (cons 'state738 (signal-value btor126)))
                                  (append
                                   (list
                                    (cons 'state736 (signal-value btor1293)))
                                   (append
                                    (list
                                     (cons 'state734 (signal-value btor742)))
                                    (append
                                     (list
                                      (cons 'state728 (signal-value btor126)))
                                     (append
                                      (list
                                       (cons
                                        'state726
                                        (signal-value btor1286)))
                                      (append
                                       (list
                                        (cons
                                         'state724
                                         (signal-value btor732)))
                                       (append
                                        (list
                                         (cons
                                          'state687
                                          (signal-value btor669)))
                                        (append
                                         (list
                                          (cons
                                           'state682
                                           (signal-value btor652)))
                                         (append
                                          (list
                                           (cons
                                            'state680
                                            (signal-value btor1240)))
                                          (append
                                           (list
                                            (cons
                                             'state678
                                             (signal-value btor689)))
                                           (append
                                            (list
                                             (cons
                                              'state670
                                              (signal-value btor669)))
                                            (append
                                             (list
                                              (cons
                                               'state637
                                               (signal-value btor652)))
                                             (append
                                              (list
                                               (cons
                                                'state635
                                                (signal-value btor1235)))
                                              (append
                                               (list
                                                (cons
                                                 'state633
                                                 (signal-value btor672)))
                                               (append
                                                (list
                                                 (cons
                                                  'state605
                                                  (signal-value btor604)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state572
                                                   (signal-value btor587)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state570
                                                    (signal-value btor1229)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state568
                                                     (signal-value btor607)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state546
                                                      (signal-value btor545)))
                                                    (append
                                                     (list
                                                      (cons
                                                       'state513
                                                       (signal-value btor528)))
                                                     (append
                                                      (list
                                                       (cons
                                                        'state511
                                                        (signal-value
                                                         btor1223)))
                                                      (append
                                                       (list
                                                        (cons
                                                         'state509
                                                         (signal-value
                                                          btor548)))
                                                       (append
                                                        (list
                                                         (cons
                                                          'state439
                                                          (signal-value
                                                           btor438)))
                                                        (append
                                                         (list
                                                          (cons
                                                           'state406
                                                           (signal-value
                                                            btor421)))
                                                         (append
                                                          (list
                                                           (cons
                                                            'state404
                                                            (signal-value
                                                             btor1217)))
                                                          (append
                                                           (list
                                                            (cons
                                                             'state402
                                                             (signal-value
                                                              btor441)))
                                                           (append
                                                            (list
                                                             (cons
                                                              'state399
                                                              (signal-value
                                                               btor398)))
                                                            (append
                                                             (list
                                                              (cons
                                                               'state366
                                                               (signal-value
                                                                btor381)))
                                                             (append
                                                              (list
                                                               (cons
                                                                'state364
                                                                (signal-value
                                                                 btor1211)))
                                                              (append
                                                               (list
                                                                (cons
                                                                 'state362
                                                                 (signal-value
                                                                  btor401)))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  'state283
                                                                  (signal-value
                                                                   btor126)))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   'state281
                                                                   (signal-value
                                                                    btor1206)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state279
                                                                    (signal-value
                                                                     btor287)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state273
                                                                     (signal-value
                                                                      btor126)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state271
                                                                      (signal-value
                                                                       btor1199)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state269
                                                                       (signal-value
                                                                        btor277)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state253
                                                                        (signal-value
                                                                         btor252)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state220
                                                                         (signal-value
                                                                          btor235)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state218
                                                                          (signal-value
                                                                           btor1159)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state216
                                                                           (signal-value
                                                                            btor255)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state203
                                                                            (signal-value
                                                                             btor202)))
                                                                          (append
                                                                           (list
                                                                            (cons
                                                                             'state168
                                                                             (signal-value
                                                                              btor183)))
                                                                           (append
                                                                            (list
                                                                             (cons
                                                                              'state166
                                                                              (signal-value
                                                                               btor1148)))
                                                                            (append
                                                                             (list
                                                                              (cons
                                                                               'state164
                                                                               (signal-value
                                                                                btor205)))
                                                                             (append
                                                                              (list
                                                                               (cons
                                                                                'state157
                                                                                (signal-value
                                                                                 btor131)))
                                                                              (append
                                                                               (list
                                                                                (cons
                                                                                 'state156
                                                                                 (signal-value
                                                                                  btor1137)))
                                                                               (append
                                                                                (list
                                                                                 (cons
                                                                                  'state155
                                                                                  (signal-value
                                                                                   btor161)))
                                                                                (append
                                                                                 (list
                                                                                  (cons
                                                                                   'state149
                                                                                   (signal-value
                                                                                    btor131)))
                                                                                 (append
                                                                                  (list
                                                                                   (cons
                                                                                    'state148
                                                                                    (signal-value
                                                                                     btor732)))
                                                                                  (append
                                                                                   (list
                                                                                    (cons
                                                                                     'state147
                                                                                     (signal-value
                                                                                      btor153)))
                                                                                   (append
                                                                                    (list
                                                                                     (cons
                                                                                      'state141
                                                                                      (signal-value
                                                                                       btor126)))
                                                                                    (append
                                                                                     (list
                                                                                      (cons
                                                                                       'state139
                                                                                       (signal-value
                                                                                        btor1130)))
                                                                                     (append
                                                                                      (list
                                                                                       (cons
                                                                                        'state137
                                                                                        (signal-value
                                                                                         btor145)))
                                                                                      (append
                                                                                       (list
                                                                                        (cons
                                                                                         'state105
                                                                                         (signal-value
                                                                                          btor126)))
                                                                                       (append
                                                                                        (list
                                                                                         (cons
                                                                                          'state102
                                                                                          (signal-value
                                                                                           btor1124)))
                                                                                        (append
                                                                                         (list
                                                                                          (cons
                                                                                           'state100
                                                                                           (signal-value
                                                                                            btor131)))
                                                                                         (append
                                                                                          (list
                                                                                           (cons
                                                                                            'state98
                                                                                            (signal-value
                                                                                             btor131)))
                                                                                          (append
                                                                                           (list
                                                                                            (cons
                                                                                             'state96
                                                                                             (signal-value
                                                                                              btor287)))
                                                                                           (append
                                                                                            (list
                                                                                             (cons
                                                                                              'state95
                                                                                              (signal-value
                                                                                               btor135)))
                                                                                            (list))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

