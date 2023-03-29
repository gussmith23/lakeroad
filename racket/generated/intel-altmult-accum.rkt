;;; Imported with
;;; $LAKEROAD_DIR/bin/verilog_to_racket.py \
;;;  --infile ~/lakeroad-private/altera_mf/altera_mf_modified.v \
;;;  --top altmult_accum \
;;;  --function-name intel-altmult-accum
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
      (dataa (bv->signal (constant 'dataa (bitvector 2))))
      #:datab
      (datab (bv->signal (constant 'datab (bitvector 2))))
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
      (scanina (bv->signal (constant 'scanina (bitvector 2))))
      #:scaninb
      (scaninb (bv->signal (constant 'scaninb (bitvector 2))))
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
      #:unnamed-input-398
      (unnamed-input-398
       (bv->signal (constant 'unnamed-input-398 (bitvector 1))))
      #:unnamed-input-400
      (unnamed-input-400
       (bv->signal (constant 'unnamed-input-400 (bitvector 1))))
      #:unnamed-input-481
      (unnamed-input-481
       (bv->signal (constant 'unnamed-input-481 (bitvector 4))))
      #:unnamed-input-848
      (unnamed-input-848
       (bv->signal (constant 'unnamed-input-848 (bitvector 5))))
      #:unnamed-input-849
      (unnamed-input-849
       (bv->signal (constant 'unnamed-input-849 (bitvector 5))))
      #:unnamed-input-851
      (unnamed-input-851
       (bv->signal (constant 'unnamed-input-851 (bitvector 5))))
      #:unnamed-input-852
      (unnamed-input-852
       (bv->signal (constant 'unnamed-input-852 (bitvector 5))))
      #:unnamed-input-863
      (unnamed-input-863
       (bv->signal (constant 'unnamed-input-863 (bitvector 5))))
      #:unnamed-input-884
      (unnamed-input-884
       (bv->signal (constant 'unnamed-input-884 (bitvector 5))))
      #:unnamed-input-924
      (unnamed-input-924
       (bv->signal (constant 'unnamed-input-924 (bitvector 1))))
      #:unnamed-input-925
      (unnamed-input-925
       (bv->signal (constant 'unnamed-input-925 (bitvector 1))))
      #:unnamed-input-935
      (unnamed-input-935
       (bv->signal (constant 'unnamed-input-935 (bitvector 1))))
      #:unnamed-input-953
      (unnamed-input-953
       (bv->signal (constant 'unnamed-input-953 (bitvector 1))))
      #:unnamed-input-954
      (unnamed-input-954
       (bv->signal (constant 'unnamed-input-954 (bitvector 1))))
      #:unnamed-input-957
      (unnamed-input-957
       (bv->signal (constant 'unnamed-input-957 (bitvector 1)))))
    (let* ((merged-input-state-hash (list))
           (init-hash
            (append
             (list (cons 'state753 (bv 0 (bitvector 1))))
             (append
              (list (cons 'state736 (bv 0 (bitvector 1))))
              (append
               (list (cons 'state723 (bv 0 (bitvector 1))))
               (append
                (list (cons 'state718 (bv 0 (bitvector 1))))
                (append
                 (list (cons 'state626 (bv 0 (bitvector 1))))
                 (append
                  (list (cons 'state578 (bv 0 (bitvector 1))))
                  (append
                   (list (cons 'state576 (bv 0 (bitvector 5))))
                   (append
                    (list (cons 'state574 (bv 0 (bitvector 1))))
                    (append
                     (list (cons 'state510 (bv 0 (bitvector 4))))
                     (append
                      (list (cons 'state487 (bv 0 (bitvector 1))))
                      (append
                       (list (cons 'state446 (bv 0 (bitvector 1))))
                       (append
                        (list (cons 'state409 (bv 0 (bitvector 1))))
                        (append
                         (list (cons 'state350 (bv 0 (bitvector 1))))
                         (append
                          (list (cons 'state270 (bv 0 (bitvector 1))))
                          (append
                           (list (cons 'state253 (bv 0 (bitvector 1))))
                           (append
                            (list (cons 'state174 (bv 0 (bitvector 1))))
                            (append
                             (list (cons 'state172 (bv 0 (bitvector 5))))
                             (append
                              (list (cons 'state144 (bv 0 (bitvector 2))))
                              (append
                               (list (cons 'state110 (bv 0 (bitvector 2))))
                               (append
                                (list (cons 'state106 (bv 0 (bitvector 5))))
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
           (btor42 (bitvector 2))
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
           (btor105 (bv->signal (bv 0 (bitvector 5))))
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
                          (bv 0 5))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor109 (bv->signal (bv 0 (bitvector 2))))
           (btor110
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state110)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state110)))
                     ((assoc-has-key? init-hash 'state110)
                      (bv->signal (assoc-ref init-hash 'state110)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 2))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
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
            (if (bitvector->bool (signal-value btor129)) btor109 btor110))
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
                          (bv 0 2))))))))
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
            (if (bitvector->bool (signal-value btor159)) btor109 btor144))
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
           (btor172
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
                          (bv 0 5))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor174
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
           (btor176
            (bv->signal
             (zero-extend (signal-value btor19) (bitvector 1))
             btor19))
           (btor177 (bv->signal (bv 9 (bitvector 4))))
           (btor178
            (bv->signal
             (zero-extend (signal-value btor177) (bitvector 5))
             btor177))
           (btor179
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor178)))
             (list)))
           (btor180
            (if (bitvector->bool (signal-value btor179)) btor36 btor95))
           (btor181 (bv->signal (bv 8 (bitvector 4))))
           (btor182
            (bv->signal
             (zero-extend (signal-value btor181) (bitvector 5))
             btor181))
           (btor183
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor182)))
             (list)))
           (btor184
            (if (bitvector->bool (signal-value btor183)) btor35 btor180))
           (btor185 (bv->signal (bv 7 (bitvector 3))))
           (btor186
            (bv->signal
             (zero-extend (signal-value btor185) (bitvector 5))
             btor185))
           (btor187
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor186)))
             (list)))
           (btor188
            (if (bitvector->bool (signal-value btor187)) btor34 btor184))
           (btor189
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor140)))
             (list)))
           (btor190
            (if (bitvector->bool (signal-value btor189)) btor95 btor188))
           (btor191 (bv->signal (bv 6 (bitvector 3))))
           (btor192
            (bv->signal
             (zero-extend (signal-value btor191) (bitvector 5))
             btor191))
           (btor193
            (signal
             (bool->bitvector
              (bveq (signal-value btor22) (signal-value btor192)))
             (list)))
           (btor194
            (if (bitvector->bool (signal-value btor193)) btor33 btor190))
           (btor195
            (bv->signal
             (zero-extend (signal-value btor194) (bitvector 1))
             btor194))
           (btor196
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor197
            (signal
             (bool->bitvector
              (bveq (signal-value btor21) (signal-value btor196)))
             (list)))
           (btor198
            (if (bitvector->bool (signal-value btor197)) btor26 btor95))
           (btor199
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor200
            (signal
             (bool->bitvector
              (bveq (signal-value btor21) (signal-value btor199)))
             (list)))
           (btor201
            (if (bitvector->bool (signal-value btor200)) btor25 btor198))
           (btor202
            (signal
             (apply bvor (bitvector->bits (signal-value btor21)))
             (signal-state btor21)))
           (btor203 (signal (bvnot (signal-value btor202)) (list)))
           (btor204
            (if (bitvector->bool (signal-value btor203)) btor24 btor201))
           (btor205
            (signal
             (bool->bitvector
              (bveq (signal-value btor21) (signal-value btor123)))
             (list)))
           (btor206
            (if (bitvector->bool (signal-value btor205)) btor95 btor204))
           (btor207
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor208
            (signal
             (bool->bitvector
              (bveq (signal-value btor21) (signal-value btor207)))
             (list)))
           (btor209
            (if (bitvector->bool (signal-value btor208)) btor27 btor206))
           (btor210
            (bv->signal
             (zero-extend (signal-value btor209) (bitvector 1))
             btor209))
           (btor211
            (if (bitvector->bool (signal-value btor179)) btor52 btor116))
           (btor212
            (if (bitvector->bool (signal-value btor183)) btor51 btor211))
           (btor213
            (if (bitvector->bool (signal-value btor187)) btor50 btor212))
           (btor214
            (if (bitvector->bool (signal-value btor189)) btor116 btor213))
           (btor215
            (if (bitvector->bool (signal-value btor193)) btor49 btor214))
           (btor216
            (bv->signal
             (zero-extend (signal-value btor215) (bitvector 1))
             btor215))
           (btor217
            (bv->signal
             (zero-extend (signal-value btor177) (bitvector 5))
             btor177))
           (btor218
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor217)))
             (list)))
           (btor219
            (if (bitvector->bool (signal-value btor218)) btor36 btor95))
           (btor220
            (bv->signal
             (zero-extend (signal-value btor181) (bitvector 5))
             btor181))
           (btor221
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor220)))
             (list)))
           (btor222
            (if (bitvector->bool (signal-value btor221)) btor35 btor219))
           (btor223
            (bv->signal
             (zero-extend (signal-value btor185) (bitvector 5))
             btor185))
           (btor224
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor223)))
             (list)))
           (btor225
            (if (bitvector->bool (signal-value btor224)) btor34 btor222))
           (btor226
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor140)))
             (list)))
           (btor227
            (if (bitvector->bool (signal-value btor226)) btor95 btor225))
           (btor228
            (bv->signal
             (zero-extend (signal-value btor191) (bitvector 5))
             btor191))
           (btor229
            (signal
             (bool->bitvector
              (bveq (signal-value btor23) (signal-value btor228)))
             (list)))
           (btor230
            (if (bitvector->bool (signal-value btor229)) btor33 btor227))
           (btor231
            (bv->signal
             (zero-extend (signal-value btor230) (bitvector 1))
             btor230))
           (btor232
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor233
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor232)))
             (list)))
           (btor234
            (if (bitvector->bool (signal-value btor233)) btor26 btor95))
           (btor235
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor236
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor235)))
             (list)))
           (btor237
            (if (bitvector->bool (signal-value btor236)) btor25 btor234))
           (btor238
            (signal
             (apply bvor (bitvector->bits (signal-value btor20)))
             (signal-state btor20)))
           (btor239 (signal (bvnot (signal-value btor238)) (list)))
           (btor240
            (if (bitvector->bool (signal-value btor239)) btor24 btor237))
           (btor241
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor123)))
             (list)))
           (btor242
            (if (bitvector->bool (signal-value btor241)) btor95 btor240))
           (btor243
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor244
            (signal
             (bool->bitvector
              (bveq (signal-value btor20) (signal-value btor243)))
             (list)))
           (btor245
            (if (bitvector->bool (signal-value btor244)) btor27 btor242))
           (btor246
            (bv->signal
             (zero-extend (signal-value btor245) (bitvector 1))
             btor245))
           (btor247
            (if (bitvector->bool (signal-value btor218)) btor52 btor116))
           (btor248
            (if (bitvector->bool (signal-value btor221)) btor51 btor247))
           (btor249
            (if (bitvector->bool (signal-value btor224)) btor50 btor248))
           (btor250
            (if (bitvector->bool (signal-value btor226)) btor116 btor249))
           (btor251
            (if (bitvector->bool (signal-value btor229)) btor49 btor250))
           (btor252
            (bv->signal
             (zero-extend (signal-value btor251) (bitvector 1))
             btor251))
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
           (btor255
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor256
            (signal
             (bool->bitvector
              (bveq (signal-value btor30) (signal-value btor255)))
             (list)))
           (btor257
            (if (bitvector->bool (signal-value btor256)) btor26 btor95))
           (btor258
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor259
            (signal
             (bool->bitvector
              (bveq (signal-value btor30) (signal-value btor258)))
             (list)))
           (btor260
            (if (bitvector->bool (signal-value btor259)) btor25 btor257))
           (btor261
            (signal
             (apply bvor (bitvector->bits (signal-value btor30)))
             (signal-state btor30)))
           (btor262 (signal (bvnot (signal-value btor261)) (list)))
           (btor263
            (if (bitvector->bool (signal-value btor262)) btor24 btor260))
           (btor264
            (signal
             (bool->bitvector
              (bveq (signal-value btor30) (signal-value btor123)))
             (list)))
           (btor265
            (if (bitvector->bool (signal-value btor264)) btor95 btor263))
           (btor266
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor267
            (signal
             (bool->bitvector
              (bveq (signal-value btor30) (signal-value btor266)))
             (list)))
           (btor268
            (if (bitvector->bool (signal-value btor267)) btor27 btor265))
           (btor269
            (if (bitvector->bool (signal-value btor268)) btor95 btor253))
           (btor270
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state270)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state270)))
                     ((assoc-has-key? init-hash 'state270)
                      (bv->signal (assoc-ref init-hash 'state270)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor272
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor273
            (signal
             (bool->bitvector
              (bveq (signal-value btor29) (signal-value btor272)))
             (list)))
           (btor274
            (if (bitvector->bool (signal-value btor273)) btor26 btor95))
           (btor275
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor276
            (signal
             (bool->bitvector
              (bveq (signal-value btor29) (signal-value btor275)))
             (list)))
           (btor277
            (if (bitvector->bool (signal-value btor276)) btor25 btor274))
           (btor278
            (signal
             (apply bvor (bitvector->bits (signal-value btor29)))
             (signal-state btor29)))
           (btor279 (signal (bvnot (signal-value btor278)) (list)))
           (btor280
            (if (bitvector->bool (signal-value btor279)) btor24 btor277))
           (btor281
            (signal
             (bool->bitvector
              (bveq (signal-value btor29) (signal-value btor123)))
             (list)))
           (btor282
            (if (bitvector->bool (signal-value btor281)) btor95 btor280))
           (btor283
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor284
            (signal
             (bool->bitvector
              (bveq (signal-value btor29) (signal-value btor283)))
             (list)))
           (btor285
            (if (bitvector->bool (signal-value btor284)) btor27 btor282))
           (btor286
            (if (bitvector->bool (signal-value btor285)) btor95 btor270))
           (btor287
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor140)))
             (list)))
           (btor288
            (if (bitvector->bool (signal-value btor287)) btor28 btor286))
           (btor289
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor140)))
             (list)))
           (btor290
            (if (bitvector->bool (signal-value btor289)) btor288 btor269))
           (btor291 (bv->signal (bv 4 (bitvector 3))))
           (btor292
            (bv->signal
             (zero-extend (signal-value btor291) (bitvector 5))
             btor291))
           (btor293
            (signal
             (bool->bitvector
              (bveq (signal-value btor2) (signal-value btor292)))
             (list)))
           (btor294
            (if (bitvector->bool (signal-value btor293)) btor116 btor95))
           (btor295 (bv->signal (bv 15 (bitvector 4))))
           (btor296
            (bv->signal
             (zero-extend (signal-value btor295) (bitvector 5))
             btor295))
           (btor297
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor296)))
             (list)))
           (btor298
            (if (bitvector->bool (signal-value btor297)) btor294 btor290))
           (btor299 (bv->signal (bv 16 (bitvector 5))))
           (btor300
            (signal
             (bool->bitvector
              (bveq (signal-value btor75) (signal-value btor299)))
             (list)))
           (btor301
            (if (bitvector->bool (signal-value btor300)) btor290 btor298))
           (btor302
            (bv->signal
             (zero-extend (signal-value btor301) (bitvector 1))
             btor301))
           (btor303
            (bv->signal
             (zero-extend (signal-value btor288) (bitvector 1))
             btor288))
           (btor304
            (bv->signal
             (zero-extend (signal-value btor269) (bitvector 1))
             btor269))
           (btor305
            (bv->signal
             (zero-extend (signal-value btor290) (bitvector 1))
             btor290))
           (btor306
            (bv->signal
             (zero-extend (signal-value btor177) (bitvector 5))
             btor177))
           (btor307
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor306)))
             (list)))
           (btor308
            (if (bitvector->bool (signal-value btor307)) btor36 btor95))
           (btor309
            (bv->signal
             (zero-extend (signal-value btor181) (bitvector 5))
             btor181))
           (btor310
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor309)))
             (list)))
           (btor311
            (if (bitvector->bool (signal-value btor310)) btor35 btor308))
           (btor312
            (bv->signal
             (zero-extend (signal-value btor185) (bitvector 5))
             btor185))
           (btor313
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor312)))
             (list)))
           (btor314
            (if (bitvector->bool (signal-value btor313)) btor34 btor311))
           (btor315
            (if (bitvector->bool (signal-value btor289)) btor95 btor314))
           (btor316
            (bv->signal
             (zero-extend (signal-value btor191) (bitvector 5))
             btor191))
           (btor317
            (signal
             (bool->bitvector
              (bveq (signal-value btor31) (signal-value btor316)))
             (list)))
           (btor318
            (if (bitvector->bool (signal-value btor317)) btor33 btor315))
           (btor319
            (bv->signal
             (zero-extend (signal-value btor318) (bitvector 1))
             btor318))
           (btor320
            (bv->signal
             (zero-extend (signal-value btor268) (bitvector 1))
             btor268))
           (btor321
            (if (bitvector->bool (signal-value btor307)) btor52 btor116))
           (btor322
            (if (bitvector->bool (signal-value btor310)) btor51 btor321))
           (btor323
            (if (bitvector->bool (signal-value btor313)) btor50 btor322))
           (btor324
            (if (bitvector->bool (signal-value btor289)) btor116 btor323))
           (btor325
            (if (bitvector->bool (signal-value btor317)) btor49 btor324))
           (btor326
            (bv->signal
             (zero-extend (signal-value btor325) (bitvector 1))
             btor325))
           (btor327
            (bv->signal
             (zero-extend (signal-value btor286) (bitvector 1))
             btor286))
           (btor328
            (bv->signal
             (zero-extend (signal-value btor288) (bitvector 1))
             btor288))
           (btor329
            (bv->signal
             (zero-extend (signal-value btor177) (bitvector 5))
             btor177))
           (btor330
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor329)))
             (list)))
           (btor331
            (if (bitvector->bool (signal-value btor330)) btor36 btor95))
           (btor332
            (bv->signal
             (zero-extend (signal-value btor181) (bitvector 5))
             btor181))
           (btor333
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor332)))
             (list)))
           (btor334
            (if (bitvector->bool (signal-value btor333)) btor35 btor331))
           (btor335
            (bv->signal
             (zero-extend (signal-value btor185) (bitvector 5))
             btor185))
           (btor336
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor335)))
             (list)))
           (btor337
            (if (bitvector->bool (signal-value btor336)) btor34 btor334))
           (btor338
            (if (bitvector->bool (signal-value btor287)) btor95 btor337))
           (btor339
            (bv->signal
             (zero-extend (signal-value btor191) (bitvector 5))
             btor191))
           (btor340
            (signal
             (bool->bitvector
              (bveq (signal-value btor32) (signal-value btor339)))
             (list)))
           (btor341
            (if (bitvector->bool (signal-value btor340)) btor33 btor338))
           (btor342
            (bv->signal
             (zero-extend (signal-value btor341) (bitvector 1))
             btor341))
           (btor343
            (bv->signal
             (zero-extend (signal-value btor285) (bitvector 1))
             btor285))
           (btor344
            (if (bitvector->bool (signal-value btor330)) btor52 btor116))
           (btor345
            (if (bitvector->bool (signal-value btor333)) btor51 btor344))
           (btor346
            (if (bitvector->bool (signal-value btor336)) btor50 btor345))
           (btor347
            (if (bitvector->bool (signal-value btor287)) btor116 btor346))
           (btor348
            (if (bitvector->bool (signal-value btor340)) btor49 btor347))
           (btor349
            (bv->signal
             (zero-extend (signal-value btor348) (bitvector 1))
             btor348))
           (btor350
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
           (btor352 (bitvector 32))
           (btor353 (bv->signal (bv 0 (bitvector 32))))
           (btor354
            (bv->signal
             (zero-extend (signal-value btor353) (bitvector 32))
             btor353))
           (btor355
            (bv->signal
             (zero-extend (signal-value btor353) (bitvector 32))
             btor353))
           (btor356
            (bv->signal
             (zero-extend (signal-value btor177) (bitvector 5))
             btor177))
           (btor357
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor356)))
             (list)))
           (btor358
            (if (bitvector->bool (signal-value btor357)) btor36 btor95))
           (btor359
            (bv->signal
             (zero-extend (signal-value btor181) (bitvector 5))
             btor181))
           (btor360
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor359)))
             (list)))
           (btor361
            (if (bitvector->bool (signal-value btor360)) btor35 btor358))
           (btor362
            (bv->signal
             (zero-extend (signal-value btor185) (bitvector 5))
             btor185))
           (btor363
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor362)))
             (list)))
           (btor364
            (if (bitvector->bool (signal-value btor363)) btor34 btor361))
           (btor365
            (if (bitvector->bool (signal-value btor141)) btor95 btor364))
           (btor366
            (bv->signal
             (zero-extend (signal-value btor191) (bitvector 5))
             btor191))
           (btor367
            (signal
             (bool->bitvector
              (bveq (signal-value btor55) (signal-value btor366)))
             (list)))
           (btor368
            (if (bitvector->bool (signal-value btor367)) btor33 btor365))
           (btor369
            (bv->signal
             (zero-extend (signal-value btor368) (bitvector 1))
             btor368))
           (btor370
            (bv->signal
             (zero-extend (signal-value btor129) (bitvector 1))
             btor129))
           (btor371
            (if (bitvector->bool (signal-value btor357)) btor52 btor116))
           (btor372
            (if (bitvector->bool (signal-value btor360)) btor51 btor371))
           (btor373
            (if (bitvector->bool (signal-value btor363)) btor50 btor372))
           (btor374
            (if (bitvector->bool (signal-value btor141)) btor116 btor373))
           (btor375
            (if (bitvector->bool (signal-value btor367)) btor49 btor374))
           (btor376
            (bv->signal
             (zero-extend (signal-value btor375) (bitvector 1))
             btor375))
           (btor377
            (bv->signal
             (zero-extend (signal-value btor177) (bitvector 5))
             btor177))
           (btor378
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor377)))
             (list)))
           (btor379
            (if (bitvector->bool (signal-value btor378)) btor36 btor95))
           (btor380
            (bv->signal
             (zero-extend (signal-value btor181) (bitvector 5))
             btor181))
           (btor381
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor380)))
             (list)))
           (btor382
            (if (bitvector->bool (signal-value btor381)) btor35 btor379))
           (btor383
            (bv->signal
             (zero-extend (signal-value btor185) (bitvector 5))
             btor185))
           (btor384
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor383)))
             (list)))
           (btor385
            (if (bitvector->bool (signal-value btor384)) btor34 btor382))
           (btor386
            (if (bitvector->bool (signal-value btor169)) btor95 btor385))
           (btor387
            (bv->signal
             (zero-extend (signal-value btor191) (bitvector 5))
             btor191))
           (btor388
            (signal
             (bool->bitvector
              (bveq (signal-value btor56) (signal-value btor387)))
             (list)))
           (btor389
            (if (bitvector->bool (signal-value btor388)) btor33 btor386))
           (btor390
            (bv->signal
             (zero-extend (signal-value btor389) (bitvector 1))
             btor389))
           (btor391
            (bv->signal
             (zero-extend (signal-value btor159) (bitvector 1))
             btor159))
           (btor392
            (if (bitvector->bool (signal-value btor378)) btor52 btor116))
           (btor393
            (if (bitvector->bool (signal-value btor381)) btor51 btor392))
           (btor394
            (if (bitvector->bool (signal-value btor384)) btor50 btor393))
           (btor395
            (if (bitvector->bool (signal-value btor169)) btor116 btor394))
           (btor396
            (if (bitvector->bool (signal-value btor388)) btor49 btor395))
           (btor397
            (bv->signal
             (zero-extend (signal-value btor396) (bitvector 1))
             btor396))
           (btor398 unnamed-input-398)
           (btor399
            (bv->signal
             (zero-extend (signal-value btor398) (bitvector 1))
             btor398))
           (btor400 unnamed-input-400)
           (btor401
            (bv->signal
             (zero-extend (signal-value btor400) (bitvector 1))
             btor400))
           (btor402 (bitvector 8))
           (btor403 (bv->signal (bv 0 (bitvector 8))))
           (btor404
            (bv->signal
             (zero-extend (signal-value btor403) (bitvector 8))
             btor403))
           (btor405 (signal (bvnot (signal-value btor142)) (list)))
           (btor406
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 2))
             btor116))
           (btor407
            (signal
             (bvadd (signal-value btor405) (signal-value btor406))
             (list)))
           (btor408
            (signal
             (extract 1 1 (signal-value btor142))
             (signal-state btor142)))
           (btor409
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state409)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state409)))
                     ((assoc-has-key? init-hash 'state409)
                      (bv->signal (assoc-ref init-hash 'state409)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor411
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor412
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor411)))
             (list)))
           (btor413
            (if (bitvector->bool (signal-value btor412)) btor26 btor95))
           (btor414
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor415
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor414)))
             (list)))
           (btor416
            (if (bitvector->bool (signal-value btor415)) btor25 btor413))
           (btor417
            (signal
             (apply bvor (bitvector->bits (signal-value btor83)))
             (signal-state btor83)))
           (btor418 (signal (bvnot (signal-value btor417)) (list)))
           (btor419
            (if (bitvector->bool (signal-value btor418)) btor24 btor416))
           (btor420
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor123)))
             (list)))
           (btor421
            (if (bitvector->bool (signal-value btor420)) btor95 btor419))
           (btor422
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor423
            (signal
             (bool->bitvector
              (bveq (signal-value btor83) (signal-value btor422)))
             (list)))
           (btor424
            (if (bitvector->bool (signal-value btor423)) btor27 btor421))
           (btor425
            (if (bitvector->bool (signal-value btor424)) btor95 btor409))
           (btor426
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor140)))
             (list)))
           (btor427
            (if (bitvector->bool (signal-value btor426)) btor91 btor425))
           (btor428 (bv->signal (bv 19 (bitvector 5))))
           (btor429
            (signal
             (bool->bitvector
              (bveq (signal-value btor79) (signal-value btor428)))
             (list)))
           (btor430
            (if (bitvector->bool (signal-value btor429)) btor116 btor95))
           (btor431
            (bv->signal
             (zero-extend (signal-value btor295) (bitvector 5))
             btor295))
           (btor432
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor431)))
             (list)))
           (btor433
            (if (bitvector->bool (signal-value btor432)) btor430 btor427))
           (btor434
            (signal
             (bool->bitvector
              (bveq (signal-value btor77) (signal-value btor299)))
             (list)))
           (btor435
            (if (bitvector->bool (signal-value btor434)) btor427 btor433))
           (btor436
            (signal
             (bvand (signal-value btor408) (signal-value btor435))
             (list)))
           (btor437
            (if (bitvector->bool (signal-value btor436)) btor407 btor142))
           (btor438
            (bv->signal
             (zero-extend (signal-value btor437) (bitvector 2))
             btor437))
           (btor439
            (bv->signal
             (zero-extend (signal-value btor130) (bitvector 2))
             btor130))
           (btor440
            (bv->signal
             (zero-extend (signal-value btor139) (bitvector 2))
             btor139))
           (btor441
            (bv->signal
             (zero-extend (signal-value btor142) (bitvector 2))
             btor142))
           (btor442 (signal (bvnot (signal-value btor170)) (list)))
           (btor443
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 2))
             btor116))
           (btor444
            (signal
             (bvadd (signal-value btor442) (signal-value btor443))
             (list)))
           (btor445
            (signal
             (extract 1 1 (signal-value btor170))
             (signal-state btor170)))
           (btor446
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state446)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state446)))
                     ((assoc-has-key? init-hash 'state446)
                      (bv->signal (assoc-ref init-hash 'state446)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor448
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor449
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor448)))
             (list)))
           (btor450
            (if (bitvector->bool (signal-value btor449)) btor26 btor95))
           (btor451
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor452
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor451)))
             (list)))
           (btor453
            (if (bitvector->bool (signal-value btor452)) btor25 btor450))
           (btor454
            (signal
             (apply bvor (bitvector->bits (signal-value btor84)))
             (signal-state btor84)))
           (btor455 (signal (bvnot (signal-value btor454)) (list)))
           (btor456
            (if (bitvector->bool (signal-value btor455)) btor24 btor453))
           (btor457
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor123)))
             (list)))
           (btor458
            (if (bitvector->bool (signal-value btor457)) btor95 btor456))
           (btor459
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor460
            (signal
             (bool->bitvector
              (bveq (signal-value btor84) (signal-value btor459)))
             (list)))
           (btor461
            (if (bitvector->bool (signal-value btor460)) btor27 btor458))
           (btor462
            (if (bitvector->bool (signal-value btor461)) btor95 btor446))
           (btor463
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor140)))
             (list)))
           (btor464
            (if (bitvector->bool (signal-value btor463)) btor92 btor462))
           (btor465
            (signal
             (bool->bitvector
              (bveq (signal-value btor80) (signal-value btor428)))
             (list)))
           (btor466
            (if (bitvector->bool (signal-value btor465)) btor116 btor95))
           (btor467
            (bv->signal
             (zero-extend (signal-value btor295) (bitvector 5))
             btor295))
           (btor468
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor467)))
             (list)))
           (btor469
            (if (bitvector->bool (signal-value btor468)) btor466 btor464))
           (btor470
            (signal
             (bool->bitvector
              (bveq (signal-value btor78) (signal-value btor299)))
             (list)))
           (btor471
            (if (bitvector->bool (signal-value btor470)) btor464 btor469))
           (btor472
            (signal
             (bvand (signal-value btor445) (signal-value btor471))
             (list)))
           (btor473
            (if (bitvector->bool (signal-value btor472)) btor444 btor170))
           (btor474
            (bv->signal
             (zero-extend (signal-value btor473) (bitvector 2))
             btor473))
           (btor475
            (bv->signal
             (zero-extend (signal-value btor160) (bitvector 2))
             btor160))
           (btor476
            (bv->signal
             (zero-extend (signal-value btor168) (bitvector 2))
             btor168))
           (btor477
            (bv->signal
             (zero-extend (signal-value btor170) (bitvector 2))
             btor170))
           (btor478
            (bv->signal
             (zero-extend (signal-value btor437) (bitvector 4))
             btor437))
           (btor479
            (bv->signal
             (zero-extend (signal-value btor473) (bitvector 4))
             btor473))
           (btor480
            (signal
             (bvmul (signal-value btor478) (signal-value btor479))
             (list)))
           (btor481 unnamed-input-481)
           (btor482
            (signal
             (bvsub (signal-value btor481) (signal-value btor480))
             (list)))
           (btor483
            (signal
             (bvxor (signal-value btor436) (signal-value btor472))
             (list)))
           (btor484
            (if (bitvector->bool (signal-value btor483)) btor482 btor480))
           (btor485
            (bv->signal
             (zero-extend (signal-value btor484) (bitvector 4))
             btor484))
           (btor486
            (bv->signal
             (zero-extend (signal-value btor95) (bitvector 1))
             btor95))
           (btor487
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state487)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state487)))
                     ((assoc-has-key? init-hash 'state487)
                      (bv->signal (assoc-ref init-hash 'state487)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor489
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor490
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor489)))
             (list)))
           (btor491
            (if (bitvector->bool (signal-value btor490)) btor26 btor95))
           (btor492
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor493
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor492)))
             (list)))
           (btor494
            (if (bitvector->bool (signal-value btor493)) btor25 btor491))
           (btor495
            (signal
             (apply bvor (bitvector->bits (signal-value btor70)))
             (signal-state btor70)))
           (btor496 (signal (bvnot (signal-value btor495)) (list)))
           (btor497
            (if (bitvector->bool (signal-value btor496)) btor24 btor494))
           (btor498
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor123)))
             (list)))
           (btor499
            (if (bitvector->bool (signal-value btor498)) btor95 btor497))
           (btor500
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor501
            (signal
             (bool->bitvector
              (bveq (signal-value btor70) (signal-value btor500)))
             (list)))
           (btor502
            (if (bitvector->bool (signal-value btor501)) btor27 btor499))
           (btor503
            (if (bitvector->bool (signal-value btor502)) btor95 btor487))
           (btor504
            (bv->signal
             (zero-extend (signal-value btor503) (bitvector 1))
             btor503))
           (btor505
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor140)))
             (list)))
           (btor506
            (if (bitvector->bool (signal-value btor505)) btor95 btor503))
           (btor507
            (bv->signal
             (zero-extend (signal-value btor506) (bitvector 1))
             btor506))
           (btor508
            (bv->signal
             (zero-extend (signal-value btor484) (bitvector 4))
             btor484))
           (btor509 (bv->signal (bv 0 (bitvector 4))))
           (btor510
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state510)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state510)))
                     ((assoc-has-key? init-hash 'state510)
                      (bv->signal (assoc-ref init-hash 'state510)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 4))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor512
            (if (bitvector->bool (signal-value btor502)) btor509 btor510))
           (btor513
            (bv->signal
             (zero-extend (signal-value btor512) (bitvector 4))
             btor512))
           (btor514
            (bv->signal
             (zero-extend (signal-value btor95) (bitvector 1))
             btor95))
           (btor515
            (bv->signal
             (zero-extend (signal-value btor177) (bitvector 5))
             btor177))
           (btor516
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor515)))
             (list)))
           (btor517
            (if (bitvector->bool (signal-value btor516)) btor36 btor95))
           (btor518
            (bv->signal
             (zero-extend (signal-value btor181) (bitvector 5))
             btor181))
           (btor519
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor518)))
             (list)))
           (btor520
            (if (bitvector->bool (signal-value btor519)) btor35 btor517))
           (btor521
            (bv->signal
             (zero-extend (signal-value btor185) (bitvector 5))
             btor185))
           (btor522
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor521)))
             (list)))
           (btor523
            (if (bitvector->bool (signal-value btor522)) btor34 btor520))
           (btor524
            (if (bitvector->bool (signal-value btor505)) btor95 btor523))
           (btor525
            (bv->signal
             (zero-extend (signal-value btor191) (bitvector 5))
             btor191))
           (btor526
            (signal
             (bool->bitvector
              (bveq (signal-value btor71) (signal-value btor525)))
             (list)))
           (btor527
            (if (bitvector->bool (signal-value btor526)) btor33 btor524))
           (btor528
            (bv->signal
             (zero-extend (signal-value btor527) (bitvector 1))
             btor527))
           (btor529
            (bv->signal
             (zero-extend (signal-value btor502) (bitvector 1))
             btor502))
           (btor530
            (if (bitvector->bool (signal-value btor516)) btor52 btor116))
           (btor531
            (if (bitvector->bool (signal-value btor519)) btor51 btor530))
           (btor532
            (if (bitvector->bool (signal-value btor522)) btor50 btor531))
           (btor533
            (if (bitvector->bool (signal-value btor505)) btor116 btor532))
           (btor534
            (if (bitvector->bool (signal-value btor526)) btor49 btor533))
           (btor535
            (bv->signal
             (zero-extend (signal-value btor534) (bitvector 1))
             btor534))
           (btor536
            (bv->signal
             (zero-extend (signal-value btor436) (bitvector 1))
             btor436))
           (btor537
            (bv->signal
             (zero-extend (signal-value btor472) (bitvector 1))
             btor472))
           (btor538
            (bv->signal
             (zero-extend (signal-value btor177) (bitvector 5))
             btor177))
           (btor539
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor538)))
             (list)))
           (btor540
            (if (bitvector->bool (signal-value btor539)) btor36 btor95))
           (btor541
            (bv->signal
             (zero-extend (signal-value btor181) (bitvector 5))
             btor181))
           (btor542
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor541)))
             (list)))
           (btor543
            (if (bitvector->bool (signal-value btor542)) btor35 btor540))
           (btor544
            (bv->signal
             (zero-extend (signal-value btor185) (bitvector 5))
             btor185))
           (btor545
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor544)))
             (list)))
           (btor546
            (if (bitvector->bool (signal-value btor545)) btor34 btor543))
           (btor547
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor140)))
             (list)))
           (btor548
            (if (bitvector->bool (signal-value btor547)) btor95 btor546))
           (btor549
            (bv->signal
             (zero-extend (signal-value btor191) (bitvector 5))
             btor191))
           (btor550
            (signal
             (bool->bitvector
              (bveq (signal-value btor73) (signal-value btor549)))
             (list)))
           (btor551
            (if (bitvector->bool (signal-value btor550)) btor33 btor548))
           (btor552
            (bv->signal
             (zero-extend (signal-value btor551) (bitvector 1))
             btor551))
           (btor553
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor554
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor553)))
             (list)))
           (btor555
            (if (bitvector->bool (signal-value btor554)) btor26 btor95))
           (btor556
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor557
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor556)))
             (list)))
           (btor558
            (if (bitvector->bool (signal-value btor557)) btor25 btor555))
           (btor559
            (signal
             (apply bvor (bitvector->bits (signal-value btor72)))
             (signal-state btor72)))
           (btor560 (signal (bvnot (signal-value btor559)) (list)))
           (btor561
            (if (bitvector->bool (signal-value btor560)) btor24 btor558))
           (btor562
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor123)))
             (list)))
           (btor563
            (if (bitvector->bool (signal-value btor562)) btor95 btor561))
           (btor564
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor565
            (signal
             (bool->bitvector
              (bveq (signal-value btor72) (signal-value btor564)))
             (list)))
           (btor566
            (if (bitvector->bool (signal-value btor565)) btor27 btor563))
           (btor567
            (bv->signal
             (zero-extend (signal-value btor566) (bitvector 1))
             btor566))
           (btor568
            (if (bitvector->bool (signal-value btor539)) btor52 btor116))
           (btor569
            (if (bitvector->bool (signal-value btor542)) btor51 btor568))
           (btor570
            (if (bitvector->bool (signal-value btor545)) btor50 btor569))
           (btor571
            (if (bitvector->bool (signal-value btor547)) btor116 btor570))
           (btor572
            (if (bitvector->bool (signal-value btor550)) btor49 btor571))
           (btor573
            (bv->signal
             (zero-extend (signal-value btor572) (bitvector 1))
             btor572))
           (btor574
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
           (btor576
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
                          (bv 0 5))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor578
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state578)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state578)))
                     ((assoc-has-key? init-hash 'state578)
                      (bv->signal (assoc-ref init-hash 'state578)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor580
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor581
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor580)))
             (list)))
           (btor582
            (if (bitvector->bool (signal-value btor581)) btor26 btor95))
           (btor583
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor584
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor583)))
             (list)))
           (btor585
            (if (bitvector->bool (signal-value btor584)) btor25 btor582))
           (btor586
            (signal
             (apply bvor (bitvector->bits (signal-value btor85)))
             (signal-state btor85)))
           (btor587 (signal (bvnot (signal-value btor586)) (list)))
           (btor588
            (if (bitvector->bool (signal-value btor587)) btor24 btor585))
           (btor589
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor123)))
             (list)))
           (btor590
            (if (bitvector->bool (signal-value btor589)) btor95 btor588))
           (btor591
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor592
            (signal
             (bool->bitvector
              (bveq (signal-value btor85) (signal-value btor591)))
             (list)))
           (btor593
            (if (bitvector->bool (signal-value btor592)) btor27 btor590))
           (btor594
            (if (bitvector->bool (signal-value btor593)) btor95 btor578))
           (btor595
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor140)))
             (list)))
           (btor596
            (if (bitvector->bool (signal-value btor595)) btor427 btor594))
           (btor597
            (if (bitvector->bool (signal-value btor432)) btor430 btor596))
           (btor598
            (if (bitvector->bool (signal-value btor434)) btor596 btor597))
           (btor599
            (bv->signal
             (zero-extend (signal-value btor598) (bitvector 1))
             btor598))
           (btor600
            (bv->signal
             (zero-extend (signal-value btor594) (bitvector 1))
             btor594))
           (btor601
            (bv->signal
             (zero-extend (signal-value btor596) (bitvector 1))
             btor596))
           (btor602
            (bv->signal
             (zero-extend (signal-value btor425) (bitvector 1))
             btor425))
           (btor603
            (bv->signal
             (zero-extend (signal-value btor435) (bitvector 1))
             btor435))
           (btor604
            (bv->signal
             (zero-extend (signal-value btor427) (bitvector 1))
             btor427))
           (btor605
            (bv->signal
             (zero-extend (signal-value btor177) (bitvector 5))
             btor177))
           (btor606
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor605)))
             (list)))
           (btor607
            (if (bitvector->bool (signal-value btor606)) btor36 btor95))
           (btor608
            (bv->signal
             (zero-extend (signal-value btor181) (bitvector 5))
             btor181))
           (btor609
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor608)))
             (list)))
           (btor610
            (if (bitvector->bool (signal-value btor609)) btor35 btor607))
           (btor611
            (bv->signal
             (zero-extend (signal-value btor185) (bitvector 5))
             btor185))
           (btor612
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor611)))
             (list)))
           (btor613
            (if (bitvector->bool (signal-value btor612)) btor34 btor610))
           (btor614
            (if (bitvector->bool (signal-value btor426)) btor95 btor613))
           (btor615
            (bv->signal
             (zero-extend (signal-value btor191) (bitvector 5))
             btor191))
           (btor616
            (signal
             (bool->bitvector
              (bveq (signal-value btor89) (signal-value btor615)))
             (list)))
           (btor617
            (if (bitvector->bool (signal-value btor616)) btor33 btor614))
           (btor618
            (bv->signal
             (zero-extend (signal-value btor617) (bitvector 1))
             btor617))
           (btor619
            (bv->signal
             (zero-extend (signal-value btor424) (bitvector 1))
             btor424))
           (btor620
            (if (bitvector->bool (signal-value btor606)) btor52 btor116))
           (btor621
            (if (bitvector->bool (signal-value btor609)) btor51 btor620))
           (btor622
            (if (bitvector->bool (signal-value btor612)) btor50 btor621))
           (btor623
            (if (bitvector->bool (signal-value btor426)) btor116 btor622))
           (btor624
            (if (bitvector->bool (signal-value btor616)) btor49 btor623))
           (btor625
            (bv->signal
             (zero-extend (signal-value btor624) (bitvector 1))
             btor624))
           (btor626
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state626)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state626)))
                     ((assoc-has-key? init-hash 'state626)
                      (bv->signal (assoc-ref init-hash 'state626)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor628
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor629
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor628)))
             (list)))
           (btor630
            (if (bitvector->bool (signal-value btor629)) btor26 btor95))
           (btor631
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor632
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor631)))
             (list)))
           (btor633
            (if (bitvector->bool (signal-value btor632)) btor25 btor630))
           (btor634
            (signal
             (apply bvor (bitvector->bits (signal-value btor86)))
             (signal-state btor86)))
           (btor635 (signal (bvnot (signal-value btor634)) (list)))
           (btor636
            (if (bitvector->bool (signal-value btor635)) btor24 btor633))
           (btor637
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor123)))
             (list)))
           (btor638
            (if (bitvector->bool (signal-value btor637)) btor95 btor636))
           (btor639
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor640
            (signal
             (bool->bitvector
              (bveq (signal-value btor86) (signal-value btor639)))
             (list)))
           (btor641
            (if (bitvector->bool (signal-value btor640)) btor27 btor638))
           (btor642
            (if (bitvector->bool (signal-value btor641)) btor95 btor626))
           (btor643
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor140)))
             (list)))
           (btor644
            (if (bitvector->bool (signal-value btor643)) btor464 btor642))
           (btor645
            (if (bitvector->bool (signal-value btor468)) btor466 btor644))
           (btor646
            (if (bitvector->bool (signal-value btor470)) btor644 btor645))
           (btor647
            (bv->signal
             (zero-extend (signal-value btor646) (bitvector 1))
             btor646))
           (btor648
            (bv->signal
             (zero-extend (signal-value btor642) (bitvector 1))
             btor642))
           (btor649
            (bv->signal
             (zero-extend (signal-value btor644) (bitvector 1))
             btor644))
           (btor650
            (bv->signal
             (zero-extend (signal-value btor462) (bitvector 1))
             btor462))
           (btor651
            (bv->signal
             (zero-extend (signal-value btor471) (bitvector 1))
             btor471))
           (btor652
            (bv->signal
             (zero-extend (signal-value btor464) (bitvector 1))
             btor464))
           (btor653
            (bv->signal
             (zero-extend (signal-value btor177) (bitvector 5))
             btor177))
           (btor654
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor653)))
             (list)))
           (btor655
            (if (bitvector->bool (signal-value btor654)) btor36 btor95))
           (btor656
            (bv->signal
             (zero-extend (signal-value btor181) (bitvector 5))
             btor181))
           (btor657
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor656)))
             (list)))
           (btor658
            (if (bitvector->bool (signal-value btor657)) btor35 btor655))
           (btor659
            (bv->signal
             (zero-extend (signal-value btor185) (bitvector 5))
             btor185))
           (btor660
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor659)))
             (list)))
           (btor661
            (if (bitvector->bool (signal-value btor660)) btor34 btor658))
           (btor662
            (if (bitvector->bool (signal-value btor463)) btor95 btor661))
           (btor663
            (bv->signal
             (zero-extend (signal-value btor191) (bitvector 5))
             btor191))
           (btor664
            (signal
             (bool->bitvector
              (bveq (signal-value btor90) (signal-value btor663)))
             (list)))
           (btor665
            (if (bitvector->bool (signal-value btor664)) btor33 btor662))
           (btor666
            (bv->signal
             (zero-extend (signal-value btor665) (bitvector 1))
             btor665))
           (btor667
            (bv->signal
             (zero-extend (signal-value btor461) (bitvector 1))
             btor461))
           (btor668
            (if (bitvector->bool (signal-value btor654)) btor52 btor116))
           (btor669
            (if (bitvector->bool (signal-value btor657)) btor51 btor668))
           (btor670
            (if (bitvector->bool (signal-value btor660)) btor50 btor669))
           (btor671
            (if (bitvector->bool (signal-value btor463)) btor116 btor670))
           (btor672
            (if (bitvector->bool (signal-value btor664)) btor49 btor671))
           (btor673
            (bv->signal
             (zero-extend (signal-value btor672) (bitvector 1))
             btor672))
           (btor674
            (bv->signal
             (zero-extend (signal-value btor177) (bitvector 5))
             btor177))
           (btor675
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor674)))
             (list)))
           (btor676
            (if (bitvector->bool (signal-value btor675)) btor36 btor95))
           (btor677
            (bv->signal
             (zero-extend (signal-value btor181) (bitvector 5))
             btor181))
           (btor678
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor677)))
             (list)))
           (btor679
            (if (bitvector->bool (signal-value btor678)) btor35 btor676))
           (btor680
            (bv->signal
             (zero-extend (signal-value btor185) (bitvector 5))
             btor185))
           (btor681
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor680)))
             (list)))
           (btor682
            (if (bitvector->bool (signal-value btor681)) btor34 btor679))
           (btor683
            (if (bitvector->bool (signal-value btor595)) btor95 btor682))
           (btor684
            (bv->signal
             (zero-extend (signal-value btor191) (bitvector 5))
             btor191))
           (btor685
            (signal
             (bool->bitvector
              (bveq (signal-value btor87) (signal-value btor684)))
             (list)))
           (btor686
            (if (bitvector->bool (signal-value btor685)) btor33 btor683))
           (btor687
            (bv->signal
             (zero-extend (signal-value btor686) (bitvector 1))
             btor686))
           (btor688
            (bv->signal
             (zero-extend (signal-value btor593) (bitvector 1))
             btor593))
           (btor689
            (if (bitvector->bool (signal-value btor675)) btor52 btor116))
           (btor690
            (if (bitvector->bool (signal-value btor678)) btor51 btor689))
           (btor691
            (if (bitvector->bool (signal-value btor681)) btor50 btor690))
           (btor692
            (if (bitvector->bool (signal-value btor595)) btor116 btor691))
           (btor693
            (if (bitvector->bool (signal-value btor685)) btor49 btor692))
           (btor694
            (bv->signal
             (zero-extend (signal-value btor693) (bitvector 1))
             btor693))
           (btor695
            (bv->signal
             (zero-extend (signal-value btor177) (bitvector 5))
             btor177))
           (btor696
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor695)))
             (list)))
           (btor697
            (if (bitvector->bool (signal-value btor696)) btor36 btor95))
           (btor698
            (bv->signal
             (zero-extend (signal-value btor181) (bitvector 5))
             btor181))
           (btor699
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor698)))
             (list)))
           (btor700
            (if (bitvector->bool (signal-value btor699)) btor35 btor697))
           (btor701
            (bv->signal
             (zero-extend (signal-value btor185) (bitvector 5))
             btor185))
           (btor702
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor701)))
             (list)))
           (btor703
            (if (bitvector->bool (signal-value btor702)) btor34 btor700))
           (btor704
            (if (bitvector->bool (signal-value btor643)) btor95 btor703))
           (btor705
            (bv->signal
             (zero-extend (signal-value btor191) (bitvector 5))
             btor191))
           (btor706
            (signal
             (bool->bitvector
              (bveq (signal-value btor88) (signal-value btor705)))
             (list)))
           (btor707
            (if (bitvector->bool (signal-value btor706)) btor33 btor704))
           (btor708
            (bv->signal
             (zero-extend (signal-value btor707) (bitvector 1))
             btor707))
           (btor709
            (bv->signal
             (zero-extend (signal-value btor641) (bitvector 1))
             btor641))
           (btor710
            (if (bitvector->bool (signal-value btor696)) btor52 btor116))
           (btor711
            (if (bitvector->bool (signal-value btor699)) btor51 btor710))
           (btor712
            (if (bitvector->bool (signal-value btor702)) btor50 btor711))
           (btor713
            (if (bitvector->bool (signal-value btor643)) btor116 btor712))
           (btor714
            (if (bitvector->bool (signal-value btor706)) btor49 btor713))
           (btor715
            (bv->signal
             (zero-extend (signal-value btor714) (bitvector 1))
             btor714))
           (btor716
            (bv->signal
             (zero-extend (signal-value btor427) (bitvector 1))
             btor427))
           (btor717
            (bv->signal
             (zero-extend (signal-value btor464) (bitvector 1))
             btor464))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor720
            (if (bitvector->bool (signal-value btor245)) btor95 btor718))
           (btor721
            (if (bitvector->bool (signal-value btor226)) btor19 btor720))
           (btor722
            (bv->signal
             (zero-extend (signal-value btor721) (bitvector 1))
             btor721))
           (btor723
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state723)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state723)))
                     ((assoc-has-key? init-hash 'state723)
                      (bv->signal (assoc-ref init-hash 'state723)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor725
            (if (bitvector->bool (signal-value btor209)) btor95 btor723))
           (btor726
            (bv->signal
             (zero-extend (signal-value btor725) (bitvector 1))
             btor725))
           (btor727
            (signal
             (concat (signal-value btor725) (signal-value btor509))
             (list)))
           (btor728
            (signal
             (concat (signal-value btor721) (signal-value btor509))
             (list)))
           (btor729
            (if (bitvector->bool (signal-value btor189)) btor728 btor727))
           (btor730
            (bv->signal
             (zero-extend (signal-value btor729) (bitvector 5))
             btor729))
           (btor731
            (bv->signal
             (zero-extend (signal-value btor720) (bitvector 1))
             btor720))
           (btor732
            (bv->signal
             (zero-extend (signal-value btor721) (bitvector 1))
             btor721))
           (btor733
            (bv->signal
             (zero-extend (signal-value btor484) (bitvector 4))
             btor484))
           (btor734
            (bv->signal
             (zero-extend (signal-value btor480) (bitvector 4))
             btor480))
           (btor735
            (bv->signal
             (zero-extend (signal-value btor481) (bitvector 4))
             btor481))
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
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor738
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor739
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor738)))
             (list)))
           (btor740
            (if (bitvector->bool (signal-value btor739)) btor26 btor95))
           (btor741
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor742
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor741)))
             (list)))
           (btor743
            (if (bitvector->bool (signal-value btor742)) btor25 btor740))
           (btor744
            (signal
             (apply bvor (bitvector->bits (signal-value btor16)))
             (signal-state btor16)))
           (btor745 (signal (bvnot (signal-value btor744)) (list)))
           (btor746
            (if (bitvector->bool (signal-value btor745)) btor24 btor743))
           (btor747
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor123)))
             (list)))
           (btor748
            (if (bitvector->bool (signal-value btor747)) btor95 btor746))
           (btor749
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor750
            (signal
             (bool->bitvector
              (bveq (signal-value btor16) (signal-value btor749)))
             (list)))
           (btor751
            (if (bitvector->bool (signal-value btor750)) btor27 btor748))
           (btor752
            (if (bitvector->bool (signal-value btor751)) btor95 btor736))
           (btor753
            (let* ((state-value
                    (cond
                     ((assoc-has-key? merged-input-state-hash 'state753)
                      (bv->signal
                       (assoc-ref merged-input-state-hash 'state753)))
                     ((assoc-has-key? init-hash 'state753)
                      (bv->signal (assoc-ref init-hash 'state753)))
                     (else
                      (bv->signal
                       ((lambda ()
                          (log-warning
                           "Getting default value of 0 for bitvector, this may be a bad idea!")
                          (bv 0 1))))))))
              (when (not (signal? state-value)) (error "Expected signal"))
              state-value))
           (btor755
            (bv->signal
             (zero-extend (signal-value btor112) (bitvector 5))
             btor112))
           (btor756
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor755)))
             (list)))
           (btor757
            (if (bitvector->bool (signal-value btor756)) btor26 btor95))
           (btor758
            (bv->signal
             (zero-extend (signal-value btor116) (bitvector 5))
             btor116))
           (btor759
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor758)))
             (list)))
           (btor760
            (if (bitvector->bool (signal-value btor759)) btor25 btor757))
           (btor761
            (signal
             (apply bvor (bitvector->bits (signal-value btor15)))
             (signal-state btor15)))
           (btor762 (signal (bvnot (signal-value btor761)) (list)))
           (btor763
            (if (bitvector->bool (signal-value btor762)) btor24 btor760))
           (btor764
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor123)))
             (list)))
           (btor765
            (if (bitvector->bool (signal-value btor764)) btor95 btor763))
           (btor766
            (bv->signal
             (zero-extend (signal-value btor126) (bitvector 5))
             btor126))
           (btor767
            (signal
             (bool->bitvector
              (bveq (signal-value btor15) (signal-value btor766)))
             (list)))
           (btor768
            (if (bitvector->bool (signal-value btor767)) btor27 btor765))
           (btor769
            (if (bitvector->bool (signal-value btor768)) btor95 btor753))
           (btor770
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor140)))
             (list)))
           (btor771
            (if (bitvector->bool (signal-value btor770)) btor14 btor769))
           (btor772
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor140)))
             (list)))
           (btor773
            (if (bitvector->bool (signal-value btor772)) btor771 btor752))
           (btor774
            (bv->signal
             (zero-extend (signal-value btor773) (bitvector 1))
             btor773))
           (btor775
            (bv->signal
             (zero-extend (signal-value btor752) (bitvector 1))
             btor752))
           (btor776
            (bv->signal
             (zero-extend (signal-value btor773) (bitvector 1))
             btor773))
           (btor777
            (bv->signal
             (zero-extend (signal-value btor769) (bitvector 1))
             btor769))
           (btor778
            (bv->signal
             (zero-extend (signal-value btor771) (bitvector 1))
             btor771))
           (btor779
            (bv->signal
             (zero-extend (signal-value btor177) (bitvector 5))
             btor177))
           (btor780
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor779)))
             (list)))
           (btor781
            (if (bitvector->bool (signal-value btor780)) btor36 btor95))
           (btor782
            (bv->signal
             (zero-extend (signal-value btor181) (bitvector 5))
             btor181))
           (btor783
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor782)))
             (list)))
           (btor784
            (if (bitvector->bool (signal-value btor783)) btor35 btor781))
           (btor785
            (bv->signal
             (zero-extend (signal-value btor185) (bitvector 5))
             btor185))
           (btor786
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor785)))
             (list)))
           (btor787
            (if (bitvector->bool (signal-value btor786)) btor34 btor784))
           (btor788
            (if (bitvector->bool (signal-value btor772)) btor95 btor787))
           (btor789
            (bv->signal
             (zero-extend (signal-value btor191) (bitvector 5))
             btor191))
           (btor790
            (signal
             (bool->bitvector
              (bveq (signal-value btor17) (signal-value btor789)))
             (list)))
           (btor791
            (if (bitvector->bool (signal-value btor790)) btor33 btor788))
           (btor792
            (bv->signal
             (zero-extend (signal-value btor791) (bitvector 1))
             btor791))
           (btor793
            (bv->signal
             (zero-extend (signal-value btor751) (bitvector 1))
             btor751))
           (btor794
            (if (bitvector->bool (signal-value btor780)) btor52 btor116))
           (btor795
            (if (bitvector->bool (signal-value btor783)) btor51 btor794))
           (btor796
            (if (bitvector->bool (signal-value btor786)) btor50 btor795))
           (btor797
            (if (bitvector->bool (signal-value btor772)) btor116 btor796))
           (btor798
            (if (bitvector->bool (signal-value btor790)) btor49 btor797))
           (btor799
            (bv->signal
             (zero-extend (signal-value btor798) (bitvector 1))
             btor798))
           (btor800
            (bv->signal
             (zero-extend (signal-value btor177) (bitvector 5))
             btor177))
           (btor801
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor800)))
             (list)))
           (btor802
            (if (bitvector->bool (signal-value btor801)) btor36 btor95))
           (btor803
            (bv->signal
             (zero-extend (signal-value btor181) (bitvector 5))
             btor181))
           (btor804
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor803)))
             (list)))
           (btor805
            (if (bitvector->bool (signal-value btor804)) btor35 btor802))
           (btor806
            (bv->signal
             (zero-extend (signal-value btor185) (bitvector 5))
             btor185))
           (btor807
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor806)))
             (list)))
           (btor808
            (if (bitvector->bool (signal-value btor807)) btor34 btor805))
           (btor809
            (if (bitvector->bool (signal-value btor770)) btor95 btor808))
           (btor810
            (bv->signal
             (zero-extend (signal-value btor191) (bitvector 5))
             btor191))
           (btor811
            (signal
             (bool->bitvector
              (bveq (signal-value btor18) (signal-value btor810)))
             (list)))
           (btor812
            (if (bitvector->bool (signal-value btor811)) btor33 btor809))
           (btor813
            (bv->signal
             (zero-extend (signal-value btor812) (bitvector 1))
             btor812))
           (btor814
            (bv->signal
             (zero-extend (signal-value btor768) (bitvector 1))
             btor768))
           (btor815
            (if (bitvector->bool (signal-value btor801)) btor52 btor116))
           (btor816
            (if (bitvector->bool (signal-value btor804)) btor51 btor815))
           (btor817
            (if (bitvector->bool (signal-value btor807)) btor50 btor816))
           (btor818
            (if (bitvector->bool (signal-value btor770)) btor116 btor817))
           (btor819
            (if (bitvector->bool (signal-value btor811)) btor49 btor818))
           (btor820
            (bv->signal
             (zero-extend (signal-value btor819) (bitvector 1))
             btor819))
           (btor821
            (bv->signal
             (zero-extend (signal-value btor771) (bitvector 1))
             btor771))
           (btor823
            (if (bitvector->bool (signal-value btor572)) btor506 btor99))
           (btor824
            (if (bitvector->bool (signal-value btor551)) btor823 btor99))
           (btor825
            (if (bitvector->bool (signal-value btor566)) btor95 btor824))
           (btor829 (if (bitvector->bool (signal-value btor93)) btor81 btor43))
           (btor830 (bv->signal (bv 26 (bitvector 5))))
           (btor831
            (signal
             (bool->bitvector
              (bveq (signal-value btor57) (signal-value btor830)))
             (list)))
           (btor832
            (if (bitvector->bool (signal-value btor831)) btor829 btor130))
           (btor833
            (if (bitvector->bool (signal-value btor132)) btor81 btor832))
           (btor834
            (if (bitvector->bool (signal-value btor138)) btor43 btor833))
           (btor835
            (signal
             (bvand (signal-value btor368) (signal-value btor375))
             (list)))
           (btor836
            (if (bitvector->bool (signal-value btor835)) btor834 btor130))
           (btor837
            (if (bitvector->bool (signal-value btor129)) btor109 btor836))
           (btor839 (if (bitvector->bool (signal-value btor94)) btor82 btor44))
           (btor840
            (signal
             (bool->bitvector
              (bveq (signal-value btor58) (signal-value btor830)))
             (list)))
           (btor841
            (if (bitvector->bool (signal-value btor840)) btor839 btor160))
           (btor842
            (if (bitvector->bool (signal-value btor162)) btor82 btor841))
           (btor843
            (if (bitvector->bool (signal-value btor167)) btor44 btor842))
           (btor844
            (signal
             (bvand (signal-value btor389) (signal-value btor396))
             (list)))
           (btor845
            (if (bitvector->bool (signal-value btor844)) btor843 btor160))
           (btor846
            (if (bitvector->bool (signal-value btor159)) btor109 btor845))
           (btor848 unnamed-input-848)
           (btor849 unnamed-input-849)
           (btor850
            (if (bitvector->bool (signal-value btor773)) btor729 btor576))
           (btor851 unnamed-input-851)
           (btor852 unnamed-input-852)
           (btor853
            (signal
             (bvor (signal-value btor598) (signal-value btor646))
             (list)))
           (btor854
            (signal
             (extract 3 3 (signal-value btor512))
             (signal-state btor512)))
           (btor855
            (signal
             (bvand (signal-value btor853) (signal-value btor854))
             (list)))
           (btor856
            (signal
             (concat (signal-value btor855) (signal-value btor512))
             (list)))
           (btor857
            (signal
             (extract 3 3 (signal-value btor484))
             (signal-state btor484)))
           (btor858
            (signal
             (bvand (signal-value btor853) (signal-value btor857))
             (list)))
           (btor859
            (signal
             (concat (signal-value btor858) (signal-value btor484))
             (list)))
           (btor860
            (if (bitvector->bool (signal-value btor505)) btor859 btor856))
           (btor861
            (if (bitvector->bool (signal-value btor572)) btor860 btor852))
           (btor862
            (if (bitvector->bool (signal-value btor551)) btor861 btor851))
           (btor863 unnamed-input-863)
           (btor864
            (if (bitvector->bool (signal-value btor566)) btor863 btor862))
           (btor865
            (signal
             (bvsub (signal-value btor850) (signal-value btor864))
             (list)))
           (btor866
            (if (bitvector->bool (signal-value btor773)) btor105 btor576))
           (btor867
            (signal
             (bvsub (signal-value btor866) (signal-value btor864))
             (list)))
           (btor868 (signal (bvnot (signal-value btor400)) (list)))
           (btor869 (signal (bvnot (signal-value btor398)) (list)))
           (btor870
            (signal
             (bvand (signal-value btor868) (signal-value btor869))
             (list)))
           (btor871
            (if (bitvector->bool (signal-value btor870)) btor867 btor865))
           (btor872 (bitvector 6))
           (btor873
            (bv->signal
             (zero-extend (signal-value btor850) (bitvector 6))
             btor850))
           (btor874
            (bv->signal
             (zero-extend (signal-value btor864) (bitvector 6))
             btor864))
           (btor875
            (signal
             (bvadd (signal-value btor873) (signal-value btor874))
             (list)))
           (btor876
            (bv->signal
             (zero-extend (signal-value btor866) (bitvector 6))
             btor866))
           (btor877
            (bv->signal
             (zero-extend (signal-value btor864) (bitvector 6))
             btor864))
           (btor878
            (signal
             (bvadd (signal-value btor876) (signal-value btor877))
             (list)))
           (btor879
            (if (bitvector->bool (signal-value btor870)) btor878 btor875))
           (btor880
            (signal
             (extract 4 0 (signal-value btor879))
             (signal-state btor879)))
           (btor881
            (if (bitvector->bool (signal-value btor301)) btor880 btor871))
           (btor882
            (if (bitvector->bool (signal-value btor572)) btor881 btor849))
           (btor883
            (if (bitvector->bool (signal-value btor551)) btor882 btor848))
           (btor884 unnamed-input-884)
           (btor885
            (if (bitvector->bool (signal-value btor566)) btor884 btor883))
           (btor886
            (if (bitvector->bool (signal-value btor400)) btor885 btor172))
           (btor887
            (if (bitvector->bool (signal-value btor572)) btor886 btor172))
           (btor888
            (if (bitvector->bool (signal-value btor551)) btor887 btor172))
           (btor889
            (if (bitvector->bool (signal-value btor566)) btor105 btor888))
           (btor891
            (if (bitvector->bool (signal-value btor400)) btor95 btor174))
           (btor892
            (if (bitvector->bool (signal-value btor572)) btor891 btor174))
           (btor893
            (if (bitvector->bool (signal-value btor551)) btor892 btor174))
           (btor894
            (if (bitvector->bool (signal-value btor566)) btor95 btor893))
           (btor896
            (signal
             (bvand (signal-value btor318) (signal-value btor325))
             (list)))
           (btor897
            (if (bitvector->bool (signal-value btor896)) btor288 btor269))
           (btor898
            (if (bitvector->bool (signal-value btor268)) btor95 btor897))
           (btor900
            (signal
             (bvand (signal-value btor341) (signal-value btor348))
             (list)))
           (btor901
            (if (bitvector->bool (signal-value btor900)) btor28 btor286))
           (btor902
            (if (bitvector->bool (signal-value btor285)) btor95 btor901))
           (btor904 (signal (bvnot (signal-value btor350)) (list)))
           (btor905
            (if (bitvector->bool (signal-value btor572)) btor904 btor350))
           (btor906
            (if (bitvector->bool (signal-value btor551)) btor905 btor350))
           (btor907
            (if (bitvector->bool (signal-value btor566)) btor904 btor906))
           (btor909
            (signal
             (bvand (signal-value btor617) (signal-value btor624))
             (list)))
           (btor910
            (if (bitvector->bool (signal-value btor909)) btor91 btor425))
           (btor911
            (if (bitvector->bool (signal-value btor424)) btor95 btor910))
           (btor913
            (signal
             (bvand (signal-value btor665) (signal-value btor672))
             (list)))
           (btor914
            (if (bitvector->bool (signal-value btor913)) btor92 btor462))
           (btor915
            (if (bitvector->bool (signal-value btor461)) btor95 btor914))
           (btor917
            (signal
             (bvand (signal-value btor527) (signal-value btor534))
             (list)))
           (btor918
            (if (bitvector->bool (signal-value btor917)) btor95 btor503))
           (btor919
            (if (bitvector->bool (signal-value btor502)) btor95 btor918))
           (btor921
            (if (bitvector->bool (signal-value btor917)) btor484 btor512))
           (btor922
            (if (bitvector->bool (signal-value btor502)) btor509 btor921))
           (btor924 unnamed-input-924)
           (btor925 unnamed-input-925)
           (btor926
            (signal
             (bool->bitvector
              (bvuge (signal-value btor850) (signal-value btor864)))
             (list)))
           (btor927
            (if (bitvector->bool (signal-value btor926)) btor116 btor95))
           (btor928
            (signal
             (bool->bitvector
              (bvuge (signal-value btor866) (signal-value btor864)))
             (list)))
           (btor929
            (if (bitvector->bool (signal-value btor928)) btor116 btor95))
           (btor930
            (if (bitvector->bool (signal-value btor870)) btor929 btor927))
           (btor931
            (signal
             (extract 5 5 (signal-value btor879))
             (signal-state btor879)))
           (btor932
            (if (bitvector->bool (signal-value btor301)) btor931 btor930))
           (btor933
            (if (bitvector->bool (signal-value btor572)) btor932 btor925))
           (btor934
            (if (bitvector->bool (signal-value btor551)) btor933 btor924))
           (btor935 unnamed-input-935)
           (btor936
            (if (bitvector->bool (signal-value btor566)) btor935 btor934))
           (btor937 (signal (bvnot (signal-value btor936)) (list)))
           (btor938
            (if (bitvector->bool (signal-value btor301)) btor936 btor937))
           (btor939
            (signal
             (extract 3 3 (signal-value btor864))
             (signal-state btor864)))
           (btor940
            (signal
             (extract 4 4 (signal-value btor576))
             (signal-state btor576)))
           (btor941
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor939)
              (signal-value btor940))
             (list)))
           (btor942 (signal (bvnot (signal-value btor301)) (list)))
           (btor943
            (signal
             (bvxor (signal-value btor941) (signal-value btor942))
             (list)))
           (btor944
            (signal
             (extract 4 4 (signal-value btor885))
             (signal-state btor885)))
           (btor945
            (signal
             (bvxor (signal-value btor940) (signal-value btor944))
             (list)))
           (btor946
            (signal
             (bvand (signal-value btor943) (signal-value btor945))
             (list)))
           (btor947
            (signal
             (extract 4 4 (signal-value btor729))
             (signal-state btor729)))
           (btor948
            (signal
             ((lambda (a b) (bvnot (bvxor a b)))
              (signal-value btor939)
              (signal-value btor947))
             (list)))
           (btor949
            (signal
             (bvxor (signal-value btor948) (signal-value btor942))
             (list)))
           (btor950
            (signal
             (bvxor (signal-value btor947) (signal-value btor944))
             (list)))
           (btor951
            (signal
             (bvand (signal-value btor949) (signal-value btor950))
             (list)))
           (btor952
            (if (bitvector->bool (signal-value btor773)) btor951 btor946))
           (btor953 unnamed-input-953)
           (btor954 unnamed-input-954)
           (btor955
            (if (bitvector->bool (signal-value btor572)) btor853 btor954))
           (btor956
            (if (bitvector->bool (signal-value btor551)) btor955 btor953))
           (btor957 unnamed-input-957)
           (btor958
            (if (bitvector->bool (signal-value btor566)) btor957 btor956))
           (btor959
            (signal
             (apply bvor (bitvector->bits (signal-value btor864)))
             (signal-state btor864)))
           (btor960
            (signal
             (bvand (signal-value btor958) (signal-value btor959))
             (list)))
           (btor961
            (if (bitvector->bool (signal-value btor960)) btor952 btor938))
           (btor962
            (if (bitvector->bool (signal-value btor572)) btor961 btor574))
           (btor963
            (if (bitvector->bool (signal-value btor551)) btor962 btor574))
           (btor964
            (if (bitvector->bool (signal-value btor566)) btor95 btor963))
           (btor966
            (if (bitvector->bool (signal-value btor400)) btor886 btor885))
           (btor967
            (if (bitvector->bool (signal-value btor572)) btor966 btor576))
           (btor968
            (if (bitvector->bool (signal-value btor551)) btor967 btor576))
           (btor969
            (if (bitvector->bool (signal-value btor566)) btor105 btor968))
           (btor971
            (signal
             (bvand (signal-value btor686) (signal-value btor693))
             (list)))
           (btor972
            (if (bitvector->bool (signal-value btor971)) btor427 btor594))
           (btor973
            (if (bitvector->bool (signal-value btor593)) btor95 btor972))
           (btor975
            (signal
             (bvand (signal-value btor707) (signal-value btor714))
             (list)))
           (btor976
            (if (bitvector->bool (signal-value btor975)) btor464 btor642))
           (btor977
            (if (bitvector->bool (signal-value btor641)) btor95 btor976))
           (btor979
            (signal
             (bvand (signal-value btor230) (signal-value btor251))
             (list)))
           (btor980
            (if (bitvector->bool (signal-value btor979)) btor19 btor720))
           (btor981
            (if (bitvector->bool (signal-value btor245)) btor95 btor980))
           (btor983
            (signal
             (bvand (signal-value btor194) (signal-value btor215))
             (list)))
           (btor984
            (if (bitvector->bool (signal-value btor983)) btor721 btor725))
           (btor985
            (if (bitvector->bool (signal-value btor209)) btor95 btor984))
           (btor987
            (signal
             (bvand (signal-value btor791) (signal-value btor798))
             (list)))
           (btor988
            (if (bitvector->bool (signal-value btor987)) btor771 btor752))
           (btor989
            (if (bitvector->bool (signal-value btor751)) btor95 btor988))
           (btor991
            (signal
             (bvand (signal-value btor812) (signal-value btor819))
             (list)))
           (btor992
            (if (bitvector->bool (signal-value btor991)) btor14 btor769))
           (btor993
            (if (bitvector->bool (signal-value btor768)) btor95 btor992)))
      (list
       (cons
        'scanouta
        (signal
         (signal-value btor142)
         (append
          (list (cons 'state753 (signal-value btor993)))
          (append
           (list (cons 'state736 (signal-value btor989)))
           (append
            (list (cons 'state723 (signal-value btor985)))
            (append
             (list (cons 'state718 (signal-value btor981)))
             (append
              (list (cons 'state626 (signal-value btor977)))
              (append
               (list (cons 'state578 (signal-value btor973)))
               (append
                (list (cons 'result_int (signal-value btor969)))
                (append
                 (list (cons 'overflow_int (signal-value btor964)))
                 (append
                  (list (cons 'state510 (signal-value btor922)))
                  (append
                   (list (cons 'state487 (signal-value btor919)))
                   (append
                    (list (cons 'state446 (signal-value btor915)))
                    (append
                     (list (cons 'state409 (signal-value btor911)))
                     (append
                      (list (cons 'flag (signal-value btor907)))
                      (append
                       (list (cons 'state270 (signal-value btor902)))
                       (append
                        (list (cons 'state253 (signal-value btor898)))
                        (append
                         (list
                          (cons
                           'accum_saturate_overflow
                           (signal-value btor894)))
                         (append
                          (list (cons 'accum_result (signal-value btor889)))
                          (append
                           (list (cons 'state144 (signal-value btor846)))
                           (append
                            (list (cons 'state110 (signal-value btor837)))
                            (append
                             (list (cons 'state106 (signal-value btor576)))
                             (append
                              (list (cons 'state102 (signal-value btor574)))
                              (append
                               (list
                                (cons
                                 'mult_is_saturated_int
                                 (signal-value btor825)))
                               (append
                                (list
                                 (cons
                                  'accum_is_saturated_latent
                                  (signal-value btor174)))
                                (list))))))))))))))))))))))))))
       (cons
        'accum_is_saturated
        (signal
         (signal-value btor96)
         (append
          (list (cons 'state753 (signal-value btor993)))
          (append
           (list (cons 'state736 (signal-value btor989)))
           (append
            (list (cons 'state723 (signal-value btor985)))
            (append
             (list (cons 'state718 (signal-value btor981)))
             (append
              (list (cons 'state626 (signal-value btor977)))
              (append
               (list (cons 'state578 (signal-value btor973)))
               (append
                (list (cons 'result_int (signal-value btor969)))
                (append
                 (list (cons 'overflow_int (signal-value btor964)))
                 (append
                  (list (cons 'state510 (signal-value btor922)))
                  (append
                   (list (cons 'state487 (signal-value btor919)))
                   (append
                    (list (cons 'state446 (signal-value btor915)))
                    (append
                     (list (cons 'state409 (signal-value btor911)))
                     (append
                      (list (cons 'flag (signal-value btor907)))
                      (append
                       (list (cons 'state270 (signal-value btor902)))
                       (append
                        (list (cons 'state253 (signal-value btor898)))
                        (append
                         (list
                          (cons
                           'accum_saturate_overflow
                           (signal-value btor894)))
                         (append
                          (list (cons 'accum_result (signal-value btor889)))
                          (append
                           (list (cons 'state144 (signal-value btor846)))
                           (append
                            (list (cons 'state110 (signal-value btor837)))
                            (append
                             (list (cons 'state106 (signal-value btor576)))
                             (append
                              (list (cons 'state102 (signal-value btor574)))
                              (append
                               (list
                                (cons
                                 'mult_is_saturated_int
                                 (signal-value btor825)))
                               (append
                                (list
                                 (cons
                                  'accum_is_saturated_latent
                                  (signal-value btor174)))
                                (list))))))))))))))))))))))))))
       (cons
        'result
        (signal
         (signal-value btor106)
         (append
          (list (cons 'state753 (signal-value btor993)))
          (append
           (list (cons 'state736 (signal-value btor989)))
           (append
            (list (cons 'state723 (signal-value btor985)))
            (append
             (list (cons 'state718 (signal-value btor981)))
             (append
              (list (cons 'state626 (signal-value btor977)))
              (append
               (list (cons 'state578 (signal-value btor973)))
               (append
                (list (cons 'result_int (signal-value btor969)))
                (append
                 (list (cons 'overflow_int (signal-value btor964)))
                 (append
                  (list (cons 'state510 (signal-value btor922)))
                  (append
                   (list (cons 'state487 (signal-value btor919)))
                   (append
                    (list (cons 'state446 (signal-value btor915)))
                    (append
                     (list (cons 'state409 (signal-value btor911)))
                     (append
                      (list (cons 'flag (signal-value btor907)))
                      (append
                       (list (cons 'state270 (signal-value btor902)))
                       (append
                        (list (cons 'state253 (signal-value btor898)))
                        (append
                         (list
                          (cons
                           'accum_saturate_overflow
                           (signal-value btor894)))
                         (append
                          (list (cons 'accum_result (signal-value btor889)))
                          (append
                           (list (cons 'state144 (signal-value btor846)))
                           (append
                            (list (cons 'state110 (signal-value btor837)))
                            (append
                             (list (cons 'state106 (signal-value btor576)))
                             (append
                              (list (cons 'state102 (signal-value btor574)))
                              (append
                               (list
                                (cons
                                 'mult_is_saturated_int
                                 (signal-value btor825)))
                               (append
                                (list
                                 (cons
                                  'accum_is_saturated_latent
                                  (signal-value btor174)))
                                (list))))))))))))))))))))))))))
       (cons
        'mult_is_saturated
        (signal
         (signal-value btor99)
         (append
          (list (cons 'state753 (signal-value btor993)))
          (append
           (list (cons 'state736 (signal-value btor989)))
           (append
            (list (cons 'state723 (signal-value btor985)))
            (append
             (list (cons 'state718 (signal-value btor981)))
             (append
              (list (cons 'state626 (signal-value btor977)))
              (append
               (list (cons 'state578 (signal-value btor973)))
               (append
                (list (cons 'result_int (signal-value btor969)))
                (append
                 (list (cons 'overflow_int (signal-value btor964)))
                 (append
                  (list (cons 'state510 (signal-value btor922)))
                  (append
                   (list (cons 'state487 (signal-value btor919)))
                   (append
                    (list (cons 'state446 (signal-value btor915)))
                    (append
                     (list (cons 'state409 (signal-value btor911)))
                     (append
                      (list (cons 'flag (signal-value btor907)))
                      (append
                       (list (cons 'state270 (signal-value btor902)))
                       (append
                        (list (cons 'state253 (signal-value btor898)))
                        (append
                         (list
                          (cons
                           'accum_saturate_overflow
                           (signal-value btor894)))
                         (append
                          (list (cons 'accum_result (signal-value btor889)))
                          (append
                           (list (cons 'state144 (signal-value btor846)))
                           (append
                            (list (cons 'state110 (signal-value btor837)))
                            (append
                             (list (cons 'state106 (signal-value btor576)))
                             (append
                              (list (cons 'state102 (signal-value btor574)))
                              (append
                               (list
                                (cons
                                 'mult_is_saturated_int
                                 (signal-value btor825)))
                               (append
                                (list
                                 (cons
                                  'accum_is_saturated_latent
                                  (signal-value btor174)))
                                (list))))))))))))))))))))))))))
       (cons
        'overflow
        (signal
         (signal-value btor102)
         (append
          (list (cons 'state753 (signal-value btor993)))
          (append
           (list (cons 'state736 (signal-value btor989)))
           (append
            (list (cons 'state723 (signal-value btor985)))
            (append
             (list (cons 'state718 (signal-value btor981)))
             (append
              (list (cons 'state626 (signal-value btor977)))
              (append
               (list (cons 'state578 (signal-value btor973)))
               (append
                (list (cons 'result_int (signal-value btor969)))
                (append
                 (list (cons 'overflow_int (signal-value btor964)))
                 (append
                  (list (cons 'state510 (signal-value btor922)))
                  (append
                   (list (cons 'state487 (signal-value btor919)))
                   (append
                    (list (cons 'state446 (signal-value btor915)))
                    (append
                     (list (cons 'state409 (signal-value btor911)))
                     (append
                      (list (cons 'flag (signal-value btor907)))
                      (append
                       (list (cons 'state270 (signal-value btor902)))
                       (append
                        (list (cons 'state253 (signal-value btor898)))
                        (append
                         (list
                          (cons
                           'accum_saturate_overflow
                           (signal-value btor894)))
                         (append
                          (list (cons 'accum_result (signal-value btor889)))
                          (append
                           (list (cons 'state144 (signal-value btor846)))
                           (append
                            (list (cons 'state110 (signal-value btor837)))
                            (append
                             (list (cons 'state106 (signal-value btor576)))
                             (append
                              (list (cons 'state102 (signal-value btor574)))
                              (append
                               (list
                                (cons
                                 'mult_is_saturated_int
                                 (signal-value btor825)))
                               (append
                                (list
                                 (cons
                                  'accum_is_saturated_latent
                                  (signal-value btor174)))
                                (list))))))))))))))))))))))))))
       (cons
        'scanoutb
        (signal
         (signal-value btor170)
         (append
          (list (cons 'state753 (signal-value btor993)))
          (append
           (list (cons 'state736 (signal-value btor989)))
           (append
            (list (cons 'state723 (signal-value btor985)))
            (append
             (list (cons 'state718 (signal-value btor981)))
             (append
              (list (cons 'state626 (signal-value btor977)))
              (append
               (list (cons 'state578 (signal-value btor973)))
               (append
                (list (cons 'result_int (signal-value btor969)))
                (append
                 (list (cons 'overflow_int (signal-value btor964)))
                 (append
                  (list (cons 'state510 (signal-value btor922)))
                  (append
                   (list (cons 'state487 (signal-value btor919)))
                   (append
                    (list (cons 'state446 (signal-value btor915)))
                    (append
                     (list (cons 'state409 (signal-value btor911)))
                     (append
                      (list (cons 'flag (signal-value btor907)))
                      (append
                       (list (cons 'state270 (signal-value btor902)))
                       (append
                        (list (cons 'state253 (signal-value btor898)))
                        (append
                         (list
                          (cons
                           'accum_saturate_overflow
                           (signal-value btor894)))
                         (append
                          (list (cons 'accum_result (signal-value btor889)))
                          (append
                           (list (cons 'state144 (signal-value btor846)))
                           (append
                            (list (cons 'state110 (signal-value btor837)))
                            (append
                             (list (cons 'state106 (signal-value btor576)))
                             (append
                              (list (cons 'state102 (signal-value btor574)))
                              (append
                               (list
                                (cons
                                 'mult_is_saturated_int
                                 (signal-value btor825)))
                               (append
                                (list
                                 (cons
                                  'accum_is_saturated_latent
                                  (signal-value btor174)))
                                (list))))))))))))))))))))))))))))))

