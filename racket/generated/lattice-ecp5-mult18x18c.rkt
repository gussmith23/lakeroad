#lang rosette/safe
    (provide (rename-out [MULT18X18C lattice-ecp5-mult18x18c] [MULT18X18C_initial lattice-ecp5-mult18x18c-initial] [MULT18X18C_inputs_helper lattice-ecp5-mult18x18c-inputs] [MULT18X18C_outputs_helper lattice-ecp5-mult18x18c-outputs]))(struct
  MULT18X18C_Inputs
  (SRIB9
    SRIB8
    SRIB7
    SRIB6
    SRIB5
    SRIB4
    SRIB3
    SRIB2
    SRIB17
    SRIB16
    SRIB15
    SRIB14
    SRIB13
    SRIB12
    SRIB11
    SRIB10
    SRIB1
    SRIB0
    SRIA9
    SRIA8
    SRIA7
    SRIA6
    SRIA5
    SRIA4
    SRIA3
    SRIA2
    SRIA17
    SRIA16
    SRIA15
    SRIA14
    SRIA13
    SRIA12
    SRIA11
    SRIA10
    SRIA1
    SRIA0
    SOURCEB
    SOURCEA
    SIGNEDB
    SIGNEDA
    RST3
    RST2
    RST1
    RST0
    REG_PIPELINE_RST
    REG_PIPELINE_CLK
    REG_PIPELINE_CE
    REG_OUTPUT_RST
    REG_OUTPUT_CLK
    REG_OUTPUT_CE
    REG_INPUTB_RST
    REG_INPUTB_CLK
    REG_INPUTB_CE
    REG_INPUTA_RST
    REG_INPUTA_CLK
    REG_INPUTA_CE
    MULT_BYPASS
    CLK3
    CLK2
    CLK1
    CLK0
    CE3
    CE2
    CE1
    CE0
    CAS_MATCH_REG
    B9
    B8
    B7
    B6
    B5
    B4
    B3
    B2
    B17
    B16
    B15
    B14
    B13
    B12
    B11
    B10
    B1
    B0
    A9
    A8
    A7
    A6
    A5
    A4
    A3
    A2
    A17
    A16
    A15
    A14
    A13
    A12
    A11
    A10
    A1
    A0)
  #:transparent
  ; SRIB9 (bitvector 1)
  ; SRIB8 (bitvector 1)
  ; SRIB7 (bitvector 1)
  ; SRIB6 (bitvector 1)
  ; SRIB5 (bitvector 1)
  ; SRIB4 (bitvector 1)
  ; SRIB3 (bitvector 1)
  ; SRIB2 (bitvector 1)
  ; SRIB17 (bitvector 1)
  ; SRIB16 (bitvector 1)
  ; SRIB15 (bitvector 1)
  ; SRIB14 (bitvector 1)
  ; SRIB13 (bitvector 1)
  ; SRIB12 (bitvector 1)
  ; SRIB11 (bitvector 1)
  ; SRIB10 (bitvector 1)
  ; SRIB1 (bitvector 1)
  ; SRIB0 (bitvector 1)
  ; SRIA9 (bitvector 1)
  ; SRIA8 (bitvector 1)
  ; SRIA7 (bitvector 1)
  ; SRIA6 (bitvector 1)
  ; SRIA5 (bitvector 1)
  ; SRIA4 (bitvector 1)
  ; SRIA3 (bitvector 1)
  ; SRIA2 (bitvector 1)
  ; SRIA17 (bitvector 1)
  ; SRIA16 (bitvector 1)
  ; SRIA15 (bitvector 1)
  ; SRIA14 (bitvector 1)
  ; SRIA13 (bitvector 1)
  ; SRIA12 (bitvector 1)
  ; SRIA11 (bitvector 1)
  ; SRIA10 (bitvector 1)
  ; SRIA1 (bitvector 1)
  ; SRIA0 (bitvector 1)
  ; SOURCEB (bitvector 1)
  ; SOURCEA (bitvector 1)
  ; SIGNEDB (bitvector 1)
  ; SIGNEDA (bitvector 1)
  ; RST3 (bitvector 1)
  ; RST2 (bitvector 1)
  ; RST1 (bitvector 1)
  ; RST0 (bitvector 1)
  ; REG_PIPELINE_RST (bitvector 5)
  ; REG_PIPELINE_CLK (bitvector 5)
  ; REG_PIPELINE_CE (bitvector 5)
  ; REG_OUTPUT_RST (bitvector 5)
  ; REG_OUTPUT_CLK (bitvector 5)
  ; REG_OUTPUT_CE (bitvector 5)
  ; REG_INPUTB_RST (bitvector 5)
  ; REG_INPUTB_CLK (bitvector 5)
  ; REG_INPUTB_CE (bitvector 5)
  ; REG_INPUTA_RST (bitvector 5)
  ; REG_INPUTA_CLK (bitvector 5)
  ; REG_INPUTA_CE (bitvector 5)
  ; MULT_BYPASS (bitvector 5)
  ; CLK3 (bitvector 1)
  ; CLK2 (bitvector 1)
  ; CLK1 (bitvector 1)
  ; CLK0 (bitvector 1)
  ; CE3 (bitvector 1)
  ; CE2 (bitvector 1)
  ; CE1 (bitvector 1)
  ; CE0 (bitvector 1)
  ; CAS_MATCH_REG (bitvector 5)
  ; B9 (bitvector 1)
  ; B8 (bitvector 1)
  ; B7 (bitvector 1)
  ; B6 (bitvector 1)
  ; B5 (bitvector 1)
  ; B4 (bitvector 1)
  ; B3 (bitvector 1)
  ; B2 (bitvector 1)
  ; B17 (bitvector 1)
  ; B16 (bitvector 1)
  ; B15 (bitvector 1)
  ; B14 (bitvector 1)
  ; B13 (bitvector 1)
  ; B12 (bitvector 1)
  ; B11 (bitvector 1)
  ; B10 (bitvector 1)
  ; B1 (bitvector 1)
  ; B0 (bitvector 1)
  ; A9 (bitvector 1)
  ; A8 (bitvector 1)
  ; A7 (bitvector 1)
  ; A6 (bitvector 1)
  ; A5 (bitvector 1)
  ; A4 (bitvector 1)
  ; A3 (bitvector 1)
  ; A2 (bitvector 1)
  ; A17 (bitvector 1)
  ; A16 (bitvector 1)
  ; A15 (bitvector 1)
  ; A14 (bitvector 1)
  ; A13 (bitvector 1)
  ; A12 (bitvector 1)
  ; A11 (bitvector 1)
  ; A10 (bitvector 1)
  ; A1 (bitvector 1)
  ; A0 (bitvector 1)
)
(struct
  MULT18X18C_Outputs
  (SROB9
    SROB8
    SROB7
    SROB6
    SROB5
    SROB4
    SROB3
    SROB2
    SROB17
    SROB16
    SROB15
    SROB14
    SROB13
    SROB12
    SROB11
    SROB10
    SROB1
    SROB0
    SROA9
    SROA8
    SROA7
    SROA6
    SROA5
    SROA4
    SROA3
    SROA2
    SROA17
    SROA16
    SROA15
    SROA14
    SROA13
    SROA12
    SROA11
    SROA10
    SROA1
    SROA0
    SIGNEDP
    ROB9
    ROB8
    ROB7
    ROB6
    ROB5
    ROB4
    ROB3
    ROB2
    ROB17
    ROB16
    ROB15
    ROB14
    ROB13
    ROB12
    ROB11
    ROB10
    ROB1
    ROB0
    ROA9
    ROA8
    ROA7
    ROA6
    ROA5
    ROA4
    ROA3
    ROA2
    ROA17
    ROA16
    ROA15
    ROA14
    ROA13
    ROA12
    ROA11
    ROA10
    ROA1
    ROA0
    P9
    P8
    P7
    P6
    P5
    P4
    P35
    P34
    P33
    P32
    P31
    P30
    P3
    P29
    P28
    P27
    P26
    P25
    P24
    P23
    P22
    P21
    P20
    P2
    P19
    P18
    P17
    P16
    P15
    P14
    P13
    P12
    P11
    P10
    P1
    P0)
  #:transparent
  ; SROB9 (bitvector 1)
  ; SROB8 (bitvector 1)
  ; SROB7 (bitvector 1)
  ; SROB6 (bitvector 1)
  ; SROB5 (bitvector 1)
  ; SROB4 (bitvector 1)
  ; SROB3 (bitvector 1)
  ; SROB2 (bitvector 1)
  ; SROB17 (bitvector 1)
  ; SROB16 (bitvector 1)
  ; SROB15 (bitvector 1)
  ; SROB14 (bitvector 1)
  ; SROB13 (bitvector 1)
  ; SROB12 (bitvector 1)
  ; SROB11 (bitvector 1)
  ; SROB10 (bitvector 1)
  ; SROB1 (bitvector 1)
  ; SROB0 (bitvector 1)
  ; SROA9 (bitvector 1)
  ; SROA8 (bitvector 1)
  ; SROA7 (bitvector 1)
  ; SROA6 (bitvector 1)
  ; SROA5 (bitvector 1)
  ; SROA4 (bitvector 1)
  ; SROA3 (bitvector 1)
  ; SROA2 (bitvector 1)
  ; SROA17 (bitvector 1)
  ; SROA16 (bitvector 1)
  ; SROA15 (bitvector 1)
  ; SROA14 (bitvector 1)
  ; SROA13 (bitvector 1)
  ; SROA12 (bitvector 1)
  ; SROA11 (bitvector 1)
  ; SROA10 (bitvector 1)
  ; SROA1 (bitvector 1)
  ; SROA0 (bitvector 1)
  ; SIGNEDP (bitvector 1)
  ; ROB9 (bitvector 1)
  ; ROB8 (bitvector 1)
  ; ROB7 (bitvector 1)
  ; ROB6 (bitvector 1)
  ; ROB5 (bitvector 1)
  ; ROB4 (bitvector 1)
  ; ROB3 (bitvector 1)
  ; ROB2 (bitvector 1)
  ; ROB17 (bitvector 1)
  ; ROB16 (bitvector 1)
  ; ROB15 (bitvector 1)
  ; ROB14 (bitvector 1)
  ; ROB13 (bitvector 1)
  ; ROB12 (bitvector 1)
  ; ROB11 (bitvector 1)
  ; ROB10 (bitvector 1)
  ; ROB1 (bitvector 1)
  ; ROB0 (bitvector 1)
  ; ROA9 (bitvector 1)
  ; ROA8 (bitvector 1)
  ; ROA7 (bitvector 1)
  ; ROA6 (bitvector 1)
  ; ROA5 (bitvector 1)
  ; ROA4 (bitvector 1)
  ; ROA3 (bitvector 1)
  ; ROA2 (bitvector 1)
  ; ROA17 (bitvector 1)
  ; ROA16 (bitvector 1)
  ; ROA15 (bitvector 1)
  ; ROA14 (bitvector 1)
  ; ROA13 (bitvector 1)
  ; ROA12 (bitvector 1)
  ; ROA11 (bitvector 1)
  ; ROA10 (bitvector 1)
  ; ROA1 (bitvector 1)
  ; ROA0 (bitvector 1)
  ; P9 (bitvector 1)
  ; P8 (bitvector 1)
  ; P7 (bitvector 1)
  ; P6 (bitvector 1)
  ; P5 (bitvector 1)
  ; P4 (bitvector 1)
  ; P35 (bitvector 1)
  ; P34 (bitvector 1)
  ; P33 (bitvector 1)
  ; P32 (bitvector 1)
  ; P31 (bitvector 1)
  ; P30 (bitvector 1)
  ; P3 (bitvector 1)
  ; P29 (bitvector 1)
  ; P28 (bitvector 1)
  ; P27 (bitvector 1)
  ; P26 (bitvector 1)
  ; P25 (bitvector 1)
  ; P24 (bitvector 1)
  ; P23 (bitvector 1)
  ; P22 (bitvector 1)
  ; P21 (bitvector 1)
  ; P20 (bitvector 1)
  ; P2 (bitvector 1)
  ; P19 (bitvector 1)
  ; P18 (bitvector 1)
  ; P17 (bitvector 1)
  ; P16 (bitvector 1)
  ; P15 (bitvector 1)
  ; P14 (bitvector 1)
  ; P13 (bitvector 1)
  ; P12 (bitvector 1)
  ; P11 (bitvector 1)
  ; P10 (bitvector 1)
  ; P1 (bitvector 1)
  ; P0 (bitvector 1)
)
(struct
  MULT18X18C_State
  ($auto$clk2fflogic.cc_86_sample_control_edge$640
    $auto$clk2fflogic.cc_86_sample_control_edge$690
    $auto$clk2fflogic.cc_86_sample_control_edge$700
    $auto$clk2fflogic.cc_86_sample_control_edge$670
    $auto$clk2fflogic.cc_86_sample_control_edge$630
    $auto$clk2fflogic.cc_102_sample_data$636
    $auto$clk2fflogic.cc_102_sample_data$638
    $auto$clk2fflogic.cc_102_sample_data$686
    $auto$clk2fflogic.cc_102_sample_data$688
    $auto$clk2fflogic.cc_102_sample_data$696
    $auto$clk2fflogic.cc_102_sample_data$698
    $auto$clk2fflogic.cc_102_sample_data$666
    $auto$clk2fflogic.cc_102_sample_data$668
    $auto$clk2fflogic.cc_86_sample_control_edge$660
    $auto$clk2fflogic.cc_86_sample_control_edge$680
    $auto$clk2fflogic.cc_86_sample_control_edge$650
    $auto$clk2fflogic.cc_102_sample_data$626
    $auto$clk2fflogic.cc_102_sample_data$628
    $auto$clk2fflogic.cc_102_sample_data$656
    $auto$clk2fflogic.cc_102_sample_data$658
    $auto$clk2fflogic.cc_102_sample_data$676
    $auto$clk2fflogic.cc_102_sample_data$678
    $auto$clk2fflogic.cc_102_sample_data$646
    $auto$clk2fflogic.cc_102_sample_data$648)
  #:transparent
  ; $auto$clk2fflogic.cc_86_sample_control_edge$640 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$690 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$700 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$670 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$630 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$636 (bitvector 36)
  ; $auto$clk2fflogic.cc_102_sample_data$638 (bitvector 36)
  ; $auto$clk2fflogic.cc_102_sample_data$686 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$688 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$696 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$698 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$666 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$668 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$660 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$680 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$650 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$626 (bitvector 36)
  ; $auto$clk2fflogic.cc_102_sample_data$628 (bitvector 36)
  ; $auto$clk2fflogic.cc_102_sample_data$656 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$658 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$676 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$678 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$646 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$648 (bitvector 1)
)
(define
  (MULT18X18C_inputs_helper inputs)
  (MULT18X18C_Inputs
    (let
      (
        (assoc-result
          (assoc "SRIB9" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIB8" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIB7" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIB6" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIB5" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIB4" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIB3" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIB2" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIB17" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIB16" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIB15" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIB14" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIB13" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIB12" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIB11" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIB10" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIB1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIB0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIA9" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIA8" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIA7" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIA6" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIA5" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIA4" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIA3" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIA2" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIA17" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIA16" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIA15" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIA14" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIA13" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIA12" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIA11" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIA10" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIA1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SRIA0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SOURCEB" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SOURCEA" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SIGNEDB" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SIGNEDA" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "RST3" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "RST2" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "RST1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "RST0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_PIPELINE_RST" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_PIPELINE_CLK" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_PIPELINE_CE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_OUTPUT_RST" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_OUTPUT_CLK" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_OUTPUT_CE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_INPUTB_RST" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_INPUTB_CLK" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_INPUTB_CE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_INPUTA_RST" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_INPUTA_CLK" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_INPUTA_CE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MULT_BYPASS" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CLK3" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CLK2" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CLK1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CLK0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CE3" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CE2" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CE1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CE0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CAS_MATCH_REG" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B9" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B8" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B7" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B6" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B5" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B4" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B3" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B2" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B17" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B16" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B15" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B14" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B13" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B12" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B11" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B10" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A9" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A8" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A7" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A6" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A5" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A4" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A3" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A2" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A17" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A16" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A15" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A14" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A13" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A12" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A11" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A10" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A0" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))))
(define
  (MULT18X18C_outputs_helper outputs)
  (list
    (cons "SROB9" (MULT18X18C_Outputs-SROB9 outputs))
    (cons "SROB8" (MULT18X18C_Outputs-SROB8 outputs))
    (cons "SROB7" (MULT18X18C_Outputs-SROB7 outputs))
    (cons "SROB6" (MULT18X18C_Outputs-SROB6 outputs))
    (cons "SROB5" (MULT18X18C_Outputs-SROB5 outputs))
    (cons "SROB4" (MULT18X18C_Outputs-SROB4 outputs))
    (cons "SROB3" (MULT18X18C_Outputs-SROB3 outputs))
    (cons "SROB2" (MULT18X18C_Outputs-SROB2 outputs))
    (cons "SROB17" (MULT18X18C_Outputs-SROB17 outputs))
    (cons "SROB16" (MULT18X18C_Outputs-SROB16 outputs))
    (cons "SROB15" (MULT18X18C_Outputs-SROB15 outputs))
    (cons "SROB14" (MULT18X18C_Outputs-SROB14 outputs))
    (cons "SROB13" (MULT18X18C_Outputs-SROB13 outputs))
    (cons "SROB12" (MULT18X18C_Outputs-SROB12 outputs))
    (cons "SROB11" (MULT18X18C_Outputs-SROB11 outputs))
    (cons "SROB10" (MULT18X18C_Outputs-SROB10 outputs))
    (cons "SROB1" (MULT18X18C_Outputs-SROB1 outputs))
    (cons "SROB0" (MULT18X18C_Outputs-SROB0 outputs))
    (cons "SROA9" (MULT18X18C_Outputs-SROA9 outputs))
    (cons "SROA8" (MULT18X18C_Outputs-SROA8 outputs))
    (cons "SROA7" (MULT18X18C_Outputs-SROA7 outputs))
    (cons "SROA6" (MULT18X18C_Outputs-SROA6 outputs))
    (cons "SROA5" (MULT18X18C_Outputs-SROA5 outputs))
    (cons "SROA4" (MULT18X18C_Outputs-SROA4 outputs))
    (cons "SROA3" (MULT18X18C_Outputs-SROA3 outputs))
    (cons "SROA2" (MULT18X18C_Outputs-SROA2 outputs))
    (cons "SROA17" (MULT18X18C_Outputs-SROA17 outputs))
    (cons "SROA16" (MULT18X18C_Outputs-SROA16 outputs))
    (cons "SROA15" (MULT18X18C_Outputs-SROA15 outputs))
    (cons "SROA14" (MULT18X18C_Outputs-SROA14 outputs))
    (cons "SROA13" (MULT18X18C_Outputs-SROA13 outputs))
    (cons "SROA12" (MULT18X18C_Outputs-SROA12 outputs))
    (cons "SROA11" (MULT18X18C_Outputs-SROA11 outputs))
    (cons "SROA10" (MULT18X18C_Outputs-SROA10 outputs))
    (cons "SROA1" (MULT18X18C_Outputs-SROA1 outputs))
    (cons "SROA0" (MULT18X18C_Outputs-SROA0 outputs))
    (cons "SIGNEDP" (MULT18X18C_Outputs-SIGNEDP outputs))
    (cons "ROB9" (MULT18X18C_Outputs-ROB9 outputs))
    (cons "ROB8" (MULT18X18C_Outputs-ROB8 outputs))
    (cons "ROB7" (MULT18X18C_Outputs-ROB7 outputs))
    (cons "ROB6" (MULT18X18C_Outputs-ROB6 outputs))
    (cons "ROB5" (MULT18X18C_Outputs-ROB5 outputs))
    (cons "ROB4" (MULT18X18C_Outputs-ROB4 outputs))
    (cons "ROB3" (MULT18X18C_Outputs-ROB3 outputs))
    (cons "ROB2" (MULT18X18C_Outputs-ROB2 outputs))
    (cons "ROB17" (MULT18X18C_Outputs-ROB17 outputs))
    (cons "ROB16" (MULT18X18C_Outputs-ROB16 outputs))
    (cons "ROB15" (MULT18X18C_Outputs-ROB15 outputs))
    (cons "ROB14" (MULT18X18C_Outputs-ROB14 outputs))
    (cons "ROB13" (MULT18X18C_Outputs-ROB13 outputs))
    (cons "ROB12" (MULT18X18C_Outputs-ROB12 outputs))
    (cons "ROB11" (MULT18X18C_Outputs-ROB11 outputs))
    (cons "ROB10" (MULT18X18C_Outputs-ROB10 outputs))
    (cons "ROB1" (MULT18X18C_Outputs-ROB1 outputs))
    (cons "ROB0" (MULT18X18C_Outputs-ROB0 outputs))
    (cons "ROA9" (MULT18X18C_Outputs-ROA9 outputs))
    (cons "ROA8" (MULT18X18C_Outputs-ROA8 outputs))
    (cons "ROA7" (MULT18X18C_Outputs-ROA7 outputs))
    (cons "ROA6" (MULT18X18C_Outputs-ROA6 outputs))
    (cons "ROA5" (MULT18X18C_Outputs-ROA5 outputs))
    (cons "ROA4" (MULT18X18C_Outputs-ROA4 outputs))
    (cons "ROA3" (MULT18X18C_Outputs-ROA3 outputs))
    (cons "ROA2" (MULT18X18C_Outputs-ROA2 outputs))
    (cons "ROA17" (MULT18X18C_Outputs-ROA17 outputs))
    (cons "ROA16" (MULT18X18C_Outputs-ROA16 outputs))
    (cons "ROA15" (MULT18X18C_Outputs-ROA15 outputs))
    (cons "ROA14" (MULT18X18C_Outputs-ROA14 outputs))
    (cons "ROA13" (MULT18X18C_Outputs-ROA13 outputs))
    (cons "ROA12" (MULT18X18C_Outputs-ROA12 outputs))
    (cons "ROA11" (MULT18X18C_Outputs-ROA11 outputs))
    (cons "ROA10" (MULT18X18C_Outputs-ROA10 outputs))
    (cons "ROA1" (MULT18X18C_Outputs-ROA1 outputs))
    (cons "ROA0" (MULT18X18C_Outputs-ROA0 outputs))
    (cons "P9" (MULT18X18C_Outputs-P9 outputs))
    (cons "P8" (MULT18X18C_Outputs-P8 outputs))
    (cons "P7" (MULT18X18C_Outputs-P7 outputs))
    (cons "P6" (MULT18X18C_Outputs-P6 outputs))
    (cons "P5" (MULT18X18C_Outputs-P5 outputs))
    (cons "P4" (MULT18X18C_Outputs-P4 outputs))
    (cons "P35" (MULT18X18C_Outputs-P35 outputs))
    (cons "P34" (MULT18X18C_Outputs-P34 outputs))
    (cons "P33" (MULT18X18C_Outputs-P33 outputs))
    (cons "P32" (MULT18X18C_Outputs-P32 outputs))
    (cons "P31" (MULT18X18C_Outputs-P31 outputs))
    (cons "P30" (MULT18X18C_Outputs-P30 outputs))
    (cons "P3" (MULT18X18C_Outputs-P3 outputs))
    (cons "P29" (MULT18X18C_Outputs-P29 outputs))
    (cons "P28" (MULT18X18C_Outputs-P28 outputs))
    (cons "P27" (MULT18X18C_Outputs-P27 outputs))
    (cons "P26" (MULT18X18C_Outputs-P26 outputs))
    (cons "P25" (MULT18X18C_Outputs-P25 outputs))
    (cons "P24" (MULT18X18C_Outputs-P24 outputs))
    (cons "P23" (MULT18X18C_Outputs-P23 outputs))
    (cons "P22" (MULT18X18C_Outputs-P22 outputs))
    (cons "P21" (MULT18X18C_Outputs-P21 outputs))
    (cons "P20" (MULT18X18C_Outputs-P20 outputs))
    (cons "P2" (MULT18X18C_Outputs-P2 outputs))
    (cons "P19" (MULT18X18C_Outputs-P19 outputs))
    (cons "P18" (MULT18X18C_Outputs-P18 outputs))
    (cons "P17" (MULT18X18C_Outputs-P17 outputs))
    (cons "P16" (MULT18X18C_Outputs-P16 outputs))
    (cons "P15" (MULT18X18C_Outputs-P15 outputs))
    (cons "P14" (MULT18X18C_Outputs-P14 outputs))
    (cons "P13" (MULT18X18C_Outputs-P13 outputs))
    (cons "P12" (MULT18X18C_Outputs-P12 outputs))
    (cons "P11" (MULT18X18C_Outputs-P11 outputs))
    (cons "P10" (MULT18X18C_Outputs-P10 outputs))
    (cons "P1" (MULT18X18C_Outputs-P1 outputs))
    (cons "P0" (MULT18X18C_Outputs-P0 outputs))))
(define (MULT18X18C inputs state)
  (let ((CLK0 (MULT18X18C_Inputs-CLK0 inputs))) ; (bitvector 1)
  (let ((CLK3 (MULT18X18C_Inputs-CLK3 inputs))) ; (bitvector 1)
  (let ((REG_PIPELINE_CLK (MULT18X18C_Inputs-REG_PIPELINE_CLK inputs))) ; (bitvector 5)
  (let ((n4 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_591$15$_Y
      (bool->bitvector (bveq REG_PIPELINE_CLK n4)))) ; (bitvector 1)
  (let
    (($procmux$504$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_591$15$_Y)
        CLK3
        CLK0))) ; (bitvector 1)
  (let ((CLK2 (MULT18X18C_Inputs-CLK2 inputs))) ; (bitvector 1)
  (let ((n9 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_590$14$_Y
      (bool->bitvector (bveq REG_PIPELINE_CLK n9)))) ; (bitvector 1)
  (let
    (($procmux$516$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_590$14$_Y)
        CLK2
        $procmux$504$_Y))) ; (bitvector 1)
  (let ((CLK1 (MULT18X18C_Inputs-CLK1 inputs))) ; (bitvector 1)
  (let ((n14 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_589$13$_Y
      (bool->bitvector (bveq REG_PIPELINE_CLK n14)))) ; (bitvector 1)
  (let
    (($procmux$525$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_589$13$_Y)
        CLK1
        $procmux$516$_Y))) ; (bitvector 1)
  (let ((n18 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_588$12$_Y
      (bool->bitvector (bveq REG_PIPELINE_CLK n18)))) ; (bitvector 1)
  (let
    ((pipeline_clk_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_588$12$_Y)
        CLK0
        $procmux$525$_Y))) ; (bitvector 1)
  (let ((REG_INPUTA_CLK (MULT18X18C_Inputs-REG_INPUTA_CLK inputs))) ; (bitvector 5)
  (let ((n22 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_575$5$_Y
      (bool->bitvector (bveq REG_INPUTA_CLK n22)))) ; (bitvector 1)
  (let
    (($procmux$564$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_575$5$_Y)
        CLK3
        CLK0))) ; (bitvector 1)
  (let ((n25 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_574$4$_Y
      (bool->bitvector (bveq REG_INPUTA_CLK n25)))) ; (bitvector 1)
  (let
    (($procmux$576$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_574$4$_Y)
        CLK2
        $procmux$564$_Y))) ; (bitvector 1)
  (let ((n28 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_573$3$_Y
      (bool->bitvector (bveq REG_INPUTA_CLK n28)))) ; (bitvector 1)
  (let
    (($procmux$585$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_573$3$_Y)
        CLK1
        $procmux$576$_Y))) ; (bitvector 1)
  (let ((n31 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_572$2$_Y
      (bool->bitvector (bveq REG_INPUTA_CLK n31)))) ; (bitvector 1)
  (let
    ((input_a_clk_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_572$2$_Y)
        CLK0
        $procmux$585$_Y))) ; (bitvector 1)
  (let ((REG_INPUTB_CLK (MULT18X18C_Inputs-REG_INPUTB_CLK inputs))) ; (bitvector 5)
  (let ((n35 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_583$10$_Y
      (bool->bitvector (bveq REG_INPUTB_CLK n35)))) ; (bitvector 1)
  (let
    (($procmux$534$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_583$10$_Y)
        CLK3
        CLK0))) ; (bitvector 1)
  (let ((n38 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_582$9$_Y
      (bool->bitvector (bveq REG_INPUTB_CLK n38)))) ; (bitvector 1)
  (let
    (($procmux$546$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_582$9$_Y)
        CLK2
        $procmux$534$_Y))) ; (bitvector 1)
  (let ((n41 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_581$8$_Y
      (bool->bitvector (bveq REG_INPUTB_CLK n41)))) ; (bitvector 1)
  (let
    (($procmux$555$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_581$8$_Y)
        CLK1
        $procmux$546$_Y))) ; (bitvector 1)
  (let ((n44 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_580$7$_Y
      (bool->bitvector (bveq REG_INPUTB_CLK n44)))) ; (bitvector 1)
  (let
    ((input_b_clk_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_580$7$_Y)
        CLK0
        $procmux$555$_Y))) ; (bitvector 1)
  (let ((REG_OUTPUT_CLK (MULT18X18C_Inputs-REG_OUTPUT_CLK inputs))) ; (bitvector 5)
  (let ((n48 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_599$20$_Y
      (bool->bitvector (bveq REG_OUTPUT_CLK n48)))) ; (bitvector 1)
  (let
    (($procmux$474$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_599$20$_Y)
        CLK3
        CLK0))) ; (bitvector 1)
  (let ((n51 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_598$19$_Y
      (bool->bitvector (bveq REG_OUTPUT_CLK n51)))) ; (bitvector 1)
  (let
    (($procmux$486$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_598$19$_Y)
        CLK2
        $procmux$474$_Y))) ; (bitvector 1)
  (let ((n54 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_597$18$_Y
      (bool->bitvector (bveq REG_OUTPUT_CLK n54)))) ; (bitvector 1)
  (let
    (($procmux$495$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_597$18$_Y)
        CLK1
        $procmux$486$_Y))) ; (bitvector 1)
  (let ((n57 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_596$17$_Y
      (bool->bitvector (bveq REG_OUTPUT_CLK n57)))) ; (bitvector 1)
  (let
    ((output_clk_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_596$17$_Y)
        CLK0
        $procmux$495$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$636$_Q
      (MULT18X18C_State-$auto$clk2fflogic.cc_102_sample_data$636 state))) ; (bitvector 36)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$638$_Q
      (MULT18X18C_State-$auto$clk2fflogic.cc_102_sample_data$638 state))) ; (bitvector 36)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_pipeline_clk_sig_sampled$639
      (MULT18X18C_State-$auto$clk2fflogic.cc_86_sample_control_edge$640 state))) ; (bitvector 1)
  (let
    ((n63
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_pipeline_clk_sig_sampled$639
        pipeline_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$641$_Y
      (bool->bitvector (bveq n63 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((p_sig_o_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$641$_Y)
        $auto$clk2fflogic.cc_102_sample_data$638$_Q
        $auto$clk2fflogic.cc_102_sample_data$636$_Q))) ; (bitvector 36)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$676$_Q
      (MULT18X18C_State-$auto$clk2fflogic.cc_102_sample_data$676 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$678$_Q
      (MULT18X18C_State-$auto$clk2fflogic.cc_102_sample_data$678 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_input_a_clk_sig_sampled$679
      (MULT18X18C_State-$auto$clk2fflogic.cc_86_sample_control_edge$680 state))) ; (bitvector 1)
  (let
    ((n70
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_input_a_clk_sig_sampled$679
        input_a_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$681$_Y
      (bool->bitvector (bveq n70 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((a_sig_reg_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$681$_Y)
        $auto$clk2fflogic.cc_102_sample_data$678$_Q
        $auto$clk2fflogic.cc_102_sample_data$676$_Q))) ; (bitvector 18)
  (let ((A0 (MULT18X18C_Inputs-A0 inputs))) ; (bitvector 1)
  (let ((A1 (MULT18X18C_Inputs-A1 inputs))) ; (bitvector 1)
  (let ((n75 (concat A1 A0))) ; (bitvector 2)
  (let ((A2 (MULT18X18C_Inputs-A2 inputs))) ; (bitvector 1)
  (let ((n77 (concat A2 n75))) ; (bitvector 3)
  (let ((A3 (MULT18X18C_Inputs-A3 inputs))) ; (bitvector 1)
  (let ((n79 (concat A3 n77))) ; (bitvector 4)
  (let ((A4 (MULT18X18C_Inputs-A4 inputs))) ; (bitvector 1)
  (let ((n81 (concat A4 n79))) ; (bitvector 5)
  (let ((A5 (MULT18X18C_Inputs-A5 inputs))) ; (bitvector 1)
  (let ((n83 (concat A5 n81))) ; (bitvector 6)
  (let ((A6 (MULT18X18C_Inputs-A6 inputs))) ; (bitvector 1)
  (let ((n85 (concat A6 n83))) ; (bitvector 7)
  (let ((A7 (MULT18X18C_Inputs-A7 inputs))) ; (bitvector 1)
  (let ((n87 (concat A7 n85))) ; (bitvector 8)
  (let ((A8 (MULT18X18C_Inputs-A8 inputs))) ; (bitvector 1)
  (let ((n89 (concat A8 n87))) ; (bitvector 9)
  (let ((A9 (MULT18X18C_Inputs-A9 inputs))) ; (bitvector 1)
  (let ((n91 (concat A9 n89))) ; (bitvector 10)
  (let ((A10 (MULT18X18C_Inputs-A10 inputs))) ; (bitvector 1)
  (let ((n93 (concat A10 n91))) ; (bitvector 11)
  (let ((A11 (MULT18X18C_Inputs-A11 inputs))) ; (bitvector 1)
  (let ((n95 (concat A11 n93))) ; (bitvector 12)
  (let ((A12 (MULT18X18C_Inputs-A12 inputs))) ; (bitvector 1)
  (let ((n97 (concat A12 n95))) ; (bitvector 13)
  (let ((A13 (MULT18X18C_Inputs-A13 inputs))) ; (bitvector 1)
  (let ((n99 (concat A13 n97))) ; (bitvector 14)
  (let ((A14 (MULT18X18C_Inputs-A14 inputs))) ; (bitvector 1)
  (let ((n101 (concat A14 n99))) ; (bitvector 15)
  (let ((A15 (MULT18X18C_Inputs-A15 inputs))) ; (bitvector 1)
  (let ((n103 (concat A15 n101))) ; (bitvector 16)
  (let ((A16 (MULT18X18C_Inputs-A16 inputs))) ; (bitvector 1)
  (let ((n105 (concat A16 n103))) ; (bitvector 17)
  (let ((A17 (MULT18X18C_Inputs-A17 inputs))) ; (bitvector 1)
  (let ((n107 (concat A17 n105))) ; (bitvector 18)
  (let ((SRIA0 (MULT18X18C_Inputs-SRIA0 inputs))) ; (bitvector 1)
  (let ((SRIA1 (MULT18X18C_Inputs-SRIA1 inputs))) ; (bitvector 1)
  (let ((n110 (concat SRIA1 SRIA0))) ; (bitvector 2)
  (let ((SRIA2 (MULT18X18C_Inputs-SRIA2 inputs))) ; (bitvector 1)
  (let ((n112 (concat SRIA2 n110))) ; (bitvector 3)
  (let ((SRIA3 (MULT18X18C_Inputs-SRIA3 inputs))) ; (bitvector 1)
  (let ((n114 (concat SRIA3 n112))) ; (bitvector 4)
  (let ((SRIA4 (MULT18X18C_Inputs-SRIA4 inputs))) ; (bitvector 1)
  (let ((n116 (concat SRIA4 n114))) ; (bitvector 5)
  (let ((SRIA5 (MULT18X18C_Inputs-SRIA5 inputs))) ; (bitvector 1)
  (let ((n118 (concat SRIA5 n116))) ; (bitvector 6)
  (let ((SRIA6 (MULT18X18C_Inputs-SRIA6 inputs))) ; (bitvector 1)
  (let ((n120 (concat SRIA6 n118))) ; (bitvector 7)
  (let ((SRIA7 (MULT18X18C_Inputs-SRIA7 inputs))) ; (bitvector 1)
  (let ((n122 (concat SRIA7 n120))) ; (bitvector 8)
  (let ((SRIA8 (MULT18X18C_Inputs-SRIA8 inputs))) ; (bitvector 1)
  (let ((n124 (concat SRIA8 n122))) ; (bitvector 9)
  (let ((SRIA9 (MULT18X18C_Inputs-SRIA9 inputs))) ; (bitvector 1)
  (let ((n126 (concat SRIA9 n124))) ; (bitvector 10)
  (let ((SRIA10 (MULT18X18C_Inputs-SRIA10 inputs))) ; (bitvector 1)
  (let ((n128 (concat SRIA10 n126))) ; (bitvector 11)
  (let ((SRIA11 (MULT18X18C_Inputs-SRIA11 inputs))) ; (bitvector 1)
  (let ((n130 (concat SRIA11 n128))) ; (bitvector 12)
  (let ((SRIA12 (MULT18X18C_Inputs-SRIA12 inputs))) ; (bitvector 1)
  (let ((n132 (concat SRIA12 n130))) ; (bitvector 13)
  (let ((SRIA13 (MULT18X18C_Inputs-SRIA13 inputs))) ; (bitvector 1)
  (let ((n134 (concat SRIA13 n132))) ; (bitvector 14)
  (let ((SRIA14 (MULT18X18C_Inputs-SRIA14 inputs))) ; (bitvector 1)
  (let ((n136 (concat SRIA14 n134))) ; (bitvector 15)
  (let ((SRIA15 (MULT18X18C_Inputs-SRIA15 inputs))) ; (bitvector 1)
  (let ((n138 (concat SRIA15 n136))) ; (bitvector 16)
  (let ((SRIA16 (MULT18X18C_Inputs-SRIA16 inputs))) ; (bitvector 1)
  (let ((n140 (concat SRIA16 n138))) ; (bitvector 17)
  (let ((SRIA17 (MULT18X18C_Inputs-SRIA17 inputs))) ; (bitvector 1)
  (let ((n142 (concat SRIA17 n140))) ; (bitvector 18)
  (let ((SOURCEA (MULT18X18C_Inputs-SOURCEA inputs))) ; (bitvector 1)
  (let ((a_sig_s_1 (if (bitvector->bool SOURCEA) n142 n107))) ; (bitvector 18)
  (let ((n145 (apply bvor (bitvector->bits REG_INPUTA_CLK)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_775$81$_Y
      (bvnot n145))) ; (bitvector 1)
  (let
    ((a_sig_gen
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_775$81$_Y)
        a_sig_s_1
        a_sig_reg_sync))) ; (bitvector 18)
  (let ((n149 (extract 17 17 a_sig_gen))) ; (bitvector 1)
  (let ((n150 (concat n149 n149))) ; (bitvector 2)
  (let ((n151 (concat n149 n150))) ; (bitvector 3)
  (let ((n152 (concat n149 n151))) ; (bitvector 4)
  (let ((n153 (concat n149 n152))) ; (bitvector 5)
  (let ((n154 (concat n149 n153))) ; (bitvector 6)
  (let ((n155 (concat n149 n154))) ; (bitvector 7)
  (let ((n156 (concat n149 n155))) ; (bitvector 8)
  (let ((n157 (concat n149 n156))) ; (bitvector 9)
  (let ((n158 (concat n149 n157))) ; (bitvector 10)
  (let ((n159 (concat n149 n158))) ; (bitvector 11)
  (let ((n160 (concat n149 n159))) ; (bitvector 12)
  (let ((n161 (concat n149 n160))) ; (bitvector 13)
  (let ((n162 (concat n149 n161))) ; (bitvector 14)
  (let ((n163 (concat n149 n162))) ; (bitvector 15)
  (let ((n164 (concat n149 n163))) ; (bitvector 16)
  (let ((n165 (concat n149 n164))) ; (bitvector 17)
  (let ((n166 (concat n149 n165))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_signeda_reg1_sync_sampled$695
      (MULT18X18C_State-$auto$clk2fflogic.cc_102_sample_data$696 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_signeda_reg1_sync_0_0__sampled$697
      (MULT18X18C_State-$auto$clk2fflogic.cc_102_sample_data$698 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_input_a_clk_sig_sampled$699
      (MULT18X18C_State-$auto$clk2fflogic.cc_86_sample_control_edge$700 state))) ; (bitvector 1)
  (let
    ((n170
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_input_a_clk_sig_sampled$699
        input_a_clk_sig))) ; (bitvector 2)
  (let
    (($auto$rtlil.cc_2974_Eqx$702 (bool->bitvector (bveq n170 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((signeda_reg1_sync
      (if
        (bitvector->bool $auto$rtlil.cc_2974_Eqx$702)
        $auto$clk2fflogic.cc_95_sample_data$$0_signeda_reg1_sync_0_0__sampled$697
        $auto$clk2fflogic.cc_95_sample_data$_signeda_reg1_sync_sampled$695))) ; (bitvector 1)
  (let ((SIGNEDA (MULT18X18C_Inputs-SIGNEDA inputs))) ; (bitvector 1)
  (let
    ((signeda_p1
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_775$81$_Y)
        SIGNEDA
        signeda_reg1_sync))) ; (bitvector 1)
  (let
    (($procmux$158$_Y
      (if (bitvector->bool signeda_p1) n166 (bv #b000000000000000000 18)))) ; (bitvector 18)
  (let ((a_sig_m (concat $procmux$158$_Y a_sig_gen))) ; (bitvector 36)
  (let ((n177 (extract 35 18 a_sig_m))) ; (bitvector 18)
  (let ((n178 (concat n177 a_sig_gen))) ; (bitvector 36)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$656$_Q
      (MULT18X18C_State-$auto$clk2fflogic.cc_102_sample_data$656 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$658$_Q
      (MULT18X18C_State-$auto$clk2fflogic.cc_102_sample_data$658 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_input_b_clk_sig_sampled$659
      (MULT18X18C_State-$auto$clk2fflogic.cc_86_sample_control_edge$660 state))) ; (bitvector 1)
  (let
    ((n182
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_input_b_clk_sig_sampled$659
        input_b_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$661$_Y
      (bool->bitvector (bveq n182 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((b_sig_reg_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$661$_Y)
        $auto$clk2fflogic.cc_102_sample_data$658$_Q
        $auto$clk2fflogic.cc_102_sample_data$656$_Q))) ; (bitvector 18)
  (let ((B0 (MULT18X18C_Inputs-B0 inputs))) ; (bitvector 1)
  (let ((B1 (MULT18X18C_Inputs-B1 inputs))) ; (bitvector 1)
  (let ((n187 (concat B1 B0))) ; (bitvector 2)
  (let ((B2 (MULT18X18C_Inputs-B2 inputs))) ; (bitvector 1)
  (let ((n189 (concat B2 n187))) ; (bitvector 3)
  (let ((B3 (MULT18X18C_Inputs-B3 inputs))) ; (bitvector 1)
  (let ((n191 (concat B3 n189))) ; (bitvector 4)
  (let ((B4 (MULT18X18C_Inputs-B4 inputs))) ; (bitvector 1)
  (let ((n193 (concat B4 n191))) ; (bitvector 5)
  (let ((B5 (MULT18X18C_Inputs-B5 inputs))) ; (bitvector 1)
  (let ((n195 (concat B5 n193))) ; (bitvector 6)
  (let ((B6 (MULT18X18C_Inputs-B6 inputs))) ; (bitvector 1)
  (let ((n197 (concat B6 n195))) ; (bitvector 7)
  (let ((B7 (MULT18X18C_Inputs-B7 inputs))) ; (bitvector 1)
  (let ((n199 (concat B7 n197))) ; (bitvector 8)
  (let ((B8 (MULT18X18C_Inputs-B8 inputs))) ; (bitvector 1)
  (let ((n201 (concat B8 n199))) ; (bitvector 9)
  (let ((B9 (MULT18X18C_Inputs-B9 inputs))) ; (bitvector 1)
  (let ((n203 (concat B9 n201))) ; (bitvector 10)
  (let ((B10 (MULT18X18C_Inputs-B10 inputs))) ; (bitvector 1)
  (let ((n205 (concat B10 n203))) ; (bitvector 11)
  (let ((B11 (MULT18X18C_Inputs-B11 inputs))) ; (bitvector 1)
  (let ((n207 (concat B11 n205))) ; (bitvector 12)
  (let ((B12 (MULT18X18C_Inputs-B12 inputs))) ; (bitvector 1)
  (let ((n209 (concat B12 n207))) ; (bitvector 13)
  (let ((B13 (MULT18X18C_Inputs-B13 inputs))) ; (bitvector 1)
  (let ((n211 (concat B13 n209))) ; (bitvector 14)
  (let ((B14 (MULT18X18C_Inputs-B14 inputs))) ; (bitvector 1)
  (let ((n213 (concat B14 n211))) ; (bitvector 15)
  (let ((B15 (MULT18X18C_Inputs-B15 inputs))) ; (bitvector 1)
  (let ((n215 (concat B15 n213))) ; (bitvector 16)
  (let ((B16 (MULT18X18C_Inputs-B16 inputs))) ; (bitvector 1)
  (let ((n217 (concat B16 n215))) ; (bitvector 17)
  (let ((B17 (MULT18X18C_Inputs-B17 inputs))) ; (bitvector 1)
  (let ((n219 (concat B17 n217))) ; (bitvector 18)
  (let ((SRIB0 (MULT18X18C_Inputs-SRIB0 inputs))) ; (bitvector 1)
  (let ((SRIB1 (MULT18X18C_Inputs-SRIB1 inputs))) ; (bitvector 1)
  (let ((n222 (concat SRIB1 SRIB0))) ; (bitvector 2)
  (let ((SRIB2 (MULT18X18C_Inputs-SRIB2 inputs))) ; (bitvector 1)
  (let ((n224 (concat SRIB2 n222))) ; (bitvector 3)
  (let ((SRIB3 (MULT18X18C_Inputs-SRIB3 inputs))) ; (bitvector 1)
  (let ((n226 (concat SRIB3 n224))) ; (bitvector 4)
  (let ((SRIB4 (MULT18X18C_Inputs-SRIB4 inputs))) ; (bitvector 1)
  (let ((n228 (concat SRIB4 n226))) ; (bitvector 5)
  (let ((SRIB5 (MULT18X18C_Inputs-SRIB5 inputs))) ; (bitvector 1)
  (let ((n230 (concat SRIB5 n228))) ; (bitvector 6)
  (let ((SRIB6 (MULT18X18C_Inputs-SRIB6 inputs))) ; (bitvector 1)
  (let ((n232 (concat SRIB6 n230))) ; (bitvector 7)
  (let ((SRIB7 (MULT18X18C_Inputs-SRIB7 inputs))) ; (bitvector 1)
  (let ((n234 (concat SRIB7 n232))) ; (bitvector 8)
  (let ((SRIB8 (MULT18X18C_Inputs-SRIB8 inputs))) ; (bitvector 1)
  (let ((n236 (concat SRIB8 n234))) ; (bitvector 9)
  (let ((SRIB9 (MULT18X18C_Inputs-SRIB9 inputs))) ; (bitvector 1)
  (let ((n238 (concat SRIB9 n236))) ; (bitvector 10)
  (let ((SRIB10 (MULT18X18C_Inputs-SRIB10 inputs))) ; (bitvector 1)
  (let ((n240 (concat SRIB10 n238))) ; (bitvector 11)
  (let ((SRIB11 (MULT18X18C_Inputs-SRIB11 inputs))) ; (bitvector 1)
  (let ((n242 (concat SRIB11 n240))) ; (bitvector 12)
  (let ((SRIB12 (MULT18X18C_Inputs-SRIB12 inputs))) ; (bitvector 1)
  (let ((n244 (concat SRIB12 n242))) ; (bitvector 13)
  (let ((SRIB13 (MULT18X18C_Inputs-SRIB13 inputs))) ; (bitvector 1)
  (let ((n246 (concat SRIB13 n244))) ; (bitvector 14)
  (let ((SRIB14 (MULT18X18C_Inputs-SRIB14 inputs))) ; (bitvector 1)
  (let ((n248 (concat SRIB14 n246))) ; (bitvector 15)
  (let ((SRIB15 (MULT18X18C_Inputs-SRIB15 inputs))) ; (bitvector 1)
  (let ((n250 (concat SRIB15 n248))) ; (bitvector 16)
  (let ((SRIB16 (MULT18X18C_Inputs-SRIB16 inputs))) ; (bitvector 1)
  (let ((n252 (concat SRIB16 n250))) ; (bitvector 17)
  (let ((SRIB17 (MULT18X18C_Inputs-SRIB17 inputs))) ; (bitvector 1)
  (let ((n254 (concat SRIB17 n252))) ; (bitvector 18)
  (let ((SOURCEB (MULT18X18C_Inputs-SOURCEB inputs))) ; (bitvector 1)
  (let ((b_sig_s_1 (if (bitvector->bool SOURCEB) n254 n219))) ; (bitvector 18)
  (let ((n257 (apply bvor (bitvector->bits REG_INPUTB_CLK)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_802$88$_Y
      (bvnot n257))) ; (bitvector 1)
  (let
    ((b_sig_gen
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_802$88$_Y)
        b_sig_s_1
        b_sig_reg_sync))) ; (bitvector 18)
  (let ((n260 (extract 17 17 b_sig_gen))) ; (bitvector 1)
  (let ((n261 (concat n260 n260))) ; (bitvector 2)
  (let ((n262 (concat n260 n261))) ; (bitvector 3)
  (let ((n263 (concat n260 n262))) ; (bitvector 4)
  (let ((n264 (concat n260 n263))) ; (bitvector 5)
  (let ((n265 (concat n260 n264))) ; (bitvector 6)
  (let ((n266 (concat n260 n265))) ; (bitvector 7)
  (let ((n267 (concat n260 n266))) ; (bitvector 8)
  (let ((n268 (concat n260 n267))) ; (bitvector 9)
  (let ((n269 (concat n260 n268))) ; (bitvector 10)
  (let ((n270 (concat n260 n269))) ; (bitvector 11)
  (let ((n271 (concat n260 n270))) ; (bitvector 12)
  (let ((n272 (concat n260 n271))) ; (bitvector 13)
  (let ((n273 (concat n260 n272))) ; (bitvector 14)
  (let ((n274 (concat n260 n273))) ; (bitvector 15)
  (let ((n275 (concat n260 n274))) ; (bitvector 16)
  (let ((n276 (concat n260 n275))) ; (bitvector 17)
  (let ((n277 (concat n260 n276))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$666$_Q
      (MULT18X18C_State-$auto$clk2fflogic.cc_102_sample_data$666 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$668$_Q
      (MULT18X18C_State-$auto$clk2fflogic.cc_102_sample_data$668 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_input_b_clk_sig_sampled$669
      (MULT18X18C_State-$auto$clk2fflogic.cc_86_sample_control_edge$670 state))) ; (bitvector 1)
  (let
    ((n281
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_input_b_clk_sig_sampled$669
        input_b_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$671$_Y
      (bool->bitvector (bveq n281 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((signedb_reg1_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$671$_Y)
        $auto$clk2fflogic.cc_102_sample_data$668$_Q
        $auto$clk2fflogic.cc_102_sample_data$666$_Q))) ; (bitvector 1)
  (let ((SIGNEDB (MULT18X18C_Inputs-SIGNEDB inputs))) ; (bitvector 1)
  (let
    ((signedb_p1
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_802$88$_Y)
        SIGNEDB
        signedb_reg1_sync))) ; (bitvector 1)
  (let
    (($procmux$153$_Y
      (if (bitvector->bool signedb_p1) n277 (bv #b000000000000000000 18)))) ; (bitvector 18)
  (let ((b_sig_m (concat $procmux$153$_Y b_sig_gen))) ; (bitvector 36)
  (let ((n288 (extract 35 18 b_sig_m))) ; (bitvector 18)
  (let ((n289 (concat n288 b_sig_gen))) ; (bitvector 36)
  (let
    (($mul$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_871$96$_Y
      (bvmul n178 n289))) ; (bitvector 36)
  (let ((n292 (apply bvor (bitvector->bits n178)))) ; (bitvector 1)
  (let
    (($logic_not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_871$93$_Y
      (bvnot n292))) ; (bitvector 1)
  (let ((n294 (apply bvor (bitvector->bits n289)))) ; (bitvector 1)
  (let
    (($logic_not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_871$94$_Y
      (bvnot n294))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_871$95$_Y
      (bvor
        $logic_not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_871$93$_Y
        $logic_not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_871$94$_Y))) ; (bitvector 1)
  (let
    ((p_sig_i
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_871$95$_Y)
        (bv #b000000000000000000000000000000000000 36)
        $mul$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_871$96$_Y))) ; (bitvector 36)
  (let ((CE0 (MULT18X18C_Inputs-CE0 inputs))) ; (bitvector 1)
  (let ((CE3 (MULT18X18C_Inputs-CE3 inputs))) ; (bitvector 1)
  (let ((REG_PIPELINE_CE (MULT18X18C_Inputs-REG_PIPELINE_CE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_623$35$_Y
      (bool->bitvector (bveq REG_PIPELINE_CE (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($procmux$384$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_623$35$_Y)
        CE3
        CE0))) ; (bitvector 1)
  (let ((CE2 (MULT18X18C_Inputs-CE2 inputs))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_622$34$_Y
      (bool->bitvector (bveq REG_PIPELINE_CE (bv #b10000 5))))) ; (bitvector 1)
  (let
    (($procmux$396$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_622$34$_Y)
        CE2
        $procmux$384$_Y))) ; (bitvector 1)
  (let ((CE1 (MULT18X18C_Inputs-CE1 inputs))) ; (bitvector 1)
  (let ((n310 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_621$33$_Y
      (bool->bitvector (bveq REG_PIPELINE_CE n310)))) ; (bitvector 1)
  (let
    (($procmux$405$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_621$33$_Y)
        CE1
        $procmux$396$_Y))) ; (bitvector 1)
  (let ((n314 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_620$32$_Y
      (bool->bitvector (bveq REG_PIPELINE_CE n314)))) ; (bitvector 1)
  (let
    ((pipeline_ce_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_620$32$_Y)
        CE0
        $procmux$405$_Y))) ; (bitvector 1)
  (let
    (($procmux$143$_Y
      (if (bitvector->bool pipeline_ce_sig) p_sig_i p_sig_o_sync))) ; (bitvector 36)
  (let ((RST0 (MULT18X18C_Inputs-RST0 inputs))) ; (bitvector 1)
  (let ((RST3 (MULT18X18C_Inputs-RST3 inputs))) ; (bitvector 1)
  (let ((REG_PIPELINE_RST (MULT18X18C_Inputs-REG_PIPELINE_RST inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_655$55$_Y
      (bool->bitvector (bveq REG_PIPELINE_RST (bv #b10100 5))))) ; (bitvector 1)
  (let
    (($procmux$264$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_655$55$_Y)
        RST3
        RST0))) ; (bitvector 1)
  (let ((RST2 (MULT18X18C_Inputs-RST2 inputs))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_654$54$_Y
      (bool->bitvector (bveq REG_PIPELINE_RST (bv #b10011 5))))) ; (bitvector 1)
  (let
    (($procmux$276$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_654$54$_Y)
        RST2
        $procmux$264$_Y))) ; (bitvector 1)
  (let ((RST1 (MULT18X18C_Inputs-RST1 inputs))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_653$53$_Y
      (bool->bitvector (bveq REG_PIPELINE_RST (bv #b10010 5))))) ; (bitvector 1)
  (let
    (($procmux$285$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_653$53$_Y)
        RST1
        $procmux$276$_Y))) ; (bitvector 1)
  (let ((n333 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_652$52$_Y
      (bool->bitvector (bveq REG_PIPELINE_RST n333)))) ; (bitvector 1)
  (let
    ((pipeline_rst_ogsr
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_652$52$_Y)
        RST0
        $procmux$285$_Y))) ; (bitvector 1)
  (let
    (($0_p_sig_o_sync_35_0_
      (if
        (bitvector->bool pipeline_rst_ogsr)
        (bv #b000000000000000000000000000000000000 36)
        $procmux$143$_Y))) ; (bitvector 36)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$686$_Q
      (MULT18X18C_State-$auto$clk2fflogic.cc_102_sample_data$686 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$688$_Q
      (MULT18X18C_State-$auto$clk2fflogic.cc_102_sample_data$688 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_input_a_clk_sig_sampled$689
      (MULT18X18C_State-$auto$clk2fflogic.cc_86_sample_control_edge$690 state))) ; (bitvector 1)
  (let
    ((n340
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_input_a_clk_sig_sampled$689
        input_a_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$691$_Y
      (bool->bitvector (bveq n340 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((a_sig_gen1_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$691$_Y)
        $auto$clk2fflogic.cc_102_sample_data$688$_Q
        $auto$clk2fflogic.cc_102_sample_data$686$_Q))) ; (bitvector 18)
  (let ((REG_INPUTA_CE (MULT18X18C_Inputs-REG_INPUTA_CE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_607$25$_Y
      (bool->bitvector (bveq REG_INPUTA_CE (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($procmux$444$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_607$25$_Y)
        CE3
        CE0))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_606$24$_Y
      (bool->bitvector (bveq REG_INPUTA_CE (bv #b10000 5))))) ; (bitvector 1)
  (let
    (($procmux$456$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_606$24$_Y)
        CE2
        $procmux$444$_Y))) ; (bitvector 1)
  (let ((n348 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_605$23$_Y
      (bool->bitvector (bveq REG_INPUTA_CE n348)))) ; (bitvector 1)
  (let
    (($procmux$465$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_605$23$_Y)
        CE1
        $procmux$456$_Y))) ; (bitvector 1)
  (let ((n351 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_604$22$_Y
      (bool->bitvector (bveq REG_INPUTA_CE n351)))) ; (bitvector 1)
  (let
    ((input_a_ce_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_604$22$_Y)
        CE0
        $procmux$465$_Y))) ; (bitvector 1)
  (let
    (($procmux$205$_Y
      (if (bitvector->bool input_a_ce_sig) a_sig_gen a_sig_gen1_sync))) ; (bitvector 18)
  (let ((REG_INPUTA_RST (MULT18X18C_Inputs-REG_INPUTA_RST inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_639$45$_Y
      (bool->bitvector (bveq REG_INPUTA_RST (bv #b10100 5))))) ; (bitvector 1)
  (let
    (($procmux$324$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_639$45$_Y)
        RST3
        RST0))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_638$44$_Y
      (bool->bitvector (bveq REG_INPUTA_RST (bv #b10011 5))))) ; (bitvector 1)
  (let
    (($procmux$336$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_638$44$_Y)
        RST2
        $procmux$324$_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_637$43$_Y
      (bool->bitvector (bveq REG_INPUTA_RST (bv #b10010 5))))) ; (bitvector 1)
  (let
    (($procmux$345$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_637$43$_Y)
        RST1
        $procmux$336$_Y))) ; (bitvector 1)
  (let ((n362 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_636$42$_Y
      (bool->bitvector (bveq REG_INPUTA_RST n362)))) ; (bitvector 1)
  (let
    ((input_a_rst_ogsr
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_636$42$_Y)
        RST0
        $procmux$345$_Y))) ; (bitvector 1)
  (let
    (($0_a_sig_gen1_sync_17_0_
      (if
        (bitvector->bool input_a_rst_ogsr)
        (bv #b000000000000000000 18)
        $procmux$205$_Y))) ; (bitvector 18)
  (let
    (($procmux$200$_Y
      (if (bitvector->bool input_a_ce_sig) SIGNEDA signeda_reg1_sync))) ; (bitvector 1)
  (let
    (($0_signeda_reg1_sync_0_0_
      (if (bitvector->bool input_a_rst_ogsr) (bv #b0 1) $procmux$200$_Y))) ; (bitvector 1)
  (let ((REG_INPUTB_CE (MULT18X18C_Inputs-REG_INPUTB_CE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_615$30$_Y
      (bool->bitvector (bveq REG_INPUTB_CE (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($procmux$414$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_615$30$_Y)
        CE3
        CE0))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_614$29$_Y
      (bool->bitvector (bveq REG_INPUTB_CE (bv #b10000 5))))) ; (bitvector 1)
  (let
    (($procmux$426$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_614$29$_Y)
        CE2
        $procmux$414$_Y))) ; (bitvector 1)
  (let ((n374 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_613$28$_Y
      (bool->bitvector (bveq REG_INPUTB_CE n374)))) ; (bitvector 1)
  (let
    (($procmux$435$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_613$28$_Y)
        CE1
        $procmux$426$_Y))) ; (bitvector 1)
  (let ((n377 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_612$27$_Y
      (bool->bitvector (bveq REG_INPUTB_CE n377)))) ; (bitvector 1)
  (let
    ((input_b_ce_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_612$27$_Y)
        CE0
        $procmux$435$_Y))) ; (bitvector 1)
  (let
    (($procmux$186$_Y
      (if (bitvector->bool input_b_ce_sig) SIGNEDB signedb_reg1_sync))) ; (bitvector 1)
  (let ((REG_INPUTB_RST (MULT18X18C_Inputs-REG_INPUTB_RST inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_647$50$_Y
      (bool->bitvector (bveq REG_INPUTB_RST (bv #b10100 5))))) ; (bitvector 1)
  (let
    (($procmux$294$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_647$50$_Y)
        RST3
        RST0))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_646$49$_Y
      (bool->bitvector (bveq REG_INPUTB_RST (bv #b10011 5))))) ; (bitvector 1)
  (let
    (($procmux$306$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_646$49$_Y)
        RST2
        $procmux$294$_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_645$48$_Y
      (bool->bitvector (bveq REG_INPUTB_RST (bv #b10010 5))))) ; (bitvector 1)
  (let
    (($procmux$315$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_645$48$_Y)
        RST1
        $procmux$306$_Y))) ; (bitvector 1)
  (let ((n388 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_644$47$_Y
      (bool->bitvector (bveq REG_INPUTB_RST n388)))) ; (bitvector 1)
  (let
    ((input_b_rst_ogsr
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_644$47$_Y)
        RST0
        $procmux$315$_Y))) ; (bitvector 1)
  (let
    (($0_signedb_reg1_sync_0_0_
      (if (bitvector->bool input_b_rst_ogsr) (bv #b0 1) $procmux$186$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$626$_Q
      (MULT18X18C_State-$auto$clk2fflogic.cc_102_sample_data$626 state))) ; (bitvector 36)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$628$_Q
      (MULT18X18C_State-$auto$clk2fflogic.cc_102_sample_data$628 state))) ; (bitvector 36)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_output_clk_sig_sampled$629
      (MULT18X18C_State-$auto$clk2fflogic.cc_86_sample_control_edge$630 state))) ; (bitvector 1)
  (let
    ((n395
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_output_clk_sig_sampled$629
        output_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$631$_Y
      (bool->bitvector (bveq n395 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((p_sig_o1_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$631$_Y)
        $auto$clk2fflogic.cc_102_sample_data$628$_Q
        $auto$clk2fflogic.cc_102_sample_data$626$_Q))) ; (bitvector 36)
  (let ((n398 (apply bvor (bitvector->bits REG_PIPELINE_CLK)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_896$107$_Y
      (bvnot n398))) ; (bitvector 1)
  (let
    ((p_sig_ps
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_896$107$_Y)
        p_sig_i
        p_sig_o_sync))) ; (bitvector 36)
  (let ((REG_OUTPUT_CE (MULT18X18C_Inputs-REG_OUTPUT_CE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_631$40$_Y
      (bool->bitvector (bveq REG_OUTPUT_CE (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($procmux$354$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_631$40$_Y)
        CE3
        CE0))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_630$39$_Y
      (bool->bitvector (bveq REG_OUTPUT_CE (bv #b10000 5))))) ; (bitvector 1)
  (let
    (($procmux$366$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_630$39$_Y)
        CE2
        $procmux$354$_Y))) ; (bitvector 1)
  (let ((n406 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_629$38$_Y
      (bool->bitvector (bveq REG_OUTPUT_CE n406)))) ; (bitvector 1)
  (let
    (($procmux$375$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_629$38$_Y)
        CE1
        $procmux$366$_Y))) ; (bitvector 1)
  (let ((n409 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_628$37$_Y
      (bool->bitvector (bveq REG_OUTPUT_CE n409)))) ; (bitvector 1)
  (let
    ((output_ce_sig
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_628$37$_Y)
        CE0
        $procmux$375$_Y))) ; (bitvector 1)
  (let
    (($procmux$125$_Y
      (if (bitvector->bool output_ce_sig) p_sig_ps p_sig_o1_sync))) ; (bitvector 36)
  (let ((REG_OUTPUT_RST (MULT18X18C_Inputs-REG_OUTPUT_RST inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_663$60$_Y
      (bool->bitvector (bveq REG_OUTPUT_RST (bv #b10100 5))))) ; (bitvector 1)
  (let
    (($procmux$234$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_663$60$_Y)
        RST3
        RST0))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_662$59$_Y
      (bool->bitvector (bveq REG_OUTPUT_RST (bv #b10011 5))))) ; (bitvector 1)
  (let
    (($procmux$246$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_662$59$_Y)
        RST2
        $procmux$234$_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_661$58$_Y
      (bool->bitvector (bveq REG_OUTPUT_RST (bv #b10010 5))))) ; (bitvector 1)
  (let
    (($procmux$255$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_661$58$_Y)
        RST1
        $procmux$246$_Y))) ; (bitvector 1)
  (let ((n420 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_660$57$_Y
      (bool->bitvector (bveq REG_OUTPUT_RST n420)))) ; (bitvector 1)
  (let
    ((output_rst_ogsr
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_660$57$_Y)
        RST0
        $procmux$255$_Y))) ; (bitvector 1)
  (let
    (($0_p_sig_o1_sync_35_0_
      (if
        (bitvector->bool output_rst_ogsr)
        (bv #b000000000000000000000000000000000000 36)
        $procmux$125$_Y))) ; (bitvector 36)
  (let
    (($procmux$191$_Y
      (if (bitvector->bool input_b_ce_sig) b_sig_s_1 b_sig_reg_sync))) ; (bitvector 18)
  (let
    (($0_b_sig_reg_sync_17_0_
      (if
        (bitvector->bool input_b_rst_ogsr)
        (bv #b000000000000000000 18)
        $procmux$191$_Y))) ; (bitvector 18)
  (let
    (($procmux$210$_Y
      (if (bitvector->bool input_a_ce_sig) a_sig_s_1 a_sig_reg_sync))) ; (bitvector 18)
  (let
    (($0_a_sig_reg_sync_17_0_
      (if
        (bitvector->bool input_a_rst_ogsr)
        (bv #b000000000000000000 18)
        $procmux$210$_Y))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$646$_Q
      (MULT18X18C_State-$auto$clk2fflogic.cc_102_sample_data$646 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$648$_Q
      (MULT18X18C_State-$auto$clk2fflogic.cc_102_sample_data$648 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_pipeline_clk_sig_sampled$649
      (MULT18X18C_State-$auto$clk2fflogic.cc_86_sample_control_edge$650 state))) ; (bitvector 1)
  (let
    ((n431
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_pipeline_clk_sig_sampled$649
        pipeline_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$651$_Y
      (bool->bitvector (bveq n431 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((signedab_sig_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$651$_Y)
        $auto$clk2fflogic.cc_102_sample_data$648$_Q
        $auto$clk2fflogic.cc_102_sample_data$646$_Q))) ; (bitvector 1)
  (let
    (($or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_873$99$_Y
      (bvor signeda_p1 signedb_p1))) ; (bitvector 1)
  (let
    (($procmux$138$_Y
      (if
        (bitvector->bool pipeline_ce_sig)
        $or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_873$99$_Y
        signedab_sig_sync))) ; (bitvector 1)
  (let
    (($0_signedab_sig_sync_0_0_
      (if (bitvector->bool pipeline_rst_ogsr) (bv #b0 1) $procmux$138$_Y))) ; (bitvector 1)
  (let ((SROB9 (extract 9 9 b_sig_gen))) ; (bitvector 1)
  (let ((SROB8 (extract 8 8 b_sig_gen))) ; (bitvector 1)
  (let ((SROB7 (extract 7 7 b_sig_gen))) ; (bitvector 1)
  (let ((SROB6 (extract 6 6 b_sig_gen))) ; (bitvector 1)
  (let ((SROB5 (extract 5 5 b_sig_gen))) ; (bitvector 1)
  (let ((SROB4 (extract 4 4 b_sig_gen))) ; (bitvector 1)
  (let ((SROB3 (extract 3 3 b_sig_gen))) ; (bitvector 1)
  (let ((SROB2 (extract 2 2 b_sig_gen))) ; (bitvector 1)
  (let ((SROB17 (extract 17 17 b_sig_gen))) ; (bitvector 1)
  (let ((SROB16 (extract 16 16 b_sig_gen))) ; (bitvector 1)
  (let ((SROB15 (extract 15 15 b_sig_gen))) ; (bitvector 1)
  (let ((SROB14 (extract 14 14 b_sig_gen))) ; (bitvector 1)
  (let ((SROB13 (extract 13 13 b_sig_gen))) ; (bitvector 1)
  (let ((SROB12 (extract 12 12 b_sig_gen))) ; (bitvector 1)
  (let ((SROB11 (extract 11 11 b_sig_gen))) ; (bitvector 1)
  (let ((SROB10 (extract 10 10 b_sig_gen))) ; (bitvector 1)
  (let ((SROB1 (extract 1 1 b_sig_gen))) ; (bitvector 1)
  (let ((SROB0 (extract 0 0 b_sig_gen))) ; (bitvector 1)
  (let
    ((a_sig_gen2
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_775$81$_Y)
        a_sig_gen
        a_sig_gen1_sync))) ; (bitvector 18)
  (let ((CAS_MATCH_REG (MULT18X18C_Inputs-CAS_MATCH_REG inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_794$86$_Y
      (bool->bitvector (bveq CAS_MATCH_REG (bv #b10110 5))))) ; (bitvector 1)
  (let
    (($procmux$169$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_794$86$_Y)
        a_sig_gen2
        a_sig_gen))) ; (bitvector 18)
  (let ((n461 (zero-extend (bv #b100 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_793$85$_Y
      (bool->bitvector (bveq CAS_MATCH_REG n461)))) ; (bitvector 1)
  (let
    (($procmux$175$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_793$85$_Y)
        a_sig_gen
        $procmux$169$_Y))) ; (bitvector 18)
  (let ((SROA9 (extract 9 9 $procmux$175$_Y))) ; (bitvector 1)
  (let ((SROA8 (extract 8 8 $procmux$175$_Y))) ; (bitvector 1)
  (let ((SROA7 (extract 7 7 $procmux$175$_Y))) ; (bitvector 1)
  (let ((SROA6 (extract 6 6 $procmux$175$_Y))) ; (bitvector 1)
  (let ((SROA5 (extract 5 5 $procmux$175$_Y))) ; (bitvector 1)
  (let ((SROA4 (extract 4 4 $procmux$175$_Y))) ; (bitvector 1)
  (let ((SROA3 (extract 3 3 $procmux$175$_Y))) ; (bitvector 1)
  (let ((SROA2 (extract 2 2 $procmux$175$_Y))) ; (bitvector 1)
  (let ((SROA17 (extract 17 17 $procmux$175$_Y))) ; (bitvector 1)
  (let ((SROA16 (extract 16 16 $procmux$175$_Y))) ; (bitvector 1)
  (let ((SROA15 (extract 15 15 $procmux$175$_Y))) ; (bitvector 1)
  (let ((SROA14 (extract 14 14 $procmux$175$_Y))) ; (bitvector 1)
  (let ((SROA13 (extract 13 13 $procmux$175$_Y))) ; (bitvector 1)
  (let ((SROA12 (extract 12 12 $procmux$175$_Y))) ; (bitvector 1)
  (let ((SROA11 (extract 11 11 $procmux$175$_Y))) ; (bitvector 1)
  (let ((SROA10 (extract 10 10 $procmux$175$_Y))) ; (bitvector 1)
  (let ((SROA1 (extract 1 1 $procmux$175$_Y))) ; (bitvector 1)
  (let ((SROA0 (extract 0 0 $procmux$175$_Y))) ; (bitvector 1)
  (let
    ((SIGNEDP
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_896$107$_Y)
        $or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_873$99$_Y
        signedab_sig_sync))) ; (bitvector 1)
  (let ((ROA9 (extract 9 9 a_sig_gen))) ; (bitvector 1)
  (let ((ROA8 (extract 8 8 a_sig_gen))) ; (bitvector 1)
  (let ((ROA7 (extract 7 7 a_sig_gen))) ; (bitvector 1)
  (let ((ROA6 (extract 6 6 a_sig_gen))) ; (bitvector 1)
  (let ((ROA5 (extract 5 5 a_sig_gen))) ; (bitvector 1)
  (let ((ROA4 (extract 4 4 a_sig_gen))) ; (bitvector 1)
  (let ((ROA3 (extract 3 3 a_sig_gen))) ; (bitvector 1)
  (let ((ROA2 (extract 2 2 a_sig_gen))) ; (bitvector 1)
  (let ((ROA17 (extract 17 17 a_sig_gen))) ; (bitvector 1)
  (let ((ROA16 (extract 16 16 a_sig_gen))) ; (bitvector 1)
  (let ((ROA15 (extract 15 15 a_sig_gen))) ; (bitvector 1)
  (let ((ROA14 (extract 14 14 a_sig_gen))) ; (bitvector 1)
  (let ((ROA13 (extract 13 13 a_sig_gen))) ; (bitvector 1)
  (let ((ROA12 (extract 12 12 a_sig_gen))) ; (bitvector 1)
  (let ((ROA11 (extract 11 11 a_sig_gen))) ; (bitvector 1)
  (let ((ROA10 (extract 10 10 a_sig_gen))) ; (bitvector 1)
  (let ((ROA1 (extract 1 1 a_sig_gen))) ; (bitvector 1)
  (let ((ROA0 (extract 0 0 a_sig_gen))) ; (bitvector 1)
  (let ((n501 (apply bvor (bitvector->bits REG_OUTPUT_CLK)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_916$115$_Y
      (bvnot n501))) ; (bitvector 1)
  (let
    ((p_sig_out
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_916$115$_Y)
        p_sig_ps
        p_sig_o1_sync))) ; (bitvector 36)
  (let ((MULT_BYPASS (MULT18X18C_Inputs-MULT_BYPASS inputs))) ; (bitvector 5)
  (let ((n506 (zero-extend (bv #b101 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_921$117$_Y
      (bool->bitvector (bveq MULT_BYPASS n506)))) ; (bitvector 1)
  (let
    (($procmux$120$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18C_modified_for_racket_import.v_921$117$_Y)
        p_sig_out
        (bv #b000000000000000000000000000000000000 36)))) ; (bitvector 36)
  (let ((P9 (extract 9 9 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P8 (extract 8 8 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P7 (extract 7 7 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P6 (extract 6 6 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P5 (extract 5 5 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P4 (extract 4 4 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P35 (extract 35 35 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P34 (extract 34 34 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P33 (extract 33 33 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P32 (extract 32 32 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P31 (extract 31 31 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P30 (extract 30 30 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P3 (extract 3 3 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P29 (extract 29 29 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P28 (extract 28 28 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P27 (extract 27 27 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P26 (extract 26 26 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P25 (extract 25 25 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P24 (extract 24 24 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P23 (extract 23 23 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P22 (extract 22 22 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P21 (extract 21 21 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P20 (extract 20 20 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P2 (extract 2 2 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P19 (extract 19 19 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P18 (extract 18 18 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P17 (extract 17 17 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P16 (extract 16 16 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P15 (extract 15 15 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P14 (extract 14 14 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P13 (extract 13 13 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P12 (extract 12 12 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P11 (extract 11 11 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P10 (extract 10 10 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P1 (extract 1 1 $procmux$120$_Y))) ; (bitvector 1)
  (let ((P0 (extract 0 0 $procmux$120$_Y))) ; (bitvector 1)
  (cons
    (MULT18X18C_Outputs
      SROB9 ; SROB9
      SROB8 ; SROB8
      SROB7 ; SROB7
      SROB6 ; SROB6
      SROB5 ; SROB5
      SROB4 ; SROB4
      SROB3 ; SROB3
      SROB2 ; SROB2
      SROB17 ; SROB17
      SROB16 ; SROB16
      SROB15 ; SROB15
      SROB14 ; SROB14
      SROB13 ; SROB13
      SROB12 ; SROB12
      SROB11 ; SROB11
      SROB10 ; SROB10
      SROB1 ; SROB1
      SROB0 ; SROB0
      SROA9 ; SROA9
      SROA8 ; SROA8
      SROA7 ; SROA7
      SROA6 ; SROA6
      SROA5 ; SROA5
      SROA4 ; SROA4
      SROA3 ; SROA3
      SROA2 ; SROA2
      SROA17 ; SROA17
      SROA16 ; SROA16
      SROA15 ; SROA15
      SROA14 ; SROA14
      SROA13 ; SROA13
      SROA12 ; SROA12
      SROA11 ; SROA11
      SROA10 ; SROA10
      SROA1 ; SROA1
      SROA0 ; SROA0
      SIGNEDP ; SIGNEDP
      SROB9 ; ROB9
      SROB8 ; ROB8
      SROB7 ; ROB7
      SROB6 ; ROB6
      SROB5 ; ROB5
      SROB4 ; ROB4
      SROB3 ; ROB3
      SROB2 ; ROB2
      SROB17 ; ROB17
      SROB16 ; ROB16
      SROB15 ; ROB15
      SROB14 ; ROB14
      SROB13 ; ROB13
      SROB12 ; ROB12
      SROB11 ; ROB11
      SROB10 ; ROB10
      SROB1 ; ROB1
      SROB0 ; ROB0
      ROA9 ; ROA9
      ROA8 ; ROA8
      ROA7 ; ROA7
      ROA6 ; ROA6
      ROA5 ; ROA5
      ROA4 ; ROA4
      ROA3 ; ROA3
      ROA2 ; ROA2
      ROA17 ; ROA17
      ROA16 ; ROA16
      ROA15 ; ROA15
      ROA14 ; ROA14
      ROA13 ; ROA13
      ROA12 ; ROA12
      ROA11 ; ROA11
      ROA10 ; ROA10
      ROA1 ; ROA1
      ROA0 ; ROA0
      P9 ; P9
      P8 ; P8
      P7 ; P7
      P6 ; P6
      P5 ; P5
      P4 ; P4
      P35 ; P35
      P34 ; P34
      P33 ; P33
      P32 ; P32
      P31 ; P31
      P30 ; P30
      P3 ; P3
      P29 ; P29
      P28 ; P28
      P27 ; P27
      P26 ; P26
      P25 ; P25
      P24 ; P24
      P23 ; P23
      P22 ; P22
      P21 ; P21
      P20 ; P20
      P2 ; P2
      P19 ; P19
      P18 ; P18
      P17 ; P17
      P16 ; P16
      P15 ; P15
      P14 ; P14
      P13 ; P13
      P12 ; P12
      P11 ; P11
      P10 ; P10
      P1 ; P1
      P0 ; P0
    )
    (MULT18X18C_State
      pipeline_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$640
      input_a_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$690
      input_a_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$700
      input_b_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$670
      output_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$630
      p_sig_o_sync ; $auto$clk2fflogic.cc:102:sample_data$636
      $0_p_sig_o_sync_35_0_ ; $auto$clk2fflogic.cc:102:sample_data$638
      a_sig_gen1_sync ; $auto$clk2fflogic.cc:102:sample_data$686
      $0_a_sig_gen1_sync_17_0_ ; $auto$clk2fflogic.cc:102:sample_data$688
      signeda_reg1_sync ; $auto$clk2fflogic.cc:102:sample_data$696
      $0_signeda_reg1_sync_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$698
      signedb_reg1_sync ; $auto$clk2fflogic.cc:102:sample_data$666
      $0_signedb_reg1_sync_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$668
      input_b_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$660
      input_a_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$680
      pipeline_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$650
      p_sig_o1_sync ; $auto$clk2fflogic.cc:102:sample_data$626
      $0_p_sig_o1_sync_35_0_ ; $auto$clk2fflogic.cc:102:sample_data$628
      b_sig_reg_sync ; $auto$clk2fflogic.cc:102:sample_data$656
      $0_b_sig_reg_sync_17_0_ ; $auto$clk2fflogic.cc:102:sample_data$658
      a_sig_reg_sync ; $auto$clk2fflogic.cc:102:sample_data$676
      $0_a_sig_reg_sync_17_0_ ; $auto$clk2fflogic.cc:102:sample_data$678
      signedab_sig_sync ; $auto$clk2fflogic.cc:102:sample_data$646
      $0_signedab_sig_sync_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$648
    ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  )))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(define MULT18X18C_initial
  (MULT18X18C_State
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b000000000000000000000000000000000000 36)
    (bv #b000000000000000000000000000000000000 36)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000 18)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b000000000000000000000000000000000000 36)
    (bv #b000000000000000000000000000000000000 36)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000 18)
    (bv #b0 1)
    (bv #b0 1)))
