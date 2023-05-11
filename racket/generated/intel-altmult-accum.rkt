;;; Imported with
;;;
;;; $LAKEROAD_DIR/bin/verilog_to_racket.py \
;;;   --infile ~/lakeroad-private/altera_mf/altera_mf_modified.v \
;;;   --top altmult_accum \
;;;   --parameter width_a=18 \
;;;   --parameter width_b=18 \
;;;   --parameter width_b=36 \
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
      (datac (bv->signal (constant 'datac (bitvector 36))))
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
      #:unnamed-input-493
      (unnamed-input-493
       (bv->signal (constant 'unnamed-input-493 (bitvector 1))))
      #:unnamed-input-495
      (unnamed-input-495
       (bv->signal (constant 'unnamed-input-495 (bitvector 1))))
      #:unnamed-input-1000
      (unnamed-input-1000
       (bv->signal (constant 'unnamed-input-1000 (bitvector 1))))
      #:unnamed-input-1002
      (unnamed-input-1002
       (bv->signal (constant 'unnamed-input-1002 (bitvector 36))))
      #:unnamed-input-1005
      (unnamed-input-1005
       (bv->signal (constant 'unnamed-input-1005 (bitvector 36))))
      #:unnamed-input-1027
      (unnamed-input-1027
       (bv->signal (constant 'unnamed-input-1027 (bitvector 1))))
      #:unnamed-input-1036
      (unnamed-input-1036
       (bv->signal (constant 'unnamed-input-1036 (bitvector 36))))
      #:unnamed-input-1043
      (unnamed-input-1043
       (bv->signal (constant 'unnamed-input-1043 (bitvector 36))))
      #:unnamed-input-1054
      (unnamed-input-1054
       (bv->signal (constant 'unnamed-input-1054 (bitvector 1))))
      #:unnamed-input-1057
      (unnamed-input-1057
       (bv->signal (constant 'unnamed-input-1057 (bitvector 1)))))
    (let* ((merged-input-state-hash (list))
           (init-hash
            (append
             (list (cons 'state928 (bv 1 (bitvector 1))))
             (append
              (list (cons 'state926 (bv 0 (bitvector 1))))
              (append
               (list (cons 'state924 (bv 0 (bitvector 1))))
               (append
                (list (cons 'state888 (bv 1 (bitvector 1))))
                (append
                 (list (cons 'state886 (bv 0 (bitvector 1))))
                 (append
                  (list (cons 'state884 (bv 0 (bitvector 1))))
                  (append
                   (list (cons 'state863 (bv 1 (bitvector 1))))
                   (append
                    (list (cons 'state861 (bv 0 (bitvector 1))))
                    (append
                     (list (cons 'state859 (bv 0 (bitvector 1))))
                     (append
                      (list (cons 'state849 (bv 1 (bitvector 1))))
                      (append
                       (list (cons 'state847 (bv 0 (bitvector 1))))
                       (append
                        (list (cons 'state845 (bv 0 (bitvector 1))))
                        (append
                         (list (cons 'state773 (bv 1 (bitvector 1))))
                         (append
                          (list (cons 'state771 (bv 0 (bitvector 1))))
                          (append
                           (list (cons 'state769 (bv 0 (bitvector 1))))
                           (append
                            (list (cons 'state716 (bv 1 (bitvector 1))))
                            (append
                             (list (cons 'state714 (bv 0 (bitvector 1))))
                             (append
                              (list (cons 'state712 (bv 0 (bitvector 1))))
                              (append
                               (list (cons 'state706 (bv 1 (bitvector 1))))
                               (append
                                (list (cons 'state704 (bv 0 (bitvector 36))))
                                (append
                                 (list (cons 'state702 (bv 0 (bitvector 36))))
                                 (append
                                  (list (cons 'state662 (bv 1 (bitvector 1))))
                                  (append
                                   (list
                                    (cons 'state660 (bv 0 (bitvector 36))))
                                   (append
                                    (list
                                     (cons 'state658 (bv 0 (bitvector 36))))
                                    (append
                                     (list
                                      (cons 'state618 (bv 1 (bitvector 1))))
                                     (append
                                      (list
                                       (cons 'state616 (bv 0 (bitvector 1))))
                                      (append
                                       (list
                                        (cons 'state614 (bv 0 (bitvector 1))))
                                       (append
                                        (list
                                         (cons 'state565 (bv 1 (bitvector 1))))
                                        (append
                                         (list
                                          (cons
                                           'state563
                                           (bv 0 (bitvector 1))))
                                         (append
                                          (list
                                           (cons
                                            'state561
                                            (bv 0 (bitvector 1))))
                                          (append
                                           (list
                                            (cons
                                             'state516
                                             (bv 1 (bitvector 1))))
                                           (append
                                            (list
                                             (cons
                                              'state514
                                              (bv 0 (bitvector 1))))
                                            (append
                                             (list
                                              (cons
                                               'state512
                                               (bv 0 (bitvector 1))))
                                             (append
                                              (list
                                               (cons
                                                'state401
                                                (bv 1 (bitvector 1))))
                                              (append
                                               (list
                                                (cons
                                                 'state399
                                                 (bv 0 (bitvector 1))))
                                               (append
                                                (list
                                                 (cons
                                                  'state397
                                                  (bv 0 (bitvector 1))))
                                                (append
                                                 (list
                                                  (cons
                                                   'state361
                                                   (bv 1 (bitvector 1))))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state359
                                                    (bv 0 (bitvector 1))))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state357
                                                     (bv 0 (bitvector 1))))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state278
                                                      (bv 1 (bitvector 1))))
                                                    (append
                                                     (list
                                                      (cons
                                                       'state276
                                                       (bv 0 (bitvector 1))))
                                                     (append
                                                      (list
                                                       (cons
                                                        'state274
                                                        (bv 0 (bitvector 1))))
                                                      (append
                                                       (list
                                                        (cons
                                                         'state268
                                                         (bv 1 (bitvector 1))))
                                                       (append
                                                        (list
                                                         (cons
                                                          'state266
                                                          (bv
                                                           0
                                                           (bitvector 36))))
                                                        (append
                                                         (list
                                                          (cons
                                                           'state264
                                                           (bv
                                                            0
                                                            (bitvector 36))))
                                                         (append
                                                          (list
                                                           (cons
                                                            'state217
                                                            (bv
                                                             1
                                                             (bitvector 1))))
                                                          (append
                                                           (list
                                                            (cons
                                                             'state215
                                                             (bv
                                                              0
                                                              (bitvector 18))))
                                                           (append
                                                            (list
                                                             (cons
                                                              'state213
                                                              (bv
                                                               0
                                                               (bitvector
                                                                18))))
                                                            (append
                                                             (list
                                                              (cons
                                                               'state165
                                                               (bv
                                                                1
                                                                (bitvector
                                                                 1))))
                                                             (append
                                                              (list
                                                               (cons
                                                                'state163
                                                                (bv
                                                                 0
                                                                 (bitvector
                                                                  18))))
                                                              (append
                                                               (list
                                                                (cons
                                                                 'state161
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
                                                                     36))))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state150
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
           (btor45 (bitvector 36))
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
           (btor149 (bv->signal (bv 0 (bitvector 36))))
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
                          (bv 0 36))))))))
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
                          (bv 0 36))))))))
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
           (btor160 (bv->signal (bv 0 (bitvector 18))))
           (btor161
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state161)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state161)))
                     ((assoc-has-key? init-hash 'state161)
                      (bv->signal (assoc-ref init-hash 'state161)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor163
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state163)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state163)))
                     ((assoc-has-key? init-hash 'state163)
                      (bv->signal (assoc-ref init-hash 'state163)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor165
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state165)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state165)))
                     ((assoc-has-key? init-hash 'state165)
                      (bv->signal (assoc-ref init-hash 'state165)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor167
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor168
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor167)))
             (list)))
           (btor169
            (if (bitvector->bool (signal-value btor168)) btor36 btor95))
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
            (if (bitvector->bool (signal-value btor171)) btor35 btor169))
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
            (if (bitvector->bool (signal-value btor174)) btor34 btor172))
           (btor176
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor116)))
             (list)))
           (btor177
            (if (bitvector->bool (signal-value btor176)) btor95 btor175))
           (btor178
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor179
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor178)))
             (list)))
           (btor180
            (if (bitvector->bool (signal-value btor179)) btor33 btor177))
           (btor181
            (signal
             (concat (signal-value btor180) (signal-value btor165))
             (list)))
           (btor182
            (signal
             (bool->bitvector
              (bveq (signal-value btor181) (signal-value btor125)))
             (list)))
           (btor183
            (if (bitvector->bool (signal-value btor182)) btor163 btor161))
           (btor184
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor185
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor184)))
             (list)))
           (btor186
            (if (bitvector->bool (signal-value btor185)) btor26 btor95))
           (btor187
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor188
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor187)))
             (list)))
           (btor189
            (if (bitvector->bool (signal-value btor188)) btor25 btor186))
           (btor190
            (signal
             (apply bvor (bitvector->bits (signal-value btor53)))
             (signal-state btor53)))
           (btor191 (signal (bvnot (signal-value btor190)) (list)))
           (btor192
            (if (bitvector->bool (signal-value btor191)) btor24 btor189))
           (btor193 (bv->signal (bv 25 (bitvector 5))))
           (btor194
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor193)))
             (list)))
           (btor195
            (if (bitvector->bool (signal-value btor194)) btor95 btor192))
           (btor196 (bv->signal (bv 3 (bitvector 2))))
           (btor197
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 5))
             btor196))
           (btor198
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor197)))
             (list)))
           (btor199
            (if (bitvector->bool (signal-value btor198)) btor27 btor195))
           (btor200
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state200)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state200)))
                     ((assoc-has-key? init-hash 'state200)
                      (bv->signal (assoc-ref init-hash 'state200)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor201
            (signal
             (bvor (signal-value btor199) (signal-value btor200))
             (list)))
           (btor202
            (if (bitvector->bool (signal-value btor201)) btor160 btor183))
           (btor203 (bv->signal (bv 17 (bitvector 5))))
           (btor204
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor203)))
             (list)))
           (btor205
            (signal
             (bvor (signal-value btor204) (signal-value btor93))
             (list)))
           (btor206
            (if (bitvector->bool (signal-value btor205)) btor81 btor43))
           (btor207 (bv->signal (bv 10 (bitvector 4))))
           (btor208
            (bv->signal
             (zero-extend (signal-value btor207) (bitvector 5))
             btor207))
           (btor209
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor208)))
             (list)))
           (btor210
            (if (bitvector->bool (signal-value btor209)) btor43 btor206))
           (btor211
            (if (bitvector->bool (signal-value btor176)) btor210 btor202))
           (btor213
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state213)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state213)))
                     ((assoc-has-key? init-hash 'state213)
                      (bv->signal (assoc-ref init-hash 'state213)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor215
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state215)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state215)))
                     ((assoc-has-key? init-hash 'state215)
                      (bv->signal (assoc-ref init-hash 'state215)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor217
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state217)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state217)))
                     ((assoc-has-key? init-hash 'state217)
                      (bv->signal (assoc-ref init-hash 'state217)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor219
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor220
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor219)))
             (list)))
           (btor221
            (if (bitvector->bool (signal-value btor220)) btor36 btor95))
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
            (if (bitvector->bool (signal-value btor223)) btor35 btor221))
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
            (if (bitvector->bool (signal-value btor226)) btor34 btor224))
           (btor228
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor116)))
             (list)))
           (btor229
            (if (bitvector->bool (signal-value btor228)) btor95 btor227))
           (btor230
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor231
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor230)))
             (list)))
           (btor232
            (if (bitvector->bool (signal-value btor231)) btor33 btor229))
           (btor233
            (signal
             (concat (signal-value btor232) (signal-value btor217))
             (list)))
           (btor234
            (signal
             (bool->bitvector
              (bveq (signal-value btor233) (signal-value btor125)))
             (list)))
           (btor235
            (if (bitvector->bool (signal-value btor234)) btor215 btor213))
           (btor236
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor237
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor236)))
             (list)))
           (btor238
            (if (bitvector->bool (signal-value btor237)) btor26 btor95))
           (btor239
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor240
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor239)))
             (list)))
           (btor241
            (if (bitvector->bool (signal-value btor240)) btor25 btor238))
           (btor242
            (signal
             (apply bvor (bitvector->bits (signal-value btor54)))
             (signal-state btor54)))
           (btor243 (signal (bvnot (signal-value btor242)) (list)))
           (btor244
            (if (bitvector->bool (signal-value btor243)) btor24 btor241))
           (btor245
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor193)))
             (list)))
           (btor246
            (if (bitvector->bool (signal-value btor245)) btor95 btor244))
           (btor247
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 5))
             btor196))
           (btor248
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor247)))
             (list)))
           (btor249
            (if (bitvector->bool (signal-value btor248)) btor27 btor246))
           (btor250
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state250)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state250)))
                     ((assoc-has-key? init-hash 'state250)
                      (bv->signal (assoc-ref init-hash 'state250)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor251
            (signal
             (bvor (signal-value btor249) (signal-value btor250))
             (list)))
           (btor252
            (if (bitvector->bool (signal-value btor251)) btor160 btor235))
           (btor253 (bv->signal (bv 18 (bitvector 5))))
           (btor254
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor253)))
             (list)))
           (btor255
            (signal
             (bvor (signal-value btor254) (signal-value btor94))
             (list)))
           (btor256
            (if (bitvector->bool (signal-value btor255)) btor82 btor44))
           (btor257 (bv->signal (bv 11 (bitvector 4))))
           (btor258
            (bv->signal
             (zero-extend (signal-value btor257) (bitvector 5))
             btor257))
           (btor259
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor258)))
             (list)))
           (btor260
            (if (bitvector->bool (signal-value btor259)) btor44 btor256))
           (btor261
            (if (bitvector->bool (signal-value btor228)) btor260 btor252))
           (btor263
            (bv->signal
             (zero-extend (signal-value btor127) (bitvector 1))
             btor127))
           (btor264
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state264)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state264)))
                     ((assoc-has-key? init-hash 'state264)
                      (bv->signal (assoc-ref init-hash 'state264)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor266
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state266)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state266)))
                     ((assoc-has-key? init-hash 'state266)
                      (bv->signal (assoc-ref init-hash 'state266)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor268
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state268)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state268)))
                     ((assoc-has-key? init-hash 'state268)
                      (bv->signal (assoc-ref init-hash 'state268)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor270
            (signal
             (concat (signal-value btor122) (signal-value btor268))
             (list)))
           (btor271
            (signal
             (bool->bitvector
              (bveq (signal-value btor270) (signal-value btor125)))
             (list)))
           (btor272
            (if (bitvector->bool (signal-value btor271)) btor266 btor264))
           (btor273
            (bv->signal
             (zero-extend (signal-value btor272) (bitvector 36))
             btor272))
           (btor274
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state274)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state274)))
                     ((assoc-has-key? init-hash 'state274)
                      (bv->signal (assoc-ref init-hash 'state274)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor276
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state276)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state276)))
                     ((assoc-has-key? init-hash 'state276)
                      (bv->signal (assoc-ref init-hash 'state276)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor278
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state278)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state278)))
                     ((assoc-has-key? init-hash 'state278)
                      (bv->signal (assoc-ref init-hash 'state278)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor280
            (signal
             (concat (signal-value btor122) (signal-value btor278))
             (list)))
           (btor281
            (signal
             (bool->bitvector
              (bveq (signal-value btor280) (signal-value btor125)))
             (list)))
           (btor282
            (if (bitvector->bool (signal-value btor281)) btor276 btor274))
           (btor283
            (bv->signal
             (zero-extend (signal-value btor282) (bitvector 1))
             btor282))
           (btor284
            (bv->signal
             (zero-extend (signal-value btor19) (bitvector 1))
             btor19))
           (btor285
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor286
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor285)))
             (list)))
           (btor287
            (if (bitvector->bool (signal-value btor286)) btor36 btor95))
           (btor288
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor289
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor288)))
             (list)))
           (btor290
            (if (bitvector->bool (signal-value btor289)) btor35 btor287))
           (btor291
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor292
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor291)))
             (list)))
           (btor293
            (if (bitvector->bool (signal-value btor292)) btor34 btor290))
           (btor294
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor116)))
             (list)))
           (btor295
            (if (bitvector->bool (signal-value btor294)) btor95 btor293))
           (btor296
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor297
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor296)))
             (list)))
           (btor298
            (if (bitvector->bool (signal-value btor297)) btor33 btor295))
           (btor299
            (bv->signal
             (zero-extend (signal-value btor298) (bitvector 1))
             btor298))
           (btor300
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor301
            (signal
             (bool->bitvector
              (bveq (signal-value btor21) (signal-value btor300)))
             (list)))
           (btor302
            (if (bitvector->bool (signal-value btor301)) btor26 btor95))
           (btor303
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor304
            (signal
             (bool->bitvector
              (bveq (signal-value btor21) (signal-value btor303)))
             (list)))
           (btor305
            (if (bitvector->bool (signal-value btor304)) btor25 btor302))
           (btor306
            (signal
             (apply bvor (bitvector->bits (signal-value btor21)))
             (signal-state btor21)))
           (btor307 (signal (bvnot (signal-value btor306)) (list)))
           (btor308
            (if (bitvector->bool (signal-value btor307)) btor24 btor305))
           (btor309
            (signal
             (bool->bitvector
              (bveq (signal-value btor21) (signal-value btor193)))
             (list)))
           (btor310
            (if (bitvector->bool (signal-value btor309)) btor95 btor308))
           (btor311
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 5))
             btor196))
           (btor312
            (signal
             (bool->bitvector
              (bveq (signal-value btor21) (signal-value btor311)))
             (list)))
           (btor313
            (if (bitvector->bool (signal-value btor312)) btor27 btor310))
           (btor314
            (bv->signal
             (zero-extend (signal-value btor313) (bitvector 1))
             btor313))
           (btor315
            (if (bitvector->bool (signal-value btor286)) btor52 btor100))
           (btor316
            (if (bitvector->bool (signal-value btor289)) btor51 btor315))
           (btor317
            (if (bitvector->bool (signal-value btor292)) btor50 btor316))
           (btor318
            (if (bitvector->bool (signal-value btor294)) btor100 btor317))
           (btor319
            (if (bitvector->bool (signal-value btor297)) btor49 btor318))
           (btor320
            (bv->signal
             (zero-extend (signal-value btor319) (bitvector 1))
             btor319))
           (btor321
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor322
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor321)))
             (list)))
           (btor323
            (if (bitvector->bool (signal-value btor322)) btor36 btor95))
           (btor324
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor325
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor324)))
             (list)))
           (btor326
            (if (bitvector->bool (signal-value btor325)) btor35 btor323))
           (btor327
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor328
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor327)))
             (list)))
           (btor329
            (if (bitvector->bool (signal-value btor328)) btor34 btor326))
           (btor330
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor116)))
             (list)))
           (btor331
            (if (bitvector->bool (signal-value btor330)) btor95 btor329))
           (btor332
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor333
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor332)))
             (list)))
           (btor334
            (if (bitvector->bool (signal-value btor333)) btor33 btor331))
           (btor335
            (bv->signal
             (zero-extend (signal-value btor334) (bitvector 1))
             btor334))
           (btor336
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor337
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor336)))
             (list)))
           (btor338
            (if (bitvector->bool (signal-value btor337)) btor26 btor95))
           (btor339
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor340
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor339)))
             (list)))
           (btor341
            (if (bitvector->bool (signal-value btor340)) btor25 btor338))
           (btor342
            (signal
             (apply bvor (bitvector->bits (signal-value btor20)))
             (signal-state btor20)))
           (btor343 (signal (bvnot (signal-value btor342)) (list)))
           (btor344
            (if (bitvector->bool (signal-value btor343)) btor24 btor341))
           (btor345
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor193)))
             (list)))
           (btor346
            (if (bitvector->bool (signal-value btor345)) btor95 btor344))
           (btor347
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 5))
             btor196))
           (btor348
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor347)))
             (list)))
           (btor349
            (if (bitvector->bool (signal-value btor348)) btor27 btor346))
           (btor350
            (bv->signal
             (zero-extend (signal-value btor349) (bitvector 1))
             btor349))
           (btor351
            (if (bitvector->bool (signal-value btor322)) btor52 btor100))
           (btor352
            (if (bitvector->bool (signal-value btor325)) btor51 btor351))
           (btor353
            (if (bitvector->bool (signal-value btor328)) btor50 btor352))
           (btor354
            (if (bitvector->bool (signal-value btor330)) btor100 btor353))
           (btor355
            (if (bitvector->bool (signal-value btor333)) btor49 btor354))
           (btor356
            (bv->signal
             (zero-extend (signal-value btor355) (bitvector 1))
             btor355))
           (btor357
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state357)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state357)))
                     ((assoc-has-key? init-hash 'state357)
                      (bv->signal (assoc-ref init-hash 'state357)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor359
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state359)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state359)))
                     ((assoc-has-key? init-hash 'state359)
                      (bv->signal (assoc-ref init-hash 'state359)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor361
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state361)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state361)))
                     ((assoc-has-key? init-hash 'state361)
                      (bv->signal (assoc-ref init-hash 'state361)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor363
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor364
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor363)))
             (list)))
           (btor365
            (if (bitvector->bool (signal-value btor364)) btor36 btor95))
           (btor366
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor367
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor366)))
             (list)))
           (btor368
            (if (bitvector->bool (signal-value btor367)) btor35 btor365))
           (btor369
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor370
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor369)))
             (list)))
           (btor371
            (if (bitvector->bool (signal-value btor370)) btor34 btor368))
           (btor372
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor116)))
             (list)))
           (btor373
            (if (bitvector->bool (signal-value btor372)) btor95 btor371))
           (btor374
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor375
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor374)))
             (list)))
           (btor376
            (if (bitvector->bool (signal-value btor375)) btor33 btor373))
           (btor377
            (signal
             (concat (signal-value btor376) (signal-value btor361))
             (list)))
           (btor378
            (signal
             (bool->bitvector
              (bveq (signal-value btor377) (signal-value btor125)))
             (list)))
           (btor379
            (if (bitvector->bool (signal-value btor378)) btor359 btor357))
           (btor380
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor381
            (signal
             (bool->bitvector
              (bveq (signal-value btor30) (signal-value btor380)))
             (list)))
           (btor382
            (if (bitvector->bool (signal-value btor381)) btor26 btor95))
           (btor383
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor384
            (signal
             (bool->bitvector
              (bveq (signal-value btor30) (signal-value btor383)))
             (list)))
           (btor385
            (if (bitvector->bool (signal-value btor384)) btor25 btor382))
           (btor386
            (signal
             (apply bvor (bitvector->bits (signal-value btor30)))
             (signal-state btor30)))
           (btor387 (signal (bvnot (signal-value btor386)) (list)))
           (btor388
            (if (bitvector->bool (signal-value btor387)) btor24 btor385))
           (btor389
            (signal
             (bool->bitvector
              (bveq (signal-value btor30) (signal-value btor193)))
             (list)))
           (btor390
            (if (bitvector->bool (signal-value btor389)) btor95 btor388))
           (btor391
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 5))
             btor196))
           (btor392
            (signal
             (bool->bitvector
              (bveq (signal-value btor30) (signal-value btor391)))
             (list)))
           (btor393
            (if (bitvector->bool (signal-value btor392)) btor27 btor390))
           (btor394
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state394)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state394)))
                     ((assoc-has-key? init-hash 'state394)
                      (bv->signal (assoc-ref init-hash 'state394)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor395
            (signal
             (bvor (signal-value btor393) (signal-value btor394))
             (list)))
           (btor396
            (if (bitvector->bool (signal-value btor395)) btor95 btor379))
           (btor397
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state397)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state397)))
                     ((assoc-has-key? init-hash 'state397)
                      (bv->signal (assoc-ref init-hash 'state397)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
           (btor401
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state401)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state401)))
                     ((assoc-has-key? init-hash 'state401)
                      (bv->signal (assoc-ref init-hash 'state401)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor403
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor404
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor403)))
             (list)))
           (btor405
            (if (bitvector->bool (signal-value btor404)) btor36 btor95))
           (btor406
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor407
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor406)))
             (list)))
           (btor408
            (if (bitvector->bool (signal-value btor407)) btor35 btor405))
           (btor409
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor410
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor409)))
             (list)))
           (btor411
            (if (bitvector->bool (signal-value btor410)) btor34 btor408))
           (btor412
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor116)))
             (list)))
           (btor413
            (if (bitvector->bool (signal-value btor412)) btor95 btor411))
           (btor414
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor415
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor414)))
             (list)))
           (btor416
            (if (bitvector->bool (signal-value btor415)) btor33 btor413))
           (btor417
            (signal
             (concat (signal-value btor416) (signal-value btor401))
             (list)))
           (btor418
            (signal
             (bool->bitvector
              (bveq (signal-value btor417) (signal-value btor125)))
             (list)))
           (btor419
            (if (bitvector->bool (signal-value btor418)) btor399 btor397))
           (btor420
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor421
            (signal
             (bool->bitvector
              (bveq (signal-value btor29) (signal-value btor420)))
             (list)))
           (btor422
            (if (bitvector->bool (signal-value btor421)) btor26 btor95))
           (btor423
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor424
            (signal
             (bool->bitvector
              (bveq (signal-value btor29) (signal-value btor423)))
             (list)))
           (btor425
            (if (bitvector->bool (signal-value btor424)) btor25 btor422))
           (btor426
            (signal
             (apply bvor (bitvector->bits (signal-value btor29)))
             (signal-state btor29)))
           (btor427 (signal (bvnot (signal-value btor426)) (list)))
           (btor428
            (if (bitvector->bool (signal-value btor427)) btor24 btor425))
           (btor429
            (signal
             (bool->bitvector
              (bveq (signal-value btor29) (signal-value btor193)))
             (list)))
           (btor430
            (if (bitvector->bool (signal-value btor429)) btor95 btor428))
           (btor431
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 5))
             btor196))
           (btor432
            (signal
             (bool->bitvector
              (bveq (signal-value btor29) (signal-value btor431)))
             (list)))
           (btor433
            (if (bitvector->bool (signal-value btor432)) btor27 btor430))
           (btor434
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state434)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state434)))
                     ((assoc-has-key? init-hash 'state434)
                      (bv->signal (assoc-ref init-hash 'state434)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor435
            (signal
             (bvor (signal-value btor433) (signal-value btor434))
             (list)))
           (btor436
            (if (bitvector->bool (signal-value btor435)) btor95 btor419))
           (btor437
            (if (bitvector->bool (signal-value btor412)) btor28 btor436))
           (btor438
            (if (bitvector->bool (signal-value btor372)) btor437 btor396))
           (btor439 (bv->signal (bv 4 (bitvector 3))))
           (btor440
            (bv->signal
             (zero-extend (signal-value btor439) (bitvector 5))
             btor439))
           (btor441
            (signal
             (bool->bitvector
              (bveq (signal-value btor2) (signal-value btor440)))
             (list)))
           (btor442
            (if (bitvector->bool (signal-value btor441)) btor100 btor95))
           (btor443 (bv->signal (bv 15 (bitvector 4))))
           (btor444
            (bv->signal
             (zero-extend (signal-value btor443) (bitvector 5))
             btor443))
           (btor445
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor444)))
             (list)))
           (btor446
            (if (bitvector->bool (signal-value btor445)) btor442 btor438))
           (btor447 (bv->signal (bv 16 (bitvector 5))))
           (btor448
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor447)))
             (list)))
           (btor449
            (if (bitvector->bool (signal-value btor448)) btor438 btor446))
           (btor450
            (bv->signal
             (zero-extend (signal-value btor449) (bitvector 1))
             btor449))
           (btor451
            (bv->signal
             (zero-extend (signal-value btor437) (bitvector 1))
             btor437))
           (btor452
            (bv->signal
             (zero-extend (signal-value btor396) (bitvector 1))
             btor396))
           (btor453
            (bv->signal
             (zero-extend (signal-value btor438) (bitvector 1))
             btor438))
           (btor454
            (bv->signal
             (zero-extend (signal-value btor376) (bitvector 1))
             btor376))
           (btor455
            (bv->signal
             (zero-extend (signal-value btor393) (bitvector 1))
             btor393))
           (btor456
            (if (bitvector->bool (signal-value btor364)) btor52 btor100))
           (btor457
            (if (bitvector->bool (signal-value btor367)) btor51 btor456))
           (btor458
            (if (bitvector->bool (signal-value btor370)) btor50 btor457))
           (btor459
            (if (bitvector->bool (signal-value btor372)) btor100 btor458))
           (btor460
            (if (bitvector->bool (signal-value btor375)) btor49 btor459))
           (btor461
            (bv->signal
             (zero-extend (signal-value btor460) (bitvector 1))
             btor460))
           (btor462
            (bv->signal
             (zero-extend (signal-value btor436) (bitvector 1))
             btor436))
           (btor463
            (bv->signal
             (zero-extend (signal-value btor437) (bitvector 1))
             btor437))
           (btor464
            (bv->signal
             (zero-extend (signal-value btor416) (bitvector 1))
             btor416))
           (btor465
            (bv->signal
             (zero-extend (signal-value btor433) (bitvector 1))
             btor433))
           (btor466
            (if (bitvector->bool (signal-value btor404)) btor52 btor100))
           (btor467
            (if (bitvector->bool (signal-value btor407)) btor51 btor466))
           (btor468
            (if (bitvector->bool (signal-value btor410)) btor50 btor467))
           (btor469
            (if (bitvector->bool (signal-value btor412)) btor100 btor468))
           (btor470
            (if (bitvector->bool (signal-value btor415)) btor49 btor469))
           (btor471
            (bv->signal
             (zero-extend (signal-value btor470) (bitvector 1))
             btor470))
           (btor472
            (bv->signal
             (zero-extend (signal-value btor95) (bitvector 1))
             btor95))
           (btor473 (bitvector 32))
           (btor474 (bv->signal (bv 0 (bitvector 32))))
           (btor475
            (bv->signal
             (zero-extend (signal-value btor474) (bitvector 32))
             btor474))
           (btor476
            (bv->signal
             (zero-extend (signal-value btor474) (bitvector 32))
             btor474))
           (btor477
            (bv->signal
             (zero-extend (signal-value btor180) (bitvector 1))
             btor180))
           (btor478
            (bv->signal
             (zero-extend (signal-value btor199) (bitvector 1))
             btor199))
           (btor479
            (if (bitvector->bool (signal-value btor168)) btor52 btor100))
           (btor480
            (if (bitvector->bool (signal-value btor171)) btor51 btor479))
           (btor481
            (if (bitvector->bool (signal-value btor174)) btor50 btor480))
           (btor482
            (if (bitvector->bool (signal-value btor176)) btor100 btor481))
           (btor483
            (if (bitvector->bool (signal-value btor179)) btor49 btor482))
           (btor484
            (bv->signal
             (zero-extend (signal-value btor483) (bitvector 1))
             btor483))
           (btor485
            (bv->signal
             (zero-extend (signal-value btor232) (bitvector 1))
             btor232))
           (btor486
            (bv->signal
             (zero-extend (signal-value btor249) (bitvector 1))
             btor249))
           (btor487
            (if (bitvector->bool (signal-value btor220)) btor52 btor100))
           (btor488
            (if (bitvector->bool (signal-value btor223)) btor51 btor487))
           (btor489
            (if (bitvector->bool (signal-value btor226)) btor50 btor488))
           (btor490
            (if (bitvector->bool (signal-value btor228)) btor100 btor489))
           (btor491
            (if (bitvector->bool (signal-value btor231)) btor49 btor490))
           (btor492
            (bv->signal
             (zero-extend (signal-value btor491) (bitvector 1))
             btor491))
           (btor493 unnamed-input-493)
           (btor494
            (bv->signal
             (zero-extend (signal-value btor493) (bitvector 1))
             btor493))
           (btor495 unnamed-input-495)
           (btor496
            (bv->signal
             (zero-extend (signal-value btor495) (bitvector 1))
             btor495))
           (btor497 (bitvector 39))
           (btor498 (bv->signal (bv 0 (bitvector 39))))
           (btor499
            (bv->signal
             (zero-extend (signal-value btor498) (bitvector 39))
             btor498))
           (btor500
            (bv->signal
             (zero-extend (signal-value btor202) (bitvector 18))
             btor202))
           (btor501
            (bv->signal
             (zero-extend (signal-value btor210) (bitvector 18))
             btor210))
           (btor502
            (bv->signal
             (zero-extend (signal-value btor211) (bitvector 18))
             btor211))
           (btor503
            (bv->signal
             (zero-extend (signal-value btor252) (bitvector 18))
             btor252))
           (btor504
            (bv->signal
             (zero-extend (signal-value btor260) (bitvector 18))
             btor260))
           (btor505
            (bv->signal
             (zero-extend (signal-value btor261) (bitvector 18))
             btor261))
           (btor506
            (bv->signal
             (zero-extend (signal-value btor211) (bitvector 36))
             btor211))
           (btor507
            (bv->signal
             (zero-extend (signal-value btor261) (bitvector 36))
             btor261))
           (btor508
            (signal
             (bvmul (signal-value btor506) (signal-value btor507))
             (list)))
           (btor509
            (bv->signal
             (sign-extend (signal-value btor211) (bitvector 36))
             btor211))
           (btor510
            (bv->signal
             (sign-extend (signal-value btor261) (bitvector 36))
             btor261))
           (btor511
            (signal
             (bvmul (signal-value btor509) (signal-value btor510))
             (list)))
           (btor512
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state512)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state512)))
                     ((assoc-has-key? init-hash 'state512)
                      (bv->signal (assoc-ref init-hash 'state512)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor514
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state514)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state514)))
                     ((assoc-has-key? init-hash 'state514)
                      (bv->signal (assoc-ref init-hash 'state514)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor516
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state516)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state516)))
                     ((assoc-has-key? init-hash 'state516)
                      (bv->signal (assoc-ref init-hash 'state516)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor518
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor519
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor518)))
             (list)))
           (btor520
            (if (bitvector->bool (signal-value btor519)) btor36 btor95))
           (btor521
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor522
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor521)))
             (list)))
           (btor523
            (if (bitvector->bool (signal-value btor522)) btor35 btor520))
           (btor524
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor525
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor524)))
             (list)))
           (btor526
            (if (bitvector->bool (signal-value btor525)) btor34 btor523))
           (btor527
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor116)))
             (list)))
           (btor528
            (if (bitvector->bool (signal-value btor527)) btor95 btor526))
           (btor529
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor530
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor529)))
             (list)))
           (btor531
            (if (bitvector->bool (signal-value btor530)) btor33 btor528))
           (btor532
            (signal
             (concat (signal-value btor531) (signal-value btor516))
             (list)))
           (btor533
            (signal
             (bool->bitvector
              (bveq (signal-value btor532) (signal-value btor125)))
             (list)))
           (btor534
            (if (bitvector->bool (signal-value btor533)) btor514 btor512))
           (btor535
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor536
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor535)))
             (list)))
           (btor537
            (if (bitvector->bool (signal-value btor536)) btor26 btor95))
           (btor538
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor539
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor538)))
             (list)))
           (btor540
            (if (bitvector->bool (signal-value btor539)) btor25 btor537))
           (btor541
            (signal
             (apply bvor (bitvector->bits (signal-value btor83)))
             (signal-state btor83)))
           (btor542 (signal (bvnot (signal-value btor541)) (list)))
           (btor543
            (if (bitvector->bool (signal-value btor542)) btor24 btor540))
           (btor544
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor193)))
             (list)))
           (btor545
            (if (bitvector->bool (signal-value btor544)) btor95 btor543))
           (btor546
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 5))
             btor196))
           (btor547
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor546)))
             (list)))
           (btor548
            (if (bitvector->bool (signal-value btor547)) btor27 btor545))
           (btor549
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state549)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state549)))
                     ((assoc-has-key? init-hash 'state549)
                      (bv->signal (assoc-ref init-hash 'state549)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor550
            (signal
             (bvor (signal-value btor548) (signal-value btor549))
             (list)))
           (btor551
            (if (bitvector->bool (signal-value btor550)) btor95 btor534))
           (btor552
            (if (bitvector->bool (signal-value btor527)) btor91 btor551))
           (btor553 (bv->signal (bv 19 (bitvector 5))))
           (btor554
            (signal
             (bool->bitvector
              (bveq (signal-value btor79) (signal-value btor553)))
             (list)))
           (btor555
            (if (bitvector->bool (signal-value btor554)) btor100 btor95))
           (btor556
            (bv->signal
             (zero-extend (signal-value btor443) (bitvector 5))
             btor443))
           (btor557
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor556)))
             (list)))
           (btor558
            (if (bitvector->bool (signal-value btor557)) btor555 btor552))
           (btor559
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor447)))
             (list)))
           (btor560
            (if (bitvector->bool (signal-value btor559)) btor552 btor558))
           (btor561
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state561)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state561)))
                     ((assoc-has-key? init-hash 'state561)
                      (bv->signal (assoc-ref init-hash 'state561)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor563
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state563)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state563)))
                     ((assoc-has-key? init-hash 'state563)
                      (bv->signal (assoc-ref init-hash 'state563)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor565
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state565)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state565)))
                     ((assoc-has-key? init-hash 'state565)
                      (bv->signal (assoc-ref init-hash 'state565)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor567
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor568
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor567)))
             (list)))
           (btor569
            (if (bitvector->bool (signal-value btor568)) btor36 btor95))
           (btor570
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor571
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor570)))
             (list)))
           (btor572
            (if (bitvector->bool (signal-value btor571)) btor35 btor569))
           (btor573
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor574
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor573)))
             (list)))
           (btor575
            (if (bitvector->bool (signal-value btor574)) btor34 btor572))
           (btor576
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor116)))
             (list)))
           (btor577
            (if (bitvector->bool (signal-value btor576)) btor95 btor575))
           (btor578
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor579
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor578)))
             (list)))
           (btor580
            (if (bitvector->bool (signal-value btor579)) btor33 btor577))
           (btor581
            (signal
             (concat (signal-value btor580) (signal-value btor565))
             (list)))
           (btor582
            (signal
             (bool->bitvector
              (bveq (signal-value btor581) (signal-value btor125)))
             (list)))
           (btor583
            (if (bitvector->bool (signal-value btor582)) btor563 btor561))
           (btor584
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor585
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor584)))
             (list)))
           (btor586
            (if (bitvector->bool (signal-value btor585)) btor26 btor95))
           (btor587
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor588
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor587)))
             (list)))
           (btor589
            (if (bitvector->bool (signal-value btor588)) btor25 btor586))
           (btor590
            (signal
             (apply bvor (bitvector->bits (signal-value btor84)))
             (signal-state btor84)))
           (btor591 (signal (bvnot (signal-value btor590)) (list)))
           (btor592
            (if (bitvector->bool (signal-value btor591)) btor24 btor589))
           (btor593
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor193)))
             (list)))
           (btor594
            (if (bitvector->bool (signal-value btor593)) btor95 btor592))
           (btor595
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 5))
             btor196))
           (btor596
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor595)))
             (list)))
           (btor597
            (if (bitvector->bool (signal-value btor596)) btor27 btor594))
           (btor598
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state598)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state598)))
                     ((assoc-has-key? init-hash 'state598)
                      (bv->signal (assoc-ref init-hash 'state598)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor599
            (signal
             (bvor (signal-value btor597) (signal-value btor598))
             (list)))
           (btor600
            (if (bitvector->bool (signal-value btor599)) btor95 btor583))
           (btor601
            (if (bitvector->bool (signal-value btor576)) btor92 btor600))
           (btor602
            (signal
             (bool->bitvector
              (bveq (signal-value btor80) (signal-value btor553)))
             (list)))
           (btor603
            (if (bitvector->bool (signal-value btor602)) btor100 btor95))
           (btor604
            (bv->signal
             (zero-extend (signal-value btor443) (bitvector 5))
             btor443))
           (btor605
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor604)))
             (list)))
           (btor606
            (if (bitvector->bool (signal-value btor605)) btor603 btor601))
           (btor607
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor447)))
             (list)))
           (btor608
            (if (bitvector->bool (signal-value btor607)) btor601 btor606))
           (btor609
            (signal
             (bvand (signal-value btor560) (signal-value btor608))
             (list)))
           (btor610
            (if (bitvector->bool (signal-value btor609)) btor511 btor508))
           (btor611
            (bv->signal
             (zero-extend (signal-value btor610) (bitvector 36))
             btor610))
           (btor612
            (bv->signal
             (zero-extend (signal-value btor137) (bitvector 1))
             btor137))
           (btor613
            (bv->signal
             (zero-extend (signal-value btor95) (bitvector 1))
             btor95))
           (btor614
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state614)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state614)))
                     ((assoc-has-key? init-hash 'state614)
                      (bv->signal (assoc-ref init-hash 'state614)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor616
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state616)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state616)))
                     ((assoc-has-key? init-hash 'state616)
                      (bv->signal (assoc-ref init-hash 'state616)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor618
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state618)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state618)))
                     ((assoc-has-key? init-hash 'state618)
                      (bv->signal (assoc-ref init-hash 'state618)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor620
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor621
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor620)))
             (list)))
           (btor622
            (if (bitvector->bool (signal-value btor621)) btor36 btor95))
           (btor623
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor624
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor623)))
             (list)))
           (btor625
            (if (bitvector->bool (signal-value btor624)) btor35 btor622))
           (btor626
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor627
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor626)))
             (list)))
           (btor628
            (if (bitvector->bool (signal-value btor627)) btor34 btor625))
           (btor629
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor116)))
             (list)))
           (btor630
            (if (bitvector->bool (signal-value btor629)) btor95 btor628))
           (btor631
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor632
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor631)))
             (list)))
           (btor633
            (if (bitvector->bool (signal-value btor632)) btor33 btor630))
           (btor634
            (signal
             (concat (signal-value btor633) (signal-value btor618))
             (list)))
           (btor635
            (signal
             (bool->bitvector
              (bveq (signal-value btor634) (signal-value btor125)))
             (list)))
           (btor636
            (if (bitvector->bool (signal-value btor635)) btor616 btor614))
           (btor637
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor638
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor637)))
             (list)))
           (btor639
            (if (bitvector->bool (signal-value btor638)) btor26 btor95))
           (btor640
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor641
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor640)))
             (list)))
           (btor642
            (if (bitvector->bool (signal-value btor641)) btor25 btor639))
           (btor643
            (signal
             (apply bvor (bitvector->bits (signal-value btor70)))
             (signal-state btor70)))
           (btor644 (signal (bvnot (signal-value btor643)) (list)))
           (btor645
            (if (bitvector->bool (signal-value btor644)) btor24 btor642))
           (btor646
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor193)))
             (list)))
           (btor647
            (if (bitvector->bool (signal-value btor646)) btor95 btor645))
           (btor648
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 5))
             btor196))
           (btor649
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor648)))
             (list)))
           (btor650
            (if (bitvector->bool (signal-value btor649)) btor27 btor647))
           (btor651
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state651)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state651)))
                     ((assoc-has-key? init-hash 'state651)
                      (bv->signal (assoc-ref init-hash 'state651)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor652
            (signal
             (bvor (signal-value btor650) (signal-value btor651))
             (list)))
           (btor653
            (if (bitvector->bool (signal-value btor652)) btor95 btor636))
           (btor654
            (bv->signal
             (zero-extend (signal-value btor653) (bitvector 1))
             btor653))
           (btor655
            (if (bitvector->bool (signal-value btor629)) btor95 btor653))
           (btor656
            (bv->signal
             (zero-extend (signal-value btor655) (bitvector 1))
             btor655))
           (btor657
            (bv->signal
             (zero-extend (signal-value btor610) (bitvector 36))
             btor610))
           (btor658
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state658)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state658)))
                     ((assoc-has-key? init-hash 'state658)
                      (bv->signal (assoc-ref init-hash 'state658)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor660
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state660)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state660)))
                     ((assoc-has-key? init-hash 'state660)
                      (bv->signal (assoc-ref init-hash 'state660)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor662
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state662)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state662)))
                     ((assoc-has-key? init-hash 'state662)
                      (bv->signal (assoc-ref init-hash 'state662)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor664
            (signal
             (concat (signal-value btor633) (signal-value btor662))
             (list)))
           (btor665
            (signal
             (bool->bitvector
              (bveq (signal-value btor664) (signal-value btor125)))
             (list)))
           (btor666
            (if (bitvector->bool (signal-value btor665)) btor660 btor658))
           (btor667
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state667)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state667)))
                     ((assoc-has-key? init-hash 'state667)
                      (bv->signal (assoc-ref init-hash 'state667)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor668
            (signal
             (bvor (signal-value btor650) (signal-value btor667))
             (list)))
           (btor669
            (if (bitvector->bool (signal-value btor668)) btor149 btor666))
           (btor670
            (bv->signal
             (zero-extend (signal-value btor669) (bitvector 36))
             btor669))
           (btor671
            (bv->signal
             (zero-extend (signal-value btor95) (bitvector 1))
             btor95))
           (btor672
            (bv->signal
             (zero-extend (signal-value btor633) (bitvector 1))
             btor633))
           (btor673
            (bv->signal
             (zero-extend (signal-value btor650) (bitvector 1))
             btor650))
           (btor674
            (if (bitvector->bool (signal-value btor621)) btor52 btor100))
           (btor675
            (if (bitvector->bool (signal-value btor624)) btor51 btor674))
           (btor676
            (if (bitvector->bool (signal-value btor627)) btor50 btor675))
           (btor677
            (if (bitvector->bool (signal-value btor629)) btor100 btor676))
           (btor678
            (if (bitvector->bool (signal-value btor632)) btor49 btor677))
           (btor679
            (bv->signal
             (zero-extend (signal-value btor678) (bitvector 1))
             btor678))
           (btor680
            (bv->signal
             (zero-extend (signal-value btor122) (bitvector 1))
             btor122))
           (btor681
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor682
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor681)))
             (list)))
           (btor683
            (if (bitvector->bool (signal-value btor682)) btor26 btor95))
           (btor684
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor685
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor684)))
             (list)))
           (btor686
            (if (bitvector->bool (signal-value btor685)) btor25 btor683))
           (btor687
            (signal
             (apply bvor (bitvector->bits (signal-value btor72)))
             (signal-state btor72)))
           (btor688 (signal (bvnot (signal-value btor687)) (list)))
           (btor689
            (if (bitvector->bool (signal-value btor688)) btor24 btor686))
           (btor690
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor193)))
             (list)))
           (btor691
            (if (bitvector->bool (signal-value btor690)) btor95 btor689))
           (btor692
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 5))
             btor196))
           (btor693
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor692)))
             (list)))
           (btor694
            (if (bitvector->bool (signal-value btor693)) btor27 btor691))
           (btor695
            (bv->signal
             (zero-extend (signal-value btor694) (bitvector 1))
             btor694))
           (btor696
            (if (bitvector->bool (signal-value btor106)) btor52 btor100))
           (btor697
            (if (bitvector->bool (signal-value btor110)) btor51 btor696))
           (btor698
            (if (bitvector->bool (signal-value btor114)) btor50 btor697))
           (btor699
            (if (bitvector->bool (signal-value btor117)) btor100 btor698))
           (btor700
            (if (bitvector->bool (signal-value btor121)) btor49 btor699))
           (btor701
            (bv->signal
             (zero-extend (signal-value btor700) (bitvector 1))
             btor700))
           (btor702
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state702)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state702)))
                     ((assoc-has-key? init-hash 'state702)
                      (bv->signal (assoc-ref init-hash 'state702)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor704
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state704)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state704)))
                     ((assoc-has-key? init-hash 'state704)
                      (bv->signal (assoc-ref init-hash 'state704)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor706
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state706)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state706)))
                     ((assoc-has-key? init-hash 'state706)
                      (bv->signal (assoc-ref init-hash 'state706)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor708
            (signal
             (concat (signal-value btor122) (signal-value btor706))
             (list)))
           (btor709
            (signal
             (bool->bitvector
              (bveq (signal-value btor708) (signal-value btor125)))
             (list)))
           (btor710
            (if (bitvector->bool (signal-value btor709)) btor704 btor702))
           (btor711
            (bv->signal
             (zero-extend (signal-value btor710) (bitvector 36))
             btor710))
           (btor712
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state712)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state712)))
                     ((assoc-has-key? init-hash 'state712)
                      (bv->signal (assoc-ref init-hash 'state712)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor714
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state714)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state714)))
                     ((assoc-has-key? init-hash 'state714)
                      (bv->signal (assoc-ref init-hash 'state714)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor716
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state716)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state716)))
                     ((assoc-has-key? init-hash 'state716)
                      (bv->signal (assoc-ref init-hash 'state716)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor718
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor719
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor718)))
             (list)))
           (btor720
            (if (bitvector->bool (signal-value btor719)) btor36 btor95))
           (btor721
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor722
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor721)))
             (list)))
           (btor723
            (if (bitvector->bool (signal-value btor722)) btor35 btor720))
           (btor724
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor725
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor724)))
             (list)))
           (btor726
            (if (bitvector->bool (signal-value btor725)) btor34 btor723))
           (btor727
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor116)))
             (list)))
           (btor728
            (if (bitvector->bool (signal-value btor727)) btor95 btor726))
           (btor729
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor730
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor729)))
             (list)))
           (btor731
            (if (bitvector->bool (signal-value btor730)) btor33 btor728))
           (btor732
            (signal
             (concat (signal-value btor731) (signal-value btor716))
             (list)))
           (btor733
            (signal
             (bool->bitvector
              (bveq (signal-value btor732) (signal-value btor125)))
             (list)))
           (btor734
            (if (bitvector->bool (signal-value btor733)) btor714 btor712))
           (btor735
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor736
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor735)))
             (list)))
           (btor737
            (if (bitvector->bool (signal-value btor736)) btor26 btor95))
           (btor738
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor739
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor738)))
             (list)))
           (btor740
            (if (bitvector->bool (signal-value btor739)) btor25 btor737))
           (btor741
            (signal
             (apply bvor (bitvector->bits (signal-value btor85)))
             (signal-state btor85)))
           (btor742 (signal (bvnot (signal-value btor741)) (list)))
           (btor743
            (if (bitvector->bool (signal-value btor742)) btor24 btor740))
           (btor744
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor193)))
             (list)))
           (btor745
            (if (bitvector->bool (signal-value btor744)) btor95 btor743))
           (btor746
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 5))
             btor196))
           (btor747
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor746)))
             (list)))
           (btor748
            (if (bitvector->bool (signal-value btor747)) btor27 btor745))
           (btor749
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state749)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state749)))
                     ((assoc-has-key? init-hash 'state749)
                      (bv->signal (assoc-ref init-hash 'state749)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor750
            (signal
             (bvor (signal-value btor748) (signal-value btor749))
             (list)))
           (btor751
            (if (bitvector->bool (signal-value btor750)) btor95 btor734))
           (btor752
            (if (bitvector->bool (signal-value btor727)) btor552 btor751))
           (btor753
            (if (bitvector->bool (signal-value btor557)) btor555 btor752))
           (btor754
            (if (bitvector->bool (signal-value btor559)) btor752 btor753))
           (btor755
            (bv->signal
             (zero-extend (signal-value btor754) (bitvector 1))
             btor754))
           (btor756
            (bv->signal
             (zero-extend (signal-value btor751) (bitvector 1))
             btor751))
           (btor757
            (bv->signal
             (zero-extend (signal-value btor752) (bitvector 1))
             btor752))
           (btor758
            (bv->signal
             (zero-extend (signal-value btor551) (bitvector 1))
             btor551))
           (btor759
            (bv->signal
             (zero-extend (signal-value btor560) (bitvector 1))
             btor560))
           (btor760
            (bv->signal
             (zero-extend (signal-value btor552) (bitvector 1))
             btor552))
           (btor761
            (bv->signal
             (zero-extend (signal-value btor531) (bitvector 1))
             btor531))
           (btor762
            (bv->signal
             (zero-extend (signal-value btor548) (bitvector 1))
             btor548))
           (btor763
            (if (bitvector->bool (signal-value btor519)) btor52 btor100))
           (btor764
            (if (bitvector->bool (signal-value btor522)) btor51 btor763))
           (btor765
            (if (bitvector->bool (signal-value btor525)) btor50 btor764))
           (btor766
            (if (bitvector->bool (signal-value btor527)) btor100 btor765))
           (btor767
            (if (bitvector->bool (signal-value btor530)) btor49 btor766))
           (btor768
            (bv->signal
             (zero-extend (signal-value btor767) (bitvector 1))
             btor767))
           (btor769
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state769)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state769)))
                     ((assoc-has-key? init-hash 'state769)
                      (bv->signal (assoc-ref init-hash 'state769)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor771
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state771)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state771)))
                     ((assoc-has-key? init-hash 'state771)
                      (bv->signal (assoc-ref init-hash 'state771)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor773
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state773)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state773)))
                     ((assoc-has-key? init-hash 'state773)
                      (bv->signal (assoc-ref init-hash 'state773)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor775
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor776
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor775)))
             (list)))
           (btor777
            (if (bitvector->bool (signal-value btor776)) btor36 btor95))
           (btor778
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor779
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor778)))
             (list)))
           (btor780
            (if (bitvector->bool (signal-value btor779)) btor35 btor777))
           (btor781
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor782
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor781)))
             (list)))
           (btor783
            (if (bitvector->bool (signal-value btor782)) btor34 btor780))
           (btor784
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor116)))
             (list)))
           (btor785
            (if (bitvector->bool (signal-value btor784)) btor95 btor783))
           (btor786
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor787
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor786)))
             (list)))
           (btor788
            (if (bitvector->bool (signal-value btor787)) btor33 btor785))
           (btor789
            (signal
             (concat (signal-value btor788) (signal-value btor773))
             (list)))
           (btor790
            (signal
             (bool->bitvector
              (bveq (signal-value btor789) (signal-value btor125)))
             (list)))
           (btor791
            (if (bitvector->bool (signal-value btor790)) btor771 btor769))
           (btor792
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor793
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor792)))
             (list)))
           (btor794
            (if (bitvector->bool (signal-value btor793)) btor26 btor95))
           (btor795
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor796
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor795)))
             (list)))
           (btor797
            (if (bitvector->bool (signal-value btor796)) btor25 btor794))
           (btor798
            (signal
             (apply bvor (bitvector->bits (signal-value btor86)))
             (signal-state btor86)))
           (btor799 (signal (bvnot (signal-value btor798)) (list)))
           (btor800
            (if (bitvector->bool (signal-value btor799)) btor24 btor797))
           (btor801
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor193)))
             (list)))
           (btor802
            (if (bitvector->bool (signal-value btor801)) btor95 btor800))
           (btor803
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 5))
             btor196))
           (btor804
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor803)))
             (list)))
           (btor805
            (if (bitvector->bool (signal-value btor804)) btor27 btor802))
           (btor806
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state806)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state806)))
                     ((assoc-has-key? init-hash 'state806)
                      (bv->signal (assoc-ref init-hash 'state806)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor807
            (signal
             (bvor (signal-value btor805) (signal-value btor806))
             (list)))
           (btor808
            (if (bitvector->bool (signal-value btor807)) btor95 btor791))
           (btor809
            (if (bitvector->bool (signal-value btor784)) btor601 btor808))
           (btor810
            (if (bitvector->bool (signal-value btor605)) btor603 btor809))
           (btor811
            (if (bitvector->bool (signal-value btor607)) btor809 btor810))
           (btor812
            (bv->signal
             (zero-extend (signal-value btor811) (bitvector 1))
             btor811))
           (btor813
            (bv->signal
             (zero-extend (signal-value btor808) (bitvector 1))
             btor808))
           (btor814
            (bv->signal
             (zero-extend (signal-value btor809) (bitvector 1))
             btor809))
           (btor815
            (bv->signal
             (zero-extend (signal-value btor600) (bitvector 1))
             btor600))
           (btor816
            (bv->signal
             (zero-extend (signal-value btor608) (bitvector 1))
             btor608))
           (btor817
            (bv->signal
             (zero-extend (signal-value btor601) (bitvector 1))
             btor601))
           (btor818
            (bv->signal
             (zero-extend (signal-value btor580) (bitvector 1))
             btor580))
           (btor819
            (bv->signal
             (zero-extend (signal-value btor597) (bitvector 1))
             btor597))
           (btor820
            (if (bitvector->bool (signal-value btor568)) btor52 btor100))
           (btor821
            (if (bitvector->bool (signal-value btor571)) btor51 btor820))
           (btor822
            (if (bitvector->bool (signal-value btor574)) btor50 btor821))
           (btor823
            (if (bitvector->bool (signal-value btor576)) btor100 btor822))
           (btor824
            (if (bitvector->bool (signal-value btor579)) btor49 btor823))
           (btor825
            (bv->signal
             (zero-extend (signal-value btor824) (bitvector 1))
             btor824))
           (btor826
            (bv->signal
             (zero-extend (signal-value btor731) (bitvector 1))
             btor731))
           (btor827
            (bv->signal
             (zero-extend (signal-value btor748) (bitvector 1))
             btor748))
           (btor828
            (if (bitvector->bool (signal-value btor719)) btor52 btor100))
           (btor829
            (if (bitvector->bool (signal-value btor722)) btor51 btor828))
           (btor830
            (if (bitvector->bool (signal-value btor725)) btor50 btor829))
           (btor831
            (if (bitvector->bool (signal-value btor727)) btor100 btor830))
           (btor832
            (if (bitvector->bool (signal-value btor730)) btor49 btor831))
           (btor833
            (bv->signal
             (zero-extend (signal-value btor832) (bitvector 1))
             btor832))
           (btor834
            (bv->signal
             (zero-extend (signal-value btor788) (bitvector 1))
             btor788))
           (btor835
            (bv->signal
             (zero-extend (signal-value btor805) (bitvector 1))
             btor805))
           (btor836
            (if (bitvector->bool (signal-value btor776)) btor52 btor100))
           (btor837
            (if (bitvector->bool (signal-value btor779)) btor51 btor836))
           (btor838
            (if (bitvector->bool (signal-value btor782)) btor50 btor837))
           (btor839
            (if (bitvector->bool (signal-value btor784)) btor100 btor838))
           (btor840
            (if (bitvector->bool (signal-value btor787)) btor49 btor839))
           (btor841
            (bv->signal
             (zero-extend (signal-value btor840) (bitvector 1))
             btor840))
           (btor842
            (bv->signal
             (zero-extend (signal-value btor552) (bitvector 1))
             btor552))
           (btor843
            (bv->signal
             (zero-extend (signal-value btor601) (bitvector 1))
             btor601))
           (btor844
            (bv->signal
             (zero-extend (signal-value btor511) (bitvector 36))
             btor511))
           (btor845
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state845)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state845)))
                     ((assoc-has-key? init-hash 'state845)
                      (bv->signal (assoc-ref init-hash 'state845)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor847
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state847)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state847)))
                     ((assoc-has-key? init-hash 'state847)
                      (bv->signal (assoc-ref init-hash 'state847)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor849
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state849)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state849)))
                     ((assoc-has-key? init-hash 'state849)
                      (bv->signal (assoc-ref init-hash 'state849)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor851
            (signal
             (concat (signal-value btor334) (signal-value btor849))
             (list)))
           (btor852
            (signal
             (bool->bitvector
              (bveq (signal-value btor851) (signal-value btor125)))
             (list)))
           (btor853
            (if (bitvector->bool (signal-value btor852)) btor847 btor845))
           (btor854
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state854)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state854)))
                     ((assoc-has-key? init-hash 'state854)
                      (bv->signal (assoc-ref init-hash 'state854)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor855
            (signal
             (bvor (signal-value btor349) (signal-value btor854))
             (list)))
           (btor856
            (if (bitvector->bool (signal-value btor855)) btor95 btor853))
           (btor857
            (if (bitvector->bool (signal-value btor330)) btor19 btor856))
           (btor858
            (bv->signal
             (zero-extend (signal-value btor857) (bitvector 1))
             btor857))
           (btor859
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state859)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state859)))
                     ((assoc-has-key? init-hash 'state859)
                      (bv->signal (assoc-ref init-hash 'state859)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor861
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state861)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state861)))
                     ((assoc-has-key? init-hash 'state861)
                      (bv->signal (assoc-ref init-hash 'state861)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor863
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state863)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state863)))
                     ((assoc-has-key? init-hash 'state863)
                      (bv->signal (assoc-ref init-hash 'state863)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor865
            (signal
             (concat (signal-value btor298) (signal-value btor863))
             (list)))
           (btor866
            (signal
             (bool->bitvector
              (bveq (signal-value btor865) (signal-value btor125)))
             (list)))
           (btor867
            (if (bitvector->bool (signal-value btor866)) btor861 btor859))
           (btor868
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state868)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state868)))
                     ((assoc-has-key? init-hash 'state868)
                      (bv->signal (assoc-ref init-hash 'state868)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor869
            (signal
             (bvor (signal-value btor313) (signal-value btor868))
             (list)))
           (btor870
            (if (bitvector->bool (signal-value btor869)) btor95 btor867))
           (btor871
            (bv->signal
             (zero-extend (signal-value btor870) (bitvector 1))
             btor870))
           (btor872 (bitvector 35))
           (btor873 (bv->signal (bv 0 (bitvector 35))))
           (btor874
            (signal
             (concat (signal-value btor870) (signal-value btor873))
             (list)))
           (btor875
            (signal
             (concat (signal-value btor857) (signal-value btor873))
             (list)))
           (btor876
            (if (bitvector->bool (signal-value btor294)) btor875 btor874))
           (btor877
            (bv->signal
             (zero-extend (signal-value btor876) (bitvector 36))
             btor876))
           (btor878
            (bv->signal
             (zero-extend (signal-value btor856) (bitvector 1))
             btor856))
           (btor879
            (bv->signal
             (zero-extend (signal-value btor857) (bitvector 1))
             btor857))
           (btor880
            (bv->signal
             (zero-extend (signal-value btor610) (bitvector 36))
             btor610))
           (btor881
            (bv->signal
             (zero-extend (signal-value btor149) (bitvector 36))
             btor149))
           (btor882
            (bv->signal
             (zero-extend (signal-value btor149) (bitvector 36))
             btor149))
           (btor883
            (bv->signal
             (zero-extend (signal-value btor508) (bitvector 36))
             btor508))
           (btor884
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state884)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state884)))
                     ((assoc-has-key? init-hash 'state884)
                      (bv->signal (assoc-ref init-hash 'state884)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor886
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state886)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state886)))
                     ((assoc-has-key? init-hash 'state886)
                      (bv->signal (assoc-ref init-hash 'state886)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor888
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state888)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state888)))
                     ((assoc-has-key? init-hash 'state888)
                      (bv->signal (assoc-ref init-hash 'state888)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor890
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor891
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor890)))
             (list)))
           (btor892
            (if (bitvector->bool (signal-value btor891)) btor36 btor95))
           (btor893
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor894
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor893)))
             (list)))
           (btor895
            (if (bitvector->bool (signal-value btor894)) btor35 btor892))
           (btor896
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor897
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor896)))
             (list)))
           (btor898
            (if (bitvector->bool (signal-value btor897)) btor34 btor895))
           (btor899
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor116)))
             (list)))
           (btor900
            (if (bitvector->bool (signal-value btor899)) btor95 btor898))
           (btor901
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor902
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor901)))
             (list)))
           (btor903
            (if (bitvector->bool (signal-value btor902)) btor33 btor900))
           (btor904
            (signal
             (concat (signal-value btor903) (signal-value btor888))
             (list)))
           (btor905
            (signal
             (bool->bitvector
              (bveq (signal-value btor904) (signal-value btor125)))
             (list)))
           (btor906
            (if (bitvector->bool (signal-value btor905)) btor886 btor884))
           (btor907
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor908
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor907)))
             (list)))
           (btor909
            (if (bitvector->bool (signal-value btor908)) btor26 btor95))
           (btor910
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor911
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor910)))
             (list)))
           (btor912
            (if (bitvector->bool (signal-value btor911)) btor25 btor909))
           (btor913
            (signal
             (apply bvor (bitvector->bits (signal-value btor16)))
             (signal-state btor16)))
           (btor914 (signal (bvnot (signal-value btor913)) (list)))
           (btor915
            (if (bitvector->bool (signal-value btor914)) btor24 btor912))
           (btor916
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor193)))
             (list)))
           (btor917
            (if (bitvector->bool (signal-value btor916)) btor95 btor915))
           (btor918
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 5))
             btor196))
           (btor919
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor918)))
             (list)))
           (btor920
            (if (bitvector->bool (signal-value btor919)) btor27 btor917))
           (btor921
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state921)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state921)))
                     ((assoc-has-key? init-hash 'state921)
                      (bv->signal (assoc-ref init-hash 'state921)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor922
            (signal
             (bvor (signal-value btor920) (signal-value btor921))
             (list)))
           (btor923
            (if (bitvector->bool (signal-value btor922)) btor95 btor906))
           (btor924
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state924)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state924)))
                     ((assoc-has-key? init-hash 'state924)
                      (bv->signal (assoc-ref init-hash 'state924)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor926
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state926)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state926)))
                     ((assoc-has-key? init-hash 'state926)
                      (bv->signal (assoc-ref init-hash 'state926)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor928
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state928)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state928)))
                     ((assoc-has-key? init-hash 'state928)
                      (bv->signal (assoc-ref init-hash 'state928)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor930
            (bv->signal
             (zero-extend (signal-value btor104) (bitvector 5))
             btor104))
           (btor931
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor930)))
             (list)))
           (btor932
            (if (bitvector->bool (signal-value btor931)) btor36 btor95))
           (btor933
            (bv->signal
             (zero-extend (signal-value btor108) (bitvector 5))
             btor108))
           (btor934
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor933)))
             (list)))
           (btor935
            (if (bitvector->bool (signal-value btor934)) btor35 btor932))
           (btor936
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor937
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor936)))
             (list)))
           (btor938
            (if (bitvector->bool (signal-value btor937)) btor34 btor935))
           (btor939
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor116)))
             (list)))
           (btor940
            (if (bitvector->bool (signal-value btor939)) btor95 btor938))
           (btor941
            (bv->signal
             (zero-extend (signal-value btor119) (bitvector 5))
             btor119))
           (btor942
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor941)))
             (list)))
           (btor943
            (if (bitvector->bool (signal-value btor942)) btor33 btor940))
           (btor944
            (signal
             (concat (signal-value btor943) (signal-value btor928))
             (list)))
           (btor945
            (signal
             (bool->bitvector
              (bveq (signal-value btor944) (signal-value btor125)))
             (list)))
           (btor946
            (if (bitvector->bool (signal-value btor945)) btor926 btor924))
           (btor947
            (bv->signal
             (zero-extend (signal-value btor125) (bitvector 5))
             btor125))
           (btor948
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor947)))
             (list)))
           (btor949
            (if (bitvector->bool (signal-value btor948)) btor26 btor95))
           (btor950
            (bv->signal
             (zero-extend (signal-value btor100) (bitvector 5))
             btor100))
           (btor951
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor950)))
             (list)))
           (btor952
            (if (bitvector->bool (signal-value btor951)) btor25 btor949))
           (btor953
            (signal
             (apply bvor (bitvector->bits (signal-value btor15)))
             (signal-state btor15)))
           (btor954 (signal (bvnot (signal-value btor953)) (list)))
           (btor955
            (if (bitvector->bool (signal-value btor954)) btor24 btor952))
           (btor956
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor193)))
             (list)))
           (btor957
            (if (bitvector->bool (signal-value btor956)) btor95 btor955))
           (btor958
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 5))
             btor196))
           (btor959
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor958)))
             (list)))
           (btor960
            (if (bitvector->bool (signal-value btor959)) btor27 btor957))
           (btor961
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state961)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state961)))
                     ((assoc-has-key? init-hash 'state961)
                      (bv->signal (assoc-ref init-hash 'state961)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor962
            (signal
             (bvor (signal-value btor960) (signal-value btor961))
             (list)))
           (btor963
            (if (bitvector->bool (signal-value btor962)) btor95 btor946))
           (btor964
            (if (bitvector->bool (signal-value btor939)) btor14 btor963))
           (btor965
            (if (bitvector->bool (signal-value btor899)) btor964 btor923))
           (btor966
            (bv->signal
             (zero-extend (signal-value btor965) (bitvector 1))
             btor965))
           (btor967
            (bv->signal
             (zero-extend (signal-value btor923) (bitvector 1))
             btor923))
           (btor968
            (bv->signal
             (zero-extend (signal-value btor965) (bitvector 1))
             btor965))
           (btor969
            (bv->signal
             (zero-extend (signal-value btor963) (bitvector 1))
             btor963))
           (btor970
            (bv->signal
             (zero-extend (signal-value btor964) (bitvector 1))
             btor964))
           (btor971
            (bv->signal
             (zero-extend (signal-value btor903) (bitvector 1))
             btor903))
           (btor972
            (bv->signal
             (zero-extend (signal-value btor920) (bitvector 1))
             btor920))
           (btor973
            (if (bitvector->bool (signal-value btor891)) btor52 btor100))
           (btor974
            (if (bitvector->bool (signal-value btor894)) btor51 btor973))
           (btor975
            (if (bitvector->bool (signal-value btor897)) btor50 btor974))
           (btor976
            (if (bitvector->bool (signal-value btor899)) btor100 btor975))
           (btor977
            (if (bitvector->bool (signal-value btor902)) btor49 btor976))
           (btor978
            (bv->signal
             (zero-extend (signal-value btor977) (bitvector 1))
             btor977))
           (btor979
            (bv->signal
             (zero-extend (signal-value btor943) (bitvector 1))
             btor943))
           (btor980
            (bv->signal
             (zero-extend (signal-value btor960) (bitvector 1))
             btor960))
           (btor981
            (if (bitvector->bool (signal-value btor931)) btor52 btor100))
           (btor982
            (if (bitvector->bool (signal-value btor934)) btor51 btor981))
           (btor983
            (if (bitvector->bool (signal-value btor937)) btor50 btor982))
           (btor984
            (if (bitvector->bool (signal-value btor939)) btor100 btor983))
           (btor985
            (if (bitvector->bool (signal-value btor942)) btor49 btor984))
           (btor986
            (bv->signal
             (zero-extend (signal-value btor985) (bitvector 1))
             btor985))
           (btor987
            (bv->signal
             (zero-extend (signal-value btor964) (bitvector 1))
             btor964))
           (btor989
            (if (bitvector->bool (signal-value btor495)) btor95 btor282))
           (btor990
            (if (bitvector->bool (signal-value btor700)) btor989 btor127))
           (btor991
            (if (bitvector->bool (signal-value btor694)) btor95 btor990))
           (btor995
            (if (bitvector->bool (signal-value btor700)) btor655 btor137))
           (btor996
            (if (bitvector->bool (signal-value btor694)) btor95 btor995))
           (btor1000 unnamed-input-1000)
           (btor1001
            (if (bitvector->bool (signal-value btor965)) btor876 btor710))
           (btor1002 unnamed-input-1002)
           (btor1003
            (if (bitvector->bool (signal-value btor629)) btor610 btor669))
           (btor1004
            (if (bitvector->bool (signal-value btor700)) btor1003 btor1002))
           (btor1005 unnamed-input-1005)
           (btor1006
            (if (bitvector->bool (signal-value btor694)) btor1005 btor1004))
           (btor1007
            (signal
             (bool->bitvector
              (bvuge (signal-value btor1001) (signal-value btor1006)))
             (list)))
           (btor1008
            (if (bitvector->bool (signal-value btor1007)) btor100 btor95))
           (btor1009
            (if (bitvector->bool (signal-value btor965)) btor149 btor710))
           (btor1010
            (signal
             (bool->bitvector
              (bvuge (signal-value btor1009) (signal-value btor1006)))
             (list)))
           (btor1011
            (if (bitvector->bool (signal-value btor1010)) btor100 btor95))
           (btor1012 (signal (bvnot (signal-value btor495)) (list)))
           (btor1013 (signal (bvnot (signal-value btor493)) (list)))
           (btor1014
            (signal
             (bvand (signal-value btor1012) (signal-value btor1013))
             (list)))
           (btor1015
            (if (bitvector->bool (signal-value btor1014)) btor1011 btor1008))
           (btor1016 (bitvector 37))
           (btor1017
            (bv->signal
             (zero-extend (signal-value btor1001) (bitvector 37))
             btor1001))
           (btor1018
            (bv->signal
             (zero-extend (signal-value btor1006) (bitvector 37))
             btor1006))
           (btor1019
            (signal
             (bvadd (signal-value btor1017) (signal-value btor1018))
             (list)))
           (btor1020
            (bv->signal
             (zero-extend (signal-value btor1009) (bitvector 37))
             btor1009))
           (btor1021
            (bv->signal
             (zero-extend (signal-value btor1006) (bitvector 37))
             btor1006))
           (btor1022
            (signal
             (bvadd (signal-value btor1020) (signal-value btor1021))
             (list)))
           (btor1023
            (if (bitvector->bool (signal-value btor1014)) btor1022 btor1019))
           (btor1024
            (signal
             (extract 36 36 (signal-value btor1023))
             (signal-state btor1023)))
           (btor1025
            (if (bitvector->bool (signal-value btor449)) btor1024 btor1015))
           (btor1026
            (if (bitvector->bool (signal-value btor700)) btor1025 btor1000))
           (btor1027 unnamed-input-1027)
           (btor1028
            (if (bitvector->bool (signal-value btor694)) btor1027 btor1026))
           (btor1029 (signal (bvnot (signal-value btor1028)) (list)))
           (btor1030
            (if (bitvector->bool (signal-value btor449)) btor1028 btor1029))
           (btor1031
            (signal
             (extract 35 35 (signal-value btor1006))
             (signal-state btor1006)))
           (btor1032
            (signal
             (extract 35 35 (signal-value btor710))
             (signal-state btor710)))
           (btor1033
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor1031)
              (signal-value btor1032))
             (list)))
           (btor1034 (signal (bvnot (signal-value btor449)) (list)))
           (btor1035
            (signal
             (bvxor (signal-value btor1033) (signal-value btor1034))
             (list)))
           (btor1036 unnamed-input-1036)
           (btor1037
            (signal
             (bvsub (signal-value btor1001) (signal-value btor1006))
             (list)))
           (btor1038
            (signal
             (bvsub (signal-value btor1009) (signal-value btor1006))
             (list)))
           (btor1039
            (if (bitvector->bool (signal-value btor1014)) btor1038 btor1037))
           (btor1040
            (signal
             (extract 35 0 (signal-value btor1023))
             (signal-state btor1023)))
           (btor1041
            (if (bitvector->bool (signal-value btor449)) btor1040 btor1039))
           (btor1042
            (if (bitvector->bool (signal-value btor700)) btor1041 btor1036))
           (btor1043 unnamed-input-1043)
           (btor1044
            (if (bitvector->bool (signal-value btor694)) btor1043 btor1042))
           (btor1045
            (signal
             (extract 35 35 (signal-value btor1044))
             (signal-state btor1044)))
           (btor1046
            (signal
             (bvxor (signal-value btor1032) (signal-value btor1045))
             (list)))
           (btor1047
            (signal
             (bvand (signal-value btor1035) (signal-value btor1046))
             (list)))
           (btor1048
            (signal
             (extract 35 35 (signal-value btor876))
             (signal-state btor876)))
           (btor1049
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor1031)
              (signal-value btor1048))
             (list)))
           (btor1050
            (signal
             (bvxor (signal-value btor1049) (signal-value btor1034))
             (list)))
           (btor1051
            (signal
             (bvxor (signal-value btor1048) (signal-value btor1045))
             (list)))
           (btor1052
            (signal
             (bvand (signal-value btor1050) (signal-value btor1051))
             (list)))
           (btor1053
            (if (bitvector->bool (signal-value btor965)) btor1052 btor1047))
           (btor1054 unnamed-input-1054)
           (btor1055
            (signal
             (bvor (signal-value btor754) (signal-value btor811))
             (list)))
           (btor1056
            (if (bitvector->bool (signal-value btor700)) btor1055 btor1054))
           (btor1057 unnamed-input-1057)
           (btor1058
            (if (bitvector->bool (signal-value btor694)) btor1057 btor1056))
           (btor1059
            (signal
             (apply bvor (bitvector->bits (signal-value btor1006)))
             (signal-state btor1006)))
           (btor1060
            (signal
             (bvand (signal-value btor1058) (signal-value btor1059))
             (list)))
           (btor1061
            (if (bitvector->bool (signal-value btor1060)) btor1053 btor1030))
           (btor1062
            (if (bitvector->bool (signal-value btor700)) btor1061 btor147))
           (btor1063
            (if (bitvector->bool (signal-value btor694)) btor95 btor1062))
           (btor1067
            (if (bitvector->bool (signal-value btor495)) btor1044 btor272))
           (btor1068
            (if (bitvector->bool (signal-value btor495)) btor1067 btor1044))
           (btor1069
            (if (bitvector->bool (signal-value btor700)) btor1068 btor158))
           (btor1070
            (if (bitvector->bool (signal-value btor694)) btor149 btor1069))
           (btor1074
            (if (bitvector->bool (signal-value btor93)) btor81 btor43))
           (btor1075 (bv->signal (bv 26 (bitvector 5))))
           (btor1076
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor1075)))
             (list)))
           (btor1077
            (if (bitvector->bool (signal-value btor1076)) btor1074 btor202))
           (btor1078
            (if (bitvector->bool (signal-value btor204)) btor81 btor1077))
           (btor1079
            (if (bitvector->bool (signal-value btor209)) btor43 btor1078))
           (btor1080
            (if (bitvector->bool (signal-value btor483)) btor1079 btor202))
           (btor1085
            (if (bitvector->bool (signal-value btor94)) btor82 btor44))
           (btor1086
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor1075)))
             (list)))
           (btor1087
            (if (bitvector->bool (signal-value btor1086)) btor1085 btor252))
           (btor1088
            (if (bitvector->bool (signal-value btor254)) btor82 btor1087))
           (btor1089
            (if (bitvector->bool (signal-value btor259)) btor44 btor1088))
           (btor1090
            (if (bitvector->bool (signal-value btor491)) btor1089 btor252))
           (btor1095
            (if (bitvector->bool (signal-value btor700)) btor1067 btor272))
           (btor1096
            (if (bitvector->bool (signal-value btor694)) btor149 btor1095))
           (btor1100
            (if (bitvector->bool (signal-value btor700)) btor989 btor282))
           (btor1101
            (if (bitvector->bool (signal-value btor694)) btor95 btor1100))
           (btor1105
            (if (bitvector->bool (signal-value btor460)) btor437 btor396))
           (btor1110
            (if (bitvector->bool (signal-value btor470)) btor28 btor436))
           (btor1115
            (if (bitvector->bool (signal-value btor767)) btor91 btor551))
           (btor1120
            (if (bitvector->bool (signal-value btor824)) btor92 btor600))
           (btor1125
            (if (bitvector->bool (signal-value btor678)) btor95 btor653))
           (btor1130
            (if (bitvector->bool (signal-value btor678)) btor610 btor669))
           (btor1135
            (if (bitvector->bool (signal-value btor700)) btor1068 btor710))
           (btor1136
            (if (bitvector->bool (signal-value btor694)) btor149 btor1135))
           (btor1140
            (if (bitvector->bool (signal-value btor832)) btor552 btor751))
           (btor1145
            (if (bitvector->bool (signal-value btor840)) btor601 btor808))
           (btor1150
            (if (bitvector->bool (signal-value btor355)) btor19 btor856))
           (btor1155
            (if (bitvector->bool (signal-value btor319)) btor857 btor870))
           (btor1160
            (if (bitvector->bool (signal-value btor977)) btor964 btor923))
           (btor1165
            (if (bitvector->bool (signal-value btor985)) btor14 btor963)))
      (list
       (cons
        'scanouta
        (signal
         (signal-value btor211)
         (append
          (list (cons 'state961 (signal-value btor960)))
          (append
           (list (cons 'state928 (signal-value btor943)))
           (append
            (list (cons 'state926 (signal-value btor1165)))
            (append
             (list (cons 'state924 (signal-value btor963)))
             (append
              (list (cons 'state921 (signal-value btor920)))
              (append
               (list (cons 'state888 (signal-value btor903)))
               (append
                (list (cons 'state886 (signal-value btor1160)))
                (append
                 (list (cons 'state884 (signal-value btor923)))
                 (append
                  (list (cons 'state868 (signal-value btor313)))
                  (append
                   (list (cons 'state863 (signal-value btor298)))
                   (append
                    (list (cons 'state861 (signal-value btor1155)))
                    (append
                     (list (cons 'state859 (signal-value btor870)))
                     (append
                      (list (cons 'state854 (signal-value btor349)))
                      (append
                       (list (cons 'state849 (signal-value btor334)))
                       (append
                        (list (cons 'state847 (signal-value btor1150)))
                        (append
                         (list (cons 'state845 (signal-value btor856)))
                         (append
                          (list (cons 'state806 (signal-value btor805)))
                          (append
                           (list (cons 'state773 (signal-value btor788)))
                           (append
                            (list (cons 'state771 (signal-value btor1145)))
                            (append
                             (list (cons 'state769 (signal-value btor808)))
                             (append
                              (list (cons 'state749 (signal-value btor748)))
                              (append
                               (list (cons 'state716 (signal-value btor731)))
                               (append
                                (list (cons 'state714 (signal-value btor1140)))
                                (append
                                 (list (cons 'state712 (signal-value btor751)))
                                 (append
                                  (list
                                   (cons 'state706 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state704 (signal-value btor1136)))
                                   (append
                                    (list
                                     (cons 'state702 (signal-value btor710)))
                                    (append
                                     (list
                                      (cons 'state667 (signal-value btor650)))
                                     (append
                                      (list
                                       (cons 'state662 (signal-value btor633)))
                                      (append
                                       (list
                                        (cons
                                         'state660
                                         (signal-value btor1130)))
                                       (append
                                        (list
                                         (cons
                                          'state658
                                          (signal-value btor669)))
                                        (append
                                         (list
                                          (cons
                                           'state651
                                           (signal-value btor650)))
                                         (append
                                          (list
                                           (cons
                                            'state618
                                            (signal-value btor633)))
                                          (append
                                           (list
                                            (cons
                                             'state616
                                             (signal-value btor1125)))
                                           (append
                                            (list
                                             (cons
                                              'state614
                                              (signal-value btor653)))
                                            (append
                                             (list
                                              (cons
                                               'state598
                                               (signal-value btor597)))
                                             (append
                                              (list
                                               (cons
                                                'state565
                                                (signal-value btor580)))
                                              (append
                                               (list
                                                (cons
                                                 'state563
                                                 (signal-value btor1120)))
                                               (append
                                                (list
                                                 (cons
                                                  'state561
                                                  (signal-value btor600)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state549
                                                   (signal-value btor548)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state516
                                                    (signal-value btor531)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state514
                                                     (signal-value btor1115)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state512
                                                      (signal-value btor551)))
                                                    (append
                                                     (list
                                                      (cons
                                                       'state434
                                                       (signal-value btor433)))
                                                     (append
                                                      (list
                                                       (cons
                                                        'state401
                                                        (signal-value
                                                         btor416)))
                                                      (append
                                                       (list
                                                        (cons
                                                         'state399
                                                         (signal-value
                                                          btor1110)))
                                                       (append
                                                        (list
                                                         (cons
                                                          'state397
                                                          (signal-value
                                                           btor436)))
                                                        (append
                                                         (list
                                                          (cons
                                                           'state394
                                                           (signal-value
                                                            btor393)))
                                                         (append
                                                          (list
                                                           (cons
                                                            'state361
                                                            (signal-value
                                                             btor376)))
                                                          (append
                                                           (list
                                                            (cons
                                                             'state359
                                                             (signal-value
                                                              btor1105)))
                                                           (append
                                                            (list
                                                             (cons
                                                              'state357
                                                              (signal-value
                                                               btor396)))
                                                            (append
                                                             (list
                                                              (cons
                                                               'state278
                                                               (signal-value
                                                                btor122)))
                                                             (append
                                                              (list
                                                               (cons
                                                                'state276
                                                                (signal-value
                                                                 btor1101)))
                                                              (append
                                                               (list
                                                                (cons
                                                                 'state274
                                                                 (signal-value
                                                                  btor282)))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  'state268
                                                                  (signal-value
                                                                   btor122)))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   'state266
                                                                   (signal-value
                                                                    btor1096)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state264
                                                                    (signal-value
                                                                     btor272)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state250
                                                                     (signal-value
                                                                      btor249)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state217
                                                                      (signal-value
                                                                       btor232)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state215
                                                                       (signal-value
                                                                        btor1090)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state213
                                                                        (signal-value
                                                                         btor252)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state200
                                                                         (signal-value
                                                                          btor199)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state165
                                                                          (signal-value
                                                                           btor180)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state163
                                                                           (signal-value
                                                                            btor1080)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state161
                                                                            (signal-value
                                                                             btor202)))
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
                                                                               btor1070)))
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
                                                                                  btor1063)))
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
                                                                                     btor996)))
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
                                                                                        btor991)))
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
          (list (cons 'state961 (signal-value btor960)))
          (append
           (list (cons 'state928 (signal-value btor943)))
           (append
            (list (cons 'state926 (signal-value btor1165)))
            (append
             (list (cons 'state924 (signal-value btor963)))
             (append
              (list (cons 'state921 (signal-value btor920)))
              (append
               (list (cons 'state888 (signal-value btor903)))
               (append
                (list (cons 'state886 (signal-value btor1160)))
                (append
                 (list (cons 'state884 (signal-value btor923)))
                 (append
                  (list (cons 'state868 (signal-value btor313)))
                  (append
                   (list (cons 'state863 (signal-value btor298)))
                   (append
                    (list (cons 'state861 (signal-value btor1155)))
                    (append
                     (list (cons 'state859 (signal-value btor870)))
                     (append
                      (list (cons 'state854 (signal-value btor349)))
                      (append
                       (list (cons 'state849 (signal-value btor334)))
                       (append
                        (list (cons 'state847 (signal-value btor1150)))
                        (append
                         (list (cons 'state845 (signal-value btor856)))
                         (append
                          (list (cons 'state806 (signal-value btor805)))
                          (append
                           (list (cons 'state773 (signal-value btor788)))
                           (append
                            (list (cons 'state771 (signal-value btor1145)))
                            (append
                             (list (cons 'state769 (signal-value btor808)))
                             (append
                              (list (cons 'state749 (signal-value btor748)))
                              (append
                               (list (cons 'state716 (signal-value btor731)))
                               (append
                                (list (cons 'state714 (signal-value btor1140)))
                                (append
                                 (list (cons 'state712 (signal-value btor751)))
                                 (append
                                  (list
                                   (cons 'state706 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state704 (signal-value btor1136)))
                                   (append
                                    (list
                                     (cons 'state702 (signal-value btor710)))
                                    (append
                                     (list
                                      (cons 'state667 (signal-value btor650)))
                                     (append
                                      (list
                                       (cons 'state662 (signal-value btor633)))
                                      (append
                                       (list
                                        (cons
                                         'state660
                                         (signal-value btor1130)))
                                       (append
                                        (list
                                         (cons
                                          'state658
                                          (signal-value btor669)))
                                        (append
                                         (list
                                          (cons
                                           'state651
                                           (signal-value btor650)))
                                         (append
                                          (list
                                           (cons
                                            'state618
                                            (signal-value btor633)))
                                          (append
                                           (list
                                            (cons
                                             'state616
                                             (signal-value btor1125)))
                                           (append
                                            (list
                                             (cons
                                              'state614
                                              (signal-value btor653)))
                                            (append
                                             (list
                                              (cons
                                               'state598
                                               (signal-value btor597)))
                                             (append
                                              (list
                                               (cons
                                                'state565
                                                (signal-value btor580)))
                                              (append
                                               (list
                                                (cons
                                                 'state563
                                                 (signal-value btor1120)))
                                               (append
                                                (list
                                                 (cons
                                                  'state561
                                                  (signal-value btor600)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state549
                                                   (signal-value btor548)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state516
                                                    (signal-value btor531)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state514
                                                     (signal-value btor1115)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state512
                                                      (signal-value btor551)))
                                                    (append
                                                     (list
                                                      (cons
                                                       'state434
                                                       (signal-value btor433)))
                                                     (append
                                                      (list
                                                       (cons
                                                        'state401
                                                        (signal-value
                                                         btor416)))
                                                      (append
                                                       (list
                                                        (cons
                                                         'state399
                                                         (signal-value
                                                          btor1110)))
                                                       (append
                                                        (list
                                                         (cons
                                                          'state397
                                                          (signal-value
                                                           btor436)))
                                                        (append
                                                         (list
                                                          (cons
                                                           'state394
                                                           (signal-value
                                                            btor393)))
                                                         (append
                                                          (list
                                                           (cons
                                                            'state361
                                                            (signal-value
                                                             btor376)))
                                                          (append
                                                           (list
                                                            (cons
                                                             'state359
                                                             (signal-value
                                                              btor1105)))
                                                           (append
                                                            (list
                                                             (cons
                                                              'state357
                                                              (signal-value
                                                               btor396)))
                                                            (append
                                                             (list
                                                              (cons
                                                               'state278
                                                               (signal-value
                                                                btor122)))
                                                             (append
                                                              (list
                                                               (cons
                                                                'state276
                                                                (signal-value
                                                                 btor1101)))
                                                              (append
                                                               (list
                                                                (cons
                                                                 'state274
                                                                 (signal-value
                                                                  btor282)))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  'state268
                                                                  (signal-value
                                                                   btor122)))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   'state266
                                                                   (signal-value
                                                                    btor1096)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state264
                                                                    (signal-value
                                                                     btor272)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state250
                                                                     (signal-value
                                                                      btor249)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state217
                                                                      (signal-value
                                                                       btor232)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state215
                                                                       (signal-value
                                                                        btor1090)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state213
                                                                        (signal-value
                                                                         btor252)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state200
                                                                         (signal-value
                                                                          btor199)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state165
                                                                          (signal-value
                                                                           btor180)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state163
                                                                           (signal-value
                                                                            btor1080)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state161
                                                                            (signal-value
                                                                             btor202)))
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
                                                                               btor1070)))
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
                                                                                  btor1063)))
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
                                                                                     btor996)))
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
                                                                                        btor991)))
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
          (list (cons 'state961 (signal-value btor960)))
          (append
           (list (cons 'state928 (signal-value btor943)))
           (append
            (list (cons 'state926 (signal-value btor1165)))
            (append
             (list (cons 'state924 (signal-value btor963)))
             (append
              (list (cons 'state921 (signal-value btor920)))
              (append
               (list (cons 'state888 (signal-value btor903)))
               (append
                (list (cons 'state886 (signal-value btor1160)))
                (append
                 (list (cons 'state884 (signal-value btor923)))
                 (append
                  (list (cons 'state868 (signal-value btor313)))
                  (append
                   (list (cons 'state863 (signal-value btor298)))
                   (append
                    (list (cons 'state861 (signal-value btor1155)))
                    (append
                     (list (cons 'state859 (signal-value btor870)))
                     (append
                      (list (cons 'state854 (signal-value btor349)))
                      (append
                       (list (cons 'state849 (signal-value btor334)))
                       (append
                        (list (cons 'state847 (signal-value btor1150)))
                        (append
                         (list (cons 'state845 (signal-value btor856)))
                         (append
                          (list (cons 'state806 (signal-value btor805)))
                          (append
                           (list (cons 'state773 (signal-value btor788)))
                           (append
                            (list (cons 'state771 (signal-value btor1145)))
                            (append
                             (list (cons 'state769 (signal-value btor808)))
                             (append
                              (list (cons 'state749 (signal-value btor748)))
                              (append
                               (list (cons 'state716 (signal-value btor731)))
                               (append
                                (list (cons 'state714 (signal-value btor1140)))
                                (append
                                 (list (cons 'state712 (signal-value btor751)))
                                 (append
                                  (list
                                   (cons 'state706 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state704 (signal-value btor1136)))
                                   (append
                                    (list
                                     (cons 'state702 (signal-value btor710)))
                                    (append
                                     (list
                                      (cons 'state667 (signal-value btor650)))
                                     (append
                                      (list
                                       (cons 'state662 (signal-value btor633)))
                                      (append
                                       (list
                                        (cons
                                         'state660
                                         (signal-value btor1130)))
                                       (append
                                        (list
                                         (cons
                                          'state658
                                          (signal-value btor669)))
                                        (append
                                         (list
                                          (cons
                                           'state651
                                           (signal-value btor650)))
                                         (append
                                          (list
                                           (cons
                                            'state618
                                            (signal-value btor633)))
                                          (append
                                           (list
                                            (cons
                                             'state616
                                             (signal-value btor1125)))
                                           (append
                                            (list
                                             (cons
                                              'state614
                                              (signal-value btor653)))
                                            (append
                                             (list
                                              (cons
                                               'state598
                                               (signal-value btor597)))
                                             (append
                                              (list
                                               (cons
                                                'state565
                                                (signal-value btor580)))
                                              (append
                                               (list
                                                (cons
                                                 'state563
                                                 (signal-value btor1120)))
                                               (append
                                                (list
                                                 (cons
                                                  'state561
                                                  (signal-value btor600)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state549
                                                   (signal-value btor548)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state516
                                                    (signal-value btor531)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state514
                                                     (signal-value btor1115)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state512
                                                      (signal-value btor551)))
                                                    (append
                                                     (list
                                                      (cons
                                                       'state434
                                                       (signal-value btor433)))
                                                     (append
                                                      (list
                                                       (cons
                                                        'state401
                                                        (signal-value
                                                         btor416)))
                                                      (append
                                                       (list
                                                        (cons
                                                         'state399
                                                         (signal-value
                                                          btor1110)))
                                                       (append
                                                        (list
                                                         (cons
                                                          'state397
                                                          (signal-value
                                                           btor436)))
                                                        (append
                                                         (list
                                                          (cons
                                                           'state394
                                                           (signal-value
                                                            btor393)))
                                                         (append
                                                          (list
                                                           (cons
                                                            'state361
                                                            (signal-value
                                                             btor376)))
                                                          (append
                                                           (list
                                                            (cons
                                                             'state359
                                                             (signal-value
                                                              btor1105)))
                                                           (append
                                                            (list
                                                             (cons
                                                              'state357
                                                              (signal-value
                                                               btor396)))
                                                            (append
                                                             (list
                                                              (cons
                                                               'state278
                                                               (signal-value
                                                                btor122)))
                                                             (append
                                                              (list
                                                               (cons
                                                                'state276
                                                                (signal-value
                                                                 btor1101)))
                                                              (append
                                                               (list
                                                                (cons
                                                                 'state274
                                                                 (signal-value
                                                                  btor282)))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  'state268
                                                                  (signal-value
                                                                   btor122)))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   'state266
                                                                   (signal-value
                                                                    btor1096)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state264
                                                                    (signal-value
                                                                     btor272)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state250
                                                                     (signal-value
                                                                      btor249)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state217
                                                                      (signal-value
                                                                       btor232)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state215
                                                                       (signal-value
                                                                        btor1090)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state213
                                                                        (signal-value
                                                                         btor252)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state200
                                                                         (signal-value
                                                                          btor199)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state165
                                                                          (signal-value
                                                                           btor180)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state163
                                                                           (signal-value
                                                                            btor1080)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state161
                                                                            (signal-value
                                                                             btor202)))
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
                                                                               btor1070)))
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
                                                                                  btor1063)))
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
                                                                                     btor996)))
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
                                                                                        btor991)))
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
          (list (cons 'state961 (signal-value btor960)))
          (append
           (list (cons 'state928 (signal-value btor943)))
           (append
            (list (cons 'state926 (signal-value btor1165)))
            (append
             (list (cons 'state924 (signal-value btor963)))
             (append
              (list (cons 'state921 (signal-value btor920)))
              (append
               (list (cons 'state888 (signal-value btor903)))
               (append
                (list (cons 'state886 (signal-value btor1160)))
                (append
                 (list (cons 'state884 (signal-value btor923)))
                 (append
                  (list (cons 'state868 (signal-value btor313)))
                  (append
                   (list (cons 'state863 (signal-value btor298)))
                   (append
                    (list (cons 'state861 (signal-value btor1155)))
                    (append
                     (list (cons 'state859 (signal-value btor870)))
                     (append
                      (list (cons 'state854 (signal-value btor349)))
                      (append
                       (list (cons 'state849 (signal-value btor334)))
                       (append
                        (list (cons 'state847 (signal-value btor1150)))
                        (append
                         (list (cons 'state845 (signal-value btor856)))
                         (append
                          (list (cons 'state806 (signal-value btor805)))
                          (append
                           (list (cons 'state773 (signal-value btor788)))
                           (append
                            (list (cons 'state771 (signal-value btor1145)))
                            (append
                             (list (cons 'state769 (signal-value btor808)))
                             (append
                              (list (cons 'state749 (signal-value btor748)))
                              (append
                               (list (cons 'state716 (signal-value btor731)))
                               (append
                                (list (cons 'state714 (signal-value btor1140)))
                                (append
                                 (list (cons 'state712 (signal-value btor751)))
                                 (append
                                  (list
                                   (cons 'state706 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state704 (signal-value btor1136)))
                                   (append
                                    (list
                                     (cons 'state702 (signal-value btor710)))
                                    (append
                                     (list
                                      (cons 'state667 (signal-value btor650)))
                                     (append
                                      (list
                                       (cons 'state662 (signal-value btor633)))
                                      (append
                                       (list
                                        (cons
                                         'state660
                                         (signal-value btor1130)))
                                       (append
                                        (list
                                         (cons
                                          'state658
                                          (signal-value btor669)))
                                        (append
                                         (list
                                          (cons
                                           'state651
                                           (signal-value btor650)))
                                         (append
                                          (list
                                           (cons
                                            'state618
                                            (signal-value btor633)))
                                          (append
                                           (list
                                            (cons
                                             'state616
                                             (signal-value btor1125)))
                                           (append
                                            (list
                                             (cons
                                              'state614
                                              (signal-value btor653)))
                                            (append
                                             (list
                                              (cons
                                               'state598
                                               (signal-value btor597)))
                                             (append
                                              (list
                                               (cons
                                                'state565
                                                (signal-value btor580)))
                                              (append
                                               (list
                                                (cons
                                                 'state563
                                                 (signal-value btor1120)))
                                               (append
                                                (list
                                                 (cons
                                                  'state561
                                                  (signal-value btor600)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state549
                                                   (signal-value btor548)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state516
                                                    (signal-value btor531)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state514
                                                     (signal-value btor1115)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state512
                                                      (signal-value btor551)))
                                                    (append
                                                     (list
                                                      (cons
                                                       'state434
                                                       (signal-value btor433)))
                                                     (append
                                                      (list
                                                       (cons
                                                        'state401
                                                        (signal-value
                                                         btor416)))
                                                      (append
                                                       (list
                                                        (cons
                                                         'state399
                                                         (signal-value
                                                          btor1110)))
                                                       (append
                                                        (list
                                                         (cons
                                                          'state397
                                                          (signal-value
                                                           btor436)))
                                                        (append
                                                         (list
                                                          (cons
                                                           'state394
                                                           (signal-value
                                                            btor393)))
                                                         (append
                                                          (list
                                                           (cons
                                                            'state361
                                                            (signal-value
                                                             btor376)))
                                                          (append
                                                           (list
                                                            (cons
                                                             'state359
                                                             (signal-value
                                                              btor1105)))
                                                           (append
                                                            (list
                                                             (cons
                                                              'state357
                                                              (signal-value
                                                               btor396)))
                                                            (append
                                                             (list
                                                              (cons
                                                               'state278
                                                               (signal-value
                                                                btor122)))
                                                             (append
                                                              (list
                                                               (cons
                                                                'state276
                                                                (signal-value
                                                                 btor1101)))
                                                              (append
                                                               (list
                                                                (cons
                                                                 'state274
                                                                 (signal-value
                                                                  btor282)))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  'state268
                                                                  (signal-value
                                                                   btor122)))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   'state266
                                                                   (signal-value
                                                                    btor1096)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state264
                                                                    (signal-value
                                                                     btor272)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state250
                                                                     (signal-value
                                                                      btor249)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state217
                                                                      (signal-value
                                                                       btor232)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state215
                                                                       (signal-value
                                                                        btor1090)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state213
                                                                        (signal-value
                                                                         btor252)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state200
                                                                         (signal-value
                                                                          btor199)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state165
                                                                          (signal-value
                                                                           btor180)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state163
                                                                           (signal-value
                                                                            btor1080)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state161
                                                                            (signal-value
                                                                             btor202)))
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
                                                                               btor1070)))
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
                                                                                  btor1063)))
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
                                                                                     btor996)))
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
                                                                                        btor991)))
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
          (list (cons 'state961 (signal-value btor960)))
          (append
           (list (cons 'state928 (signal-value btor943)))
           (append
            (list (cons 'state926 (signal-value btor1165)))
            (append
             (list (cons 'state924 (signal-value btor963)))
             (append
              (list (cons 'state921 (signal-value btor920)))
              (append
               (list (cons 'state888 (signal-value btor903)))
               (append
                (list (cons 'state886 (signal-value btor1160)))
                (append
                 (list (cons 'state884 (signal-value btor923)))
                 (append
                  (list (cons 'state868 (signal-value btor313)))
                  (append
                   (list (cons 'state863 (signal-value btor298)))
                   (append
                    (list (cons 'state861 (signal-value btor1155)))
                    (append
                     (list (cons 'state859 (signal-value btor870)))
                     (append
                      (list (cons 'state854 (signal-value btor349)))
                      (append
                       (list (cons 'state849 (signal-value btor334)))
                       (append
                        (list (cons 'state847 (signal-value btor1150)))
                        (append
                         (list (cons 'state845 (signal-value btor856)))
                         (append
                          (list (cons 'state806 (signal-value btor805)))
                          (append
                           (list (cons 'state773 (signal-value btor788)))
                           (append
                            (list (cons 'state771 (signal-value btor1145)))
                            (append
                             (list (cons 'state769 (signal-value btor808)))
                             (append
                              (list (cons 'state749 (signal-value btor748)))
                              (append
                               (list (cons 'state716 (signal-value btor731)))
                               (append
                                (list (cons 'state714 (signal-value btor1140)))
                                (append
                                 (list (cons 'state712 (signal-value btor751)))
                                 (append
                                  (list
                                   (cons 'state706 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state704 (signal-value btor1136)))
                                   (append
                                    (list
                                     (cons 'state702 (signal-value btor710)))
                                    (append
                                     (list
                                      (cons 'state667 (signal-value btor650)))
                                     (append
                                      (list
                                       (cons 'state662 (signal-value btor633)))
                                      (append
                                       (list
                                        (cons
                                         'state660
                                         (signal-value btor1130)))
                                       (append
                                        (list
                                         (cons
                                          'state658
                                          (signal-value btor669)))
                                        (append
                                         (list
                                          (cons
                                           'state651
                                           (signal-value btor650)))
                                         (append
                                          (list
                                           (cons
                                            'state618
                                            (signal-value btor633)))
                                          (append
                                           (list
                                            (cons
                                             'state616
                                             (signal-value btor1125)))
                                           (append
                                            (list
                                             (cons
                                              'state614
                                              (signal-value btor653)))
                                            (append
                                             (list
                                              (cons
                                               'state598
                                               (signal-value btor597)))
                                             (append
                                              (list
                                               (cons
                                                'state565
                                                (signal-value btor580)))
                                              (append
                                               (list
                                                (cons
                                                 'state563
                                                 (signal-value btor1120)))
                                               (append
                                                (list
                                                 (cons
                                                  'state561
                                                  (signal-value btor600)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state549
                                                   (signal-value btor548)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state516
                                                    (signal-value btor531)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state514
                                                     (signal-value btor1115)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state512
                                                      (signal-value btor551)))
                                                    (append
                                                     (list
                                                      (cons
                                                       'state434
                                                       (signal-value btor433)))
                                                     (append
                                                      (list
                                                       (cons
                                                        'state401
                                                        (signal-value
                                                         btor416)))
                                                      (append
                                                       (list
                                                        (cons
                                                         'state399
                                                         (signal-value
                                                          btor1110)))
                                                       (append
                                                        (list
                                                         (cons
                                                          'state397
                                                          (signal-value
                                                           btor436)))
                                                        (append
                                                         (list
                                                          (cons
                                                           'state394
                                                           (signal-value
                                                            btor393)))
                                                         (append
                                                          (list
                                                           (cons
                                                            'state361
                                                            (signal-value
                                                             btor376)))
                                                          (append
                                                           (list
                                                            (cons
                                                             'state359
                                                             (signal-value
                                                              btor1105)))
                                                           (append
                                                            (list
                                                             (cons
                                                              'state357
                                                              (signal-value
                                                               btor396)))
                                                            (append
                                                             (list
                                                              (cons
                                                               'state278
                                                               (signal-value
                                                                btor122)))
                                                             (append
                                                              (list
                                                               (cons
                                                                'state276
                                                                (signal-value
                                                                 btor1101)))
                                                              (append
                                                               (list
                                                                (cons
                                                                 'state274
                                                                 (signal-value
                                                                  btor282)))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  'state268
                                                                  (signal-value
                                                                   btor122)))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   'state266
                                                                   (signal-value
                                                                    btor1096)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state264
                                                                    (signal-value
                                                                     btor272)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state250
                                                                     (signal-value
                                                                      btor249)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state217
                                                                      (signal-value
                                                                       btor232)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state215
                                                                       (signal-value
                                                                        btor1090)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state213
                                                                        (signal-value
                                                                         btor252)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state200
                                                                         (signal-value
                                                                          btor199)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state165
                                                                          (signal-value
                                                                           btor180)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state163
                                                                           (signal-value
                                                                            btor1080)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state161
                                                                            (signal-value
                                                                             btor202)))
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
                                                                               btor1070)))
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
                                                                                  btor1063)))
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
                                                                                     btor996)))
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
                                                                                        btor991)))
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
         (signal-value btor261)
         (append
          (list (cons 'state961 (signal-value btor960)))
          (append
           (list (cons 'state928 (signal-value btor943)))
           (append
            (list (cons 'state926 (signal-value btor1165)))
            (append
             (list (cons 'state924 (signal-value btor963)))
             (append
              (list (cons 'state921 (signal-value btor920)))
              (append
               (list (cons 'state888 (signal-value btor903)))
               (append
                (list (cons 'state886 (signal-value btor1160)))
                (append
                 (list (cons 'state884 (signal-value btor923)))
                 (append
                  (list (cons 'state868 (signal-value btor313)))
                  (append
                   (list (cons 'state863 (signal-value btor298)))
                   (append
                    (list (cons 'state861 (signal-value btor1155)))
                    (append
                     (list (cons 'state859 (signal-value btor870)))
                     (append
                      (list (cons 'state854 (signal-value btor349)))
                      (append
                       (list (cons 'state849 (signal-value btor334)))
                       (append
                        (list (cons 'state847 (signal-value btor1150)))
                        (append
                         (list (cons 'state845 (signal-value btor856)))
                         (append
                          (list (cons 'state806 (signal-value btor805)))
                          (append
                           (list (cons 'state773 (signal-value btor788)))
                           (append
                            (list (cons 'state771 (signal-value btor1145)))
                            (append
                             (list (cons 'state769 (signal-value btor808)))
                             (append
                              (list (cons 'state749 (signal-value btor748)))
                              (append
                               (list (cons 'state716 (signal-value btor731)))
                               (append
                                (list (cons 'state714 (signal-value btor1140)))
                                (append
                                 (list (cons 'state712 (signal-value btor751)))
                                 (append
                                  (list
                                   (cons 'state706 (signal-value btor122)))
                                  (append
                                   (list
                                    (cons 'state704 (signal-value btor1136)))
                                   (append
                                    (list
                                     (cons 'state702 (signal-value btor710)))
                                    (append
                                     (list
                                      (cons 'state667 (signal-value btor650)))
                                     (append
                                      (list
                                       (cons 'state662 (signal-value btor633)))
                                      (append
                                       (list
                                        (cons
                                         'state660
                                         (signal-value btor1130)))
                                       (append
                                        (list
                                         (cons
                                          'state658
                                          (signal-value btor669)))
                                        (append
                                         (list
                                          (cons
                                           'state651
                                           (signal-value btor650)))
                                         (append
                                          (list
                                           (cons
                                            'state618
                                            (signal-value btor633)))
                                          (append
                                           (list
                                            (cons
                                             'state616
                                             (signal-value btor1125)))
                                           (append
                                            (list
                                             (cons
                                              'state614
                                              (signal-value btor653)))
                                            (append
                                             (list
                                              (cons
                                               'state598
                                               (signal-value btor597)))
                                             (append
                                              (list
                                               (cons
                                                'state565
                                                (signal-value btor580)))
                                              (append
                                               (list
                                                (cons
                                                 'state563
                                                 (signal-value btor1120)))
                                               (append
                                                (list
                                                 (cons
                                                  'state561
                                                  (signal-value btor600)))
                                                (append
                                                 (list
                                                  (cons
                                                   'state549
                                                   (signal-value btor548)))
                                                 (append
                                                  (list
                                                   (cons
                                                    'state516
                                                    (signal-value btor531)))
                                                  (append
                                                   (list
                                                    (cons
                                                     'state514
                                                     (signal-value btor1115)))
                                                   (append
                                                    (list
                                                     (cons
                                                      'state512
                                                      (signal-value btor551)))
                                                    (append
                                                     (list
                                                      (cons
                                                       'state434
                                                       (signal-value btor433)))
                                                     (append
                                                      (list
                                                       (cons
                                                        'state401
                                                        (signal-value
                                                         btor416)))
                                                      (append
                                                       (list
                                                        (cons
                                                         'state399
                                                         (signal-value
                                                          btor1110)))
                                                       (append
                                                        (list
                                                         (cons
                                                          'state397
                                                          (signal-value
                                                           btor436)))
                                                        (append
                                                         (list
                                                          (cons
                                                           'state394
                                                           (signal-value
                                                            btor393)))
                                                         (append
                                                          (list
                                                           (cons
                                                            'state361
                                                            (signal-value
                                                             btor376)))
                                                          (append
                                                           (list
                                                            (cons
                                                             'state359
                                                             (signal-value
                                                              btor1105)))
                                                           (append
                                                            (list
                                                             (cons
                                                              'state357
                                                              (signal-value
                                                               btor396)))
                                                            (append
                                                             (list
                                                              (cons
                                                               'state278
                                                               (signal-value
                                                                btor122)))
                                                             (append
                                                              (list
                                                               (cons
                                                                'state276
                                                                (signal-value
                                                                 btor1101)))
                                                              (append
                                                               (list
                                                                (cons
                                                                 'state274
                                                                 (signal-value
                                                                  btor282)))
                                                               (append
                                                                (list
                                                                 (cons
                                                                  'state268
                                                                  (signal-value
                                                                   btor122)))
                                                                (append
                                                                 (list
                                                                  (cons
                                                                   'state266
                                                                   (signal-value
                                                                    btor1096)))
                                                                 (append
                                                                  (list
                                                                   (cons
                                                                    'state264
                                                                    (signal-value
                                                                     btor272)))
                                                                  (append
                                                                   (list
                                                                    (cons
                                                                     'state250
                                                                     (signal-value
                                                                      btor249)))
                                                                   (append
                                                                    (list
                                                                     (cons
                                                                      'state217
                                                                      (signal-value
                                                                       btor232)))
                                                                    (append
                                                                     (list
                                                                      (cons
                                                                       'state215
                                                                       (signal-value
                                                                        btor1090)))
                                                                     (append
                                                                      (list
                                                                       (cons
                                                                        'state213
                                                                        (signal-value
                                                                         btor252)))
                                                                      (append
                                                                       (list
                                                                        (cons
                                                                         'state200
                                                                         (signal-value
                                                                          btor199)))
                                                                       (append
                                                                        (list
                                                                         (cons
                                                                          'state165
                                                                          (signal-value
                                                                           btor180)))
                                                                        (append
                                                                         (list
                                                                          (cons
                                                                           'state163
                                                                           (signal-value
                                                                            btor1080)))
                                                                         (append
                                                                          (list
                                                                           (cons
                                                                            'state161
                                                                            (signal-value
                                                                             btor202)))
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
                                                                               btor1070)))
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
                                                                                  btor1063)))
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
                                                                                     btor996)))
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
                                                                                        btor991)))
                                                                                     (append
                                                                                      (list
                                                                                       (cons
                                                                                        'state96
                                                                                        (signal-value
                                                                                         btor127)))
                                                                                      (list))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

