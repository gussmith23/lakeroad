#lang rosette/safe
(provide (all-defined-out))
(struct
  DSP48E2_Inputs
  (XORSIMD
    USE_WIDEXOR
    USE_SIMD
    USE_PATTERN_DETECT
    USE_MULT
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
    RND
    PREG
    PREADDINSEL
    PCIN
    PATTERN
    OPMODEREG
    OPMODE
    MULTSIGNIN
    MREG
    MASK
    IS_RSTP_INVERTED
    IS_RSTM_INVERTED
    IS_RSTINMODE_INVERTED
    IS_RSTD_INVERTED
    IS_RSTC_INVERTED
    IS_RSTCTRL_INVERTED
    IS_RSTB_INVERTED
    IS_RSTA_INVERTED
    IS_RSTALUMODE_INVERTED
    IS_RSTALLCARRYIN_INVERTED
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
    BMULTSEL
    BCIN
    BCASCREG
    B
    A_INPUT
    AUTORESET_PRIORITY
    AUTORESET_PATDET
    AREG
    AMULTSEL
    ALUMODEREG
    ALUMODE
    ADREG
    ACIN
    ACASCREG
    A)
  #:transparent
  ; XORSIMD (bitvector 5)
  ; USE_WIDEXOR (bitvector 5)
  ; USE_SIMD (bitvector 5)
  ; USE_PATTERN_DETECT (bitvector 5)
  ; USE_MULT (bitvector 5)
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
  ; RND (bitvector 48)
  ; PREG (bitvector 32)
  ; PREADDINSEL (bitvector 5)
  ; PCIN (bitvector 48)
  ; PATTERN (bitvector 48)
  ; OPMODEREG (bitvector 32)
  ; OPMODE (bitvector 9)
  ; MULTSIGNIN (bitvector 1)
  ; MREG (bitvector 32)
  ; MASK (bitvector 48)
  ; IS_RSTP_INVERTED (bitvector 1)
  ; IS_RSTM_INVERTED (bitvector 1)
  ; IS_RSTINMODE_INVERTED (bitvector 1)
  ; IS_RSTD_INVERTED (bitvector 1)
  ; IS_RSTC_INVERTED (bitvector 1)
  ; IS_RSTCTRL_INVERTED (bitvector 1)
  ; IS_RSTB_INVERTED (bitvector 1)
  ; IS_RSTA_INVERTED (bitvector 1)
  ; IS_RSTALUMODE_INVERTED (bitvector 1)
  ; IS_RSTALLCARRYIN_INVERTED (bitvector 1)
  ; IS_OPMODE_INVERTED (bitvector 9)
  ; IS_INMODE_INVERTED (bitvector 5)
  ; IS_CLK_INVERTED (bitvector 1)
  ; IS_CARRYIN_INVERTED (bitvector 1)
  ; IS_ALUMODE_INVERTED (bitvector 4)
  ; INMODEREG (bitvector 32)
  ; INMODE (bitvector 5)
  ; DREG (bitvector 32)
  ; D (bitvector 27)
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
  ; BMULTSEL (bitvector 5)
  ; BCIN (bitvector 18)
  ; BCASCREG (bitvector 32)
  ; B (bitvector 18)
  ; A_INPUT (bitvector 5)
  ; AUTORESET_PRIORITY (bitvector 5)
  ; AUTORESET_PATDET (bitvector 5)
  ; AREG (bitvector 32)
  ; AMULTSEL (bitvector 5)
  ; ALUMODEREG (bitvector 32)
  ; ALUMODE (bitvector 4)
  ; ADREG (bitvector 32)
  ; ACIN (bitvector 30)
  ; ACASCREG (bitvector 32)
  ; A (bitvector 30)
)
(struct
  DSP48E2_Outputs
  (XOROUT
    UNDERFLOW
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
  ; XOROUT (bitvector 8)
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
  DSP48E2_State
  ($auto$clk2fflogic.cc_86_sample_control_edge$702
    $auto$clk2fflogic.cc_102_sample_data$698
    $auto$clk2fflogic.cc_102_sample_data$700
    $auto$clk2fflogic.cc_86_sample_control_edge$712
    $auto$clk2fflogic.cc_102_sample_data$708
    $auto$clk2fflogic.cc_102_sample_data$710
    $auto$clk2fflogic.cc_86_sample_control_edge$692
    $auto$clk2fflogic.cc_102_sample_data$688
    $auto$clk2fflogic.cc_102_sample_data$690
    $auto$clk2fflogic.cc_86_sample_control_edge$912
    $auto$clk2fflogic.cc_86_sample_control_edge$892
    $auto$clk2fflogic.cc_86_sample_control_edge$882
    $auto$clk2fflogic.cc_86_sample_control_edge$812
    $auto$clk2fflogic.cc_102_sample_data$908
    $auto$clk2fflogic.cc_102_sample_data$910
    $auto$clk2fflogic.cc_86_sample_control_edge$822
    $auto$clk2fflogic.cc_102_sample_data$888
    $auto$clk2fflogic.cc_102_sample_data$890
    $auto$clk2fflogic.cc_102_sample_data$878
    $auto$clk2fflogic.cc_102_sample_data$880
    $auto$clk2fflogic.cc_102_sample_data$808
    $auto$clk2fflogic.cc_102_sample_data$810
    $auto$clk2fflogic.cc_86_sample_control_edge$922
    $auto$clk2fflogic.cc_102_sample_data$818
    $auto$clk2fflogic.cc_102_sample_data$820
    $auto$clk2fflogic.cc_102_sample_data$918
    $auto$clk2fflogic.cc_102_sample_data$920
    $auto$clk2fflogic.cc_86_sample_control_edge$832
    $auto$clk2fflogic.cc_102_sample_data$828
    $auto$clk2fflogic.cc_102_sample_data$830
    $auto$clk2fflogic.cc_86_sample_control_edge$902
    $auto$clk2fflogic.cc_86_sample_control_edge$802
    $auto$clk2fflogic.cc_86_sample_control_edge$782
    $auto$clk2fflogic.cc_102_sample_data$898
    $auto$clk2fflogic.cc_102_sample_data$900
    $auto$clk2fflogic.cc_86_sample_control_edge$732
    $auto$clk2fflogic.cc_86_sample_control_edge$842
    $auto$clk2fflogic.cc_86_sample_control_edge$862
    $auto$clk2fflogic.cc_102_sample_data$798
    $auto$clk2fflogic.cc_102_sample_data$800
    $auto$clk2fflogic.cc_102_sample_data$778
    $auto$clk2fflogic.cc_102_sample_data$780
    $auto$clk2fflogic.cc_86_sample_control_edge$762
    $auto$clk2fflogic.cc_86_sample_control_edge$772
    $auto$clk2fflogic.cc_86_sample_control_edge$792
    $auto$clk2fflogic.cc_86_sample_control_edge$752
    $auto$clk2fflogic.cc_86_sample_control_edge$742
    $auto$clk2fflogic.cc_86_sample_control_edge$722
    $auto$clk2fflogic.cc_86_sample_control_edge$852
    $auto$clk2fflogic.cc_86_sample_control_edge$872
    $auto$clk2fflogic.cc_102_sample_data$728
    $auto$clk2fflogic.cc_102_sample_data$730
    $auto$clk2fflogic.cc_102_sample_data$838
    $auto$clk2fflogic.cc_102_sample_data$840
    $auto$clk2fflogic.cc_102_sample_data$858
    $auto$clk2fflogic.cc_102_sample_data$860
    $auto$clk2fflogic.cc_102_sample_data$758
    $auto$clk2fflogic.cc_102_sample_data$760
    $auto$clk2fflogic.cc_102_sample_data$768
    $auto$clk2fflogic.cc_102_sample_data$770
    $auto$clk2fflogic.cc_102_sample_data$788
    $auto$clk2fflogic.cc_102_sample_data$790
    $auto$clk2fflogic.cc_102_sample_data$748
    $auto$clk2fflogic.cc_102_sample_data$750
    $auto$clk2fflogic.cc_102_sample_data$738
    $auto$clk2fflogic.cc_102_sample_data$740
    $auto$clk2fflogic.cc_102_sample_data$718
    $auto$clk2fflogic.cc_102_sample_data$720
    $auto$clk2fflogic.cc_102_sample_data$848
    $auto$clk2fflogic.cc_102_sample_data$850
    $auto$clk2fflogic.cc_102_sample_data$868
    $auto$clk2fflogic.cc_102_sample_data$870)
  #:transparent
  ; $auto$clk2fflogic.cc_86_sample_control_edge$702 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$698 (bitvector 27)
  ; $auto$clk2fflogic.cc_102_sample_data$700 (bitvector 27)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$712 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$708 (bitvector 5)
  ; $auto$clk2fflogic.cc_102_sample_data$710 (bitvector 5)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$692 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$688 (bitvector 27)
  ; $auto$clk2fflogic.cc_102_sample_data$690 (bitvector 27)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$912 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$892 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$882 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$812 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$908 (bitvector 3)
  ; $auto$clk2fflogic.cc_102_sample_data$910 (bitvector 3)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$822 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$888 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$890 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$878 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$880 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$808 (bitvector 45)
  ; $auto$clk2fflogic.cc_102_sample_data$810 (bitvector 45)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$922 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$818 (bitvector 45)
  ; $auto$clk2fflogic.cc_102_sample_data$820 (bitvector 45)
  ; $auto$clk2fflogic.cc_102_sample_data$918 (bitvector 9)
  ; $auto$clk2fflogic.cc_102_sample_data$920 (bitvector 9)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$832 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$828 (bitvector 48)
  ; $auto$clk2fflogic.cc_102_sample_data$830 (bitvector 48)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$902 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$802 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$782 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$898 (bitvector 4)
  ; $auto$clk2fflogic.cc_102_sample_data$900 (bitvector 4)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$732 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$842 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$862 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$798 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$800 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$778 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$780 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$762 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$772 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$792 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$752 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$742 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$722 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$852 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$872 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$728 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$730 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$838 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$840 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$858 (bitvector 30)
  ; $auto$clk2fflogic.cc_102_sample_data$860 (bitvector 30)
  ; $auto$clk2fflogic.cc_102_sample_data$758 (bitvector 8)
  ; $auto$clk2fflogic.cc_102_sample_data$760 (bitvector 8)
  ; $auto$clk2fflogic.cc_102_sample_data$768 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$770 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$788 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$790 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$748 (bitvector 48)
  ; $auto$clk2fflogic.cc_102_sample_data$750 (bitvector 48)
  ; $auto$clk2fflogic.cc_102_sample_data$738 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$740 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$718 (bitvector 4)
  ; $auto$clk2fflogic.cc_102_sample_data$720 (bitvector 4)
  ; $auto$clk2fflogic.cc_102_sample_data$848 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$850 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$868 (bitvector 30)
  ; $auto$clk2fflogic.cc_102_sample_data$870 (bitvector 30)
)
(define
  (DSP48E2_inputs_helper inputs)
  (DSP48E2_Inputs
    (let
      (
        (assoc-result
          (assoc "XORSIMD" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "USE_WIDEXOR" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
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
          (assoc "RND" inputs)))
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
          (assoc "PREADDINSEL" inputs)))
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
          (assoc "IS_RSTP_INVERTED" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "IS_RSTM_INVERTED" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "IS_RSTINMODE_INVERTED" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "IS_RSTD_INVERTED" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "IS_RSTC_INVERTED" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "IS_RSTCTRL_INVERTED" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "IS_RSTB_INVERTED" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "IS_RSTA_INVERTED" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "IS_RSTALUMODE_INVERTED" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "IS_RSTALLCARRYIN_INVERTED" inputs)))
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
          (assoc "BMULTSEL" inputs)))
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
          (assoc "AUTORESET_PRIORITY" inputs)))
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
          (assoc "AMULTSEL" inputs)))
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
  (DSP48E2_outputs_helper outputs)
  (list
    (cons "XOROUT" (DSP48E2_Outputs-XOROUT outputs))
    (cons "UNDERFLOW" (DSP48E2_Outputs-UNDERFLOW outputs))
    (cons "PCOUT" (DSP48E2_Outputs-PCOUT outputs))
    (cons "PATTERNDETECT" (DSP48E2_Outputs-PATTERNDETECT outputs))
    (cons "PATTERNBDETECT" (DSP48E2_Outputs-PATTERNBDETECT outputs))
    (cons "P" (DSP48E2_Outputs-P outputs))
    (cons "OVERFLOW" (DSP48E2_Outputs-OVERFLOW outputs))
    (cons "MULTSIGNOUT" (DSP48E2_Outputs-MULTSIGNOUT outputs))
    (cons "CARRYOUT" (DSP48E2_Outputs-CARRYOUT outputs))
    (cons "CARRYCASCOUT" (DSP48E2_Outputs-CARRYCASCOUT outputs))
    (cons "BCOUT" (DSP48E2_Outputs-BCOUT outputs))
    (cons "ACOUT" (DSP48E2_Outputs-ACOUT outputs))))
(define (DSP48E2 inputs state)
  (let ((CLK (DSP48E2_Inputs-CLK inputs))) ; (bitvector 1)
  (let ((IS_CLK_INVERTED (DSP48E2_Inputs-IS_CLK_INVERTED inputs))) ; (bitvector 1)
  (let ((CLK_in (bvxor CLK IS_CLK_INVERTED))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$698$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$698 state))) ; (bitvector 27)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$700$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$700 state))) ; (bitvector 27)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$701
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$702 state))) ; (bitvector 1)
  (let
    ((n6
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$701
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$703$_Y
      (bool->bitvector (bveq n6 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((D_DATA_reg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$703$_Y)
        $auto$clk2fflogic.cc_102_sample_data$700$_Q
        $auto$clk2fflogic.cc_102_sample_data$698$_Q))) ; (bitvector 27)
  (let ((D (DSP48E2_Inputs-D inputs))) ; (bitvector 27)
  (let ((CED (DSP48E2_Inputs-CED inputs))) ; (bitvector 1)
  (let (($procmux$442$_Y (if (bitvector->bool CED) D D_DATA_reg))) ; (bitvector 27)
  (let ((RSTD (DSP48E2_Inputs-RSTD inputs))) ; (bitvector 1)
  (let ((IS_RSTD_INVERTED (DSP48E2_Inputs-IS_RSTD_INVERTED inputs))) ; (bitvector 1)
  (let ((RSTD_in (bvxor RSTD IS_RSTD_INVERTED))) ; (bitvector 1)
  (let ((DREG (DSP48E2_Inputs-DREG inputs))) ; (bitvector 32)
  (let ((n18 (extract 0 0 DREG))) ; (bitvector 1)
  (let ((AMULTSEL (DSP48E2_Inputs-AMULTSEL inputs))) ; (bitvector 5)
  (let ((n23 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_402$17$_Y
      (bool->bitvector (bveq AMULTSEL n23)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_402$18$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_402$17$_Y)
        (bv #b1 1)
        (bv #b0 1)))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$668
      (concat
        (bv #b0000000000000000000000000000000 31)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_402$18$_Y))) ; (bitvector 32)
  (let ((n28 (extract 0 0 $auto$wreduce.cc_514_run$668))) ; (bitvector 1)
  (let ((n30 (concat (bv #b00000000000 11) AMULTSEL))) ; (bitvector 16)
  (let ((n31 (apply bvor (bitvector->bits n30)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_401$16$_Y
      (bvnot n31))) ; (bitvector 1)
  (let
    ((AMULTSEL_BIN
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_401$16$_Y)
        (bv #b0 1)
        n28))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1159$354$_Y
      (bvnot AMULTSEL_BIN))) ; (bitvector 1)
  (let ((BMULTSEL (DSP48E2_Inputs-BMULTSEL inputs))) ; (bitvector 5)
  (let ((n36 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_427$35$_Y
      (bool->bitvector (bveq BMULTSEL n36)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_427$36$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_427$35$_Y)
        (bv #b1 1)
        (bv #b0 1)))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$673
      (concat
        (bv #b0000000000000000000000000000000 31)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_427$36$_Y))) ; (bitvector 32)
  (let ((n40 (extract 0 0 $auto$wreduce.cc_514_run$673))) ; (bitvector 1)
  (let ((n41 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_426$34$_Y
      (bool->bitvector (bveq BMULTSEL n41)))) ; (bitvector 1)
  (let
    ((BMULTSEL_BIN
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_426$34$_Y)
        (bv #b0 1)
        n40))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1160$355$_Y
      (bvnot BMULTSEL_BIN))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1159$356$_Y
      (bvand
        $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1159$354$_Y
        $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1160$355$_Y))) ; (bitvector 1)
  (let ((USE_MULT (DSP48E2_Inputs-USE_MULT inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_473$60$_Y
      (bool->bitvector (bveq USE_MULT (bv #b10100 5))))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_473$61$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_473$60$_Y)
        (bv #b10 2)
        (bv #b00 2)))) ; (bitvector 2)
  (let
    (($auto$wreduce.cc_514_run$681
      (concat
        (bv #b000000000000000000000000000000 30)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_473$61$_Y))) ; (bitvector 32)
  (let ((n53 (extract 1 0 $auto$wreduce.cc_514_run$681))) ; (bitvector 2)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_472$59$_Y
      (bool->bitvector (bveq USE_MULT (bv #b10010 5))))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_472$62$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_472$59$_Y)
        (bv #b01 2)
        n53))) ; (bitvector 2)
  (let
    (($auto$wreduce.cc_514_run$680
      (concat
        (bv #b000000000000000000000000000000 30)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_472$62$_Y))) ; (bitvector 32)
  (let ((n58 (extract 1 0 $auto$wreduce.cc_514_run$680))) ; (bitvector 2)
  (let ((n60 (zero-extend (bv #b1010 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_471$58$_Y
      (bool->bitvector (bveq USE_MULT n60)))) ; (bitvector 1)
  (let
    ((USE_MULT_BIN
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_471$58$_Y)
        (bv #b00 2)
        n58))) ; (bitvector 2)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1033$266$_Y
      (bool->bitvector (bveq USE_MULT_BIN (bv #b10 2))))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1159$358$_Y
      (bvor
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1159$356$_Y
        $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1033$266$_Y))) ; (bitvector 1)
  (let
    ((DREG_INT
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1159$358$_Y)
        (bv #b0 1)
        n18))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1209$381$_Y
      (bvnot DREG_INT))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1209$382$_Y
      (bvor
        RSTD_in
        $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1209$381$_Y))) ; (bitvector 1)
  (let
    (($0_D_DATA_reg_26_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1209$382$_Y)
        (bv #b000000000000000000000000000 27)
        $procmux$442$_Y))) ; (bitvector 27)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$708$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$708 state))) ; (bitvector 5)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$710$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$710 state))) ; (bitvector 5)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$711
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$712 state))) ; (bitvector 1)
  (let
    ((n72
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$711
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$713$_Y
      (bool->bitvector (bveq n72 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((INMODE_reg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$713$_Y)
        $auto$clk2fflogic.cc_102_sample_data$710$_Q
        $auto$clk2fflogic.cc_102_sample_data$708$_Q))) ; (bitvector 5)
  (let ((INMODE (DSP48E2_Inputs-INMODE inputs))) ; (bitvector 5)
  (let ((IS_INMODE_INVERTED (DSP48E2_Inputs-IS_INMODE_INVERTED inputs))) ; (bitvector 5)
  (let ((INMODE_in (bvxor INMODE IS_INMODE_INVERTED))) ; (bitvector 5)
  (let ((CEINMODE (DSP48E2_Inputs-CEINMODE inputs))) ; (bitvector 1)
  (let (($procmux$447$_Y (if (bitvector->bool CEINMODE) INMODE_in INMODE_reg))) ; (bitvector 5)
  (let ((RSTINMODE (DSP48E2_Inputs-RSTINMODE inputs))) ; (bitvector 1)
  (let ((IS_RSTINMODE_INVERTED (DSP48E2_Inputs-IS_RSTINMODE_INVERTED inputs))) ; (bitvector 1)
  (let ((RSTINMODE_in (bvxor RSTINMODE IS_RSTINMODE_INVERTED))) ; (bitvector 1)
  (let ((INMODEREG (DSP48E2_Inputs-INMODEREG inputs))) ; (bitvector 32)
  (let ((n85 (extract 0 0 INMODEREG))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1195$376$_Y
      (bvnot n85))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1195$377$_Y
      (bvor
        RSTINMODE_in
        $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1195$376$_Y))) ; (bitvector 1)
  (let
    (($0_INMODE_reg_4_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1195$377$_Y)
        (bv #b00000 5)
        $procmux$447$_Y))) ; (bitvector 5)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$688$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$688 state))) ; (bitvector 27)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$690$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$690 state))) ; (bitvector 27)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$691
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$692 state))) ; (bitvector 1)
  (let
    ((n92
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$691
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$693$_Y
      (bool->bitvector (bveq n92 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((AD_DATA_reg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$693$_Y)
        $auto$clk2fflogic.cc_102_sample_data$690$_Q
        $auto$clk2fflogic.cc_102_sample_data$688$_Q))) ; (bitvector 27)
  (let ((D_DATA (if (bitvector->bool DREG_INT) D_DATA_reg D))) ; (bitvector 27)
  (let ((INMODE_mux (if (bitvector->bool n85) INMODE_reg INMODE_in))) ; (bitvector 5)
  (let ((n97 (extract 2 2 INMODE_mux))) ; (bitvector 1)
  (let
    ((D_DATA_mux
      (if (bitvector->bool n97) D_DATA (bv #b000000000000000000000000000 27)))) ; (bitvector 27)
  (let ((A (DSP48E2_Inputs-A inputs))) ; (bitvector 30)
  (let ((ACIN (DSP48E2_Inputs-ACIN inputs))) ; (bitvector 30)
  (let ((A_INPUT (DSP48E2_Inputs-A_INPUT inputs))) ; (bitvector 5)
  (let ((n103 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_420$31$_Y
      (bool->bitvector (bveq A_INPUT n103)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_420$32$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_420$31$_Y)
        (bv #b1 1)
        (bv #b0 1)))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$672
      (concat
        (bv #b0000000000000000000000000000000 31)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_420$32$_Y))) ; (bitvector 32)
  (let ((n107 (extract 0 0 $auto$wreduce.cc_514_run$672))) ; (bitvector 1)
  (let ((n109 (zero-extend (bv #b111 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_419$30$_Y
      (bool->bitvector (bveq A_INPUT n109)))) ; (bitvector 1)
  (let
    ((A_INPUT_BIN
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_419$30$_Y)
        (bv #b0 1)
        n107))) ; (bitvector 1)
  (let (($procmux$565$_Y (if (bitvector->bool A_INPUT_BIN) ACIN A))) ; (bitvector 30)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$858$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$858 state))) ; (bitvector 30)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$860$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$860 state))) ; (bitvector 30)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$861
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$862 state))) ; (bitvector 1)
  (let
    ((n116
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$861
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$863$_Y
      (bool->bitvector (bveq n116 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((A2_reg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$863$_Y)
        $auto$clk2fflogic.cc_102_sample_data$860$_Q
        $auto$clk2fflogic.cc_102_sample_data$858$_Q))) ; (bitvector 30)
  (let ((AREG (DSP48E2_Inputs-AREG inputs))) ; (bitvector 32)
  (let ((n120 (extract 1 0 AREG))) ; (bitvector 2)
  (let
    (($ne$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_967$230$_Y
      (apply bvor (bitvector->bits n120)))) ; (bitvector 1)
  (let
    ((A_ALU
      (if
        (bitvector->bool
          $ne$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_967$230$_Y)
        A2_reg
        $procmux$565$_Y))) ; (bitvector 30)
  (let ((n123 (extract 26 0 A_ALU))) ; (bitvector 27)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$868$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$868 state))) ; (bitvector 30)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$870$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$870 state))) ; (bitvector 30)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$871
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$872 state))) ; (bitvector 1)
  (let
    ((n127
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$871
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$873$_Y
      (bool->bitvector (bveq n127 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((A1_reg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$873$_Y)
        $auto$clk2fflogic.cc_102_sample_data$870$_Q
        $auto$clk2fflogic.cc_102_sample_data$868$_Q))) ; (bitvector 30)
  (let ((n130 (extract 26 0 A1_reg))) ; (bitvector 27)
  (let ((n131 (extract 0 0 INMODE_mux))) ; (bitvector 1)
  (let (($procmux$462$_Y (if (bitvector->bool n131) n130 n123))) ; (bitvector 27)
  (let ((PREADDINSEL (DSP48E2_Inputs-PREADDINSEL inputs))) ; (bitvector 5)
  (let ((n134 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_453$43$_Y
      (bool->bitvector (bveq PREADDINSEL n134)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_453$44$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_453$43$_Y)
        (bv #b1 1)
        (bv #b0 1)))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$675
      (concat
        (bv #b0000000000000000000000000000000 31)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_453$44$_Y))) ; (bitvector 32)
  (let ((n138 (extract 0 0 $auto$wreduce.cc_514_run$675))) ; (bitvector 1)
  (let ((n140 (concat (bv #b000 3) PREADDINSEL))) ; (bitvector 8)
  (let ((n141 (apply bvor (bitvector->bits n140)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_452$42$_Y
      (bvnot n141))) ; (bitvector 1)
  (let
    ((PREADDINSEL_BIN
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_452$42$_Y)
        (bv #b0 1)
        n138))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1178$366$_Y
      (bvnot PREADDINSEL_BIN))) ; (bitvector 1)
  (let ((n145 (extract 1 1 INMODE_mux))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1178$367$_Y
      (bvand
        $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1178$366$_Y
        n145))) ; (bitvector 1)
  (let
    (($procmux$468$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1178$367$_Y)
        (bv #b000000000000000000000000000 27)
        $procmux$462$_Y))) ; (bitvector 27)
  (let ((B (DSP48E2_Inputs-B inputs))) ; (bitvector 18)
  (let ((BCIN (DSP48E2_Inputs-BCIN inputs))) ; (bitvector 18)
  (let ((B_INPUT (DSP48E2_Inputs-B_INPUT inputs))) ; (bitvector 5)
  (let ((n151 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_434$39$_Y
      (bool->bitvector (bveq B_INPUT n151)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_434$40$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_434$39$_Y)
        (bv #b1 1)
        (bv #b0 1)))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$674
      (concat
        (bv #b0000000000000000000000000000000 31)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_434$40$_Y))) ; (bitvector 32)
  (let ((n155 (extract 0 0 $auto$wreduce.cc_514_run$674))) ; (bitvector 1)
  (let ((n156 (zero-extend (bv #b111 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_433$38$_Y
      (bool->bitvector (bveq B_INPUT n156)))) ; (bitvector 1)
  (let
    ((B_INPUT_BIN
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_433$38$_Y)
        (bv #b0 1)
        n155))) ; (bitvector 1)
  (let (($procmux$546$_Y (if (bitvector->bool B_INPUT_BIN) BCIN B))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$838$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$838 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$840$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$840 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$841
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$842 state))) ; (bitvector 1)
  (let
    ((n163
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$841
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$843$_Y
      (bool->bitvector (bveq n163 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((B2_reg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$843$_Y)
        $auto$clk2fflogic.cc_102_sample_data$840$_Q
        $auto$clk2fflogic.cc_102_sample_data$838$_Q))) ; (bitvector 18)
  (let ((BREG (DSP48E2_Inputs-BREG inputs))) ; (bitvector 32)
  (let ((n167 (extract 1 0 BREG))) ; (bitvector 2)
  (let
    (($ne$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_994$243$_Y
      (apply bvor (bitvector->bits n167)))) ; (bitvector 1)
  (let
    ((B2_DATA
      (if
        (bitvector->bool
          $ne$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_994$243$_Y)
        B2_reg
        $procmux$546$_Y))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$848$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$848 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$850$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$850 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$851
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$852 state))) ; (bitvector 1)
  (let
    ((n173
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$851
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$853$_Y
      (bool->bitvector (bveq n173 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((B1_DATA_out
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$853$_Y)
        $auto$clk2fflogic.cc_102_sample_data$850$_Q
        $auto$clk2fflogic.cc_102_sample_data$848$_Q))) ; (bitvector 18)
  (let ((n176 (extract 4 4 INMODE_mux))) ; (bitvector 1)
  (let (($procmux$453$_Y (if (bitvector->bool n176) B1_DATA_out B2_DATA))) ; (bitvector 18)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1183$371$_Y
      (bvand PREADDINSEL_BIN n145))) ; (bitvector 1)
  (let
    (($procmux$459$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1183$371$_Y)
        (bv #b000000000000000000 18)
        $procmux$453$_Y))) ; (bitvector 18)
  (let ((n181 (extract 17 17 $procmux$459$_Y))) ; (bitvector 1)
  (let ((n182 (concat n181 $procmux$459$_Y))) ; (bitvector 19)
  (let ((n183 (concat n181 n182))) ; (bitvector 20)
  (let ((n184 (concat n181 n183))) ; (bitvector 21)
  (let ((n185 (concat n181 n184))) ; (bitvector 22)
  (let ((n186 (concat n181 n185))) ; (bitvector 23)
  (let ((n187 (concat n181 n186))) ; (bitvector 24)
  (let ((n188 (concat n181 n187))) ; (bitvector 25)
  (let ((n189 (concat n181 n188))) ; (bitvector 26)
  (let ((n190 (concat n181 n189))) ; (bitvector 27)
  (let
    ((PREADD_AB (if (bitvector->bool PREADDINSEL_BIN) n190 $procmux$468$_Y))) ; (bitvector 27)
  (let
    (($add$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1155$351$_Y
      (bvadd D_DATA_mux PREADD_AB))) ; (bitvector 27)
  (let
    (($sub$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1155$350$_Y
      (bvsub D_DATA_mux PREADD_AB))) ; (bitvector 27)
  (let ((n194 (extract 3 3 INMODE_mux))) ; (bitvector 1)
  (let
    ((AD_in
      (if
        (bitvector->bool n194)
        $sub$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1155$350$_Y
        $add$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1155$351$_Y))) ; (bitvector 27)
  (let ((CEAD (DSP48E2_Inputs-CEAD inputs))) ; (bitvector 1)
  (let (($procmux$437$_Y (if (bitvector->bool CEAD) AD_in AD_DATA_reg))) ; (bitvector 27)
  (let
    (($0_AD_DATA_reg_26_0_
      (if
        (bitvector->bool RSTD_in)
        (bv #b000000000000000000000000000 27)
        $procmux$437$_Y))) ; (bitvector 27)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$908$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$908 state))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$910$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$910 state))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$911
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$912 state))) ; (bitvector 1)
  (let
    ((n202
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$911
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$913$_Y
      (bool->bitvector (bveq n202 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((CARRYINSEL_reg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$913$_Y)
        $auto$clk2fflogic.cc_102_sample_data$910$_Q
        $auto$clk2fflogic.cc_102_sample_data$908$_Q))) ; (bitvector 3)
  (let ((CARRYINSEL (DSP48E2_Inputs-CARRYINSEL inputs))) ; (bitvector 3)
  (let ((CECTRL (DSP48E2_Inputs-CECTRL inputs))) ; (bitvector 1)
  (let
    (($procmux$605$_Y (if (bitvector->bool CECTRL) CARRYINSEL CARRYINSEL_reg))) ; (bitvector 3)
  (let ((RSTCTRL (DSP48E2_Inputs-RSTCTRL inputs))) ; (bitvector 1)
  (let ((IS_RSTCTRL_INVERTED (DSP48E2_Inputs-IS_RSTCTRL_INVERTED inputs))) ; (bitvector 1)
  (let ((RSTCTRL_in (bvxor RSTCTRL IS_RSTCTRL_INVERTED))) ; (bitvector 1)
  (let
    (($0_CARRYINSEL_reg_2_0_
      (if (bitvector->bool RSTCTRL_in) (bv #b000 3) $procmux$605$_Y))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$888$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$888 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$890$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$890 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$891
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$892 state))) ; (bitvector 1)
  (let
    ((n215
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$891
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$893$_Y
      (bool->bitvector (bveq n215 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((CARRYIN_reg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$893$_Y)
        $auto$clk2fflogic.cc_102_sample_data$890$_Q
        $auto$clk2fflogic.cc_102_sample_data$888$_Q))) ; (bitvector 1)
  (let ((CARRYIN (DSP48E2_Inputs-CARRYIN inputs))) ; (bitvector 1)
  (let ((IS_CARRYIN_INVERTED (DSP48E2_Inputs-IS_CARRYIN_INVERTED inputs))) ; (bitvector 1)
  (let ((CARRYIN_in (bvxor CARRYIN IS_CARRYIN_INVERTED))) ; (bitvector 1)
  (let ((CECARRYIN (DSP48E2_Inputs-CECARRYIN inputs))) ; (bitvector 1)
  (let
    (($procmux$592$_Y (if (bitvector->bool CECARRYIN) CARRYIN_in CARRYIN_reg))) ; (bitvector 1)
  (let ((RSTALLCARRYIN (DSP48E2_Inputs-RSTALLCARRYIN inputs))) ; (bitvector 1)
  (let
    ((IS_RSTALLCARRYIN_INVERTED
      (DSP48E2_Inputs-IS_RSTALLCARRYIN_INVERTED inputs))) ; (bitvector 1)
  (let ((rst_carryin_g (bvxor RSTALLCARRYIN IS_RSTALLCARRYIN_INVERTED))) ; (bitvector 1)
  (let
    (($0_CARRYIN_reg_0_0_
      (if (bitvector->bool rst_carryin_g) (bv #b0 1) $procmux$592$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$878$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$878 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$880$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$880 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$881
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$882 state))) ; (bitvector 1)
  (let
    ((n230
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$881
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$883$_Y
      (bool->bitvector (bveq n230 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((qmultcarryin
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$883$_Y)
        $auto$clk2fflogic.cc_102_sample_data$880$_Q
        $auto$clk2fflogic.cc_102_sample_data$878$_Q))) ; (bitvector 1)
  (let ((ADREG (DSP48E2_Inputs-ADREG inputs))) ; (bitvector 32)
  (let ((n234 (extract 0 0 ADREG))) ; (bitvector 1)
  (let
    (($procmux$471$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1159$358$_Y)
        (bv #b0 1)
        n234))) ; (bitvector 1)
  (let ((AD_DATA (if (bitvector->bool $procmux$471$_Y) AD_DATA_reg AD_in))) ; (bitvector 27)
  (let
    ((a_mult_mux (if (bitvector->bool AMULTSEL_BIN) AD_DATA $procmux$468$_Y))) ; (bitvector 27)
  (let ((n238 (extract 26 26 a_mult_mux))) ; (bitvector 1)
  (let ((n239 (extract 17 0 AD_DATA))) ; (bitvector 18)
  (let ((b_mult_mux (if (bitvector->bool BMULTSEL_BIN) n239 $procmux$459$_Y))) ; (bitvector 18)
  (let ((n241 (extract 17 17 b_mult_mux))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_902$203_Y
      (bvxor n238 n241))) ; (bitvector 1)
  (let
    (($logic_not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_902$204$_Y
      (bvnot
        $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_902$203_Y))) ; (bitvector 1)
  (let ((CEM (DSP48E2_Inputs-CEM inputs))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_905$205$_Y
      (if
        (bitvector->bool CEM)
        $logic_not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_902$204$_Y
        qmultcarryin))) ; (bitvector 1)
  (let
    ((dr_carryin_int
      (if
        (bitvector->bool rst_carryin_g)
        (bv #b0 1)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_905$205$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$808$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$808 state))) ; (bitvector 45)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$810$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$810 state))) ; (bitvector 45)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$811
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$812 state))) ; (bitvector 1)
  (let
    ((n250
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$811
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$813$_Y
      (bool->bitvector (bveq n250 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((U_DATA_reg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$813$_Y)
        $auto$clk2fflogic.cc_102_sample_data$810$_Q
        $auto$clk2fflogic.cc_102_sample_data$808$_Q))) ; (bitvector 45)
  (let ((n253 (sign-extend a_mult_mux (bitvector 45)))) ; (bitvector 45)
  (let ((n254 (sign-extend b_mult_mux (bitvector 45)))) ; (bitvector 45)
  (let
    (($mul$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1034$267$_Y
      (bvmul n253 n254))) ; (bitvector 45)
  (let
    ((mult
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1033$266$_Y)
        (bv #b000000000000000000000000000000000000000000000 45)
        $mul$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1034$267$_Y))) ; (bitvector 45)
  (let ((n258 (extract 0 0 mult))) ; (bitvector 1)
  (let ((n259 (concat (bv #b0 1) n258))) ; (bitvector 2)
  (let ((n260 (extract 2 2 mult))) ; (bitvector 1)
  (let ((n261 (concat n260 n259))) ; (bitvector 3)
  (let ((n262 (concat (bv #b0 1) n261))) ; (bitvector 4)
  (let ((n263 (extract 4 4 mult))) ; (bitvector 1)
  (let ((n264 (concat n263 n262))) ; (bitvector 5)
  (let ((n265 (concat (bv #b0 1) n264))) ; (bitvector 6)
  (let ((n266 (extract 6 6 mult))) ; (bitvector 1)
  (let ((n267 (concat n266 n265))) ; (bitvector 7)
  (let ((n268 (concat (bv #b0 1) n267))) ; (bitvector 8)
  (let ((n269 (extract 8 8 mult))) ; (bitvector 1)
  (let ((n270 (concat n269 n268))) ; (bitvector 9)
  (let ((n271 (concat (bv #b0 1) n270))) ; (bitvector 10)
  (let ((n272 (extract 10 10 mult))) ; (bitvector 1)
  (let ((n273 (concat n272 n271))) ; (bitvector 11)
  (let ((n274 (concat (bv #b0 1) n273))) ; (bitvector 12)
  (let ((n275 (extract 12 12 mult))) ; (bitvector 1)
  (let ((n276 (concat n275 n274))) ; (bitvector 13)
  (let ((n277 (concat (bv #b0 1) n276))) ; (bitvector 14)
  (let ((n278 (extract 14 14 mult))) ; (bitvector 1)
  (let ((n279 (concat n278 n277))) ; (bitvector 15)
  (let ((n280 (concat (bv #b0 1) n279))) ; (bitvector 16)
  (let ((n281 (extract 16 16 mult))) ; (bitvector 1)
  (let ((n282 (concat n281 n280))) ; (bitvector 17)
  (let ((n283 (concat (bv #b0 1) n282))) ; (bitvector 18)
  (let ((n284 (extract 18 18 mult))) ; (bitvector 1)
  (let ((n285 (concat n284 n283))) ; (bitvector 19)
  (let ((n286 (concat (bv #b0 1) n285))) ; (bitvector 20)
  (let ((n287 (extract 20 20 mult))) ; (bitvector 1)
  (let ((n288 (concat n287 n286))) ; (bitvector 21)
  (let ((n289 (concat (bv #b0 1) n288))) ; (bitvector 22)
  (let ((n290 (extract 22 22 mult))) ; (bitvector 1)
  (let ((n291 (concat n290 n289))) ; (bitvector 23)
  (let ((n292 (concat (bv #b0 1) n291))) ; (bitvector 24)
  (let ((n293 (extract 24 24 mult))) ; (bitvector 1)
  (let ((n294 (concat n293 n292))) ; (bitvector 25)
  (let ((n295 (concat (bv #b0 1) n294))) ; (bitvector 26)
  (let ((n296 (extract 26 26 mult))) ; (bitvector 1)
  (let ((n297 (concat n296 n295))) ; (bitvector 27)
  (let ((n298 (concat (bv #b0 1) n297))) ; (bitvector 28)
  (let ((n299 (extract 28 28 mult))) ; (bitvector 1)
  (let ((n300 (concat n299 n298))) ; (bitvector 29)
  (let ((n301 (concat (bv #b0 1) n300))) ; (bitvector 30)
  (let ((n302 (extract 30 30 mult))) ; (bitvector 1)
  (let ((n303 (concat n302 n301))) ; (bitvector 31)
  (let ((n304 (concat (bv #b0 1) n303))) ; (bitvector 32)
  (let ((n305 (extract 32 32 mult))) ; (bitvector 1)
  (let ((n306 (concat n305 n304))) ; (bitvector 33)
  (let ((n307 (concat (bv #b0 1) n306))) ; (bitvector 34)
  (let ((n308 (extract 34 34 mult))) ; (bitvector 1)
  (let ((n309 (concat n308 n307))) ; (bitvector 35)
  (let ((n310 (concat (bv #b0 1) n309))) ; (bitvector 36)
  (let ((n311 (extract 36 36 mult))) ; (bitvector 1)
  (let ((n312 (concat n311 n310))) ; (bitvector 37)
  (let ((n313 (concat (bv #b0 1) n312))) ; (bitvector 38)
  (let ((n314 (extract 38 38 mult))) ; (bitvector 1)
  (let ((n315 (concat n314 n313))) ; (bitvector 39)
  (let ((n316 (concat (bv #b0 1) n315))) ; (bitvector 40)
  (let ((n317 (extract 40 40 mult))) ; (bitvector 1)
  (let ((n318 (concat n317 n316))) ; (bitvector 41)
  (let ((n319 (concat (bv #b0 1) n318))) ; (bitvector 42)
  (let ((n320 (extract 42 42 mult))) ; (bitvector 1)
  (let ((n321 (concat n320 n319))) ; (bitvector 43)
  (let ((n322 (concat (bv #b10 2) n321))) ; (bitvector 45)
  (let (($procmux$526$_Y (if (bitvector->bool CEM) n322 U_DATA_reg))) ; (bitvector 45)
  (let ((RSTM (DSP48E2_Inputs-RSTM inputs))) ; (bitvector 1)
  (let ((IS_RSTM_INVERTED (DSP48E2_Inputs-IS_RSTM_INVERTED inputs))) ; (bitvector 1)
  (let ((RSTM_in (bvxor RSTM IS_RSTM_INVERTED))) ; (bitvector 1)
  (let ((MREG (DSP48E2_Inputs-MREG inputs))) ; (bitvector 32)
  (let ((n328 (extract 0 0 MREG))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1043$269$_Y
      (bvnot n328))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1043$270$_Y
      (bvor
        RSTM_in
        $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1043$269$_Y))) ; (bitvector 1)
  (let
    (($0_U_DATA_reg_44_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1043$270$_Y)
        (bv #b000000000000000000000000000000000000000000000 45)
        $procmux$526$_Y))) ; (bitvector 45)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$818$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$818 state))) ; (bitvector 45)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$820$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$820 state))) ; (bitvector 45)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$821
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$822 state))) ; (bitvector 1)
  (let
    ((n335
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$821
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$823$_Y
      (bool->bitvector (bveq n335 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((V_DATA_reg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$823$_Y)
        $auto$clk2fflogic.cc_102_sample_data$820$_Q
        $auto$clk2fflogic.cc_102_sample_data$818$_Q))) ; (bitvector 45)
  (let ((n338 (extract 1 1 mult))) ; (bitvector 1)
  (let ((n339 (concat n338 (bv #b0 1)))) ; (bitvector 2)
  (let ((n340 (concat (bv #b0 1) n339))) ; (bitvector 3)
  (let ((n341 (extract 3 3 mult))) ; (bitvector 1)
  (let ((n342 (concat n341 n340))) ; (bitvector 4)
  (let ((n343 (concat (bv #b0 1) n342))) ; (bitvector 5)
  (let ((n344 (extract 5 5 mult))) ; (bitvector 1)
  (let ((n345 (concat n344 n343))) ; (bitvector 6)
  (let ((n346 (concat (bv #b0 1) n345))) ; (bitvector 7)
  (let ((n347 (extract 7 7 mult))) ; (bitvector 1)
  (let ((n348 (concat n347 n346))) ; (bitvector 8)
  (let ((n349 (concat (bv #b0 1) n348))) ; (bitvector 9)
  (let ((n350 (extract 9 9 mult))) ; (bitvector 1)
  (let ((n351 (concat n350 n349))) ; (bitvector 10)
  (let ((n352 (concat (bv #b0 1) n351))) ; (bitvector 11)
  (let ((n353 (extract 11 11 mult))) ; (bitvector 1)
  (let ((n354 (concat n353 n352))) ; (bitvector 12)
  (let ((n355 (concat (bv #b0 1) n354))) ; (bitvector 13)
  (let ((n356 (extract 13 13 mult))) ; (bitvector 1)
  (let ((n357 (concat n356 n355))) ; (bitvector 14)
  (let ((n358 (concat (bv #b0 1) n357))) ; (bitvector 15)
  (let ((n359 (extract 15 15 mult))) ; (bitvector 1)
  (let ((n360 (concat n359 n358))) ; (bitvector 16)
  (let ((n361 (concat (bv #b0 1) n360))) ; (bitvector 17)
  (let ((n362 (extract 17 17 mult))) ; (bitvector 1)
  (let ((n363 (concat n362 n361))) ; (bitvector 18)
  (let ((n364 (concat (bv #b0 1) n363))) ; (bitvector 19)
  (let ((n365 (extract 19 19 mult))) ; (bitvector 1)
  (let ((n366 (concat n365 n364))) ; (bitvector 20)
  (let ((n367 (concat (bv #b0 1) n366))) ; (bitvector 21)
  (let ((n368 (extract 21 21 mult))) ; (bitvector 1)
  (let ((n369 (concat n368 n367))) ; (bitvector 22)
  (let ((n370 (concat (bv #b0 1) n369))) ; (bitvector 23)
  (let ((n371 (extract 23 23 mult))) ; (bitvector 1)
  (let ((n372 (concat n371 n370))) ; (bitvector 24)
  (let ((n373 (concat (bv #b0 1) n372))) ; (bitvector 25)
  (let ((n374 (extract 25 25 mult))) ; (bitvector 1)
  (let ((n375 (concat n374 n373))) ; (bitvector 26)
  (let ((n376 (concat (bv #b0 1) n375))) ; (bitvector 27)
  (let ((n377 (extract 27 27 mult))) ; (bitvector 1)
  (let ((n378 (concat n377 n376))) ; (bitvector 28)
  (let ((n379 (concat (bv #b0 1) n378))) ; (bitvector 29)
  (let ((n380 (extract 29 29 mult))) ; (bitvector 1)
  (let ((n381 (concat n380 n379))) ; (bitvector 30)
  (let ((n382 (concat (bv #b0 1) n381))) ; (bitvector 31)
  (let ((n383 (extract 31 31 mult))) ; (bitvector 1)
  (let ((n384 (concat n383 n382))) ; (bitvector 32)
  (let ((n385 (concat (bv #b0 1) n384))) ; (bitvector 33)
  (let ((n386 (extract 33 33 mult))) ; (bitvector 1)
  (let ((n387 (concat n386 n385))) ; (bitvector 34)
  (let ((n388 (concat (bv #b0 1) n387))) ; (bitvector 35)
  (let ((n389 (extract 35 35 mult))) ; (bitvector 1)
  (let ((n390 (concat n389 n388))) ; (bitvector 36)
  (let ((n391 (concat (bv #b0 1) n390))) ; (bitvector 37)
  (let ((n392 (extract 37 37 mult))) ; (bitvector 1)
  (let ((n393 (concat n392 n391))) ; (bitvector 38)
  (let ((n394 (concat (bv #b0 1) n393))) ; (bitvector 39)
  (let ((n395 (extract 39 39 mult))) ; (bitvector 1)
  (let ((n396 (concat n395 n394))) ; (bitvector 40)
  (let ((n397 (concat (bv #b0 1) n396))) ; (bitvector 41)
  (let ((n398 (extract 41 41 mult))) ; (bitvector 1)
  (let ((n399 (concat n398 n397))) ; (bitvector 42)
  (let ((n400 (concat (bv #b0 1) n399))) ; (bitvector 43)
  (let ((n401 (extract 43 43 mult))) ; (bitvector 1)
  (let ((n402 (concat n401 n400))) ; (bitvector 44)
  (let ((n403 (extract 44 44 mult))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1030$264$_Y
      (bvnot n403))) ; (bitvector 1)
  (let
    ((n405
      (concat
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1030$264$_Y
        n402))) ; (bitvector 45)
  (let (($procmux$521$_Y (if (bitvector->bool CEM) n405 V_DATA_reg))) ; (bitvector 45)
  (let
    (($0_V_DATA_reg_44_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1043$270$_Y)
        (bv #b000000000000000000000000000000000000000000000 45)
        $procmux$521$_Y))) ; (bitvector 45)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_OPMODE_reg_sampled$917
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$918 state))) ; (bitvector 9)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_OPMODE_reg_8_0__sampled$919
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$920 state))) ; (bitvector 9)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$921
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$922 state))) ; (bitvector 1)
  (let
    ((n411
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$921
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$rtlil.cc_2974_Eqx$924 (bool->bitvector (bveq n411 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((OPMODE_reg
      (if
        (bitvector->bool $auto$rtlil.cc_2974_Eqx$924)
        $auto$clk2fflogic.cc_95_sample_data$$0_OPMODE_reg_8_0__sampled$919
        $auto$clk2fflogic.cc_95_sample_data$_OPMODE_reg_sampled$917))) ; (bitvector 9)
  (let ((OPMODE (DSP48E2_Inputs-OPMODE inputs))) ; (bitvector 9)
  (let ((IS_OPMODE_INVERTED (DSP48E2_Inputs-IS_OPMODE_INVERTED inputs))) ; (bitvector 9)
  (let ((OPMODE_in (bvxor OPMODE IS_OPMODE_INVERTED))) ; (bitvector 9)
  (let (($procmux$610$_Y (if (bitvector->bool CECTRL) OPMODE_in OPMODE_reg))) ; (bitvector 9)
  (let
    (($0_OPMODE_reg_8_0_
      (if (bitvector->bool RSTCTRL_in) (bv #b000000000 9) $procmux$610$_Y))) ; (bitvector 9)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$828$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$828 state))) ; (bitvector 48)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$830$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$830 state))) ; (bitvector 48)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$831
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$832 state))) ; (bitvector 1)
  (let
    ((n423
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$831
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$833$_Y
      (bool->bitvector (bveq n423 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((C_reg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$833$_Y)
        $auto$clk2fflogic.cc_102_sample_data$830$_Q
        $auto$clk2fflogic.cc_102_sample_data$828$_Q))) ; (bitvector 48)
  (let ((C (DSP48E2_Inputs-C inputs))) ; (bitvector 48)
  (let ((CEC (DSP48E2_Inputs-CEC inputs))) ; (bitvector 1)
  (let (($procmux$540$_Y (if (bitvector->bool CEC) C C_reg))) ; (bitvector 48)
  (let ((RSTC (DSP48E2_Inputs-RSTC inputs))) ; (bitvector 1)
  (let ((IS_RSTC_INVERTED (DSP48E2_Inputs-IS_RSTC_INVERTED inputs))) ; (bitvector 1)
  (let ((RSTC_in (bvxor RSTC IS_RSTC_INVERTED))) ; (bitvector 1)
  (let ((CREG (DSP48E2_Inputs-CREG inputs))) ; (bitvector 32)
  (let ((n434 (extract 0 0 CREG))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1007$254$_Y
      (bvnot n434))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1007$255$_Y
      (bvor
        RSTC_in
        $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1007$254$_Y))) ; (bitvector 1)
  (let
    (($0_C_reg_47_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1007$255$_Y)
        (bv #b000000000000000000000000000000000000000000000000 48)
        $procmux$540$_Y))) ; (bitvector 48)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$898$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$898 state))) ; (bitvector 4)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$900$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$900 state))) ; (bitvector 4)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$901
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$902 state))) ; (bitvector 1)
  (let
    ((n441
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$901
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$903$_Y
      (bool->bitvector (bveq n441 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((ALUMODE_reg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$903$_Y)
        $auto$clk2fflogic.cc_102_sample_data$900$_Q
        $auto$clk2fflogic.cc_102_sample_data$898$_Q))) ; (bitvector 4)
  (let ((ALUMODE (DSP48E2_Inputs-ALUMODE inputs))) ; (bitvector 4)
  (let ((IS_ALUMODE_INVERTED (DSP48E2_Inputs-IS_ALUMODE_INVERTED inputs))) ; (bitvector 4)
  (let ((ALUMODE_in (bvxor ALUMODE IS_ALUMODE_INVERTED))) ; (bitvector 4)
  (let ((CEALUMODE (DSP48E2_Inputs-CEALUMODE inputs))) ; (bitvector 1)
  (let
    (($procmux$597$_Y (if (bitvector->bool CEALUMODE) ALUMODE_in ALUMODE_reg))) ; (bitvector 4)
  (let ((RSTALUMODE (DSP48E2_Inputs-RSTALUMODE inputs))) ; (bitvector 1)
  (let
    ((IS_RSTALUMODE_INVERTED (DSP48E2_Inputs-IS_RSTALUMODE_INVERTED inputs))) ; (bitvector 1)
  (let ((RSTALUMODE_in (bvxor RSTALUMODE IS_RSTALUMODE_INVERTED))) ; (bitvector 1)
  (let
    (($0_ALUMODE_reg_3_0_
      (if (bitvector->bool RSTALUMODE_in) (bv #b0000 4) $procmux$597$_Y))) ; (bitvector 4)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$798$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$798 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$800$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$800 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$801
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$802 state))) ; (bitvector 1)
  (let
    ((n457
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$801
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$803$_Y
      (bool->bitvector (bveq n457 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((pdetb_o_reg2
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$803$_Y)
        $auto$clk2fflogic.cc_102_sample_data$800$_Q
        $auto$clk2fflogic.cc_102_sample_data$798$_Q))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$788$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$788 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$790$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$790 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$791
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$792 state))) ; (bitvector 1)
  (let
    ((n463
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$791
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$793$_Y
      (bool->bitvector (bveq n463 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((pdetb_o_reg1
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$793$_Y)
        $auto$clk2fflogic.cc_102_sample_data$790$_Q
        $auto$clk2fflogic.cc_102_sample_data$788$_Q))) ; (bitvector 1)
  (let ((CEP (DSP48E2_Inputs-CEP inputs))) ; (bitvector 1)
  (let ((PREG (DSP48E2_Inputs-PREG inputs))) ; (bitvector 32)
  (let ((n468 (extract 0 0 PREG))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1086$298$_Y
      (bvand CEP n468))) ; (bitvector 1)
  (let
    (($procmux$501$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1086$298$_Y)
        pdetb_o_reg1
        pdetb_o_reg2))) ; (bitvector 1)
  (let ((RSTP (DSP48E2_Inputs-RSTP inputs))) ; (bitvector 1)
  (let ((IS_RSTP_INVERTED (DSP48E2_Inputs-IS_RSTP_INVERTED inputs))) ; (bitvector 1)
  (let ((RSTP_in (bvxor RSTP IS_RSTP_INVERTED))) ; (bitvector 1)
  (let ((AUTORESET_PRIORITY (DSP48E2_Inputs-AUTORESET_PRIORITY inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_415$27$_Y
      (bool->bitvector (bveq AUTORESET_PRIORITY (bv #b10000 5))))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_415$28$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_415$27$_Y)
        (bv #b1 1)
        (bv #b0 1)))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$671
      (concat
        (bv #b0000000000000000000000000000000 31)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_415$28$_Y))) ; (bitvector 32)
  (let ((n479 (extract 0 0 $auto$wreduce.cc_514_run$671))) ; (bitvector 1)
  (let ((n481 (zero-extend (bv #b110 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_414$26$_Y
      (bool->bitvector (bveq AUTORESET_PRIORITY n481)))) ; (bitvector 1)
  (let
    ((AUTORESET_PRIORITY_BIN
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_414$26$_Y)
        (bv #b0 1)
        n479))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1103$307$_Y
      (bvnot AUTORESET_PRIORITY_BIN))) ; (bitvector 1)
  (let
    ((auto_reset_pri
      (bvor
        $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1103$307$_Y
        CEP))) ; (bitvector 1)
  (let ((PATTERN (DSP48E2_Inputs-PATTERN inputs))) ; (bitvector 48)
  (let ((C_DATA_in (if (bitvector->bool n434) C_reg C))) ; (bitvector 48)
  (let ((SEL_PATTERN (DSP48E2_Inputs-SEL_PATTERN inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_467$55$_Y
      (bool->bitvector (bveq SEL_PATTERN (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_467$56$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_467$55$_Y)
        (bv #b1 1)
        (bv #b0 1)))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$679
      (concat
        (bv #b0000000000000000000000000000000 31)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_467$56$_Y))) ; (bitvector 32)
  (let ((n493 (extract 0 0 $auto$wreduce.cc_514_run$679))) ; (bitvector 1)
  (let ((n495 (zero-extend (bv #b1001 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_466$54$_Y
      (bool->bitvector (bveq SEL_PATTERN n495)))) ; (bitvector 1)
  (let
    ((SEL_PATTERN_BIN
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_466$54$_Y)
        (bv #b0 1)
        n493))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1061$276$_Y
      (if (bitvector->bool SEL_PATTERN_BIN) C_DATA_in PATTERN))) ; (bitvector 48)
  (let ((ALUMODEREG (DSP48E2_Inputs-ALUMODEREG inputs))) ; (bitvector 32)
  (let ((n500 (extract 0 0 ALUMODEREG))) ; (bitvector 1)
  (let ((ALUMODE_DATA (if (bitvector->bool n500) ALUMODE_reg ALUMODE_in))) ; (bitvector 4)
  (let ((n502 (extract 1 1 ALUMODE_DATA))) ; (bitvector 1)
  (let ((n503 (concat n502 n502))) ; (bitvector 2)
  (let ((n504 (concat n502 n503))) ; (bitvector 3)
  (let ((n505 (concat n502 n504))) ; (bitvector 4)
  (let ((n506 (concat n502 n505))) ; (bitvector 5)
  (let ((n507 (concat n502 n506))) ; (bitvector 6)
  (let ((n508 (concat n502 n507))) ; (bitvector 7)
  (let ((n509 (concat n502 n508))) ; (bitvector 8)
  (let ((n510 (concat n502 n509))) ; (bitvector 9)
  (let ((n511 (concat n502 n510))) ; (bitvector 10)
  (let ((n512 (concat n502 n511))) ; (bitvector 11)
  (let ((n513 (concat n502 n512))) ; (bitvector 12)
  (let ((n514 (concat n502 n513))) ; (bitvector 13)
  (let ((n515 (concat n502 n514))) ; (bitvector 14)
  (let ((n516 (concat n502 n515))) ; (bitvector 15)
  (let ((n517 (concat n502 n516))) ; (bitvector 16)
  (let ((n518 (concat n502 n517))) ; (bitvector 17)
  (let ((n519 (concat n502 n518))) ; (bitvector 18)
  (let ((n520 (concat n502 n519))) ; (bitvector 19)
  (let ((n521 (concat n502 n520))) ; (bitvector 20)
  (let ((n522 (concat n502 n521))) ; (bitvector 21)
  (let ((n523 (concat n502 n522))) ; (bitvector 22)
  (let ((n524 (concat n502 n523))) ; (bitvector 23)
  (let ((n525 (concat n502 n524))) ; (bitvector 24)
  (let ((n526 (concat n502 n525))) ; (bitvector 25)
  (let ((n527 (concat n502 n526))) ; (bitvector 26)
  (let ((n528 (concat n502 n527))) ; (bitvector 27)
  (let ((n529 (concat n502 n528))) ; (bitvector 28)
  (let ((n530 (concat n502 n529))) ; (bitvector 29)
  (let ((n531 (concat n502 n530))) ; (bitvector 30)
  (let ((n532 (concat n502 n531))) ; (bitvector 31)
  (let ((n533 (concat n502 n532))) ; (bitvector 32)
  (let ((n534 (concat n502 n533))) ; (bitvector 33)
  (let ((n535 (concat n502 n534))) ; (bitvector 34)
  (let ((n536 (concat n502 n535))) ; (bitvector 35)
  (let ((n537 (concat n502 n536))) ; (bitvector 36)
  (let ((n538 (concat n502 n537))) ; (bitvector 37)
  (let ((n539 (concat n502 n538))) ; (bitvector 38)
  (let ((n540 (concat n502 n539))) ; (bitvector 39)
  (let ((n541 (concat n502 n540))) ; (bitvector 40)
  (let ((n542 (concat n502 n541))) ; (bitvector 41)
  (let ((n543 (concat n502 n542))) ; (bitvector 42)
  (let ((n544 (concat n502 n543))) ; (bitvector 43)
  (let ((n545 (concat n502 n544))) ; (bitvector 44)
  (let ((n546 (concat n502 n545))) ; (bitvector 45)
  (let ((n547 (concat n502 n546))) ; (bitvector 46)
  (let ((n548 (concat n502 n547))) ; (bitvector 47)
  (let ((n549 (concat n502 n548))) ; (bitvector 48)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$748$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$748 state))) ; (bitvector 48)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$750$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$750 state))) ; (bitvector 48)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$751
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$752 state))) ; (bitvector 1)
  (let
    ((n554
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$751
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$753$_Y
      (bool->bitvector (bveq n554 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((ALU_OUT_reg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$753$_Y)
        $auto$clk2fflogic.cc_102_sample_data$750$_Q
        $auto$clk2fflogic.cc_102_sample_data$748$_Q))) ; (bitvector 48)
  (let ((n557 (extract 47 47 ALU_OUT_reg))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_929$217$_Y
      (bvnot n557))) ; (bitvector 1)
  (let
    ((multcarryin_data
      (if
        (bitvector->bool n328)
        qmultcarryin
        $logic_not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_902$204$_Y))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_928$216$_Y
      (bvnot multcarryin_data))) ; (bitvector 1)
  (let
    ((n561
      (concat
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_928$216$_Y
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_929$217$_Y))) ; (bitvector 2)
  (let ((n562 (concat n557 n561))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$728$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$728 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$730$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$730 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$731
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$732 state))) ; (bitvector 1)
  (let
    ((n566
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$731
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$733$_Y
      (bool->bitvector (bveq n566 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((ALUMODE10_reg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$733$_Y)
        $auto$clk2fflogic.cc_102_sample_data$730$_Q
        $auto$clk2fflogic.cc_102_sample_data$728$_Q))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$718$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$718 state))) ; (bitvector 4)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$720$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$720 state))) ; (bitvector 4)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$721
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$722 state))) ; (bitvector 1)
  (let
    ((n572
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$721
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$723$_Y
      (bool->bitvector (bveq n572 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((COUT_reg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$723$_Y)
        $auto$clk2fflogic.cc_102_sample_data$720$_Q
        $auto$clk2fflogic.cc_102_sample_data$718$_Q))) ; (bitvector 4)
  (let ((n575 (extract 3 3 COUT_reg))) ; (bitvector 1)
  (let ((CCOUT_in (bvxor ALUMODE10_reg n575))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_926$215$_Y
      (bvnot CCOUT_in))) ; (bitvector 1)
  (let
    ((n578
      (concat
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_926$215$_Y
        n562))) ; (bitvector 4)
  (let ((PCIN (DSP48E2_Inputs-PCIN inputs))) ; (bitvector 48)
  (let ((n580 (extract 47 47 PCIN))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_925$214$_Y
      (bvnot n580))) ; (bitvector 1)
  (let
    ((n582
      (concat
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_925$214$_Y
        n578))) ; (bitvector 5)
  (let ((CARRYCASCIN (DSP48E2_Inputs-CARRYCASCIN inputs))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_924$213$_Y
      (bvnot CARRYCASCIN))) ; (bitvector 1)
  (let
    ((n585
      (concat
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_924$213$_Y
        n582))) ; (bitvector 6)
  (let ((n586 (concat n580 n585))) ; (bitvector 7)
  (let ((CARRYINREG (DSP48E2_Inputs-CARRYINREG inputs))) ; (bitvector 32)
  (let ((n588 (extract 0 0 CARRYINREG))) ; (bitvector 1)
  (let ((CARRYIN_mux (if (bitvector->bool n588) CARRYIN_reg CARRYIN_in))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_922$212$_Y
      (bvnot CARRYIN_mux))) ; (bitvector 1)
  (let
    ((n591
      (concat
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_922$212$_Y
        n586))) ; (bitvector 8)
  (let ((n592 (extract 0 0 n591))) ; (bitvector 1)
  (let ((CARRYINSELREG (DSP48E2_Inputs-CARRYINSELREG inputs))) ; (bitvector 32)
  (let ((n594 (extract 0 0 CARRYINSELREG))) ; (bitvector 1)
  (let ((CARRYINSEL_mux (if (bitvector->bool n594) CARRYINSEL_reg CARRYINSEL))) ; (bitvector 3)
  (let
    (($procmux$584_CMP (bool->bitvector (bveq CARRYINSEL_mux (bv #b111 3))))) ; (bitvector 1)
  (let
    (($procmux$585_CMP (bool->bitvector (bveq CARRYINSEL_mux (bv #b110 3))))) ; (bitvector 1)
  (let ((n598 (concat $procmux$585_CMP $procmux$584_CMP))) ; (bitvector 2)
  (let
    (($procmux$586_CMP (bool->bitvector (bveq CARRYINSEL_mux (bv #b101 3))))) ; (bitvector 1)
  (let ((n601 (concat $procmux$586_CMP n598))) ; (bitvector 3)
  (let
    (($procmux$587_CMP (bool->bitvector (bveq CARRYINSEL_mux (bv #b100 3))))) ; (bitvector 1)
  (let ((n604 (concat $procmux$587_CMP n601))) ; (bitvector 4)
  (let ((n606 (zero-extend (bv #b11 2) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$588_CMP (bool->bitvector (bveq CARRYINSEL_mux n606)))) ; (bitvector 1)
  (let ((n608 (concat $procmux$588_CMP n604))) ; (bitvector 5)
  (let ((n609 (zero-extend (bv #b10 2) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$589_CMP (bool->bitvector (bveq CARRYINSEL_mux n609)))) ; (bitvector 1)
  (let ((n611 (concat $procmux$589_CMP n608))) ; (bitvector 6)
  (let ((n612 (zero-extend (bv #b1 1) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$590_CMP (bool->bitvector (bveq CARRYINSEL_mux n612)))) ; (bitvector 1)
  (let ((n614 (concat $procmux$590_CMP n611))) ; (bitvector 7)
  (let ((n615 (apply bvor (bitvector->bits CARRYINSEL_mux)))) ; (bitvector 1)
  (let (($procmux$591_CMP (bvnot n615))) ; (bitvector 1)
  (let ((n617 (concat $procmux$591_CMP n614))) ; (bitvector 8)
  (let ((n618 (extract 0 0 n617))) ; (bitvector 1)
  (let ((n619 (if (bitvector->bool n618) n592 (bv #b0 1)))) ; (bitvector 1)
  (let ((n620 (extract 1 1 n591))) ; (bitvector 1)
  (let ((n621 (extract 1 1 n617))) ; (bitvector 1)
  (let ((n622 (if (bitvector->bool n621) n620 n619))) ; (bitvector 1)
  (let ((n623 (extract 2 2 n591))) ; (bitvector 1)
  (let ((n624 (extract 2 2 n617))) ; (bitvector 1)
  (let ((n625 (if (bitvector->bool n624) n623 n622))) ; (bitvector 1)
  (let ((n626 (extract 3 3 n591))) ; (bitvector 1)
  (let ((n627 (extract 3 3 n617))) ; (bitvector 1)
  (let ((n628 (if (bitvector->bool n627) n626 n625))) ; (bitvector 1)
  (let ((n629 (extract 4 4 n591))) ; (bitvector 1)
  (let ((n630 (extract 4 4 n617))) ; (bitvector 1)
  (let ((n631 (if (bitvector->bool n630) n629 n628))) ; (bitvector 1)
  (let ((n632 (extract 5 5 n591))) ; (bitvector 1)
  (let ((n633 (extract 5 5 n617))) ; (bitvector 1)
  (let ((n634 (if (bitvector->bool n633) n632 n631))) ; (bitvector 1)
  (let ((n635 (extract 6 6 n591))) ; (bitvector 1)
  (let ((n636 (extract 6 6 n617))) ; (bitvector 1)
  (let ((n637 (if (bitvector->bool n636) n635 n634))) ; (bitvector 1)
  (let ((n638 (extract 7 7 n591))) ; (bitvector 1)
  (let ((n639 (extract 7 7 n617))) ; (bitvector 1)
  (let ((cin_b (if (bitvector->bool n639) n638 n637))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_934$219$_Y
      (bvnot cin_b))) ; (bitvector 1)
  (let ((n642 (extract 3 3 ALUMODE_DATA))) ; (bitvector 1)
  (let ((n643 (extract 2 2 ALUMODE_DATA))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_934$218$_Y
      (bvor n642 n643))) ; (bitvector 1)
  (let
    ((cin
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_934$218$_Y)
        (bv #b0 1)
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_934$219$_Y))) ; (bitvector 1)
  (let ((n646 (extract 0 0 ALUMODE_DATA))) ; (bitvector 1)
  (let ((n647 (concat n646 n646))) ; (bitvector 2)
  (let ((n648 (concat n646 n647))) ; (bitvector 3)
  (let ((n649 (concat n646 n648))) ; (bitvector 4)
  (let ((n650 (concat n646 n649))) ; (bitvector 5)
  (let ((n651 (concat n646 n650))) ; (bitvector 6)
  (let ((n652 (concat n646 n651))) ; (bitvector 7)
  (let ((n653 (concat n646 n652))) ; (bitvector 8)
  (let ((n654 (concat n646 n653))) ; (bitvector 9)
  (let ((n655 (concat n646 n654))) ; (bitvector 10)
  (let ((n656 (concat n646 n655))) ; (bitvector 11)
  (let ((n657 (concat n646 n656))) ; (bitvector 12)
  (let ((n658 (concat n646 n657))) ; (bitvector 13)
  (let ((n659 (concat n646 n658))) ; (bitvector 14)
  (let ((n660 (concat n646 n659))) ; (bitvector 15)
  (let ((n661 (concat n646 n660))) ; (bitvector 16)
  (let ((n662 (concat n646 n661))) ; (bitvector 17)
  (let ((n663 (concat n646 n662))) ; (bitvector 18)
  (let ((n664 (concat n646 n663))) ; (bitvector 19)
  (let ((n665 (concat n646 n664))) ; (bitvector 20)
  (let ((n666 (concat n646 n665))) ; (bitvector 21)
  (let ((n667 (concat n646 n666))) ; (bitvector 22)
  (let ((n668 (concat n646 n667))) ; (bitvector 23)
  (let ((n669 (concat n646 n668))) ; (bitvector 24)
  (let ((n670 (concat n646 n669))) ; (bitvector 25)
  (let ((n671 (concat n646 n670))) ; (bitvector 26)
  (let ((n672 (concat n646 n671))) ; (bitvector 27)
  (let ((n673 (concat n646 n672))) ; (bitvector 28)
  (let ((n674 (concat n646 n673))) ; (bitvector 29)
  (let ((n675 (concat n646 n674))) ; (bitvector 30)
  (let ((n676 (concat n646 n675))) ; (bitvector 31)
  (let ((n677 (concat n646 n676))) ; (bitvector 32)
  (let ((n678 (concat n646 n677))) ; (bitvector 33)
  (let ((n679 (concat n646 n678))) ; (bitvector 34)
  (let ((n680 (concat n646 n679))) ; (bitvector 35)
  (let ((n681 (concat n646 n680))) ; (bitvector 36)
  (let ((n682 (concat n646 n681))) ; (bitvector 37)
  (let ((n683 (concat n646 n682))) ; (bitvector 38)
  (let ((n684 (concat n646 n683))) ; (bitvector 39)
  (let ((n685 (concat n646 n684))) ; (bitvector 40)
  (let ((n686 (concat n646 n685))) ; (bitvector 41)
  (let ((n687 (concat n646 n686))) ; (bitvector 42)
  (let ((n688 (concat n646 n687))) ; (bitvector 43)
  (let ((n689 (concat n646 n688))) ; (bitvector 44)
  (let ((n690 (concat n646 n689))) ; (bitvector 45)
  (let ((n691 (concat n646 n690))) ; (bitvector 46)
  (let ((n692 (concat n646 n691))) ; (bitvector 47)
  (let ((n693 (concat n646 n692))) ; (bitvector 48)
  (let ((n695 (extract 47 17 ALU_OUT_reg))) ; (bitvector 31)
  (let ((n696 (concat n557 n695))) ; (bitvector 32)
  (let ((n697 (concat n557 n696))) ; (bitvector 33)
  (let ((n698 (concat n557 n697))) ; (bitvector 34)
  (let ((n699 (concat n557 n698))) ; (bitvector 35)
  (let ((n700 (concat n557 n699))) ; (bitvector 36)
  (let ((n701 (concat n557 n700))) ; (bitvector 37)
  (let ((n702 (concat n557 n701))) ; (bitvector 38)
  (let ((n703 (concat n557 n702))) ; (bitvector 39)
  (let ((n704 (concat n557 n703))) ; (bitvector 40)
  (let ((n705 (concat n557 n704))) ; (bitvector 41)
  (let ((n706 (concat n557 n705))) ; (bitvector 42)
  (let ((n707 (concat n557 n706))) ; (bitvector 43)
  (let ((n708 (concat n557 n707))) ; (bitvector 44)
  (let ((n709 (concat n557 n708))) ; (bitvector 45)
  (let ((n710 (concat n557 n709))) ; (bitvector 46)
  (let ((n711 (concat n557 n710))) ; (bitvector 47)
  (let ((n712 (concat n557 n711))) ; (bitvector 48)
  (let ((n713 (extract 47 17 PCIN))) ; (bitvector 31)
  (let ((n714 (concat n713 n712))) ; (bitvector 79)
  (let ((n715 (concat n580 n714))) ; (bitvector 80)
  (let ((n716 (concat n580 n715))) ; (bitvector 81)
  (let ((n717 (concat n580 n716))) ; (bitvector 82)
  (let ((n718 (concat n580 n717))) ; (bitvector 83)
  (let ((n719 (concat n580 n718))) ; (bitvector 84)
  (let ((n720 (concat n580 n719))) ; (bitvector 85)
  (let ((n721 (concat n580 n720))) ; (bitvector 86)
  (let ((n722 (concat n580 n721))) ; (bitvector 87)
  (let ((n723 (concat n580 n722))) ; (bitvector 88)
  (let ((n724 (concat n580 n723))) ; (bitvector 89)
  (let ((n725 (concat n580 n724))) ; (bitvector 90)
  (let ((n726 (concat n580 n725))) ; (bitvector 91)
  (let ((n727 (concat n580 n726))) ; (bitvector 92)
  (let ((n728 (concat n580 n727))) ; (bitvector 93)
  (let ((n729 (concat n580 n728))) ; (bitvector 94)
  (let ((n730 (concat n580 n729))) ; (bitvector 95)
  (let ((n731 (concat n580 n730))) ; (bitvector 96)
  (let ((n732 (concat ALU_OUT_reg n731))) ; (bitvector 144)
  (let ((n733 (concat C_DATA_in n732))) ; (bitvector 192)
  (let ((n734 (concat PCIN n733))) ; (bitvector 240)
  (let
    ((n735
      (concat (bv #b000000000000000000000000000000000000000000000000 48) n734))) ; (bitvector 288)
  (let ((n736 (extract 47 0 n735))) ; (bitvector 48)
  (let ((OPMODEREG (DSP48E2_Inputs-OPMODEREG inputs))) ; (bitvector 32)
  (let ((n738 (extract 0 0 OPMODEREG))) ; (bitvector 1)
  (let ((OPMODE_mux (if (bitvector->bool n738) OPMODE_reg OPMODE_in))) ; (bitvector 9)
  (let ((n740 (extract 6 5 OPMODE_mux))) ; (bitvector 2)
  (let (($procmux$616_CMP (bool->bitvector (bveq n740 (bv #b11 2))))) ; (bitvector 1)
  (let ((n742 (extract 6 4 OPMODE_mux))) ; (bitvector 3)
  (let (($procmux$617_CMP (bool->bitvector (bveq n742 (bv #b101 3))))) ; (bitvector 1)
  (let ((n744 (concat $procmux$617_CMP $procmux$616_CMP))) ; (bitvector 2)
  (let ((n745 (extract 6 4 OPMODE_mux))) ; (bitvector 3)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_693$87_Y
      (bool->bitvector (bveq n745 (bv #b100 3))))) ; (bitvector 1)
  (let ((n747 (zero-extend (bv #b10 2) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$620_CMP (bool->bitvector (bveq n742 n747)))) ; (bitvector 1)
  (let
    ((n749
      (concat
        $procmux$620_CMP
        $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_693$87_Y))) ; (bitvector 2)
  (let
    (($auto$opt_reduce.cc_131_opt_pmux$662$_Y
      (apply bvor (bitvector->bits n749)))) ; (bitvector 1)
  (let ((n751 (concat $auto$opt_reduce.cc_131_opt_pmux$662$_Y n744))) ; (bitvector 3)
  (let ((n752 (zero-extend (bv #b11 2) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$619_CMP (bool->bitvector (bveq n742 n752)))) ; (bitvector 1)
  (let ((n754 (concat $procmux$619_CMP n751))) ; (bitvector 4)
  (let ((n755 (zero-extend (bv #b1 1) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$621_CMP (bool->bitvector (bveq n742 n755)))) ; (bitvector 1)
  (let ((n757 (concat $procmux$621_CMP n754))) ; (bitvector 5)
  (let ((n758 (apply bvor (bitvector->bits n742)))) ; (bitvector 1)
  (let (($procmux$622_CMP (bvnot n758))) ; (bitvector 1)
  (let ((n760 (concat $procmux$622_CMP n757))) ; (bitvector 6)
  (let ((n761 (extract 0 0 n760))) ; (bitvector 1)
  (let
    ((n762
      (if
        (bitvector->bool n761)
        n736
        (bv #b000000000000000000000000000000000000000000000000 48)))) ; (bitvector 48)
  (let ((n763 (extract 95 48 n735))) ; (bitvector 48)
  (let ((n764 (extract 1 1 n760))) ; (bitvector 1)
  (let ((n765 (if (bitvector->bool n764) n763 n762))) ; (bitvector 48)
  (let ((n766 (extract 143 96 n735))) ; (bitvector 48)
  (let ((n767 (extract 2 2 n760))) ; (bitvector 1)
  (let ((n768 (if (bitvector->bool n767) n766 n765))) ; (bitvector 48)
  (let ((n769 (extract 191 144 n735))) ; (bitvector 48)
  (let ((n770 (extract 3 3 n760))) ; (bitvector 1)
  (let ((n771 (if (bitvector->bool n770) n769 n768))) ; (bitvector 48)
  (let ((n772 (extract 239 192 n735))) ; (bitvector 48)
  (let ((n773 (extract 4 4 n760))) ; (bitvector 1)
  (let ((n774 (if (bitvector->bool n773) n772 n771))) ; (bitvector 48)
  (let ((n775 (extract 287 240 n735))) ; (bitvector 48)
  (let ((n776 (extract 5 5 n760))) ; (bitvector 1)
  (let (($procmux$615$_Y (if (bitvector->bool n776) n775 n774))) ; (bitvector 48)
  (let ((z_optinv (bvxor n693 $procmux$615$_Y))) ; (bitvector 48)
  (let ((n779 (concat A_ALU B2_DATA))) ; (bitvector 48)
  (let ((n780 (concat ALU_OUT_reg n779))) ; (bitvector 96)
  (let ((n782 (extract 0 0 mult))) ; (bitvector 1)
  (let ((n783 (concat (bv #b0 1) n782))) ; (bitvector 2)
  (let ((n784 (extract 2 2 mult))) ; (bitvector 1)
  (let ((n785 (concat n784 n783))) ; (bitvector 3)
  (let ((n786 (concat (bv #b0 1) n785))) ; (bitvector 4)
  (let ((n787 (extract 4 4 mult))) ; (bitvector 1)
  (let ((n788 (concat n787 n786))) ; (bitvector 5)
  (let ((n789 (concat (bv #b0 1) n788))) ; (bitvector 6)
  (let ((n790 (extract 6 6 mult))) ; (bitvector 1)
  (let ((n791 (concat n790 n789))) ; (bitvector 7)
  (let ((n792 (concat (bv #b0 1) n791))) ; (bitvector 8)
  (let ((n793 (extract 8 8 mult))) ; (bitvector 1)
  (let ((n794 (concat n793 n792))) ; (bitvector 9)
  (let ((n795 (concat (bv #b0 1) n794))) ; (bitvector 10)
  (let ((n796 (extract 10 10 mult))) ; (bitvector 1)
  (let ((n797 (concat n796 n795))) ; (bitvector 11)
  (let ((n798 (concat (bv #b0 1) n797))) ; (bitvector 12)
  (let ((n799 (extract 12 12 mult))) ; (bitvector 1)
  (let ((n800 (concat n799 n798))) ; (bitvector 13)
  (let ((n801 (concat (bv #b0 1) n800))) ; (bitvector 14)
  (let ((n802 (extract 14 14 mult))) ; (bitvector 1)
  (let ((n803 (concat n802 n801))) ; (bitvector 15)
  (let ((n804 (concat (bv #b0 1) n803))) ; (bitvector 16)
  (let ((n805 (extract 16 16 mult))) ; (bitvector 1)
  (let ((n806 (concat n805 n804))) ; (bitvector 17)
  (let ((n807 (concat (bv #b0 1) n806))) ; (bitvector 18)
  (let ((n808 (extract 18 18 mult))) ; (bitvector 1)
  (let ((n809 (concat n808 n807))) ; (bitvector 19)
  (let ((n810 (concat (bv #b0 1) n809))) ; (bitvector 20)
  (let ((n811 (extract 20 20 mult))) ; (bitvector 1)
  (let ((n812 (concat n811 n810))) ; (bitvector 21)
  (let ((n813 (concat (bv #b0 1) n812))) ; (bitvector 22)
  (let ((n814 (extract 22 22 mult))) ; (bitvector 1)
  (let ((n815 (concat n814 n813))) ; (bitvector 23)
  (let ((n816 (concat (bv #b0 1) n815))) ; (bitvector 24)
  (let ((n817 (extract 24 24 mult))) ; (bitvector 1)
  (let ((n818 (concat n817 n816))) ; (bitvector 25)
  (let ((n819 (concat (bv #b0 1) n818))) ; (bitvector 26)
  (let ((n820 (extract 26 26 mult))) ; (bitvector 1)
  (let ((n821 (concat n820 n819))) ; (bitvector 27)
  (let ((n822 (concat (bv #b0 1) n821))) ; (bitvector 28)
  (let ((n823 (extract 28 28 mult))) ; (bitvector 1)
  (let ((n824 (concat n823 n822))) ; (bitvector 29)
  (let ((n825 (concat (bv #b0 1) n824))) ; (bitvector 30)
  (let ((n826 (extract 30 30 mult))) ; (bitvector 1)
  (let ((n827 (concat n826 n825))) ; (bitvector 31)
  (let ((n828 (concat (bv #b0 1) n827))) ; (bitvector 32)
  (let ((n829 (extract 32 32 mult))) ; (bitvector 1)
  (let ((n830 (concat n829 n828))) ; (bitvector 33)
  (let ((n831 (concat (bv #b0 1) n830))) ; (bitvector 34)
  (let ((n832 (extract 34 34 mult))) ; (bitvector 1)
  (let ((n833 (concat n832 n831))) ; (bitvector 35)
  (let ((n834 (concat (bv #b0 1) n833))) ; (bitvector 36)
  (let ((n835 (extract 36 36 mult))) ; (bitvector 1)
  (let ((n836 (concat n835 n834))) ; (bitvector 37)
  (let ((n837 (concat (bv #b0 1) n836))) ; (bitvector 38)
  (let ((n838 (extract 38 38 mult))) ; (bitvector 1)
  (let ((n839 (concat n838 n837))) ; (bitvector 39)
  (let ((n840 (concat (bv #b0 1) n839))) ; (bitvector 40)
  (let ((n841 (extract 40 40 mult))) ; (bitvector 1)
  (let ((n842 (concat n841 n840))) ; (bitvector 41)
  (let ((n843 (concat (bv #b0 1) n842))) ; (bitvector 42)
  (let ((n844 (extract 42 42 mult))) ; (bitvector 1)
  (let ((n845 (concat n844 n843))) ; (bitvector 43)
  (let ((n846 (concat (bv #b10 2) n845))) ; (bitvector 45)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1052$272$_Y
      (if (bitvector->bool n328) U_DATA_reg n846))) ; (bitvector 45)
  (let ((USE_SIMD (DSP48E2_Inputs-USE_SIMD inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_484$70$_Y
      (bool->bitvector (bveq USE_SIMD (bv #b11001 5))))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_484$71$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_484$70$_Y)
        (bv #b10 2)
        (bv #b00 2)))) ; (bitvector 2)
  (let
    (($auto$wreduce.cc_514_run$683
      (concat
        (bv #b000000000000000000000000000000 30)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_484$71$_Y))) ; (bitvector 32)
  (let ((n853 (extract 1 0 $auto$wreduce.cc_514_run$683))) ; (bitvector 2)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_483$69$_Y
      (bool->bitvector (bveq USE_SIMD (bv #b10011 5))))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_483$72$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_483$69$_Y)
        (bv #b01 2)
        n853))) ; (bitvector 2)
  (let
    (($auto$wreduce.cc_514_run$682
      (concat
        (bv #b000000000000000000000000000000 30)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_483$72$_Y))) ; (bitvector 32)
  (let ((n858 (extract 1 0 $auto$wreduce.cc_514_run$682))) ; (bitvector 2)
  (let ((n860 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_482$68$_Y
      (bool->bitvector (bveq USE_SIMD n860)))) ; (bitvector 1)
  (let
    ((USE_SIMD_BIN
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_482$68$_Y)
        (bv #b00 2)
        n858))) ; (bitvector 2)
  (let ((n863 (apply bvor (bitvector->bits USE_SIMD_BIN)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_675$82$_Y
      (bvnot n863))) ; (bitvector 1)
  (let
    ((U_DATA_in
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_675$82$_Y)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1052$272$_Y
        (bv #b100000000000000000000000000000000000000000000 45)))) ; (bitvector 45)
  (let ((n866 (concat U_DATA_in n780))) ; (bitvector 141)
  (let ((n867 (extract 44 44 U_DATA_in))) ; (bitvector 1)
  (let ((n868 (concat n867 n866))) ; (bitvector 142)
  (let ((n869 (concat n867 n868))) ; (bitvector 143)
  (let ((n870 (concat n867 n869))) ; (bitvector 144)
  (let ((MULTSIGNIN (DSP48E2_Inputs-MULTSIGNIN inputs))) ; (bitvector 1)
  (let ((n872 (concat MULTSIGNIN (bv #b0 1)))) ; (bitvector 2)
  (let
    ((x_mac_cascd
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_693$87_Y)
        n872
        (bv #b00 2)))) ; (bitvector 2)
  (let ((n874 (concat x_mac_cascd n870))) ; (bitvector 146)
  (let
    ((n876
      (concat (bv #b0000000000000000000000000000000000000000000000 46) n874))) ; (bitvector 192)
  (let ((n877 (extract 47 0 n876))) ; (bitvector 48)
  (let ((n878 (extract 1 0 OPMODE_mux))) ; (bitvector 2)
  (let (($procmux$629_CMP (bool->bitvector (bveq n878 (bv #b11 2))))) ; (bitvector 1)
  (let (($procmux$630_CMP (bool->bitvector (bveq n878 (bv #b10 2))))) ; (bitvector 1)
  (let ((n881 (concat $procmux$630_CMP $procmux$629_CMP))) ; (bitvector 2)
  (let ((n882 (zero-extend (bv #b1 1) (bitvector 2)))) ; (bitvector 2)
  (let (($procmux$631_CMP (bool->bitvector (bveq n878 n882)))) ; (bitvector 1)
  (let ((n884 (concat $procmux$631_CMP n881))) ; (bitvector 3)
  (let ((n885 (apply bvor (bitvector->bits n878)))) ; (bitvector 1)
  (let (($procmux$632_CMP (bvnot n885))) ; (bitvector 1)
  (let ((n887 (concat $procmux$632_CMP n884))) ; (bitvector 4)
  (let ((n888 (extract 0 0 n887))) ; (bitvector 1)
  (let
    ((n889
      (if
        (bitvector->bool n888)
        n877
        (bv #b000000000000000000000000000000000000000000000000 48)))) ; (bitvector 48)
  (let ((n890 (extract 95 48 n876))) ; (bitvector 48)
  (let ((n891 (extract 1 1 n887))) ; (bitvector 1)
  (let ((n892 (if (bitvector->bool n891) n890 n889))) ; (bitvector 48)
  (let ((n893 (extract 143 96 n876))) ; (bitvector 48)
  (let ((n894 (extract 2 2 n887))) ; (bitvector 1)
  (let ((n895 (if (bitvector->bool n894) n893 n892))) ; (bitvector 48)
  (let ((n896 (extract 191 144 n876))) ; (bitvector 48)
  (let ((n897 (extract 3 3 n887))) ; (bitvector 1)
  (let ((xmux (if (bitvector->bool n897) n896 n895))) ; (bitvector 48)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_782$109$_Y
      (bvxor z_optinv xmux))) ; (bitvector 48)
  (let
    ((n901
      (concat
        (bv #b111111111111111111111111111111111111111111111111 48)
        C_DATA_in))) ; (bitvector 96)
  (let ((n902 (extract 1 1 mult))) ; (bitvector 1)
  (let ((n903 (concat n902 (bv #b0 1)))) ; (bitvector 2)
  (let ((n904 (concat (bv #b0 1) n903))) ; (bitvector 3)
  (let ((n905 (extract 3 3 mult))) ; (bitvector 1)
  (let ((n906 (concat n905 n904))) ; (bitvector 4)
  (let ((n907 (concat (bv #b0 1) n906))) ; (bitvector 5)
  (let ((n908 (extract 5 5 mult))) ; (bitvector 1)
  (let ((n909 (concat n908 n907))) ; (bitvector 6)
  (let ((n910 (concat (bv #b0 1) n909))) ; (bitvector 7)
  (let ((n911 (extract 7 7 mult))) ; (bitvector 1)
  (let ((n912 (concat n911 n910))) ; (bitvector 8)
  (let ((n913 (concat (bv #b0 1) n912))) ; (bitvector 9)
  (let ((n914 (extract 9 9 mult))) ; (bitvector 1)
  (let ((n915 (concat n914 n913))) ; (bitvector 10)
  (let ((n916 (concat (bv #b0 1) n915))) ; (bitvector 11)
  (let ((n917 (extract 11 11 mult))) ; (bitvector 1)
  (let ((n918 (concat n917 n916))) ; (bitvector 12)
  (let ((n919 (concat (bv #b0 1) n918))) ; (bitvector 13)
  (let ((n920 (extract 13 13 mult))) ; (bitvector 1)
  (let ((n921 (concat n920 n919))) ; (bitvector 14)
  (let ((n922 (concat (bv #b0 1) n921))) ; (bitvector 15)
  (let ((n923 (extract 15 15 mult))) ; (bitvector 1)
  (let ((n924 (concat n923 n922))) ; (bitvector 16)
  (let ((n925 (concat (bv #b0 1) n924))) ; (bitvector 17)
  (let ((n926 (extract 17 17 mult))) ; (bitvector 1)
  (let ((n927 (concat n926 n925))) ; (bitvector 18)
  (let ((n928 (concat (bv #b0 1) n927))) ; (bitvector 19)
  (let ((n929 (extract 19 19 mult))) ; (bitvector 1)
  (let ((n930 (concat n929 n928))) ; (bitvector 20)
  (let ((n931 (concat (bv #b0 1) n930))) ; (bitvector 21)
  (let ((n932 (extract 21 21 mult))) ; (bitvector 1)
  (let ((n933 (concat n932 n931))) ; (bitvector 22)
  (let ((n934 (concat (bv #b0 1) n933))) ; (bitvector 23)
  (let ((n935 (extract 23 23 mult))) ; (bitvector 1)
  (let ((n936 (concat n935 n934))) ; (bitvector 24)
  (let ((n937 (concat (bv #b0 1) n936))) ; (bitvector 25)
  (let ((n938 (extract 25 25 mult))) ; (bitvector 1)
  (let ((n939 (concat n938 n937))) ; (bitvector 26)
  (let ((n940 (concat (bv #b0 1) n939))) ; (bitvector 27)
  (let ((n941 (extract 27 27 mult))) ; (bitvector 1)
  (let ((n942 (concat n941 n940))) ; (bitvector 28)
  (let ((n943 (concat (bv #b0 1) n942))) ; (bitvector 29)
  (let ((n944 (extract 29 29 mult))) ; (bitvector 1)
  (let ((n945 (concat n944 n943))) ; (bitvector 30)
  (let ((n946 (concat (bv #b0 1) n945))) ; (bitvector 31)
  (let ((n947 (extract 31 31 mult))) ; (bitvector 1)
  (let ((n948 (concat n947 n946))) ; (bitvector 32)
  (let ((n949 (concat (bv #b0 1) n948))) ; (bitvector 33)
  (let ((n950 (extract 33 33 mult))) ; (bitvector 1)
  (let ((n951 (concat n950 n949))) ; (bitvector 34)
  (let ((n952 (concat (bv #b0 1) n951))) ; (bitvector 35)
  (let ((n953 (extract 35 35 mult))) ; (bitvector 1)
  (let ((n954 (concat n953 n952))) ; (bitvector 36)
  (let ((n955 (concat (bv #b0 1) n954))) ; (bitvector 37)
  (let ((n956 (extract 37 37 mult))) ; (bitvector 1)
  (let ((n957 (concat n956 n955))) ; (bitvector 38)
  (let ((n958 (concat (bv #b0 1) n957))) ; (bitvector 39)
  (let ((n959 (extract 39 39 mult))) ; (bitvector 1)
  (let ((n960 (concat n959 n958))) ; (bitvector 40)
  (let ((n961 (concat (bv #b0 1) n960))) ; (bitvector 41)
  (let ((n962 (extract 41 41 mult))) ; (bitvector 1)
  (let ((n963 (concat n962 n961))) ; (bitvector 42)
  (let ((n964 (concat (bv #b0 1) n963))) ; (bitvector 43)
  (let ((n965 (extract 43 43 mult))) ; (bitvector 1)
  (let ((n966 (concat n965 n964))) ; (bitvector 44)
  (let
    ((n967
      (concat
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1030$264$_Y
        n966))) ; (bitvector 45)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1053$274$_Y
      (if (bitvector->bool n328) V_DATA_reg n967))) ; (bitvector 45)
  (let
    ((V_DATA_in
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_675$82$_Y)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1053$274$_Y
        (bv #b100000000000000000000000000000000000000000000 45)))) ; (bitvector 45)
  (let ((n970 (concat V_DATA_in n901))) ; (bitvector 141)
  (let
    ((n972
      (concat
        (bv #b000000000000000000000000000000000000000000000000000 51)
        n970))) ; (bitvector 192)
  (let ((n973 (extract 47 0 n972))) ; (bitvector 48)
  (let ((n974 (extract 3 2 OPMODE_mux))) ; (bitvector 2)
  (let (($procmux$624_CMP (bool->bitvector (bveq n974 (bv #b11 2))))) ; (bitvector 1)
  (let (($procmux$625_CMP (bool->bitvector (bveq n974 (bv #b10 2))))) ; (bitvector 1)
  (let ((n977 (concat $procmux$625_CMP $procmux$624_CMP))) ; (bitvector 2)
  (let ((n978 (zero-extend (bv #b1 1) (bitvector 2)))) ; (bitvector 2)
  (let (($procmux$626_CMP (bool->bitvector (bveq n974 n978)))) ; (bitvector 1)
  (let ((n980 (concat $procmux$626_CMP n977))) ; (bitvector 3)
  (let ((n981 (apply bvor (bitvector->bits n974)))) ; (bitvector 1)
  (let (($procmux$627_CMP (bvnot n981))) ; (bitvector 1)
  (let ((n983 (concat $procmux$627_CMP n980))) ; (bitvector 4)
  (let ((n984 (extract 0 0 n983))) ; (bitvector 1)
  (let
    ((n985
      (if
        (bitvector->bool n984)
        n973
        (bv #b000000000000000000000000000000000000000000000000 48)))) ; (bitvector 48)
  (let ((n986 (extract 95 48 n972))) ; (bitvector 48)
  (let ((n987 (extract 1 1 n983))) ; (bitvector 1)
  (let ((n988 (if (bitvector->bool n987) n986 n985))) ; (bitvector 48)
  (let ((n989 (extract 143 96 n972))) ; (bitvector 48)
  (let ((n990 (extract 2 2 n983))) ; (bitvector 1)
  (let ((n991 (if (bitvector->bool n990) n989 n988))) ; (bitvector 48)
  (let ((n992 (extract 191 144 n972))) ; (bitvector 48)
  (let ((n993 (extract 3 3 n983))) ; (bitvector 1)
  (let ((ymux (if (bitvector->bool n993) n992 n991))) ; (bitvector 48)
  (let
    ((s
      (bvxor
        $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_782$109$_Y
        ymux))) ; (bitvector 48)
  (let
    (($and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_780$104$_Y
      (bvand xmux ymux))) ; (bitvector 48)
  (let
    (($and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_780$105$_Y
      (bvand z_optinv ymux))) ; (bitvector 48)
  (let
    (($or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_780$106$_Y
      (bvor
        $and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_780$104$_Y
        $and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_780$105$_Y))) ; (bitvector 48)
  (let
    (($and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_780$107$_Y
      (bvand xmux z_optinv))) ; (bitvector 48)
  (let
    (($or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_780$108$_Y
      (bvor
        $or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_780$106$_Y
        $and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_780$107$_Y))) ; (bitvector 48)
  (let ((n1001 (extract 3 3 ALUMODE_DATA))) ; (bitvector 1)
  (let
    ((smux
      (if
        (bitvector->bool n1001)
        $or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_780$108$_Y
        s))) ; (bitvector 48)
  (let ((n1003 (extract 2 2 ALUMODE_DATA))) ; (bitvector 1)
  (let
    ((comux
      (if
        (bitvector->bool n1003)
        (bv #b000000000000000000000000000000000000000000000000 48)
        $or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_780$108$_Y))) ; (bitvector 48)
  (let ((n1005 (extract 10 0 comux))) ; (bitvector 11)
  (let ((n1006 (concat n1005 (bv #b0 1)))) ; (bitvector 12)
  (let ((n1007 (extract 10 0 comux))) ; (bitvector 11)
  (let ((n1008 (extract 11 11 comux))) ; (bitvector 1)
  (let ((n1009 (zero-extend (bv #b1 1) (bitvector 2)))) ; (bitvector 2)
  (let
    (($ne$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_794$118_Y
      (bool->bitvector (not (bveq USE_SIMD_BIN n1009))))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_798$115$_Y
      (bvand
        n1008
        $ne$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_794$118_Y))) ; (bitvector 1)
  (let
    ((n1012
      (concat
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_798$115$_Y
        n1007))) ; (bitvector 12)
  (let ((n1013 (extract 22 12 comux))) ; (bitvector 11)
  (let ((n1014 (concat n1013 n1012))) ; (bitvector 23)
  (let ((n1015 (extract 23 23 comux))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_796$117$_Y
      (bvand
        n1015
        $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_675$82$_Y))) ; (bitvector 1)
  (let
    ((n1017
      (concat
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_796$117$_Y
        n1014))) ; (bitvector 24)
  (let ((n1018 (extract 34 24 comux))) ; (bitvector 11)
  (let ((n1019 (concat n1018 n1017))) ; (bitvector 35)
  (let ((n1020 (extract 35 35 comux))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_794$119$_Y
      (bvand
        n1020
        $ne$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_794$118_Y))) ; (bitvector 1)
  (let
    ((n1022
      (concat
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_794$119$_Y
        n1019))) ; (bitvector 36)
  (let ((n1023 (extract 47 36 comux))) ; (bitvector 12)
  (let ((comux4simd (concat n1023 n1022))) ; (bitvector 48)
  (let ((n1025 (extract 11 11 comux4simd))) ; (bitvector 1)
  (let ((n1026 (concat n1025 n1006))) ; (bitvector 13)
  (let ((n1027 (extract 22 12 comux))) ; (bitvector 11)
  (let ((n1028 (concat n1027 n1026))) ; (bitvector 24)
  (let ((n1029 (extract 23 23 comux4simd))) ; (bitvector 1)
  (let ((n1030 (concat n1029 n1028))) ; (bitvector 25)
  (let ((n1031 (extract 34 24 comux))) ; (bitvector 11)
  (let ((n1032 (concat n1031 n1030))) ; (bitvector 36)
  (let ((n1033 (extract 35 35 comux4simd))) ; (bitvector 1)
  (let ((n1034 (concat n1033 n1032))) ; (bitvector 37)
  (let ((n1035 (extract 46 36 comux))) ; (bitvector 11)
  (let ((n1036 (concat n1035 n1034))) ; (bitvector 48)
  (let
    (($and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_805$122$_Y
      (bvand smux n1036))) ; (bitvector 48)
  (let ((RND (DSP48E2_Inputs-RND inputs))) ; (bitvector 48)
  (let ((n1039 (concat RND C_DATA_in))) ; (bitvector 96)
  (let ((n1040 (concat ALU_OUT_reg n1039))) ; (bitvector 144)
  (let
    ((n1041
      (concat (bv #b000000000000000000000000000000000000000000000000 48) n1040))) ; (bitvector 192)
  (let ((n1042 (extract 47 0 n1041))) ; (bitvector 48)
  (let ((n1043 (extract 8 7 OPMODE_mux))) ; (bitvector 2)
  (let (($procmux$634_CMP (bool->bitvector (bveq n1043 (bv #b11 2))))) ; (bitvector 1)
  (let (($procmux$635_CMP (bool->bitvector (bveq n1043 (bv #b10 2))))) ; (bitvector 1)
  (let ((n1046 (concat $procmux$635_CMP $procmux$634_CMP))) ; (bitvector 2)
  (let ((n1047 (zero-extend (bv #b1 1) (bitvector 2)))) ; (bitvector 2)
  (let (($procmux$636_CMP (bool->bitvector (bveq n1043 n1047)))) ; (bitvector 1)
  (let ((n1049 (concat $procmux$636_CMP n1046))) ; (bitvector 3)
  (let ((n1050 (apply bvor (bitvector->bits n1043)))) ; (bitvector 1)
  (let (($procmux$637_CMP (bvnot n1050))) ; (bitvector 1)
  (let ((n1052 (concat $procmux$637_CMP n1049))) ; (bitvector 4)
  (let ((n1053 (extract 0 0 n1052))) ; (bitvector 1)
  (let
    ((n1054
      (if
        (bitvector->bool n1053)
        n1042
        (bv #b000000000000000000000000000000000000000000000000 48)))) ; (bitvector 48)
  (let ((n1055 (extract 95 48 n1041))) ; (bitvector 48)
  (let ((n1056 (extract 1 1 n1052))) ; (bitvector 1)
  (let ((n1057 (if (bitvector->bool n1056) n1055 n1054))) ; (bitvector 48)
  (let ((n1058 (extract 143 96 n1041))) ; (bitvector 48)
  (let ((n1059 (extract 2 2 n1052))) ; (bitvector 1)
  (let ((n1060 (if (bitvector->bool n1059) n1058 n1057))) ; (bitvector 48)
  (let ((n1061 (extract 191 144 n1041))) ; (bitvector 48)
  (let ((n1062 (extract 3 3 n1052))) ; (bitvector 1)
  (let ((wmux (if (bitvector->bool n1062) n1061 n1060))) ; (bitvector 48)
  (let
    (($and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_806$123$_Y
      (bvand wmux n1036))) ; (bitvector 48)
  (let
    (($or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_805$124$_Y
      (bvor
        $and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_805$122$_Y
        $and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_806$123$_Y))) ; (bitvector 48)
  (let
    (($and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_807$125$_Y
      (bvand smux wmux))) ; (bitvector 48)
  (let
    ((comux_w
      (bvor
        $or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_805$124$_Y
        $and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_807$125$_Y))) ; (bitvector 48)
  (let ((n1068 (extract 10 0 comux_w))) ; (bitvector 11)
  (let ((n1069 (concat n1068 cin))) ; (bitvector 12)
  (let ((n1070 (zero-extend n1069 (bitvector 13)))) ; (bitvector 13)
  (let ((n1071 (concat n1007 (bv #b0 1)))) ; (bitvector 12)
  (let
    ((n1072
      (concat
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_798$115$_Y
        n1071))) ; (bitvector 13)
  (let ((n1073 (concat n1013 n1072))) ; (bitvector 24)
  (let
    ((n1074
      (concat
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_796$117$_Y
        n1073))) ; (bitvector 25)
  (let ((n1075 (concat n1018 n1074))) ; (bitvector 36)
  (let
    ((n1076
      (concat
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_794$119$_Y
        n1075))) ; (bitvector 37)
  (let ((n1077 (extract 46 36 comux))) ; (bitvector 11)
  (let ((n1078 (concat n1077 n1076))) ; (bitvector 48)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_804$120$_Y
      (bvxor smux n1078))) ; (bitvector 48)
  (let
    ((smux_w
      (bvxor
        $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_804$120$_Y
        wmux))) ; (bitvector 48)
  (let ((n1081 (extract 11 0 smux_w))) ; (bitvector 12)
  (let ((n1082 (zero-extend n1081 (bitvector 13)))) ; (bitvector 13)
  (let
    (($add$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_818$128$_Y
      (bvadd n1070 n1082))) ; (bitvector 13)
  (let
    ((n1084
      (extract
        11
        0
        $add$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_818$128$_Y))) ; (bitvector 12)
  (let ((n1085 (extract 11 11 comux_w))) ; (bitvector 1)
  (let
    ((co12_lsb
      (bvand
        $ne$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_794$118_Y
        n1085))) ; (bitvector 1)
  (let ((n1087 (extract 22 12 comux_w))) ; (bitvector 11)
  (let ((n1088 (concat n1087 co12_lsb))) ; (bitvector 12)
  (let ((n1089 (zero-extend n1088 (bitvector 13)))) ; (bitvector 13)
  (let ((n1090 (extract 23 12 smux_w))) ; (bitvector 12)
  (let ((n1091 (zero-extend n1090 (bitvector 13)))) ; (bitvector 13)
  (let
    (($add$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_827$136$_Y
      (bvadd n1089 n1091))) ; (bitvector 13)
  (let
    ((n1093
      (extract
        12
        12
        $add$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_818$128$_Y))) ; (bitvector 1)
  (let
    ((intc1
      (bvand
        $ne$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_794$118_Y
        n1093))) ; (bitvector 1)
  (let ((n1095 (zero-extend intc1 (bitvector 13)))) ; (bitvector 13)
  (let
    (($add$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_827$137$_Y
      (bvadd
        $add$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_827$136$_Y
        n1095))) ; (bitvector 13)
  (let
    ((n1097
      (extract
        11
        0
        $add$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_827$137$_Y))) ; (bitvector 12)
  (let ((n1098 (concat n1097 n1084))) ; (bitvector 24)
  (let ((n1099 (extract 23 23 comux_w))) ; (bitvector 1)
  (let
    ((co24_lsb
      (bvand
        $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_675$82$_Y
        n1099))) ; (bitvector 1)
  (let ((n1101 (extract 34 24 comux_w))) ; (bitvector 11)
  (let ((n1102 (concat n1101 co24_lsb))) ; (bitvector 12)
  (let ((n1103 (zero-extend n1102 (bitvector 13)))) ; (bitvector 13)
  (let ((n1104 (extract 35 24 smux_w))) ; (bitvector 12)
  (let ((n1105 (zero-extend n1104 (bitvector 13)))) ; (bitvector 13)
  (let
    (($add$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_832$145$_Y
      (bvadd n1103 n1105))) ; (bitvector 13)
  (let
    ((n1107
      (extract
        12
        12
        $add$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_827$137$_Y))) ; (bitvector 1)
  (let
    ((intc2
      (bvand
        $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_675$82$_Y
        n1107))) ; (bitvector 1)
  (let ((n1109 (zero-extend intc2 (bitvector 13)))) ; (bitvector 13)
  (let
    (($add$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_832$146$_Y
      (bvadd
        $add$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_832$145$_Y
        n1109))) ; (bitvector 13)
  (let
    ((n1111
      (extract
        11
        0
        $add$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_832$146$_Y))) ; (bitvector 12)
  (let ((n1112 (concat n1111 n1098))) ; (bitvector 36)
  (let ((n1113 (extract 35 35 comux_w))) ; (bitvector 1)
  (let
    ((co36_lsb
      (bvand
        $ne$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_794$118_Y
        n1113))) ; (bitvector 1)
  (let ((n1115 (extract 47 36 comux_w))) ; (bitvector 12)
  (let ((n1116 (concat n1115 co36_lsb))) ; (bitvector 13)
  (let ((n1117 (zero-extend n1116 (bitvector 14)))) ; (bitvector 14)
  (let ((n1118 (extract 47 36 smux_w))) ; (bitvector 12)
  (let ((n1119 (extract 47 47 comux))) ; (bitvector 1)
  (let ((n1120 (concat n1119 n1118))) ; (bitvector 13)
  (let ((n1121 (zero-extend n1120 (bitvector 14)))) ; (bitvector 14)
  (let
    (($add$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_837$154$_Y
      (bvadd n1117 n1121))) ; (bitvector 14)
  (let
    ((n1123
      (extract
        12
        12
        $add$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_832$146$_Y))) ; (bitvector 1)
  (let
    ((intc3
      (bvand
        $ne$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_794$118_Y
        n1123))) ; (bitvector 1)
  (let ((n1125 (zero-extend intc3 (bitvector 14)))) ; (bitvector 14)
  (let
    (($add$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_837$155$_Y
      (bvadd
        $add$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_837$154$_Y
        n1125))) ; (bitvector 14)
  (let
    ((n1127
      (extract
        11
        0
        $add$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_837$155$_Y))) ; (bitvector 12)
  (let ((n1128 (concat n1127 n1112))) ; (bitvector 48)
  (let ((ALU_OUT_in (bvxor n549 n1128))) ; (bitvector 48)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1072$287_Y
      (bvxor
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1061$276$_Y
        ALU_OUT_in))) ; (bitvector 48)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1072$288$_Y
      (bvnot
        $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1072$287_Y))) ; (bitvector 48)
  (let ((MASK (DSP48E2_Inputs-MASK inputs))) ; (bitvector 48)
  (let ((n1133 (extract 45 0 C_DATA_in))) ; (bitvector 46)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1067$282$_Y
      (bvnot n1133))) ; (bitvector 46)
  (let
    ((n1135
      (concat
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1067$282$_Y
        (bv #b00 2)))) ; (bitvector 48)
  (let ((SEL_MASK (DSP48E2_Inputs-SEL_MASK inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_462$49$_Y
      (bool->bitvector (bveq SEL_MASK (bv #b10111 5))))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_462$50$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_462$49$_Y)
        (bv #b11 2)
        (bv #b00 2)))) ; (bitvector 2)
  (let
    (($auto$wreduce.cc_514_run$678
      (concat
        (bv #b000000000000000000000000000000 30)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_462$50$_Y))) ; (bitvector 32)
  (let ((n1141 (extract 1 0 $auto$wreduce.cc_514_run$678))) ; (bitvector 2)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_461$48$_Y
      (bool->bitvector (bveq SEL_MASK (bv #b10110 5))))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_461$51$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_461$48$_Y)
        (bv #b10 2)
        n1141))) ; (bitvector 2)
  (let
    (($auto$wreduce.cc_514_run$677
      (concat
        (bv #b000000000000000000000000000000 30)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_461$51$_Y))) ; (bitvector 32)
  (let ((n1146 (extract 1 0 $auto$wreduce.cc_514_run$677))) ; (bitvector 2)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_460$47$_Y
      (bool->bitvector (bveq SEL_MASK (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_460$52$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_460$47$_Y)
        (bv #b01 2)
        n1146))) ; (bitvector 2)
  (let
    (($auto$wreduce.cc_514_run$676
      (concat
        (bv #b000000000000000000000000000000 30)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_460$52$_Y))) ; (bitvector 32)
  (let ((n1150 (extract 1 0 $auto$wreduce.cc_514_run$676))) ; (bitvector 2)
  (let ((n1152 (zero-extend (bv #b1000 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_459$46$_Y
      (bool->bitvector (bveq SEL_MASK n1152)))) ; (bitvector 1)
  (let
    ((SEL_MASK_BIN
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_459$46$_Y)
        (bv #b00 2)
        n1150))) ; (bitvector 2)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1067$281$_Y
      (bool->bitvector (bveq SEL_MASK_BIN (bv #b11 2))))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1067$283_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1067$281$_Y)
        n1135
        MASK))) ; (bitvector 48)
  (let ((n1157 (extract 46 0 C_DATA_in))) ; (bitvector 47)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1066$280$_Y
      (bvnot n1157))) ; (bitvector 47)
  (let
    ((n1159
      (concat
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1066$280$_Y
        (bv #b0 1)))) ; (bitvector 48)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1066$279$_Y
      (bool->bitvector (bveq SEL_MASK_BIN (bv #b10 2))))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1066$284_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1066$279$_Y)
        n1159
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1067$283_Y))) ; (bitvector 48)
  (let ((n1162 (zero-extend (bv #b1 1) (bitvector 2)))) ; (bitvector 2)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1065$278$_Y
      (bool->bitvector (bveq SEL_MASK_BIN n1162)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1065$285_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1065$278$_Y)
        C_DATA_in
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1066$284_Y))) ; (bitvector 48)
  (let ((USE_PATTERN_DETECT (DSP48E2_Inputs-USE_PATTERN_DETECT inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_478$65$_Y
      (bool->bitvector (bveq USE_PATTERN_DETECT (bv #b10101 5))))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_478$66$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_478$65$_Y)
        (bv #b1 1)
        (bv #b0 1)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_478$66_Y
      (concat
        (bv #b0000000000000000000000000000000 31)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_478$66$_Y))) ; (bitvector 32)
  (let
    ((n1170
      (extract
        0
        0
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_478$66_Y))) ; (bitvector 1)
  (let ((n1172 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_477$64$_Y
      (bool->bitvector (bveq USE_PATTERN_DETECT n1172)))) ; (bitvector 1)
  (let
    ((USE_PATTERN_DETECT_BIN
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_477$64$_Y)
        (bv #b0 1)
        n1170))) ; (bitvector 1)
  (let
    ((the_mask
      (if
        (bitvector->bool USE_PATTERN_DETECT_BIN)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1065$285_Y
        (bv #b111111111111111111111111111111111111111111111111 48)))) ; (bitvector 48)
  (let
    (($or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1072$289$_Y
      (bvor
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1072$288$_Y
        the_mask))) ; (bitvector 48)
  (let
    ((pdet_o
      (apply
        bvand
        (bitvector->bits
          $or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1072$289$_Y)))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$778$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$778 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$780$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$780 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$781
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$782 state))) ; (bitvector 1)
  (let
    ((n1181
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$781
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$783$_Y
      (bool->bitvector (bveq n1181 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((pdet_o_reg2
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$783$_Y)
        $auto$clk2fflogic.cc_102_sample_data$780$_Q
        $auto$clk2fflogic.cc_102_sample_data$778$_Q))) ; (bitvector 1)
  (let ((overflow_data (if (bitvector->bool n468) pdet_o_reg2 pdet_o))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1109$312$_Y
      (bvand auto_reset_pri overflow_data))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$768$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$768 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$770$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$770 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$771
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$772 state))) ; (bitvector 1)
  (let
    ((n1189
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$771
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$773$_Y
      (bool->bitvector (bveq n1189 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((pdet_o_reg1
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$773$_Y)
        $auto$clk2fflogic.cc_102_sample_data$770$_Q
        $auto$clk2fflogic.cc_102_sample_data$768$_Q))) ; (bitvector 1)
  (let ((pdet_o_mux (if (bitvector->bool n468) pdet_o_reg1 pdet_o))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1109$313_Y
      (bvnot pdet_o_mux))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1109$314$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1109$312$_Y
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1109$313_Y))) ; (bitvector 1)
  (let ((AUTORESET_PATDET (DSP48E2_Inputs-AUTORESET_PATDET inputs))) ; (bitvector 5)
  (let ((n1196 (zero-extend (bv #b101 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_410$22$_Y
      (bool->bitvector (bveq AUTORESET_PATDET n1196)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_410$23$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_410$22$_Y)
        (bv #b10 2)
        (bv #b00 2)))) ; (bitvector 2)
  (let
    (($auto$wreduce.cc_514_run$670
      (concat
        (bv #b000000000000000000000000000000 30)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_410$23$_Y))) ; (bitvector 32)
  (let ((n1200 (extract 1 0 $auto$wreduce.cc_514_run$670))) ; (bitvector 2)
  (let ((n1201 (zero-extend (bv #b100 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_409$21$_Y
      (bool->bitvector (bveq AUTORESET_PATDET n1201)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_409$24$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_409$21$_Y)
        (bv #b01 2)
        n1200))) ; (bitvector 2)
  (let
    (($auto$wreduce.cc_514_run$669
      (concat
        (bv #b000000000000000000000000000000 30)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_409$24$_Y))) ; (bitvector 32)
  (let ((n1205 (extract 1 0 $auto$wreduce.cc_514_run$669))) ; (bitvector 2)
  (let ((n1206 (zero-extend (bv #b11 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_408$20$_Y
      (bool->bitvector (bveq AUTORESET_PATDET n1206)))) ; (bitvector 1)
  (let
    ((AUTORESET_PATDET_BIN
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_408$20$_Y)
        (bv #b00 2)
        n1205))) ; (bitvector 2)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1108$311$_Y
      (bool->bitvector (bveq AUTORESET_PATDET_BIN (bv #b10 2))))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1108$315_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1108$311$_Y)
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1109$314$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1107$310$_Y
      (bvand auto_reset_pri pdet_o_mux))) ; (bitvector 1)
  (let ((n1212 (zero-extend (bv #b1 1) (bitvector 2)))) ; (bitvector 2)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1106$309$_Y
      (bool->bitvector (bveq AUTORESET_PATDET_BIN n1212)))) ; (bitvector 1)
  (let
    ((the_auto_reset_patdet
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1106$309$_Y)
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1107$310$_Y
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1108$315_Y))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1081$297$_Y
      (bvor RSTP_in the_auto_reset_patdet))) ; (bitvector 1)
  (let
    (($0_pdetb_o_reg2_0_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1081$297$_Y)
        (bv #b0 1)
        $procmux$501$_Y))) ; (bitvector 1)
  (let
    (($procmux$511$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1086$298$_Y)
        pdet_o_reg1
        pdet_o_reg2))) ; (bitvector 1)
  (let
    (($0_pdet_o_reg2_0_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1081$297$_Y)
        (bv #b0 1)
        $procmux$511$_Y))) ; (bitvector 1)
  (let ((n1219 (extract 0 0 ALUMODE_DATA))) ; (bitvector 1)
  (let ((n1220 (extract 1 1 ALUMODE_DATA))) ; (bitvector 1)
  (let
    (($and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_810$127$_Y
      (bvand n1219 n1220))) ; (bitvector 1)
  (let
    (($procmux$491$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1086$298$_Y)
        $and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_810$127$_Y
        ALUMODE10_reg))) ; (bitvector 1)
  (let
    (($0_ALUMODE10_reg_0_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1081$297$_Y)
        (bv #b0 1)
        $procmux$491$_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_988$241$_Y
      (bool->bitvector (bveq n167 (bv #b10 2))))) ; (bitvector 1)
  (let
    (($procmux$549$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_988$241$_Y)
        B1_DATA_out
        $procmux$546$_Y))) ; (bitvector 18)
  (let ((CEB2 (DSP48E2_Inputs-CEB2 inputs))) ; (bitvector 1)
  (let (($procmux$551$_Y (if (bitvector->bool CEB2) $procmux$549$_Y B2_reg))) ; (bitvector 18)
  (let ((RSTB (DSP48E2_Inputs-RSTB inputs))) ; (bitvector 1)
  (let ((IS_RSTB_INVERTED (DSP48E2_Inputs-IS_RSTB_INVERTED inputs))) ; (bitvector 1)
  (let ((RSTB_in (bvxor RSTB IS_RSTB_INVERTED))) ; (bitvector 1)
  (let
    (($0_B2_reg_17_0_
      (if
        (bitvector->bool RSTB_in)
        (bv #b000000000000000000 18)
        $procmux$551$_Y))) ; (bitvector 18)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_957$228$_Y
      (bool->bitvector (bveq n120 (bv #b10 2))))) ; (bitvector 1)
  (let
    (($procmux$568$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_957$228$_Y)
        A1_reg
        $procmux$565$_Y))) ; (bitvector 30)
  (let ((CEA2 (DSP48E2_Inputs-CEA2 inputs))) ; (bitvector 1)
  (let (($procmux$570$_Y (if (bitvector->bool CEA2) $procmux$568$_Y A2_reg))) ; (bitvector 30)
  (let ((RSTA (DSP48E2_Inputs-RSTA inputs))) ; (bitvector 1)
  (let ((IS_RSTA_INVERTED (DSP48E2_Inputs-IS_RSTA_INVERTED inputs))) ; (bitvector 1)
  (let ((RSTA_in (bvxor RSTA IS_RSTA_INVERTED))) ; (bitvector 1)
  (let ((n1239 (apply bvor (bitvector->bits n120)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_942$222$_Y
      (bvnot n1239))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_942$223$_Y
      (bvor
        RSTA_in
        $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_942$222$_Y))) ; (bitvector 1)
  (let
    (($0_A2_reg_29_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_942$223$_Y)
        (bv #b000000000000000000000000000000 30)
        $procmux$570$_Y))) ; (bitvector 30)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$758$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$758 state))) ; (bitvector 8)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$760$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$760 state))) ; (bitvector 8)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$761
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$762 state))) ; (bitvector 1)
  (let
    ((n1246
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$761
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$763$_Y
      (bool->bitvector (bveq n1246 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((XOR_MX_reg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$763$_Y)
        $auto$clk2fflogic.cc_102_sample_data$760$_Q
        $auto$clk2fflogic.cc_102_sample_data$758$_Q))) ; (bitvector 8)
  (let ((n1249 (extract 5 0 s))) ; (bitvector 6)
  (let
    (($reduce_xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_844$157$_Y
      (apply bvxor (bitvector->bits n1249)))) ; (bitvector 1)
  (let ((USE_WIDEXOR (DSP48E2_Inputs-USE_WIDEXOR inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_489$75$_Y
      (bool->bitvector (bveq USE_WIDEXOR (bv #b11000 5))))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_489$76$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_489$75$_Y)
        (bv #b1 1)
        (bv #b0 1)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_489$76_Y
      (concat
        (bv #b0000000000000000000000000000000 31)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_489$76$_Y))) ; (bitvector 32)
  (let
    ((n1256
      (extract
        0
        0
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_489$76_Y))) ; (bitvector 1)
  (let ((n1258 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_488$74$_Y
      (bool->bitvector (bveq USE_WIDEXOR n1258)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_488$77$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_488$74$_Y)
        (bv #b0 1)
        n1256))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_844$158$_Y
      (if
        (bitvector->bool
          $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_488$77$_Y)
        $reduce_xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_844$157$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n1262 (extract 11 6 s))) ; (bitvector 6)
  (let
    (($reduce_xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_845$159$_Y
      (apply bvxor (bitvector->bits n1262)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_845$160$_Y
      (if
        (bitvector->bool
          $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_488$77$_Y)
        $reduce_xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_845$159$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let
    ((xor_24a
      (bvxor
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_844$158$_Y
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_845$160$_Y))) ; (bitvector 1)
  (let ((XORSIMD (DSP48E2_Inputs-XORSIMD inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_494$79$_Y
      (bool->bitvector (bveq XORSIMD (bv #b11010 5))))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_494$80$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_494$79$_Y)
        (bv #b1 1)
        (bv #b0 1)))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$684
      (concat
        (bv #b0000000000000000000000000000000 31)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_494$80$_Y))) ; (bitvector 32)
  (let ((n1271 (extract 0 0 $auto$wreduce.cc_514_run$684))) ; (bitvector 1)
  (let ((n1273 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_493$78$_Y
      (bool->bitvector (bveq XORSIMD n1273)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_493$81$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_493$78$_Y)
        (bv #b0 1)
        n1271))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_878$193$_Y
      (if
        (bitvector->bool
          $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_493$81$_Y)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_844$158$_Y
        xor_24a))) ; (bitvector 1)
  (let ((n1277 (extract 17 12 s))) ; (bitvector 6)
  (let
    (($reduce_xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_846$161$_Y
      (apply bvxor (bitvector->bits n1277)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_846$162$_Y
      (if
        (bitvector->bool
          $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_488$77$_Y)
        $reduce_xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_846$161$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n1280 (extract 23 18 s))) ; (bitvector 6)
  (let
    (($reduce_xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_847$163$_Y
      (apply bvxor (bitvector->bits n1280)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_847$164$_Y
      (if
        (bitvector->bool
          $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_488$77$_Y)
        $reduce_xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_847$163$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let
    ((xor_24b
      (bvxor
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_846$162$_Y
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_847$164$_Y))) ; (bitvector 1)
  (let ((xor_48a (bvxor xor_24a xor_24b))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_879$194$_Y
      (if
        (bitvector->bool
          $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_493$81$_Y)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_845$160$_Y
        xor_48a))) ; (bitvector 1)
  (let
    ((n1286
      (concat
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_879$194$_Y
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_878$193$_Y))) ; (bitvector 2)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_880$195$_Y
      (if
        (bitvector->bool
          $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_493$81$_Y)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_846$162$_Y
        xor_24b))) ; (bitvector 1)
  (let
    ((n1288
      (concat
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_880$195$_Y
        n1286))) ; (bitvector 3)
  (let ((n1289 (extract 29 24 s))) ; (bitvector 6)
  (let
    (($reduce_xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_848$165$_Y
      (apply bvxor (bitvector->bits n1289)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_848$166$_Y
      (if
        (bitvector->bool
          $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_488$77$_Y)
        $reduce_xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_848$165$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n1292 (extract 35 30 s))) ; (bitvector 6)
  (let
    (($reduce_xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_849$167$_Y
      (apply bvxor (bitvector->bits n1292)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_849$168$_Y
      (if
        (bitvector->bool
          $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_488$77$_Y)
        $reduce_xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_849$167$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let
    ((xor_24c
      (bvxor
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_848$166$_Y
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_849$168$_Y))) ; (bitvector 1)
  (let ((n1296 (extract 41 36 s))) ; (bitvector 6)
  (let
    (($reduce_xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_850$169$_Y
      (apply bvxor (bitvector->bits n1296)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_850$170$_Y
      (if
        (bitvector->bool
          $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_488$77$_Y)
        $reduce_xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_850$169$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n1299 (extract 47 42 s))) ; (bitvector 6)
  (let
    (($reduce_xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_851$171$_Y
      (apply bvxor (bitvector->bits n1299)))) ; (bitvector 1)
  (let
    ((xor_12h
      (if
        (bitvector->bool
          $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_488$77$_Y)
        $reduce_xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_851$171$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let
    ((xor_24d
      (bvxor
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_850$170$_Y
        xor_12h))) ; (bitvector 1)
  (let ((xor_48b (bvxor xor_24c xor_24d))) ; (bitvector 1)
  (let ((xor_96 (bvxor xor_48a xor_48b))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_881$196$_Y
      (if
        (bitvector->bool
          $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_493$81$_Y)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_847$164$_Y
        xor_96))) ; (bitvector 1)
  (let
    ((n1306
      (concat
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_881$196$_Y
        n1288))) ; (bitvector 4)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_882$197$_Y
      (if
        (bitvector->bool
          $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_493$81$_Y)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_848$166$_Y
        xor_24c))) ; (bitvector 1)
  (let
    ((n1308
      (concat
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_882$197$_Y
        n1306))) ; (bitvector 5)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_883$198$_Y
      (if
        (bitvector->bool
          $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_493$81$_Y)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_849$168$_Y
        xor_48b))) ; (bitvector 1)
  (let
    ((n1310
      (concat
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_883$198$_Y
        n1308))) ; (bitvector 6)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_884$199$_Y
      (if
        (bitvector->bool
          $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_493$81$_Y)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_850$170$_Y
        xor_24d))) ; (bitvector 1)
  (let
    ((n1312
      (concat
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_884$199$_Y
        n1310))) ; (bitvector 7)
  (let ((XOR_MX_in (concat xor_12h n1312))) ; (bitvector 8)
  (let ((n1314 (extract 6 0 XOR_MX_in))) ; (bitvector 7)
  (let ((n1315 (concat xor_12h n1314))) ; (bitvector 8)
  (let
    (($procmux$476$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1086$298$_Y)
        n1315
        XOR_MX_reg))) ; (bitvector 8)
  (let
    (($0_XOR_MX_reg_7_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1081$297$_Y)
        (bv #b00000000 8)
        $procmux$476$_Y))) ; (bitvector 8)
  (let
    (($procmux$516$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1086$298$_Y)
        pdet_o
        pdet_o_reg1))) ; (bitvector 1)
  (let
    (($0_pdet_o_reg1_0_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1081$297$_Y)
        (bv #b0 1)
        $procmux$516$_Y))) ; (bitvector 1)
  (let
    (($or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1073$292$_Y
      (bvor
        $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1072$287_Y
        the_mask))) ; (bitvector 48)
  (let
    ((pdetb_o
      (apply
        bvand
        (bitvector->bits
          $or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1073$292$_Y)))) ; (bitvector 1)
  (let
    (($procmux$506$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1086$298$_Y)
        pdetb_o
        pdetb_o_reg1))) ; (bitvector 1)
  (let
    (($0_pdetb_o_reg1_0_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1081$297$_Y)
        (bv #b0 1)
        $procmux$506$_Y))) ; (bitvector 1)
  (let
    (($procmux$481$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1086$298$_Y)
        ALU_OUT_in
        ALU_OUT_reg))) ; (bitvector 48)
  (let
    (($0_ALU_OUT_reg_47_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1081$297$_Y)
        (bv #b000000000000000000000000000000000000000000000000 48)
        $procmux$481$_Y))) ; (bitvector 48)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$738$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$738 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$740$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$740 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$741
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$742 state))) ; (bitvector 1)
  (let
    ((n1330
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK_in_sampled$741
        CLK_in))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$743$_Y
      (bool->bitvector (bveq n1330 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((MULTSIGN_ALU_reg
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$743$_Y)
        $auto$clk2fflogic.cc_102_sample_data$740$_Q
        $auto$clk2fflogic.cc_102_sample_data$738$_Q))) ; (bitvector 1)
  (let
    ((n1333
      (extract
        13
        13
        $add$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_837$155$_Y))) ; (bitvector 1)
  (let
    (($procmux$486$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1086$298$_Y)
        n1333
        MULTSIGN_ALU_reg))) ; (bitvector 1)
  (let
    (($0_MULTSIGN_ALU_reg_0_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1081$297$_Y)
        (bv #b0 1)
        $procmux$486$_Y))) ; (bitvector 1)
  (let ((n1336 (extract 11 11 comux_w))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_820$129$_Y
      (bvxor n1336 n1093))) ; (bitvector 1)
  (let ((n1338 (extract 11 11 comux))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_820$130$_Y
      (bvxor
        $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_820$129$_Y
        n1338))) ; (bitvector 1)
  (let
    ((cout0
      (bvxor
        $and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_810$127$_Y
        $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_820$130$_Y))) ; (bitvector 1)
  (let ((n1341 (extract 3 0 OPMODE_mux))) ; (bitvector 4)
  (let ((n1342 (zero-extend (bv #b101 3) (bitvector 4)))) ; (bitvector 4)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_864$180$_Y
      (bool->bitvector (bveq n1341 n1342)))) ; (bitvector 1)
  (let ((n1344 (extract 3 2 ALUMODE_DATA))) ; (bitvector 2)
  (let
    (($ne$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_864$181_Y
      (apply bvor (bitvector->bits n1344)))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_864$182$_Y
      (bvor
        $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_864$180$_Y
        $ne$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_864$181_Y))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_870$185$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_864$182$_Y)
        (bv #b0 1)
        cout0))) ; (bitvector 1)
  (let ((n1348 (zero-extend (bv #b1 1) (bitvector 2)))) ; (bitvector 2)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_873$186$_Y
      (bool->bitvector (bveq USE_SIMD_BIN n1348)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_875$191$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_873$186$_Y)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_870$185$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n1351 (extract 23 23 comux_w))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_828$138$_Y
      (bvxor n1351 n1107))) ; (bitvector 1)
  (let ((n1353 (extract 23 23 comux))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_828$139$_Y
      (bvxor
        $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_828$138$_Y
        n1353))) ; (bitvector 1)
  (let
    ((cout1
      (bvxor
        $and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_810$127$_Y
        $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_828$139$_Y))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_869$184$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_864$182$_Y)
        (bv #b0 1)
        cout1))) ; (bitvector 1)
  (let
    (($ne$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_874$188$_Y
      (apply bvor (bitvector->bits USE_SIMD_BIN)))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_874$189$_Y
      (if
        (bitvector->bool
          $ne$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_874$188$_Y)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_869$184$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let
    ((n1359
      (concat
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_874$189$_Y
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_875$191$_Y))) ; (bitvector 2)
  (let ((n1360 (extract 35 35 comux_w))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_833$147$_Y
      (bvxor n1360 n1123))) ; (bitvector 1)
  (let ((n1362 (extract 35 35 comux))) ; (bitvector 1)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_833$148$_Y
      (bvxor
        $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_833$147$_Y
        n1362))) ; (bitvector 1)
  (let
    ((cout2
      (bvxor
        $and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_810$127$_Y
        $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_833$148$_Y))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_868$183$_Y
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_864$182$_Y)
        (bv #b0 1)
        cout2))) ; (bitvector 1)
  (let
    (($ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_873$187$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_873$186$_Y)
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_868$183$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let
    ((n1367
      (concat
        $ternary$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_873$187$_Y
        n1359))) ; (bitvector 3)
  (let
    ((n1368
      (extract
        12
        12
        $add$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_837$155$_Y))) ; (bitvector 1)
  (let
    ((cout3
      (bvxor
        $and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_810$127$_Y
        n1368))) ; (bitvector 1)
  (let ((COUT_in (concat cout3 n1367))) ; (bitvector 4)
  (let ((n1371 (extract 2 0 COUT_in))) ; (bitvector 3)
  (let ((n1372 (concat cout3 n1371))) ; (bitvector 4)
  (let
    (($procmux$496$_Y
      (if
        (bitvector->bool
          $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1086$298$_Y)
        n1372
        COUT_reg))) ; (bitvector 4)
  (let
    (($0_COUT_reg_3_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1081$297$_Y)
        (bv #b0000 4)
        $procmux$496$_Y))) ; (bitvector 4)
  (let ((CEB1 (DSP48E2_Inputs-CEB1 inputs))) ; (bitvector 1)
  (let
    (($procmux$559$_Y (if (bitvector->bool CEB1) $procmux$546$_Y B1_DATA_out))) ; (bitvector 18)
  (let ((n1377 (apply bvor (bitvector->bits n167)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_977$237$_Y
      (bvnot n1377))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_977$238$_Y
      (bvor
        RSTB_in
        $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_977$237$_Y))) ; (bitvector 1)
  (let
    (($0_B1_DATA_out_17_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_977$238$_Y)
        (bv #b000000000000000000 18)
        $procmux$559$_Y))) ; (bitvector 18)
  (let ((CEA1 (DSP48E2_Inputs-CEA1 inputs))) ; (bitvector 1)
  (let (($procmux$578$_Y (if (bitvector->bool CEA1) $procmux$565$_Y A1_reg))) ; (bitvector 30)
  (let
    (($0_A1_reg_29_0_
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_942$223$_Y)
        (bv #b000000000000000000000000000000 30)
        $procmux$578$_Y))) ; (bitvector 30)
  (let ((XOROUT (if (bitvector->bool n468) XOR_MX_reg n1315))) ; (bitvector 8)
  (let ((pdetb_o_mux (if (bitvector->bool n468) pdetb_o_reg1 pdetb_o))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1147$339_Y
      (bvnot pdetb_o_mux))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1147$340$_Y
      (bvand
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1109$313_Y
        $not$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1147$339_Y))) ; (bitvector 1)
  (let ((underflow_data (if (bitvector->bool n468) pdetb_o_reg2 pdetb_o))) ; (bitvector 1)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1149$347$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1147$340$_Y
        underflow_data))) ; (bitvector 1)
  (let
    ((UNDERFLOW
      (if
        (bitvector->bool USE_PATTERN_DETECT_BIN)
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1149$347$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((PCOUT (if (bitvector->bool n468) ALU_OUT_reg ALU_OUT_in))) ; (bitvector 48)
  (let
    (($logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1147$341$_Y
      (bvand
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1147$340$_Y
        overflow_data))) ; (bitvector 1)
  (let
    ((OVERFLOW
      (if
        (bitvector->bool USE_PATTERN_DETECT_BIN)
        $logic_and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1147$341$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((MULTSIGNOUT (if (bitvector->bool n468) MULTSIGN_ALU_reg n1333))) ; (bitvector 1)
  (let ((CARRYOUT (if (bitvector->bool n468) COUT_reg n1372))) ; (bitvector 4)
  (let
    (($xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1138$333_Y
      (bvxor
        $and$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_810$127$_Y
        cout3))) ; (bitvector 1)
  (let
    ((CARRYCASCOUT
      (if
        (bitvector->bool n468)
        CCOUT_in
        $xor$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1138$333_Y))) ; (bitvector 1)
  (let ((BCASCREG (DSP48E2_Inputs-BCASCREG inputs))) ; (bitvector 32)
  (let ((n1399 (extract 1 0 BCASCREG))) ; (bitvector 2)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_999$251$_Y
      (bool->bitvector (bveq n1399 n167)))) ; (bitvector 1)
  (let
    ((BCOUT
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_999$251$_Y)
        B2_DATA
        B1_DATA_out))) ; (bitvector 18)
  (let ((ACASCREG (DSP48E2_Inputs-ACASCREG inputs))) ; (bitvector 32)
  (let ((n1403 (extract 1 0 ACASCREG))) ; (bitvector 2)
  (let
    (($eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_970$234$_Y
      (bool->bitvector (bveq n1403 n120)))) ; (bitvector 1)
  (let
    ((ACOUT
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_970$234$_Y)
        A_ALU
        A1_reg))) ; (bitvector 30)
  (cons
    (DSP48E2_Outputs
      XOROUT ; XOROUT
      UNDERFLOW ; UNDERFLOW
      PCOUT ; PCOUT
      pdet_o_mux ; PATTERNDETECT
      pdetb_o_mux ; PATTERNBDETECT
      PCOUT ; P
      OVERFLOW ; OVERFLOW
      MULTSIGNOUT ; MULTSIGNOUT
      CARRYOUT ; CARRYOUT
      CARRYCASCOUT ; CARRYCASCOUT
      BCOUT ; BCOUT
      ACOUT ; ACOUT
    )
    (DSP48E2_State
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$702
      D_DATA_reg ; $auto$clk2fflogic.cc:102:sample_data$698
      $0_D_DATA_reg_26_0_ ; $auto$clk2fflogic.cc:102:sample_data$700
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$712
      INMODE_reg ; $auto$clk2fflogic.cc:102:sample_data$708
      $0_INMODE_reg_4_0_ ; $auto$clk2fflogic.cc:102:sample_data$710
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$692
      AD_DATA_reg ; $auto$clk2fflogic.cc:102:sample_data$688
      $0_AD_DATA_reg_26_0_ ; $auto$clk2fflogic.cc:102:sample_data$690
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$912
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$892
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$882
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$812
      CARRYINSEL_reg ; $auto$clk2fflogic.cc:102:sample_data$908
      $0_CARRYINSEL_reg_2_0_ ; $auto$clk2fflogic.cc:102:sample_data$910
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$822
      CARRYIN_reg ; $auto$clk2fflogic.cc:102:sample_data$888
      $0_CARRYIN_reg_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$890
      qmultcarryin ; $auto$clk2fflogic.cc:102:sample_data$878
      dr_carryin_int ; $auto$clk2fflogic.cc:102:sample_data$880
      U_DATA_reg ; $auto$clk2fflogic.cc:102:sample_data$808
      $0_U_DATA_reg_44_0_ ; $auto$clk2fflogic.cc:102:sample_data$810
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$922
      V_DATA_reg ; $auto$clk2fflogic.cc:102:sample_data$818
      $0_V_DATA_reg_44_0_ ; $auto$clk2fflogic.cc:102:sample_data$820
      OPMODE_reg ; $auto$clk2fflogic.cc:102:sample_data$918
      $0_OPMODE_reg_8_0_ ; $auto$clk2fflogic.cc:102:sample_data$920
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$832
      C_reg ; $auto$clk2fflogic.cc:102:sample_data$828
      $0_C_reg_47_0_ ; $auto$clk2fflogic.cc:102:sample_data$830
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$902
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$802
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$782
      ALUMODE_reg ; $auto$clk2fflogic.cc:102:sample_data$898
      $0_ALUMODE_reg_3_0_ ; $auto$clk2fflogic.cc:102:sample_data$900
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$732
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$842
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$862
      pdetb_o_reg2 ; $auto$clk2fflogic.cc:102:sample_data$798
      $0_pdetb_o_reg2_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$800
      pdet_o_reg2 ; $auto$clk2fflogic.cc:102:sample_data$778
      $0_pdet_o_reg2_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$780
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$762
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$772
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$792
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$752
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$742
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$722
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$852
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$872
      ALUMODE10_reg ; $auto$clk2fflogic.cc:102:sample_data$728
      $0_ALUMODE10_reg_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$730
      B2_reg ; $auto$clk2fflogic.cc:102:sample_data$838
      $0_B2_reg_17_0_ ; $auto$clk2fflogic.cc:102:sample_data$840
      A2_reg ; $auto$clk2fflogic.cc:102:sample_data$858
      $0_A2_reg_29_0_ ; $auto$clk2fflogic.cc:102:sample_data$860
      XOR_MX_reg ; $auto$clk2fflogic.cc:102:sample_data$758
      $0_XOR_MX_reg_7_0_ ; $auto$clk2fflogic.cc:102:sample_data$760
      pdet_o_reg1 ; $auto$clk2fflogic.cc:102:sample_data$768
      $0_pdet_o_reg1_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$770
      pdetb_o_reg1 ; $auto$clk2fflogic.cc:102:sample_data$788
      $0_pdetb_o_reg1_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$790
      ALU_OUT_reg ; $auto$clk2fflogic.cc:102:sample_data$748
      $0_ALU_OUT_reg_47_0_ ; $auto$clk2fflogic.cc:102:sample_data$750
      MULTSIGN_ALU_reg ; $auto$clk2fflogic.cc:102:sample_data$738
      $0_MULTSIGN_ALU_reg_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$740
      COUT_reg ; $auto$clk2fflogic.cc:102:sample_data$718
      $0_COUT_reg_3_0_ ; $auto$clk2fflogic.cc:102:sample_data$720
      B1_DATA_out ; $auto$clk2fflogic.cc:102:sample_data$848
      $0_B1_DATA_out_17_0_ ; $auto$clk2fflogic.cc:102:sample_data$850
      A1_reg ; $auto$clk2fflogic.cc:102:sample_data$868
      $0_A1_reg_29_0_ ; $auto$clk2fflogic.cc:102:sample_data$870
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
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  ))))))))))))))))))))))))))))))))))))))
(define DSP48E2_initial
  (DSP48E2_State
    (bv #b1 1)
    (bv #b000000000000000000000000000 27)
    (bv #b000000000000000000000000000 27)
    (bv #b1 1)
    (bv #b00000 5)
    (bv #b00000 5)
    (bv #b1 1)
    (bv #b000000000000000000000000000 27)
    (bv #b000000000000000000000000000 27)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b000 3)
    (bv #b000 3)
    (bv #b1 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b000000000000000000000000000000000000000000000 45)
    (bv #b000000000000000000000000000000000000000000000 45)
    (bv #b1 1)
    (bv #b000000000000000000000000000000000000000000000 45)
    (bv #b000000000000000000000000000000000000000000000 45)
    (bv #b000000000 9)
    (bv #b000000000 9)
    (bv #b1 1)
    (bv #b000000000000000000000000000000000000000000000000 48)
    (bv #b000000000000000000000000000000000000000000000000 48)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b0000 4)
    (bv #b0000 4)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000000000000000 30)
    (bv #b000000000000000000000000000000 30)
    (bv #b00000000 8)
    (bv #b00000000 8)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b000000000000000000000000000000000000000000000000 48)
    (bv #b000000000000000000000000000000000000000000000000 48)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0000 4)
    (bv #b0000 4)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000000000000000 30)
    (bv #b000000000000000000000000000000 30)))
