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
;;; https://github.com/uwsampl/lakeroad-private/blob/a5a5b32f1fbb54b4cedbf2328098793dd4a1ffa6/altera_mf/altera_mf_modified.v#L517
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
      #:unnamed-input-400
      (unnamed-input-400
       (bv->signal (constant 'unnamed-input-400 (bitvector 1))))
      #:unnamed-input-402
      (unnamed-input-402
       (bv->signal (constant 'unnamed-input-402 (bitvector 1))))
      #:unnamed-input-484
      (unnamed-input-484
       (bv->signal (constant 'unnamed-input-484 (bitvector 36))))
      #:unnamed-input-953
      (unnamed-input-953
       (bv->signal (constant 'unnamed-input-953 (bitvector 35))))
      #:unnamed-input-954
      (unnamed-input-954
       (bv->signal (constant 'unnamed-input-954 (bitvector 35))))
      #:unnamed-input-956
      (unnamed-input-956
       (bv->signal (constant 'unnamed-input-956 (bitvector 35))))
      #:unnamed-input-957
      (unnamed-input-957
       (bv->signal (constant 'unnamed-input-957 (bitvector 35))))
      #:unnamed-input-963
      (unnamed-input-963
       (bv->signal (constant 'unnamed-input-963 (bitvector 35))))
      #:unnamed-input-983
      (unnamed-input-983
       (bv->signal (constant 'unnamed-input-983 (bitvector 35))))
      #:unnamed-input-1023
      (unnamed-input-1023
       (bv->signal (constant 'unnamed-input-1023 (bitvector 1))))
      #:unnamed-input-1024
      (unnamed-input-1024
       (bv->signal (constant 'unnamed-input-1024 (bitvector 1))))
      #:unnamed-input-1034
      (unnamed-input-1034
       (bv->signal (constant 'unnamed-input-1034 (bitvector 1))))
      #:unnamed-input-1038
      (unnamed-input-1038
       (bv->signal (constant 'unnamed-input-1038 (bitvector 1))))
      #:unnamed-input-1046
      (unnamed-input-1046
       (bv->signal (constant 'unnamed-input-1046 (bitvector 1))))
      #:unnamed-input-1053
      (unnamed-input-1053
       (bv->signal (constant 'unnamed-input-1053 (bitvector 1))))
      #:unnamed-input-1054
      (unnamed-input-1054
       (bv->signal (constant 'unnamed-input-1054 (bitvector 1))))
      #:unnamed-input-1057
      (unnamed-input-1057
       (bv->signal (constant 'unnamed-input-1057 (bitvector 1)))))
    (let* ((merged-input-state-hash (list))
           (init-hash
            (append
             (list (cons 'state857 (bv 0 (bitvector 1))))
             (append
              (list (cons 'state840 (bv 0 (bitvector 1))))
              (append
               (list (cons 'state726 (bv 0 (bitvector 1))))
               (append
                (list (cons 'state721 (bv 0 (bitvector 1))))
                (append
                 (list (cons 'state629 (bv 0 (bitvector 1))))
                 (append
                  (list (cons 'state581 (bv 0 (bitvector 1))))
                  (append
                   (list (cons 'state579 (bv 0 (bitvector 35))))
                   (append
                    (list (cons 'state577 (bv 0 (bitvector 1))))
                    (append
                     (list (cons 'state513 (bv 0 (bitvector 36))))
                     (append
                      (list (cons 'state490 (bv 0 (bitvector 1))))
                      (append
                       (list (cons 'state448 (bv 0 (bitvector 1))))
                       (append
                        (list (cons 'state411 (bv 0 (bitvector 1))))
                        (append
                         (list (cons 'state352 (bv 0 (bitvector 1))))
                         (append
                          (list (cons 'state272 (bv 0 (bitvector 1))))
                          (append
                           (list (cons 'state255 (bv 0 (bitvector 1))))
                           (append
                            (list (cons 'state176 (bv 0 (bitvector 1))))
                            (append
                             (list (cons 'state174 (bv 0 (bitvector 35))))
                             (append
                              (list (cons 'state144 (bv 0 (bitvector 18))))
                              (append
                               (list (cons 'state109 (bv 0 (bitvector 18))))
                               (append
                                (list (cons 'state106 (bv 0 (bitvector 18))))
                                (append
                                 (list (cons 'state102 (bv 0 (bitvector 1))))
                                 (append
                                  (list (cons 'state99 (bv 0 (bitvector 1))))
                                  (append
                                   (list (cons 'state96 (bv 0 (bitvector 1))))
                                   (list)))))))))))))))))))))))))
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
                     ((assoc-has-key?
                       merged-input-state-hash
                       'accum_is_saturated_latent)
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        'accum_is_saturated_latent)))
                     ((assoc-has-key? init-hash 'accum_is_saturated_latent)
                      (bv->signal
                       (assoc-ref init-hash 'accum_is_saturated_latent)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor99
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       'mult_is_saturated_int)
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        'mult_is_saturated_int)))
                     ((assoc-has-key? init-hash 'mult_is_saturated_int)
                      (bv->signal
                       (assoc-ref init-hash 'mult_is_saturated_int)))
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
           (btor105 (bv->signal (bv 0 (bitvector 18))))
           (btor106
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state106)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state106)))
                     ((assoc-has-key? init-hash 'state106)
                      (bv->signal (assoc-ref init-hash 'state106)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor109
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state109)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state109)))
                     ((assoc-has-key? init-hash 'state109)
                      (bv->signal (assoc-ref init-hash 'state109)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor111 (bitvector 2))
           (btor112 (bv->signal (bv 2 (bitvector 2))))
           (btor113
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor114
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor113)))
             (list)))
           (btor115
            (if (bitvector->bool (signal-value btor114)) btor26 btor95))
           (btor116 (bv->signal (bv 1 (bitvector 1))))
           (btor117
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor118
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor117)))
             (list)))
           (btor119
            (if (bitvector->bool (signal-value btor118)) btor25 btor115))
           (btor120
            (signal
             (apply bvor (bitvector->bits (signal-value btor53)))
             (signal-state btor53)))
           (btor121 (signal (bvnot (signal-value btor120)) (list)))
           (btor122
            (if (bitvector->bool (signal-value btor121)) btor24 btor119))
           (btor123 (bv->signal (bv 25 (bitvector 5))))
           (btor124
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor123)))
             (list)))
           (btor125
            (if (bitvector->bool (signal-value btor124)) btor95 btor122))
           (btor126 (bv->signal (bv 3 (bitvector 2))))
           (btor127
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor128
            (signal
             (bool->bitvector
              (bveq (signal-value btor53) (signal-value btor127)))
             (list)))
           (btor129
            (if (bitvector->bool (signal-value btor128)) btor27 btor125))
           (btor130
            (if (bitvector->bool (signal-value btor129)) btor105 btor109))
           (btor131 (bv->signal (bv 17 (bitvector 5))))
           (btor132
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor131)))
             (list)))
           (btor133
            (signal
             (bvor (signal-value btor132) (signal-value btor93))
             (list)))
           (btor134
            (if (bitvector->bool (signal-value btor133)) btor81 btor43))
           (btor135 (bitvector 4))
           (btor136 (bv->signal (bv 10 (bitvector 4))))
           (btor137
            (bv->signal
             (zero-extend (signal-value btor136) (bitvector 5))
             btor136))
           (btor138
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor137)))
             (list)))
           (btor139
            (if (bitvector->bool (signal-value btor138)) btor43 btor134))
           (btor140 (bv->signal (bv 23 (bitvector 5))))
           (btor141
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor140)))
             (list)))
           (btor142
            (if (bitvector->bool (signal-value btor141)) btor139 btor130))
           (btor144
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state144)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state144)))
                     ((assoc-has-key? init-hash 'state144)
                      (bv->signal (assoc-ref init-hash 'state144)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 18))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor146
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor147
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor146)))
             (list)))
           (btor148
            (if (bitvector->bool (signal-value btor147)) btor26 btor95))
           (btor149
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor150
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor149)))
             (list)))
           (btor151
            (if (bitvector->bool (signal-value btor150)) btor25 btor148))
           (btor152
            (signal
             (apply bvor (bitvector->bits (signal-value btor54)))
             (signal-state btor54)))
           (btor153 (signal (bvnot (signal-value btor152)) (list)))
           (btor154
            (if (bitvector->bool (signal-value btor153)) btor24 btor151))
           (btor155
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor123)))
             (list)))
           (btor156
            (if (bitvector->bool (signal-value btor155)) btor95 btor154))
           (btor157
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor158
            (signal
             (bool->bitvector
              (bveq (signal-value btor54) (signal-value btor157)))
             (list)))
           (btor159
            (if (bitvector->bool (signal-value btor158)) btor27 btor156))
           (btor160
            (if (bitvector->bool (signal-value btor159)) btor105 btor144))
           (btor161 (bv->signal (bv 18 (bitvector 5))))
           (btor162
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor161)))
             (list)))
           (btor163
            (signal
             (bvor (signal-value btor162) (signal-value btor94))
             (list)))
           (btor164
            (if (bitvector->bool (signal-value btor163)) btor82 btor44))
           (btor165 (bv->signal (bv 11 (bitvector 4))))
           (btor166
            (bv->signal
             (zero-extend (signal-value btor165) (bitvector 5))
             btor165))
           (btor167
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor166)))
             (list)))
           (btor168
            (if (bitvector->bool (signal-value btor167)) btor44 btor164))
           (btor169
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor140)))
             (list)))
           (btor170
            (if (bitvector->bool (signal-value btor169)) btor168 btor160))
           (btor172 (bitvector 35))
           (btor173 (bv->signal (bv 0 (bitvector 35))))
           (btor174
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'accum_result)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'accum_result)))
                     ((assoc-has-key? init-hash 'accum_result)
                      (bv->signal (assoc-ref init-hash 'accum_result)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 35))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor176
            (let* ((state-value
                    (cond
                     ((assoc-has-key?
                       merged-input-state-hash
                       'accum_saturate_overflow)
                      (bv->signal
                       (assoc-ref
                        merged-input-state-hash
                        'accum_saturate_overflow)))
                     ((assoc-has-key? init-hash 'accum_saturate_overflow)
                      (bv->signal
                       (assoc-ref init-hash 'accum_saturate_overflow)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor178
            (bv->signal
             (zero-extend (signal-value btor19) (bitvector 1))
             btor19))
           (btor179 (bv->signal (bv 9 (bitvector 4))))
           (btor180
            (bv->signal
             (zero-extend (signal-value btor179) (bitvector 5))
             btor179))
           (btor181
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor180)))
             (list)))
           (btor182
            (if (bitvector->bool (signal-value btor181)) btor36 btor95))
           (btor183 (bv->signal (bv 8 (bitvector 4))))
           (btor184
            (bv->signal
             (zero-extend (signal-value btor183) (bitvector 5))
             btor183))
           (btor185
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor184)))
             (list)))
           (btor186
            (if (bitvector->bool (signal-value btor185)) btor35 btor182))
           (btor187 (bv->signal (bv 7 (bitvector 3))))
           (btor188
            (bv->signal
             (zero-extend (signal-value btor187) (bitvector 5))
             btor187))
           (btor189
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor188)))
             (list)))
           (btor190
            (if (bitvector->bool (signal-value btor189)) btor34 btor186))
           (btor191
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor140)))
             (list)))
           (btor192
            (if (bitvector->bool (signal-value btor191)) btor95 btor190))
           (btor193 (bv->signal (bv 6 (bitvector 3))))
           (btor194
            (bv->signal
             (zero-extend (signal-value btor193) (bitvector 5))
             btor193))
           (btor195
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor194)))
             (list)))
           (btor196
            (if (bitvector->bool (signal-value btor195)) btor33 btor192))
           (btor197
            (bv->signal
             (zero-extend (signal-value btor196) (bitvector 1))
             btor196))
           (btor198
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor199
            (signal
             (bool->bitvector
              (bveq (signal-value btor21) (signal-value btor198)))
             (list)))
           (btor200
            (if (bitvector->bool (signal-value btor199)) btor26 btor95))
           (btor201
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor202
            (signal
             (bool->bitvector
              (bveq (signal-value btor21) (signal-value btor201)))
             (list)))
           (btor203
            (if (bitvector->bool (signal-value btor202)) btor25 btor200))
           (btor204
            (signal
             (apply bvor (bitvector->bits (signal-value btor21)))
             (signal-state btor21)))
           (btor205 (signal (bvnot (signal-value btor204)) (list)))
           (btor206
            (if (bitvector->bool (signal-value btor205)) btor24 btor203))
           (btor207
            (signal
             (bool->bitvector
              (bveq (signal-value btor21) (signal-value btor123)))
             (list)))
           (btor208
            (if (bitvector->bool (signal-value btor207)) btor95 btor206))
           (btor209
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor210
            (signal
             (bool->bitvector
              (bveq (signal-value btor21) (signal-value btor209)))
             (list)))
           (btor211
            (if (bitvector->bool (signal-value btor210)) btor27 btor208))
           (btor212
            (bv->signal
             (zero-extend (signal-value btor211) (bitvector 1))
             btor211))
           (btor213
            (if (bitvector->bool (signal-value btor181)) btor52 btor116))
           (btor214
            (if (bitvector->bool (signal-value btor185)) btor51 btor213))
           (btor215
            (if (bitvector->bool (signal-value btor189)) btor50 btor214))
           (btor216
            (if (bitvector->bool (signal-value btor191)) btor116 btor215))
           (btor217
            (if (bitvector->bool (signal-value btor195)) btor49 btor216))
           (btor218
            (bv->signal
             (zero-extend (signal-value btor217) (bitvector 1))
             btor217))
           (btor219
            (bv->signal
             (zero-extend (signal-value btor179) (bitvector 5))
             btor179))
           (btor220
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor219)))
             (list)))
           (btor221
            (if (bitvector->bool (signal-value btor220)) btor36 btor95))
           (btor222
            (bv->signal
             (zero-extend (signal-value btor183) (bitvector 5))
             btor183))
           (btor223
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor222)))
             (list)))
           (btor224
            (if (bitvector->bool (signal-value btor223)) btor35 btor221))
           (btor225
            (bv->signal
             (zero-extend (signal-value btor187) (bitvector 5))
             btor187))
           (btor226
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor225)))
             (list)))
           (btor227
            (if (bitvector->bool (signal-value btor226)) btor34 btor224))
           (btor228
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor140)))
             (list)))
           (btor229
            (if (bitvector->bool (signal-value btor228)) btor95 btor227))
           (btor230
            (bv->signal
             (zero-extend (signal-value btor193) (bitvector 5))
             btor193))
           (btor231
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor230)))
             (list)))
           (btor232
            (if (bitvector->bool (signal-value btor231)) btor33 btor229))
           (btor233
            (bv->signal
             (zero-extend (signal-value btor232) (bitvector 1))
             btor232))
           (btor234
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor235
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor234)))
             (list)))
           (btor236
            (if (bitvector->bool (signal-value btor235)) btor26 btor95))
           (btor237
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor238
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor237)))
             (list)))
           (btor239
            (if (bitvector->bool (signal-value btor238)) btor25 btor236))
           (btor240
            (signal
             (apply bvor (bitvector->bits (signal-value btor20)))
             (signal-state btor20)))
           (btor241 (signal (bvnot (signal-value btor240)) (list)))
           (btor242
            (if (bitvector->bool (signal-value btor241)) btor24 btor239))
           (btor243
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor123)))
             (list)))
           (btor244
            (if (bitvector->bool (signal-value btor243)) btor95 btor242))
           (btor245
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor246
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor245)))
             (list)))
           (btor247
            (if (bitvector->bool (signal-value btor246)) btor27 btor244))
           (btor248
            (bv->signal
             (zero-extend (signal-value btor247) (bitvector 1))
             btor247))
           (btor249
            (if (bitvector->bool (signal-value btor220)) btor52 btor116))
           (btor250
            (if (bitvector->bool (signal-value btor223)) btor51 btor249))
           (btor251
            (if (bitvector->bool (signal-value btor226)) btor50 btor250))
           (btor252
            (if (bitvector->bool (signal-value btor228)) btor116 btor251))
           (btor253
            (if (bitvector->bool (signal-value btor231)) btor49 btor252))
           (btor254
            (bv->signal
             (zero-extend (signal-value btor253) (bitvector 1))
             btor253))
           (btor255
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state255)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state255)))
                     ((assoc-has-key? init-hash 'state255)
                      (bv->signal (assoc-ref init-hash 'state255)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor257
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor258
            (signal
             (bool->bitvector
              (bveq (signal-value btor30) (signal-value btor257)))
             (list)))
           (btor259
            (if (bitvector->bool (signal-value btor258)) btor26 btor95))
           (btor260
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor261
            (signal
             (bool->bitvector
              (bveq (signal-value btor30) (signal-value btor260)))
             (list)))
           (btor262
            (if (bitvector->bool (signal-value btor261)) btor25 btor259))
           (btor263
            (signal
             (apply bvor (bitvector->bits (signal-value btor30)))
             (signal-state btor30)))
           (btor264 (signal (bvnot (signal-value btor263)) (list)))
           (btor265
            (if (bitvector->bool (signal-value btor264)) btor24 btor262))
           (btor266
            (signal
             (bool->bitvector
              (bveq (signal-value btor30) (signal-value btor123)))
             (list)))
           (btor267
            (if (bitvector->bool (signal-value btor266)) btor95 btor265))
           (btor268
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor269
            (signal
             (bool->bitvector
              (bveq (signal-value btor30) (signal-value btor268)))
             (list)))
           (btor270
            (if (bitvector->bool (signal-value btor269)) btor27 btor267))
           (btor271
            (if (bitvector->bool (signal-value btor270)) btor95 btor255))
           (btor272
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state272)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state272)))
                     ((assoc-has-key? init-hash 'state272)
                      (bv->signal (assoc-ref init-hash 'state272)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor274
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor275
            (signal
             (bool->bitvector
              (bveq (signal-value btor29) (signal-value btor274)))
             (list)))
           (btor276
            (if (bitvector->bool (signal-value btor275)) btor26 btor95))
           (btor277
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor278
            (signal
             (bool->bitvector
              (bveq (signal-value btor29) (signal-value btor277)))
             (list)))
           (btor279
            (if (bitvector->bool (signal-value btor278)) btor25 btor276))
           (btor280
            (signal
             (apply bvor (bitvector->bits (signal-value btor29)))
             (signal-state btor29)))
           (btor281 (signal (bvnot (signal-value btor280)) (list)))
           (btor282
            (if (bitvector->bool (signal-value btor281)) btor24 btor279))
           (btor283
            (signal
             (bool->bitvector
              (bveq (signal-value btor29) (signal-value btor123)))
             (list)))
           (btor284
            (if (bitvector->bool (signal-value btor283)) btor95 btor282))
           (btor285
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor286
            (signal
             (bool->bitvector
              (bveq (signal-value btor29) (signal-value btor285)))
             (list)))
           (btor287
            (if (bitvector->bool (signal-value btor286)) btor27 btor284))
           (btor288
            (if (bitvector->bool (signal-value btor287)) btor95 btor272))
           (btor289
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor140)))
             (list)))
           (btor290
            (if (bitvector->bool (signal-value btor289)) btor28 btor288))
           (btor291
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor140)))
             (list)))
           (btor292
            (if (bitvector->bool (signal-value btor291)) btor290 btor271))
           (btor293 (bv->signal (bv 4 (bitvector 3))))
           (btor294
            (bv->signal
             (zero-extend (signal-value btor293) (bitvector 5))
             btor293))
           (btor295
            (signal
             (bool->bitvector
              (bveq (signal-value btor2) (signal-value btor294)))
             (list)))
           (btor296
            (if (bitvector->bool (signal-value btor295)) btor116 btor95))
           (btor297 (bv->signal (bv 15 (bitvector 4))))
           (btor298
            (bv->signal
             (zero-extend (signal-value btor297) (bitvector 5))
             btor297))
           (btor299
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor298)))
             (list)))
           (btor300
            (if (bitvector->bool (signal-value btor299)) btor296 btor292))
           (btor301 (bv->signal (bv 16 (bitvector 5))))
           (btor302
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor301)))
             (list)))
           (btor303
            (if (bitvector->bool (signal-value btor302)) btor292 btor300))
           (btor304
            (bv->signal
             (zero-extend (signal-value btor303) (bitvector 1))
             btor303))
           (btor305
            (bv->signal
             (zero-extend (signal-value btor290) (bitvector 1))
             btor290))
           (btor306
            (bv->signal
             (zero-extend (signal-value btor271) (bitvector 1))
             btor271))
           (btor307
            (bv->signal
             (zero-extend (signal-value btor292) (bitvector 1))
             btor292))
           (btor308
            (bv->signal
             (zero-extend (signal-value btor179) (bitvector 5))
             btor179))
           (btor309
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor308)))
             (list)))
           (btor310
            (if (bitvector->bool (signal-value btor309)) btor36 btor95))
           (btor311
            (bv->signal
             (zero-extend (signal-value btor183) (bitvector 5))
             btor183))
           (btor312
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor311)))
             (list)))
           (btor313
            (if (bitvector->bool (signal-value btor312)) btor35 btor310))
           (btor314
            (bv->signal
             (zero-extend (signal-value btor187) (bitvector 5))
             btor187))
           (btor315
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor314)))
             (list)))
           (btor316
            (if (bitvector->bool (signal-value btor315)) btor34 btor313))
           (btor317
            (if (bitvector->bool (signal-value btor291)) btor95 btor316))
           (btor318
            (bv->signal
             (zero-extend (signal-value btor193) (bitvector 5))
             btor193))
           (btor319
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor318)))
             (list)))
           (btor320
            (if (bitvector->bool (signal-value btor319)) btor33 btor317))
           (btor321
            (bv->signal
             (zero-extend (signal-value btor320) (bitvector 1))
             btor320))
           (btor322
            (bv->signal
             (zero-extend (signal-value btor270) (bitvector 1))
             btor270))
           (btor323
            (if (bitvector->bool (signal-value btor309)) btor52 btor116))
           (btor324
            (if (bitvector->bool (signal-value btor312)) btor51 btor323))
           (btor325
            (if (bitvector->bool (signal-value btor315)) btor50 btor324))
           (btor326
            (if (bitvector->bool (signal-value btor291)) btor116 btor325))
           (btor327
            (if (bitvector->bool (signal-value btor319)) btor49 btor326))
           (btor328
            (bv->signal
             (zero-extend (signal-value btor327) (bitvector 1))
             btor327))
           (btor329
            (bv->signal
             (zero-extend (signal-value btor288) (bitvector 1))
             btor288))
           (btor330
            (bv->signal
             (zero-extend (signal-value btor290) (bitvector 1))
             btor290))
           (btor331
            (bv->signal
             (zero-extend (signal-value btor179) (bitvector 5))
             btor179))
           (btor332
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor331)))
             (list)))
           (btor333
            (if (bitvector->bool (signal-value btor332)) btor36 btor95))
           (btor334
            (bv->signal
             (zero-extend (signal-value btor183) (bitvector 5))
             btor183))
           (btor335
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor334)))
             (list)))
           (btor336
            (if (bitvector->bool (signal-value btor335)) btor35 btor333))
           (btor337
            (bv->signal
             (zero-extend (signal-value btor187) (bitvector 5))
             btor187))
           (btor338
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor337)))
             (list)))
           (btor339
            (if (bitvector->bool (signal-value btor338)) btor34 btor336))
           (btor340
            (if (bitvector->bool (signal-value btor289)) btor95 btor339))
           (btor341
            (bv->signal
             (zero-extend (signal-value btor193) (bitvector 5))
             btor193))
           (btor342
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor341)))
             (list)))
           (btor343
            (if (bitvector->bool (signal-value btor342)) btor33 btor340))
           (btor344
            (bv->signal
             (zero-extend (signal-value btor343) (bitvector 1))
             btor343))
           (btor345
            (bv->signal
             (zero-extend (signal-value btor287) (bitvector 1))
             btor287))
           (btor346
            (if (bitvector->bool (signal-value btor332)) btor52 btor116))
           (btor347
            (if (bitvector->bool (signal-value btor335)) btor51 btor346))
           (btor348
            (if (bitvector->bool (signal-value btor338)) btor50 btor347))
           (btor349
            (if (bitvector->bool (signal-value btor289)) btor116 btor348))
           (btor350
            (if (bitvector->bool (signal-value btor342)) btor49 btor349))
           (btor351
            (bv->signal
             (zero-extend (signal-value btor350) (bitvector 1))
             btor350))
           (btor352
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'flag)
                      (bv->signal (assoc-ref merged-input-state-hash 'flag)))
                     ((assoc-has-key? init-hash 'flag)
                      (bv->signal (assoc-ref init-hash 'flag)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor354 (bitvector 32))
           (btor355 (bv->signal (bv 0 (bitvector 32))))
           (btor356
            (bv->signal
             (zero-extend (signal-value btor355) (bitvector 32))
             btor355))
           (btor357
            (bv->signal
             (zero-extend (signal-value btor355) (bitvector 32))
             btor355))
           (btor358
            (bv->signal
             (zero-extend (signal-value btor179) (bitvector 5))
             btor179))
           (btor359
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor358)))
             (list)))
           (btor360
            (if (bitvector->bool (signal-value btor359)) btor36 btor95))
           (btor361
            (bv->signal
             (zero-extend (signal-value btor183) (bitvector 5))
             btor183))
           (btor362
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor361)))
             (list)))
           (btor363
            (if (bitvector->bool (signal-value btor362)) btor35 btor360))
           (btor364
            (bv->signal
             (zero-extend (signal-value btor187) (bitvector 5))
             btor187))
           (btor365
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor364)))
             (list)))
           (btor366
            (if (bitvector->bool (signal-value btor365)) btor34 btor363))
           (btor367
            (if (bitvector->bool (signal-value btor141)) btor95 btor366))
           (btor368
            (bv->signal
             (zero-extend (signal-value btor193) (bitvector 5))
             btor193))
           (btor369
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor368)))
             (list)))
           (btor370
            (if (bitvector->bool (signal-value btor369)) btor33 btor367))
           (btor371
            (bv->signal
             (zero-extend (signal-value btor370) (bitvector 1))
             btor370))
           (btor372
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 1))
             btor129))
           (btor373
            (if (bitvector->bool (signal-value btor359)) btor52 btor116))
           (btor374
            (if (bitvector->bool (signal-value btor362)) btor51 btor373))
           (btor375
            (if (bitvector->bool (signal-value btor365)) btor50 btor374))
           (btor376
            (if (bitvector->bool (signal-value btor141)) btor116 btor375))
           (btor377
            (if (bitvector->bool (signal-value btor369)) btor49 btor376))
           (btor378
            (bv->signal
             (zero-extend (signal-value btor377) (bitvector 1))
             btor377))
           (btor379
            (bv->signal
             (zero-extend (signal-value btor179) (bitvector 5))
             btor179))
           (btor380
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor379)))
             (list)))
           (btor381
            (if (bitvector->bool (signal-value btor380)) btor36 btor95))
           (btor382
            (bv->signal
             (zero-extend (signal-value btor183) (bitvector 5))
             btor183))
           (btor383
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor382)))
             (list)))
           (btor384
            (if (bitvector->bool (signal-value btor383)) btor35 btor381))
           (btor385
            (bv->signal
             (zero-extend (signal-value btor187) (bitvector 5))
             btor187))
           (btor386
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor385)))
             (list)))
           (btor387
            (if (bitvector->bool (signal-value btor386)) btor34 btor384))
           (btor388
            (if (bitvector->bool (signal-value btor169)) btor95 btor387))
           (btor389
            (bv->signal
             (zero-extend (signal-value btor193) (bitvector 5))
             btor193))
           (btor390
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor389)))
             (list)))
           (btor391
            (if (bitvector->bool (signal-value btor390)) btor33 btor388))
           (btor392
            (bv->signal
             (zero-extend (signal-value btor391) (bitvector 1))
             btor391))
           (btor393
            (bv->signal
             (zero-extend (signal-value btor159) (bitvector 1))
             btor159))
           (btor394
            (if (bitvector->bool (signal-value btor380)) btor52 btor116))
           (btor395
            (if (bitvector->bool (signal-value btor383)) btor51 btor394))
           (btor396
            (if (bitvector->bool (signal-value btor386)) btor50 btor395))
           (btor397
            (if (bitvector->bool (signal-value btor169)) btor116 btor396))
           (btor398
            (if (bitvector->bool (signal-value btor390)) btor49 btor397))
           (btor399
            (bv->signal
             (zero-extend (signal-value btor398) (bitvector 1))
             btor398))
           (btor400 unnamed-input-400)
           (btor401
            (bv->signal
             (zero-extend (signal-value btor400) (bitvector 1))
             btor400))
           (btor402 unnamed-input-402)
           (btor403
            (bv->signal
             (zero-extend (signal-value btor402) (bitvector 1))
             btor402))
           (btor404 (bitvector 21))
           (btor405 (bv->signal (bv 0 (bitvector 21))))
           (btor406
            (bv->signal
             (zero-extend (signal-value btor405) (bitvector 21))
             btor405))
           (btor407 (signal (bvnot (signal-value btor142)) (list)))
           (btor408
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 18))
             btor116))
           (btor409
            (signal
             (bvadd (signal-value btor407) (signal-value btor408))
             (list)))
           (btor410
            (signal
             (extract 17 17 (signal-value btor142))
             (signal-state btor142)))
           (btor411
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state411)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state411)))
                     ((assoc-has-key? init-hash 'state411)
                      (bv->signal (assoc-ref init-hash 'state411)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor413
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor414
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor413)))
             (list)))
           (btor415
            (if (bitvector->bool (signal-value btor414)) btor26 btor95))
           (btor416
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor417
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor416)))
             (list)))
           (btor418
            (if (bitvector->bool (signal-value btor417)) btor25 btor415))
           (btor419
            (signal
             (apply bvor (bitvector->bits (signal-value btor83)))
             (signal-state btor83)))
           (btor420 (signal (bvnot (signal-value btor419)) (list)))
           (btor421
            (if (bitvector->bool (signal-value btor420)) btor24 btor418))
           (btor422
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor123)))
             (list)))
           (btor423
            (if (bitvector->bool (signal-value btor422)) btor95 btor421))
           (btor424
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor425
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor424)))
             (list)))
           (btor426
            (if (bitvector->bool (signal-value btor425)) btor27 btor423))
           (btor427
            (if (bitvector->bool (signal-value btor426)) btor95 btor411))
           (btor428
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor140)))
             (list)))
           (btor429
            (if (bitvector->bool (signal-value btor428)) btor91 btor427))
           (btor430 (bv->signal (bv 19 (bitvector 5))))
           (btor431
            (signal
             (bool->bitvector
              (bveq (signal-value btor79) (signal-value btor430)))
             (list)))
           (btor432
            (if (bitvector->bool (signal-value btor431)) btor116 btor95))
           (btor433
            (bv->signal
             (zero-extend (signal-value btor297) (bitvector 5))
             btor297))
           (btor434
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor433)))
             (list)))
           (btor435
            (if (bitvector->bool (signal-value btor434)) btor432 btor429))
           (btor436
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor301)))
             (list)))
           (btor437
            (if (bitvector->bool (signal-value btor436)) btor429 btor435))
           (btor438
            (signal
             (bvand (signal-value btor410) (signal-value btor437))
             (list)))
           (btor439
            (if (bitvector->bool (signal-value btor438)) btor409 btor142))
           (btor440
            (bv->signal
             (zero-extend (signal-value btor439) (bitvector 18))
             btor439))
           (btor441
            (bv->signal
             (zero-extend (signal-value btor130) (bitvector 18))
             btor130))
           (btor442
            (bv->signal
             (zero-extend (signal-value btor139) (bitvector 18))
             btor139))
           (btor443
            (bv->signal
             (zero-extend (signal-value btor142) (bitvector 18))
             btor142))
           (btor444 (signal (bvnot (signal-value btor170)) (list)))
           (btor445
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 18))
             btor116))
           (btor446
            (signal
             (bvadd (signal-value btor444) (signal-value btor445))
             (list)))
           (btor447
            (signal
             (extract 17 17 (signal-value btor170))
             (signal-state btor170)))
           (btor448
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state448)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state448)))
                     ((assoc-has-key? init-hash 'state448)
                      (bv->signal (assoc-ref init-hash 'state448)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor450
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor451
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor450)))
             (list)))
           (btor452
            (if (bitvector->bool (signal-value btor451)) btor26 btor95))
           (btor453
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor454
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor453)))
             (list)))
           (btor455
            (if (bitvector->bool (signal-value btor454)) btor25 btor452))
           (btor456
            (signal
             (apply bvor (bitvector->bits (signal-value btor84)))
             (signal-state btor84)))
           (btor457 (signal (bvnot (signal-value btor456)) (list)))
           (btor458
            (if (bitvector->bool (signal-value btor457)) btor24 btor455))
           (btor459
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor123)))
             (list)))
           (btor460
            (if (bitvector->bool (signal-value btor459)) btor95 btor458))
           (btor461
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor462
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor461)))
             (list)))
           (btor463
            (if (bitvector->bool (signal-value btor462)) btor27 btor460))
           (btor464
            (if (bitvector->bool (signal-value btor463)) btor95 btor448))
           (btor465
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor140)))
             (list)))
           (btor466
            (if (bitvector->bool (signal-value btor465)) btor92 btor464))
           (btor467
            (signal
             (bool->bitvector
              (bveq (signal-value btor80) (signal-value btor430)))
             (list)))
           (btor468
            (if (bitvector->bool (signal-value btor467)) btor116 btor95))
           (btor469
            (bv->signal
             (zero-extend (signal-value btor297) (bitvector 5))
             btor297))
           (btor470
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor469)))
             (list)))
           (btor471
            (if (bitvector->bool (signal-value btor470)) btor468 btor466))
           (btor472
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor301)))
             (list)))
           (btor473
            (if (bitvector->bool (signal-value btor472)) btor466 btor471))
           (btor474
            (signal
             (bvand (signal-value btor447) (signal-value btor473))
             (list)))
           (btor475
            (if (bitvector->bool (signal-value btor474)) btor446 btor170))
           (btor476
            (bv->signal
             (zero-extend (signal-value btor475) (bitvector 18))
             btor475))
           (btor477
            (bv->signal
             (zero-extend (signal-value btor160) (bitvector 18))
             btor160))
           (btor478
            (bv->signal
             (zero-extend (signal-value btor168) (bitvector 18))
             btor168))
           (btor479
            (bv->signal
             (zero-extend (signal-value btor170) (bitvector 18))
             btor170))
           (btor480 (bitvector 36))
           (btor481
            (bv->signal
             (zero-extend (signal-value btor439) (bitvector 36))
             btor439))
           (btor482
            (bv->signal
             (zero-extend (signal-value btor475) (bitvector 36))
             btor475))
           (btor483
            (signal
             (bvmul (signal-value btor481) (signal-value btor482))
             (list)))
           (btor484 unnamed-input-484)
           (btor485
            (signal
             (bvsub (signal-value btor484) (signal-value btor483))
             (list)))
           (btor486
            (signal
             (bvxor (signal-value btor438) (signal-value btor474))
             (list)))
           (btor487
            (if (bitvector->bool (signal-value btor486)) btor485 btor483))
           (btor488
            (bv->signal
             (zero-extend (signal-value btor487) (bitvector 36))
             btor487))
           (btor489
            (bv->signal
             (zero-extend (signal-value btor95) (bitvector 1))
             btor95))
           (btor490
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state490)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state490)))
                     ((assoc-has-key? init-hash 'state490)
                      (bv->signal (assoc-ref init-hash 'state490)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor492
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor493
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor492)))
             (list)))
           (btor494
            (if (bitvector->bool (signal-value btor493)) btor26 btor95))
           (btor495
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor496
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor495)))
             (list)))
           (btor497
            (if (bitvector->bool (signal-value btor496)) btor25 btor494))
           (btor498
            (signal
             (apply bvor (bitvector->bits (signal-value btor70)))
             (signal-state btor70)))
           (btor499 (signal (bvnot (signal-value btor498)) (list)))
           (btor500
            (if (bitvector->bool (signal-value btor499)) btor24 btor497))
           (btor501
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor123)))
             (list)))
           (btor502
            (if (bitvector->bool (signal-value btor501)) btor95 btor500))
           (btor503
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor504
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor503)))
             (list)))
           (btor505
            (if (bitvector->bool (signal-value btor504)) btor27 btor502))
           (btor506
            (if (bitvector->bool (signal-value btor505)) btor95 btor490))
           (btor507
            (bv->signal
             (zero-extend (signal-value btor506) (bitvector 1))
             btor506))
           (btor508
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor140)))
             (list)))
           (btor509
            (if (bitvector->bool (signal-value btor508)) btor95 btor506))
           (btor510
            (bv->signal
             (zero-extend (signal-value btor509) (bitvector 1))
             btor509))
           (btor511
            (bv->signal
             (zero-extend (signal-value btor487) (bitvector 36))
             btor487))
           (btor512 (bv->signal (bv 0 (bitvector 36))))
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
                          (bv 0 36))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor515
            (if (bitvector->bool (signal-value btor505)) btor512 btor513))
           (btor516
            (bv->signal
             (zero-extend (signal-value btor515) (bitvector 36))
             btor515))
           (btor517
            (bv->signal
             (zero-extend (signal-value btor95) (bitvector 1))
             btor95))
           (btor518
            (bv->signal
             (zero-extend (signal-value btor179) (bitvector 5))
             btor179))
           (btor519
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor518)))
             (list)))
           (btor520
            (if (bitvector->bool (signal-value btor519)) btor36 btor95))
           (btor521
            (bv->signal
             (zero-extend (signal-value btor183) (bitvector 5))
             btor183))
           (btor522
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor521)))
             (list)))
           (btor523
            (if (bitvector->bool (signal-value btor522)) btor35 btor520))
           (btor524
            (bv->signal
             (zero-extend (signal-value btor187) (bitvector 5))
             btor187))
           (btor525
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor524)))
             (list)))
           (btor526
            (if (bitvector->bool (signal-value btor525)) btor34 btor523))
           (btor527
            (if (bitvector->bool (signal-value btor508)) btor95 btor526))
           (btor528
            (bv->signal
             (zero-extend (signal-value btor193) (bitvector 5))
             btor193))
           (btor529
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor528)))
             (list)))
           (btor530
            (if (bitvector->bool (signal-value btor529)) btor33 btor527))
           (btor531
            (bv->signal
             (zero-extend (signal-value btor530) (bitvector 1))
             btor530))
           (btor532
            (bv->signal
             (zero-extend (signal-value btor505) (bitvector 1))
             btor505))
           (btor533
            (if (bitvector->bool (signal-value btor519)) btor52 btor116))
           (btor534
            (if (bitvector->bool (signal-value btor522)) btor51 btor533))
           (btor535
            (if (bitvector->bool (signal-value btor525)) btor50 btor534))
           (btor536
            (if (bitvector->bool (signal-value btor508)) btor116 btor535))
           (btor537
            (if (bitvector->bool (signal-value btor529)) btor49 btor536))
           (btor538
            (bv->signal
             (zero-extend (signal-value btor537) (bitvector 1))
             btor537))
           (btor539
            (bv->signal
             (zero-extend (signal-value btor438) (bitvector 1))
             btor438))
           (btor540
            (bv->signal
             (zero-extend (signal-value btor474) (bitvector 1))
             btor474))
           (btor541
            (bv->signal
             (zero-extend (signal-value btor179) (bitvector 5))
             btor179))
           (btor542
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor541)))
             (list)))
           (btor543
            (if (bitvector->bool (signal-value btor542)) btor36 btor95))
           (btor544
            (bv->signal
             (zero-extend (signal-value btor183) (bitvector 5))
             btor183))
           (btor545
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor544)))
             (list)))
           (btor546
            (if (bitvector->bool (signal-value btor545)) btor35 btor543))
           (btor547
            (bv->signal
             (zero-extend (signal-value btor187) (bitvector 5))
             btor187))
           (btor548
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor547)))
             (list)))
           (btor549
            (if (bitvector->bool (signal-value btor548)) btor34 btor546))
           (btor550
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor140)))
             (list)))
           (btor551
            (if (bitvector->bool (signal-value btor550)) btor95 btor549))
           (btor552
            (bv->signal
             (zero-extend (signal-value btor193) (bitvector 5))
             btor193))
           (btor553
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor552)))
             (list)))
           (btor554
            (if (bitvector->bool (signal-value btor553)) btor33 btor551))
           (btor555
            (bv->signal
             (zero-extend (signal-value btor554) (bitvector 1))
             btor554))
           (btor556
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor557
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor556)))
             (list)))
           (btor558
            (if (bitvector->bool (signal-value btor557)) btor26 btor95))
           (btor559
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor560
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor559)))
             (list)))
           (btor561
            (if (bitvector->bool (signal-value btor560)) btor25 btor558))
           (btor562
            (signal
             (apply bvor (bitvector->bits (signal-value btor72)))
             (signal-state btor72)))
           (btor563 (signal (bvnot (signal-value btor562)) (list)))
           (btor564
            (if (bitvector->bool (signal-value btor563)) btor24 btor561))
           (btor565
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor123)))
             (list)))
           (btor566
            (if (bitvector->bool (signal-value btor565)) btor95 btor564))
           (btor567
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor568
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor567)))
             (list)))
           (btor569
            (if (bitvector->bool (signal-value btor568)) btor27 btor566))
           (btor570
            (bv->signal
             (zero-extend (signal-value btor569) (bitvector 1))
             btor569))
           (btor571
            (if (bitvector->bool (signal-value btor542)) btor52 btor116))
           (btor572
            (if (bitvector->bool (signal-value btor545)) btor51 btor571))
           (btor573
            (if (bitvector->bool (signal-value btor548)) btor50 btor572))
           (btor574
            (if (bitvector->bool (signal-value btor550)) btor116 btor573))
           (btor575
            (if (bitvector->bool (signal-value btor553)) btor49 btor574))
           (btor576
            (bv->signal
             (zero-extend (signal-value btor575) (bitvector 1))
             btor575))
           (btor577
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'overflow_int)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'overflow_int)))
                     ((assoc-has-key? init-hash 'overflow_int)
                      (bv->signal (assoc-ref init-hash 'overflow_int)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor579
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'result_int)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'result_int)))
                     ((assoc-has-key? init-hash 'result_int)
                      (bv->signal (assoc-ref init-hash 'result_int)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 35))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor581
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state581)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state581)))
                     ((assoc-has-key? init-hash 'state581)
                      (bv->signal (assoc-ref init-hash 'state581)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor583
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor584
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor583)))
             (list)))
           (btor585
            (if (bitvector->bool (signal-value btor584)) btor26 btor95))
           (btor586
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor587
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor586)))
             (list)))
           (btor588
            (if (bitvector->bool (signal-value btor587)) btor25 btor585))
           (btor589
            (signal
             (apply bvor (bitvector->bits (signal-value btor85)))
             (signal-state btor85)))
           (btor590 (signal (bvnot (signal-value btor589)) (list)))
           (btor591
            (if (bitvector->bool (signal-value btor590)) btor24 btor588))
           (btor592
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor123)))
             (list)))
           (btor593
            (if (bitvector->bool (signal-value btor592)) btor95 btor591))
           (btor594
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor595
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor594)))
             (list)))
           (btor596
            (if (bitvector->bool (signal-value btor595)) btor27 btor593))
           (btor597
            (if (bitvector->bool (signal-value btor596)) btor95 btor581))
           (btor598
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor140)))
             (list)))
           (btor599
            (if (bitvector->bool (signal-value btor598)) btor429 btor597))
           (btor600
            (if (bitvector->bool (signal-value btor434)) btor432 btor599))
           (btor601
            (if (bitvector->bool (signal-value btor436)) btor599 btor600))
           (btor602
            (bv->signal
             (zero-extend (signal-value btor601) (bitvector 1))
             btor601))
           (btor603
            (bv->signal
             (zero-extend (signal-value btor597) (bitvector 1))
             btor597))
           (btor604
            (bv->signal
             (zero-extend (signal-value btor599) (bitvector 1))
             btor599))
           (btor605
            (bv->signal
             (zero-extend (signal-value btor427) (bitvector 1))
             btor427))
           (btor606
            (bv->signal
             (zero-extend (signal-value btor437) (bitvector 1))
             btor437))
           (btor607
            (bv->signal
             (zero-extend (signal-value btor429) (bitvector 1))
             btor429))
           (btor608
            (bv->signal
             (zero-extend (signal-value btor179) (bitvector 5))
             btor179))
           (btor609
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor608)))
             (list)))
           (btor610
            (if (bitvector->bool (signal-value btor609)) btor36 btor95))
           (btor611
            (bv->signal
             (zero-extend (signal-value btor183) (bitvector 5))
             btor183))
           (btor612
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor611)))
             (list)))
           (btor613
            (if (bitvector->bool (signal-value btor612)) btor35 btor610))
           (btor614
            (bv->signal
             (zero-extend (signal-value btor187) (bitvector 5))
             btor187))
           (btor615
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor614)))
             (list)))
           (btor616
            (if (bitvector->bool (signal-value btor615)) btor34 btor613))
           (btor617
            (if (bitvector->bool (signal-value btor428)) btor95 btor616))
           (btor618
            (bv->signal
             (zero-extend (signal-value btor193) (bitvector 5))
             btor193))
           (btor619
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor618)))
             (list)))
           (btor620
            (if (bitvector->bool (signal-value btor619)) btor33 btor617))
           (btor621
            (bv->signal
             (zero-extend (signal-value btor620) (bitvector 1))
             btor620))
           (btor622
            (bv->signal
             (zero-extend (signal-value btor426) (bitvector 1))
             btor426))
           (btor623
            (if (bitvector->bool (signal-value btor609)) btor52 btor116))
           (btor624
            (if (bitvector->bool (signal-value btor612)) btor51 btor623))
           (btor625
            (if (bitvector->bool (signal-value btor615)) btor50 btor624))
           (btor626
            (if (bitvector->bool (signal-value btor428)) btor116 btor625))
           (btor627
            (if (bitvector->bool (signal-value btor619)) btor49 btor626))
           (btor628
            (bv->signal
             (zero-extend (signal-value btor627) (bitvector 1))
             btor627))
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
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor632
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor631)))
             (list)))
           (btor633
            (if (bitvector->bool (signal-value btor632)) btor26 btor95))
           (btor634
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor635
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor634)))
             (list)))
           (btor636
            (if (bitvector->bool (signal-value btor635)) btor25 btor633))
           (btor637
            (signal
             (apply bvor (bitvector->bits (signal-value btor86)))
             (signal-state btor86)))
           (btor638 (signal (bvnot (signal-value btor637)) (list)))
           (btor639
            (if (bitvector->bool (signal-value btor638)) btor24 btor636))
           (btor640
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor123)))
             (list)))
           (btor641
            (if (bitvector->bool (signal-value btor640)) btor95 btor639))
           (btor642
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor643
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor642)))
             (list)))
           (btor644
            (if (bitvector->bool (signal-value btor643)) btor27 btor641))
           (btor645
            (if (bitvector->bool (signal-value btor644)) btor95 btor629))
           (btor646
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor140)))
             (list)))
           (btor647
            (if (bitvector->bool (signal-value btor646)) btor466 btor645))
           (btor648
            (if (bitvector->bool (signal-value btor470)) btor468 btor647))
           (btor649
            (if (bitvector->bool (signal-value btor472)) btor647 btor648))
           (btor650
            (bv->signal
             (zero-extend (signal-value btor649) (bitvector 1))
             btor649))
           (btor651
            (bv->signal
             (zero-extend (signal-value btor645) (bitvector 1))
             btor645))
           (btor652
            (bv->signal
             (zero-extend (signal-value btor647) (bitvector 1))
             btor647))
           (btor653
            (bv->signal
             (zero-extend (signal-value btor464) (bitvector 1))
             btor464))
           (btor654
            (bv->signal
             (zero-extend (signal-value btor473) (bitvector 1))
             btor473))
           (btor655
            (bv->signal
             (zero-extend (signal-value btor466) (bitvector 1))
             btor466))
           (btor656
            (bv->signal
             (zero-extend (signal-value btor179) (bitvector 5))
             btor179))
           (btor657
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor656)))
             (list)))
           (btor658
            (if (bitvector->bool (signal-value btor657)) btor36 btor95))
           (btor659
            (bv->signal
             (zero-extend (signal-value btor183) (bitvector 5))
             btor183))
           (btor660
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor659)))
             (list)))
           (btor661
            (if (bitvector->bool (signal-value btor660)) btor35 btor658))
           (btor662
            (bv->signal
             (zero-extend (signal-value btor187) (bitvector 5))
             btor187))
           (btor663
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor662)))
             (list)))
           (btor664
            (if (bitvector->bool (signal-value btor663)) btor34 btor661))
           (btor665
            (if (bitvector->bool (signal-value btor465)) btor95 btor664))
           (btor666
            (bv->signal
             (zero-extend (signal-value btor193) (bitvector 5))
             btor193))
           (btor667
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor666)))
             (list)))
           (btor668
            (if (bitvector->bool (signal-value btor667)) btor33 btor665))
           (btor669
            (bv->signal
             (zero-extend (signal-value btor668) (bitvector 1))
             btor668))
           (btor670
            (bv->signal
             (zero-extend (signal-value btor463) (bitvector 1))
             btor463))
           (btor671
            (if (bitvector->bool (signal-value btor657)) btor52 btor116))
           (btor672
            (if (bitvector->bool (signal-value btor660)) btor51 btor671))
           (btor673
            (if (bitvector->bool (signal-value btor663)) btor50 btor672))
           (btor674
            (if (bitvector->bool (signal-value btor465)) btor116 btor673))
           (btor675
            (if (bitvector->bool (signal-value btor667)) btor49 btor674))
           (btor676
            (bv->signal
             (zero-extend (signal-value btor675) (bitvector 1))
             btor675))
           (btor677
            (bv->signal
             (zero-extend (signal-value btor179) (bitvector 5))
             btor179))
           (btor678
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor677)))
             (list)))
           (btor679
            (if (bitvector->bool (signal-value btor678)) btor36 btor95))
           (btor680
            (bv->signal
             (zero-extend (signal-value btor183) (bitvector 5))
             btor183))
           (btor681
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor680)))
             (list)))
           (btor682
            (if (bitvector->bool (signal-value btor681)) btor35 btor679))
           (btor683
            (bv->signal
             (zero-extend (signal-value btor187) (bitvector 5))
             btor187))
           (btor684
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor683)))
             (list)))
           (btor685
            (if (bitvector->bool (signal-value btor684)) btor34 btor682))
           (btor686
            (if (bitvector->bool (signal-value btor598)) btor95 btor685))
           (btor687
            (bv->signal
             (zero-extend (signal-value btor193) (bitvector 5))
             btor193))
           (btor688
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor687)))
             (list)))
           (btor689
            (if (bitvector->bool (signal-value btor688)) btor33 btor686))
           (btor690
            (bv->signal
             (zero-extend (signal-value btor689) (bitvector 1))
             btor689))
           (btor691
            (bv->signal
             (zero-extend (signal-value btor596) (bitvector 1))
             btor596))
           (btor692
            (if (bitvector->bool (signal-value btor678)) btor52 btor116))
           (btor693
            (if (bitvector->bool (signal-value btor681)) btor51 btor692))
           (btor694
            (if (bitvector->bool (signal-value btor684)) btor50 btor693))
           (btor695
            (if (bitvector->bool (signal-value btor598)) btor116 btor694))
           (btor696
            (if (bitvector->bool (signal-value btor688)) btor49 btor695))
           (btor697
            (bv->signal
             (zero-extend (signal-value btor696) (bitvector 1))
             btor696))
           (btor698
            (bv->signal
             (zero-extend (signal-value btor179) (bitvector 5))
             btor179))
           (btor699
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor698)))
             (list)))
           (btor700
            (if (bitvector->bool (signal-value btor699)) btor36 btor95))
           (btor701
            (bv->signal
             (zero-extend (signal-value btor183) (bitvector 5))
             btor183))
           (btor702
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor701)))
             (list)))
           (btor703
            (if (bitvector->bool (signal-value btor702)) btor35 btor700))
           (btor704
            (bv->signal
             (zero-extend (signal-value btor187) (bitvector 5))
             btor187))
           (btor705
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor704)))
             (list)))
           (btor706
            (if (bitvector->bool (signal-value btor705)) btor34 btor703))
           (btor707
            (if (bitvector->bool (signal-value btor646)) btor95 btor706))
           (btor708
            (bv->signal
             (zero-extend (signal-value btor193) (bitvector 5))
             btor193))
           (btor709
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor708)))
             (list)))
           (btor710
            (if (bitvector->bool (signal-value btor709)) btor33 btor707))
           (btor711
            (bv->signal
             (zero-extend (signal-value btor710) (bitvector 1))
             btor710))
           (btor712
            (bv->signal
             (zero-extend (signal-value btor644) (bitvector 1))
             btor644))
           (btor713
            (if (bitvector->bool (signal-value btor699)) btor52 btor116))
           (btor714
            (if (bitvector->bool (signal-value btor702)) btor51 btor713))
           (btor715
            (if (bitvector->bool (signal-value btor705)) btor50 btor714))
           (btor716
            (if (bitvector->bool (signal-value btor646)) btor116 btor715))
           (btor717
            (if (bitvector->bool (signal-value btor709)) btor49 btor716))
           (btor718
            (bv->signal
             (zero-extend (signal-value btor717) (bitvector 1))
             btor717))
           (btor719
            (bv->signal
             (zero-extend (signal-value btor429) (bitvector 1))
             btor429))
           (btor720
            (bv->signal
             (zero-extend (signal-value btor466) (bitvector 1))
             btor466))
           (btor721
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state721)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state721)))
                     ((assoc-has-key? init-hash 'state721)
                      (bv->signal (assoc-ref init-hash 'state721)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor723
            (if (bitvector->bool (signal-value btor247)) btor95 btor721))
           (btor724
            (if (bitvector->bool (signal-value btor228)) btor19 btor723))
           (btor725
            (bv->signal
             (zero-extend (signal-value btor724) (bitvector 1))
             btor724))
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
            (if (bitvector->bool (signal-value btor211)) btor95 btor726))
           (btor729
            (bv->signal
             (zero-extend (signal-value btor728) (bitvector 1))
             btor728))
           (btor730 (bitvector 17))
           (btor731 (bv->signal (bv 0 (bitvector 17))))
           (btor732
            (signal
             (concat (signal-value btor728) (signal-value btor728))
             (list)))
           (btor733
            (signal
             (concat (signal-value btor728) (signal-value btor732))
             (list)))
           (btor734
            (signal
             (concat (signal-value btor728) (signal-value btor733))
             (list)))
           (btor735
            (signal
             (concat (signal-value btor728) (signal-value btor734))
             (list)))
           (btor736 (bitvector 6))
           (btor737
            (signal
             (concat (signal-value btor728) (signal-value btor735))
             (list)))
           (btor738 (bitvector 7))
           (btor739
            (signal
             (concat (signal-value btor728) (signal-value btor737))
             (list)))
           (btor740 (bitvector 8))
           (btor741
            (signal
             (concat (signal-value btor728) (signal-value btor739))
             (list)))
           (btor742 (bitvector 9))
           (btor743
            (signal
             (concat (signal-value btor728) (signal-value btor741))
             (list)))
           (btor744 (bitvector 10))
           (btor745
            (signal
             (concat (signal-value btor728) (signal-value btor743))
             (list)))
           (btor746 (bitvector 11))
           (btor747
            (signal
             (concat (signal-value btor728) (signal-value btor745))
             (list)))
           (btor748 (bitvector 12))
           (btor749
            (signal
             (concat (signal-value btor728) (signal-value btor747))
             (list)))
           (btor750 (bitvector 13))
           (btor751
            (signal
             (concat (signal-value btor728) (signal-value btor749))
             (list)))
           (btor752 (bitvector 14))
           (btor753
            (signal
             (concat (signal-value btor728) (signal-value btor751))
             (list)))
           (btor754 (bitvector 15))
           (btor755
            (signal
             (concat (signal-value btor728) (signal-value btor753))
             (list)))
           (btor756 (bitvector 16))
           (btor757
            (signal
             (concat (signal-value btor728) (signal-value btor755))
             (list)))
           (btor758
            (signal
             (concat (signal-value btor728) (signal-value btor757))
             (list)))
           (btor759
            (signal
             (concat (signal-value btor728) (signal-value btor758))
             (list)))
           (btor760 (bitvector 19))
           (btor761
            (signal
             (concat (signal-value btor728) (signal-value btor759))
             (list)))
           (btor762 (bitvector 20))
           (btor763
            (signal
             (concat (signal-value btor728) (signal-value btor761))
             (list)))
           (btor764
            (signal
             (concat (signal-value btor728) (signal-value btor763))
             (list)))
           (btor765
            (signal
             (concat (signal-value btor728) (signal-value btor764))
             (list)))
           (btor766 (bitvector 23))
           (btor767
            (signal
             (concat (signal-value btor728) (signal-value btor765))
             (list)))
           (btor768 (bitvector 24))
           (btor769
            (signal
             (concat (signal-value btor728) (signal-value btor767))
             (list)))
           (btor770 (bitvector 25))
           (btor771
            (signal
             (concat (signal-value btor728) (signal-value btor769))
             (list)))
           (btor772 (bitvector 26))
           (btor773
            (signal
             (concat (signal-value btor728) (signal-value btor771))
             (list)))
           (btor774 (bitvector 27))
           (btor775
            (signal
             (concat (signal-value btor728) (signal-value btor773))
             (list)))
           (btor776 (bitvector 28))
           (btor777
            (signal
             (concat (signal-value btor728) (signal-value btor775))
             (list)))
           (btor778 (bitvector 29))
           (btor779
            (signal
             (concat (signal-value btor728) (signal-value btor777))
             (list)))
           (btor780 (bitvector 30))
           (btor781
            (signal
             (concat (signal-value btor728) (signal-value btor779))
             (list)))
           (btor782 (bitvector 31))
           (btor783
            (signal
             (concat (signal-value btor728) (signal-value btor781))
             (list)))
           (btor784
            (signal
             (concat (signal-value btor728) (signal-value btor783))
             (list)))
           (btor785 (bitvector 33))
           (btor786
            (signal
             (concat (signal-value btor728) (signal-value btor784))
             (list)))
           (btor787 (bitvector 34))
           (btor788
            (signal
             (concat (signal-value btor728) (signal-value btor786))
             (list)))
           (btor789
            (signal
             (concat (signal-value btor728) (signal-value btor788))
             (list)))
           (btor790
            (signal
             (bvor (signal-value btor601) (signal-value btor649))
             (list)))
           (btor791
            (if (bitvector->bool (signal-value btor790)) btor789 btor173))
           (btor792
            (signal
             (concat (signal-value btor728) (signal-value btor731))
             (list)))
           (btor793
            (signal
             (extract 34 18 (signal-value btor791))
             (signal-state btor791)))
           (btor794
            (signal
             (concat (signal-value btor793) (signal-value btor792))
             (list)))
           (btor795
            (signal
             (concat (signal-value btor724) (signal-value btor724))
             (list)))
           (btor796
            (signal
             (concat (signal-value btor724) (signal-value btor795))
             (list)))
           (btor797
            (signal
             (concat (signal-value btor724) (signal-value btor796))
             (list)))
           (btor798
            (signal
             (concat (signal-value btor724) (signal-value btor797))
             (list)))
           (btor799
            (signal
             (concat (signal-value btor724) (signal-value btor798))
             (list)))
           (btor800
            (signal
             (concat (signal-value btor724) (signal-value btor799))
             (list)))
           (btor801
            (signal
             (concat (signal-value btor724) (signal-value btor800))
             (list)))
           (btor802
            (signal
             (concat (signal-value btor724) (signal-value btor801))
             (list)))
           (btor803
            (signal
             (concat (signal-value btor724) (signal-value btor802))
             (list)))
           (btor804
            (signal
             (concat (signal-value btor724) (signal-value btor803))
             (list)))
           (btor805
            (signal
             (concat (signal-value btor724) (signal-value btor804))
             (list)))
           (btor806
            (signal
             (concat (signal-value btor724) (signal-value btor805))
             (list)))
           (btor807
            (signal
             (concat (signal-value btor724) (signal-value btor806))
             (list)))
           (btor808
            (signal
             (concat (signal-value btor724) (signal-value btor807))
             (list)))
           (btor809
            (signal
             (concat (signal-value btor724) (signal-value btor808))
             (list)))
           (btor810
            (signal
             (concat (signal-value btor724) (signal-value btor809))
             (list)))
           (btor811
            (signal
             (concat (signal-value btor724) (signal-value btor810))
             (list)))
           (btor812
            (signal
             (concat (signal-value btor724) (signal-value btor811))
             (list)))
           (btor813
            (signal
             (concat (signal-value btor724) (signal-value btor812))
             (list)))
           (btor814
            (signal
             (concat (signal-value btor724) (signal-value btor813))
             (list)))
           (btor815
            (signal
             (concat (signal-value btor724) (signal-value btor814))
             (list)))
           (btor816
            (signal
             (concat (signal-value btor724) (signal-value btor815))
             (list)))
           (btor817
            (signal
             (concat (signal-value btor724) (signal-value btor816))
             (list)))
           (btor818
            (signal
             (concat (signal-value btor724) (signal-value btor817))
             (list)))
           (btor819
            (signal
             (concat (signal-value btor724) (signal-value btor818))
             (list)))
           (btor820
            (signal
             (concat (signal-value btor724) (signal-value btor819))
             (list)))
           (btor821
            (signal
             (concat (signal-value btor724) (signal-value btor820))
             (list)))
           (btor822
            (signal
             (concat (signal-value btor724) (signal-value btor821))
             (list)))
           (btor823
            (signal
             (concat (signal-value btor724) (signal-value btor822))
             (list)))
           (btor824
            (signal
             (concat (signal-value btor724) (signal-value btor823))
             (list)))
           (btor825
            (signal
             (concat (signal-value btor724) (signal-value btor824))
             (list)))
           (btor826
            (signal
             (concat (signal-value btor724) (signal-value btor825))
             (list)))
           (btor827
            (signal
             (concat (signal-value btor724) (signal-value btor826))
             (list)))
           (btor828
            (signal
             (concat (signal-value btor724) (signal-value btor827))
             (list)))
           (btor829
            (if (bitvector->bool (signal-value btor790)) btor828 btor173))
           (btor830
            (signal
             (concat (signal-value btor724) (signal-value btor731))
             (list)))
           (btor831
            (signal
             (extract 34 18 (signal-value btor829))
             (signal-state btor829)))
           (btor832
            (signal
             (concat (signal-value btor831) (signal-value btor830))
             (list)))
           (btor833
            (if (bitvector->bool (signal-value btor191)) btor832 btor794))
           (btor834
            (bv->signal
             (zero-extend (signal-value btor833) (bitvector 35))
             btor833))
           (btor835
            (bv->signal
             (zero-extend (signal-value btor723) (bitvector 1))
             btor723))
           (btor836
            (bv->signal
             (zero-extend (signal-value btor724) (bitvector 1))
             btor724))
           (btor837
            (bv->signal
             (zero-extend (signal-value btor487) (bitvector 36))
             btor487))
           (btor838
            (bv->signal
             (zero-extend (signal-value btor483) (bitvector 36))
             btor483))
           (btor839
            (bv->signal
             (zero-extend (signal-value btor484) (bitvector 36))
             btor484))
           (btor840
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state840)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state840)))
                     ((assoc-has-key? init-hash 'state840)
                      (bv->signal (assoc-ref init-hash 'state840)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor842
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor843
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor842)))
             (list)))
           (btor844
            (if (bitvector->bool (signal-value btor843)) btor26 btor95))
           (btor845
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor846
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor845)))
             (list)))
           (btor847
            (if (bitvector->bool (signal-value btor846)) btor25 btor844))
           (btor848
            (signal
             (apply bvor (bitvector->bits (signal-value btor16)))
             (signal-state btor16)))
           (btor849 (signal (bvnot (signal-value btor848)) (list)))
           (btor850
            (if (bitvector->bool (signal-value btor849)) btor24 btor847))
           (btor851
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor123)))
             (list)))
           (btor852
            (if (bitvector->bool (signal-value btor851)) btor95 btor850))
           (btor853
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor854
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor853)))
             (list)))
           (btor855
            (if (bitvector->bool (signal-value btor854)) btor27 btor852))
           (btor856
            (if (bitvector->bool (signal-value btor855)) btor95 btor840))
           (btor857
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state857)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state857)))
                     ((assoc-has-key? init-hash 'state857)
                      (bv->signal (assoc-ref init-hash 'state857)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor859
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor860
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor859)))
             (list)))
           (btor861
            (if (bitvector->bool (signal-value btor860)) btor26 btor95))
           (btor862
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor863
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor862)))
             (list)))
           (btor864
            (if (bitvector->bool (signal-value btor863)) btor25 btor861))
           (btor865
            (signal
             (apply bvor (bitvector->bits (signal-value btor15)))
             (signal-state btor15)))
           (btor866 (signal (bvnot (signal-value btor865)) (list)))
           (btor867
            (if (bitvector->bool (signal-value btor866)) btor24 btor864))
           (btor868
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor123)))
             (list)))
           (btor869
            (if (bitvector->bool (signal-value btor868)) btor95 btor867))
           (btor870
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor871
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor870)))
             (list)))
           (btor872
            (if (bitvector->bool (signal-value btor871)) btor27 btor869))
           (btor873
            (if (bitvector->bool (signal-value btor872)) btor95 btor857))
           (btor874
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor140)))
             (list)))
           (btor875
            (if (bitvector->bool (signal-value btor874)) btor14 btor873))
           (btor876
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor140)))
             (list)))
           (btor877
            (if (bitvector->bool (signal-value btor876)) btor875 btor856))
           (btor878
            (bv->signal
             (zero-extend (signal-value btor877) (bitvector 1))
             btor877))
           (btor879
            (bv->signal
             (zero-extend (signal-value btor856) (bitvector 1))
             btor856))
           (btor880
            (bv->signal
             (zero-extend (signal-value btor877) (bitvector 1))
             btor877))
           (btor881
            (bv->signal
             (zero-extend (signal-value btor873) (bitvector 1))
             btor873))
           (btor882
            (bv->signal
             (zero-extend (signal-value btor875) (bitvector 1))
             btor875))
           (btor883
            (bv->signal
             (zero-extend (signal-value btor179) (bitvector 5))
             btor179))
           (btor884
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor883)))
             (list)))
           (btor885
            (if (bitvector->bool (signal-value btor884)) btor36 btor95))
           (btor886
            (bv->signal
             (zero-extend (signal-value btor183) (bitvector 5))
             btor183))
           (btor887
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor886)))
             (list)))
           (btor888
            (if (bitvector->bool (signal-value btor887)) btor35 btor885))
           (btor889
            (bv->signal
             (zero-extend (signal-value btor187) (bitvector 5))
             btor187))
           (btor890
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor889)))
             (list)))
           (btor891
            (if (bitvector->bool (signal-value btor890)) btor34 btor888))
           (btor892
            (if (bitvector->bool (signal-value btor876)) btor95 btor891))
           (btor893
            (bv->signal
             (zero-extend (signal-value btor193) (bitvector 5))
             btor193))
           (btor894
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor893)))
             (list)))
           (btor895
            (if (bitvector->bool (signal-value btor894)) btor33 btor892))
           (btor896
            (bv->signal
             (zero-extend (signal-value btor895) (bitvector 1))
             btor895))
           (btor897
            (bv->signal
             (zero-extend (signal-value btor855) (bitvector 1))
             btor855))
           (btor898
            (if (bitvector->bool (signal-value btor884)) btor52 btor116))
           (btor899
            (if (bitvector->bool (signal-value btor887)) btor51 btor898))
           (btor900
            (if (bitvector->bool (signal-value btor890)) btor50 btor899))
           (btor901
            (if (bitvector->bool (signal-value btor876)) btor116 btor900))
           (btor902
            (if (bitvector->bool (signal-value btor894)) btor49 btor901))
           (btor903
            (bv->signal
             (zero-extend (signal-value btor902) (bitvector 1))
             btor902))
           (btor904
            (bv->signal
             (zero-extend (signal-value btor179) (bitvector 5))
             btor179))
           (btor905
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor904)))
             (list)))
           (btor906
            (if (bitvector->bool (signal-value btor905)) btor36 btor95))
           (btor907
            (bv->signal
             (zero-extend (signal-value btor183) (bitvector 5))
             btor183))
           (btor908
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor907)))
             (list)))
           (btor909
            (if (bitvector->bool (signal-value btor908)) btor35 btor906))
           (btor910
            (bv->signal
             (zero-extend (signal-value btor187) (bitvector 5))
             btor187))
           (btor911
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor910)))
             (list)))
           (btor912
            (if (bitvector->bool (signal-value btor911)) btor34 btor909))
           (btor913
            (if (bitvector->bool (signal-value btor874)) btor95 btor912))
           (btor914
            (bv->signal
             (zero-extend (signal-value btor193) (bitvector 5))
             btor193))
           (btor915
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor914)))
             (list)))
           (btor916
            (if (bitvector->bool (signal-value btor915)) btor33 btor913))
           (btor917
            (bv->signal
             (zero-extend (signal-value btor916) (bitvector 1))
             btor916))
           (btor918
            (bv->signal
             (zero-extend (signal-value btor872) (bitvector 1))
             btor872))
           (btor919
            (if (bitvector->bool (signal-value btor905)) btor52 btor116))
           (btor920
            (if (bitvector->bool (signal-value btor908)) btor51 btor919))
           (btor921
            (if (bitvector->bool (signal-value btor911)) btor50 btor920))
           (btor922
            (if (bitvector->bool (signal-value btor874)) btor116 btor921))
           (btor923
            (if (bitvector->bool (signal-value btor915)) btor49 btor922))
           (btor924
            (bv->signal
             (zero-extend (signal-value btor923) (bitvector 1))
             btor923))
           (btor925
            (bv->signal
             (zero-extend (signal-value btor875) (bitvector 1))
             btor875))
           (btor927
            (if (bitvector->bool (signal-value btor575)) btor509 btor99))
           (btor928
            (if (bitvector->bool (signal-value btor554)) btor927 btor99))
           (btor929
            (if (bitvector->bool (signal-value btor569)) btor95 btor928))
           (btor932
            (signal
             (extract 17 0 (signal-value btor579))
             (signal-state btor579)))
           (btor934 (if (bitvector->bool (signal-value btor93)) btor81 btor43))
           (btor935 (bv->signal (bv 26 (bitvector 5))))
           (btor936
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor935)))
             (list)))
           (btor937
            (if (bitvector->bool (signal-value btor936)) btor934 btor130))
           (btor938
            (if (bitvector->bool (signal-value btor132)) btor81 btor937))
           (btor939
            (if (bitvector->bool (signal-value btor138)) btor43 btor938))
           (btor940
            (signal
             (bvand (signal-value btor370) (signal-value btor377))
             (list)))
           (btor941
            (if (bitvector->bool (signal-value btor940)) btor939 btor130))
           (btor942
            (if (bitvector->bool (signal-value btor129)) btor105 btor941))
           (btor944 (if (bitvector->bool (signal-value btor94)) btor82 btor44))
           (btor945
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor935)))
             (list)))
           (btor946
            (if (bitvector->bool (signal-value btor945)) btor944 btor160))
           (btor947
            (if (bitvector->bool (signal-value btor162)) btor82 btor946))
           (btor948
            (if (bitvector->bool (signal-value btor167)) btor44 btor947))
           (btor949
            (signal
             (bvand (signal-value btor391) (signal-value btor398))
             (list)))
           (btor950
            (if (bitvector->bool (signal-value btor949)) btor948 btor160))
           (btor951
            (if (bitvector->bool (signal-value btor159)) btor105 btor950))
           (btor953 unnamed-input-953)
           (btor954 unnamed-input-954)
           (btor955
            (if (bitvector->bool (signal-value btor877)) btor833 btor579))
           (btor956 unnamed-input-956)
           (btor957 unnamed-input-957)
           (btor958
            (signal
             (extract 34 0 (signal-value btor515))
             (signal-state btor515)))
           (btor959
            (signal
             (extract 34 0 (signal-value btor487))
             (signal-state btor487)))
           (btor960
            (if (bitvector->bool (signal-value btor508)) btor959 btor958))
           (btor961
            (if (bitvector->bool (signal-value btor575)) btor960 btor957))
           (btor962
            (if (bitvector->bool (signal-value btor554)) btor961 btor956))
           (btor963 unnamed-input-963)
           (btor964
            (if (bitvector->bool (signal-value btor569)) btor963 btor962))
           (btor965
            (signal
             (bvsub (signal-value btor955) (signal-value btor964))
             (list)))
           (btor966
            (if (bitvector->bool (signal-value btor877)) btor173 btor579))
           (btor967
            (signal
             (bvsub (signal-value btor966) (signal-value btor964))
             (list)))
           (btor968 (signal (bvnot (signal-value btor402)) (list)))
           (btor969 (signal (bvnot (signal-value btor400)) (list)))
           (btor970
            (signal
             (bvand (signal-value btor968) (signal-value btor969))
             (list)))
           (btor971
            (if (bitvector->bool (signal-value btor970)) btor967 btor965))
           (btor972
            (bv->signal
             (zero-extend (signal-value btor955) (bitvector 36))
             btor955))
           (btor973
            (bv->signal
             (zero-extend (signal-value btor964) (bitvector 36))
             btor964))
           (btor974
            (signal
             (bvadd (signal-value btor972) (signal-value btor973))
             (list)))
           (btor975
            (bv->signal
             (zero-extend (signal-value btor966) (bitvector 36))
             btor966))
           (btor976
            (bv->signal
             (zero-extend (signal-value btor964) (bitvector 36))
             btor964))
           (btor977
            (signal
             (bvadd (signal-value btor975) (signal-value btor976))
             (list)))
           (btor978
            (if (bitvector->bool (signal-value btor970)) btor977 btor974))
           (btor979
            (signal
             (extract 34 0 (signal-value btor978))
             (signal-state btor978)))
           (btor980
            (if (bitvector->bool (signal-value btor303)) btor979 btor971))
           (btor981
            (if (bitvector->bool (signal-value btor575)) btor980 btor954))
           (btor982
            (if (bitvector->bool (signal-value btor554)) btor981 btor953))
           (btor983 unnamed-input-983)
           (btor984
            (if (bitvector->bool (signal-value btor569)) btor983 btor982))
           (btor985
            (if (bitvector->bool (signal-value btor402)) btor984 btor174))
           (btor986
            (if (bitvector->bool (signal-value btor575)) btor985 btor174))
           (btor987
            (if (bitvector->bool (signal-value btor554)) btor986 btor174))
           (btor988
            (if (bitvector->bool (signal-value btor569)) btor173 btor987))
           (btor990
            (if (bitvector->bool (signal-value btor402)) btor95 btor176))
           (btor991
            (if (bitvector->bool (signal-value btor575)) btor990 btor176))
           (btor992
            (if (bitvector->bool (signal-value btor554)) btor991 btor176))
           (btor993
            (if (bitvector->bool (signal-value btor569)) btor95 btor992))
           (btor995
            (signal
             (bvand (signal-value btor320) (signal-value btor327))
             (list)))
           (btor996
            (if (bitvector->bool (signal-value btor995)) btor290 btor271))
           (btor997
            (if (bitvector->bool (signal-value btor270)) btor95 btor996))
           (btor999
            (signal
             (bvand (signal-value btor343) (signal-value btor350))
             (list)))
           (btor1000
            (if (bitvector->bool (signal-value btor999)) btor28 btor288))
           (btor1001
            (if (bitvector->bool (signal-value btor287)) btor95 btor1000))
           (btor1003 (signal (bvnot (signal-value btor352)) (list)))
           (btor1004
            (if (bitvector->bool (signal-value btor575)) btor1003 btor352))
           (btor1005
            (if (bitvector->bool (signal-value btor554)) btor1004 btor352))
           (btor1006
            (if (bitvector->bool (signal-value btor569)) btor1003 btor1005))
           (btor1008
            (signal
             (bvand (signal-value btor620) (signal-value btor627))
             (list)))
           (btor1009
            (if (bitvector->bool (signal-value btor1008)) btor91 btor427))
           (btor1010
            (if (bitvector->bool (signal-value btor426)) btor95 btor1009))
           (btor1012
            (signal
             (bvand (signal-value btor668) (signal-value btor675))
             (list)))
           (btor1013
            (if (bitvector->bool (signal-value btor1012)) btor92 btor464))
           (btor1014
            (if (bitvector->bool (signal-value btor463)) btor95 btor1013))
           (btor1016
            (signal
             (bvand (signal-value btor530) (signal-value btor537))
             (list)))
           (btor1017
            (if (bitvector->bool (signal-value btor1016)) btor95 btor506))
           (btor1018
            (if (bitvector->bool (signal-value btor505)) btor95 btor1017))
           (btor1020
            (if (bitvector->bool (signal-value btor1016)) btor487 btor515))
           (btor1021
            (if (bitvector->bool (signal-value btor505)) btor512 btor1020))
           (btor1023 unnamed-input-1023)
           (btor1024 unnamed-input-1024)
           (btor1025
            (signal
             (bool->bitvector
              (bvuge (signal-value btor955) (signal-value btor964)))
             (list)))
           (btor1026
            (if (bitvector->bool (signal-value btor1025)) btor116 btor95))
           (btor1027
            (signal
             (bool->bitvector
              (bvuge (signal-value btor966) (signal-value btor964)))
             (list)))
           (btor1028
            (if (bitvector->bool (signal-value btor1027)) btor116 btor95))
           (btor1029
            (if (bitvector->bool (signal-value btor970)) btor1028 btor1026))
           (btor1030
            (signal
             (extract 35 35 (signal-value btor978))
             (signal-state btor978)))
           (btor1031
            (if (bitvector->bool (signal-value btor303)) btor1030 btor1029))
           (btor1032
            (if (bitvector->bool (signal-value btor575)) btor1031 btor1024))
           (btor1033
            (if (bitvector->bool (signal-value btor554)) btor1032 btor1023))
           (btor1034 unnamed-input-1034)
           (btor1035
            (if (bitvector->bool (signal-value btor569)) btor1034 btor1033))
           (btor1036 (signal (bvnot (signal-value btor1035)) (list)))
           (btor1037
            (if (bitvector->bool (signal-value btor303)) btor1035 btor1036))
           (btor1038 unnamed-input-1038)
           (btor1039
            (signal
             (extract 34 34 (signal-value btor579))
             (signal-state btor579)))
           (btor1040
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor1038)
              (signal-value btor1039))
             (list)))
           (btor1041 (signal (bvnot (signal-value btor303)) (list)))
           (btor1042
            (signal
             (bvxor (signal-value btor1040) (signal-value btor1041))
             (list)))
           (btor1043
            (signal
             (extract 34 34 (signal-value btor984))
             (signal-state btor984)))
           (btor1044
            (signal
             (bvxor (signal-value btor1039) (signal-value btor1043))
             (list)))
           (btor1045
            (signal
             (bvand (signal-value btor1042) (signal-value btor1044))
             (list)))
           (btor1046 unnamed-input-1046)
           (btor1047
            (signal
             (extract 34 34 (signal-value btor833))
             (signal-state btor833)))
           (btor1048
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor1046)
              (signal-value btor1047))
             (list)))
           (btor1049
            (signal
             (bvxor (signal-value btor1048) (signal-value btor1041))
             (list)))
           (btor1050
            (signal
             (bvxor (signal-value btor1047) (signal-value btor1043))
             (list)))
           (btor1051
            (signal
             (bvand (signal-value btor1049) (signal-value btor1050))
             (list)))
           (btor1052
            (if (bitvector->bool (signal-value btor877)) btor1051 btor1045))
           (btor1053 unnamed-input-1053)
           (btor1054 unnamed-input-1054)
           (btor1055
            (if (bitvector->bool (signal-value btor575)) btor790 btor1054))
           (btor1056
            (if (bitvector->bool (signal-value btor554)) btor1055 btor1053))
           (btor1057 unnamed-input-1057)
           (btor1058
            (if (bitvector->bool (signal-value btor569)) btor1057 btor1056))
           (btor1059
            (signal
             (apply bvor (bitvector->bits (signal-value btor964)))
             (signal-state btor964)))
           (btor1060
            (signal
             (bvand (signal-value btor1058) (signal-value btor1059))
             (list)))
           (btor1061
            (if (bitvector->bool (signal-value btor1060)) btor1052 btor1037))
           (btor1062
            (if (bitvector->bool (signal-value btor575)) btor1061 btor577))
           (btor1063
            (if (bitvector->bool (signal-value btor554)) btor1062 btor577))
           (btor1064
            (if (bitvector->bool (signal-value btor569)) btor95 btor1063))
           (btor1066
            (if (bitvector->bool (signal-value btor402)) btor985 btor984))
           (btor1067
            (if (bitvector->bool (signal-value btor575)) btor1066 btor579))
           (btor1068
            (if (bitvector->bool (signal-value btor554)) btor1067 btor579))
           (btor1069
            (if (bitvector->bool (signal-value btor569)) btor173 btor1068))
           (btor1071
            (signal
             (bvand (signal-value btor689) (signal-value btor696))
             (list)))
           (btor1072
            (if (bitvector->bool (signal-value btor1071)) btor429 btor597))
           (btor1073
            (if (bitvector->bool (signal-value btor596)) btor95 btor1072))
           (btor1075
            (signal
             (bvand (signal-value btor710) (signal-value btor717))
             (list)))
           (btor1076
            (if (bitvector->bool (signal-value btor1075)) btor466 btor645))
           (btor1077
            (if (bitvector->bool (signal-value btor644)) btor95 btor1076))
           (btor1079
            (signal
             (bvand (signal-value btor232) (signal-value btor253))
             (list)))
           (btor1080
            (if (bitvector->bool (signal-value btor1079)) btor19 btor723))
           (btor1081
            (if (bitvector->bool (signal-value btor247)) btor95 btor1080))
           (btor1083
            (signal
             (bvand (signal-value btor196) (signal-value btor217))
             (list)))
           (btor1084
            (if (bitvector->bool (signal-value btor1083)) btor724 btor728))
           (btor1085
            (if (bitvector->bool (signal-value btor211)) btor95 btor1084))
           (btor1087
            (signal
             (bvand (signal-value btor895) (signal-value btor902))
             (list)))
           (btor1088
            (if (bitvector->bool (signal-value btor1087)) btor875 btor856))
           (btor1089
            (if (bitvector->bool (signal-value btor855)) btor95 btor1088))
           (btor1091
            (signal
             (bvand (signal-value btor916) (signal-value btor923))
             (list)))
           (btor1092
            (if (bitvector->bool (signal-value btor1091)) btor14 btor873))
           (btor1093
            (if (bitvector->bool (signal-value btor872)) btor95 btor1092)))
      (list
       (cons
        'scanouta
        (signal
         (signal-value btor142)
         (append
          (list (cons 'state857 (signal-value btor1093)))
          (append
           (list (cons 'state840 (signal-value btor1089)))
           (append
            (list (cons 'state726 (signal-value btor1085)))
            (append
             (list (cons 'state721 (signal-value btor1081)))
             (append
              (list (cons 'state629 (signal-value btor1077)))
              (append
               (list (cons 'state581 (signal-value btor1073)))
               (append
                (list (cons 'result_int (signal-value btor1069)))
                (append
                 (list (cons 'overflow_int (signal-value btor1064)))
                 (append
                  (list (cons 'state513 (signal-value btor1021)))
                  (append
                   (list (cons 'state490 (signal-value btor1018)))
                   (append
                    (list (cons 'state448 (signal-value btor1014)))
                    (append
                     (list (cons 'state411 (signal-value btor1010)))
                     (append
                      (list (cons 'flag (signal-value btor1006)))
                      (append
                       (list (cons 'state272 (signal-value btor1001)))
                       (append
                        (list (cons 'state255 (signal-value btor997)))
                        (append
                         (list
                          (cons
                           'accum_saturate_overflow
                           (signal-value btor993)))
                         (append
                          (list (cons 'accum_result (signal-value btor988)))
                          (append
                           (list (cons 'state144 (signal-value btor951)))
                           (append
                            (list (cons 'state109 (signal-value btor942)))
                            (append
                             (list (cons 'state106 (signal-value btor932)))
                             (append
                              (list (cons 'state102 (signal-value btor577)))
                              (append
                               (list
                                (cons
                                 'mult_is_saturated_int
                                 (signal-value btor929)))
                               (append
                                (list
                                 (cons
                                  'accum_is_saturated_latent
                                  (signal-value btor176)))
                                (list))))))))))))))))))))))))))
       (cons
        'accum_is_saturated
        (signal
         (signal-value btor96)
         (append
          (list (cons 'state857 (signal-value btor1093)))
          (append
           (list (cons 'state840 (signal-value btor1089)))
           (append
            (list (cons 'state726 (signal-value btor1085)))
            (append
             (list (cons 'state721 (signal-value btor1081)))
             (append
              (list (cons 'state629 (signal-value btor1077)))
              (append
               (list (cons 'state581 (signal-value btor1073)))
               (append
                (list (cons 'result_int (signal-value btor1069)))
                (append
                 (list (cons 'overflow_int (signal-value btor1064)))
                 (append
                  (list (cons 'state513 (signal-value btor1021)))
                  (append
                   (list (cons 'state490 (signal-value btor1018)))
                   (append
                    (list (cons 'state448 (signal-value btor1014)))
                    (append
                     (list (cons 'state411 (signal-value btor1010)))
                     (append
                      (list (cons 'flag (signal-value btor1006)))
                      (append
                       (list (cons 'state272 (signal-value btor1001)))
                       (append
                        (list (cons 'state255 (signal-value btor997)))
                        (append
                         (list
                          (cons
                           'accum_saturate_overflow
                           (signal-value btor993)))
                         (append
                          (list (cons 'accum_result (signal-value btor988)))
                          (append
                           (list (cons 'state144 (signal-value btor951)))
                           (append
                            (list (cons 'state109 (signal-value btor942)))
                            (append
                             (list (cons 'state106 (signal-value btor932)))
                             (append
                              (list (cons 'state102 (signal-value btor577)))
                              (append
                               (list
                                (cons
                                 'mult_is_saturated_int
                                 (signal-value btor929)))
                               (append
                                (list
                                 (cons
                                  'accum_is_saturated_latent
                                  (signal-value btor176)))
                                (list))))))))))))))))))))))))))
       (cons
        'result
        (signal
         (signal-value btor106)
         (append
          (list (cons 'state857 (signal-value btor1093)))
          (append
           (list (cons 'state840 (signal-value btor1089)))
           (append
            (list (cons 'state726 (signal-value btor1085)))
            (append
             (list (cons 'state721 (signal-value btor1081)))
             (append
              (list (cons 'state629 (signal-value btor1077)))
              (append
               (list (cons 'state581 (signal-value btor1073)))
               (append
                (list (cons 'result_int (signal-value btor1069)))
                (append
                 (list (cons 'overflow_int (signal-value btor1064)))
                 (append
                  (list (cons 'state513 (signal-value btor1021)))
                  (append
                   (list (cons 'state490 (signal-value btor1018)))
                   (append
                    (list (cons 'state448 (signal-value btor1014)))
                    (append
                     (list (cons 'state411 (signal-value btor1010)))
                     (append
                      (list (cons 'flag (signal-value btor1006)))
                      (append
                       (list (cons 'state272 (signal-value btor1001)))
                       (append
                        (list (cons 'state255 (signal-value btor997)))
                        (append
                         (list
                          (cons
                           'accum_saturate_overflow
                           (signal-value btor993)))
                         (append
                          (list (cons 'accum_result (signal-value btor988)))
                          (append
                           (list (cons 'state144 (signal-value btor951)))
                           (append
                            (list (cons 'state109 (signal-value btor942)))
                            (append
                             (list (cons 'state106 (signal-value btor932)))
                             (append
                              (list (cons 'state102 (signal-value btor577)))
                              (append
                               (list
                                (cons
                                 'mult_is_saturated_int
                                 (signal-value btor929)))
                               (append
                                (list
                                 (cons
                                  'accum_is_saturated_latent
                                  (signal-value btor176)))
                                (list))))))))))))))))))))))))))
       (cons
        'mult_is_saturated
        (signal
         (signal-value btor99)
         (append
          (list (cons 'state857 (signal-value btor1093)))
          (append
           (list (cons 'state840 (signal-value btor1089)))
           (append
            (list (cons 'state726 (signal-value btor1085)))
            (append
             (list (cons 'state721 (signal-value btor1081)))
             (append
              (list (cons 'state629 (signal-value btor1077)))
              (append
               (list (cons 'state581 (signal-value btor1073)))
               (append
                (list (cons 'result_int (signal-value btor1069)))
                (append
                 (list (cons 'overflow_int (signal-value btor1064)))
                 (append
                  (list (cons 'state513 (signal-value btor1021)))
                  (append
                   (list (cons 'state490 (signal-value btor1018)))
                   (append
                    (list (cons 'state448 (signal-value btor1014)))
                    (append
                     (list (cons 'state411 (signal-value btor1010)))
                     (append
                      (list (cons 'flag (signal-value btor1006)))
                      (append
                       (list (cons 'state272 (signal-value btor1001)))
                       (append
                        (list (cons 'state255 (signal-value btor997)))
                        (append
                         (list
                          (cons
                           'accum_saturate_overflow
                           (signal-value btor993)))
                         (append
                          (list (cons 'accum_result (signal-value btor988)))
                          (append
                           (list (cons 'state144 (signal-value btor951)))
                           (append
                            (list (cons 'state109 (signal-value btor942)))
                            (append
                             (list (cons 'state106 (signal-value btor932)))
                             (append
                              (list (cons 'state102 (signal-value btor577)))
                              (append
                               (list
                                (cons
                                 'mult_is_saturated_int
                                 (signal-value btor929)))
                               (append
                                (list
                                 (cons
                                  'accum_is_saturated_latent
                                  (signal-value btor176)))
                                (list))))))))))))))))))))))))))
       (cons
        'overflow
        (signal
         (signal-value btor102)
         (append
          (list (cons 'state857 (signal-value btor1093)))
          (append
           (list (cons 'state840 (signal-value btor1089)))
           (append
            (list (cons 'state726 (signal-value btor1085)))
            (append
             (list (cons 'state721 (signal-value btor1081)))
             (append
              (list (cons 'state629 (signal-value btor1077)))
              (append
               (list (cons 'state581 (signal-value btor1073)))
               (append
                (list (cons 'result_int (signal-value btor1069)))
                (append
                 (list (cons 'overflow_int (signal-value btor1064)))
                 (append
                  (list (cons 'state513 (signal-value btor1021)))
                  (append
                   (list (cons 'state490 (signal-value btor1018)))
                   (append
                    (list (cons 'state448 (signal-value btor1014)))
                    (append
                     (list (cons 'state411 (signal-value btor1010)))
                     (append
                      (list (cons 'flag (signal-value btor1006)))
                      (append
                       (list (cons 'state272 (signal-value btor1001)))
                       (append
                        (list (cons 'state255 (signal-value btor997)))
                        (append
                         (list
                          (cons
                           'accum_saturate_overflow
                           (signal-value btor993)))
                         (append
                          (list (cons 'accum_result (signal-value btor988)))
                          (append
                           (list (cons 'state144 (signal-value btor951)))
                           (append
                            (list (cons 'state109 (signal-value btor942)))
                            (append
                             (list (cons 'state106 (signal-value btor932)))
                             (append
                              (list (cons 'state102 (signal-value btor577)))
                              (append
                               (list
                                (cons
                                 'mult_is_saturated_int
                                 (signal-value btor929)))
                               (append
                                (list
                                 (cons
                                  'accum_is_saturated_latent
                                  (signal-value btor176)))
                                (list))))))))))))))))))))))))))
       (cons
        'scanoutb
        (signal
         (signal-value btor170)
         (append
          (list (cons 'state857 (signal-value btor1093)))
          (append
           (list (cons 'state840 (signal-value btor1089)))
           (append
            (list (cons 'state726 (signal-value btor1085)))
            (append
             (list (cons 'state721 (signal-value btor1081)))
             (append
              (list (cons 'state629 (signal-value btor1077)))
              (append
               (list (cons 'state581 (signal-value btor1073)))
               (append
                (list (cons 'result_int (signal-value btor1069)))
                (append
                 (list (cons 'overflow_int (signal-value btor1064)))
                 (append
                  (list (cons 'state513 (signal-value btor1021)))
                  (append
                   (list (cons 'state490 (signal-value btor1018)))
                   (append
                    (list (cons 'state448 (signal-value btor1014)))
                    (append
                     (list (cons 'state411 (signal-value btor1010)))
                     (append
                      (list (cons 'flag (signal-value btor1006)))
                      (append
                       (list (cons 'state272 (signal-value btor1001)))
                       (append
                        (list (cons 'state255 (signal-value btor997)))
                        (append
                         (list
                          (cons
                           'accum_saturate_overflow
                           (signal-value btor993)))
                         (append
                          (list (cons 'accum_result (signal-value btor988)))
                          (append
                           (list (cons 'state144 (signal-value btor951)))
                           (append
                            (list (cons 'state109 (signal-value btor942)))
                            (append
                             (list (cons 'state106 (signal-value btor932)))
                             (append
                              (list (cons 'state102 (signal-value btor577)))
                              (append
                               (list
                                (cons
                                 'mult_is_saturated_int
                                 (signal-value btor929)))
                               (append
                                (list
                                 (cons
                                  'accum_is_saturated_latent
                                  (signal-value btor176)))
                                (list))))))))))))))))))))))))))))))

