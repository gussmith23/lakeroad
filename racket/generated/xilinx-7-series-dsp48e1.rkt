#lang rosette/safe
    (provide (rename-out [DSP48E1 xilinx-7-series-dsp48e1] [DSP48E1_initial xilinx-7-series-dsp48e1-initial] [DSP48E1_inputs_helper xilinx-7-series-dsp48e1-inputs] [DSP48E1_outputs_helper xilinx-7-series-dsp48e1-outputs]))(struct
  DSP48E1_Inputs
  (USE_SIMD
    USE_PATTERN_DETECT
    USE_MULT
    USE_DPORT
    SEL_PATTERN
    SEL_MASK
    RSTP
    RSTM
    RSTINMODE
    RSTD
    RSTCTRL
    RSTC
    RSTB
    RSTALUMODE
    RSTALLCARRYIN
    RSTA
    PREG
    PCIN
    PATTERN
    OPMODEREG
    OPMODE
    MULTSIGNIN
    MREG
    MASK
    IS_OPMODE_INVERTED
    IS_INMODE_INVERTED
    IS_CLK_INVERTED
    IS_CARRYIN_INVERTED
    IS_ALUMODE_INVERTED
    INMODEREG
    INMODE
    DREG
    D
    CREG
    CLK
    CEP
    CEM
    CEINMODE
    CED
    CECTRL
    CECARRYIN
    CEC
    CEB2
    CEB1
    CEALUMODE
    CEAD
    CEA2
    CEA1
    CARRYINSELREG
    CARRYINSEL
    CARRYINREG
    CARRYIN
    CARRYCASCIN
    C
    B_INPUT
    BREG
    BCIN
    BCASCREG
    B
    A_INPUT
    AUTORESET_PATDET
    AREG
    ALUMODEREG
    ALUMODE
    ADREG
    ACIN
    ACASCREG
    A)
  #:transparent
  ; USE_SIMD (bitvector 5)
  ; USE_PATTERN_DETECT (bitvector 5)
  ; USE_MULT (bitvector 5)
  ; USE_DPORT (bitvector 5)
  ; SEL_PATTERN (bitvector 5)
  ; SEL_MASK (bitvector 5)
  ; RSTP (bitvector 1)
  ; RSTM (bitvector 1)
  ; RSTINMODE (bitvector 1)
  ; RSTD (bitvector 1)
  ; RSTCTRL (bitvector 1)
  ; RSTC (bitvector 1)
  ; RSTB (bitvector 1)
  ; RSTALUMODE (bitvector 1)
  ; RSTALLCARRYIN (bitvector 1)
  ; RSTA (bitvector 1)
  ; PREG (bitvector 32)
  ; PCIN (bitvector 48)
  ; PATTERN (bitvector 48)
  ; OPMODEREG (bitvector 32)
  ; OPMODE (bitvector 7)
  ; MULTSIGNIN (bitvector 1)
  ; MREG (bitvector 32)
  ; MASK (bitvector 48)
  ; IS_OPMODE_INVERTED (bitvector 7)
  ; IS_INMODE_INVERTED (bitvector 5)
  ; IS_CLK_INVERTED (bitvector 1)
  ; IS_CARRYIN_INVERTED (bitvector 1)
  ; IS_ALUMODE_INVERTED (bitvector 4)
  ; INMODEREG (bitvector 32)
  ; INMODE (bitvector 5)
  ; DREG (bitvector 32)
  ; D (bitvector 25)
  ; CREG (bitvector 32)
  ; CLK (bitvector 1)
  ; CEP (bitvector 1)
  ; CEM (bitvector 1)
  ; CEINMODE (bitvector 1)
  ; CED (bitvector 1)
  ; CECTRL (bitvector 1)
  ; CECARRYIN (bitvector 1)
  ; CEC (bitvector 1)
  ; CEB2 (bitvector 1)
  ; CEB1 (bitvector 1)
  ; CEALUMODE (bitvector 1)
  ; CEAD (bitvector 1)
  ; CEA2 (bitvector 1)
  ; CEA1 (bitvector 1)
  ; CARRYINSELREG (bitvector 32)
  ; CARRYINSEL (bitvector 3)
  ; CARRYINREG (bitvector 32)
  ; CARRYIN (bitvector 1)
  ; CARRYCASCIN (bitvector 1)
  ; C (bitvector 48)
  ; B_INPUT (bitvector 5)
  ; BREG (bitvector 32)
  ; BCIN (bitvector 18)
  ; BCASCREG (bitvector 32)
  ; B (bitvector 18)
  ; A_INPUT (bitvector 5)
  ; AUTORESET_PATDET (bitvector 5)
  ; AREG (bitvector 32)
  ; ALUMODEREG (bitvector 32)
  ; ALUMODE (bitvector 4)
  ; ADREG (bitvector 32)
  ; ACIN (bitvector 30)
  ; ACASCREG (bitvector 32)
  ; A (bitvector 30)
)
(struct
  DSP48E1_Outputs
  (UNDERFLOW
    PCOUT
    PATTERNDETECT
    PATTERNBDETECT
    P
    OVERFLOW
    MULTSIGNOUT
    CARRYOUT
    CARRYCASCOUT
    BCOUT
    ACOUT)
  #:transparent
  ; UNDERFLOW (bitvector 1)
  ; PCOUT (bitvector 48)
  ; PATTERNDETECT (bitvector 1)
  ; PATTERNBDETECT (bitvector 1)
  ; P (bitvector 48)
  ; OVERFLOW (bitvector 1)
  ; MULTSIGNOUT (bitvector 1)
  ; CARRYOUT (bitvector 4)
  ; CARRYCASCOUT (bitvector 1)
  ; BCOUT (bitvector 18)
  ; ACOUT (bitvector 30)
)
(struct
  DSP48E1_State
  ($auto$clk2fflogic.cc_86_sample_control_edge$786
    $auto$clk2fflogic.cc_102_sample_data$782
    $auto$clk2fflogic.cc_102_sample_data$784
    $auto$clk2fflogic.cc_86_sample_control_edge$846
    $auto$clk2fflogic.cc_86_sample_control_edge$776
    $auto$clk2fflogic.cc_102_sample_data$842
    $auto$clk2fflogic.cc_102_sample_data$844
    $auto$clk2fflogic.cc_102_sample_data$772
    $auto$clk2fflogic.cc_102_sample_data$774
    $auto$clk2fflogic.cc_86_sample_control_edge$726
    $auto$clk2fflogic.cc_86_sample_control_edge$716
    $auto$clk2fflogic.cc_86_sample_control_edge$796
    $auto$clk2fflogic.cc_102_sample_data$722
    $auto$clk2fflogic.cc_102_sample_data$724
    $auto$clk2fflogic.cc_86_sample_control_edge$746
    $auto$clk2fflogic.cc_102_sample_data$712
    $auto$clk2fflogic.cc_102_sample_data$714
    $auto$clk2fflogic.cc_102_sample_data$792
    $auto$clk2fflogic.cc_102_sample_data$794
    $auto$clk2fflogic.cc_86_sample_control_edge$756
    $auto$clk2fflogic.cc_102_sample_data$742
    $auto$clk2fflogic.cc_102_sample_data$744
    $auto$clk2fflogic.cc_86_sample_control_edge$736
    $auto$clk2fflogic.cc_86_sample_control_edge$766
    $auto$clk2fflogic.cc_102_sample_data$752
    $auto$clk2fflogic.cc_102_sample_data$754
    $auto$clk2fflogic.cc_86_sample_control_edge$816
    $auto$clk2fflogic.cc_86_sample_control_edge$836
    $auto$clk2fflogic.cc_86_sample_control_edge$666
    $auto$clk2fflogic.cc_86_sample_control_edge$646
    $auto$clk2fflogic.cc_102_sample_data$732
    $auto$clk2fflogic.cc_102_sample_data$734
    $auto$clk2fflogic.cc_102_sample_data$762
    $auto$clk2fflogic.cc_102_sample_data$764
    $auto$clk2fflogic.cc_86_sample_control_edge$706
    $auto$clk2fflogic.cc_86_sample_control_edge$806
    $auto$clk2fflogic.cc_86_sample_control_edge$826
    $auto$clk2fflogic.cc_86_sample_control_edge$676
    $auto$clk2fflogic.cc_86_sample_control_edge$686
    $auto$clk2fflogic.cc_86_sample_control_edge$696
    $auto$clk2fflogic.cc_102_sample_data$812
    $auto$clk2fflogic.cc_102_sample_data$814
    $auto$clk2fflogic.cc_102_sample_data$832
    $auto$clk2fflogic.cc_102_sample_data$834
    $auto$clk2fflogic.cc_102_sample_data$662
    $auto$clk2fflogic.cc_102_sample_data$664
    $auto$clk2fflogic.cc_102_sample_data$642
    $auto$clk2fflogic.cc_102_sample_data$644
    $auto$clk2fflogic.cc_86_sample_control_edge$636
    $auto$clk2fflogic.cc_86_sample_control_edge$656
    $auto$clk2fflogic.cc_102_sample_data$702
    $auto$clk2fflogic.cc_102_sample_data$704
    $auto$clk2fflogic.cc_102_sample_data$802
    $auto$clk2fflogic.cc_102_sample_data$804
    $auto$clk2fflogic.cc_102_sample_data$822
    $auto$clk2fflogic.cc_102_sample_data$824
    $auto$clk2fflogic.cc_102_sample_data$672
    $auto$clk2fflogic.cc_102_sample_data$674
    $auto$clk2fflogic.cc_102_sample_data$682
    $auto$clk2fflogic.cc_102_sample_data$684
    $auto$clk2fflogic.cc_102_sample_data$692
    $auto$clk2fflogic.cc_102_sample_data$694
    $auto$clk2fflogic.cc_102_sample_data$632
    $auto$clk2fflogic.cc_102_sample_data$634
    $auto$clk2fflogic.cc_102_sample_data$652
    $auto$clk2fflogic.cc_102_sample_data$654)
  #:transparent
  ; $auto$clk2fflogic.cc_86_sample_control_edge$786 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$782 (bitvector 25)
  ; $auto$clk2fflogic.cc_102_sample_data$784 (bitvector 25)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$846 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$776 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$842 (bitvector 5)
  ; $auto$clk2fflogic.cc_102_sample_data$844 (bitvector 5)
  ; $auto$clk2fflogic.cc_102_sample_data$772 (bitvector 25)
  ; $auto$clk2fflogic.cc_102_sample_data$774 (bitvector 25)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$726 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$716 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$796 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$722 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$724 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$746 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$712 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$714 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$792 (bitvector 48)
  ; $auto$clk2fflogic.cc_102_sample_data$794 (bitvector 48)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$756 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$742 (bitvector 3)
  ; $auto$clk2fflogic.cc_102_sample_data$744 (bitvector 3)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$736 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$766 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$752 (bitvector 7)
  ; $auto$clk2fflogic.cc_102_sample_data$754 (bitvector 7)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$816 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$836 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$666 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$646 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$732 (bitvector 4)
  ; $auto$clk2fflogic.cc_102_sample_data$734 (bitvector 4)
  ; $auto$clk2fflogic.cc_102_sample_data$762 (bitvector 43)
  ; $auto$clk2fflogic.cc_102_sample_data$764 (bitvector 43)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$706 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$806 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$826 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$676 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$686 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$696 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$812 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$814 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$832 (bitvector 30)
  ; $auto$clk2fflogic.cc_102_sample_data$834 (bitvector 30)
  ; $auto$clk2fflogic.cc_102_sample_data$662 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$664 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$642 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$644 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$636 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$656 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$702 (bitvector 4)
  ; $auto$clk2fflogic.cc_102_sample_data$704 (bitvector 4)
  ; $auto$clk2fflogic.cc_102_sample_data$802 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$804 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$822 (bitvector 30)
  ; $auto$clk2fflogic.cc_102_sample_data$824 (bitvector 30)
  ; $auto$clk2fflogic.cc_102_sample_data$672 (bitvector 48)
  ; $auto$clk2fflogic.cc_102_sample_data$674 (bitvector 48)
  ; $auto$clk2fflogic.cc_102_sample_data$682 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$684 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$692 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$694 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$632 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$634 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$652 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$654 (bitvector 1)
)
(define
  (DSP48E1_inputs_helper inputs)
  (DSP48E1_Inputs
    (let
      (
        (assoc-result
          (assoc "USE_SIMD" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "USE_PATTERN_DETECT" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "USE_MULT" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "USE_DPORT" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SEL_PATTERN" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "SEL_MASK" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "RSTP" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "RSTM" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "RSTINMODE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "RSTD" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "RSTCTRL" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "RSTC" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "RSTB" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "RSTALUMODE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "RSTALLCARRYIN" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "RSTA" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "PREG" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "PCIN" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "PATTERN" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "OPMODEREG" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "OPMODE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MULTSIGNIN" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MREG" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "MASK" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "IS_OPMODE_INVERTED" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "IS_INMODE_INVERTED" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "IS_CLK_INVERTED" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "IS_CARRYIN_INVERTED" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "IS_ALUMODE_INVERTED" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "INMODEREG" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "INMODE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "DREG" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "D" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CREG" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CLK" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CEP" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CEM" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CEINMODE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CED" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CECTRL" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CECARRYIN" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CEC" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CEB2" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CEB1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CEALUMODE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CEAD" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CEA2" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CEA1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CARRYINSELREG" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CARRYINSEL" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CARRYINREG" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CARRYIN" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CARRYCASCIN" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B_INPUT" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "BREG" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "BCIN" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "BCASCREG" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "B" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A_INPUT" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "AUTORESET_PATDET" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "AREG" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "ALUMODEREG" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "ALUMODE" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "ADREG" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "ACIN" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "ACASCREG" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "A" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))))
(define
  (DSP48E1_outputs_helper outputs)
  (list
    (cons "UNDERFLOW" (DSP48E1_Outputs-UNDERFLOW outputs))
    (cons "PCOUT" (DSP48E1_Outputs-PCOUT outputs))
    (cons "PATTERNDETECT" (DSP48E1_Outputs-PATTERNDETECT outputs))
    (cons "PATTERNBDETECT" (DSP48E1_Outputs-PATTERNBDETECT outputs))
    (cons "P" (DSP48E1_Outputs-P outputs))
    (cons "OVERFLOW" (DSP48E1_Outputs-OVERFLOW outputs))
    (cons "MULTSIGNOUT" (DSP48E1_Outputs-MULTSIGNOUT outputs))
    (cons "CARRYOUT" (DSP48E1_Outputs-CARRYOUT outputs))
    (cons "CARRYCASCOUT" (DSP48E1_Outputs-CARRYCASCOUT outputs))
    (cons "BCOUT" (DSP48E1_Outputs-BCOUT outputs))
    (cons "ACOUT" (DSP48E1_Outputs-ACOUT outputs))))
(define (DSP48E1 inputs state)
  (let ((CLK (DSP48E1_Inputs-CLK inputs))) ; (bitvector 1)
  (let ((IS_CLK_INVERTED (DSP48E1_Inputs-IS_CLK_INVERTED inputs))) ; (bitvector 1)
  (let ((clk_in (bvxor CLK IS_CLK_INVERTED))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$782$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$782 state))) ; (bitvector 25)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$784$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$784 state))) ; (bitvector 25)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$785
      (DSP48E1_State-$auto$clk2fflogic.cc_86_sample_control_edge$786 state))) ; (bitvector 1)
  (let
    ((n6
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$785
        clk_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$787$_Y
      (bool->bitvector (bveq n6 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((qd_o_reg1
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$787$_Y)
        $auto$clk2fflogic.cc_102_sample_data$784$_Q
        $auto$clk2fflogic.cc_102_sample_data$782$_Q))) ; (bitvector 25)
  (let ((D (DSP48E1_Inputs-D inputs))) ; (bitvector 25)
  (let ((CED (DSP48E1_Inputs-CED inputs))) ; (bitvector 1)
  (let (($procmux$462$_Y (if (bitvector->bool CED) D qd_o_reg1))) ; (bitvector 25)
  (let ((RSTD (DSP48E1_Inputs-RSTD inputs))) ; (bitvector 1)
  (let
    (($0_qd_o_reg1_24_0_
      (if
        (bitvector->bool RSTD)
        (bv #b0000000000000000000000000 25)
        $procmux$462$_Y))) ; (bitvector 25)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_qinmode_o_reg_sampled$841
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$842 state))) ; (bitvector 5)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_qinmode_o_reg_4_0__sampled$843
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$844 state))) ; (bitvector 5)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$845
      (DSP48E1_State-$auto$clk2fflogic.cc_86_sample_control_edge$846 state))) ; (bitvector 1)
  (let
    ((n19
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$845
        clk_in))) ; (bitvector 2)
  (let (($auto$rtlil.cc_2974_Eqx$848 (bool->bitvector (bveq n19 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((qinmode_o_reg
      (if
        (bitvector->bool $auto$rtlil.cc_2974_Eqx$848)
        $auto$clk2fflogic.cc_95_sample_data$$0_qinmode_o_reg_4_0__sampled$843
        $auto$clk2fflogic.cc_95_sample_data$_qinmode_o_reg_sampled$841))) ; (bitvector 5)
  (let ((INMODE (DSP48E1_Inputs-INMODE inputs))) ; (bitvector 5)
  (let ((IS_INMODE_INVERTED (DSP48E1_Inputs-IS_INMODE_INVERTED inputs))) ; (bitvector 5)
  (let ((inmode_in (bvxor INMODE IS_INMODE_INVERTED))) ; (bitvector 5)
  (let ((CEINMODE (DSP48E1_Inputs-CEINMODE inputs))) ; (bitvector 1)
  (let
    (($procmux$593$_Y (if (bitvector->bool CEINMODE) inmode_in qinmode_o_reg))) ; (bitvector 5)
  (let ((RSTINMODE (DSP48E1_Inputs-RSTINMODE inputs))) ; (bitvector 1)
  (let
    (($0_qinmode_o_reg_4_0_
      (if (bitvector->bool RSTINMODE) (bv #b00000 5) $procmux$593$_Y))) ; (bitvector 5)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$772$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$772 state))) ; (bitvector 25)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$774$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$774 state))) ; (bitvector 25)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$775
      (DSP48E1_State-$auto$clk2fflogic.cc_86_sample_control_edge$776 state))) ; (bitvector 1)
  (let
    ((n33
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$775
        clk_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$777$_Y
      (bool->bitvector (bveq n33 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((qad_o_reg1
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$777$_Y)
        $auto$clk2fflogic.cc_102_sample_data$774$_Q
        $auto$clk2fflogic.cc_102_sample_data$772$_Q))) ; (bitvector 25)
  (let ((A (DSP48E1_Inputs-A inputs))) ; (bitvector 30)
  (let ((ACIN (DSP48E1_Inputs-ACIN inputs))) ; (bitvector 30)
  (let ((A_INPUT (DSP48E1_Inputs-A_INPUT inputs))) ; (bitvector 5)
  (let ((n40 (zero-extend (bv #b1000 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_565$14$_Y
      (bool->bitvector (bveq A_INPUT n40)))) ; (bitvector 1)
  (let
    (($procmux$585$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_565$14$_Y)
        ACIN
        A))) ; (bitvector 30)
  (let ((n44 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_563$13$_Y
      (bool->bitvector (bveq A_INPUT n44)))) ; (bitvector 1)
  (let
    ((a_o_mux
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_563$13$_Y)
        A
        $procmux$585$_Y))) ; (bitvector 30)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$832$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$832 state))) ; (bitvector 30)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$834$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$834 state))) ; (bitvector 30)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$835
      (DSP48E1_State-$auto$clk2fflogic.cc_86_sample_control_edge$836 state))) ; (bitvector 1)
  (let
    ((n50
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$835
        clk_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$837$_Y
      (bool->bitvector (bveq n50 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((qa_o_reg2
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$837$_Y)
        $auto$clk2fflogic.cc_102_sample_data$834$_Q
        $auto$clk2fflogic.cc_102_sample_data$832$_Q))) ; (bitvector 30)
  (let ((AREG (DSP48E1_Inputs-AREG inputs))) ; (bitvector 32)
  (let ((n54 (sign-extend (bv #b01 2) (bitvector 32)))) ; (bitvector 32)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_571$16$_Y
      (bool->bitvector (bveq AREG n54)))) ; (bitvector 1)
  (let ((n57 (sign-extend (bv #b010 3) (bitvector 32)))) ; (bitvector 32)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_583$17$_Y
      (bool->bitvector (bveq AREG n57)))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_600$22$_Y
      (bvor
        $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_571$16$_Y
        $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_583$17$_Y))) ; (bitvector 1)
  (let
    (($procmux$546$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_600$22$_Y)
        qa_o_reg2
        a_o_mux))) ; (bitvector 30)
  (let ((n61 (apply bvor (bitvector->bits AREG)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_598$19$_Y
      (bvnot n61))) ; (bitvector 1)
  (let
    ((qa_o_mux
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_598$19$_Y)
        a_o_mux
        $procmux$546$_Y))) ; (bitvector 30)
  (let ((n64 (extract 24 0 qa_o_mux))) ; (bitvector 25)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$822$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$822 state))) ; (bitvector 30)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$824$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$824 state))) ; (bitvector 30)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$825
      (DSP48E1_State-$auto$clk2fflogic.cc_86_sample_control_edge$826 state))) ; (bitvector 1)
  (let
    ((n68
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$825
        clk_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$827$_Y
      (bool->bitvector (bveq n68 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((qa_o_reg1
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$827$_Y)
        $auto$clk2fflogic.cc_102_sample_data$824$_Q
        $auto$clk2fflogic.cc_102_sample_data$822$_Q))) ; (bitvector 30)
  (let ((n71 (extract 24 0 qa_o_reg1))) ; (bitvector 25)
  (let ((INMODEREG (DSP48E1_Inputs-INMODEREG inputs))) ; (bitvector 32)
  (let ((n73 (sign-extend (bv #b01 2) (bitvector 32)))) ; (bitvector 32)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_557$9$_Y
      (bool->bitvector (bveq INMODEREG n73)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_557$10$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_557$9$_Y)
        qinmode_o_reg
        inmode_in))) ; (bitvector 5)
  (let ((n76 (apply bvor (bitvector->bits INMODEREG)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_557$8$_Y
      (bvnot n76))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_557$11$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_557$8$_Y)
        inmode_in
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_557$10$_Y))) ; (bitvector 5)
  (let
    ((n79
      (extract
        0
        0
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_557$11$_Y))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_616$30$_Y
      (if (bitvector->bool n79) n71 n64))) ; (bitvector 25)
  (let
    ((n81
      (extract
        1
        1
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_557$11$_Y))) ; (bitvector 1)
  (let
    ((a_preaddsub
      (if
        (bitvector->bool n81)
        (bv #b0000000000000000000000000 25)
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_616$30$_Y))) ; (bitvector 25)
  (let ((DREG (DSP48E1_Inputs-DREG inputs))) ; (bitvector 32)
  (let ((n84 (sign-extend (bv #b01 2) (bitvector 32)))) ; (bitvector 32)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_715$58$_Y
      (bool->bitvector (bveq DREG n84)))) ; (bitvector 1)
  (let
    (($procmux$454$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_715$58$_Y)
        qd_o_reg1
        D))) ; (bitvector 25)
  (let ((n87 (apply bvor (bitvector->bits DREG)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_714$57$_Y
      (bvnot n87))) ; (bitvector 1)
  (let
    (($procmux$460$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_714$57$_Y)
        D
        $procmux$454$_Y))) ; (bitvector 25)
  (let
    ((n90
      (extract
        2
        2
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_557$11$_Y))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_726$60_Y
      (if
        (bitvector->bool n90)
        $procmux$460$_Y
        (bv #b0000000000000000000000000 25)))) ; (bitvector 25)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_726$63$_Y
      (bvadd
        a_preaddsub
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_726$60_Y))) ; (bitvector 25)
  (let
    (($neg$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_726$59_Y
      (bvneg a_preaddsub))) ; (bitvector 25)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_726$61$_Y
      (bvadd
        $neg$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_726$59_Y
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_726$60_Y))) ; (bitvector 25)
  (let
    ((n95
      (extract
        3
        3
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_557$11$_Y))) ; (bitvector 1)
  (let
    ((ad_addsub
      (if
        (bitvector->bool n95)
        $add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_726$61$_Y
        $add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_726$63$_Y))) ; (bitvector 25)
  (let ((CEAD (DSP48E1_Inputs-CEAD inputs))) ; (bitvector 1)
  (let (($procmux$448$_Y (if (bitvector->bool CEAD) ad_addsub qad_o_reg1))) ; (bitvector 25)
  (let
    (($0_qad_o_reg1_24_0_
      (if
        (bitvector->bool RSTD)
        (bv #b0000000000000000000000000 25)
        $procmux$448$_Y))) ; (bitvector 25)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$722$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$722 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$724$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$724 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$725
      (DSP48E1_State-$auto$clk2fflogic.cc_86_sample_control_edge$726 state))) ; (bitvector 1)
  (let
    ((n103
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$725
        clk_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$727$_Y
      (bool->bitvector (bveq n103 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((qcarryin_o_reg0
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$727$_Y)
        $auto$clk2fflogic.cc_102_sample_data$724$_Q
        $auto$clk2fflogic.cc_102_sample_data$722$_Q))) ; (bitvector 1)
  (let ((CARRYIN (DSP48E1_Inputs-CARRYIN inputs))) ; (bitvector 1)
  (let ((IS_CARRYIN_INVERTED (DSP48E1_Inputs-IS_CARRYIN_INVERTED inputs))) ; (bitvector 1)
  (let ((carryin_in (bvxor CARRYIN IS_CARRYIN_INVERTED))) ; (bitvector 1)
  (let ((CECARRYIN (DSP48E1_Inputs-CECARRYIN inputs))) ; (bitvector 1)
  (let
    (($procmux$353$_Y
      (if (bitvector->bool CECARRYIN) carryin_in qcarryin_o_reg0))) ; (bitvector 1)
  (let ((RSTALLCARRYIN (DSP48E1_Inputs-RSTALLCARRYIN inputs))) ; (bitvector 1)
  (let
    (($0_qcarryin_o_reg0_0_0_
      (if (bitvector->bool RSTALLCARRYIN) (bv #b0 1) $procmux$353$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$712$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$712 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$714$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$714 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$715
      (DSP48E1_State-$auto$clk2fflogic.cc_86_sample_control_edge$716 state))) ; (bitvector 1)
  (let
    ((n117
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$715
        clk_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$717$_Y
      (bool->bitvector (bveq n117 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((qcarryin_o_reg7
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$717$_Y)
        $auto$clk2fflogic.cc_102_sample_data$714$_Q
        $auto$clk2fflogic.cc_102_sample_data$712$_Q))) ; (bitvector 1)
  (let ((ADREG (DSP48E1_Inputs-ADREG inputs))) ; (bitvector 32)
  (let ((n121 (sign-extend (bv #b01 2) (bitvector 32)))) ; (bitvector 32)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_737$68$_Y
      (bool->bitvector (bveq ADREG n121)))) ; (bitvector 1)
  (let
    (($procmux$440$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_737$68$_Y)
        qad_o_reg1
        ad_addsub))) ; (bitvector 25)
  (let ((n124 (apply bvor (bitvector->bits ADREG)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_736$67$_Y
      (bvnot n124))) ; (bitvector 1)
  (let
    (($procmux$446$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_736$67$_Y)
        ad_addsub
        $procmux$440$_Y))) ; (bitvector 25)
  (let ((USE_DPORT (DSP48E1_Inputs-USE_DPORT inputs))) ; (bitvector 5)
  (let ((n129 (zero-extend (bv #b1001 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_744$69$_Y
      (bool->bitvector (bveq USE_DPORT n129)))) ; (bitvector 1)
  (let
    ((ad_mult
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_744$69$_Y)
        $procmux$446$_Y
        a_preaddsub))) ; (bitvector 25)
  (let ((n132 (extract 24 24 ad_mult))) ; (bitvector 1)
  (let ((B (DSP48E1_Inputs-B inputs))) ; (bitvector 18)
  (let ((BCIN (DSP48E1_Inputs-BCIN inputs))) ; (bitvector 18)
  (let ((B_INPUT (DSP48E1_Inputs-B_INPUT inputs))) ; (bitvector 5)
  (let ((n136 (zero-extend (bv #b1000 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_625$34$_Y
      (bool->bitvector (bveq B_INPUT n136)))) ; (bitvector 1)
  (let
    (($procmux$529$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_625$34$_Y)
        BCIN
        B))) ; (bitvector 18)
  (let ((n139 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_623$33$_Y
      (bool->bitvector (bveq B_INPUT n139)))) ; (bitvector 1)
  (let
    ((b_o_mux
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_623$33$_Y)
        B
        $procmux$529$_Y))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$812$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$812 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$814$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$814 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$815
      (DSP48E1_State-$auto$clk2fflogic.cc_86_sample_control_edge$816 state))) ; (bitvector 1)
  (let
    ((n145
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$815
        clk_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$817$_Y
      (bool->bitvector (bveq n145 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((qb_o_reg2
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$817$_Y)
        $auto$clk2fflogic.cc_102_sample_data$814$_Q
        $auto$clk2fflogic.cc_102_sample_data$812$_Q))) ; (bitvector 18)
  (let ((BREG (DSP48E1_Inputs-BREG inputs))) ; (bitvector 32)
  (let ((n149 (sign-extend (bv #b01 2) (bitvector 32)))) ; (bitvector 32)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_632$36$_Y
      (bool->bitvector (bveq BREG n149)))) ; (bitvector 1)
  (let ((n151 (sign-extend (bv #b010 3) (bitvector 32)))) ; (bitvector 32)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_644$37$_Y
      (bool->bitvector (bveq BREG n151)))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_661$42$_Y
      (bvor
        $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_632$36$_Y
        $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_644$37$_Y))) ; (bitvector 1)
  (let
    (($procmux$490$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_661$42$_Y)
        qb_o_reg2
        b_o_mux))) ; (bitvector 18)
  (let ((n155 (apply bvor (bitvector->bits BREG)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_659$39$_Y
      (bvnot n155))) ; (bitvector 1)
  (let
    ((qb_o_mux
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_659$39$_Y)
        b_o_mux
        $procmux$490$_Y))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$802$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$802 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$804$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$804 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$805
      (DSP48E1_State-$auto$clk2fflogic.cc_86_sample_control_edge$806 state))) ; (bitvector 1)
  (let
    ((n161
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$805
        clk_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$807$_Y
      (bool->bitvector (bveq n161 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((qb_o_reg1
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$807$_Y)
        $auto$clk2fflogic.cc_102_sample_data$804$_Q
        $auto$clk2fflogic.cc_102_sample_data$802$_Q))) ; (bitvector 18)
  (let
    ((n164
      (extract
        4
        4
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_557$11$_Y))) ; (bitvector 1)
  (let ((b_mult (if (bitvector->bool n164) qb_o_reg1 qb_o_mux))) ; (bitvector 18)
  (let ((n166 (extract 17 17 b_mult))) ; (bitvector 1)
  (let ((n167 (bvxor n132 n166))) ; (bitvector 1)
  (let
    (($xnor$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1048$200_Y
      (bvnot n167))) ; (bitvector 1)
  (let ((CEM (DSP48E1_Inputs-CEM inputs))) ; (bitvector 1)
  (let
    (($procmux$348$_Y
      (if
        (bitvector->bool CEM)
        $xnor$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1048$200_Y
        qcarryin_o_reg7))) ; (bitvector 1)
  (let
    (($0_qcarryin_o_reg7_0_0_
      (if (bitvector->bool RSTALLCARRYIN) (bv #b0 1) $procmux$348$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$792$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$792 state))) ; (bitvector 48)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$794$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$794 state))) ; (bitvector 48)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$795
      (DSP48E1_State-$auto$clk2fflogic.cc_86_sample_control_edge$796 state))) ; (bitvector 1)
  (let
    ((n175
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$795
        clk_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$797$_Y
      (bool->bitvector (bveq n175 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((qc_o_reg1
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$797$_Y)
        $auto$clk2fflogic.cc_102_sample_data$794$_Q
        $auto$clk2fflogic.cc_102_sample_data$792$_Q))) ; (bitvector 48)
  (let ((C (DSP48E1_Inputs-C inputs))) ; (bitvector 48)
  (let ((CEC (DSP48E1_Inputs-CEC inputs))) ; (bitvector 1)
  (let (($procmux$476$_Y (if (bitvector->bool CEC) C qc_o_reg1))) ; (bitvector 48)
  (let ((RSTC (DSP48E1_Inputs-RSTC inputs))) ; (bitvector 1)
  (let
    (($0_qc_o_reg1_47_0_
      (if
        (bitvector->bool RSTC)
        (bv #b000000000000000000000000000000000000000000000000 48)
        $procmux$476$_Y))) ; (bitvector 48)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$742$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$742 state))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$744$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$744 state))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$745
      (DSP48E1_State-$auto$clk2fflogic.cc_86_sample_control_edge$746 state))) ; (bitvector 1)
  (let
    ((n187
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$745
        clk_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$747$_Y
      (bool->bitvector (bveq n187 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((qcarryinsel_o_reg1
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$747$_Y)
        $auto$clk2fflogic.cc_102_sample_data$744$_Q
        $auto$clk2fflogic.cc_102_sample_data$742$_Q))) ; (bitvector 3)
  (let ((CARRYINSEL (DSP48E1_Inputs-CARRYINSEL inputs))) ; (bitvector 3)
  (let ((CECTRL (DSP48E1_Inputs-CECTRL inputs))) ; (bitvector 1)
  (let
    (($procmux$401$_Y
      (if (bitvector->bool CECTRL) CARRYINSEL qcarryinsel_o_reg1))) ; (bitvector 3)
  (let ((RSTCTRL (DSP48E1_Inputs-RSTCTRL inputs))) ; (bitvector 1)
  (let
    (($0_qcarryinsel_o_reg1_2_0_
      (if (bitvector->bool RSTCTRL) (bv #b000 3) $procmux$401$_Y))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$752$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$752 state))) ; (bitvector 7)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$754$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$754 state))) ; (bitvector 7)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$755
      (DSP48E1_State-$auto$clk2fflogic.cc_86_sample_control_edge$756 state))) ; (bitvector 1)
  (let
    ((n199
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$755
        clk_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$757$_Y
      (bool->bitvector (bveq n199 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((qopmode_o_reg1
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$757$_Y)
        $auto$clk2fflogic.cc_102_sample_data$754$_Q
        $auto$clk2fflogic.cc_102_sample_data$752$_Q))) ; (bitvector 7)
  (let ((OPMODE (DSP48E1_Inputs-OPMODE inputs))) ; (bitvector 7)
  (let ((IS_OPMODE_INVERTED (DSP48E1_Inputs-IS_OPMODE_INVERTED inputs))) ; (bitvector 7)
  (let ((opmode_in (bvxor OPMODE IS_OPMODE_INVERTED))) ; (bitvector 7)
  (let
    (($procmux$396$_Y (if (bitvector->bool CECTRL) opmode_in qopmode_o_reg1))) ; (bitvector 7)
  (let
    (($0_qopmode_o_reg1_6_0_
      (if (bitvector->bool RSTCTRL) (bv #b0000000 7) $procmux$396$_Y))) ; (bitvector 7)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$732$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$732 state))) ; (bitvector 4)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$734$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$734 state))) ; (bitvector 4)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$735
      (DSP48E1_State-$auto$clk2fflogic.cc_86_sample_control_edge$736 state))) ; (bitvector 1)
  (let
    ((n211
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$735
        clk_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$737$_Y
      (bool->bitvector (bveq n211 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((qalumode_o_reg1
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$737$_Y)
        $auto$clk2fflogic.cc_102_sample_data$734$_Q
        $auto$clk2fflogic.cc_102_sample_data$732$_Q))) ; (bitvector 4)
  (let ((ALUMODE (DSP48E1_Inputs-ALUMODE inputs))) ; (bitvector 4)
  (let ((IS_ALUMODE_INVERTED (DSP48E1_Inputs-IS_ALUMODE_INVERTED inputs))) ; (bitvector 4)
  (let ((alumode_in (bvxor ALUMODE IS_ALUMODE_INVERTED))) ; (bitvector 4)
  (let ((CEALUMODE (DSP48E1_Inputs-CEALUMODE inputs))) ; (bitvector 1)
  (let
    (($procmux$373$_Y
      (if (bitvector->bool CEALUMODE) alumode_in qalumode_o_reg1))) ; (bitvector 4)
  (let ((RSTALUMODE (DSP48E1_Inputs-RSTALUMODE inputs))) ; (bitvector 1)
  (let
    (($0_qalumode_o_reg1_3_0_
      (if (bitvector->bool RSTALUMODE) (bv #b0000 4) $procmux$373$_Y))) ; (bitvector 4)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$762$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$762 state))) ; (bitvector 43)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$764$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$764 state))) ; (bitvector 43)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$765
      (DSP48E1_State-$auto$clk2fflogic.cc_86_sample_control_edge$766 state))) ; (bitvector 1)
  (let
    ((n225
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$765
        clk_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$767$_Y
      (bool->bitvector (bveq n225 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((qmult_o_reg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$767$_Y)
        $auto$clk2fflogic.cc_102_sample_data$764$_Q
        $auto$clk2fflogic.cc_102_sample_data$762$_Q))) ; (bitvector 43)
  (let ((n228 (sign-extend ad_mult (bitvector 43)))) ; (bitvector 43)
  (let ((n229 (sign-extend b_mult (bitvector 43)))) ; (bitvector 43)
  (let
    (($mul$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_764$82$_Y
      (bvmul n228 n229))) ; (bitvector 43)
  (let ((n233 (zero-extend (bv #b10 2) (bitvector 3)))) ; (bitvector 3)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_763$81$_Y
      (bool->bitvector (bveq CARRYINSEL n233)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_763$83_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_763$81$_Y)
        (bv #b0000000000000000000000000000000000000000000 43)
        $mul$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_764$82$_Y))) ; (bitvector 43)
  (let ((USE_MULT (DSP48E1_Inputs-USE_MULT inputs))) ; (bitvector 5)
  (let ((n238 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_762$78$_Y
      (bool->bitvector (bveq USE_MULT n238)))) ; (bitvector 1)
  (let ((USE_SIMD (DSP48E1_Inputs-USE_SIMD inputs))) ; (bitvector 5)
  (let ((n242 (zero-extend (bv #b111 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($ne$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_762$79_Y
      (bool->bitvector (not (bveq USE_SIMD n242))))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_762$80$_Y
      (bvor
        $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_762$78$_Y
        $ne$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_762$79_Y))) ; (bitvector 1)
  (let
    ((mult_o
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_762$80$_Y)
        (bv #b0000000000000000000000000000000000000000000 43)
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_763$83_Y))) ; (bitvector 43)
  (let (($procmux$434$_Y (if (bitvector->bool CEM) mult_o qmult_o_reg))) ; (bitvector 43)
  (let ((RSTM (DSP48E1_Inputs-RSTM inputs))) ; (bitvector 1)
  (let
    (($0_qmult_o_reg_42_0_
      (if
        (bitvector->bool RSTM)
        (bv #b0000000000000000000000000000000000000000000 43)
        $procmux$434$_Y))) ; (bitvector 43)
  (let ((CEB2 (DSP48E1_Inputs-CEB2 inputs))) ; (bitvector 1)
  (let (($procmux$498$_Y (if (bitvector->bool CEB2) qb_o_reg1 qb_o_reg2))) ; (bitvector 18)
  (let ((RSTB (DSP48E1_Inputs-RSTB inputs))) ; (bitvector 1)
  (let
    (($procmux$501$_Y
      (if (bitvector->bool RSTB) (bv #b000000000000000000 18) $procmux$498$_Y))) ; (bitvector 18)
  (let
    (($procmux$503$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_644$37$_Y)
        $procmux$501$_Y
        qb_o_reg2))) ; (bitvector 18)
  (let (($procmux$506$_Y (if (bitvector->bool CEB2) b_o_mux qb_o_reg2))) ; (bitvector 18)
  (let
    (($procmux$509$_Y
      (if (bitvector->bool RSTB) (bv #b000000000000000000 18) $procmux$506$_Y))) ; (bitvector 18)
  (let
    (($0_qb_o_reg2_17_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_632$36$_Y)
        $procmux$509$_Y
        $procmux$503$_Y))) ; (bitvector 18)
  (let ((CEA2 (DSP48E1_Inputs-CEA2 inputs))) ; (bitvector 1)
  (let (($procmux$554$_Y (if (bitvector->bool CEA2) qa_o_reg1 qa_o_reg2))) ; (bitvector 30)
  (let ((RSTA (DSP48E1_Inputs-RSTA inputs))) ; (bitvector 1)
  (let
    (($procmux$557$_Y
      (if
        (bitvector->bool RSTA)
        (bv #b000000000000000000000000000000 30)
        $procmux$554$_Y))) ; (bitvector 30)
  (let
    (($procmux$559$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_583$17$_Y)
        $procmux$557$_Y
        qa_o_reg2))) ; (bitvector 30)
  (let (($procmux$562$_Y (if (bitvector->bool CEA2) a_o_mux qa_o_reg2))) ; (bitvector 30)
  (let
    (($procmux$565$_Y
      (if
        (bitvector->bool RSTA)
        (bv #b000000000000000000000000000000 30)
        $procmux$562$_Y))) ; (bitvector 30)
  (let
    (($0_qa_o_reg2_29_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_571$16$_Y)
        $procmux$565$_Y
        $procmux$559$_Y))) ; (bitvector 30)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$662$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$662 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$664$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$664 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$665
      (DSP48E1_State-$auto$clk2fflogic.cc_86_sample_control_edge$666 state))) ; (bitvector 1)
  (let
    ((n270
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$665
        clk_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$667$_Y
      (bool->bitvector (bveq n270 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((pdetb_o_reg2
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$667$_Y)
        $auto$clk2fflogic.cc_102_sample_data$664$_Q
        $auto$clk2fflogic.cc_102_sample_data$662$_Q))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$652$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$652 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$654$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$654 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$655
      (DSP48E1_State-$auto$clk2fflogic.cc_86_sample_control_edge$656 state))) ; (bitvector 1)
  (let
    ((n276
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$655
        clk_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$657$_Y
      (bool->bitvector (bveq n276 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((pdetb_o_reg1
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$657$_Y)
        $auto$clk2fflogic.cc_102_sample_data$654$_Q
        $auto$clk2fflogic.cc_102_sample_data$652$_Q))) ; (bitvector 1)
  (let ((CEP (DSP48E1_Inputs-CEP inputs))) ; (bitvector 1)
  (let (($procmux$290$_Y (if (bitvector->bool CEP) pdetb_o_reg1 pdetb_o_reg2))) ; (bitvector 1)
  (let ((RSTP (DSP48E1_Inputs-RSTP inputs))) ; (bitvector 1)
  (let ((AUTORESET_PATDET (DSP48E1_Inputs-AUTORESET_PATDET inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1080$211$_Y
      (bool->bitvector (bveq AUTORESET_PATDET (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$632$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$632 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$634$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$634 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$635
      (DSP48E1_State-$auto$clk2fflogic.cc_86_sample_control_edge$636 state))) ; (bitvector 1)
  (let
    ((n288
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$635
        clk_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$637$_Y
      (bool->bitvector (bveq n288 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((pdet_o_reg1
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$637$_Y)
        $auto$clk2fflogic.cc_102_sample_data$634$_Q
        $auto$clk2fflogic.cc_102_sample_data$632$_Q))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1080$212$_Y
      (bvand
        $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1080$211$_Y
        pdet_o_reg1))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1082$213$_Y
      (bool->bitvector (bveq AUTORESET_PATDET (bv #b10010 5))))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$642$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$642 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$644$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$644 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$645
      (DSP48E1_State-$auto$clk2fflogic.cc_86_sample_control_edge$646 state))) ; (bitvector 1)
  (let
    ((n297
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$645
        clk_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$647$_Y
      (bool->bitvector (bveq n297 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((pdet_o_reg2
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$647$_Y)
        $auto$clk2fflogic.cc_102_sample_data$644$_Q
        $auto$clk2fflogic.cc_102_sample_data$642$_Q))) ; (bitvector 1)
  (let
    (($logic_not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1082$214_Y
      (bvnot pdet_o_reg1))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1082$215$_Y
      (bvand
        pdet_o_reg2
        $logic_not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1082$214_Y))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1082$216$_Y
      (bvand
        $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1082$213$_Y
        $logic_and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1082$215$_Y))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1080$217$_Y
      (bvor
        $logic_and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1080$212$_Y
        $logic_and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1082$216$_Y))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1088$219$_Y
      (bvor
        RSTP
        $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1080$217$_Y))) ; (bitvector 1)
  (let
    (($0_pdetb_o_reg2_0_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1088$219$_Y)
        (bv #b0 1)
        $procmux$290$_Y))) ; (bitvector 1)
  (let (($procmux$300$_Y (if (bitvector->bool CEP) pdet_o_reg1 pdet_o_reg2))) ; (bitvector 1)
  (let
    (($0_pdet_o_reg2_0_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1088$219$_Y)
        (bv #b0 1)
        $procmux$300$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$702$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$702 state))) ; (bitvector 4)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$704$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$704 state))) ; (bitvector 4)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$705
      (DSP48E1_State-$auto$clk2fflogic.cc_86_sample_control_edge$706 state))) ; (bitvector 1)
  (let
    ((n311
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$705
        clk_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$707$_Y
      (bool->bitvector (bveq n311 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((carryout_o_reg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$707$_Y)
        $auto$clk2fflogic.cc_102_sample_data$704$_Q
        $auto$clk2fflogic.cc_102_sample_data$702$_Q))) ; (bitvector 4)
  (let ((n315 (concat qa_o_mux qb_o_mux))) ; (bitvector 48)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$672$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$672 state))) ; (bitvector 48)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$674$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$674 state))) ; (bitvector 48)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$675
      (DSP48E1_State-$auto$clk2fflogic.cc_86_sample_control_edge$676 state))) ; (bitvector 1)
  (let
    ((n319
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$675
        clk_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$677$_Y
      (bool->bitvector (bveq n319 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((qp_o_reg1
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$677$_Y)
        $auto$clk2fflogic.cc_102_sample_data$674$_Q
        $auto$clk2fflogic.cc_102_sample_data$672$_Q))) ; (bitvector 48)
  (let ((n322 (concat qp_o_reg1 n315))) ; (bitvector 96)
  (let ((MREG (DSP48E1_Inputs-MREG inputs))) ; (bitvector 32)
  (let ((n324 (sign-extend (bv #b01 2) (bitvector 32)))) ; (bitvector 32)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_787$88$_Y
      (bool->bitvector (bveq MREG n324)))) ; (bitvector 1)
  (let
    (($procmux$426$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_787$88$_Y)
        qmult_o_reg
        mult_o))) ; (bitvector 43)
  (let ((CARRYINSELREG (DSP48E1_Inputs-CARRYINSELREG inputs))) ; (bitvector 32)
  (let ((n328 (sign-extend (bv #b01 2) (bitvector 32)))) ; (bitvector 32)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_883$97$_Y
      (bool->bitvector (bveq CARRYINSELREG n328)))) ; (bitvector 1)
  (let
    (($procmux$388$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_883$97$_Y)
        qcarryinsel_o_reg1
        CARRYINSEL))) ; (bitvector 3)
  (let ((n331 (apply bvor (bitvector->bits CARRYINSELREG)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_881$96$_Y
      (bvnot n331))) ; (bitvector 1)
  (let
    ((qcarryinsel_o_mux
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_881$96$_Y)
        CARRYINSEL
        $procmux$388$_Y))) ; (bitvector 3)
  (let ((n334 (zero-extend (bv #b10 2) (bitvector 3)))) ; (bitvector 3)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_785$87$_Y
      (bool->bitvector (bveq qcarryinsel_o_mux n334)))) ; (bitvector 1)
  (let
    ((qmult_o_mux
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_785$87$_Y)
        (bv #b0000000000000000000000000000000000000000000 43)
        $procmux$426$_Y))) ; (bitvector 43)
  (let ((n337 (concat qmult_o_mux n322))) ; (bitvector 139)
  (let ((n338 (extract 42 42 qmult_o_mux))) ; (bitvector 1)
  (let ((n339 (concat n338 n337))) ; (bitvector 140)
  (let ((n340 (concat n338 n339))) ; (bitvector 141)
  (let ((n341 (concat n338 n340))) ; (bitvector 142)
  (let ((n342 (concat n338 n341))) ; (bitvector 143)
  (let ((n343 (concat n338 n342))) ; (bitvector 144)
  (let
    ((n344
      (concat (bv #b000000000000000000000000000000000000000000000000 48) n343))) ; (bitvector 192)
  (let ((n345 (extract 47 0 n344))) ; (bitvector 48)
  (let ((OPMODEREG (DSP48E1_Inputs-OPMODEREG inputs))) ; (bitvector 32)
  (let ((n347 (sign-extend (bv #b01 2) (bitvector 32)))) ; (bitvector 32)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_910$100$_Y
      (bool->bitvector (bveq OPMODEREG n347)))) ; (bitvector 1)
  (let
    (($procmux$379$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_910$100$_Y)
        qopmode_o_reg1
        opmode_in))) ; (bitvector 7)
  (let ((n350 (apply bvor (bitvector->bits OPMODEREG)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_908$99$_Y
      (bvnot n350))) ; (bitvector 1)
  (let
    ((qopmode_o_mux
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_908$99$_Y)
        opmode_in
        $procmux$379$_Y))) ; (bitvector 7)
  (let ((n353 (extract 1 0 qopmode_o_mux))) ; (bitvector 2)
  (let (($procmux$421_CMP (bool->bitvector (bveq n353 (bv #b11 2))))) ; (bitvector 1)
  (let (($procmux$422_CMP (bool->bitvector (bveq n353 (bv #b10 2))))) ; (bitvector 1)
  (let ((n357 (concat $procmux$422_CMP $procmux$421_CMP))) ; (bitvector 2)
  (let ((n358 (zero-extend (bv #b1 1) (bitvector 2)))) ; (bitvector 2)
  (let (($procmux$423_CMP (bool->bitvector (bveq n353 n358)))) ; (bitvector 1)
  (let ((n360 (concat $procmux$423_CMP n357))) ; (bitvector 3)
  (let ((n361 (apply bvor (bitvector->bits n353)))) ; (bitvector 1)
  (let (($procmux$424_CMP (bvnot n361))) ; (bitvector 1)
  (let ((n363 (concat $procmux$424_CMP n360))) ; (bitvector 4)
  (let ((n364 (extract 0 0 n363))) ; (bitvector 1)
  (let
    ((n365
      (if
        (bitvector->bool n364)
        n345
        (bv #b000000000000000000000000000000000000000000000000 48)))) ; (bitvector 48)
  (let ((n366 (extract 95 48 n344))) ; (bitvector 48)
  (let ((n367 (extract 1 1 n363))) ; (bitvector 1)
  (let ((n368 (if (bitvector->bool n367) n366 n365))) ; (bitvector 48)
  (let ((n369 (extract 143 96 n344))) ; (bitvector 48)
  (let ((n370 (extract 2 2 n363))) ; (bitvector 1)
  (let ((n371 (if (bitvector->bool n370) n369 n368))) ; (bitvector 48)
  (let ((n372 (extract 191 144 n344))) ; (bitvector 48)
  (let ((n373 (extract 3 3 n363))) ; (bitvector 1)
  (let ((qx_o_mux (if (bitvector->bool n373) n372 n371))) ; (bitvector 48)
  (let ((CREG (DSP48E1_Inputs-CREG inputs))) ; (bitvector 32)
  (let ((n376 (sign-extend (bv #b01 2) (bitvector 32)))) ; (bitvector 32)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_695$54$_Y
      (bool->bitvector (bveq CREG n376)))) ; (bitvector 1)
  (let
    (($procmux$468$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_695$54$_Y)
        qc_o_reg1
        C))) ; (bitvector 48)
  (let ((n379 (apply bvor (bitvector->bits CREG)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_694$53$_Y
      (bvnot n379))) ; (bitvector 1)
  (let
    ((qc_o_mux
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_694$53$_Y)
        C
        $procmux$468$_Y))) ; (bitvector 48)
  (let ((MULTSIGNIN (DSP48E1_Inputs-MULTSIGNIN inputs))) ; (bitvector 1)
  (let ((n384 (concat MULTSIGNIN MULTSIGNIN))) ; (bitvector 2)
  (let ((n385 (concat MULTSIGNIN n384))) ; (bitvector 3)
  (let ((n386 (concat MULTSIGNIN n385))) ; (bitvector 4)
  (let ((n387 (concat MULTSIGNIN n386))) ; (bitvector 5)
  (let ((n388 (concat MULTSIGNIN n387))) ; (bitvector 6)
  (let ((n389 (concat MULTSIGNIN n388))) ; (bitvector 7)
  (let ((n390 (concat MULTSIGNIN n389))) ; (bitvector 8)
  (let ((n391 (concat MULTSIGNIN n390))) ; (bitvector 9)
  (let ((n392 (concat MULTSIGNIN n391))) ; (bitvector 10)
  (let ((n393 (concat MULTSIGNIN n392))) ; (bitvector 11)
  (let ((n394 (concat MULTSIGNIN n393))) ; (bitvector 12)
  (let ((n395 (concat MULTSIGNIN n394))) ; (bitvector 13)
  (let ((n396 (concat MULTSIGNIN n395))) ; (bitvector 14)
  (let ((n397 (concat MULTSIGNIN n396))) ; (bitvector 15)
  (let ((n398 (concat MULTSIGNIN n397))) ; (bitvector 16)
  (let ((n399 (concat MULTSIGNIN n398))) ; (bitvector 17)
  (let ((n400 (concat MULTSIGNIN n399))) ; (bitvector 18)
  (let ((n401 (concat MULTSIGNIN n400))) ; (bitvector 19)
  (let ((n402 (concat MULTSIGNIN n401))) ; (bitvector 20)
  (let ((n403 (concat MULTSIGNIN n402))) ; (bitvector 21)
  (let ((n404 (concat MULTSIGNIN n403))) ; (bitvector 22)
  (let ((n405 (concat MULTSIGNIN n404))) ; (bitvector 23)
  (let ((n406 (concat MULTSIGNIN n405))) ; (bitvector 24)
  (let ((n407 (concat MULTSIGNIN n406))) ; (bitvector 25)
  (let ((n408 (concat MULTSIGNIN n407))) ; (bitvector 26)
  (let ((n409 (concat MULTSIGNIN n408))) ; (bitvector 27)
  (let ((n410 (concat MULTSIGNIN n409))) ; (bitvector 28)
  (let ((n411 (concat MULTSIGNIN n410))) ; (bitvector 29)
  (let ((n412 (concat MULTSIGNIN n411))) ; (bitvector 30)
  (let ((n413 (concat MULTSIGNIN n412))) ; (bitvector 31)
  (let ((n414 (concat MULTSIGNIN n413))) ; (bitvector 32)
  (let ((n415 (concat MULTSIGNIN n414))) ; (bitvector 33)
  (let ((n416 (concat MULTSIGNIN n415))) ; (bitvector 34)
  (let ((n417 (concat MULTSIGNIN n416))) ; (bitvector 35)
  (let ((n418 (concat MULTSIGNIN n417))) ; (bitvector 36)
  (let ((n419 (concat MULTSIGNIN n418))) ; (bitvector 37)
  (let ((n420 (concat MULTSIGNIN n419))) ; (bitvector 38)
  (let ((n421 (concat MULTSIGNIN n420))) ; (bitvector 39)
  (let ((n422 (concat MULTSIGNIN n421))) ; (bitvector 40)
  (let ((n423 (concat MULTSIGNIN n422))) ; (bitvector 41)
  (let ((n424 (concat MULTSIGNIN n423))) ; (bitvector 42)
  (let ((n425 (concat MULTSIGNIN n424))) ; (bitvector 43)
  (let ((n426 (concat MULTSIGNIN n425))) ; (bitvector 44)
  (let ((n427 (concat MULTSIGNIN n426))) ; (bitvector 45)
  (let ((n428 (concat MULTSIGNIN n427))) ; (bitvector 46)
  (let ((n429 (concat MULTSIGNIN n428))) ; (bitvector 47)
  (let ((n430 (concat MULTSIGNIN n429))) ; (bitvector 48)
  (let ((n431 (extract 6 4 qopmode_o_mux))) ; (bitvector 3)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_826$90_Y
      (bool->bitvector (bveq n431 (bv #b100 3))))) ; (bitvector 1)
  (let
    ((y_mac_cascd
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_826$90_Y)
        n430
        (bv #b111111111111111111111111111111111111111111111111 48)))) ; (bitvector 48)
  (let ((n435 (concat y_mac_cascd qc_o_mux))) ; (bitvector 96)
  (let
    ((n436
      (concat (bv #b000000000000000000000000000000000000000000000000 48) n435))) ; (bitvector 144)
  (let ((n437 (extract 47 0 n436))) ; (bitvector 48)
  (let ((n438 (extract 3 2 qopmode_o_mux))) ; (bitvector 2)
  (let (($procmux$416_CMP (bool->bitvector (bveq n438 (bv #b11 2))))) ; (bitvector 1)
  (let (($procmux$417_CMP (bool->bitvector (bveq n438 (bv #b10 2))))) ; (bitvector 1)
  (let ((n441 (concat $procmux$417_CMP $procmux$416_CMP))) ; (bitvector 2)
  (let ((n442 (zero-extend (bv #b1 1) (bitvector 2)))) ; (bitvector 2)
  (let (($procmux$418_CMP (bool->bitvector (bveq n438 n442)))) ; (bitvector 1)
  (let ((n444 (apply bvor (bitvector->bits n438)))) ; (bitvector 1)
  (let (($procmux$419_CMP (bvnot n444))) ; (bitvector 1)
  (let ((n446 (concat $procmux$419_CMP $procmux$418_CMP))) ; (bitvector 2)
  (let
    (($auto$opt_reduce.cc_131_opt_pmux$624$_Y
      (apply bvor (bitvector->bits n446)))) ; (bitvector 1)
  (let ((n448 (concat $auto$opt_reduce.cc_131_opt_pmux$624$_Y n441))) ; (bitvector 3)
  (let ((n449 (extract 0 0 n448))) ; (bitvector 1)
  (let
    ((n450
      (if
        (bitvector->bool n449)
        n437
        (bv #b000000000000000000000000000000000000000000000000 48)))) ; (bitvector 48)
  (let ((n451 (extract 95 48 n436))) ; (bitvector 48)
  (let ((n452 (extract 1 1 n448))) ; (bitvector 1)
  (let ((n453 (if (bitvector->bool n452) n451 n450))) ; (bitvector 48)
  (let ((n454 (extract 143 96 n436))) ; (bitvector 48)
  (let ((n455 (extract 2 2 n448))) ; (bitvector 1)
  (let ((qy_o_mux (if (bitvector->bool n455) n454 n453))) ; (bitvector 48)
  (let
    (($and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_969$107$_Y
      (bvand qx_o_mux qy_o_mux))) ; (bitvector 48)
  (let ((n458 (extract 47 17 qp_o_reg1))) ; (bitvector 31)
  (let ((n459 (extract 47 47 qp_o_reg1))) ; (bitvector 1)
  (let ((n460 (concat n459 n458))) ; (bitvector 32)
  (let ((n461 (concat n459 n460))) ; (bitvector 33)
  (let ((n462 (concat n459 n461))) ; (bitvector 34)
  (let ((n463 (concat n459 n462))) ; (bitvector 35)
  (let ((n464 (concat n459 n463))) ; (bitvector 36)
  (let ((n465 (concat n459 n464))) ; (bitvector 37)
  (let ((n466 (concat n459 n465))) ; (bitvector 38)
  (let ((n467 (concat n459 n466))) ; (bitvector 39)
  (let ((n468 (concat n459 n467))) ; (bitvector 40)
  (let ((n469 (concat n459 n468))) ; (bitvector 41)
  (let ((n470 (concat n459 n469))) ; (bitvector 42)
  (let ((n471 (concat n459 n470))) ; (bitvector 43)
  (let ((n472 (concat n459 n471))) ; (bitvector 44)
  (let ((n473 (concat n459 n472))) ; (bitvector 45)
  (let ((n474 (concat n459 n473))) ; (bitvector 46)
  (let ((n475 (concat n459 n474))) ; (bitvector 47)
  (let ((n476 (concat n459 n475))) ; (bitvector 48)
  (let ((PCIN (DSP48E1_Inputs-PCIN inputs))) ; (bitvector 48)
  (let ((n478 (extract 47 17 PCIN))) ; (bitvector 31)
  (let ((n479 (concat n478 n476))) ; (bitvector 79)
  (let ((n480 (extract 47 47 PCIN))) ; (bitvector 1)
  (let ((n481 (concat n480 n479))) ; (bitvector 80)
  (let ((n482 (concat n480 n481))) ; (bitvector 81)
  (let ((n483 (concat n480 n482))) ; (bitvector 82)
  (let ((n484 (concat n480 n483))) ; (bitvector 83)
  (let ((n485 (concat n480 n484))) ; (bitvector 84)
  (let ((n486 (concat n480 n485))) ; (bitvector 85)
  (let ((n487 (concat n480 n486))) ; (bitvector 86)
  (let ((n488 (concat n480 n487))) ; (bitvector 87)
  (let ((n489 (concat n480 n488))) ; (bitvector 88)
  (let ((n490 (concat n480 n489))) ; (bitvector 89)
  (let ((n491 (concat n480 n490))) ; (bitvector 90)
  (let ((n492 (concat n480 n491))) ; (bitvector 91)
  (let ((n493 (concat n480 n492))) ; (bitvector 92)
  (let ((n494 (concat n480 n493))) ; (bitvector 93)
  (let ((n495 (concat n480 n494))) ; (bitvector 94)
  (let ((n496 (concat n480 n495))) ; (bitvector 95)
  (let ((n497 (concat n480 n496))) ; (bitvector 96)
  (let ((n498 (concat qp_o_reg1 n497))) ; (bitvector 144)
  (let ((n499 (concat qc_o_mux n498))) ; (bitvector 192)
  (let ((n500 (concat PCIN n499))) ; (bitvector 240)
  (let
    ((n501
      (concat (bv #b000000000000000000000000000000000000000000000000 48) n500))) ; (bitvector 288)
  (let ((n502 (extract 47 0 n501))) ; (bitvector 48)
  (let ((n503 (extract 6 4 qopmode_o_mux))) ; (bitvector 3)
  (let (($procmux$407_CMP (bool->bitvector (bveq n503 (bv #b111 3))))) ; (bitvector 1)
  (let (($procmux$408_CMP (bool->bitvector (bveq n503 (bv #b110 3))))) ; (bitvector 1)
  (let ((n507 (concat $procmux$408_CMP $procmux$407_CMP))) ; (bitvector 2)
  (let
    (($auto$opt_reduce.cc_131_opt_pmux$620$_Y
      (apply bvor (bitvector->bits n507)))) ; (bitvector 1)
  (let (($procmux$409_CMP (bool->bitvector (bveq n503 (bv #b101 3))))) ; (bitvector 1)
  (let
    ((n511 (concat $procmux$409_CMP $auto$opt_reduce.cc_131_opt_pmux$620$_Y))) ; (bitvector 2)
  (let ((n512 (zero-extend (bv #b10 2) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$412_CMP (bool->bitvector (bveq n503 n512)))) ; (bitvector 1)
  (let
    ((n514
      (concat
        $procmux$412_CMP
        $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_826$90_Y))) ; (bitvector 2)
  (let
    (($auto$opt_reduce.cc_131_opt_pmux$622$_Y
      (apply bvor (bitvector->bits n514)))) ; (bitvector 1)
  (let ((n516 (concat $auto$opt_reduce.cc_131_opt_pmux$622$_Y n511))) ; (bitvector 3)
  (let ((n517 (zero-extend (bv #b11 2) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$411_CMP (bool->bitvector (bveq n503 n517)))) ; (bitvector 1)
  (let ((n519 (concat $procmux$411_CMP n516))) ; (bitvector 4)
  (let ((n520 (zero-extend (bv #b1 1) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$413_CMP (bool->bitvector (bveq n503 n520)))) ; (bitvector 1)
  (let ((n522 (concat $procmux$413_CMP n519))) ; (bitvector 5)
  (let ((n523 (apply bvor (bitvector->bits n503)))) ; (bitvector 1)
  (let (($procmux$414_CMP (bvnot n523))) ; (bitvector 1)
  (let ((n525 (concat $procmux$414_CMP n522))) ; (bitvector 6)
  (let ((n526 (extract 0 0 n525))) ; (bitvector 1)
  (let
    ((n527
      (if
        (bitvector->bool n526)
        n502
        (bv #b000000000000000000000000000000000000000000000000 48)))) ; (bitvector 48)
  (let ((n528 (extract 95 48 n501))) ; (bitvector 48)
  (let ((n529 (extract 1 1 n525))) ; (bitvector 1)
  (let ((n530 (if (bitvector->bool n529) n528 n527))) ; (bitvector 48)
  (let ((n531 (extract 143 96 n501))) ; (bitvector 48)
  (let ((n532 (extract 2 2 n525))) ; (bitvector 1)
  (let ((n533 (if (bitvector->bool n532) n531 n530))) ; (bitvector 48)
  (let ((n534 (extract 191 144 n501))) ; (bitvector 48)
  (let ((n535 (extract 3 3 n525))) ; (bitvector 1)
  (let ((n536 (if (bitvector->bool n535) n534 n533))) ; (bitvector 48)
  (let ((n537 (extract 239 192 n501))) ; (bitvector 48)
  (let ((n538 (extract 4 4 n525))) ; (bitvector 1)
  (let ((n539 (if (bitvector->bool n538) n537 n536))) ; (bitvector 48)
  (let ((n540 (extract 287 240 n501))) ; (bitvector 48)
  (let ((n541 (extract 5 5 n525))) ; (bitvector 1)
  (let ((qz_o_mux (if (bitvector->bool n541) n540 n539))) ; (bitvector 48)
  (let
    (($and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_973$118$_Y
      (bvand qz_o_mux qy_o_mux))) ; (bitvector 48)
  (let
    (($or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_973$119$_Y
      (bvor
        $and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_969$107$_Y
        $and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_973$118$_Y))) ; (bitvector 48)
  (let
    (($and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_973$120$_Y
      (bvand qx_o_mux qz_o_mux))) ; (bitvector 48)
  (let
    (($or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_973$121$_Y
      (bvor
        $or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_973$119$_Y
        $and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_973$120$_Y))) ; (bitvector 48)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_969$108_Y
      (bvnot qz_o_mux))) ; (bitvector 48)
  (let
    (($and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_969$109$_Y
      (bvand
        $not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_969$108_Y
        qy_o_mux))) ; (bitvector 48)
  (let
    (($or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_969$110$_Y
      (bvor
        $and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_969$107$_Y
        $and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_969$109$_Y))) ; (bitvector 48)
  (let
    (($and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_969$112$_Y
      (bvand
        qx_o_mux
        $not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_969$108_Y))) ; (bitvector 48)
  (let
    (($or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_969$113$_Y
      (bvor
        $or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_969$110$_Y
        $and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_969$112$_Y))) ; (bitvector 48)
  (let ((ALUMODEREG (DSP48E1_Inputs-ALUMODEREG inputs))) ; (bitvector 32)
  (let ((n553 (sign-extend (bv #b01 2) (bitvector 32)))) ; (bitvector 32)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_928$104$_Y
      (bool->bitvector (bveq ALUMODEREG n553)))) ; (bitvector 1)
  (let
    (($procmux$365$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_928$104$_Y)
        qalumode_o_reg1
        alumode_in))) ; (bitvector 4)
  (let ((n556 (apply bvor (bitvector->bits ALUMODEREG)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_926$103$_Y
      (bvnot n556))) ; (bitvector 1)
  (let
    ((qalumode_o_mux
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_926$103$_Y)
        alumode_in
        $procmux$365$_Y))) ; (bitvector 4)
  (let ((n559 (extract 0 0 qalumode_o_mux))) ; (bitvector 1)
  (let
    (($procmux$362$_Y
      (if
        (bitvector->bool n559)
        $or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_969$113$_Y
        $or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_973$121$_Y))) ; (bitvector 48)
  (let ((n561 (extract 2 2 qalumode_o_mux))) ; (bitvector 1)
  (let
    ((comux
      (if
        (bitvector->bool n561)
        (bv #b000000000000000000000000000000000000000000000000 48)
        $procmux$362$_Y))) ; (bitvector 48)
  (let ((n563 (extract 11 11 comux))) ; (bitvector 1)
  (let ((n565 (apply bvor (bitvector->bits MREG)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1054$202$_Y
      (bvnot n565))) ; (bitvector 1)
  (let
    ((qcarryin_o_mux7
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1054$202$_Y)
        $xnor$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1048$200_Y
        qcarryin_o_reg7))) ; (bitvector 1)
  (let ((n568 (concat qcarryin_o_mux7 n459))) ; (bitvector 2)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1064$207$_Y
      (bvnot n459))) ; (bitvector 1)
  (let
    ((n570
      (concat
        $not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1064$207$_Y
        n568))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$692$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$692 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$694$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$694 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$695
      (DSP48E1_State-$auto$clk2fflogic.cc_86_sample_control_edge$696 state))) ; (bitvector 1)
  (let
    ((n574
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$695
        clk_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$697$_Y
      (bool->bitvector (bveq n574 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((carrycascout_o_reg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$697$_Y)
        $auto$clk2fflogic.cc_102_sample_data$694$_Q
        $auto$clk2fflogic.cc_102_sample_data$692$_Q))) ; (bitvector 1)
  (let ((n577 (concat carrycascout_o_reg n570))) ; (bitvector 4)
  (let ((n578 (concat n480 n577))) ; (bitvector 5)
  (let ((CARRYCASCIN (DSP48E1_Inputs-CARRYCASCIN inputs))) ; (bitvector 1)
  (let ((n580 (concat CARRYCASCIN n578))) ; (bitvector 6)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1060$206$_Y
      (bvnot n480))) ; (bitvector 1)
  (let
    ((n582
      (concat
        $not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1060$206$_Y
        n580))) ; (bitvector 7)
  (let ((CARRYINREG (DSP48E1_Inputs-CARRYINREG inputs))) ; (bitvector 32)
  (let ((n584 (sign-extend (bv #b01 2) (bitvector 32)))) ; (bitvector 32)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1039$196$_Y
      (bool->bitvector (bveq CARRYINREG n584)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1039$197$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1039$196$_Y)
        qcarryin_o_reg0
        carryin_in))) ; (bitvector 1)
  (let ((n587 (apply bvor (bitvector->bits CARRYINREG)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1039$195$_Y
      (bvnot n587))) ; (bitvector 1)
  (let
    ((qcarryin_o_mux0
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1039$195$_Y)
        carryin_in
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1039$197$_Y))) ; (bitvector 1)
  (let ((n590 (concat qcarryin_o_mux0 n582))) ; (bitvector 8)
  (let ((n591 (extract 0 0 n590))) ; (bitvector 1)
  (let
    (($procmux$340_CMP (bool->bitvector (bveq qcarryinsel_o_mux (bv #b111 3))))) ; (bitvector 1)
  (let
    (($procmux$341_CMP (bool->bitvector (bveq qcarryinsel_o_mux (bv #b110 3))))) ; (bitvector 1)
  (let ((n594 (concat $procmux$341_CMP $procmux$340_CMP))) ; (bitvector 2)
  (let
    (($procmux$342_CMP (bool->bitvector (bveq qcarryinsel_o_mux (bv #b101 3))))) ; (bitvector 1)
  (let ((n596 (concat $procmux$342_CMP n594))) ; (bitvector 3)
  (let
    (($procmux$343_CMP (bool->bitvector (bveq qcarryinsel_o_mux (bv #b100 3))))) ; (bitvector 1)
  (let ((n598 (concat $procmux$343_CMP n596))) ; (bitvector 4)
  (let ((n599 (zero-extend (bv #b11 2) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$344_CMP (bool->bitvector (bveq qcarryinsel_o_mux n599)))) ; (bitvector 1)
  (let ((n601 (concat $procmux$344_CMP n598))) ; (bitvector 5)
  (let
    ((n602
      (concat
        $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_785$87$_Y
        n601))) ; (bitvector 6)
  (let ((n603 (zero-extend (bv #b1 1) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$346_CMP (bool->bitvector (bveq qcarryinsel_o_mux n603)))) ; (bitvector 1)
  (let ((n605 (concat $procmux$346_CMP n602))) ; (bitvector 7)
  (let ((n606 (apply bvor (bitvector->bits qcarryinsel_o_mux)))) ; (bitvector 1)
  (let (($procmux$347_CMP (bvnot n606))) ; (bitvector 1)
  (let ((n608 (concat $procmux$347_CMP n605))) ; (bitvector 8)
  (let ((n609 (extract 0 0 n608))) ; (bitvector 1)
  (let ((n610 (if (bitvector->bool n609) n591 (bv #b0 1)))) ; (bitvector 1)
  (let ((n611 (extract 1 1 n590))) ; (bitvector 1)
  (let ((n612 (extract 1 1 n608))) ; (bitvector 1)
  (let ((n613 (if (bitvector->bool n612) n611 n610))) ; (bitvector 1)
  (let ((n614 (extract 2 2 n590))) ; (bitvector 1)
  (let ((n615 (extract 2 2 n608))) ; (bitvector 1)
  (let ((n616 (if (bitvector->bool n615) n614 n613))) ; (bitvector 1)
  (let ((n617 (extract 3 3 n590))) ; (bitvector 1)
  (let ((n618 (extract 3 3 n608))) ; (bitvector 1)
  (let ((n619 (if (bitvector->bool n618) n617 n616))) ; (bitvector 1)
  (let ((n620 (extract 4 4 n590))) ; (bitvector 1)
  (let ((n621 (extract 4 4 n608))) ; (bitvector 1)
  (let ((n622 (if (bitvector->bool n621) n620 n619))) ; (bitvector 1)
  (let ((n623 (extract 5 5 n590))) ; (bitvector 1)
  (let ((n624 (extract 5 5 n608))) ; (bitvector 1)
  (let ((n625 (if (bitvector->bool n624) n623 n622))) ; (bitvector 1)
  (let ((n626 (extract 6 6 n590))) ; (bitvector 1)
  (let ((n627 (extract 6 6 n608))) ; (bitvector 1)
  (let ((n628 (if (bitvector->bool n627) n626 n625))) ; (bitvector 1)
  (let ((n629 (extract 7 7 n590))) ; (bitvector 1)
  (let ((n630 (extract 7 7 n608))) ; (bitvector 1)
  (let (($procmux$339$_Y (if (bitvector->bool n630) n629 n628))) ; (bitvector 1)
  (let ((n632 (extract 3 3 qalumode_o_mux))) ; (bitvector 1)
  (let ((n633 (extract 2 2 qalumode_o_mux))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1073$209$_Y
      (bvor n632 n633))) ; (bitvector 1)
  (let
    ((qcarryin_o_mux
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1073$209$_Y)
        (bv #b0 1)
        $procmux$339$_Y))) ; (bitvector 1)
  (let ((n636 (extract 10 0 comux))) ; (bitvector 11)
  (let ((n637 (concat n636 qcarryin_o_mux))) ; (bitvector 12)
  (let ((n638 (zero-extend n637 (bitvector 13)))) ; (bitvector 13)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_974$122$_Y
      (bvxor qz_o_mux qx_o_mux))) ; (bitvector 48)
  (let
    (($auto$wreduce.cc_514_run$629
      (bvxor
        $xor$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_974$122$_Y
        qy_o_mux))) ; (bitvector 48)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_970$115$_Y
      (bvxor
        $not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_969$108_Y
        qx_o_mux))) ; (bitvector 48)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_970$116_Y
      (bvxor
        $xor$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_970$115$_Y
        qy_o_mux))) ; (bitvector 48)
  (let
    (($procmux$359$_Y
      (if
        (bitvector->bool n559)
        $xor$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_970$116_Y
        $auto$wreduce.cc_514_run$629))) ; (bitvector 48)
  (let ((n644 (extract 3 3 qalumode_o_mux))) ; (bitvector 1)
  (let ((smux (if (bitvector->bool n644) $procmux$362$_Y $procmux$359$_Y))) ; (bitvector 48)
  (let ((n646 (extract 11 0 smux))) ; (bitvector 12)
  (let ((n647 (zero-extend n646 (bitvector 13)))) ; (bitvector 13)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_982$127$_Y
      (bvadd n638 n647))) ; (bitvector 13)
  (let
    ((n649
      (extract
        12
        12
        $add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_982$127$_Y))) ; (bitvector 1)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_983$128$_Y
      (bvadd n563 n649))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_984$130$_Y
      (bvnot
        $add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_983$128$_Y))) ; (bitvector 1)
  (let ((n652 (extract 1 1 qalumode_o_mux))) ; (bitvector 1)
  (let
    (($and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1005$162$_Y
      (bvand n559 n652))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_984$131$_Y
      (if
        (bitvector->bool
          $and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1005$162$_Y)
        $not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_984$130$_Y
        $add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_983$128$_Y))) ; (bitvector 1)
  (let ((n655 (extract 23 23 comux))) ; (bitvector 1)
  (let ((n656 (extract 11 11 comux))) ; (bitvector 1)
  (let ((n658 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1001$158$_Y
      (bool->bitvector (bveq USE_SIMD n658)))) ; (bitvector 1)
  (let
    ((co11_lsb
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1001$158$_Y)
        (bv #b0 1)
        n656))) ; (bitvector 1)
  (let ((n661 (extract 22 12 comux))) ; (bitvector 11)
  (let ((n662 (concat n661 co11_lsb))) ; (bitvector 12)
  (let ((n663 (zero-extend n662 (bitvector 13)))) ; (bitvector 13)
  (let ((n664 (extract 23 12 smux))) ; (bitvector 12)
  (let ((n665 (zero-extend n664 (bitvector 13)))) ; (bitvector 13)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_988$136$_Y
      (bvadd n663 n665))) ; (bitvector 13)
  (let
    ((C1
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1001$158$_Y)
        (bv #b0 1)
        n649))) ; (bitvector 1)
  (let ((n668 (zero-extend C1 (bitvector 13)))) ; (bitvector 13)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_988$137$_Y
      (bvadd
        $add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_988$136$_Y
        n668))) ; (bitvector 13)
  (let
    ((n670
      (extract
        12
        12
        $add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_988$137$_Y))) ; (bitvector 1)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_989$138$_Y
      (bvadd n655 n670))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_990$140$_Y
      (bvnot
        $add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_989$138$_Y))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_990$141$_Y
      (if
        (bitvector->bool
          $and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1005$162$_Y)
        $not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_990$140$_Y
        $add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_989$138$_Y))) ; (bitvector 1)
  (let
    ((n674
      (concat
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_990$141$_Y
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_984$131$_Y))) ; (bitvector 2)
  (let ((n675 (extract 35 35 comux))) ; (bitvector 1)
  (let ((n676 (extract 23 23 comux))) ; (bitvector 1)
  (let ((n678 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1023$182$_Y
      (bool->bitvector (bveq USE_SIMD n678)))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1023$184$_Y
      (bvor
        $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1023$182$_Y
        $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1001$158$_Y))) ; (bitvector 1)
  (let
    ((co23_lsb
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1023$184$_Y)
        (bv #b0 1)
        n676))) ; (bitvector 1)
  (let ((n682 (extract 34 24 comux))) ; (bitvector 11)
  (let ((n683 (concat n682 co23_lsb))) ; (bitvector 12)
  (let ((n684 (zero-extend n683 (bitvector 13)))) ; (bitvector 13)
  (let ((n685 (extract 35 24 smux))) ; (bitvector 12)
  (let ((n686 (zero-extend n685 (bitvector 13)))) ; (bitvector 13)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_996$150$_Y
      (bvadd n684 n686))) ; (bitvector 13)
  (let
    ((C2
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1023$184$_Y)
        (bv #b0 1)
        n670))) ; (bitvector 1)
  (let ((n689 (zero-extend C2 (bitvector 13)))) ; (bitvector 13)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_996$151$_Y
      (bvadd
        $add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_996$150$_Y
        n689))) ; (bitvector 13)
  (let
    ((n691
      (extract
        12
        12
        $add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_996$151$_Y))) ; (bitvector 1)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_997$152$_Y
      (bvadd n675 n691))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_998$154$_Y
      (bvnot
        $add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_997$152$_Y))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_998$155$_Y
      (if
        (bitvector->bool
          $and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1005$162$_Y)
        $not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_998$154$_Y
        $add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_997$152$_Y))) ; (bitvector 1)
  (let
    ((n695
      (concat
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_998$155$_Y
        n674))) ; (bitvector 3)
  (let
    ((co35_lsb
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1001$158$_Y)
        (bv #b0 1)
        n675))) ; (bitvector 1)
  (let ((n697 (extract 47 36 comux))) ; (bitvector 12)
  (let ((n698 (concat n697 co35_lsb))) ; (bitvector 13)
  (let ((n699 (extract 47 36 smux))) ; (bitvector 12)
  (let ((n700 (zero-extend n699 (bitvector 13)))) ; (bitvector 13)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1002$160_Y
      (bvadd n698 n700))) ; (bitvector 13)
  (let
    ((C3
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1001$158$_Y)
        (bv #b0 1)
        n691))) ; (bitvector 1)
  (let ((n703 (zero-extend C3 (bitvector 13)))) ; (bitvector 13)
  (let
    (($add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1002$161$_Y
      (bvadd
        $add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1002$160_Y
        n703))) ; (bitvector 13)
  (let
    ((n705
      (extract
        12
        12
        $add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1002$161$_Y))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1005$163$_Y
      (bvnot n705))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1005$164$_Y
      (if
        (bitvector->bool
          $and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1005$162$_Y)
        $not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1005$163$_Y
        n705))) ; (bitvector 1)
  (let
    ((carryout_o_hw
      (concat
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1005$164$_Y
        n695))) ; (bitvector 4)
  (let ((n709 (extract 0 0 carryout_o_hw))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1024$191$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1001$158$_Y)
        n709
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n711 (extract 3 0 qopmode_o_mux))) ; (bitvector 4)
  (let ((n712 (zero-extend (bv #b101 3) (bitvector 4)))) ; (bitvector 4)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1021$169$_Y
      (bool->bitvector (bveq n711 n712)))) ; (bitvector 1)
  (let ((n714 (extract 3 2 qalumode_o_mux))) ; (bitvector 2)
  (let
    (($ne$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1021$170_Y
      (apply bvor (bitvector->bits n714)))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1021$171$_Y
      (bvor
        $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1021$169$_Y
        $ne$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1021$170_Y))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1024$192$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1021$171$_Y)
        (bv #b0 1)
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1024$191$_Y))) ; (bitvector 1)
  (let ((n718 (extract 1 1 carryout_o_hw))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1023$185$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1023$184$_Y)
        n718
        (bv #b0 1)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1023$186$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1021$171$_Y)
        (bv #b0 1)
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1023$185$_Y))) ; (bitvector 1)
  (let
    ((n721
      (concat
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1023$186$_Y
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1024$192$_Y))) ; (bitvector 2)
  (let ((n722 (extract 2 2 carryout_o_hw))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1022$177$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1001$158$_Y)
        n722
        (bv #b0 1)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1022$178$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1021$171$_Y)
        (bv #b0 1)
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1022$177$_Y))) ; (bitvector 1)
  (let
    ((n725
      (concat
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1022$178$_Y
        n721))) ; (bitvector 3)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1021$172$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1021$171$_Y)
        (bv #b0 1)
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1005$164$_Y))) ; (bitvector 1)
  (let
    ((carryout_o
      (concat
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1021$172$_Y
        n725))) ; (bitvector 4)
  (let (($procmux$319$_Y (if (bitvector->bool CEP) carryout_o carryout_o_reg))) ; (bitvector 4)
  (let
    (($0_carryout_o_reg_3_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1088$219$_Y)
        (bv #b0000 4)
        $procmux$319$_Y))) ; (bitvector 4)
  (let ((CEB1 (DSP48E1_Inputs-CEB1 inputs))) ; (bitvector 1)
  (let (($procmux$513$_Y (if (bitvector->bool CEB1) b_o_mux qb_o_reg1))) ; (bitvector 18)
  (let
    (($procmux$516$_Y
      (if (bitvector->bool RSTB) (bv #b000000000000000000 18) $procmux$513$_Y))) ; (bitvector 18)
  (let
    (($procmux$518$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_644$37$_Y)
        $procmux$516$_Y
        qb_o_reg1))) ; (bitvector 18)
  (let
    (($0_qb_o_reg1_17_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_632$36$_Y)
        $procmux$516$_Y
        $procmux$518$_Y))) ; (bitvector 18)
  (let ((CEA1 (DSP48E1_Inputs-CEA1 inputs))) ; (bitvector 1)
  (let (($procmux$569$_Y (if (bitvector->bool CEA1) a_o_mux qa_o_reg1))) ; (bitvector 30)
  (let
    (($procmux$572$_Y
      (if
        (bitvector->bool RSTA)
        (bv #b000000000000000000000000000000 30)
        $procmux$569$_Y))) ; (bitvector 30)
  (let
    (($procmux$574$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_583$17$_Y)
        $procmux$572$_Y
        qa_o_reg1))) ; (bitvector 30)
  (let
    (($0_qa_o_reg1_29_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_571$16$_Y)
        $procmux$572$_Y
        $procmux$574$_Y))) ; (bitvector 30)
  (let
    ((n740
      (extract
        11
        0
        $add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_982$127$_Y))) ; (bitvector 12)
  (let
    ((n741
      (extract
        11
        0
        $add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_988$137$_Y))) ; (bitvector 12)
  (let ((n742 (concat n741 n740))) ; (bitvector 24)
  (let
    ((n743
      (extract
        11
        0
        $add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_996$151$_Y))) ; (bitvector 12)
  (let ((n744 (concat n743 n742))) ; (bitvector 36)
  (let
    ((n745
      (extract
        11
        0
        $add$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1002$161$_Y))) ; (bitvector 12)
  (let ((n746 (concat n745 n744))) ; (bitvector 48)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1010$165$_Y
      (bvnot n746))) ; (bitvector 48)
  (let ((n748 (extract 1 1 qalumode_o_mux))) ; (bitvector 1)
  (let
    ((alu_o
      (if
        (bitvector->bool n748)
        $not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1010$165$_Y
        n746))) ; (bitvector 48)
  (let (($procmux$334$_Y (if (bitvector->bool CEP) alu_o qp_o_reg1))) ; (bitvector 48)
  (let
    (($0_qp_o_reg1_47_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1088$219$_Y)
        (bv #b000000000000000000000000000000000000000000000000 48)
        $procmux$334$_Y))) ; (bitvector 48)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$682$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$682 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$684$_Q
      (DSP48E1_State-$auto$clk2fflogic.cc_102_sample_data$684 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$685
      (DSP48E1_State-$auto$clk2fflogic.cc_86_sample_control_edge$686 state))) ; (bitvector 1)
  (let
    ((n755
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_clk_in_sampled$685
        clk_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$687$_Y
      (bool->bitvector (bveq n755 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((qmultsignout_o_reg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$687$_Y)
        $auto$clk2fflogic.cc_102_sample_data$684$_Q
        $auto$clk2fflogic.cc_102_sample_data$682$_Q))) ; (bitvector 1)
  (let ((n758 (extract 42 42 qmult_o_mux))) ; (bitvector 1)
  (let
    (($eqx$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1018$167$_Y
      (bool->bitvector (bveq n431 (bv #b100 3))))) ; (bitvector 1)
  (let
    ((multsignout_o_opmode
      (if
        (bitvector->bool
          $eqx$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1018$167$_Y)
        MULTSIGNIN
        n758))) ; (bitvector 1)
  (let
    (($procmux$329$_Y
      (if (bitvector->bool CEP) multsignout_o_opmode qmultsignout_o_reg))) ; (bitvector 1)
  (let
    (($0_qmultsignout_o_reg_0_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1088$219$_Y)
        (bv #b0 1)
        $procmux$329$_Y))) ; (bitvector 1)
  (let (($procmux$324$_Y (if (bitvector->bool CEP) n705 carrycascout_o_reg))) ; (bitvector 1)
  (let
    (($0_carrycascout_o_reg_0_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1088$219$_Y)
        (bv #b0 1)
        $procmux$324$_Y))) ; (bitvector 1)
  (let ((PATTERN (DSP48E1_Inputs-PATTERN inputs))) ; (bitvector 48)
  (let ((SEL_PATTERN (DSP48E1_Inputs-SEL_PATTERN inputs))) ; (bitvector 5)
  (let ((n767 (zero-extend (bv #b11 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1148$248$_Y
      (bool->bitvector (bveq SEL_PATTERN n767)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1148$249$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1148$248$_Y)
        PATTERN
        qc_o_mux))) ; (bitvector 48)
  (let
    (($xor$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1168$256_Y
      (bvxor
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1148$249$_Y
        alu_o))) ; (bitvector 48)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1168$257$_Y
      (bvnot
        $xor$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1168$256_Y))) ; (bitvector 48)
  (let ((n773 (extract 46 0 qc_o_mux))) ; (bitvector 47)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1158$252$_Y
      (bvnot n773))) ; (bitvector 47)
  (let
    ((n775
      (extract
        45
        0
        $not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1158$252$_Y))) ; (bitvector 46)
  (let ((n776 (concat n775 (bv #b00 2)))) ; (bitvector 48)
  (let ((n777 (concat (bv #b0 1) n776))) ; (bitvector 49)
  (let
    ((n778
      (concat
        $not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1158$252$_Y
        n777))) ; (bitvector 96)
  (let ((n779 (concat qc_o_mux n778))) ; (bitvector 144)
  (let ((MASK (DSP48E1_Inputs-MASK inputs))) ; (bitvector 48)
  (let ((n781 (concat MASK n779))) ; (bitvector 192)
  (let ((n782 (extract 47 0 n781))) ; (bitvector 48)
  (let ((SEL_MASK (DSP48E1_Inputs-SEL_MASK inputs))) ; (bitvector 5)
  (let (($procmux$312_CMP (bool->bitvector (bveq SEL_MASK (bv #b10000 5))))) ; (bitvector 1)
  (let ((n787 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let (($procmux$313_CMP (bool->bitvector (bveq SEL_MASK n787)))) ; (bitvector 1)
  (let ((n789 (concat $procmux$313_CMP $procmux$312_CMP))) ; (bitvector 2)
  (let ((n791 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let (($procmux$314_CMP (bool->bitvector (bveq SEL_MASK n791)))) ; (bitvector 1)
  (let ((n793 (concat $procmux$314_CMP n789))) ; (bitvector 3)
  (let ((n794 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let (($procmux$315_CMP (bool->bitvector (bveq SEL_MASK n794)))) ; (bitvector 1)
  (let ((n796 (concat $procmux$315_CMP n793))) ; (bitvector 4)
  (let ((n797 (extract 0 0 n796))) ; (bitvector 1)
  (let
    ((n798
      (if
        (bitvector->bool n797)
        n782
        (bv #b111111111111111111111111111111111111111111111111 48)))) ; (bitvector 48)
  (let ((n799 (extract 95 48 n781))) ; (bitvector 48)
  (let ((n800 (extract 1 1 n796))) ; (bitvector 1)
  (let ((n801 (if (bitvector->bool n800) n799 n798))) ; (bitvector 48)
  (let ((n802 (extract 143 96 n781))) ; (bitvector 48)
  (let ((n803 (extract 2 2 n796))) ; (bitvector 1)
  (let ((n804 (if (bitvector->bool n803) n802 n801))) ; (bitvector 48)
  (let ((n805 (extract 191 144 n781))) ; (bitvector 48)
  (let ((n806 (extract 3 3 n796))) ; (bitvector 1)
  (let (($procmux$311$_Y (if (bitvector->bool n806) n805 n804))) ; (bitvector 48)
  (let ((USE_PATTERN_DETECT (DSP48E1_Inputs-USE_PATTERN_DETECT inputs))) ; (bitvector 5)
  (let ((n809 (zero-extend (bv #b110 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1152$251$_Y
      (bool->bitvector (bveq USE_PATTERN_DETECT n809)))) ; (bitvector 1)
  (let
    ((the_mask
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1152$251$_Y)
        (bv #b111111111111111111111111111111111111111111111111 48)
        $procmux$311$_Y))) ; (bitvector 48)
  (let
    (($or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1168$258$_Y
      (bvor
        $not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1168$257$_Y
        the_mask))) ; (bitvector 48)
  (let
    ((pdet_o
      (apply
        bvand
        (bitvector->bits
          $or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1168$258$_Y)))) ; (bitvector 1)
  (let (($procmux$305$_Y (if (bitvector->bool CEP) pdet_o pdet_o_reg1))) ; (bitvector 1)
  (let
    (($0_pdet_o_reg1_0_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1088$219$_Y)
        (bv #b0 1)
        $procmux$305$_Y))) ; (bitvector 1)
  (let
    (($or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1169$261$_Y
      (bvor
        $xor$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1168$256_Y
        the_mask))) ; (bitvector 48)
  (let
    ((pdetb_o
      (apply
        bvand
        (bitvector->bits
          $or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1169$261$_Y)))) ; (bitvector 1)
  (let (($procmux$295$_Y (if (bitvector->bool CEP) pdetb_o pdetb_o_reg1))) ; (bitvector 1)
  (let
    (($0_pdetb_o_reg1_0_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1088$219$_Y)
        (bv #b0 1)
        $procmux$295$_Y))) ; (bitvector 1)
  (let
    (($and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1200$281$_Y
      (bvand
        pdetb_o_reg2
        $logic_not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1082$214_Y))) ; (bitvector 1)
  (let
    (($logic_not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1199$274_Y
      (bvnot pdetb_o_reg1))) ; (bitvector 1)
  (let
    (($and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1200$283$_Y
      (bvand
        $and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1200$281$_Y
        $logic_not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1199$274_Y))) ; (bitvector 1)
  (let ((n824 (zero-extend (bv #b1010 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1199$269$_Y
      (bool->bitvector (bveq USE_PATTERN_DETECT n824)))) ; (bitvector 1)
  (let ((PREG (DSP48E1_Inputs-PREG inputs))) ; (bitvector 32)
  (let ((n827 (sign-extend (bv #b01 2) (bitvector 32)))) ; (bitvector 32)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1104$222$_Y
      (bool->bitvector (bveq PREG n827)))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1199$271$_Y
      (bvor
        $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1199$269$_Y
        $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1104$222$_Y))) ; (bitvector 1)
  (let
    ((UNDERFLOW
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1199$271$_Y)
        $and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1200$283$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1115$238$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1104$222$_Y)
        qp_o_reg1
        alu_o))) ; (bitvector 48)
  (let ((n832 (apply bvor (bitvector->bits PREG)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1104$221$_Y
      (bvnot n832))) ; (bitvector 1)
  (let
    ((PCOUT
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1104$221$_Y)
        alu_o
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1115$238$_Y))) ; (bitvector 48)
  (let
    ((PATTERNDETECT
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1104$222$_Y)
        pdet_o_reg1
        pdet_o))) ; (bitvector 1)
  (let
    ((PATTERNBDETECT
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1104$222$_Y)
        pdetb_o_reg1
        pdetb_o))) ; (bitvector 1)
  (let
    (($and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1199$273$_Y
      (bvand
        pdet_o_reg2
        $logic_not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1082$214_Y))) ; (bitvector 1)
  (let
    (($and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1199$275$_Y
      (bvand
        $and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1199$273$_Y
        $logic_not$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1199$274_Y))) ; (bitvector 1)
  (let
    ((OVERFLOW
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1199$271$_Y)
        $and$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1199$275$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1111$233$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1104$222$_Y)
        qmultsignout_o_reg
        multsignout_o_opmode))) ; (bitvector 1)
  (let
    ((MULTSIGNOUT
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1104$221$_Y)
        multsignout_o_opmode
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1111$233$_Y))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1104$223$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1104$222$_Y)
        carryout_o_reg
        carryout_o))) ; (bitvector 4)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1104$224$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1104$221$_Y)
        carryout_o
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1104$223$_Y))) ; (bitvector 4)
  (let
    ((n844
      (extract
        0
        0
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1104$224$_Y))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1138$247$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1001$158$_Y)
        n844
        (bv #b0 1)))) ; (bitvector 1)
  (let
    ((n846
      (extract
        1
        1
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1104$224$_Y))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1137$245$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1023$184$_Y)
        n846
        (bv #b0 1)))) ; (bitvector 1)
  (let
    ((n848
      (concat
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1137$245$_Y
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1138$247$_Y))) ; (bitvector 2)
  (let
    ((n849
      (extract
        2
        2
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1104$224$_Y))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1136$241$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1001$158$_Y)
        n849
        (bv #b0 1)))) ; (bitvector 1)
  (let
    ((n851
      (concat
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1136$241$_Y
        n848))) ; (bitvector 3)
  (let
    ((n852
      (extract
        3
        3
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1104$224$_Y))) ; (bitvector 1)
  (let ((CARRYOUT (concat n852 n851))) ; (bitvector 4)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1107$228$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1104$222$_Y)
        carrycascout_o_reg
        n705))) ; (bitvector 1)
  (let
    ((CARRYCASCOUT
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1104$221$_Y)
        n705
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_1107$228$_Y))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_669$46_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_644$37$_Y)
        qb_o_reg1
        qb_o_mux))) ; (bitvector 18)
  (let ((BCASCREG (DSP48E1_Inputs-BCASCREG inputs))) ; (bitvector 32)
  (let ((n858 (sign-extend (bv #b01 2) (bitvector 32)))) ; (bitvector 32)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_668$44$_Y
      (bool->bitvector (bveq BCASCREG n858)))) ; (bitvector 1)
  (let
    ((BCOUT
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_668$44$_Y)
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_669$46_Y
        qb_o_mux))) ; (bitvector 18)
  (let
    (($ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_608$26_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_583$17$_Y)
        qa_o_reg1
        qa_o_mux))) ; (bitvector 30)
  (let ((ACASCREG (DSP48E1_Inputs-ACASCREG inputs))) ; (bitvector 32)
  (let ((n863 (sign-extend (bv #b01 2) (bitvector 32)))) ; (bitvector 32)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_607$24$_Y
      (bool->bitvector (bveq ACASCREG n863)))) ; (bitvector 1)
  (let
    ((ACOUT
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_607$24$_Y)
        $ternary$_Users_gussmith_lakeroad_lakeroad_private_DSP48E1_DSP48E1_modified_for_racket_import.v_608$26_Y
        qa_o_mux))) ; (bitvector 30)
  (cons
    (DSP48E1_Outputs
      UNDERFLOW ; UNDERFLOW
      PCOUT ; PCOUT
      PATTERNDETECT ; PATTERNDETECT
      PATTERNBDETECT ; PATTERNBDETECT
      PCOUT ; P
      OVERFLOW ; OVERFLOW
      MULTSIGNOUT ; MULTSIGNOUT
      CARRYOUT ; CARRYOUT
      CARRYCASCOUT ; CARRYCASCOUT
      BCOUT ; BCOUT
      ACOUT ; ACOUT
    )
    (DSP48E1_State
      clk_in ; $auto$clk2fflogic.cc:86:sample_control_edge$786
      qd_o_reg1 ; $auto$clk2fflogic.cc:102:sample_data$782
      $0_qd_o_reg1_24_0_ ; $auto$clk2fflogic.cc:102:sample_data$784
      clk_in ; $auto$clk2fflogic.cc:86:sample_control_edge$846
      clk_in ; $auto$clk2fflogic.cc:86:sample_control_edge$776
      qinmode_o_reg ; $auto$clk2fflogic.cc:102:sample_data$842
      $0_qinmode_o_reg_4_0_ ; $auto$clk2fflogic.cc:102:sample_data$844
      qad_o_reg1 ; $auto$clk2fflogic.cc:102:sample_data$772
      $0_qad_o_reg1_24_0_ ; $auto$clk2fflogic.cc:102:sample_data$774
      clk_in ; $auto$clk2fflogic.cc:86:sample_control_edge$726
      clk_in ; $auto$clk2fflogic.cc:86:sample_control_edge$716
      clk_in ; $auto$clk2fflogic.cc:86:sample_control_edge$796
      qcarryin_o_reg0 ; $auto$clk2fflogic.cc:102:sample_data$722
      $0_qcarryin_o_reg0_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$724
      clk_in ; $auto$clk2fflogic.cc:86:sample_control_edge$746
      qcarryin_o_reg7 ; $auto$clk2fflogic.cc:102:sample_data$712
      $0_qcarryin_o_reg7_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$714
      qc_o_reg1 ; $auto$clk2fflogic.cc:102:sample_data$792
      $0_qc_o_reg1_47_0_ ; $auto$clk2fflogic.cc:102:sample_data$794
      clk_in ; $auto$clk2fflogic.cc:86:sample_control_edge$756
      qcarryinsel_o_reg1 ; $auto$clk2fflogic.cc:102:sample_data$742
      $0_qcarryinsel_o_reg1_2_0_ ; $auto$clk2fflogic.cc:102:sample_data$744
      clk_in ; $auto$clk2fflogic.cc:86:sample_control_edge$736
      clk_in ; $auto$clk2fflogic.cc:86:sample_control_edge$766
      qopmode_o_reg1 ; $auto$clk2fflogic.cc:102:sample_data$752
      $0_qopmode_o_reg1_6_0_ ; $auto$clk2fflogic.cc:102:sample_data$754
      clk_in ; $auto$clk2fflogic.cc:86:sample_control_edge$816
      clk_in ; $auto$clk2fflogic.cc:86:sample_control_edge$836
      clk_in ; $auto$clk2fflogic.cc:86:sample_control_edge$666
      clk_in ; $auto$clk2fflogic.cc:86:sample_control_edge$646
      qalumode_o_reg1 ; $auto$clk2fflogic.cc:102:sample_data$732
      $0_qalumode_o_reg1_3_0_ ; $auto$clk2fflogic.cc:102:sample_data$734
      qmult_o_reg ; $auto$clk2fflogic.cc:102:sample_data$762
      $0_qmult_o_reg_42_0_ ; $auto$clk2fflogic.cc:102:sample_data$764
      clk_in ; $auto$clk2fflogic.cc:86:sample_control_edge$706
      clk_in ; $auto$clk2fflogic.cc:86:sample_control_edge$806
      clk_in ; $auto$clk2fflogic.cc:86:sample_control_edge$826
      clk_in ; $auto$clk2fflogic.cc:86:sample_control_edge$676
      clk_in ; $auto$clk2fflogic.cc:86:sample_control_edge$686
      clk_in ; $auto$clk2fflogic.cc:86:sample_control_edge$696
      qb_o_reg2 ; $auto$clk2fflogic.cc:102:sample_data$812
      $0_qb_o_reg2_17_0_ ; $auto$clk2fflogic.cc:102:sample_data$814
      qa_o_reg2 ; $auto$clk2fflogic.cc:102:sample_data$832
      $0_qa_o_reg2_29_0_ ; $auto$clk2fflogic.cc:102:sample_data$834
      pdetb_o_reg2 ; $auto$clk2fflogic.cc:102:sample_data$662
      $0_pdetb_o_reg2_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$664
      pdet_o_reg2 ; $auto$clk2fflogic.cc:102:sample_data$642
      $0_pdet_o_reg2_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$644
      clk_in ; $auto$clk2fflogic.cc:86:sample_control_edge$636
      clk_in ; $auto$clk2fflogic.cc:86:sample_control_edge$656
      carryout_o_reg ; $auto$clk2fflogic.cc:102:sample_data$702
      $0_carryout_o_reg_3_0_ ; $auto$clk2fflogic.cc:102:sample_data$704
      qb_o_reg1 ; $auto$clk2fflogic.cc:102:sample_data$802
      $0_qb_o_reg1_17_0_ ; $auto$clk2fflogic.cc:102:sample_data$804
      qa_o_reg1 ; $auto$clk2fflogic.cc:102:sample_data$822
      $0_qa_o_reg1_29_0_ ; $auto$clk2fflogic.cc:102:sample_data$824
      qp_o_reg1 ; $auto$clk2fflogic.cc:102:sample_data$672
      $0_qp_o_reg1_47_0_ ; $auto$clk2fflogic.cc:102:sample_data$674
      qmultsignout_o_reg ; $auto$clk2fflogic.cc:102:sample_data$682
      $0_qmultsignout_o_reg_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$684
      carrycascout_o_reg ; $auto$clk2fflogic.cc:102:sample_data$692
      $0_carrycascout_o_reg_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$694
      pdet_o_reg1 ; $auto$clk2fflogic.cc:102:sample_data$632
      $0_pdet_o_reg1_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$634
      pdetb_o_reg1 ; $auto$clk2fflogic.cc:102:sample_data$652
      $0_pdetb_o_reg1_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$654
    ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  )))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(define DSP48E1_initial
  (DSP48E1_State
    (bv #b1 1)
    (bv #b0000000000000000000000000 25)
    (bv #b0000000000000000000000000 25)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b00000 5)
    (bv #b00000 5)
    (bv #b0000000000000000000000000 25)
    (bv #b0000000000000000000000000 25)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b000000000000000000000000000000000000000000000000 48)
    (bv #b000000000000000000000000000000000000000000000000 48)
    (bv #b1 1)
    (bv #b000 3)
    (bv #b000 3)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b0000000 7)
    (bv #b0000000 7)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b0000 4)
    (bv #b0000 4)
    (bv #b0000000000000000000000000000000000000000000 43)
    (bv #b0000000000000000000000000000000000000000000 43)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000000000000000 30)
    (bv #b000000000000000000000000000000 30)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b0000 4)
    (bv #b0000 4)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000000000000000 30)
    (bv #b000000000000000000000000000000 30)
    (bv #b000000000000000000000000000000000000000000000000 48)
    (bv #b000000000000000000000000000000000000000000000000 48)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)))
