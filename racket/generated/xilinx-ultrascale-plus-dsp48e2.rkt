#lang rosette/safe
(provide (struct-out DSP48E2_Inputs)
         (struct-out DSP48E2_Outputs)
         (struct-out DSP48E2_State)
         DSP48E2)
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
  ($auto$clk2fflogic.cc_102_sample_data$700
    $auto$clk2fflogic.cc_102_sample_data$698
    $auto$clk2fflogic.cc_102_sample_data$710
    $auto$clk2fflogic.cc_102_sample_data$708
    $auto$clk2fflogic.cc_102_sample_data$690
    $auto$clk2fflogic.cc_102_sample_data$688
    $auto$clk2fflogic.cc_102_sample_data$910
    $auto$clk2fflogic.cc_102_sample_data$908
    $auto$clk2fflogic.cc_102_sample_data$890
    $auto$clk2fflogic.cc_102_sample_data$888
    $auto$clk2fflogic.cc_102_sample_data$880
    $auto$clk2fflogic.cc_102_sample_data$878
    $auto$clk2fflogic.cc_102_sample_data$810
    $auto$clk2fflogic.cc_102_sample_data$808
    $auto$clk2fflogic.cc_102_sample_data$820
    $auto$clk2fflogic.cc_102_sample_data$818
    $auto$clk2fflogic.cc_102_sample_data$920
    $auto$clk2fflogic.cc_102_sample_data$918
    $auto$clk2fflogic.cc_102_sample_data$830
    $auto$clk2fflogic.cc_102_sample_data$828
    $auto$clk2fflogic.cc_102_sample_data$900
    $auto$clk2fflogic.cc_102_sample_data$898
    $auto$clk2fflogic.cc_102_sample_data$800
    $auto$clk2fflogic.cc_102_sample_data$798
    $auto$clk2fflogic.cc_102_sample_data$780
    $auto$clk2fflogic.cc_102_sample_data$778
    $auto$clk2fflogic.cc_86_sample_control_edge$692
    $auto$clk2fflogic.cc_102_sample_data$730
    $auto$clk2fflogic.cc_102_sample_data$728
    $auto$clk2fflogic.cc_102_sample_data$840
    $auto$clk2fflogic.cc_102_sample_data$838
    $auto$clk2fflogic.cc_102_sample_data$860
    $auto$clk2fflogic.cc_102_sample_data$858
    $auto$clk2fflogic.cc_102_sample_data$760
    $auto$clk2fflogic.cc_102_sample_data$758
    $auto$clk2fflogic.cc_102_sample_data$770
    $auto$clk2fflogic.cc_102_sample_data$768
    $auto$clk2fflogic.cc_102_sample_data$790
    $auto$clk2fflogic.cc_102_sample_data$788
    $auto$clk2fflogic.cc_102_sample_data$750
    $auto$clk2fflogic.cc_102_sample_data$748
    $auto$clk2fflogic.cc_102_sample_data$740
    $auto$clk2fflogic.cc_102_sample_data$738
    $auto$clk2fflogic.cc_102_sample_data$720
    $auto$clk2fflogic.cc_102_sample_data$718
    $auto$clk2fflogic.cc_102_sample_data$850
    $auto$clk2fflogic.cc_102_sample_data$848
    $auto$clk2fflogic.cc_102_sample_data$870
    $auto$clk2fflogic.cc_102_sample_data$868)
  #:transparent
  ; $auto$clk2fflogic.cc_102_sample_data$700 (bitvector 27)
  ; $auto$clk2fflogic.cc_102_sample_data$698 (bitvector 27)
  ; $auto$clk2fflogic.cc_102_sample_data$710 (bitvector 5)
  ; $auto$clk2fflogic.cc_102_sample_data$708 (bitvector 5)
  ; $auto$clk2fflogic.cc_102_sample_data$690 (bitvector 27)
  ; $auto$clk2fflogic.cc_102_sample_data$688 (bitvector 27)
  ; $auto$clk2fflogic.cc_102_sample_data$910 (bitvector 3)
  ; $auto$clk2fflogic.cc_102_sample_data$908 (bitvector 3)
  ; $auto$clk2fflogic.cc_102_sample_data$890 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$888 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$880 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$878 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$810 (bitvector 45)
  ; $auto$clk2fflogic.cc_102_sample_data$808 (bitvector 45)
  ; $auto$clk2fflogic.cc_102_sample_data$820 (bitvector 45)
  ; $auto$clk2fflogic.cc_102_sample_data$818 (bitvector 45)
  ; $auto$clk2fflogic.cc_102_sample_data$920 (bitvector 9)
  ; $auto$clk2fflogic.cc_102_sample_data$918 (bitvector 9)
  ; $auto$clk2fflogic.cc_102_sample_data$830 (bitvector 48)
  ; $auto$clk2fflogic.cc_102_sample_data$828 (bitvector 48)
  ; $auto$clk2fflogic.cc_102_sample_data$900 (bitvector 4)
  ; $auto$clk2fflogic.cc_102_sample_data$898 (bitvector 4)
  ; $auto$clk2fflogic.cc_102_sample_data$800 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$798 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$780 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$778 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$692 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$730 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$728 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$840 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$838 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$860 (bitvector 30)
  ; $auto$clk2fflogic.cc_102_sample_data$858 (bitvector 30)
  ; $auto$clk2fflogic.cc_102_sample_data$760 (bitvector 8)
  ; $auto$clk2fflogic.cc_102_sample_data$758 (bitvector 8)
  ; $auto$clk2fflogic.cc_102_sample_data$770 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$768 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$790 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$788 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$750 (bitvector 48)
  ; $auto$clk2fflogic.cc_102_sample_data$748 (bitvector 48)
  ; $auto$clk2fflogic.cc_102_sample_data$740 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$738 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$720 (bitvector 4)
  ; $auto$clk2fflogic.cc_102_sample_data$718 (bitvector 4)
  ; $auto$clk2fflogic.cc_102_sample_data$850 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$848 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$870 (bitvector 30)
  ; $auto$clk2fflogic.cc_102_sample_data$868 (bitvector 30)
)
(define (DSP48E2 inputs state)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$698$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$698 state))) ; (bitvector 27)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$700$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$700 state))) ; (bitvector 27)
  (let ((CLK (DSP48E2_Inputs-CLK inputs))) ; (bitvector 1)
  (let ((IS_CLK_INVERTED (DSP48E2_Inputs-IS_CLK_INVERTED inputs))) ; (bitvector 1)
  (let ((CLK_in (bvxor CLK IS_CLK_INVERTED))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_86_sample_control_edge$692$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_86_sample_control_edge$692 state))) ; (bitvector 1)
  (let
    ((n6 (concat $auto$clk2fflogic.cc_86_sample_control_edge$692$_Q CLK_in))) ; (bitvector 2)
  (let ((n8 (zero-extend (bv #b1 1) (bitvector 2)))) ; (bitvector 2)
  (let (($auto$rtlil.cc_2835_Eqx$694 (bool->bitvector (bveq n6 n8)))) ; (bitvector 1)
  (let
    ((D_DATA_reg
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
        $auto$clk2fflogic.cc_102_sample_data$700$_Q
        $auto$clk2fflogic.cc_102_sample_data$698$_Q))) ; (bitvector 27)
  (let ((D (DSP48E2_Inputs-D inputs))) ; (bitvector 27)
  (let ((CED (DSP48E2_Inputs-CED inputs))) ; (bitvector 1)
  (let (($procmux$442$_Y (if (bitvector->bool CED) D D_DATA_reg))) ; (bitvector 27)
  (let ((RSTD (DSP48E2_Inputs-RSTD inputs))) ; (bitvector 1)
  (let ((IS_RSTD_INVERTED (DSP48E2_Inputs-IS_RSTD_INVERTED inputs))) ; (bitvector 1)
  (let ((RSTD_in (bvxor RSTD IS_RSTD_INVERTED))) ; (bitvector 1)
  (let ((DREG (DSP48E2_Inputs-DREG inputs))) ; (bitvector 32)
  (let ((n19 (extract 0 0 DREG))) ; (bitvector 1)
  (let ((AMULTSEL (DSP48E2_Inputs-AMULTSEL inputs))) ; (bitvector 5)
  (let ((n23 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_402$17$_Y
      (bool->bitvector (bveq AMULTSEL n23)))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$668
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_402$17$_Y)
        (bv #b1 1)
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n27 (concat (bv #b00000000000 11) AMULTSEL))) ; (bitvector 16)
  (let ((n28 (apply bvor (bitvector->bits n27)))) ; (bitvector 1)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_401$16$_Y
      (bvnot n28))) ; (bitvector 1)
  (let
    ((AMULTSEL_BIN
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_401$16$_Y)
        (bv #b0 1)
        $auto$wreduce.cc_514_run$668))) ; (bitvector 1)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1159$354$_Y
      (bvnot AMULTSEL_BIN))) ; (bitvector 1)
  (let ((BMULTSEL (DSP48E2_Inputs-BMULTSEL inputs))) ; (bitvector 5)
  (let ((n33 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_427$35$_Y
      (bool->bitvector (bveq BMULTSEL n33)))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$673
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_427$35$_Y)
        (bv #b1 1)
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n36 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_426$34$_Y
      (bool->bitvector (bveq BMULTSEL n36)))) ; (bitvector 1)
  (let
    ((BMULTSEL_BIN
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_426$34$_Y)
        (bv #b0 1)
        $auto$wreduce.cc_514_run$673))) ; (bitvector 1)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1160$355$_Y
      (bvnot BMULTSEL_BIN))) ; (bitvector 1)
  (let
    (($logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1159$356$_Y
      (bvand
        $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1159$354$_Y
        $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1160$355$_Y))) ; (bitvector 1)
  (let ((USE_MULT (DSP48E2_Inputs-USE_MULT inputs))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_473$60$_Y
      (bool->bitvector (bveq USE_MULT (bv #b10100 5))))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$681
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_473$60$_Y)
        (bv #b10 2)
        (bv #b00 2)))) ; (bitvector 2)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_472$59$_Y
      (bool->bitvector (bveq USE_MULT (bv #b10010 5))))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$680
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_472$59$_Y)
        (bv #b01 2)
        $auto$wreduce.cc_514_run$681))) ; (bitvector 2)
  (let ((n51 (zero-extend (bv #b1010 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_471$58$_Y
      (bool->bitvector (bveq USE_MULT n51)))) ; (bitvector 1)
  (let
    ((USE_MULT_BIN
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_471$58$_Y)
        (bv #b00 2)
        $auto$wreduce.cc_514_run$680))) ; (bitvector 2)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1033$266$_Y
      (bool->bitvector (bveq USE_MULT_BIN (bv #b10 2))))) ; (bitvector 1)
  (let
    (($logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1159$358$_Y
      (bvor
        $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1159$356$_Y
        $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1033$266$_Y))) ; (bitvector 1)
  (let
    ((DREG_INT
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1159$358$_Y)
        (bv #b0 1)
        n19))) ; (bitvector 1)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1209$381$_Y
      (bvnot DREG_INT))) ; (bitvector 1)
  (let
    (($logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1209$382$_Y
      (bvor
        RSTD_in
        $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1209$381$_Y))) ; (bitvector 1)
  (let
    (($0_D_DATA_reg_26_0_
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1209$382$_Y)
        (bv #b000000000000000000000000000 27)
        $procmux$442$_Y))) ; (bitvector 27)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$708$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$708 state))) ; (bitvector 5)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$710$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$710 state))) ; (bitvector 5)
  (let
    ((INMODE_reg
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
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
  (let ((n73 (extract 0 0 INMODEREG))) ; (bitvector 1)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1195$376$_Y
      (bvnot n73))) ; (bitvector 1)
  (let
    (($logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1195$377$_Y
      (bvor
        RSTINMODE_in
        $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1195$376$_Y))) ; (bitvector 1)
  (let
    (($0_INMODE_reg_4_0_
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1195$377$_Y)
        (bv #b00000 5)
        $procmux$447$_Y))) ; (bitvector 5)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$688$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$688 state))) ; (bitvector 27)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$690$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$690 state))) ; (bitvector 27)
  (let
    ((AD_DATA_reg
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
        $auto$clk2fflogic.cc_102_sample_data$690$_Q
        $auto$clk2fflogic.cc_102_sample_data$688$_Q))) ; (bitvector 27)
  (let ((D_DATA (if (bitvector->bool DREG_INT) D_DATA_reg D))) ; (bitvector 27)
  (let ((INMODE_mux (if (bitvector->bool n73) INMODE_reg INMODE_in))) ; (bitvector 5)
  (let ((n82 (extract 2 2 INMODE_mux))) ; (bitvector 1)
  (let
    ((D_DATA_mux
      (if (bitvector->bool n82) D_DATA (bv #b000000000000000000000000000 27)))) ; (bitvector 27)
  (let ((A (DSP48E2_Inputs-A inputs))) ; (bitvector 30)
  (let ((ACIN (DSP48E2_Inputs-ACIN inputs))) ; (bitvector 30)
  (let ((A_INPUT (DSP48E2_Inputs-A_INPUT inputs))) ; (bitvector 5)
  (let ((n88 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_420$31$_Y
      (bool->bitvector (bveq A_INPUT n88)))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$672
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_420$31$_Y)
        (bv #b1 1)
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n92 (zero-extend (bv #b111 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_419$30$_Y
      (bool->bitvector (bveq A_INPUT n92)))) ; (bitvector 1)
  (let
    ((A_INPUT_BIN
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_419$30$_Y)
        (bv #b0 1)
        $auto$wreduce.cc_514_run$672))) ; (bitvector 1)
  (let (($procmux$565$_Y (if (bitvector->bool A_INPUT_BIN) ACIN A))) ; (bitvector 30)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$858$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$858 state))) ; (bitvector 30)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$860$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$860 state))) ; (bitvector 30)
  (let
    ((A2_reg
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
        $auto$clk2fflogic.cc_102_sample_data$860$_Q
        $auto$clk2fflogic.cc_102_sample_data$858$_Q))) ; (bitvector 30)
  (let ((AREG (DSP48E2_Inputs-AREG inputs))) ; (bitvector 32)
  (let ((n100 (extract 1 0 AREG))) ; (bitvector 2)
  (let
    (($ne$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_967$230$_Y
      (apply bvor (bitvector->bits n100)))) ; (bitvector 1)
  (let
    ((A_ALU
      (if
        (bitvector->bool
          $ne$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_967$230$_Y)
        A2_reg
        $procmux$565$_Y))) ; (bitvector 30)
  (let ((n103 (extract 26 0 A_ALU))) ; (bitvector 27)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$868$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$868 state))) ; (bitvector 30)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$870$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$870 state))) ; (bitvector 30)
  (let
    ((A1_reg
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
        $auto$clk2fflogic.cc_102_sample_data$870$_Q
        $auto$clk2fflogic.cc_102_sample_data$868$_Q))) ; (bitvector 30)
  (let ((n107 (extract 26 0 A1_reg))) ; (bitvector 27)
  (let ((n108 (extract 0 0 INMODE_mux))) ; (bitvector 1)
  (let (($procmux$462$_Y (if (bitvector->bool n108) n107 n103))) ; (bitvector 27)
  (let ((PREADDINSEL (DSP48E2_Inputs-PREADDINSEL inputs))) ; (bitvector 5)
  (let ((n111 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_453$43$_Y
      (bool->bitvector (bveq PREADDINSEL n111)))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$675
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_453$43$_Y)
        (bv #b1 1)
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n115 (concat (bv #b000 3) PREADDINSEL))) ; (bitvector 8)
  (let ((n116 (apply bvor (bitvector->bits n115)))) ; (bitvector 1)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_452$42$_Y
      (bvnot n116))) ; (bitvector 1)
  (let
    ((PREADDINSEL_BIN
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_452$42$_Y)
        (bv #b0 1)
        $auto$wreduce.cc_514_run$675))) ; (bitvector 1)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1178$366$_Y
      (bvnot PREADDINSEL_BIN))) ; (bitvector 1)
  (let ((n120 (extract 1 1 INMODE_mux))) ; (bitvector 1)
  (let
    (($logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1178$367$_Y
      (bvand
        $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1178$366$_Y
        n120))) ; (bitvector 1)
  (let
    (($procmux$468$_Y
      (if
        (bitvector->bool
          $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1178$367$_Y)
        (bv #b000000000000000000000000000 27)
        $procmux$462$_Y))) ; (bitvector 27)
  (let ((B (DSP48E2_Inputs-B inputs))) ; (bitvector 18)
  (let ((BCIN (DSP48E2_Inputs-BCIN inputs))) ; (bitvector 18)
  (let ((B_INPUT (DSP48E2_Inputs-B_INPUT inputs))) ; (bitvector 5)
  (let ((n126 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_434$39$_Y
      (bool->bitvector (bveq B_INPUT n126)))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$674
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_434$39$_Y)
        (bv #b1 1)
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n129 (zero-extend (bv #b111 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_433$38$_Y
      (bool->bitvector (bveq B_INPUT n129)))) ; (bitvector 1)
  (let
    ((B_INPUT_BIN
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_433$38$_Y)
        (bv #b0 1)
        $auto$wreduce.cc_514_run$674))) ; (bitvector 1)
  (let (($procmux$546$_Y (if (bitvector->bool B_INPUT_BIN) BCIN B))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$838$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$838 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$840$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$840 state))) ; (bitvector 18)
  (let
    ((B2_reg
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
        $auto$clk2fflogic.cc_102_sample_data$840$_Q
        $auto$clk2fflogic.cc_102_sample_data$838$_Q))) ; (bitvector 18)
  (let ((BREG (DSP48E2_Inputs-BREG inputs))) ; (bitvector 32)
  (let ((n137 (extract 1 0 BREG))) ; (bitvector 2)
  (let
    (($ne$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_994$243$_Y
      (apply bvor (bitvector->bits n137)))) ; (bitvector 1)
  (let
    ((B2_DATA
      (if
        (bitvector->bool
          $ne$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_994$243$_Y)
        B2_reg
        $procmux$546$_Y))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$848$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$848 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$850$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$850 state))) ; (bitvector 18)
  (let
    ((B1_DATA_out
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
        $auto$clk2fflogic.cc_102_sample_data$850$_Q
        $auto$clk2fflogic.cc_102_sample_data$848$_Q))) ; (bitvector 18)
  (let ((n143 (extract 4 4 INMODE_mux))) ; (bitvector 1)
  (let (($procmux$453$_Y (if (bitvector->bool n143) B1_DATA_out B2_DATA))) ; (bitvector 18)
  (let
    (($logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1183$371$_Y
      (bvand PREADDINSEL_BIN n120))) ; (bitvector 1)
  (let
    (($procmux$459$_Y
      (if
        (bitvector->bool
          $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1183$371$_Y)
        (bv #b000000000000000000 18)
        $procmux$453$_Y))) ; (bitvector 18)
  (let ((n148 (extract 17 17 $procmux$459$_Y))) ; (bitvector 1)
  (let ((n149 (concat n148 $procmux$459$_Y))) ; (bitvector 19)
  (let ((n150 (concat n148 n149))) ; (bitvector 20)
  (let ((n151 (concat n148 n150))) ; (bitvector 21)
  (let ((n152 (concat n148 n151))) ; (bitvector 22)
  (let ((n153 (concat n148 n152))) ; (bitvector 23)
  (let ((n154 (concat n148 n153))) ; (bitvector 24)
  (let ((n155 (concat n148 n154))) ; (bitvector 25)
  (let ((n156 (concat n148 n155))) ; (bitvector 26)
  (let ((n157 (concat n148 n156))) ; (bitvector 27)
  (let
    ((PREADD_AB (if (bitvector->bool PREADDINSEL_BIN) n157 $procmux$468$_Y))) ; (bitvector 27)
  (let
    (($add$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1155$351$_Y
      (bvadd D_DATA_mux PREADD_AB))) ; (bitvector 27)
  (let
    (($sub$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1155$350$_Y
      (bvsub D_DATA_mux PREADD_AB))) ; (bitvector 27)
  (let ((n161 (extract 3 3 INMODE_mux))) ; (bitvector 1)
  (let
    ((AD_in
      (if
        (bitvector->bool n161)
        $sub$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1155$350$_Y
        $add$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1155$351$_Y))) ; (bitvector 27)
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
    ((CARRYINSEL_reg
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
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
    ((CARRYIN_reg
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
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
    ((qmultcarryin
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
        $auto$clk2fflogic.cc_102_sample_data$880$_Q
        $auto$clk2fflogic.cc_102_sample_data$878$_Q))) ; (bitvector 1)
  (let ((ADREG (DSP48E2_Inputs-ADREG inputs))) ; (bitvector 32)
  (let ((n192 (extract 0 0 ADREG))) ; (bitvector 1)
  (let
    (($procmux$471$_Y
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1159$358$_Y)
        (bv #b0 1)
        n192))) ; (bitvector 1)
  (let ((AD_DATA (if (bitvector->bool $procmux$471$_Y) AD_DATA_reg AD_in))) ; (bitvector 27)
  (let
    ((a_mult_mux (if (bitvector->bool AMULTSEL_BIN) AD_DATA $procmux$468$_Y))) ; (bitvector 27)
  (let ((n196 (extract 26 26 a_mult_mux))) ; (bitvector 1)
  (let ((n197 (extract 17 0 AD_DATA))) ; (bitvector 18)
  (let ((b_mult_mux (if (bitvector->bool BMULTSEL_BIN) n197 $procmux$459$_Y))) ; (bitvector 18)
  (let ((n199 (extract 17 17 b_mult_mux))) ; (bitvector 1)
  (let
    (($xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_902$203_Y
      (bvxor n196 n199))) ; (bitvector 1)
  (let
    (($logic_not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_902$204$_Y
      (bvnot
        $xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_902$203_Y))) ; (bitvector 1)
  (let ((CEM (DSP48E2_Inputs-CEM inputs))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_905$205$_Y
      (if
        (bitvector->bool CEM)
        $logic_not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_902$204$_Y
        qmultcarryin))) ; (bitvector 1)
  (let
    ((dr_carryin_int
      (if
        (bitvector->bool rst_carryin_g)
        (bv #b0 1)
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_905$205$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$808$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$808 state))) ; (bitvector 45)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$810$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$810 state))) ; (bitvector 45)
  (let
    ((U_DATA_reg
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
        $auto$clk2fflogic.cc_102_sample_data$810$_Q
        $auto$clk2fflogic.cc_102_sample_data$808$_Q))) ; (bitvector 45)
  (let ((n208 (sign-extend a_mult_mux (bitvector 45)))) ; (bitvector 45)
  (let ((n209 (sign-extend b_mult_mux (bitvector 45)))) ; (bitvector 45)
  (let
    (($mul$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1034$267$_Y
      (bvmul n208 n209))) ; (bitvector 45)
  (let
    ((mult
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1033$266$_Y)
        (bv #b000000000000000000000000000000000000000000000 45)
        $mul$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1034$267$_Y))) ; (bitvector 45)
  (let ((n213 (extract 0 0 mult))) ; (bitvector 1)
  (let ((n214 (concat (bv #b0 1) n213))) ; (bitvector 2)
  (let ((n215 (extract 2 2 mult))) ; (bitvector 1)
  (let ((n216 (concat n215 n214))) ; (bitvector 3)
  (let ((n217 (concat (bv #b0 1) n216))) ; (bitvector 4)
  (let ((n218 (extract 4 4 mult))) ; (bitvector 1)
  (let ((n219 (concat n218 n217))) ; (bitvector 5)
  (let ((n220 (concat (bv #b0 1) n219))) ; (bitvector 6)
  (let ((n221 (extract 6 6 mult))) ; (bitvector 1)
  (let ((n222 (concat n221 n220))) ; (bitvector 7)
  (let ((n223 (concat (bv #b0 1) n222))) ; (bitvector 8)
  (let ((n224 (extract 8 8 mult))) ; (bitvector 1)
  (let ((n225 (concat n224 n223))) ; (bitvector 9)
  (let ((n226 (concat (bv #b0 1) n225))) ; (bitvector 10)
  (let ((n227 (extract 10 10 mult))) ; (bitvector 1)
  (let ((n228 (concat n227 n226))) ; (bitvector 11)
  (let ((n229 (concat (bv #b0 1) n228))) ; (bitvector 12)
  (let ((n230 (extract 12 12 mult))) ; (bitvector 1)
  (let ((n231 (concat n230 n229))) ; (bitvector 13)
  (let ((n232 (concat (bv #b0 1) n231))) ; (bitvector 14)
  (let ((n233 (extract 14 14 mult))) ; (bitvector 1)
  (let ((n234 (concat n233 n232))) ; (bitvector 15)
  (let ((n235 (concat (bv #b0 1) n234))) ; (bitvector 16)
  (let ((n236 (extract 16 16 mult))) ; (bitvector 1)
  (let ((n237 (concat n236 n235))) ; (bitvector 17)
  (let ((n238 (concat (bv #b0 1) n237))) ; (bitvector 18)
  (let ((n239 (extract 18 18 mult))) ; (bitvector 1)
  (let ((n240 (concat n239 n238))) ; (bitvector 19)
  (let ((n241 (concat (bv #b0 1) n240))) ; (bitvector 20)
  (let ((n242 (extract 20 20 mult))) ; (bitvector 1)
  (let ((n243 (concat n242 n241))) ; (bitvector 21)
  (let ((n244 (concat (bv #b0 1) n243))) ; (bitvector 22)
  (let ((n245 (extract 22 22 mult))) ; (bitvector 1)
  (let ((n246 (concat n245 n244))) ; (bitvector 23)
  (let ((n247 (concat (bv #b0 1) n246))) ; (bitvector 24)
  (let ((n248 (extract 24 24 mult))) ; (bitvector 1)
  (let ((n249 (concat n248 n247))) ; (bitvector 25)
  (let ((n250 (concat (bv #b0 1) n249))) ; (bitvector 26)
  (let ((n251 (extract 26 26 mult))) ; (bitvector 1)
  (let ((n252 (concat n251 n250))) ; (bitvector 27)
  (let ((n253 (concat (bv #b0 1) n252))) ; (bitvector 28)
  (let ((n254 (extract 28 28 mult))) ; (bitvector 1)
  (let ((n255 (concat n254 n253))) ; (bitvector 29)
  (let ((n256 (concat (bv #b0 1) n255))) ; (bitvector 30)
  (let ((n257 (extract 30 30 mult))) ; (bitvector 1)
  (let ((n258 (concat n257 n256))) ; (bitvector 31)
  (let ((n259 (concat (bv #b0 1) n258))) ; (bitvector 32)
  (let ((n260 (extract 32 32 mult))) ; (bitvector 1)
  (let ((n261 (concat n260 n259))) ; (bitvector 33)
  (let ((n262 (concat (bv #b0 1) n261))) ; (bitvector 34)
  (let ((n263 (extract 34 34 mult))) ; (bitvector 1)
  (let ((n264 (concat n263 n262))) ; (bitvector 35)
  (let ((n265 (concat (bv #b0 1) n264))) ; (bitvector 36)
  (let ((n266 (extract 36 36 mult))) ; (bitvector 1)
  (let ((n267 (concat n266 n265))) ; (bitvector 37)
  (let ((n268 (concat (bv #b0 1) n267))) ; (bitvector 38)
  (let ((n269 (extract 38 38 mult))) ; (bitvector 1)
  (let ((n270 (concat n269 n268))) ; (bitvector 39)
  (let ((n271 (concat (bv #b0 1) n270))) ; (bitvector 40)
  (let ((n272 (extract 40 40 mult))) ; (bitvector 1)
  (let ((n273 (concat n272 n271))) ; (bitvector 41)
  (let ((n274 (concat (bv #b0 1) n273))) ; (bitvector 42)
  (let ((n275 (extract 42 42 mult))) ; (bitvector 1)
  (let ((n276 (concat n275 n274))) ; (bitvector 43)
  (let ((n277 (concat (bv #b10 2) n276))) ; (bitvector 45)
  (let (($procmux$526$_Y (if (bitvector->bool CEM) n277 U_DATA_reg))) ; (bitvector 45)
  (let ((RSTM (DSP48E2_Inputs-RSTM inputs))) ; (bitvector 1)
  (let ((IS_RSTM_INVERTED (DSP48E2_Inputs-IS_RSTM_INVERTED inputs))) ; (bitvector 1)
  (let ((RSTM_in (bvxor RSTM IS_RSTM_INVERTED))) ; (bitvector 1)
  (let ((MREG (DSP48E2_Inputs-MREG inputs))) ; (bitvector 32)
  (let ((n283 (extract 0 0 MREG))) ; (bitvector 1)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1043$269$_Y
      (bvnot n283))) ; (bitvector 1)
  (let
    (($logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1043$270$_Y
      (bvor
        RSTM_in
        $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1043$269$_Y))) ; (bitvector 1)
  (let
    (($0_U_DATA_reg_44_0_
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1043$270$_Y)
        (bv #b000000000000000000000000000000000000000000000 45)
        $procmux$526$_Y))) ; (bitvector 45)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$818$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$818 state))) ; (bitvector 45)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$820$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$820 state))) ; (bitvector 45)
  (let
    ((V_DATA_reg
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
        $auto$clk2fflogic.cc_102_sample_data$820$_Q
        $auto$clk2fflogic.cc_102_sample_data$818$_Q))) ; (bitvector 45)
  (let ((n290 (extract 1 1 mult))) ; (bitvector 1)
  (let ((n291 (concat n290 (bv #b0 1)))) ; (bitvector 2)
  (let ((n292 (concat (bv #b0 1) n291))) ; (bitvector 3)
  (let ((n293 (extract 3 3 mult))) ; (bitvector 1)
  (let ((n294 (concat n293 n292))) ; (bitvector 4)
  (let ((n295 (concat (bv #b0 1) n294))) ; (bitvector 5)
  (let ((n296 (extract 5 5 mult))) ; (bitvector 1)
  (let ((n297 (concat n296 n295))) ; (bitvector 6)
  (let ((n298 (concat (bv #b0 1) n297))) ; (bitvector 7)
  (let ((n299 (extract 7 7 mult))) ; (bitvector 1)
  (let ((n300 (concat n299 n298))) ; (bitvector 8)
  (let ((n301 (concat (bv #b0 1) n300))) ; (bitvector 9)
  (let ((n302 (extract 9 9 mult))) ; (bitvector 1)
  (let ((n303 (concat n302 n301))) ; (bitvector 10)
  (let ((n304 (concat (bv #b0 1) n303))) ; (bitvector 11)
  (let ((n305 (extract 11 11 mult))) ; (bitvector 1)
  (let ((n306 (concat n305 n304))) ; (bitvector 12)
  (let ((n307 (concat (bv #b0 1) n306))) ; (bitvector 13)
  (let ((n308 (extract 13 13 mult))) ; (bitvector 1)
  (let ((n309 (concat n308 n307))) ; (bitvector 14)
  (let ((n310 (concat (bv #b0 1) n309))) ; (bitvector 15)
  (let ((n311 (extract 15 15 mult))) ; (bitvector 1)
  (let ((n312 (concat n311 n310))) ; (bitvector 16)
  (let ((n313 (concat (bv #b0 1) n312))) ; (bitvector 17)
  (let ((n314 (extract 17 17 mult))) ; (bitvector 1)
  (let ((n315 (concat n314 n313))) ; (bitvector 18)
  (let ((n316 (concat (bv #b0 1) n315))) ; (bitvector 19)
  (let ((n317 (extract 19 19 mult))) ; (bitvector 1)
  (let ((n318 (concat n317 n316))) ; (bitvector 20)
  (let ((n319 (concat (bv #b0 1) n318))) ; (bitvector 21)
  (let ((n320 (extract 21 21 mult))) ; (bitvector 1)
  (let ((n321 (concat n320 n319))) ; (bitvector 22)
  (let ((n322 (concat (bv #b0 1) n321))) ; (bitvector 23)
  (let ((n323 (extract 23 23 mult))) ; (bitvector 1)
  (let ((n324 (concat n323 n322))) ; (bitvector 24)
  (let ((n325 (concat (bv #b0 1) n324))) ; (bitvector 25)
  (let ((n326 (extract 25 25 mult))) ; (bitvector 1)
  (let ((n327 (concat n326 n325))) ; (bitvector 26)
  (let ((n328 (concat (bv #b0 1) n327))) ; (bitvector 27)
  (let ((n329 (extract 27 27 mult))) ; (bitvector 1)
  (let ((n330 (concat n329 n328))) ; (bitvector 28)
  (let ((n331 (concat (bv #b0 1) n330))) ; (bitvector 29)
  (let ((n332 (extract 29 29 mult))) ; (bitvector 1)
  (let ((n333 (concat n332 n331))) ; (bitvector 30)
  (let ((n334 (concat (bv #b0 1) n333))) ; (bitvector 31)
  (let ((n335 (extract 31 31 mult))) ; (bitvector 1)
  (let ((n336 (concat n335 n334))) ; (bitvector 32)
  (let ((n337 (concat (bv #b0 1) n336))) ; (bitvector 33)
  (let ((n338 (extract 33 33 mult))) ; (bitvector 1)
  (let ((n339 (concat n338 n337))) ; (bitvector 34)
  (let ((n340 (concat (bv #b0 1) n339))) ; (bitvector 35)
  (let ((n341 (extract 35 35 mult))) ; (bitvector 1)
  (let ((n342 (concat n341 n340))) ; (bitvector 36)
  (let ((n343 (concat (bv #b0 1) n342))) ; (bitvector 37)
  (let ((n344 (extract 37 37 mult))) ; (bitvector 1)
  (let ((n345 (concat n344 n343))) ; (bitvector 38)
  (let ((n346 (concat (bv #b0 1) n345))) ; (bitvector 39)
  (let ((n347 (extract 39 39 mult))) ; (bitvector 1)
  (let ((n348 (concat n347 n346))) ; (bitvector 40)
  (let ((n349 (concat (bv #b0 1) n348))) ; (bitvector 41)
  (let ((n350 (extract 41 41 mult))) ; (bitvector 1)
  (let ((n351 (concat n350 n349))) ; (bitvector 42)
  (let ((n352 (concat (bv #b0 1) n351))) ; (bitvector 43)
  (let ((n353 (extract 43 43 mult))) ; (bitvector 1)
  (let ((n354 (concat n353 n352))) ; (bitvector 44)
  (let ((n355 (extract 44 44 mult))) ; (bitvector 1)
  (let
    (($not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1030$264$_Y
      (bvnot n355))) ; (bitvector 1)
  (let
    ((n357
      (concat
        $not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1030$264$_Y
        n354))) ; (bitvector 45)
  (let (($procmux$521$_Y (if (bitvector->bool CEM) n357 V_DATA_reg))) ; (bitvector 45)
  (let
    (($0_V_DATA_reg_44_0_
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1043$270$_Y)
        (bv #b000000000000000000000000000000000000000000000 45)
        $procmux$521$_Y))) ; (bitvector 45)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$918$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$918 state))) ; (bitvector 9)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$920$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$920 state))) ; (bitvector 9)
  (let
    ((OPMODE_reg
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
        $auto$clk2fflogic.cc_102_sample_data$920$_Q
        $auto$clk2fflogic.cc_102_sample_data$918$_Q))) ; (bitvector 9)
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
    ((C_reg
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
        $auto$clk2fflogic.cc_102_sample_data$830$_Q
        $auto$clk2fflogic.cc_102_sample_data$828$_Q))) ; (bitvector 48)
  (let ((C (DSP48E2_Inputs-C inputs))) ; (bitvector 48)
  (let ((CEC (DSP48E2_Inputs-CEC inputs))) ; (bitvector 1)
  (let (($procmux$540$_Y (if (bitvector->bool CEC) C C_reg))) ; (bitvector 48)
  (let ((RSTC (DSP48E2_Inputs-RSTC inputs))) ; (bitvector 1)
  (let ((IS_RSTC_INVERTED (DSP48E2_Inputs-IS_RSTC_INVERTED inputs))) ; (bitvector 1)
  (let ((RSTC_in (bvxor RSTC IS_RSTC_INVERTED))) ; (bitvector 1)
  (let ((CREG (DSP48E2_Inputs-CREG inputs))) ; (bitvector 32)
  (let ((n380 (extract 0 0 CREG))) ; (bitvector 1)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1007$254$_Y
      (bvnot n380))) ; (bitvector 1)
  (let
    (($logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1007$255$_Y
      (bvor
        RSTC_in
        $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1007$254$_Y))) ; (bitvector 1)
  (let
    (($0_C_reg_47_0_
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1007$255$_Y)
        (bv #b000000000000000000000000000000000000000000000000 48)
        $procmux$540$_Y))) ; (bitvector 48)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$898$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$898 state))) ; (bitvector 4)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$900$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$900 state))) ; (bitvector 4)
  (let
    ((ALUMODE_reg
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
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
    ((pdetb_o_reg2
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
        $auto$clk2fflogic.cc_102_sample_data$800$_Q
        $auto$clk2fflogic.cc_102_sample_data$798$_Q))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$788$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$788 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$790$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$790 state))) ; (bitvector 1)
  (let
    ((pdetb_o_reg1
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
        $auto$clk2fflogic.cc_102_sample_data$790$_Q
        $auto$clk2fflogic.cc_102_sample_data$788$_Q))) ; (bitvector 1)
  (let ((CEP (DSP48E2_Inputs-CEP inputs))) ; (bitvector 1)
  (let ((PREG (DSP48E2_Inputs-PREG inputs))) ; (bitvector 32)
  (let ((n405 (extract 0 0 PREG))) ; (bitvector 1)
  (let
    (($logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1086$298$_Y
      (bvand CEP n405))) ; (bitvector 1)
  (let
    (($procmux$501$_Y
      (if
        (bitvector->bool
          $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1086$298$_Y)
        pdetb_o_reg1
        pdetb_o_reg2))) ; (bitvector 1)
  (let ((RSTP (DSP48E2_Inputs-RSTP inputs))) ; (bitvector 1)
  (let ((IS_RSTP_INVERTED (DSP48E2_Inputs-IS_RSTP_INVERTED inputs))) ; (bitvector 1)
  (let ((RSTP_in (bvxor RSTP IS_RSTP_INVERTED))) ; (bitvector 1)
  (let ((AUTORESET_PRIORITY (DSP48E2_Inputs-AUTORESET_PRIORITY inputs))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_415$27$_Y
      (bool->bitvector (bveq AUTORESET_PRIORITY (bv #b10000 5))))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_415$28$_Y
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_415$27$_Y)
        (bv #b1 1)
        (bv #b0 1)))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$671
      (concat
        (bv #b0000000000000000000000000000000 31)
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_415$28$_Y))) ; (bitvector 32)
  (let ((n417 (extract 0 0 $auto$wreduce.cc_514_run$671))) ; (bitvector 1)
  (let ((n419 (zero-extend (bv #b110 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_414$26$_Y
      (bool->bitvector (bveq AUTORESET_PRIORITY n419)))) ; (bitvector 1)
  (let
    ((AUTORESET_PRIORITY_BIN
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_414$26$_Y)
        (bv #b0 1)
        n417))) ; (bitvector 1)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1103$307$_Y
      (bvnot AUTORESET_PRIORITY_BIN))) ; (bitvector 1)
  (let
    ((auto_reset_pri
      (bvor
        $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1103$307$_Y
        CEP))) ; (bitvector 1)
  (let ((PATTERN (DSP48E2_Inputs-PATTERN inputs))) ; (bitvector 48)
  (let ((C_DATA_in (if (bitvector->bool n380) C_reg C))) ; (bitvector 48)
  (let ((SEL_PATTERN (DSP48E2_Inputs-SEL_PATTERN inputs))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_467$55$_Y
      (bool->bitvector (bveq SEL_PATTERN (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$679
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_467$55$_Y)
        (bv #b1 1)
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n431 (zero-extend (bv #b1001 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_466$54$_Y
      (bool->bitvector (bveq SEL_PATTERN n431)))) ; (bitvector 1)
  (let
    ((SEL_PATTERN_BIN
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_466$54$_Y)
        (bv #b0 1)
        $auto$wreduce.cc_514_run$679))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1061$276$_Y
      (if (bitvector->bool SEL_PATTERN_BIN) C_DATA_in PATTERN))) ; (bitvector 48)
  (let ((ALUMODEREG (DSP48E2_Inputs-ALUMODEREG inputs))) ; (bitvector 32)
  (let ((n436 (extract 0 0 ALUMODEREG))) ; (bitvector 1)
  (let ((ALUMODE_DATA (if (bitvector->bool n436) ALUMODE_reg ALUMODE_in))) ; (bitvector 4)
  (let ((n438 (extract 1 1 ALUMODE_DATA))) ; (bitvector 1)
  (let ((n439 (concat n438 n438))) ; (bitvector 2)
  (let ((n440 (concat n438 n439))) ; (bitvector 3)
  (let ((n441 (concat n438 n440))) ; (bitvector 4)
  (let ((n442 (concat n438 n441))) ; (bitvector 5)
  (let ((n443 (concat n438 n442))) ; (bitvector 6)
  (let ((n444 (concat n438 n443))) ; (bitvector 7)
  (let ((n445 (concat n438 n444))) ; (bitvector 8)
  (let ((n446 (concat n438 n445))) ; (bitvector 9)
  (let ((n447 (concat n438 n446))) ; (bitvector 10)
  (let ((n448 (concat n438 n447))) ; (bitvector 11)
  (let ((n449 (concat n438 n448))) ; (bitvector 12)
  (let ((n450 (concat n438 n449))) ; (bitvector 13)
  (let ((n451 (concat n438 n450))) ; (bitvector 14)
  (let ((n452 (concat n438 n451))) ; (bitvector 15)
  (let ((n453 (concat n438 n452))) ; (bitvector 16)
  (let ((n454 (concat n438 n453))) ; (bitvector 17)
  (let ((n455 (concat n438 n454))) ; (bitvector 18)
  (let ((n456 (concat n438 n455))) ; (bitvector 19)
  (let ((n457 (concat n438 n456))) ; (bitvector 20)
  (let ((n458 (concat n438 n457))) ; (bitvector 21)
  (let ((n459 (concat n438 n458))) ; (bitvector 22)
  (let ((n460 (concat n438 n459))) ; (bitvector 23)
  (let ((n461 (concat n438 n460))) ; (bitvector 24)
  (let ((n462 (concat n438 n461))) ; (bitvector 25)
  (let ((n463 (concat n438 n462))) ; (bitvector 26)
  (let ((n464 (concat n438 n463))) ; (bitvector 27)
  (let ((n465 (concat n438 n464))) ; (bitvector 28)
  (let ((n466 (concat n438 n465))) ; (bitvector 29)
  (let ((n467 (concat n438 n466))) ; (bitvector 30)
  (let ((n468 (concat n438 n467))) ; (bitvector 31)
  (let ((n469 (concat n438 n468))) ; (bitvector 32)
  (let ((n470 (concat n438 n469))) ; (bitvector 33)
  (let ((n471 (concat n438 n470))) ; (bitvector 34)
  (let ((n472 (concat n438 n471))) ; (bitvector 35)
  (let ((n473 (concat n438 n472))) ; (bitvector 36)
  (let ((n474 (concat n438 n473))) ; (bitvector 37)
  (let ((n475 (concat n438 n474))) ; (bitvector 38)
  (let ((n476 (concat n438 n475))) ; (bitvector 39)
  (let ((n477 (concat n438 n476))) ; (bitvector 40)
  (let ((n478 (concat n438 n477))) ; (bitvector 41)
  (let ((n479 (concat n438 n478))) ; (bitvector 42)
  (let ((n480 (concat n438 n479))) ; (bitvector 43)
  (let ((n481 (concat n438 n480))) ; (bitvector 44)
  (let ((n482 (concat n438 n481))) ; (bitvector 45)
  (let ((n483 (concat n438 n482))) ; (bitvector 46)
  (let ((n484 (concat n438 n483))) ; (bitvector 47)
  (let ((n485 (concat n438 n484))) ; (bitvector 48)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$748$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$748 state))) ; (bitvector 48)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$750$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$750 state))) ; (bitvector 48)
  (let
    ((ALU_OUT_reg
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
        $auto$clk2fflogic.cc_102_sample_data$750$_Q
        $auto$clk2fflogic.cc_102_sample_data$748$_Q))) ; (bitvector 48)
  (let ((n490 (extract 47 47 ALU_OUT_reg))) ; (bitvector 1)
  (let
    (($not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_929$217$_Y
      (bvnot n490))) ; (bitvector 1)
  (let
    ((multcarryin_data
      (if
        (bitvector->bool n283)
        qmultcarryin
        $logic_not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_902$204$_Y))) ; (bitvector 1)
  (let
    (($not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_928$216$_Y
      (bvnot multcarryin_data))) ; (bitvector 1)
  (let
    ((n494
      (concat
        $not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_928$216$_Y
        $not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_929$217$_Y))) ; (bitvector 2)
  (let ((n495 (concat n490 n494))) ; (bitvector 3)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$728$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$728 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$730$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$730 state))) ; (bitvector 1)
  (let
    ((ALUMODE10_reg
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
        $auto$clk2fflogic.cc_102_sample_data$730$_Q
        $auto$clk2fflogic.cc_102_sample_data$728$_Q))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$718$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$718 state))) ; (bitvector 4)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$720$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$720 state))) ; (bitvector 4)
  (let
    ((COUT_reg
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
        $auto$clk2fflogic.cc_102_sample_data$720$_Q
        $auto$clk2fflogic.cc_102_sample_data$718$_Q))) ; (bitvector 4)
  (let ((n502 (extract 3 3 COUT_reg))) ; (bitvector 1)
  (let ((CCOUT_in (bvxor ALUMODE10_reg n502))) ; (bitvector 1)
  (let
    (($not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_926$215$_Y
      (bvnot CCOUT_in))) ; (bitvector 1)
  (let
    ((n505
      (concat
        $not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_926$215$_Y
        n495))) ; (bitvector 4)
  (let ((PCIN (DSP48E2_Inputs-PCIN inputs))) ; (bitvector 48)
  (let ((n507 (extract 47 47 PCIN))) ; (bitvector 1)
  (let
    (($not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_925$214$_Y
      (bvnot n507))) ; (bitvector 1)
  (let
    ((n509
      (concat
        $not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_925$214$_Y
        n505))) ; (bitvector 5)
  (let ((CARRYCASCIN (DSP48E2_Inputs-CARRYCASCIN inputs))) ; (bitvector 1)
  (let
    (($not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_924$213$_Y
      (bvnot CARRYCASCIN))) ; (bitvector 1)
  (let
    ((n512
      (concat
        $not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_924$213$_Y
        n509))) ; (bitvector 6)
  (let ((n513 (concat n507 n512))) ; (bitvector 7)
  (let ((CARRYINREG (DSP48E2_Inputs-CARRYINREG inputs))) ; (bitvector 32)
  (let ((n515 (extract 0 0 CARRYINREG))) ; (bitvector 1)
  (let ((CARRYIN_mux (if (bitvector->bool n515) CARRYIN_reg CARRYIN_in))) ; (bitvector 1)
  (let
    (($not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_922$212$_Y
      (bvnot CARRYIN_mux))) ; (bitvector 1)
  (let
    ((n518
      (concat
        $not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_922$212$_Y
        n513))) ; (bitvector 8)
  (let ((n519 (extract 0 0 n518))) ; (bitvector 1)
  (let ((CARRYINSELREG (DSP48E2_Inputs-CARRYINSELREG inputs))) ; (bitvector 32)
  (let ((n521 (extract 0 0 CARRYINSELREG))) ; (bitvector 1)
  (let ((CARRYINSEL_mux (if (bitvector->bool n521) CARRYINSEL_reg CARRYINSEL))) ; (bitvector 3)
  (let
    (($procmux$584_CMP (bool->bitvector (bveq CARRYINSEL_mux (bv #b111 3))))) ; (bitvector 1)
  (let
    (($procmux$585_CMP (bool->bitvector (bveq CARRYINSEL_mux (bv #b110 3))))) ; (bitvector 1)
  (let ((n525 (concat $procmux$585_CMP $procmux$584_CMP))) ; (bitvector 2)
  (let
    (($procmux$586_CMP (bool->bitvector (bveq CARRYINSEL_mux (bv #b101 3))))) ; (bitvector 1)
  (let ((n528 (concat $procmux$586_CMP n525))) ; (bitvector 3)
  (let
    (($procmux$587_CMP (bool->bitvector (bveq CARRYINSEL_mux (bv #b100 3))))) ; (bitvector 1)
  (let ((n531 (concat $procmux$587_CMP n528))) ; (bitvector 4)
  (let ((n533 (zero-extend (bv #b11 2) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$588_CMP (bool->bitvector (bveq CARRYINSEL_mux n533)))) ; (bitvector 1)
  (let ((n535 (concat $procmux$588_CMP n531))) ; (bitvector 5)
  (let ((n536 (zero-extend (bv #b10 2) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$589_CMP (bool->bitvector (bveq CARRYINSEL_mux n536)))) ; (bitvector 1)
  (let ((n538 (concat $procmux$589_CMP n535))) ; (bitvector 6)
  (let ((n539 (zero-extend (bv #b1 1) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$590_CMP (bool->bitvector (bveq CARRYINSEL_mux n539)))) ; (bitvector 1)
  (let ((n541 (concat $procmux$590_CMP n538))) ; (bitvector 7)
  (let ((n542 (apply bvor (bitvector->bits CARRYINSEL_mux)))) ; (bitvector 1)
  (let (($procmux$591_CMP (bvnot n542))) ; (bitvector 1)
  (let ((n544 (concat $procmux$591_CMP n541))) ; (bitvector 8)
  (let ((n545 (extract 0 0 n544))) ; (bitvector 1)
  (let ((n546 (if (bitvector->bool n545) n519 (bv #b0 1)))) ; (bitvector 1)
  (let ((n547 (extract 1 1 n518))) ; (bitvector 1)
  (let ((n548 (extract 1 1 n544))) ; (bitvector 1)
  (let ((n549 (if (bitvector->bool n548) n547 n546))) ; (bitvector 1)
  (let ((n550 (extract 2 2 n518))) ; (bitvector 1)
  (let ((n551 (extract 2 2 n544))) ; (bitvector 1)
  (let ((n552 (if (bitvector->bool n551) n550 n549))) ; (bitvector 1)
  (let ((n553 (extract 3 3 n518))) ; (bitvector 1)
  (let ((n554 (extract 3 3 n544))) ; (bitvector 1)
  (let ((n555 (if (bitvector->bool n554) n553 n552))) ; (bitvector 1)
  (let ((n556 (extract 4 4 n518))) ; (bitvector 1)
  (let ((n557 (extract 4 4 n544))) ; (bitvector 1)
  (let ((n558 (if (bitvector->bool n557) n556 n555))) ; (bitvector 1)
  (let ((n559 (extract 5 5 n518))) ; (bitvector 1)
  (let ((n560 (extract 5 5 n544))) ; (bitvector 1)
  (let ((n561 (if (bitvector->bool n560) n559 n558))) ; (bitvector 1)
  (let ((n562 (extract 6 6 n518))) ; (bitvector 1)
  (let ((n563 (extract 6 6 n544))) ; (bitvector 1)
  (let ((n564 (if (bitvector->bool n563) n562 n561))) ; (bitvector 1)
  (let ((n565 (extract 7 7 n518))) ; (bitvector 1)
  (let ((n566 (extract 7 7 n544))) ; (bitvector 1)
  (let ((cin_b (if (bitvector->bool n566) n565 n564))) ; (bitvector 1)
  (let
    (($not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_934$219$_Y
      (bvnot cin_b))) ; (bitvector 1)
  (let ((n569 (extract 3 3 ALUMODE_DATA))) ; (bitvector 1)
  (let ((n570 (extract 2 2 ALUMODE_DATA))) ; (bitvector 1)
  (let
    (($logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_934$218$_Y
      (bvor n569 n570))) ; (bitvector 1)
  (let
    ((cin
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_934$218$_Y)
        (bv #b0 1)
        $not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_934$219$_Y))) ; (bitvector 1)
  (let ((n573 (extract 0 0 ALUMODE_DATA))) ; (bitvector 1)
  (let ((n574 (concat n573 n573))) ; (bitvector 2)
  (let ((n575 (concat n573 n574))) ; (bitvector 3)
  (let ((n576 (concat n573 n575))) ; (bitvector 4)
  (let ((n577 (concat n573 n576))) ; (bitvector 5)
  (let ((n578 (concat n573 n577))) ; (bitvector 6)
  (let ((n579 (concat n573 n578))) ; (bitvector 7)
  (let ((n580 (concat n573 n579))) ; (bitvector 8)
  (let ((n581 (concat n573 n580))) ; (bitvector 9)
  (let ((n582 (concat n573 n581))) ; (bitvector 10)
  (let ((n583 (concat n573 n582))) ; (bitvector 11)
  (let ((n584 (concat n573 n583))) ; (bitvector 12)
  (let ((n585 (concat n573 n584))) ; (bitvector 13)
  (let ((n586 (concat n573 n585))) ; (bitvector 14)
  (let ((n587 (concat n573 n586))) ; (bitvector 15)
  (let ((n588 (concat n573 n587))) ; (bitvector 16)
  (let ((n589 (concat n573 n588))) ; (bitvector 17)
  (let ((n590 (concat n573 n589))) ; (bitvector 18)
  (let ((n591 (concat n573 n590))) ; (bitvector 19)
  (let ((n592 (concat n573 n591))) ; (bitvector 20)
  (let ((n593 (concat n573 n592))) ; (bitvector 21)
  (let ((n594 (concat n573 n593))) ; (bitvector 22)
  (let ((n595 (concat n573 n594))) ; (bitvector 23)
  (let ((n596 (concat n573 n595))) ; (bitvector 24)
  (let ((n597 (concat n573 n596))) ; (bitvector 25)
  (let ((n598 (concat n573 n597))) ; (bitvector 26)
  (let ((n599 (concat n573 n598))) ; (bitvector 27)
  (let ((n600 (concat n573 n599))) ; (bitvector 28)
  (let ((n601 (concat n573 n600))) ; (bitvector 29)
  (let ((n602 (concat n573 n601))) ; (bitvector 30)
  (let ((n603 (concat n573 n602))) ; (bitvector 31)
  (let ((n604 (concat n573 n603))) ; (bitvector 32)
  (let ((n605 (concat n573 n604))) ; (bitvector 33)
  (let ((n606 (concat n573 n605))) ; (bitvector 34)
  (let ((n607 (concat n573 n606))) ; (bitvector 35)
  (let ((n608 (concat n573 n607))) ; (bitvector 36)
  (let ((n609 (concat n573 n608))) ; (bitvector 37)
  (let ((n610 (concat n573 n609))) ; (bitvector 38)
  (let ((n611 (concat n573 n610))) ; (bitvector 39)
  (let ((n612 (concat n573 n611))) ; (bitvector 40)
  (let ((n613 (concat n573 n612))) ; (bitvector 41)
  (let ((n614 (concat n573 n613))) ; (bitvector 42)
  (let ((n615 (concat n573 n614))) ; (bitvector 43)
  (let ((n616 (concat n573 n615))) ; (bitvector 44)
  (let ((n617 (concat n573 n616))) ; (bitvector 45)
  (let ((n618 (concat n573 n617))) ; (bitvector 46)
  (let ((n619 (concat n573 n618))) ; (bitvector 47)
  (let ((n620 (concat n573 n619))) ; (bitvector 48)
  (let ((n622 (extract 47 17 ALU_OUT_reg))) ; (bitvector 31)
  (let ((n623 (concat n490 n622))) ; (bitvector 32)
  (let ((n624 (concat n490 n623))) ; (bitvector 33)
  (let ((n625 (concat n490 n624))) ; (bitvector 34)
  (let ((n626 (concat n490 n625))) ; (bitvector 35)
  (let ((n627 (concat n490 n626))) ; (bitvector 36)
  (let ((n628 (concat n490 n627))) ; (bitvector 37)
  (let ((n629 (concat n490 n628))) ; (bitvector 38)
  (let ((n630 (concat n490 n629))) ; (bitvector 39)
  (let ((n631 (concat n490 n630))) ; (bitvector 40)
  (let ((n632 (concat n490 n631))) ; (bitvector 41)
  (let ((n633 (concat n490 n632))) ; (bitvector 42)
  (let ((n634 (concat n490 n633))) ; (bitvector 43)
  (let ((n635 (concat n490 n634))) ; (bitvector 44)
  (let ((n636 (concat n490 n635))) ; (bitvector 45)
  (let ((n637 (concat n490 n636))) ; (bitvector 46)
  (let ((n638 (concat n490 n637))) ; (bitvector 47)
  (let ((n639 (concat n490 n638))) ; (bitvector 48)
  (let ((n640 (extract 47 17 PCIN))) ; (bitvector 31)
  (let ((n641 (concat n640 n639))) ; (bitvector 79)
  (let ((n642 (concat n507 n641))) ; (bitvector 80)
  (let ((n643 (concat n507 n642))) ; (bitvector 81)
  (let ((n644 (concat n507 n643))) ; (bitvector 82)
  (let ((n645 (concat n507 n644))) ; (bitvector 83)
  (let ((n646 (concat n507 n645))) ; (bitvector 84)
  (let ((n647 (concat n507 n646))) ; (bitvector 85)
  (let ((n648 (concat n507 n647))) ; (bitvector 86)
  (let ((n649 (concat n507 n648))) ; (bitvector 87)
  (let ((n650 (concat n507 n649))) ; (bitvector 88)
  (let ((n651 (concat n507 n650))) ; (bitvector 89)
  (let ((n652 (concat n507 n651))) ; (bitvector 90)
  (let ((n653 (concat n507 n652))) ; (bitvector 91)
  (let ((n654 (concat n507 n653))) ; (bitvector 92)
  (let ((n655 (concat n507 n654))) ; (bitvector 93)
  (let ((n656 (concat n507 n655))) ; (bitvector 94)
  (let ((n657 (concat n507 n656))) ; (bitvector 95)
  (let ((n658 (concat n507 n657))) ; (bitvector 96)
  (let ((n659 (concat ALU_OUT_reg n658))) ; (bitvector 144)
  (let ((n660 (concat C_DATA_in n659))) ; (bitvector 192)
  (let ((n661 (concat PCIN n660))) ; (bitvector 240)
  (let
    ((n662
      (concat (bv #b000000000000000000000000000000000000000000000000 48) n661))) ; (bitvector 288)
  (let ((n663 (extract 47 0 n662))) ; (bitvector 48)
  (let ((OPMODEREG (DSP48E2_Inputs-OPMODEREG inputs))) ; (bitvector 32)
  (let ((n665 (extract 0 0 OPMODEREG))) ; (bitvector 1)
  (let ((OPMODE_mux (if (bitvector->bool n665) OPMODE_reg OPMODE_in))) ; (bitvector 9)
  (let ((n667 (extract 6 5 OPMODE_mux))) ; (bitvector 2)
  (let (($procmux$616_CMP (bool->bitvector (bveq n667 (bv #b11 2))))) ; (bitvector 1)
  (let ((n669 (extract 6 4 OPMODE_mux))) ; (bitvector 3)
  (let (($procmux$617_CMP (bool->bitvector (bveq n669 (bv #b101 3))))) ; (bitvector 1)
  (let ((n671 (concat $procmux$617_CMP $procmux$616_CMP))) ; (bitvector 2)
  (let ((n672 (extract 6 4 OPMODE_mux))) ; (bitvector 3)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_693$87_Y
      (bool->bitvector (bveq n672 (bv #b100 3))))) ; (bitvector 1)
  (let ((n674 (zero-extend (bv #b10 2) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$620_CMP (bool->bitvector (bveq n669 n674)))) ; (bitvector 1)
  (let
    ((n676
      (concat
        $procmux$620_CMP
        $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_693$87_Y))) ; (bitvector 2)
  (let
    (($auto$opt_reduce.cc_131_opt_pmux$662$_Y
      (apply bvor (bitvector->bits n676)))) ; (bitvector 1)
  (let ((n678 (concat $auto$opt_reduce.cc_131_opt_pmux$662$_Y n671))) ; (bitvector 3)
  (let ((n679 (zero-extend (bv #b11 2) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$619_CMP (bool->bitvector (bveq n669 n679)))) ; (bitvector 1)
  (let ((n681 (concat $procmux$619_CMP n678))) ; (bitvector 4)
  (let ((n682 (zero-extend (bv #b1 1) (bitvector 3)))) ; (bitvector 3)
  (let (($procmux$621_CMP (bool->bitvector (bveq n669 n682)))) ; (bitvector 1)
  (let ((n684 (concat $procmux$621_CMP n681))) ; (bitvector 5)
  (let ((n685 (apply bvor (bitvector->bits n669)))) ; (bitvector 1)
  (let (($procmux$622_CMP (bvnot n685))) ; (bitvector 1)
  (let ((n687 (concat $procmux$622_CMP n684))) ; (bitvector 6)
  (let ((n688 (extract 0 0 n687))) ; (bitvector 1)
  (let
    ((n689
      (if
        (bitvector->bool n688)
        n663
        (bv #b000000000000000000000000000000000000000000000000 48)))) ; (bitvector 48)
  (let ((n690 (extract 95 48 n662))) ; (bitvector 48)
  (let ((n691 (extract 1 1 n687))) ; (bitvector 1)
  (let ((n692 (if (bitvector->bool n691) n690 n689))) ; (bitvector 48)
  (let ((n693 (extract 143 96 n662))) ; (bitvector 48)
  (let ((n694 (extract 2 2 n687))) ; (bitvector 1)
  (let ((n695 (if (bitvector->bool n694) n693 n692))) ; (bitvector 48)
  (let ((n696 (extract 191 144 n662))) ; (bitvector 48)
  (let ((n697 (extract 3 3 n687))) ; (bitvector 1)
  (let ((n698 (if (bitvector->bool n697) n696 n695))) ; (bitvector 48)
  (let ((n699 (extract 239 192 n662))) ; (bitvector 48)
  (let ((n700 (extract 4 4 n687))) ; (bitvector 1)
  (let ((n701 (if (bitvector->bool n700) n699 n698))) ; (bitvector 48)
  (let ((n702 (extract 287 240 n662))) ; (bitvector 48)
  (let ((n703 (extract 5 5 n687))) ; (bitvector 1)
  (let (($procmux$615$_Y (if (bitvector->bool n703) n702 n701))) ; (bitvector 48)
  (let ((z_optinv (bvxor n620 $procmux$615$_Y))) ; (bitvector 48)
  (let ((n706 (concat A_ALU B2_DATA))) ; (bitvector 48)
  (let ((n707 (concat ALU_OUT_reg n706))) ; (bitvector 96)
  (let ((n709 (extract 0 0 mult))) ; (bitvector 1)
  (let ((n710 (concat (bv #b0 1) n709))) ; (bitvector 2)
  (let ((n711 (extract 2 2 mult))) ; (bitvector 1)
  (let ((n712 (concat n711 n710))) ; (bitvector 3)
  (let ((n713 (concat (bv #b0 1) n712))) ; (bitvector 4)
  (let ((n714 (extract 4 4 mult))) ; (bitvector 1)
  (let ((n715 (concat n714 n713))) ; (bitvector 5)
  (let ((n716 (concat (bv #b0 1) n715))) ; (bitvector 6)
  (let ((n717 (extract 6 6 mult))) ; (bitvector 1)
  (let ((n718 (concat n717 n716))) ; (bitvector 7)
  (let ((n719 (concat (bv #b0 1) n718))) ; (bitvector 8)
  (let ((n720 (extract 8 8 mult))) ; (bitvector 1)
  (let ((n721 (concat n720 n719))) ; (bitvector 9)
  (let ((n722 (concat (bv #b0 1) n721))) ; (bitvector 10)
  (let ((n723 (extract 10 10 mult))) ; (bitvector 1)
  (let ((n724 (concat n723 n722))) ; (bitvector 11)
  (let ((n725 (concat (bv #b0 1) n724))) ; (bitvector 12)
  (let ((n726 (extract 12 12 mult))) ; (bitvector 1)
  (let ((n727 (concat n726 n725))) ; (bitvector 13)
  (let ((n728 (concat (bv #b0 1) n727))) ; (bitvector 14)
  (let ((n729 (extract 14 14 mult))) ; (bitvector 1)
  (let ((n730 (concat n729 n728))) ; (bitvector 15)
  (let ((n731 (concat (bv #b0 1) n730))) ; (bitvector 16)
  (let ((n732 (extract 16 16 mult))) ; (bitvector 1)
  (let ((n733 (concat n732 n731))) ; (bitvector 17)
  (let ((n734 (concat (bv #b0 1) n733))) ; (bitvector 18)
  (let ((n735 (extract 18 18 mult))) ; (bitvector 1)
  (let ((n736 (concat n735 n734))) ; (bitvector 19)
  (let ((n737 (concat (bv #b0 1) n736))) ; (bitvector 20)
  (let ((n738 (extract 20 20 mult))) ; (bitvector 1)
  (let ((n739 (concat n738 n737))) ; (bitvector 21)
  (let ((n740 (concat (bv #b0 1) n739))) ; (bitvector 22)
  (let ((n741 (extract 22 22 mult))) ; (bitvector 1)
  (let ((n742 (concat n741 n740))) ; (bitvector 23)
  (let ((n743 (concat (bv #b0 1) n742))) ; (bitvector 24)
  (let ((n744 (extract 24 24 mult))) ; (bitvector 1)
  (let ((n745 (concat n744 n743))) ; (bitvector 25)
  (let ((n746 (concat (bv #b0 1) n745))) ; (bitvector 26)
  (let ((n747 (extract 26 26 mult))) ; (bitvector 1)
  (let ((n748 (concat n747 n746))) ; (bitvector 27)
  (let ((n749 (concat (bv #b0 1) n748))) ; (bitvector 28)
  (let ((n750 (extract 28 28 mult))) ; (bitvector 1)
  (let ((n751 (concat n750 n749))) ; (bitvector 29)
  (let ((n752 (concat (bv #b0 1) n751))) ; (bitvector 30)
  (let ((n753 (extract 30 30 mult))) ; (bitvector 1)
  (let ((n754 (concat n753 n752))) ; (bitvector 31)
  (let ((n755 (concat (bv #b0 1) n754))) ; (bitvector 32)
  (let ((n756 (extract 32 32 mult))) ; (bitvector 1)
  (let ((n757 (concat n756 n755))) ; (bitvector 33)
  (let ((n758 (concat (bv #b0 1) n757))) ; (bitvector 34)
  (let ((n759 (extract 34 34 mult))) ; (bitvector 1)
  (let ((n760 (concat n759 n758))) ; (bitvector 35)
  (let ((n761 (concat (bv #b0 1) n760))) ; (bitvector 36)
  (let ((n762 (extract 36 36 mult))) ; (bitvector 1)
  (let ((n763 (concat n762 n761))) ; (bitvector 37)
  (let ((n764 (concat (bv #b0 1) n763))) ; (bitvector 38)
  (let ((n765 (extract 38 38 mult))) ; (bitvector 1)
  (let ((n766 (concat n765 n764))) ; (bitvector 39)
  (let ((n767 (concat (bv #b0 1) n766))) ; (bitvector 40)
  (let ((n768 (extract 40 40 mult))) ; (bitvector 1)
  (let ((n769 (concat n768 n767))) ; (bitvector 41)
  (let ((n770 (concat (bv #b0 1) n769))) ; (bitvector 42)
  (let ((n771 (extract 42 42 mult))) ; (bitvector 1)
  (let ((n772 (concat n771 n770))) ; (bitvector 43)
  (let ((n773 (concat (bv #b10 2) n772))) ; (bitvector 45)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1052$272$_Y
      (if (bitvector->bool n283) U_DATA_reg n773))) ; (bitvector 45)
  (let ((USE_SIMD (DSP48E2_Inputs-USE_SIMD inputs))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_484$70$_Y
      (bool->bitvector (bveq USE_SIMD (bv #b11001 5))))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$683
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_484$70$_Y)
        (bv #b10 2)
        (bv #b00 2)))) ; (bitvector 2)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_483$69$_Y
      (bool->bitvector (bveq USE_SIMD (bv #b10011 5))))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$682
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_483$69$_Y)
        (bv #b01 2)
        $auto$wreduce.cc_514_run$683))) ; (bitvector 2)
  (let ((n783 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_482$68$_Y
      (bool->bitvector (bveq USE_SIMD n783)))) ; (bitvector 1)
  (let
    ((USE_SIMD_BIN
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_482$68$_Y)
        (bv #b00 2)
        $auto$wreduce.cc_514_run$682))) ; (bitvector 2)
  (let ((n786 (apply bvor (bitvector->bits USE_SIMD_BIN)))) ; (bitvector 1)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_675$82$_Y
      (bvnot n786))) ; (bitvector 1)
  (let
    ((U_DATA_in
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_675$82$_Y)
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1052$272$_Y
        (bv #b100000000000000000000000000000000000000000000 45)))) ; (bitvector 45)
  (let ((n789 (concat U_DATA_in n707))) ; (bitvector 141)
  (let ((n790 (extract 44 44 U_DATA_in))) ; (bitvector 1)
  (let ((n791 (concat n790 n789))) ; (bitvector 142)
  (let ((n792 (concat n790 n791))) ; (bitvector 143)
  (let ((n793 (concat n790 n792))) ; (bitvector 144)
  (let ((MULTSIGNIN (DSP48E2_Inputs-MULTSIGNIN inputs))) ; (bitvector 1)
  (let ((n795 (concat MULTSIGNIN (bv #b0 1)))) ; (bitvector 2)
  (let
    ((x_mac_cascd
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_693$87_Y)
        n795
        (bv #b00 2)))) ; (bitvector 2)
  (let ((n797 (concat x_mac_cascd n793))) ; (bitvector 146)
  (let
    ((n799
      (concat (bv #b0000000000000000000000000000000000000000000000 46) n797))) ; (bitvector 192)
  (let ((n800 (extract 47 0 n799))) ; (bitvector 48)
  (let ((n801 (extract 1 0 OPMODE_mux))) ; (bitvector 2)
  (let (($procmux$629_CMP (bool->bitvector (bveq n801 (bv #b11 2))))) ; (bitvector 1)
  (let (($procmux$630_CMP (bool->bitvector (bveq n801 (bv #b10 2))))) ; (bitvector 1)
  (let ((n804 (concat $procmux$630_CMP $procmux$629_CMP))) ; (bitvector 2)
  (let ((n805 (zero-extend (bv #b1 1) (bitvector 2)))) ; (bitvector 2)
  (let (($procmux$631_CMP (bool->bitvector (bveq n801 n805)))) ; (bitvector 1)
  (let ((n807 (concat $procmux$631_CMP n804))) ; (bitvector 3)
  (let ((n808 (apply bvor (bitvector->bits n801)))) ; (bitvector 1)
  (let (($procmux$632_CMP (bvnot n808))) ; (bitvector 1)
  (let ((n810 (concat $procmux$632_CMP n807))) ; (bitvector 4)
  (let ((n811 (extract 0 0 n810))) ; (bitvector 1)
  (let
    ((n812
      (if
        (bitvector->bool n811)
        n800
        (bv #b000000000000000000000000000000000000000000000000 48)))) ; (bitvector 48)
  (let ((n813 (extract 95 48 n799))) ; (bitvector 48)
  (let ((n814 (extract 1 1 n810))) ; (bitvector 1)
  (let ((n815 (if (bitvector->bool n814) n813 n812))) ; (bitvector 48)
  (let ((n816 (extract 143 96 n799))) ; (bitvector 48)
  (let ((n817 (extract 2 2 n810))) ; (bitvector 1)
  (let ((n818 (if (bitvector->bool n817) n816 n815))) ; (bitvector 48)
  (let ((n819 (extract 191 144 n799))) ; (bitvector 48)
  (let ((n820 (extract 3 3 n810))) ; (bitvector 1)
  (let ((xmux (if (bitvector->bool n820) n819 n818))) ; (bitvector 48)
  (let
    (($xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_782$109$_Y
      (bvxor z_optinv xmux))) ; (bitvector 48)
  (let
    ((n824
      (concat
        (bv #b111111111111111111111111111111111111111111111111 48)
        C_DATA_in))) ; (bitvector 96)
  (let ((n825 (extract 1 1 mult))) ; (bitvector 1)
  (let ((n826 (concat n825 (bv #b0 1)))) ; (bitvector 2)
  (let ((n827 (concat (bv #b0 1) n826))) ; (bitvector 3)
  (let ((n828 (extract 3 3 mult))) ; (bitvector 1)
  (let ((n829 (concat n828 n827))) ; (bitvector 4)
  (let ((n830 (concat (bv #b0 1) n829))) ; (bitvector 5)
  (let ((n831 (extract 5 5 mult))) ; (bitvector 1)
  (let ((n832 (concat n831 n830))) ; (bitvector 6)
  (let ((n833 (concat (bv #b0 1) n832))) ; (bitvector 7)
  (let ((n834 (extract 7 7 mult))) ; (bitvector 1)
  (let ((n835 (concat n834 n833))) ; (bitvector 8)
  (let ((n836 (concat (bv #b0 1) n835))) ; (bitvector 9)
  (let ((n837 (extract 9 9 mult))) ; (bitvector 1)
  (let ((n838 (concat n837 n836))) ; (bitvector 10)
  (let ((n839 (concat (bv #b0 1) n838))) ; (bitvector 11)
  (let ((n840 (extract 11 11 mult))) ; (bitvector 1)
  (let ((n841 (concat n840 n839))) ; (bitvector 12)
  (let ((n842 (concat (bv #b0 1) n841))) ; (bitvector 13)
  (let ((n843 (extract 13 13 mult))) ; (bitvector 1)
  (let ((n844 (concat n843 n842))) ; (bitvector 14)
  (let ((n845 (concat (bv #b0 1) n844))) ; (bitvector 15)
  (let ((n846 (extract 15 15 mult))) ; (bitvector 1)
  (let ((n847 (concat n846 n845))) ; (bitvector 16)
  (let ((n848 (concat (bv #b0 1) n847))) ; (bitvector 17)
  (let ((n849 (extract 17 17 mult))) ; (bitvector 1)
  (let ((n850 (concat n849 n848))) ; (bitvector 18)
  (let ((n851 (concat (bv #b0 1) n850))) ; (bitvector 19)
  (let ((n852 (extract 19 19 mult))) ; (bitvector 1)
  (let ((n853 (concat n852 n851))) ; (bitvector 20)
  (let ((n854 (concat (bv #b0 1) n853))) ; (bitvector 21)
  (let ((n855 (extract 21 21 mult))) ; (bitvector 1)
  (let ((n856 (concat n855 n854))) ; (bitvector 22)
  (let ((n857 (concat (bv #b0 1) n856))) ; (bitvector 23)
  (let ((n858 (extract 23 23 mult))) ; (bitvector 1)
  (let ((n859 (concat n858 n857))) ; (bitvector 24)
  (let ((n860 (concat (bv #b0 1) n859))) ; (bitvector 25)
  (let ((n861 (extract 25 25 mult))) ; (bitvector 1)
  (let ((n862 (concat n861 n860))) ; (bitvector 26)
  (let ((n863 (concat (bv #b0 1) n862))) ; (bitvector 27)
  (let ((n864 (extract 27 27 mult))) ; (bitvector 1)
  (let ((n865 (concat n864 n863))) ; (bitvector 28)
  (let ((n866 (concat (bv #b0 1) n865))) ; (bitvector 29)
  (let ((n867 (extract 29 29 mult))) ; (bitvector 1)
  (let ((n868 (concat n867 n866))) ; (bitvector 30)
  (let ((n869 (concat (bv #b0 1) n868))) ; (bitvector 31)
  (let ((n870 (extract 31 31 mult))) ; (bitvector 1)
  (let ((n871 (concat n870 n869))) ; (bitvector 32)
  (let ((n872 (concat (bv #b0 1) n871))) ; (bitvector 33)
  (let ((n873 (extract 33 33 mult))) ; (bitvector 1)
  (let ((n874 (concat n873 n872))) ; (bitvector 34)
  (let ((n875 (concat (bv #b0 1) n874))) ; (bitvector 35)
  (let ((n876 (extract 35 35 mult))) ; (bitvector 1)
  (let ((n877 (concat n876 n875))) ; (bitvector 36)
  (let ((n878 (concat (bv #b0 1) n877))) ; (bitvector 37)
  (let ((n879 (extract 37 37 mult))) ; (bitvector 1)
  (let ((n880 (concat n879 n878))) ; (bitvector 38)
  (let ((n881 (concat (bv #b0 1) n880))) ; (bitvector 39)
  (let ((n882 (extract 39 39 mult))) ; (bitvector 1)
  (let ((n883 (concat n882 n881))) ; (bitvector 40)
  (let ((n884 (concat (bv #b0 1) n883))) ; (bitvector 41)
  (let ((n885 (extract 41 41 mult))) ; (bitvector 1)
  (let ((n886 (concat n885 n884))) ; (bitvector 42)
  (let ((n887 (concat (bv #b0 1) n886))) ; (bitvector 43)
  (let ((n888 (extract 43 43 mult))) ; (bitvector 1)
  (let ((n889 (concat n888 n887))) ; (bitvector 44)
  (let
    ((n890
      (concat
        $not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1030$264$_Y
        n889))) ; (bitvector 45)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1053$274$_Y
      (if (bitvector->bool n283) V_DATA_reg n890))) ; (bitvector 45)
  (let
    ((V_DATA_in
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_675$82$_Y)
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1053$274$_Y
        (bv #b100000000000000000000000000000000000000000000 45)))) ; (bitvector 45)
  (let ((n893 (concat V_DATA_in n824))) ; (bitvector 141)
  (let
    ((n895
      (concat
        (bv #b000000000000000000000000000000000000000000000000000 51)
        n893))) ; (bitvector 192)
  (let ((n896 (extract 47 0 n895))) ; (bitvector 48)
  (let ((n897 (extract 3 2 OPMODE_mux))) ; (bitvector 2)
  (let (($procmux$624_CMP (bool->bitvector (bveq n897 (bv #b11 2))))) ; (bitvector 1)
  (let (($procmux$625_CMP (bool->bitvector (bveq n897 (bv #b10 2))))) ; (bitvector 1)
  (let ((n900 (concat $procmux$625_CMP $procmux$624_CMP))) ; (bitvector 2)
  (let ((n901 (zero-extend (bv #b1 1) (bitvector 2)))) ; (bitvector 2)
  (let (($procmux$626_CMP (bool->bitvector (bveq n897 n901)))) ; (bitvector 1)
  (let ((n903 (concat $procmux$626_CMP n900))) ; (bitvector 3)
  (let ((n904 (apply bvor (bitvector->bits n897)))) ; (bitvector 1)
  (let (($procmux$627_CMP (bvnot n904))) ; (bitvector 1)
  (let ((n906 (concat $procmux$627_CMP n903))) ; (bitvector 4)
  (let ((n907 (extract 0 0 n906))) ; (bitvector 1)
  (let
    ((n908
      (if
        (bitvector->bool n907)
        n896
        (bv #b000000000000000000000000000000000000000000000000 48)))) ; (bitvector 48)
  (let ((n909 (extract 95 48 n895))) ; (bitvector 48)
  (let ((n910 (extract 1 1 n906))) ; (bitvector 1)
  (let ((n911 (if (bitvector->bool n910) n909 n908))) ; (bitvector 48)
  (let ((n912 (extract 143 96 n895))) ; (bitvector 48)
  (let ((n913 (extract 2 2 n906))) ; (bitvector 1)
  (let ((n914 (if (bitvector->bool n913) n912 n911))) ; (bitvector 48)
  (let ((n915 (extract 191 144 n895))) ; (bitvector 48)
  (let ((n916 (extract 3 3 n906))) ; (bitvector 1)
  (let ((ymux (if (bitvector->bool n916) n915 n914))) ; (bitvector 48)
  (let
    ((s
      (bvxor
        $xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_782$109$_Y
        ymux))) ; (bitvector 48)
  (let
    (($and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_780$104$_Y
      (bvand xmux ymux))) ; (bitvector 48)
  (let
    (($and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_780$105$_Y
      (bvand z_optinv ymux))) ; (bitvector 48)
  (let
    (($or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_780$106$_Y
      (bvor
        $and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_780$104$_Y
        $and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_780$105$_Y))) ; (bitvector 48)
  (let
    (($and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_780$107$_Y
      (bvand xmux z_optinv))) ; (bitvector 48)
  (let
    (($or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_780$108$_Y
      (bvor
        $or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_780$106$_Y
        $and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_780$107$_Y))) ; (bitvector 48)
  (let ((n924 (extract 3 3 ALUMODE_DATA))) ; (bitvector 1)
  (let
    ((smux
      (if
        (bitvector->bool n924)
        $or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_780$108$_Y
        s))) ; (bitvector 48)
  (let ((n926 (extract 2 2 ALUMODE_DATA))) ; (bitvector 1)
  (let
    ((comux
      (if
        (bitvector->bool n926)
        (bv #b000000000000000000000000000000000000000000000000 48)
        $or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_780$108$_Y))) ; (bitvector 48)
  (let ((n928 (extract 10 0 comux))) ; (bitvector 11)
  (let ((n929 (concat n928 (bv #b0 1)))) ; (bitvector 12)
  (let ((n930 (extract 10 0 comux))) ; (bitvector 11)
  (let ((n931 (extract 11 11 comux))) ; (bitvector 1)
  (let ((n932 (zero-extend (bv #b1 1) (bitvector 2)))) ; (bitvector 2)
  (let
    (($ne$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_794$118_Y
      (bool->bitvector (not (bveq USE_SIMD_BIN n932))))) ; (bitvector 1)
  (let
    (($logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_798$115$_Y
      (bvand
        n931
        $ne$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_794$118_Y))) ; (bitvector 1)
  (let
    ((n935
      (concat
        $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_798$115$_Y
        n930))) ; (bitvector 12)
  (let ((n936 (extract 22 12 comux))) ; (bitvector 11)
  (let ((n937 (concat n936 n935))) ; (bitvector 23)
  (let ((n938 (extract 23 23 comux))) ; (bitvector 1)
  (let
    (($logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_796$117$_Y
      (bvand
        n938
        $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_675$82$_Y))) ; (bitvector 1)
  (let
    ((n940
      (concat
        $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_796$117$_Y
        n937))) ; (bitvector 24)
  (let ((n941 (extract 34 24 comux))) ; (bitvector 11)
  (let ((n942 (concat n941 n940))) ; (bitvector 35)
  (let ((n943 (extract 35 35 comux))) ; (bitvector 1)
  (let
    (($logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_794$119$_Y
      (bvand
        n943
        $ne$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_794$118_Y))) ; (bitvector 1)
  (let
    ((n945
      (concat
        $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_794$119$_Y
        n942))) ; (bitvector 36)
  (let ((n946 (extract 47 36 comux))) ; (bitvector 12)
  (let ((comux4simd (concat n946 n945))) ; (bitvector 48)
  (let ((n948 (extract 11 11 comux4simd))) ; (bitvector 1)
  (let ((n949 (concat n948 n929))) ; (bitvector 13)
  (let ((n950 (extract 22 12 comux))) ; (bitvector 11)
  (let ((n951 (concat n950 n949))) ; (bitvector 24)
  (let ((n952 (extract 23 23 comux4simd))) ; (bitvector 1)
  (let ((n953 (concat n952 n951))) ; (bitvector 25)
  (let ((n954 (extract 34 24 comux))) ; (bitvector 11)
  (let ((n955 (concat n954 n953))) ; (bitvector 36)
  (let ((n956 (extract 35 35 comux4simd))) ; (bitvector 1)
  (let ((n957 (concat n956 n955))) ; (bitvector 37)
  (let ((n958 (extract 46 36 comux))) ; (bitvector 11)
  (let ((n959 (concat n958 n957))) ; (bitvector 48)
  (let
    (($and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_805$122$_Y
      (bvand smux n959))) ; (bitvector 48)
  (let ((RND (DSP48E2_Inputs-RND inputs))) ; (bitvector 48)
  (let ((n962 (concat RND C_DATA_in))) ; (bitvector 96)
  (let ((n963 (concat ALU_OUT_reg n962))) ; (bitvector 144)
  (let
    ((n964
      (concat (bv #b000000000000000000000000000000000000000000000000 48) n963))) ; (bitvector 192)
  (let ((n965 (extract 47 0 n964))) ; (bitvector 48)
  (let ((n966 (extract 8 7 OPMODE_mux))) ; (bitvector 2)
  (let (($procmux$634_CMP (bool->bitvector (bveq n966 (bv #b11 2))))) ; (bitvector 1)
  (let (($procmux$635_CMP (bool->bitvector (bveq n966 (bv #b10 2))))) ; (bitvector 1)
  (let ((n969 (concat $procmux$635_CMP $procmux$634_CMP))) ; (bitvector 2)
  (let ((n970 (zero-extend (bv #b1 1) (bitvector 2)))) ; (bitvector 2)
  (let (($procmux$636_CMP (bool->bitvector (bveq n966 n970)))) ; (bitvector 1)
  (let ((n972 (concat $procmux$636_CMP n969))) ; (bitvector 3)
  (let ((n973 (apply bvor (bitvector->bits n966)))) ; (bitvector 1)
  (let (($procmux$637_CMP (bvnot n973))) ; (bitvector 1)
  (let ((n975 (concat $procmux$637_CMP n972))) ; (bitvector 4)
  (let ((n976 (extract 0 0 n975))) ; (bitvector 1)
  (let
    ((n977
      (if
        (bitvector->bool n976)
        n965
        (bv #b000000000000000000000000000000000000000000000000 48)))) ; (bitvector 48)
  (let ((n978 (extract 95 48 n964))) ; (bitvector 48)
  (let ((n979 (extract 1 1 n975))) ; (bitvector 1)
  (let ((n980 (if (bitvector->bool n979) n978 n977))) ; (bitvector 48)
  (let ((n981 (extract 143 96 n964))) ; (bitvector 48)
  (let ((n982 (extract 2 2 n975))) ; (bitvector 1)
  (let ((n983 (if (bitvector->bool n982) n981 n980))) ; (bitvector 48)
  (let ((n984 (extract 191 144 n964))) ; (bitvector 48)
  (let ((n985 (extract 3 3 n975))) ; (bitvector 1)
  (let ((wmux (if (bitvector->bool n985) n984 n983))) ; (bitvector 48)
  (let
    (($and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_806$123$_Y
      (bvand wmux n959))) ; (bitvector 48)
  (let
    (($or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_805$124$_Y
      (bvor
        $and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_805$122$_Y
        $and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_806$123$_Y))) ; (bitvector 48)
  (let
    (($and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_807$125$_Y
      (bvand smux wmux))) ; (bitvector 48)
  (let
    ((comux_w
      (bvor
        $or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_805$124$_Y
        $and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_807$125$_Y))) ; (bitvector 48)
  (let ((n991 (extract 10 0 comux_w))) ; (bitvector 11)
  (let ((n992 (concat n991 cin))) ; (bitvector 12)
  (let ((n993 (zero-extend n992 (bitvector 13)))) ; (bitvector 13)
  (let ((n994 (concat n930 (bv #b0 1)))) ; (bitvector 12)
  (let
    ((n995
      (concat
        $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_798$115$_Y
        n994))) ; (bitvector 13)
  (let ((n996 (concat n936 n995))) ; (bitvector 24)
  (let
    ((n997
      (concat
        $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_796$117$_Y
        n996))) ; (bitvector 25)
  (let ((n998 (concat n941 n997))) ; (bitvector 36)
  (let
    ((n999
      (concat
        $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_794$119$_Y
        n998))) ; (bitvector 37)
  (let ((n1000 (extract 46 36 comux))) ; (bitvector 11)
  (let ((n1001 (concat n1000 n999))) ; (bitvector 48)
  (let
    (($xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_804$120$_Y
      (bvxor smux n1001))) ; (bitvector 48)
  (let
    ((smux_w
      (bvxor
        $xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_804$120$_Y
        wmux))) ; (bitvector 48)
  (let ((n1004 (extract 11 0 smux_w))) ; (bitvector 12)
  (let ((n1005 (zero-extend n1004 (bitvector 13)))) ; (bitvector 13)
  (let
    (($add$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_818$128$_Y
      (bvadd n993 n1005))) ; (bitvector 13)
  (let
    ((n1007
      (extract
        11
        0
        $add$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_818$128$_Y))) ; (bitvector 12)
  (let ((n1008 (extract 11 11 comux_w))) ; (bitvector 1)
  (let
    ((co12_lsb
      (bvand
        $ne$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_794$118_Y
        n1008))) ; (bitvector 1)
  (let ((n1010 (extract 22 12 comux_w))) ; (bitvector 11)
  (let ((n1011 (concat n1010 co12_lsb))) ; (bitvector 12)
  (let ((n1012 (zero-extend n1011 (bitvector 13)))) ; (bitvector 13)
  (let ((n1013 (extract 23 12 smux_w))) ; (bitvector 12)
  (let ((n1014 (zero-extend n1013 (bitvector 13)))) ; (bitvector 13)
  (let
    (($add$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_827$136$_Y
      (bvadd n1012 n1014))) ; (bitvector 13)
  (let
    ((n1016
      (extract
        12
        12
        $add$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_818$128$_Y))) ; (bitvector 1)
  (let
    ((intc1
      (bvand
        $ne$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_794$118_Y
        n1016))) ; (bitvector 1)
  (let ((n1018 (zero-extend intc1 (bitvector 13)))) ; (bitvector 13)
  (let
    (($add$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_827$137$_Y
      (bvadd
        $add$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_827$136$_Y
        n1018))) ; (bitvector 13)
  (let
    ((n1020
      (extract
        11
        0
        $add$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_827$137$_Y))) ; (bitvector 12)
  (let ((n1021 (concat n1020 n1007))) ; (bitvector 24)
  (let ((n1022 (extract 23 23 comux_w))) ; (bitvector 1)
  (let
    ((co24_lsb
      (bvand
        $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_675$82$_Y
        n1022))) ; (bitvector 1)
  (let ((n1024 (extract 34 24 comux_w))) ; (bitvector 11)
  (let ((n1025 (concat n1024 co24_lsb))) ; (bitvector 12)
  (let ((n1026 (zero-extend n1025 (bitvector 13)))) ; (bitvector 13)
  (let ((n1027 (extract 35 24 smux_w))) ; (bitvector 12)
  (let ((n1028 (zero-extend n1027 (bitvector 13)))) ; (bitvector 13)
  (let
    (($add$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_832$145$_Y
      (bvadd n1026 n1028))) ; (bitvector 13)
  (let
    ((n1030
      (extract
        12
        12
        $add$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_827$137$_Y))) ; (bitvector 1)
  (let
    ((intc2
      (bvand
        $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_675$82$_Y
        n1030))) ; (bitvector 1)
  (let ((n1032 (zero-extend intc2 (bitvector 13)))) ; (bitvector 13)
  (let
    (($add$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_832$146$_Y
      (bvadd
        $add$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_832$145$_Y
        n1032))) ; (bitvector 13)
  (let
    ((n1034
      (extract
        11
        0
        $add$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_832$146$_Y))) ; (bitvector 12)
  (let ((n1035 (concat n1034 n1021))) ; (bitvector 36)
  (let ((n1036 (extract 35 35 comux_w))) ; (bitvector 1)
  (let
    ((co36_lsb
      (bvand
        $ne$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_794$118_Y
        n1036))) ; (bitvector 1)
  (let ((n1038 (extract 47 36 comux_w))) ; (bitvector 12)
  (let ((n1039 (concat n1038 co36_lsb))) ; (bitvector 13)
  (let ((n1040 (zero-extend n1039 (bitvector 14)))) ; (bitvector 14)
  (let ((n1041 (extract 47 36 smux_w))) ; (bitvector 12)
  (let ((n1042 (extract 47 47 comux))) ; (bitvector 1)
  (let ((n1043 (concat n1042 n1041))) ; (bitvector 13)
  (let ((n1044 (zero-extend n1043 (bitvector 14)))) ; (bitvector 14)
  (let
    (($add$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_837$154$_Y
      (bvadd n1040 n1044))) ; (bitvector 14)
  (let
    ((n1046
      (extract
        12
        12
        $add$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_832$146$_Y))) ; (bitvector 1)
  (let
    ((intc3
      (bvand
        $ne$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_794$118_Y
        n1046))) ; (bitvector 1)
  (let ((n1048 (zero-extend intc3 (bitvector 14)))) ; (bitvector 14)
  (let
    (($add$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_837$155$_Y
      (bvadd
        $add$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_837$154$_Y
        n1048))) ; (bitvector 14)
  (let
    ((n1050
      (extract
        11
        0
        $add$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_837$155$_Y))) ; (bitvector 12)
  (let ((n1051 (concat n1050 n1035))) ; (bitvector 48)
  (let ((ALU_OUT_in (bvxor n485 n1051))) ; (bitvector 48)
  (let
    (($xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1072$287_Y
      (bvxor
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1061$276$_Y
        ALU_OUT_in))) ; (bitvector 48)
  (let
    (($not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1072$288$_Y
      (bvnot
        $xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1072$287_Y))) ; (bitvector 48)
  (let ((MASK (DSP48E2_Inputs-MASK inputs))) ; (bitvector 48)
  (let ((n1056 (extract 45 0 C_DATA_in))) ; (bitvector 46)
  (let
    (($not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1067$282$_Y
      (bvnot n1056))) ; (bitvector 46)
  (let
    ((n1058
      (concat
        $not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1067$282$_Y
        (bv #b00 2)))) ; (bitvector 48)
  (let ((SEL_MASK (DSP48E2_Inputs-SEL_MASK inputs))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_462$49$_Y
      (bool->bitvector (bveq SEL_MASK (bv #b10111 5))))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$678
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_462$49$_Y)
        (bv #b11 2)
        (bv #b00 2)))) ; (bitvector 2)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_461$48$_Y
      (bool->bitvector (bveq SEL_MASK (bv #b10110 5))))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$677
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_461$48$_Y)
        (bv #b10 2)
        $auto$wreduce.cc_514_run$678))) ; (bitvector 2)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_460$47$_Y
      (bool->bitvector (bveq SEL_MASK (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$676
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_460$47$_Y)
        (bv #b01 2)
        $auto$wreduce.cc_514_run$677))) ; (bitvector 2)
  (let ((n1069 (zero-extend (bv #b1000 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_459$46$_Y
      (bool->bitvector (bveq SEL_MASK n1069)))) ; (bitvector 1)
  (let
    ((SEL_MASK_BIN
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_459$46$_Y)
        (bv #b00 2)
        $auto$wreduce.cc_514_run$676))) ; (bitvector 2)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1067$281$_Y
      (bool->bitvector (bveq SEL_MASK_BIN (bv #b11 2))))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1067$283_Y
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1067$281$_Y)
        n1058
        MASK))) ; (bitvector 48)
  (let ((n1074 (extract 46 0 C_DATA_in))) ; (bitvector 47)
  (let
    (($not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1066$280$_Y
      (bvnot n1074))) ; (bitvector 47)
  (let
    ((n1076
      (concat
        $not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1066$280$_Y
        (bv #b0 1)))) ; (bitvector 48)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1066$279$_Y
      (bool->bitvector (bveq SEL_MASK_BIN (bv #b10 2))))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1066$284_Y
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1066$279$_Y)
        n1076
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1067$283_Y))) ; (bitvector 48)
  (let ((n1079 (zero-extend (bv #b1 1) (bitvector 2)))) ; (bitvector 2)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1065$278$_Y
      (bool->bitvector (bveq SEL_MASK_BIN n1079)))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1065$285_Y
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1065$278$_Y)
        C_DATA_in
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1066$284_Y))) ; (bitvector 48)
  (let ((USE_PATTERN_DETECT (DSP48E2_Inputs-USE_PATTERN_DETECT inputs))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_478$65$_Y
      (bool->bitvector (bveq USE_PATTERN_DETECT (bv #b10101 5))))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_478$66$_Y
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_478$65$_Y)
        (bv #b1 1)
        (bv #b0 1)))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$949
      (concat
        (bv #b0000000000000000000000000000000 31)
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_478$66$_Y))) ; (bitvector 32)
  (let ((n1087 (extract 0 0 $auto$wreduce.cc_514_run$949))) ; (bitvector 1)
  (let ((n1089 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_477$64$_Y
      (bool->bitvector (bveq USE_PATTERN_DETECT n1089)))) ; (bitvector 1)
  (let
    ((USE_PATTERN_DETECT_BIN
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_477$64$_Y)
        (bv #b0 1)
        n1087))) ; (bitvector 1)
  (let
    ((the_mask
      (if
        (bitvector->bool USE_PATTERN_DETECT_BIN)
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1065$285_Y
        (bv #b111111111111111111111111111111111111111111111111 48)))) ; (bitvector 48)
  (let
    (($or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1072$289$_Y
      (bvor
        $not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1072$288$_Y
        the_mask))) ; (bitvector 48)
  (let
    ((pdet_o
      (apply
        bvand
        (bitvector->bits
          $or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1072$289$_Y)))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$778$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$778 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$780$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$780 state))) ; (bitvector 1)
  (let
    ((pdet_o_reg2
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
        $auto$clk2fflogic.cc_102_sample_data$780$_Q
        $auto$clk2fflogic.cc_102_sample_data$778$_Q))) ; (bitvector 1)
  (let ((overflow_data (if (bitvector->bool n405) pdet_o_reg2 pdet_o))) ; (bitvector 1)
  (let
    (($logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1109$312$_Y
      (bvand auto_reset_pri overflow_data))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$768$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$768 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$770$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$770 state))) ; (bitvector 1)
  (let
    ((pdet_o_reg1
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
        $auto$clk2fflogic.cc_102_sample_data$770$_Q
        $auto$clk2fflogic.cc_102_sample_data$768$_Q))) ; (bitvector 1)
  (let ((pdet_o_mux (if (bitvector->bool n405) pdet_o_reg1 pdet_o))) ; (bitvector 1)
  (let
    (($not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1109$313_Y
      (bvnot pdet_o_mux))) ; (bitvector 1)
  (let
    (($logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1109$314$_Y
      (bvand
        $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1109$312$_Y
        $not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1109$313_Y))) ; (bitvector 1)
  (let ((AUTORESET_PATDET (DSP48E2_Inputs-AUTORESET_PATDET inputs))) ; (bitvector 5)
  (let ((n1107 (zero-extend (bv #b101 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_410$22$_Y
      (bool->bitvector (bveq AUTORESET_PATDET n1107)))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$670
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_410$22$_Y)
        (bv #b10 2)
        (bv #b00 2)))) ; (bitvector 2)
  (let ((n1110 (zero-extend (bv #b100 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_409$21$_Y
      (bool->bitvector (bveq AUTORESET_PATDET n1110)))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$669
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_409$21$_Y)
        (bv #b01 2)
        $auto$wreduce.cc_514_run$670))) ; (bitvector 2)
  (let ((n1113 (zero-extend (bv #b11 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_408$20$_Y
      (bool->bitvector (bveq AUTORESET_PATDET n1113)))) ; (bitvector 1)
  (let
    ((AUTORESET_PATDET_BIN
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_408$20$_Y)
        (bv #b00 2)
        $auto$wreduce.cc_514_run$669))) ; (bitvector 2)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1108$311$_Y
      (bool->bitvector (bveq AUTORESET_PATDET_BIN (bv #b10 2))))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1108$315_Y
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1108$311$_Y)
        $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1109$314$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let
    (($logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1107$310$_Y
      (bvand auto_reset_pri pdet_o_mux))) ; (bitvector 1)
  (let ((n1119 (zero-extend (bv #b1 1) (bitvector 2)))) ; (bitvector 2)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1106$309$_Y
      (bool->bitvector (bveq AUTORESET_PATDET_BIN n1119)))) ; (bitvector 1)
  (let
    ((the_auto_reset_patdet
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1106$309$_Y)
        $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1107$310$_Y
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1108$315_Y))) ; (bitvector 1)
  (let
    (($logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1081$297$_Y
      (bvor RSTP_in the_auto_reset_patdet))) ; (bitvector 1)
  (let
    (($0_pdetb_o_reg2_0_0_
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1081$297$_Y)
        (bv #b0 1)
        $procmux$501$_Y))) ; (bitvector 1)
  (let
    (($procmux$511$_Y
      (if
        (bitvector->bool
          $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1086$298$_Y)
        pdet_o_reg1
        pdet_o_reg2))) ; (bitvector 1)
  (let
    (($0_pdet_o_reg2_0_0_
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1081$297$_Y)
        (bv #b0 1)
        $procmux$511$_Y))) ; (bitvector 1)
  (let ((n1126 (extract 0 0 ALUMODE_DATA))) ; (bitvector 1)
  (let ((n1127 (extract 1 1 ALUMODE_DATA))) ; (bitvector 1)
  (let
    (($and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_810$127$_Y
      (bvand n1126 n1127))) ; (bitvector 1)
  (let
    (($procmux$491$_Y
      (if
        (bitvector->bool
          $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1086$298$_Y)
        $and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_810$127$_Y
        ALUMODE10_reg))) ; (bitvector 1)
  (let
    (($0_ALUMODE10_reg_0_0_
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1081$297$_Y)
        (bv #b0 1)
        $procmux$491$_Y))) ; (bitvector 1)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_988$241$_Y
      (bool->bitvector (bveq n137 (bv #b10 2))))) ; (bitvector 1)
  (let
    (($procmux$549$_Y
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_988$241$_Y)
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
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_957$228$_Y
      (bool->bitvector (bveq n100 (bv #b10 2))))) ; (bitvector 1)
  (let
    (($procmux$568$_Y
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_957$228$_Y)
        A1_reg
        $procmux$565$_Y))) ; (bitvector 30)
  (let ((CEA2 (DSP48E2_Inputs-CEA2 inputs))) ; (bitvector 1)
  (let (($procmux$570$_Y (if (bitvector->bool CEA2) $procmux$568$_Y A2_reg))) ; (bitvector 30)
  (let ((RSTA (DSP48E2_Inputs-RSTA inputs))) ; (bitvector 1)
  (let ((IS_RSTA_INVERTED (DSP48E2_Inputs-IS_RSTA_INVERTED inputs))) ; (bitvector 1)
  (let ((RSTA_in (bvxor RSTA IS_RSTA_INVERTED))) ; (bitvector 1)
  (let ((n1147 (apply bvor (bitvector->bits n100)))) ; (bitvector 1)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_942$222$_Y
      (bvnot n1147))) ; (bitvector 1)
  (let
    (($logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_942$223$_Y
      (bvor
        RSTA_in
        $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_942$222$_Y))) ; (bitvector 1)
  (let
    (($0_A2_reg_29_0_
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_942$223$_Y)
        (bv #b000000000000000000000000000000 30)
        $procmux$570$_Y))) ; (bitvector 30)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$758$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$758 state))) ; (bitvector 8)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$760$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$760 state))) ; (bitvector 8)
  (let
    ((XOR_MX_reg
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
        $auto$clk2fflogic.cc_102_sample_data$760$_Q
        $auto$clk2fflogic.cc_102_sample_data$758$_Q))) ; (bitvector 8)
  (let ((n1154 (extract 5 0 s))) ; (bitvector 6)
  (let
    (($reduce_xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_844$157$_Y
      (apply bvxor (bitvector->bits n1154)))) ; (bitvector 1)
  (let ((USE_WIDEXOR (DSP48E2_Inputs-USE_WIDEXOR inputs))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_489$75$_Y
      (bool->bitvector (bveq USE_WIDEXOR (bv #b11000 5))))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_489$76$_Y
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_489$75$_Y)
        (bv #b1 1)
        (bv #b0 1)))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$950
      (concat
        (bv #b0000000000000000000000000000000 31)
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_489$76$_Y))) ; (bitvector 32)
  (let ((n1161 (extract 0 0 $auto$wreduce.cc_514_run$950))) ; (bitvector 1)
  (let ((n1163 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_488$74$_Y
      (bool->bitvector (bveq USE_WIDEXOR n1163)))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_488$77$_Y
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_488$74$_Y)
        (bv #b0 1)
        n1161))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_844$158$_Y
      (if
        (bitvector->bool
          $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_488$77$_Y)
        $reduce_xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_844$157$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n1167 (extract 11 6 s))) ; (bitvector 6)
  (let
    (($reduce_xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_845$159$_Y
      (apply bvxor (bitvector->bits n1167)))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_845$160$_Y
      (if
        (bitvector->bool
          $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_488$77$_Y)
        $reduce_xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_845$159$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let
    ((xor_24a
      (bvxor
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_844$158$_Y
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_845$160$_Y))) ; (bitvector 1)
  (let ((XORSIMD (DSP48E2_Inputs-XORSIMD inputs))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_494$79$_Y
      (bool->bitvector (bveq XORSIMD (bv #b11010 5))))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_494$80$_Y
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_494$79$_Y)
        (bv #b1 1)
        (bv #b0 1)))) ; (bitvector 1)
  (let
    (($auto$wreduce.cc_514_run$684
      (concat
        (bv #b0000000000000000000000000000000 31)
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_494$80$_Y))) ; (bitvector 32)
  (let ((n1176 (extract 0 0 $auto$wreduce.cc_514_run$684))) ; (bitvector 1)
  (let ((n1178 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_493$78$_Y
      (bool->bitvector (bveq XORSIMD n1178)))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_493$81$_Y
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_493$78$_Y)
        (bv #b0 1)
        n1176))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_878$193$_Y
      (if
        (bitvector->bool
          $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_493$81$_Y)
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_844$158$_Y
        xor_24a))) ; (bitvector 1)
  (let ((n1182 (extract 17 12 s))) ; (bitvector 6)
  (let
    (($reduce_xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_846$161$_Y
      (apply bvxor (bitvector->bits n1182)))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_846$162$_Y
      (if
        (bitvector->bool
          $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_488$77$_Y)
        $reduce_xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_846$161$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n1185 (extract 23 18 s))) ; (bitvector 6)
  (let
    (($reduce_xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_847$163$_Y
      (apply bvxor (bitvector->bits n1185)))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_847$164$_Y
      (if
        (bitvector->bool
          $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_488$77$_Y)
        $reduce_xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_847$163$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let
    ((xor_24b
      (bvxor
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_846$162$_Y
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_847$164$_Y))) ; (bitvector 1)
  (let ((xor_48a (bvxor xor_24a xor_24b))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_879$194$_Y
      (if
        (bitvector->bool
          $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_493$81$_Y)
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_845$160$_Y
        xor_48a))) ; (bitvector 1)
  (let
    ((n1191
      (concat
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_879$194$_Y
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_878$193$_Y))) ; (bitvector 2)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_880$195$_Y
      (if
        (bitvector->bool
          $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_493$81$_Y)
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_846$162$_Y
        xor_24b))) ; (bitvector 1)
  (let
    ((n1193
      (concat
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_880$195$_Y
        n1191))) ; (bitvector 3)
  (let ((n1194 (extract 29 24 s))) ; (bitvector 6)
  (let
    (($reduce_xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_848$165$_Y
      (apply bvxor (bitvector->bits n1194)))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_848$166$_Y
      (if
        (bitvector->bool
          $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_488$77$_Y)
        $reduce_xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_848$165$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n1197 (extract 35 30 s))) ; (bitvector 6)
  (let
    (($reduce_xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_849$167$_Y
      (apply bvxor (bitvector->bits n1197)))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_849$168$_Y
      (if
        (bitvector->bool
          $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_488$77$_Y)
        $reduce_xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_849$167$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let
    ((xor_24c
      (bvxor
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_848$166$_Y
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_849$168$_Y))) ; (bitvector 1)
  (let ((n1201 (extract 41 36 s))) ; (bitvector 6)
  (let
    (($reduce_xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_850$169$_Y
      (apply bvxor (bitvector->bits n1201)))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_850$170$_Y
      (if
        (bitvector->bool
          $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_488$77$_Y)
        $reduce_xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_850$169$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n1204 (extract 47 42 s))) ; (bitvector 6)
  (let
    (($reduce_xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_851$171$_Y
      (apply bvxor (bitvector->bits n1204)))) ; (bitvector 1)
  (let
    ((xor_12h
      (if
        (bitvector->bool
          $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_488$77$_Y)
        $reduce_xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_851$171$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let
    ((xor_24d
      (bvxor
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_850$170$_Y
        xor_12h))) ; (bitvector 1)
  (let ((xor_48b (bvxor xor_24c xor_24d))) ; (bitvector 1)
  (let ((xor_96 (bvxor xor_48a xor_48b))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_881$196$_Y
      (if
        (bitvector->bool
          $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_493$81$_Y)
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_847$164$_Y
        xor_96))) ; (bitvector 1)
  (let
    ((n1211
      (concat
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_881$196$_Y
        n1193))) ; (bitvector 4)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_882$197$_Y
      (if
        (bitvector->bool
          $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_493$81$_Y)
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_848$166$_Y
        xor_24c))) ; (bitvector 1)
  (let
    ((n1213
      (concat
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_882$197$_Y
        n1211))) ; (bitvector 5)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_883$198$_Y
      (if
        (bitvector->bool
          $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_493$81$_Y)
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_849$168$_Y
        xor_48b))) ; (bitvector 1)
  (let
    ((n1215
      (concat
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_883$198$_Y
        n1213))) ; (bitvector 6)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_884$199$_Y
      (if
        (bitvector->bool
          $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_493$81$_Y)
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_850$170$_Y
        xor_24d))) ; (bitvector 1)
  (let
    ((n1217
      (concat
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_884$199$_Y
        n1215))) ; (bitvector 7)
  (let ((XOR_MX_in (concat xor_12h n1217))) ; (bitvector 8)
  (let ((n1219 (extract 6 0 XOR_MX_in))) ; (bitvector 7)
  (let ((n1220 (concat xor_12h n1219))) ; (bitvector 8)
  (let
    (($procmux$476$_Y
      (if
        (bitvector->bool
          $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1086$298$_Y)
        n1220
        XOR_MX_reg))) ; (bitvector 8)
  (let
    (($0_XOR_MX_reg_7_0_
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1081$297$_Y)
        (bv #b00000000 8)
        $procmux$476$_Y))) ; (bitvector 8)
  (let
    (($procmux$516$_Y
      (if
        (bitvector->bool
          $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1086$298$_Y)
        pdet_o
        pdet_o_reg1))) ; (bitvector 1)
  (let
    (($0_pdet_o_reg1_0_0_
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1081$297$_Y)
        (bv #b0 1)
        $procmux$516$_Y))) ; (bitvector 1)
  (let
    (($or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1073$292$_Y
      (bvor
        $xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1072$287_Y
        the_mask))) ; (bitvector 48)
  (let
    ((pdetb_o
      (apply
        bvand
        (bitvector->bits
          $or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1073$292$_Y)))) ; (bitvector 1)
  (let
    (($procmux$506$_Y
      (if
        (bitvector->bool
          $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1086$298$_Y)
        pdetb_o
        pdetb_o_reg1))) ; (bitvector 1)
  (let
    (($0_pdetb_o_reg1_0_0_
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1081$297$_Y)
        (bv #b0 1)
        $procmux$506$_Y))) ; (bitvector 1)
  (let
    (($procmux$481$_Y
      (if
        (bitvector->bool
          $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1086$298$_Y)
        ALU_OUT_in
        ALU_OUT_reg))) ; (bitvector 48)
  (let
    (($0_ALU_OUT_reg_47_0_
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1081$297$_Y)
        (bv #b000000000000000000000000000000000000000000000000 48)
        $procmux$481$_Y))) ; (bitvector 48)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$738$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$738 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$740$_Q
      (DSP48E2_State-$auto$clk2fflogic.cc_102_sample_data$740 state))) ; (bitvector 1)
  (let
    ((MULTSIGN_ALU_reg
      (if
        (bitvector->bool $auto$rtlil.cc_2835_Eqx$694)
        $auto$clk2fflogic.cc_102_sample_data$740$_Q
        $auto$clk2fflogic.cc_102_sample_data$738$_Q))) ; (bitvector 1)
  (let
    ((n1235
      (extract
        13
        13
        $add$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_837$155$_Y))) ; (bitvector 1)
  (let
    (($procmux$486$_Y
      (if
        (bitvector->bool
          $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1086$298$_Y)
        n1235
        MULTSIGN_ALU_reg))) ; (bitvector 1)
  (let
    (($0_MULTSIGN_ALU_reg_0_0_
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1081$297$_Y)
        (bv #b0 1)
        $procmux$486$_Y))) ; (bitvector 1)
  (let ((n1238 (extract 11 11 comux_w))) ; (bitvector 1)
  (let
    (($xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_820$129$_Y
      (bvxor n1238 n1016))) ; (bitvector 1)
  (let ((n1240 (extract 11 11 comux))) ; (bitvector 1)
  (let
    (($xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_820$130$_Y
      (bvxor
        $xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_820$129$_Y
        n1240))) ; (bitvector 1)
  (let
    ((cout0
      (bvxor
        $and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_810$127$_Y
        $xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_820$130$_Y))) ; (bitvector 1)
  (let ((n1243 (extract 3 0 OPMODE_mux))) ; (bitvector 4)
  (let ((n1244 (zero-extend (bv #b101 3) (bitvector 4)))) ; (bitvector 4)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_864$180$_Y
      (bool->bitvector (bveq n1243 n1244)))) ; (bitvector 1)
  (let ((n1246 (extract 3 2 ALUMODE_DATA))) ; (bitvector 2)
  (let
    (($ne$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_864$181_Y
      (apply bvor (bitvector->bits n1246)))) ; (bitvector 1)
  (let
    (($logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_864$182$_Y
      (bvor
        $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_864$180$_Y
        $ne$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_864$181_Y))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_870$185$_Y
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_864$182$_Y)
        (bv #b0 1)
        cout0))) ; (bitvector 1)
  (let ((n1250 (zero-extend (bv #b1 1) (bitvector 2)))) ; (bitvector 2)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_873$186$_Y
      (bool->bitvector (bveq USE_SIMD_BIN n1250)))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_875$191$_Y
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_873$186$_Y)
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_870$185$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n1253 (extract 23 23 comux_w))) ; (bitvector 1)
  (let
    (($xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_828$138$_Y
      (bvxor n1253 n1030))) ; (bitvector 1)
  (let ((n1255 (extract 23 23 comux))) ; (bitvector 1)
  (let
    (($xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_828$139$_Y
      (bvxor
        $xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_828$138$_Y
        n1255))) ; (bitvector 1)
  (let
    ((cout1
      (bvxor
        $and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_810$127$_Y
        $xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_828$139$_Y))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_869$184$_Y
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_864$182$_Y)
        (bv #b0 1)
        cout1))) ; (bitvector 1)
  (let
    (($ne$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_874$188$_Y
      (apply bvor (bitvector->bits USE_SIMD_BIN)))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_874$189$_Y
      (if
        (bitvector->bool
          $ne$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_874$188$_Y)
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_869$184$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let
    ((n1261
      (concat
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_874$189$_Y
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_875$191$_Y))) ; (bitvector 2)
  (let ((n1262 (extract 35 35 comux_w))) ; (bitvector 1)
  (let
    (($xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_833$147$_Y
      (bvxor n1262 n1046))) ; (bitvector 1)
  (let ((n1264 (extract 35 35 comux))) ; (bitvector 1)
  (let
    (($xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_833$148$_Y
      (bvxor
        $xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_833$147$_Y
        n1264))) ; (bitvector 1)
  (let
    ((cout2
      (bvxor
        $and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_810$127$_Y
        $xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_833$148$_Y))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_868$183$_Y
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_864$182$_Y)
        (bv #b0 1)
        cout2))) ; (bitvector 1)
  (let
    (($ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_873$187$_Y
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_873$186$_Y)
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_868$183$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let
    ((n1269
      (concat
        $ternary$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_873$187$_Y
        n1261))) ; (bitvector 3)
  (let
    ((n1270
      (extract
        12
        12
        $add$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_837$155$_Y))) ; (bitvector 1)
  (let
    ((cout3
      (bvxor
        $and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_810$127$_Y
        n1270))) ; (bitvector 1)
  (let ((COUT_in (concat cout3 n1269))) ; (bitvector 4)
  (let ((n1273 (extract 2 0 COUT_in))) ; (bitvector 3)
  (let ((n1274 (concat cout3 n1273))) ; (bitvector 4)
  (let
    (($procmux$496$_Y
      (if
        (bitvector->bool
          $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1086$298$_Y)
        n1274
        COUT_reg))) ; (bitvector 4)
  (let
    (($0_COUT_reg_3_0_
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1081$297$_Y)
        (bv #b0000 4)
        $procmux$496$_Y))) ; (bitvector 4)
  (let ((CEB1 (DSP48E2_Inputs-CEB1 inputs))) ; (bitvector 1)
  (let
    (($procmux$559$_Y (if (bitvector->bool CEB1) $procmux$546$_Y B1_DATA_out))) ; (bitvector 18)
  (let ((n1279 (apply bvor (bitvector->bits n137)))) ; (bitvector 1)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_977$237$_Y
      (bvnot n1279))) ; (bitvector 1)
  (let
    (($logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_977$238$_Y
      (bvor
        RSTB_in
        $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_977$237$_Y))) ; (bitvector 1)
  (let
    (($0_B1_DATA_out_17_0_
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_977$238$_Y)
        (bv #b000000000000000000 18)
        $procmux$559$_Y))) ; (bitvector 18)
  (let ((CEA1 (DSP48E2_Inputs-CEA1 inputs))) ; (bitvector 1)
  (let (($procmux$578$_Y (if (bitvector->bool CEA1) $procmux$565$_Y A1_reg))) ; (bitvector 30)
  (let
    (($0_A1_reg_29_0_
      (if
        (bitvector->bool
          $logic_or$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_942$223$_Y)
        (bv #b000000000000000000000000000000 30)
        $procmux$578$_Y))) ; (bitvector 30)
  (let ((XOROUT (if (bitvector->bool n405) XOR_MX_reg n1220))) ; (bitvector 8)
  (let ((pdetb_o_mux (if (bitvector->bool n405) pdetb_o_reg1 pdetb_o))) ; (bitvector 1)
  (let
    (($not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1147$339_Y
      (bvnot pdetb_o_mux))) ; (bitvector 1)
  (let
    (($logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1147$340$_Y
      (bvand
        $not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1109$313_Y
        $not$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1147$339_Y))) ; (bitvector 1)
  (let ((underflow_data (if (bitvector->bool n405) pdetb_o_reg2 pdetb_o))) ; (bitvector 1)
  (let
    (($logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1149$347$_Y
      (bvand
        $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1147$340$_Y
        underflow_data))) ; (bitvector 1)
  (let
    ((UNDERFLOW
      (if
        (bitvector->bool USE_PATTERN_DETECT_BIN)
        $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1149$347$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((PCOUT (if (bitvector->bool n405) ALU_OUT_reg ALU_OUT_in))) ; (bitvector 48)
  (let
    (($logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1147$341$_Y
      (bvand
        $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1147$340$_Y
        overflow_data))) ; (bitvector 1)
  (let
    ((OVERFLOW
      (if
        (bitvector->bool USE_PATTERN_DETECT_BIN)
        $logic_and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1147$341$_Y
        (bv #b0 1)))) ; (bitvector 1)
  (let ((MULTSIGNOUT (if (bitvector->bool n405) MULTSIGN_ALU_reg n1235))) ; (bitvector 1)
  (let ((CARRYOUT (if (bitvector->bool n405) COUT_reg n1274))) ; (bitvector 4)
  (let
    (($xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1138$333_Y
      (bvxor
        $and$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_810$127$_Y
        cout3))) ; (bitvector 1)
  (let
    ((CARRYCASCOUT
      (if
        (bitvector->bool n405)
        CCOUT_in
        $xor$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_1138$333_Y))) ; (bitvector 1)
  (let ((BCASCREG (DSP48E2_Inputs-BCASCREG inputs))) ; (bitvector 32)
  (let ((n1301 (extract 1 0 BCASCREG))) ; (bitvector 2)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_999$251$_Y
      (bool->bitvector (bveq n1301 n137)))) ; (bitvector 1)
  (let
    ((BCOUT
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_999$251$_Y)
        B2_DATA
        B1_DATA_out))) ; (bitvector 18)
  (let ((ACASCREG (DSP48E2_Inputs-ACASCREG inputs))) ; (bitvector 32)
  (let ((n1305 (extract 1 0 ACASCREG))) ; (bitvector 2)
  (let
    (($eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_970$234$_Y
      (bool->bitvector (bveq n1305 n100)))) ; (bitvector 1)
  (let
    ((ACOUT
      (if
        (bitvector->bool
          $eq$modules_for_importing_xilinx_ultrascale_plus_DSP48E2.v_970$234$_Y)
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
      $0_D_DATA_reg_26_0_ ; $auto$clk2fflogic.cc:102:sample_data$700
      D_DATA_reg ; $auto$clk2fflogic.cc:102:sample_data$698
      $0_INMODE_reg_4_0_ ; $auto$clk2fflogic.cc:102:sample_data$710
      INMODE_reg ; $auto$clk2fflogic.cc:102:sample_data$708
      $0_AD_DATA_reg_26_0_ ; $auto$clk2fflogic.cc:102:sample_data$690
      AD_DATA_reg ; $auto$clk2fflogic.cc:102:sample_data$688
      $0_CARRYINSEL_reg_2_0_ ; $auto$clk2fflogic.cc:102:sample_data$910
      CARRYINSEL_reg ; $auto$clk2fflogic.cc:102:sample_data$908
      $0_CARRYIN_reg_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$890
      CARRYIN_reg ; $auto$clk2fflogic.cc:102:sample_data$888
      dr_carryin_int ; $auto$clk2fflogic.cc:102:sample_data$880
      qmultcarryin ; $auto$clk2fflogic.cc:102:sample_data$878
      $0_U_DATA_reg_44_0_ ; $auto$clk2fflogic.cc:102:sample_data$810
      U_DATA_reg ; $auto$clk2fflogic.cc:102:sample_data$808
      $0_V_DATA_reg_44_0_ ; $auto$clk2fflogic.cc:102:sample_data$820
      V_DATA_reg ; $auto$clk2fflogic.cc:102:sample_data$818
      $0_OPMODE_reg_8_0_ ; $auto$clk2fflogic.cc:102:sample_data$920
      OPMODE_reg ; $auto$clk2fflogic.cc:102:sample_data$918
      $0_C_reg_47_0_ ; $auto$clk2fflogic.cc:102:sample_data$830
      C_reg ; $auto$clk2fflogic.cc:102:sample_data$828
      $0_ALUMODE_reg_3_0_ ; $auto$clk2fflogic.cc:102:sample_data$900
      ALUMODE_reg ; $auto$clk2fflogic.cc:102:sample_data$898
      $0_pdetb_o_reg2_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$800
      pdetb_o_reg2 ; $auto$clk2fflogic.cc:102:sample_data$798
      $0_pdet_o_reg2_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$780
      pdet_o_reg2 ; $auto$clk2fflogic.cc:102:sample_data$778
      CLK_in ; $auto$clk2fflogic.cc:86:sample_control_edge$692
      $0_ALUMODE10_reg_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$730
      ALUMODE10_reg ; $auto$clk2fflogic.cc:102:sample_data$728
      $0_B2_reg_17_0_ ; $auto$clk2fflogic.cc:102:sample_data$840
      B2_reg ; $auto$clk2fflogic.cc:102:sample_data$838
      $0_A2_reg_29_0_ ; $auto$clk2fflogic.cc:102:sample_data$860
      A2_reg ; $auto$clk2fflogic.cc:102:sample_data$858
      $0_XOR_MX_reg_7_0_ ; $auto$clk2fflogic.cc:102:sample_data$760
      XOR_MX_reg ; $auto$clk2fflogic.cc:102:sample_data$758
      $0_pdet_o_reg1_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$770
      pdet_o_reg1 ; $auto$clk2fflogic.cc:102:sample_data$768
      $0_pdetb_o_reg1_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$790
      pdetb_o_reg1 ; $auto$clk2fflogic.cc:102:sample_data$788
      $0_ALU_OUT_reg_47_0_ ; $auto$clk2fflogic.cc:102:sample_data$750
      ALU_OUT_reg ; $auto$clk2fflogic.cc:102:sample_data$748
      $0_MULTSIGN_ALU_reg_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$740
      MULTSIGN_ALU_reg ; $auto$clk2fflogic.cc:102:sample_data$738
      $0_COUT_reg_3_0_ ; $auto$clk2fflogic.cc:102:sample_data$720
      COUT_reg ; $auto$clk2fflogic.cc:102:sample_data$718
      $0_B1_DATA_out_17_0_ ; $auto$clk2fflogic.cc:102:sample_data$850
      B1_DATA_out ; $auto$clk2fflogic.cc:102:sample_data$848
      $0_A1_reg_29_0_ ; $auto$clk2fflogic.cc:102:sample_data$870
      A1_reg ; $auto$clk2fflogic.cc:102:sample_data$868
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
  ))))))))))))))))))
(define DSP48E2_initial
  (DSP48E2_State
    (bv #b000000000000000000000000000 27)
    (bv #b000000000000000000000000000 27)
    (bv #b00000 5)
    (bv #b00000 5)
    (bv #b000000000000000000000000000 27)
    (bv #b000000000000000000000000000 27)
    (bv #b000 3)
    (bv #b000 3)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b000000000000000000000000000000000000000000000 45)
    (bv #b000000000000000000000000000000000000000000000 45)
    (bv #b000000000000000000000000000000000000000000000 45)
    (bv #b000000000000000000000000000000000000000000000 45)
    (bv #b000000000 9)
    (bv #b000000000 9)
    (bv #b000000000000000000000000000000000000000000000000 48)
    (bv #b000000000000000000000000000000000000000000000000 48)
    (bv #b0000 4)
    (bv #b0000 4)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
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
