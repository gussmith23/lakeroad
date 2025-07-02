#lang rosette/safe
    (provide (rename-out [MULT18X18D lattice-ecp5-mult18x18d] [MULT18X18D_initial lattice-ecp5-mult18x18d-initial] [MULT18X18D_inputs_helper lattice-ecp5-mult18x18d-inputs] [MULT18X18D_outputs_helper lattice-ecp5-mult18x18d-outputs]))(struct
  MULT18X18D_Inputs
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
    SOURCEB_MODE
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
    REG_INPUTC_RST
    REG_INPUTC_CLK
    REG_INPUTC_CE
    REG_INPUTB_RST
    REG_INPUTB_CLK
    REG_INPUTB_CE
    REG_INPUTA_RST
    REG_INPUTA_CLK
    REG_INPUTA_CE
    MULT_BYPASS
    HIGHSPEED_CLK
    GSR
    CLK3_DIV
    CLK3
    CLK2_DIV
    CLK2
    CLK1_DIV
    CLK1
    CLK0_DIV
    CLK0
    CE3
    CE2
    CE1
    CE0
    CAS_MATCH_REG
    C9
    C8
    C7
    C6
    C5
    C4
    C3
    C2
    C17
    C16
    C15
    C14
    C13
    C12
    C11
    C10
    C1
    C0
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
  ; SOURCEB_MODE (bitvector 5)
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
  ; REG_INPUTC_RST (bitvector 5)
  ; REG_INPUTC_CLK (bitvector 5)
  ; REG_INPUTC_CE (bitvector 5)
  ; REG_INPUTB_RST (bitvector 5)
  ; REG_INPUTB_CLK (bitvector 5)
  ; REG_INPUTB_CE (bitvector 5)
  ; REG_INPUTA_RST (bitvector 5)
  ; REG_INPUTA_CLK (bitvector 5)
  ; REG_INPUTA_CE (bitvector 5)
  ; MULT_BYPASS (bitvector 5)
  ; HIGHSPEED_CLK (bitvector 5)
  ; GSR (bitvector 5)
  ; CLK3_DIV (bitvector 5)
  ; CLK3 (bitvector 1)
  ; CLK2_DIV (bitvector 5)
  ; CLK2 (bitvector 1)
  ; CLK1_DIV (bitvector 5)
  ; CLK1 (bitvector 1)
  ; CLK0_DIV (bitvector 5)
  ; CLK0 (bitvector 1)
  ; CE3 (bitvector 1)
  ; CE2 (bitvector 1)
  ; CE1 (bitvector 1)
  ; CE0 (bitvector 1)
  ; CAS_MATCH_REG (bitvector 5)
  ; C9 (bitvector 1)
  ; C8 (bitvector 1)
  ; C7 (bitvector 1)
  ; C6 (bitvector 1)
  ; C5 (bitvector 1)
  ; C4 (bitvector 1)
  ; C3 (bitvector 1)
  ; C2 (bitvector 1)
  ; C17 (bitvector 1)
  ; C16 (bitvector 1)
  ; C15 (bitvector 1)
  ; C14 (bitvector 1)
  ; C13 (bitvector 1)
  ; C12 (bitvector 1)
  ; C11 (bitvector 1)
  ; C10 (bitvector 1)
  ; C1 (bitvector 1)
  ; C0 (bitvector 1)
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
  MULT18X18D_Outputs
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
    ROC9
    ROC8
    ROC7
    ROC6
    ROC5
    ROC4
    ROC3
    ROC2
    ROC17
    ROC16
    ROC15
    ROC14
    ROC13
    ROC12
    ROC11
    ROC10
    ROC1
    ROC0
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
  ; ROC9 (bitvector 1)
  ; ROC8 (bitvector 1)
  ; ROC7 (bitvector 1)
  ; ROC6 (bitvector 1)
  ; ROC5 (bitvector 1)
  ; ROC4 (bitvector 1)
  ; ROC3 (bitvector 1)
  ; ROC2 (bitvector 1)
  ; ROC17 (bitvector 1)
  ; ROC16 (bitvector 1)
  ; ROC15 (bitvector 1)
  ; ROC14 (bitvector 1)
  ; ROC13 (bitvector 1)
  ; ROC12 (bitvector 1)
  ; ROC11 (bitvector 1)
  ; ROC10 (bitvector 1)
  ; ROC1 (bitvector 1)
  ; ROC0 (bitvector 1)
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
  MULT18X18D_State
  ($auto$clk2fflogic.cc_86_sample_control_edge$2821
    $auto$clk2fflogic.cc_86_sample_control_edge$2811
    $auto$clk2fflogic.cc_86_sample_control_edge$2831
    $auto$clk2fflogic.cc_86_sample_control_edge$2841
    $auto$clk2fflogic.cc_102_sample_data$2817
    $auto$clk2fflogic.cc_102_sample_data$2819
    $auto$clk2fflogic.cc_102_sample_data$2807
    $auto$clk2fflogic.cc_102_sample_data$2809
    $auto$clk2fflogic.cc_102_sample_data$2827
    $auto$clk2fflogic.cc_102_sample_data$2829
    $auto$clk2fflogic.cc_102_sample_data$2645
    $auto$clk2fflogic.cc_102_sample_data$2651
    $auto$clk2fflogic.cc_74_sample_control$2649
    $auto$clk2fflogic.cc_102_sample_data$2633
    $auto$clk2fflogic.cc_102_sample_data$2639
    $auto$clk2fflogic.cc_74_sample_control$2637
    $auto$clk2fflogic.cc_102_sample_data$2837
    $auto$clk2fflogic.cc_102_sample_data$2839
    $auto$clk2fflogic.cc_102_sample_data$2657
    $auto$clk2fflogic.cc_102_sample_data$2663
    $auto$clk2fflogic.cc_74_sample_control$2661
    $auto$clk2fflogic.cc_102_sample_data$2441
    $auto$clk2fflogic.cc_102_sample_data$2447
    $auto$clk2fflogic.cc_74_sample_control$2445
    $auto$clk2fflogic.cc_102_sample_data$2513
    $auto$clk2fflogic.cc_102_sample_data$2519
    $auto$clk2fflogic.cc_74_sample_control$2517
    $auto$clk2fflogic.cc_102_sample_data$2669
    $auto$clk2fflogic.cc_102_sample_data$2675
    $auto$clk2fflogic.cc_74_sample_control$2673
    $auto$clk2fflogic.cc_102_sample_data$2453
    $auto$clk2fflogic.cc_102_sample_data$2459
    $auto$clk2fflogic.cc_74_sample_control$2457
    $auto$clk2fflogic.cc_102_sample_data$2537
    $auto$clk2fflogic.cc_102_sample_data$2543
    $auto$clk2fflogic.cc_74_sample_control$2541
    $auto$clk2fflogic.cc_102_sample_data$2549
    $auto$clk2fflogic.cc_102_sample_data$2555
    $auto$clk2fflogic.cc_74_sample_control$2553
    $auto$clk2fflogic.cc_102_sample_data$2561
    $auto$clk2fflogic.cc_102_sample_data$2567
    $auto$clk2fflogic.cc_74_sample_control$2565
    $auto$clk2fflogic.cc_102_sample_data$2525
    $auto$clk2fflogic.cc_102_sample_data$2531
    $auto$clk2fflogic.cc_74_sample_control$2529
    $auto$clk2fflogic.cc_102_sample_data$2573
    $auto$clk2fflogic.cc_102_sample_data$2579
    $auto$clk2fflogic.cc_74_sample_control$2577
    $auto$clk2fflogic.cc_86_sample_control_edge$2791
    $auto$clk2fflogic.cc_102_sample_data$2477
    $auto$clk2fflogic.cc_102_sample_data$2483
    $auto$clk2fflogic.cc_74_sample_control$2481
    $auto$clk2fflogic.cc_102_sample_data$2489
    $auto$clk2fflogic.cc_102_sample_data$2495
    $auto$clk2fflogic.cc_74_sample_control$2493
    $auto$clk2fflogic.cc_102_sample_data$2501
    $auto$clk2fflogic.cc_102_sample_data$2507
    $auto$clk2fflogic.cc_74_sample_control$2505
    $auto$clk2fflogic.cc_102_sample_data$2465
    $auto$clk2fflogic.cc_102_sample_data$2471
    $auto$clk2fflogic.cc_74_sample_control$2469
    $auto$clk2fflogic.cc_86_sample_control_edge$2731
    $auto$clk2fflogic.cc_102_sample_data$2597
    $auto$clk2fflogic.cc_102_sample_data$2603
    $auto$clk2fflogic.cc_74_sample_control$2601
    $auto$clk2fflogic.cc_102_sample_data$2609
    $auto$clk2fflogic.cc_102_sample_data$2615
    $auto$clk2fflogic.cc_74_sample_control$2613
    $auto$clk2fflogic.cc_102_sample_data$2621
    $auto$clk2fflogic.cc_102_sample_data$2627
    $auto$clk2fflogic.cc_74_sample_control$2625
    $auto$clk2fflogic.cc_86_sample_control_edge$2771
    $auto$clk2fflogic.cc_86_sample_control_edge$2801
    $auto$clk2fflogic.cc_102_sample_data$2585
    $auto$clk2fflogic.cc_102_sample_data$2591
    $auto$clk2fflogic.cc_74_sample_control$2589
    $auto$clk2fflogic.cc_102_sample_data$2787
    $auto$clk2fflogic.cc_102_sample_data$2789
    $auto$clk2fflogic.cc_86_sample_control_edge$2721
    $auto$clk2fflogic.cc_102_sample_data$2727
    $auto$clk2fflogic.cc_102_sample_data$2729
    $auto$clk2fflogic.cc_102_sample_data$2767
    $auto$clk2fflogic.cc_102_sample_data$2769
    $auto$clk2fflogic.cc_102_sample_data$2797
    $auto$clk2fflogic.cc_102_sample_data$2799
    $auto$clk2fflogic.cc_86_sample_control_edge$2751
    $auto$clk2fflogic.cc_86_sample_control_edge$2761
    $auto$clk2fflogic.cc_86_sample_control_edge$2781
    $auto$clk2fflogic.cc_86_sample_control_edge$2741
    $auto$clk2fflogic.cc_102_sample_data$2693
    $auto$clk2fflogic.cc_102_sample_data$2699
    $auto$clk2fflogic.cc_74_sample_control$2697
    $auto$clk2fflogic.cc_102_sample_data$2705
    $auto$clk2fflogic.cc_102_sample_data$2711
    $auto$clk2fflogic.cc_74_sample_control$2709
    $auto$clk2fflogic.cc_102_sample_data$2717
    $auto$clk2fflogic.cc_102_sample_data$2719
    $auto$clk2fflogic.cc_102_sample_data$2681
    $auto$clk2fflogic.cc_102_sample_data$2687
    $auto$clk2fflogic.cc_74_sample_control$2685
    $auto$clk2fflogic.cc_102_sample_data$2747
    $auto$clk2fflogic.cc_102_sample_data$2749
    $auto$clk2fflogic.cc_102_sample_data$2757
    $auto$clk2fflogic.cc_102_sample_data$2759
    $auto$clk2fflogic.cc_102_sample_data$2777
    $auto$clk2fflogic.cc_102_sample_data$2779
    $auto$clk2fflogic.cc_102_sample_data$2737
    $auto$clk2fflogic.cc_102_sample_data$2739)
  #:transparent
  ; $auto$clk2fflogic.cc_86_sample_control_edge$2821 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$2811 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$2831 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$2841 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2817 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2819 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2807 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2809 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2827 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2829 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2645 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2651 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$2649 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2633 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2639 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$2637 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2837 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2839 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2657 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2663 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$2661 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2441 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2447 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$2445 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2513 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2519 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$2517 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2669 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2675 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$2673 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2453 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2459 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$2457 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2537 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2543 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$2541 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2549 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2555 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$2553 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2561 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2567 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$2565 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2525 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2531 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$2529 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2573 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2579 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$2577 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$2791 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2477 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2483 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$2481 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2489 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2495 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$2493 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2501 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2507 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$2505 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2465 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2471 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$2469 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$2731 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2597 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2603 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$2601 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2609 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2615 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$2613 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2621 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2627 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$2625 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$2771 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$2801 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2585 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2591 (bitvector 1)
  ; $auto$clk2fflogic.cc_74_sample_control$2589 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2787 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$2789 (bitvector 18)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$2721 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2727 (bitvector 36)
  ; $auto$clk2fflogic.cc_102_sample_data$2729 (bitvector 36)
  ; $auto$clk2fflogic.cc_102_sample_data$2767 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2769 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2797 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2799 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$2751 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$2761 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$2781 (bitvector 1)
  ; $auto$clk2fflogic.cc_86_sample_control_edge$2741 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2693 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$2699 (bitvector 18)
  ; $auto$clk2fflogic.cc_74_sample_control$2697 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2705 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$2711 (bitvector 18)
  ; $auto$clk2fflogic.cc_74_sample_control$2709 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2717 (bitvector 36)
  ; $auto$clk2fflogic.cc_102_sample_data$2719 (bitvector 36)
  ; $auto$clk2fflogic.cc_102_sample_data$2681 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$2687 (bitvector 18)
  ; $auto$clk2fflogic.cc_74_sample_control$2685 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2747 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$2749 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$2757 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$2759 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$2777 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$2779 (bitvector 18)
  ; $auto$clk2fflogic.cc_102_sample_data$2737 (bitvector 1)
  ; $auto$clk2fflogic.cc_102_sample_data$2739 (bitvector 1)
)
(define
  (MULT18X18D_inputs_helper inputs)
  (MULT18X18D_Inputs
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
          (assoc "SOURCEB_MODE" inputs)))
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
          (assoc "REG_INPUTC_RST" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_INPUTC_CLK" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "REG_INPUTC_CE" inputs)))
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
          (assoc "HIGHSPEED_CLK" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "GSR" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "CLK3_DIV" inputs)))
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
          (assoc "CLK2_DIV" inputs)))
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
          (assoc "CLK1_DIV" inputs)))
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
          (assoc "CLK0_DIV" inputs)))
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
          (assoc "C9" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C8" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C7" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C6" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C5" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C4" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C3" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C2" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C17" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C16" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C15" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C14" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C13" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C12" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C11" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C10" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C1" inputs)))
      (if assoc-result
        (cdr assoc-result)
        (begin
          (fprintf (current-error-port) "%s not found in inputs")
          'not-found)))
    (let
      (
        (assoc-result
          (assoc "C0" inputs)))
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
  (MULT18X18D_outputs_helper outputs)
  (list
    (cons "SROB9" (MULT18X18D_Outputs-SROB9 outputs))
    (cons "SROB8" (MULT18X18D_Outputs-SROB8 outputs))
    (cons "SROB7" (MULT18X18D_Outputs-SROB7 outputs))
    (cons "SROB6" (MULT18X18D_Outputs-SROB6 outputs))
    (cons "SROB5" (MULT18X18D_Outputs-SROB5 outputs))
    (cons "SROB4" (MULT18X18D_Outputs-SROB4 outputs))
    (cons "SROB3" (MULT18X18D_Outputs-SROB3 outputs))
    (cons "SROB2" (MULT18X18D_Outputs-SROB2 outputs))
    (cons "SROB17" (MULT18X18D_Outputs-SROB17 outputs))
    (cons "SROB16" (MULT18X18D_Outputs-SROB16 outputs))
    (cons "SROB15" (MULT18X18D_Outputs-SROB15 outputs))
    (cons "SROB14" (MULT18X18D_Outputs-SROB14 outputs))
    (cons "SROB13" (MULT18X18D_Outputs-SROB13 outputs))
    (cons "SROB12" (MULT18X18D_Outputs-SROB12 outputs))
    (cons "SROB11" (MULT18X18D_Outputs-SROB11 outputs))
    (cons "SROB10" (MULT18X18D_Outputs-SROB10 outputs))
    (cons "SROB1" (MULT18X18D_Outputs-SROB1 outputs))
    (cons "SROB0" (MULT18X18D_Outputs-SROB0 outputs))
    (cons "SROA9" (MULT18X18D_Outputs-SROA9 outputs))
    (cons "SROA8" (MULT18X18D_Outputs-SROA8 outputs))
    (cons "SROA7" (MULT18X18D_Outputs-SROA7 outputs))
    (cons "SROA6" (MULT18X18D_Outputs-SROA6 outputs))
    (cons "SROA5" (MULT18X18D_Outputs-SROA5 outputs))
    (cons "SROA4" (MULT18X18D_Outputs-SROA4 outputs))
    (cons "SROA3" (MULT18X18D_Outputs-SROA3 outputs))
    (cons "SROA2" (MULT18X18D_Outputs-SROA2 outputs))
    (cons "SROA17" (MULT18X18D_Outputs-SROA17 outputs))
    (cons "SROA16" (MULT18X18D_Outputs-SROA16 outputs))
    (cons "SROA15" (MULT18X18D_Outputs-SROA15 outputs))
    (cons "SROA14" (MULT18X18D_Outputs-SROA14 outputs))
    (cons "SROA13" (MULT18X18D_Outputs-SROA13 outputs))
    (cons "SROA12" (MULT18X18D_Outputs-SROA12 outputs))
    (cons "SROA11" (MULT18X18D_Outputs-SROA11 outputs))
    (cons "SROA10" (MULT18X18D_Outputs-SROA10 outputs))
    (cons "SROA1" (MULT18X18D_Outputs-SROA1 outputs))
    (cons "SROA0" (MULT18X18D_Outputs-SROA0 outputs))
    (cons "SIGNEDP" (MULT18X18D_Outputs-SIGNEDP outputs))
    (cons "ROC9" (MULT18X18D_Outputs-ROC9 outputs))
    (cons "ROC8" (MULT18X18D_Outputs-ROC8 outputs))
    (cons "ROC7" (MULT18X18D_Outputs-ROC7 outputs))
    (cons "ROC6" (MULT18X18D_Outputs-ROC6 outputs))
    (cons "ROC5" (MULT18X18D_Outputs-ROC5 outputs))
    (cons "ROC4" (MULT18X18D_Outputs-ROC4 outputs))
    (cons "ROC3" (MULT18X18D_Outputs-ROC3 outputs))
    (cons "ROC2" (MULT18X18D_Outputs-ROC2 outputs))
    (cons "ROC17" (MULT18X18D_Outputs-ROC17 outputs))
    (cons "ROC16" (MULT18X18D_Outputs-ROC16 outputs))
    (cons "ROC15" (MULT18X18D_Outputs-ROC15 outputs))
    (cons "ROC14" (MULT18X18D_Outputs-ROC14 outputs))
    (cons "ROC13" (MULT18X18D_Outputs-ROC13 outputs))
    (cons "ROC12" (MULT18X18D_Outputs-ROC12 outputs))
    (cons "ROC11" (MULT18X18D_Outputs-ROC11 outputs))
    (cons "ROC10" (MULT18X18D_Outputs-ROC10 outputs))
    (cons "ROC1" (MULT18X18D_Outputs-ROC1 outputs))
    (cons "ROC0" (MULT18X18D_Outputs-ROC0 outputs))
    (cons "ROB9" (MULT18X18D_Outputs-ROB9 outputs))
    (cons "ROB8" (MULT18X18D_Outputs-ROB8 outputs))
    (cons "ROB7" (MULT18X18D_Outputs-ROB7 outputs))
    (cons "ROB6" (MULT18X18D_Outputs-ROB6 outputs))
    (cons "ROB5" (MULT18X18D_Outputs-ROB5 outputs))
    (cons "ROB4" (MULT18X18D_Outputs-ROB4 outputs))
    (cons "ROB3" (MULT18X18D_Outputs-ROB3 outputs))
    (cons "ROB2" (MULT18X18D_Outputs-ROB2 outputs))
    (cons "ROB17" (MULT18X18D_Outputs-ROB17 outputs))
    (cons "ROB16" (MULT18X18D_Outputs-ROB16 outputs))
    (cons "ROB15" (MULT18X18D_Outputs-ROB15 outputs))
    (cons "ROB14" (MULT18X18D_Outputs-ROB14 outputs))
    (cons "ROB13" (MULT18X18D_Outputs-ROB13 outputs))
    (cons "ROB12" (MULT18X18D_Outputs-ROB12 outputs))
    (cons "ROB11" (MULT18X18D_Outputs-ROB11 outputs))
    (cons "ROB10" (MULT18X18D_Outputs-ROB10 outputs))
    (cons "ROB1" (MULT18X18D_Outputs-ROB1 outputs))
    (cons "ROB0" (MULT18X18D_Outputs-ROB0 outputs))
    (cons "ROA9" (MULT18X18D_Outputs-ROA9 outputs))
    (cons "ROA8" (MULT18X18D_Outputs-ROA8 outputs))
    (cons "ROA7" (MULT18X18D_Outputs-ROA7 outputs))
    (cons "ROA6" (MULT18X18D_Outputs-ROA6 outputs))
    (cons "ROA5" (MULT18X18D_Outputs-ROA5 outputs))
    (cons "ROA4" (MULT18X18D_Outputs-ROA4 outputs))
    (cons "ROA3" (MULT18X18D_Outputs-ROA3 outputs))
    (cons "ROA2" (MULT18X18D_Outputs-ROA2 outputs))
    (cons "ROA17" (MULT18X18D_Outputs-ROA17 outputs))
    (cons "ROA16" (MULT18X18D_Outputs-ROA16 outputs))
    (cons "ROA15" (MULT18X18D_Outputs-ROA15 outputs))
    (cons "ROA14" (MULT18X18D_Outputs-ROA14 outputs))
    (cons "ROA13" (MULT18X18D_Outputs-ROA13 outputs))
    (cons "ROA12" (MULT18X18D_Outputs-ROA12 outputs))
    (cons "ROA11" (MULT18X18D_Outputs-ROA11 outputs))
    (cons "ROA10" (MULT18X18D_Outputs-ROA10 outputs))
    (cons "ROA1" (MULT18X18D_Outputs-ROA1 outputs))
    (cons "ROA0" (MULT18X18D_Outputs-ROA0 outputs))
    (cons "P9" (MULT18X18D_Outputs-P9 outputs))
    (cons "P8" (MULT18X18D_Outputs-P8 outputs))
    (cons "P7" (MULT18X18D_Outputs-P7 outputs))
    (cons "P6" (MULT18X18D_Outputs-P6 outputs))
    (cons "P5" (MULT18X18D_Outputs-P5 outputs))
    (cons "P4" (MULT18X18D_Outputs-P4 outputs))
    (cons "P35" (MULT18X18D_Outputs-P35 outputs))
    (cons "P34" (MULT18X18D_Outputs-P34 outputs))
    (cons "P33" (MULT18X18D_Outputs-P33 outputs))
    (cons "P32" (MULT18X18D_Outputs-P32 outputs))
    (cons "P31" (MULT18X18D_Outputs-P31 outputs))
    (cons "P30" (MULT18X18D_Outputs-P30 outputs))
    (cons "P3" (MULT18X18D_Outputs-P3 outputs))
    (cons "P29" (MULT18X18D_Outputs-P29 outputs))
    (cons "P28" (MULT18X18D_Outputs-P28 outputs))
    (cons "P27" (MULT18X18D_Outputs-P27 outputs))
    (cons "P26" (MULT18X18D_Outputs-P26 outputs))
    (cons "P25" (MULT18X18D_Outputs-P25 outputs))
    (cons "P24" (MULT18X18D_Outputs-P24 outputs))
    (cons "P23" (MULT18X18D_Outputs-P23 outputs))
    (cons "P22" (MULT18X18D_Outputs-P22 outputs))
    (cons "P21" (MULT18X18D_Outputs-P21 outputs))
    (cons "P20" (MULT18X18D_Outputs-P20 outputs))
    (cons "P2" (MULT18X18D_Outputs-P2 outputs))
    (cons "P19" (MULT18X18D_Outputs-P19 outputs))
    (cons "P18" (MULT18X18D_Outputs-P18 outputs))
    (cons "P17" (MULT18X18D_Outputs-P17 outputs))
    (cons "P16" (MULT18X18D_Outputs-P16 outputs))
    (cons "P15" (MULT18X18D_Outputs-P15 outputs))
    (cons "P14" (MULT18X18D_Outputs-P14 outputs))
    (cons "P13" (MULT18X18D_Outputs-P13 outputs))
    (cons "P12" (MULT18X18D_Outputs-P12 outputs))
    (cons "P11" (MULT18X18D_Outputs-P11 outputs))
    (cons "P10" (MULT18X18D_Outputs-P10 outputs))
    (cons "P1" (MULT18X18D_Outputs-P1 outputs))
    (cons "P0" (MULT18X18D_Outputs-P0 outputs))))
(define (MULT18X18D inputs state)
  (let ((CLK2 (MULT18X18D_Inputs-CLK2 inputs))) ; (bitvector 1)
  (let ((CLK3 (MULT18X18D_Inputs-CLK3 inputs))) ; (bitvector 1)
  (let ((CLK1 (MULT18X18D_Inputs-CLK1 inputs))) ; (bitvector 1)
  (let ((CLK0 (MULT18X18D_Inputs-CLK0 inputs))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2817$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2817 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2819$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2819 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK2_sampled$2820
      (MULT18X18D_State-$auto$clk2fflogic.cc_86_sample_control_edge$2821 state))) ; (bitvector 1)
  (let
    ((n7
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK2_sampled$2820
        CLK2))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$2822$_Y
      (bool->bitvector (bveq n7 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((CLK2_div
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$2822$_Y)
        $auto$clk2fflogic.cc_102_sample_data$2819$_Q
        $auto$clk2fflogic.cc_102_sample_data$2817$_Q))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_701$9$_Y
      (bvnot CLK2_div))) ; (bitvector 1)
  (let ((CLK2_DIV (MULT18X18D_Inputs-CLK2_DIV inputs))) ; (bitvector 5)
  (let ((n14 (zero-extend (bv #b11 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_701$8_Y
      (bool->bitvector (bveq CLK2_DIV n14)))) ; (bitvector 1)
  (let
    (($0_CLK2_div_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_701$8_Y)
        $not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_701$9$_Y
        CLK2_div))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2807$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2807 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2809$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2809 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK3_sampled$2810
      (MULT18X18D_State-$auto$clk2fflogic.cc_86_sample_control_edge$2811 state))) ; (bitvector 1)
  (let
    ((n20
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK3_sampled$2810
        CLK3))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$2812$_Y
      (bool->bitvector (bveq n20 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((CLK3_div
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$2812$_Y)
        $auto$clk2fflogic.cc_102_sample_data$2809$_Q
        $auto$clk2fflogic.cc_102_sample_data$2807$_Q))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_705$12$_Y
      (bvnot CLK3_div))) ; (bitvector 1)
  (let ((CLK3_DIV (MULT18X18D_Inputs-CLK3_DIV inputs))) ; (bitvector 5)
  (let ((n25 (zero-extend (bv #b11 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_705$11_Y
      (bool->bitvector (bveq CLK3_DIV n25)))) ; (bitvector 1)
  (let
    (($0_CLK3_div_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_705$11_Y)
        $not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_705$12$_Y
        CLK3_div))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2827$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2827 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2829$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2829 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK1_sampled$2830
      (MULT18X18D_State-$auto$clk2fflogic.cc_86_sample_control_edge$2831 state))) ; (bitvector 1)
  (let
    ((n31
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK1_sampled$2830
        CLK1))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$2832$_Y
      (bool->bitvector (bveq n31 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((CLK1_div
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$2832$_Y)
        $auto$clk2fflogic.cc_102_sample_data$2829$_Q
        $auto$clk2fflogic.cc_102_sample_data$2827$_Q))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_697$6$_Y
      (bvnot CLK1_div))) ; (bitvector 1)
  (let ((CLK1_DIV (MULT18X18D_Inputs-CLK1_DIV inputs))) ; (bitvector 5)
  (let ((n36 (zero-extend (bv #b11 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_697$5_Y
      (bool->bitvector (bveq CLK1_DIV n36)))) ; (bitvector 1)
  (let
    (($0_CLK1_div_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_697$5_Y)
        $not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_697$6$_Y
        CLK1_div))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_CLK2b_sampled$2644
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2645 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_CLK2b_0_0__sampled$2650
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2651 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2647_sampled$2648
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2649 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2652$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2647_sampled$2648)
        $auto$clk2fflogic.cc_95_sample_data$$0_CLK2b_0_0__sampled$2650
        $auto$clk2fflogic.cc_95_sample_data$_CLK2b_sampled$2644))) ; (bitvector 1)
  (let
    (($0_CLK2b_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_701$8_Y)
        CLK2_div
        CLK2))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$2321$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_701$8_Y))) ; (bitvector 1)
  (let ((n46 (zero-extend (bv #b101 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_720$21_Y
      (bool->bitvector (bveq CLK2_DIV n46)))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$2325$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_720$21_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2335$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2321$_Y
        $auto$proc_dlatch.cc_249_make_hold$2325$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2922_ReduceOr$2344
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2321$_Y
        $auto$proc_dlatch.cc_262_make_hold$2335$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$2647 (bvnot $auto$rtlil.cc_2922_ReduceOr$2344))) ; (bitvector 1)
  (let
    ((CLK2b
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2647)
        $0_CLK2b_0_0_
        $auto$clk2fflogic.cc_117_mux$2652$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_CLK3b_sampled$2632
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2633 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_CLK3b_0_0__sampled$2638
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2639 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2635_sampled$2636
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2637 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2640$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2635_sampled$2636)
        $auto$clk2fflogic.cc_95_sample_data$$0_CLK3b_0_0__sampled$2638
        $auto$clk2fflogic.cc_95_sample_data$_CLK3b_sampled$2632))) ; (bitvector 1)
  (let
    (($0_CLK3b_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_705$11_Y)
        CLK3_div
        CLK3))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$2294$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_705$11_Y))) ; (bitvector 1)
  (let ((n59 (zero-extend (bv #b101 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_725$24_Y
      (bool->bitvector (bveq CLK3_DIV n59)))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$2298$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_725$24_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2308$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2294$_Y
        $auto$proc_dlatch.cc_249_make_hold$2298$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2922_ReduceOr$2317
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2294$_Y
        $auto$proc_dlatch.cc_262_make_hold$2308$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$2635 (bvnot $auto$rtlil.cc_2922_ReduceOr$2317))) ; (bitvector 1)
  (let
    ((CLK3b
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2635)
        $0_CLK3b_0_0_
        $auto$clk2fflogic.cc_117_mux$2640$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_CLK0_div_sampled$2836
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2837 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_CLK0_div_0_0__sampled$2838
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2839 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$2840
      (MULT18X18D_State-$auto$clk2fflogic.cc_86_sample_control_edge$2841 state))) ; (bitvector 1)
  (let
    ((n69
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_CLK0_sampled$2840
        CLK0))) ; (bitvector 2)
  (let
    (($auto$rtlil.cc_2974_Eqx$2843 (bool->bitvector (bveq n69 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((CLK0_div
      (if
        (bitvector->bool $auto$rtlil.cc_2974_Eqx$2843)
        $auto$clk2fflogic.cc_95_sample_data$$0_CLK0_div_0_0__sampled$2838
        $auto$clk2fflogic.cc_95_sample_data$_CLK0_div_sampled$2836))) ; (bitvector 1)
  (let
    (($not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_693$3$_Y
      (bvnot CLK0_div))) ; (bitvector 1)
  (let ((CLK0_DIV (MULT18X18D_Inputs-CLK0_DIV inputs))) ; (bitvector 5)
  (let ((n74 (zero-extend (bv #b11 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_693$2_Y
      (bool->bitvector (bveq CLK0_DIV n74)))) ; (bitvector 1)
  (let
    (($0_CLK0_div_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_693$2_Y)
        $not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_693$3$_Y
        CLK0_div))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_CLK1b_sampled$2656
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2657 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_CLK1b_0_0__sampled$2662
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2663 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2659_sampled$2660
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2661 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2664$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2659_sampled$2660)
        $auto$clk2fflogic.cc_95_sample_data$$0_CLK1b_0_0__sampled$2662
        $auto$clk2fflogic.cc_95_sample_data$_CLK1b_sampled$2656))) ; (bitvector 1)
  (let
    (($0_CLK1b_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_697$5_Y)
        CLK1_div
        CLK1))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$2348$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_697$5_Y))) ; (bitvector 1)
  (let ((n83 (zero-extend (bv #b101 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_715$18_Y
      (bool->bitvector (bveq CLK1_DIV n83)))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$2352$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_715$18_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2362$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2348$_Y
        $auto$proc_dlatch.cc_249_make_hold$2352$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2922_ReduceOr$2371
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2348$_Y
        $auto$proc_dlatch.cc_262_make_hold$2362$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$2659 (bvnot $auto$rtlil.cc_2922_ReduceOr$2371))) ; (bitvector 1)
  (let
    ((CLK1b
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2659)
        $0_CLK1b_0_0_
        $auto$clk2fflogic.cc_117_mux$2664$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_div2_clk2_sampled$2440
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2441 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_div2_clk2_0_0__sampled$2446
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2447 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2443_sampled$2444
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2445 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2448$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2443_sampled$2444)
        $auto$clk2fflogic.cc_95_sample_data$$0_div2_clk2_0_0__sampled$2446
        $auto$clk2fflogic.cc_95_sample_data$_div2_clk2_sampled$2440))) ; (bitvector 1)
  (let ((HIGHSPEED_CLK (MULT18X18D_Inputs-HIGHSPEED_CLK inputs))) ; (bitvector 5)
  (let ((n97 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_842$104_Y
      (bool->bitvector (bveq HIGHSPEED_CLK n97)))) ; (bitvector 1)
  (let
    (($procmux$334$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_842$104_Y)
        CLK3
        (bv #b0 1)))) ; (bitvector 1)
  (let ((n101 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_840$103_Y
      (bool->bitvector (bveq HIGHSPEED_CLK n101)))) ; (bitvector 1)
  (let
    (($procmux$337$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_840$103_Y)
        CLK2
        $procmux$334$_Y))) ; (bitvector 1)
  (let ((n105 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_838$102_Y
      (bool->bitvector (bveq HIGHSPEED_CLK n105)))) ; (bitvector 1)
  (let
    (($procmux$340$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_838$102_Y)
        CLK1
        $procmux$337$_Y))) ; (bitvector 1)
  (let ((n109 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_836$101_Y
      (bool->bitvector (bveq HIGHSPEED_CLK n109)))) ; (bitvector 1)
  (let
    (($0_div2_clk2_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_836$101_Y)
        CLK0
        $procmux$340$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$1007
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_836$101_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1008$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_838$102_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1010$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_840$103_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1012$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_842$104_Y))) ; (bitvector 1)
  (let ((n116 (apply bvor (bitvector->bits HIGHSPEED_CLK)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_844$105_Y
      (bvnot n116))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1014$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_844$105_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1024$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1012$_Y
        $auto$proc_dlatch.cc_249_make_hold$1014$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1030$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1010$_Y
        $auto$proc_dlatch.cc_262_make_hold$1024$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1036$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1008$_Y
        $auto$proc_dlatch.cc_262_make_hold$1030$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2922_ReduceOr$1045
      (bvand
        $auto$rtlil.cc_2918_Not$1007
        $auto$proc_dlatch.cc_262_make_hold$1036$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$2443 (bvnot $auto$rtlil.cc_2922_ReduceOr$1045))) ; (bitvector 1)
  (let
    ((div2_clk2
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2443)
        $0_div2_clk2_0_0_
        $auto$clk2fflogic.cc_117_mux$2448$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_output_ce_sig_sampled$2512
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2513 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_output_ce_sig_0_0__sampled$2518
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2519 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2515_sampled$2516
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2517 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2520$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2515_sampled$2516)
        $auto$clk2fflogic.cc_95_sample_data$$0_output_ce_sig_0_0__sampled$2518
        $auto$clk2fflogic.cc_95_sample_data$_output_ce_sig_sampled$2512))) ; (bitvector 1)
  (let ((CE3 (MULT18X18D_Inputs-CE3 inputs))) ; (bitvector 1)
  (let ((CE2 (MULT18X18D_Inputs-CE2 inputs))) ; (bitvector 1)
  (let ((REG_OUTPUT_CE (MULT18X18D_Inputs-REG_OUTPUT_CE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_794$73_Y
      (bool->bitvector (bveq REG_OUTPUT_CE (bv #b10000 5))))) ; (bitvector 1)
  (let
    (($procmux$508$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_794$73_Y)
        CE2
        CE3))) ; (bitvector 1)
  (let ((CE1 (MULT18X18D_Inputs-CE1 inputs))) ; (bitvector 1)
  (let ((n137 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_793$72_Y
      (bool->bitvector (bveq REG_OUTPUT_CE n137)))) ; (bitvector 1)
  (let
    (($procmux$517$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_793$72_Y)
        CE1
        $procmux$508$_Y))) ; (bitvector 1)
  (let ((CE0 (MULT18X18D_Inputs-CE0 inputs))) ; (bitvector 1)
  (let ((n142 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_792$71_Y
      (bool->bitvector (bveq REG_OUTPUT_CE n142)))) ; (bitvector 1)
  (let
    (($0_output_ce_sig_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_792$71_Y)
        CE0
        $procmux$517$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1464$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_792$71_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1468$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_793$72_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1474$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_794$73_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_795$74_Y
      (bool->bitvector (bveq REG_OUTPUT_CE (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1482$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_795$74_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1492$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1474$_Y
        $auto$proc_dlatch.cc_249_make_hold$1482$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1498$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1468$_Y
        $auto$proc_dlatch.cc_262_make_hold$1492$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1504$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1464$_Y
        $auto$proc_dlatch.cc_262_make_hold$1498$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1510$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1474$_Y
        $auto$proc_dlatch.cc_262_make_hold$1504$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1516$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1468$_Y
        $auto$proc_dlatch.cc_262_make_hold$1510$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1522$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1464$_Y
        $auto$proc_dlatch.cc_262_make_hold$1516$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1528$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1468$_Y
        $auto$proc_dlatch.cc_262_make_hold$1522$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1534$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1464$_Y
        $auto$proc_dlatch.cc_262_make_hold$1528$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2922_ReduceOr$1543
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1464$_Y
        $auto$proc_dlatch.cc_262_make_hold$1534$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$2515 (bvnot $auto$rtlil.cc_2922_ReduceOr$1543))) ; (bitvector 1)
  (let
    ((output_ce_sig
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2515)
        $0_output_ce_sig_0_0_
        $auto$clk2fflogic.cc_117_mux$2520$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_CLK0b_sampled$2668
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2669 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_CLK0b_0_0__sampled$2674
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2675 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2671_sampled$2672
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2673 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2676$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2671_sampled$2672)
        $auto$clk2fflogic.cc_95_sample_data$$0_CLK0b_0_0__sampled$2674
        $auto$clk2fflogic.cc_95_sample_data$_CLK0b_sampled$2668))) ; (bitvector 1)
  (let
    (($0_CLK0b_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_693$2_Y)
        CLK0_div
        CLK0))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$2375$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_693$2_Y))) ; (bitvector 1)
  (let ((n168 (zero-extend (bv #b101 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_710$15_Y
      (bool->bitvector (bveq CLK0_DIV n168)))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$2379$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_710$15_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2389$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2375$_Y
        $auto$proc_dlatch.cc_249_make_hold$2379$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2922_ReduceOr$2398
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2375$_Y
        $auto$proc_dlatch.cc_262_make_hold$2389$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$2671 (bvnot $auto$rtlil.cc_2922_ReduceOr$2398))) ; (bitvector 1)
  (let
    ((CLK0b
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2671)
        $0_CLK0b_0_0_
        $auto$clk2fflogic.cc_117_mux$2676$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_output_rst_sig_sampled$2452
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2453 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_output_rst_sig_0_0__sampled$2458
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2459 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2455_sampled$2456
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2457 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2460$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2455_sampled$2456)
        $auto$clk2fflogic.cc_95_sample_data$$0_output_rst_sig_0_0__sampled$2458
        $auto$clk2fflogic.cc_95_sample_data$_output_rst_sig_sampled$2452))) ; (bitvector 1)
  (let ((RST3 (MULT18X18D_Inputs-RST3 inputs))) ; (bitvector 1)
  (let ((RST2 (MULT18X18D_Inputs-RST2 inputs))) ; (bitvector 1)
  (let ((REG_OUTPUT_RST (MULT18X18D_Inputs-REG_OUTPUT_RST inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_829$98_Y
      (bool->bitvector (bveq REG_OUTPUT_RST (bv #b10011 5))))) ; (bitvector 1)
  (let
    (($procmux$358$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_829$98_Y)
        RST2
        RST3))) ; (bitvector 1)
  (let ((RST1 (MULT18X18D_Inputs-RST1 inputs))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_828$97_Y
      (bool->bitvector (bveq REG_OUTPUT_RST (bv #b10010 5))))) ; (bitvector 1)
  (let
    (($procmux$367$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_828$97_Y)
        RST1
        $procmux$358$_Y))) ; (bitvector 1)
  (let ((RST0 (MULT18X18D_Inputs-RST0 inputs))) ; (bitvector 1)
  (let ((n191 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_827$96_Y
      (bool->bitvector (bveq REG_OUTPUT_RST n191)))) ; (bitvector 1)
  (let
    (($0_output_rst_sig_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_827$96_Y)
        RST0
        $procmux$367$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1049$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_827$96_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1053$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_828$97_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1059$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_829$98_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_830$99_Y
      (bool->bitvector (bveq REG_OUTPUT_RST (bv #b10100 5))))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1067$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_830$99_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1077$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1059$_Y
        $auto$proc_dlatch.cc_249_make_hold$1067$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1083$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1053$_Y
        $auto$proc_dlatch.cc_262_make_hold$1077$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1089$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1049$_Y
        $auto$proc_dlatch.cc_262_make_hold$1083$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1095$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1059$_Y
        $auto$proc_dlatch.cc_262_make_hold$1089$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1101$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1053$_Y
        $auto$proc_dlatch.cc_262_make_hold$1095$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1107$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1049$_Y
        $auto$proc_dlatch.cc_262_make_hold$1101$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1113$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1053$_Y
        $auto$proc_dlatch.cc_262_make_hold$1107$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1119$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1049$_Y
        $auto$proc_dlatch.cc_262_make_hold$1113$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2922_ReduceOr$1128
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1049$_Y
        $auto$proc_dlatch.cc_262_make_hold$1119$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$2455 (bvnot $auto$rtlil.cc_2922_ReduceOr$1128))) ; (bitvector 1)
  (let
    ((output_rst_sig
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2455)
        $0_output_rst_sig_0_0_
        $auto$clk2fflogic.cc_117_mux$2460$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_input_c_ce_sig_sampled$2536
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2537 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_input_c_ce_sig_0_0__sampled$2542
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2543 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2539_sampled$2540
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2541 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2544$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2539_sampled$2540)
        $auto$clk2fflogic.cc_95_sample_data$$0_input_c_ce_sig_0_0__sampled$2542
        $auto$clk2fflogic.cc_95_sample_data$_input_c_ce_sig_sampled$2536))) ; (bitvector 1)
  (let ((REG_INPUTC_CE (MULT18X18D_Inputs-REG_INPUTC_CE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_780$63_Y
      (bool->bitvector (bveq REG_INPUTC_CE (bv #b10000 5))))) ; (bitvector 1)
  (let
    (($procmux$568$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_780$63_Y)
        CE2
        CE3))) ; (bitvector 1)
  (let ((n218 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_779$62_Y
      (bool->bitvector (bveq REG_INPUTC_CE n218)))) ; (bitvector 1)
  (let
    (($procmux$577$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_779$62_Y)
        CE1
        $procmux$568$_Y))) ; (bitvector 1)
  (let ((n221 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_778$61_Y
      (bool->bitvector (bveq REG_INPUTC_CE n221)))) ; (bitvector 1)
  (let
    (($0_input_c_ce_sig_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_778$61_Y)
        CE0
        $procmux$577$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1630$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_778$61_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1634$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_779$62_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1640$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_780$63_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_781$64_Y
      (bool->bitvector (bveq REG_INPUTC_CE (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1648$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_781$64_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1658$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1640$_Y
        $auto$proc_dlatch.cc_249_make_hold$1648$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1664$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1634$_Y
        $auto$proc_dlatch.cc_262_make_hold$1658$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1670$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1630$_Y
        $auto$proc_dlatch.cc_262_make_hold$1664$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1676$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1640$_Y
        $auto$proc_dlatch.cc_262_make_hold$1670$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1682$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1634$_Y
        $auto$proc_dlatch.cc_262_make_hold$1676$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1688$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1630$_Y
        $auto$proc_dlatch.cc_262_make_hold$1682$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1694$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1634$_Y
        $auto$proc_dlatch.cc_262_make_hold$1688$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1700$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1630$_Y
        $auto$proc_dlatch.cc_262_make_hold$1694$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2922_ReduceOr$1709
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1630$_Y
        $auto$proc_dlatch.cc_262_make_hold$1700$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$2539 (bvnot $auto$rtlil.cc_2922_ReduceOr$1709))) ; (bitvector 1)
  (let
    ((input_c_ce_sig
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2539)
        $0_input_c_ce_sig_0_0_
        $auto$clk2fflogic.cc_117_mux$2544$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_input_b_ce_sig_sampled$2548
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2549 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_input_b_ce_sig_0_0__sampled$2554
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2555 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2551_sampled$2552
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2553 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2556$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2551_sampled$2552)
        $auto$clk2fflogic.cc_95_sample_data$$0_input_b_ce_sig_0_0__sampled$2554
        $auto$clk2fflogic.cc_95_sample_data$_input_b_ce_sig_sampled$2548))) ; (bitvector 1)
  (let ((REG_INPUTB_CE (MULT18X18D_Inputs-REG_INPUTB_CE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_773$58_Y
      (bool->bitvector (bveq REG_INPUTB_CE (bv #b10000 5))))) ; (bitvector 1)
  (let
    (($procmux$598$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_773$58_Y)
        CE2
        CE3))) ; (bitvector 1)
  (let ((n247 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_772$57_Y
      (bool->bitvector (bveq REG_INPUTB_CE n247)))) ; (bitvector 1)
  (let
    (($procmux$607$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_772$57_Y)
        CE1
        $procmux$598$_Y))) ; (bitvector 1)
  (let ((n250 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_771$56_Y
      (bool->bitvector (bveq REG_INPUTB_CE n250)))) ; (bitvector 1)
  (let
    (($0_input_b_ce_sig_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_771$56_Y)
        CE0
        $procmux$607$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1713$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_771$56_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1717$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_772$57_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1723$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_773$58_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_774$59_Y
      (bool->bitvector (bveq REG_INPUTB_CE (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1731$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_774$59_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1741$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1723$_Y
        $auto$proc_dlatch.cc_249_make_hold$1731$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1747$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1717$_Y
        $auto$proc_dlatch.cc_262_make_hold$1741$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1753$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1713$_Y
        $auto$proc_dlatch.cc_262_make_hold$1747$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1759$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1723$_Y
        $auto$proc_dlatch.cc_262_make_hold$1753$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1765$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1717$_Y
        $auto$proc_dlatch.cc_262_make_hold$1759$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1771$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1713$_Y
        $auto$proc_dlatch.cc_262_make_hold$1765$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1777$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1717$_Y
        $auto$proc_dlatch.cc_262_make_hold$1771$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1783$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1713$_Y
        $auto$proc_dlatch.cc_262_make_hold$1777$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2922_ReduceOr$1792
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1713$_Y
        $auto$proc_dlatch.cc_262_make_hold$1783$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$2551 (bvnot $auto$rtlil.cc_2922_ReduceOr$1792))) ; (bitvector 1)
  (let
    ((input_b_ce_sig
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2551)
        $0_input_b_ce_sig_0_0_
        $auto$clk2fflogic.cc_117_mux$2556$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_input_a_ce_sig_sampled$2560
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2561 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_input_a_ce_sig_0_0__sampled$2566
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2567 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2563_sampled$2564
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2565 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2568$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2563_sampled$2564)
        $auto$clk2fflogic.cc_95_sample_data$$0_input_a_ce_sig_0_0__sampled$2566
        $auto$clk2fflogic.cc_95_sample_data$_input_a_ce_sig_sampled$2560))) ; (bitvector 1)
  (let ((REG_INPUTA_CE (MULT18X18D_Inputs-REG_INPUTA_CE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_766$53_Y
      (bool->bitvector (bveq REG_INPUTA_CE (bv #b10000 5))))) ; (bitvector 1)
  (let
    (($procmux$628$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_766$53_Y)
        CE2
        CE3))) ; (bitvector 1)
  (let ((n276 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_765$52_Y
      (bool->bitvector (bveq REG_INPUTA_CE n276)))) ; (bitvector 1)
  (let
    (($procmux$637$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_765$52_Y)
        CE1
        $procmux$628$_Y))) ; (bitvector 1)
  (let ((n279 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_764$51_Y
      (bool->bitvector (bveq REG_INPUTA_CE n279)))) ; (bitvector 1)
  (let
    (($0_input_a_ce_sig_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_764$51_Y)
        CE0
        $procmux$637$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1796$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_764$51_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1800$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_765$52_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1806$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_766$53_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_767$54_Y
      (bool->bitvector (bveq REG_INPUTA_CE (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1814$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_767$54_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1824$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1806$_Y
        $auto$proc_dlatch.cc_249_make_hold$1814$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1830$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1800$_Y
        $auto$proc_dlatch.cc_262_make_hold$1824$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1836$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1796$_Y
        $auto$proc_dlatch.cc_262_make_hold$1830$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1842$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1806$_Y
        $auto$proc_dlatch.cc_262_make_hold$1836$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1848$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1800$_Y
        $auto$proc_dlatch.cc_262_make_hold$1842$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1854$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1796$_Y
        $auto$proc_dlatch.cc_262_make_hold$1848$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1860$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1800$_Y
        $auto$proc_dlatch.cc_262_make_hold$1854$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1866$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1796$_Y
        $auto$proc_dlatch.cc_262_make_hold$1860$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2922_ReduceOr$1875
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1796$_Y
        $auto$proc_dlatch.cc_262_make_hold$1866$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$2563 (bvnot $auto$rtlil.cc_2922_ReduceOr$1875))) ; (bitvector 1)
  (let
    ((input_a_ce_sig
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2563)
        $0_input_a_ce_sig_0_0_
        $auto$clk2fflogic.cc_117_mux$2568$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_pipeline_ce_sig_sampled$2524
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2525 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_pipeline_ce_sig_0_0__sampled$2530
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2531 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2527_sampled$2528
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2529 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2532$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2527_sampled$2528)
        $auto$clk2fflogic.cc_95_sample_data$$0_pipeline_ce_sig_0_0__sampled$2530
        $auto$clk2fflogic.cc_95_sample_data$_pipeline_ce_sig_sampled$2524))) ; (bitvector 1)
  (let ((REG_PIPELINE_CE (MULT18X18D_Inputs-REG_PIPELINE_CE inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_787$68_Y
      (bool->bitvector (bveq REG_PIPELINE_CE (bv #b10000 5))))) ; (bitvector 1)
  (let
    (($procmux$538$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_787$68_Y)
        CE2
        CE3))) ; (bitvector 1)
  (let ((n305 (zero-extend (bv #b1111 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_786$67_Y
      (bool->bitvector (bveq REG_PIPELINE_CE n305)))) ; (bitvector 1)
  (let
    (($procmux$547$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_786$67_Y)
        CE1
        $procmux$538$_Y))) ; (bitvector 1)
  (let ((n308 (zero-extend (bv #b1 1) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_785$66_Y
      (bool->bitvector (bveq REG_PIPELINE_CE n308)))) ; (bitvector 1)
  (let
    (($0_pipeline_ce_sig_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_785$66_Y)
        CE0
        $procmux$547$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1547$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_785$66_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1551$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_786$67_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1557$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_787$68_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_788$69_Y
      (bool->bitvector (bveq REG_PIPELINE_CE (bv #b10001 5))))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1565$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_788$69_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1575$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1557$_Y
        $auto$proc_dlatch.cc_249_make_hold$1565$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1581$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1551$_Y
        $auto$proc_dlatch.cc_262_make_hold$1575$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1587$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1547$_Y
        $auto$proc_dlatch.cc_262_make_hold$1581$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1593$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1557$_Y
        $auto$proc_dlatch.cc_262_make_hold$1587$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1599$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1551$_Y
        $auto$proc_dlatch.cc_262_make_hold$1593$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1605$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1547$_Y
        $auto$proc_dlatch.cc_262_make_hold$1599$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1611$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1551$_Y
        $auto$proc_dlatch.cc_262_make_hold$1605$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1617$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1547$_Y
        $auto$proc_dlatch.cc_262_make_hold$1611$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2922_ReduceOr$1626
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1547$_Y
        $auto$proc_dlatch.cc_262_make_hold$1617$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$2527 (bvnot $auto$rtlil.cc_2922_ReduceOr$1626))) ; (bitvector 1)
  (let
    ((pipeline_ce_sig
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2527)
        $0_pipeline_ce_sig_0_0_
        $auto$clk2fflogic.cc_117_mux$2532$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_output_clk_sig_sampled$2572
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2573 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_output_clk_sig_0_0__sampled$2578
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2579 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2575_sampled$2576
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2577 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2580$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2575_sampled$2576)
        $auto$clk2fflogic.cc_95_sample_data$$0_output_clk_sig_0_0__sampled$2578
        $auto$clk2fflogic.cc_95_sample_data$_output_clk_sig_sampled$2572))) ; (bitvector 1)
  (let ((REG_OUTPUT_CLK (MULT18X18D_Inputs-REG_OUTPUT_CLK inputs))) ; (bitvector 5)
  (let ((n332 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_759$48_Y
      (bool->bitvector (bveq REG_OUTPUT_CLK n332)))) ; (bitvector 1)
  (let
    (($procmux$658$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_759$48_Y)
        CLK2b
        CLK3b))) ; (bitvector 1)
  (let ((n335 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_758$47_Y
      (bool->bitvector (bveq REG_OUTPUT_CLK n335)))) ; (bitvector 1)
  (let
    (($procmux$667$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_758$47_Y)
        CLK1b
        $procmux$658$_Y))) ; (bitvector 1)
  (let ((n338 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_757$46_Y
      (bool->bitvector (bveq REG_OUTPUT_CLK n338)))) ; (bitvector 1)
  (let
    (($0_output_clk_sig_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_757$46_Y)
        CLK0b
        $procmux$667$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1879$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_757$46_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1883$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_758$47_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1889$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_759$48_Y))) ; (bitvector 1)
  (let ((n344 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_760$49_Y
      (bool->bitvector (bveq REG_OUTPUT_CLK n344)))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1897$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_760$49_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1907$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1889$_Y
        $auto$proc_dlatch.cc_249_make_hold$1897$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1913$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1883$_Y
        $auto$proc_dlatch.cc_262_make_hold$1907$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1919$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1879$_Y
        $auto$proc_dlatch.cc_262_make_hold$1913$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1925$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1889$_Y
        $auto$proc_dlatch.cc_262_make_hold$1919$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1931$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1883$_Y
        $auto$proc_dlatch.cc_262_make_hold$1925$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1937$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1879$_Y
        $auto$proc_dlatch.cc_262_make_hold$1931$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1943$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1883$_Y
        $auto$proc_dlatch.cc_262_make_hold$1937$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1949$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1879$_Y
        $auto$proc_dlatch.cc_262_make_hold$1943$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2922_ReduceOr$1958
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1879$_Y
        $auto$proc_dlatch.cc_262_make_hold$1949$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$2575 (bvnot $auto$rtlil.cc_2922_ReduceOr$1958))) ; (bitvector 1)
  (let
    ((output_clk_sig
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2575)
        $0_output_clk_sig_0_0_
        $auto$clk2fflogic.cc_117_mux$2580$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_input_a_clk_sig_sampled$2620
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2621 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_input_a_clk_sig_0_0__sampled$2626
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2627 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2623_sampled$2624
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2625 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2628$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2623_sampled$2624)
        $auto$clk2fflogic.cc_95_sample_data$$0_input_a_clk_sig_0_0__sampled$2626
        $auto$clk2fflogic.cc_95_sample_data$_input_a_clk_sig_sampled$2620))) ; (bitvector 1)
  (let ((REG_INPUTA_CLK (MULT18X18D_Inputs-REG_INPUTA_CLK inputs))) ; (bitvector 5)
  (let ((n363 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_731$28_Y
      (bool->bitvector (bveq REG_INPUTA_CLK n363)))) ; (bitvector 1)
  (let
    (($procmux$778$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_731$28_Y)
        CLK2b
        CLK3b))) ; (bitvector 1)
  (let ((n366 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_730$27_Y
      (bool->bitvector (bveq REG_INPUTA_CLK n366)))) ; (bitvector 1)
  (let
    (($procmux$787$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_730$27_Y)
        CLK1b
        $procmux$778$_Y))) ; (bitvector 1)
  (let ((n369 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_729$26_Y
      (bool->bitvector (bveq REG_INPUTA_CLK n369)))) ; (bitvector 1)
  (let
    (($0_input_a_clk_sig_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_729$26_Y)
        CLK0b
        $procmux$787$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$2211$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_729$26_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$2215$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_730$27_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$2221$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_731$28_Y))) ; (bitvector 1)
  (let ((n375 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_732$29_Y
      (bool->bitvector (bveq REG_INPUTA_CLK n375)))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$2229$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_732$29_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2239$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2221$_Y
        $auto$proc_dlatch.cc_249_make_hold$2229$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2245$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2215$_Y
        $auto$proc_dlatch.cc_262_make_hold$2239$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2251$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2211$_Y
        $auto$proc_dlatch.cc_262_make_hold$2245$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2257$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2221$_Y
        $auto$proc_dlatch.cc_262_make_hold$2251$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2263$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2215$_Y
        $auto$proc_dlatch.cc_262_make_hold$2257$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2269$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2211$_Y
        $auto$proc_dlatch.cc_262_make_hold$2263$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2275$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2215$_Y
        $auto$proc_dlatch.cc_262_make_hold$2269$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2281$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2211$_Y
        $auto$proc_dlatch.cc_262_make_hold$2275$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2922_ReduceOr$2290
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2211$_Y
        $auto$proc_dlatch.cc_262_make_hold$2281$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$2623 (bvnot $auto$rtlil.cc_2922_ReduceOr$2290))) ; (bitvector 1)
  (let
    ((input_a_clk_sig
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2623)
        $0_input_a_clk_sig_0_0_
        $auto$clk2fflogic.cc_117_mux$2628$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_input_c_rst_sig_sampled$2476
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2477 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_input_c_rst_sig_0_0__sampled$2482
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2483 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2479_sampled$2480
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2481 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2484$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2479_sampled$2480)
        $auto$clk2fflogic.cc_95_sample_data$$0_input_c_rst_sig_0_0__sampled$2482
        $auto$clk2fflogic.cc_95_sample_data$_input_c_rst_sig_sampled$2476))) ; (bitvector 1)
  (let ((REG_INPUTC_RST (MULT18X18D_Inputs-REG_INPUTC_RST inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_815$88_Y
      (bool->bitvector (bveq REG_INPUTC_RST (bv #b10011 5))))) ; (bitvector 1)
  (let
    (($procmux$418$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_815$88_Y)
        RST2
        RST3))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_814$87_Y
      (bool->bitvector (bveq REG_INPUTC_RST (bv #b10010 5))))) ; (bitvector 1)
  (let
    (($procmux$427$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_814$87_Y)
        RST1
        $procmux$418$_Y))) ; (bitvector 1)
  (let ((n398 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_813$86_Y
      (bool->bitvector (bveq REG_INPUTC_RST n398)))) ; (bitvector 1)
  (let
    (($0_input_c_rst_sig_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_813$86_Y)
        RST0
        $procmux$427$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1215$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_813$86_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1219$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_814$87_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1225$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_815$88_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_816$89_Y
      (bool->bitvector (bveq REG_INPUTC_RST (bv #b10100 5))))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1233$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_816$89_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1243$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1225$_Y
        $auto$proc_dlatch.cc_249_make_hold$1233$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1249$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1219$_Y
        $auto$proc_dlatch.cc_262_make_hold$1243$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1255$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1215$_Y
        $auto$proc_dlatch.cc_262_make_hold$1249$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1261$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1225$_Y
        $auto$proc_dlatch.cc_262_make_hold$1255$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1267$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1219$_Y
        $auto$proc_dlatch.cc_262_make_hold$1261$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1273$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1215$_Y
        $auto$proc_dlatch.cc_262_make_hold$1267$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1279$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1219$_Y
        $auto$proc_dlatch.cc_262_make_hold$1273$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1285$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1215$_Y
        $auto$proc_dlatch.cc_262_make_hold$1279$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2922_ReduceOr$1294
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1215$_Y
        $auto$proc_dlatch.cc_262_make_hold$1285$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$2479 (bvnot $auto$rtlil.cc_2922_ReduceOr$1294))) ; (bitvector 1)
  (let
    ((input_c_rst_sig
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2479)
        $0_input_c_rst_sig_0_0_
        $auto$clk2fflogic.cc_117_mux$2484$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_input_b_rst_sig_sampled$2488
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2489 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_input_b_rst_sig_0_0__sampled$2494
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2495 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2491_sampled$2492
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2493 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2496$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2491_sampled$2492)
        $auto$clk2fflogic.cc_95_sample_data$$0_input_b_rst_sig_0_0__sampled$2494
        $auto$clk2fflogic.cc_95_sample_data$_input_b_rst_sig_sampled$2488))) ; (bitvector 1)
  (let ((REG_INPUTB_RST (MULT18X18D_Inputs-REG_INPUTB_RST inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_808$83_Y
      (bool->bitvector (bveq REG_INPUTB_RST (bv #b10011 5))))) ; (bitvector 1)
  (let
    (($procmux$448$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_808$83_Y)
        RST2
        RST3))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_807$82_Y
      (bool->bitvector (bveq REG_INPUTB_RST (bv #b10010 5))))) ; (bitvector 1)
  (let
    (($procmux$457$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_807$82_Y)
        RST1
        $procmux$448$_Y))) ; (bitvector 1)
  (let ((n426 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_806$81_Y
      (bool->bitvector (bveq REG_INPUTB_RST n426)))) ; (bitvector 1)
  (let
    (($0_input_b_rst_sig_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_806$81_Y)
        RST0
        $procmux$457$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1298$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_806$81_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1302$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_807$82_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1308$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_808$83_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_809$84_Y
      (bool->bitvector (bveq REG_INPUTB_RST (bv #b10100 5))))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1316$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_809$84_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1326$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1308$_Y
        $auto$proc_dlatch.cc_249_make_hold$1316$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1332$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1302$_Y
        $auto$proc_dlatch.cc_262_make_hold$1326$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1338$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1298$_Y
        $auto$proc_dlatch.cc_262_make_hold$1332$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1344$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1308$_Y
        $auto$proc_dlatch.cc_262_make_hold$1338$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1350$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1302$_Y
        $auto$proc_dlatch.cc_262_make_hold$1344$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1356$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1298$_Y
        $auto$proc_dlatch.cc_262_make_hold$1350$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1362$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1302$_Y
        $auto$proc_dlatch.cc_262_make_hold$1356$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1368$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1298$_Y
        $auto$proc_dlatch.cc_262_make_hold$1362$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2922_ReduceOr$1377
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1298$_Y
        $auto$proc_dlatch.cc_262_make_hold$1368$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$2491 (bvnot $auto$rtlil.cc_2922_ReduceOr$1377))) ; (bitvector 1)
  (let
    ((input_b_rst_sig
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2491)
        $0_input_b_rst_sig_0_0_
        $auto$clk2fflogic.cc_117_mux$2496$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_input_a_rst_sig_sampled$2500
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2501 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_input_a_rst_sig_0_0__sampled$2506
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2507 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2503_sampled$2504
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2505 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2508$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2503_sampled$2504)
        $auto$clk2fflogic.cc_95_sample_data$$0_input_a_rst_sig_0_0__sampled$2506
        $auto$clk2fflogic.cc_95_sample_data$_input_a_rst_sig_sampled$2500))) ; (bitvector 1)
  (let ((REG_INPUTA_RST (MULT18X18D_Inputs-REG_INPUTA_RST inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_801$78_Y
      (bool->bitvector (bveq REG_INPUTA_RST (bv #b10011 5))))) ; (bitvector 1)
  (let
    (($procmux$478$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_801$78_Y)
        RST2
        RST3))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_800$77_Y
      (bool->bitvector (bveq REG_INPUTA_RST (bv #b10010 5))))) ; (bitvector 1)
  (let
    (($procmux$487$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_800$77_Y)
        RST1
        $procmux$478$_Y))) ; (bitvector 1)
  (let ((n454 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_799$76_Y
      (bool->bitvector (bveq REG_INPUTA_RST n454)))) ; (bitvector 1)
  (let
    (($0_input_a_rst_sig_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_799$76_Y)
        RST0
        $procmux$487$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1381$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_799$76_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1385$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_800$77_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1391$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_801$78_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_802$79_Y
      (bool->bitvector (bveq REG_INPUTA_RST (bv #b10100 5))))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1399$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_802$79_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1409$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1391$_Y
        $auto$proc_dlatch.cc_249_make_hold$1399$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1415$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1385$_Y
        $auto$proc_dlatch.cc_262_make_hold$1409$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1421$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1381$_Y
        $auto$proc_dlatch.cc_262_make_hold$1415$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1427$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1391$_Y
        $auto$proc_dlatch.cc_262_make_hold$1421$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1433$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1385$_Y
        $auto$proc_dlatch.cc_262_make_hold$1427$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1439$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1381$_Y
        $auto$proc_dlatch.cc_262_make_hold$1433$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1445$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1385$_Y
        $auto$proc_dlatch.cc_262_make_hold$1439$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1451$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1381$_Y
        $auto$proc_dlatch.cc_262_make_hold$1445$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2922_ReduceOr$1460
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1381$_Y
        $auto$proc_dlatch.cc_262_make_hold$1451$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$2503 (bvnot $auto$rtlil.cc_2922_ReduceOr$1460))) ; (bitvector 1)
  (let
    ((input_a_rst_sig
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2503)
        $0_input_a_rst_sig_0_0_
        $auto$clk2fflogic.cc_117_mux$2508$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_pipeline_rst_sig_sampled$2464
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2465 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_pipeline_rst_sig_0_0__sampled$2470
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2471 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2467_sampled$2468
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2469 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2472$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2467_sampled$2468)
        $auto$clk2fflogic.cc_95_sample_data$$0_pipeline_rst_sig_0_0__sampled$2470
        $auto$clk2fflogic.cc_95_sample_data$_pipeline_rst_sig_sampled$2464))) ; (bitvector 1)
  (let ((REG_PIPELINE_RST (MULT18X18D_Inputs-REG_PIPELINE_RST inputs))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_822$93_Y
      (bool->bitvector (bveq REG_PIPELINE_RST (bv #b10011 5))))) ; (bitvector 1)
  (let
    (($procmux$388$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_822$93_Y)
        RST2
        RST3))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_821$92_Y
      (bool->bitvector (bveq REG_PIPELINE_RST (bv #b10010 5))))) ; (bitvector 1)
  (let
    (($procmux$397$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_821$92_Y)
        RST1
        $procmux$388$_Y))) ; (bitvector 1)
  (let ((n482 (zero-extend (bv #b10 2) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_820$91_Y
      (bool->bitvector (bveq REG_PIPELINE_RST n482)))) ; (bitvector 1)
  (let
    (($0_pipeline_rst_sig_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_820$91_Y)
        RST0
        $procmux$397$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1132$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_820$91_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1136$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_821$92_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1142$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_822$93_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_823$94_Y
      (bool->bitvector (bveq REG_PIPELINE_RST (bv #b10100 5))))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1150$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_823$94_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1160$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1142$_Y
        $auto$proc_dlatch.cc_249_make_hold$1150$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1166$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1136$_Y
        $auto$proc_dlatch.cc_262_make_hold$1160$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1172$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1132$_Y
        $auto$proc_dlatch.cc_262_make_hold$1166$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1178$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1142$_Y
        $auto$proc_dlatch.cc_262_make_hold$1172$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1184$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1136$_Y
        $auto$proc_dlatch.cc_262_make_hold$1178$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1190$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1132$_Y
        $auto$proc_dlatch.cc_262_make_hold$1184$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1196$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1136$_Y
        $auto$proc_dlatch.cc_262_make_hold$1190$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1202$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1132$_Y
        $auto$proc_dlatch.cc_262_make_hold$1196$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2922_ReduceOr$1211
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1132$_Y
        $auto$proc_dlatch.cc_262_make_hold$1202$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$2467 (bvnot $auto$rtlil.cc_2922_ReduceOr$1211))) ; (bitvector 1)
  (let
    ((pipeline_rst_sig
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2467)
        $0_pipeline_rst_sig_0_0_
        $auto$clk2fflogic.cc_117_mux$2472$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_pipeline_clk_sig_sampled$2584
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2585 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_pipeline_clk_sig_0_0__sampled$2590
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2591 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2587_sampled$2588
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2589 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2592$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2587_sampled$2588)
        $auto$clk2fflogic.cc_95_sample_data$$0_pipeline_clk_sig_0_0__sampled$2590
        $auto$clk2fflogic.cc_95_sample_data$_pipeline_clk_sig_sampled$2584))) ; (bitvector 1)
  (let ((REG_PIPELINE_CLK (MULT18X18D_Inputs-REG_PIPELINE_CLK inputs))) ; (bitvector 5)
  (let ((n506 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_752$43_Y
      (bool->bitvector (bveq REG_PIPELINE_CLK n506)))) ; (bitvector 1)
  (let
    (($procmux$688$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_752$43_Y)
        CLK2b
        CLK3b))) ; (bitvector 1)
  (let ((n509 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_751$42_Y
      (bool->bitvector (bveq REG_PIPELINE_CLK n509)))) ; (bitvector 1)
  (let
    (($procmux$697$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_751$42_Y)
        CLK1b
        $procmux$688$_Y))) ; (bitvector 1)
  (let ((n512 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_750$41_Y
      (bool->bitvector (bveq REG_PIPELINE_CLK n512)))) ; (bitvector 1)
  (let
    (($0_pipeline_clk_sig_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_750$41_Y)
        CLK0b
        $procmux$697$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1962$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_750$41_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1966$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_751$42_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1972$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_752$43_Y))) ; (bitvector 1)
  (let ((n518 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_753$44_Y
      (bool->bitvector (bveq REG_PIPELINE_CLK n518)))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$1980$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_753$44_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1990$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1972$_Y
        $auto$proc_dlatch.cc_249_make_hold$1980$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$1996$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1966$_Y
        $auto$proc_dlatch.cc_262_make_hold$1990$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2002$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1962$_Y
        $auto$proc_dlatch.cc_262_make_hold$1996$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2008$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1972$_Y
        $auto$proc_dlatch.cc_262_make_hold$2002$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2014$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1966$_Y
        $auto$proc_dlatch.cc_262_make_hold$2008$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2020$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1962$_Y
        $auto$proc_dlatch.cc_262_make_hold$2014$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2026$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1966$_Y
        $auto$proc_dlatch.cc_262_make_hold$2020$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2032$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1962$_Y
        $auto$proc_dlatch.cc_262_make_hold$2026$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2922_ReduceOr$2041
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$1962$_Y
        $auto$proc_dlatch.cc_262_make_hold$2032$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$2587 (bvnot $auto$rtlil.cc_2922_ReduceOr$2041))) ; (bitvector 1)
  (let
    ((pipeline_clk_sig
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2587)
        $0_pipeline_clk_sig_0_0_
        $auto$clk2fflogic.cc_117_mux$2592$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_input_c_clk_sig_sampled$2596
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2597 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_input_c_clk_sig_0_0__sampled$2602
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2603 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2599_sampled$2600
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2601 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2604$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2599_sampled$2600)
        $auto$clk2fflogic.cc_95_sample_data$$0_input_c_clk_sig_0_0__sampled$2602
        $auto$clk2fflogic.cc_95_sample_data$_input_c_clk_sig_sampled$2596))) ; (bitvector 1)
  (let ((REG_INPUTC_CLK (MULT18X18D_Inputs-REG_INPUTC_CLK inputs))) ; (bitvector 5)
  (let ((n537 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_745$38_Y
      (bool->bitvector (bveq REG_INPUTC_CLK n537)))) ; (bitvector 1)
  (let
    (($procmux$718$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_745$38_Y)
        CLK2b
        CLK3b))) ; (bitvector 1)
  (let ((n540 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_744$37_Y
      (bool->bitvector (bveq REG_INPUTC_CLK n540)))) ; (bitvector 1)
  (let
    (($procmux$727$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_744$37_Y)
        CLK1b
        $procmux$718$_Y))) ; (bitvector 1)
  (let ((n543 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_743$36_Y
      (bool->bitvector (bveq REG_INPUTC_CLK n543)))) ; (bitvector 1)
  (let
    (($0_input_c_clk_sig_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_743$36_Y)
        CLK0b
        $procmux$727$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$2045$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_743$36_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$2049$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_744$37_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$2055$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_745$38_Y))) ; (bitvector 1)
  (let ((n549 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_746$39_Y
      (bool->bitvector (bveq REG_INPUTC_CLK n549)))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$2063$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_746$39_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2073$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2055$_Y
        $auto$proc_dlatch.cc_249_make_hold$2063$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2079$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2049$_Y
        $auto$proc_dlatch.cc_262_make_hold$2073$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2085$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2045$_Y
        $auto$proc_dlatch.cc_262_make_hold$2079$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2091$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2055$_Y
        $auto$proc_dlatch.cc_262_make_hold$2085$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2097$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2049$_Y
        $auto$proc_dlatch.cc_262_make_hold$2091$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2103$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2045$_Y
        $auto$proc_dlatch.cc_262_make_hold$2097$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2109$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2049$_Y
        $auto$proc_dlatch.cc_262_make_hold$2103$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2115$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2045$_Y
        $auto$proc_dlatch.cc_262_make_hold$2109$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2922_ReduceOr$2124
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2045$_Y
        $auto$proc_dlatch.cc_262_make_hold$2115$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$2599 (bvnot $auto$rtlil.cc_2922_ReduceOr$2124))) ; (bitvector 1)
  (let
    ((input_c_clk_sig
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2599)
        $0_input_c_clk_sig_0_0_
        $auto$clk2fflogic.cc_117_mux$2604$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_input_b_clk_sig_sampled$2608
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2609 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_input_b_clk_sig_0_0__sampled$2614
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2615 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2611_sampled$2612
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2613 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2616$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2611_sampled$2612)
        $auto$clk2fflogic.cc_95_sample_data$$0_input_b_clk_sig_0_0__sampled$2614
        $auto$clk2fflogic.cc_95_sample_data$_input_b_clk_sig_sampled$2608))) ; (bitvector 1)
  (let ((REG_INPUTB_CLK (MULT18X18D_Inputs-REG_INPUTB_CLK inputs))) ; (bitvector 5)
  (let ((n568 (zero-extend (bv #b1101 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_738$33_Y
      (bool->bitvector (bveq REG_INPUTB_CLK n568)))) ; (bitvector 1)
  (let
    (($procmux$748$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_738$33_Y)
        CLK2b
        CLK3b))) ; (bitvector 1)
  (let ((n571 (zero-extend (bv #b1100 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_737$32_Y
      (bool->bitvector (bveq REG_INPUTB_CLK n571)))) ; (bitvector 1)
  (let
    (($procmux$757$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_737$32_Y)
        CLK1b
        $procmux$748$_Y))) ; (bitvector 1)
  (let ((n574 (zero-extend (bv #b1011 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_736$31_Y
      (bool->bitvector (bveq REG_INPUTB_CLK n574)))) ; (bitvector 1)
  (let
    (($0_input_b_clk_sig_0_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_736$31_Y)
        CLK0b
        $procmux$757$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$2128$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_736$31_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$2132$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_737$32_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$2138$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_738$33_Y))) ; (bitvector 1)
  (let ((n580 (zero-extend (bv #b1110 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_739$34_Y
      (bool->bitvector (bveq REG_INPUTB_CLK n580)))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$2146$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_739$34_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2156$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2138$_Y
        $auto$proc_dlatch.cc_249_make_hold$2146$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2162$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2132$_Y
        $auto$proc_dlatch.cc_262_make_hold$2156$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2168$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2128$_Y
        $auto$proc_dlatch.cc_262_make_hold$2162$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2174$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2138$_Y
        $auto$proc_dlatch.cc_262_make_hold$2168$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2180$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2132$_Y
        $auto$proc_dlatch.cc_262_make_hold$2174$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2186$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2128$_Y
        $auto$proc_dlatch.cc_262_make_hold$2180$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2192$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2132$_Y
        $auto$proc_dlatch.cc_262_make_hold$2186$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$2198$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2128$_Y
        $auto$proc_dlatch.cc_262_make_hold$2192$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2922_ReduceOr$2207
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$2128$_Y
        $auto$proc_dlatch.cc_262_make_hold$2198$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$2611 (bvnot $auto$rtlil.cc_2922_ReduceOr$2207))) ; (bitvector 1)
  (let
    ((input_b_clk_sig
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2611)
        $0_input_b_clk_sig_0_0_
        $auto$clk2fflogic.cc_117_mux$2616$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2787$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2787 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2789$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2789 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_input_a_clk_sig_sampled$2790
      (MULT18X18D_State-$auto$clk2fflogic.cc_86_sample_control_edge$2791 state))) ; (bitvector 1)
  (let
    ((n597
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_input_a_clk_sig_sampled$2790
        input_a_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$2792$_Y
      (bool->bitvector (bveq n597 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((a_sig_gen1_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$2792$_Y)
        $auto$clk2fflogic.cc_102_sample_data$2789$_Q
        $auto$clk2fflogic.cc_102_sample_data$2787$_Q))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2777$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2777 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2779$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2779 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_input_a_clk_sig_sampled$2780
      (MULT18X18D_State-$auto$clk2fflogic.cc_86_sample_control_edge$2781 state))) ; (bitvector 1)
  (let
    ((n603
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_input_a_clk_sig_sampled$2780
        input_a_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$2782$_Y
      (bool->bitvector (bveq n603 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((a_sig_reg_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$2782$_Y)
        $auto$clk2fflogic.cc_102_sample_data$2779$_Q
        $auto$clk2fflogic.cc_102_sample_data$2777$_Q))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_a_sig_s_1_sampled$2704
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2705 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_a_sig_s_1_17_0__sampled$2710
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2711 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2707_sampled$2708
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2709 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2712$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2707_sampled$2708)
        $auto$clk2fflogic.cc_95_sample_data$$0_a_sig_s_1_17_0__sampled$2710
        $auto$clk2fflogic.cc_95_sample_data$_a_sig_s_1_sampled$2704))) ; (bitvector 18)
  (let ((A0 (MULT18X18D_Inputs-A0 inputs))) ; (bitvector 1)
  (let ((A1 (MULT18X18D_Inputs-A1 inputs))) ; (bitvector 1)
  (let ((n612 (concat A1 A0))) ; (bitvector 2)
  (let ((A2 (MULT18X18D_Inputs-A2 inputs))) ; (bitvector 1)
  (let ((n614 (concat A2 n612))) ; (bitvector 3)
  (let ((A3 (MULT18X18D_Inputs-A3 inputs))) ; (bitvector 1)
  (let ((n616 (concat A3 n614))) ; (bitvector 4)
  (let ((A4 (MULT18X18D_Inputs-A4 inputs))) ; (bitvector 1)
  (let ((n618 (concat A4 n616))) ; (bitvector 5)
  (let ((A5 (MULT18X18D_Inputs-A5 inputs))) ; (bitvector 1)
  (let ((n620 (concat A5 n618))) ; (bitvector 6)
  (let ((A6 (MULT18X18D_Inputs-A6 inputs))) ; (bitvector 1)
  (let ((n622 (concat A6 n620))) ; (bitvector 7)
  (let ((A7 (MULT18X18D_Inputs-A7 inputs))) ; (bitvector 1)
  (let ((n624 (concat A7 n622))) ; (bitvector 8)
  (let ((A8 (MULT18X18D_Inputs-A8 inputs))) ; (bitvector 1)
  (let ((n626 (concat A8 n624))) ; (bitvector 9)
  (let ((A9 (MULT18X18D_Inputs-A9 inputs))) ; (bitvector 1)
  (let ((n628 (concat A9 n626))) ; (bitvector 10)
  (let ((A10 (MULT18X18D_Inputs-A10 inputs))) ; (bitvector 1)
  (let ((n630 (concat A10 n628))) ; (bitvector 11)
  (let ((A11 (MULT18X18D_Inputs-A11 inputs))) ; (bitvector 1)
  (let ((n632 (concat A11 n630))) ; (bitvector 12)
  (let ((A12 (MULT18X18D_Inputs-A12 inputs))) ; (bitvector 1)
  (let ((n634 (concat A12 n632))) ; (bitvector 13)
  (let ((A13 (MULT18X18D_Inputs-A13 inputs))) ; (bitvector 1)
  (let ((n636 (concat A13 n634))) ; (bitvector 14)
  (let ((A14 (MULT18X18D_Inputs-A14 inputs))) ; (bitvector 1)
  (let ((n638 (concat A14 n636))) ; (bitvector 15)
  (let ((A15 (MULT18X18D_Inputs-A15 inputs))) ; (bitvector 1)
  (let ((n640 (concat A15 n638))) ; (bitvector 16)
  (let ((A16 (MULT18X18D_Inputs-A16 inputs))) ; (bitvector 1)
  (let ((n642 (concat A16 n640))) ; (bitvector 17)
  (let ((A17 (MULT18X18D_Inputs-A17 inputs))) ; (bitvector 1)
  (let ((n644 (concat A17 n642))) ; (bitvector 18)
  (let ((SRIA0 (MULT18X18D_Inputs-SRIA0 inputs))) ; (bitvector 1)
  (let ((SRIA1 (MULT18X18D_Inputs-SRIA1 inputs))) ; (bitvector 1)
  (let ((n647 (concat SRIA1 SRIA0))) ; (bitvector 2)
  (let ((SRIA2 (MULT18X18D_Inputs-SRIA2 inputs))) ; (bitvector 1)
  (let ((n649 (concat SRIA2 n647))) ; (bitvector 3)
  (let ((SRIA3 (MULT18X18D_Inputs-SRIA3 inputs))) ; (bitvector 1)
  (let ((n651 (concat SRIA3 n649))) ; (bitvector 4)
  (let ((SRIA4 (MULT18X18D_Inputs-SRIA4 inputs))) ; (bitvector 1)
  (let ((n653 (concat SRIA4 n651))) ; (bitvector 5)
  (let ((SRIA5 (MULT18X18D_Inputs-SRIA5 inputs))) ; (bitvector 1)
  (let ((n655 (concat SRIA5 n653))) ; (bitvector 6)
  (let ((SRIA6 (MULT18X18D_Inputs-SRIA6 inputs))) ; (bitvector 1)
  (let ((n657 (concat SRIA6 n655))) ; (bitvector 7)
  (let ((SRIA7 (MULT18X18D_Inputs-SRIA7 inputs))) ; (bitvector 1)
  (let ((n659 (concat SRIA7 n657))) ; (bitvector 8)
  (let ((SRIA8 (MULT18X18D_Inputs-SRIA8 inputs))) ; (bitvector 1)
  (let ((n661 (concat SRIA8 n659))) ; (bitvector 9)
  (let ((SRIA9 (MULT18X18D_Inputs-SRIA9 inputs))) ; (bitvector 1)
  (let ((n663 (concat SRIA9 n661))) ; (bitvector 10)
  (let ((SRIA10 (MULT18X18D_Inputs-SRIA10 inputs))) ; (bitvector 1)
  (let ((n665 (concat SRIA10 n663))) ; (bitvector 11)
  (let ((SRIA11 (MULT18X18D_Inputs-SRIA11 inputs))) ; (bitvector 1)
  (let ((n667 (concat SRIA11 n665))) ; (bitvector 12)
  (let ((SRIA12 (MULT18X18D_Inputs-SRIA12 inputs))) ; (bitvector 1)
  (let ((n669 (concat SRIA12 n667))) ; (bitvector 13)
  (let ((SRIA13 (MULT18X18D_Inputs-SRIA13 inputs))) ; (bitvector 1)
  (let ((n671 (concat SRIA13 n669))) ; (bitvector 14)
  (let ((SRIA14 (MULT18X18D_Inputs-SRIA14 inputs))) ; (bitvector 1)
  (let ((n673 (concat SRIA14 n671))) ; (bitvector 15)
  (let ((SRIA15 (MULT18X18D_Inputs-SRIA15 inputs))) ; (bitvector 1)
  (let ((n675 (concat SRIA15 n673))) ; (bitvector 16)
  (let ((SRIA16 (MULT18X18D_Inputs-SRIA16 inputs))) ; (bitvector 1)
  (let ((n677 (concat SRIA16 n675))) ; (bitvector 17)
  (let ((SRIA17 (MULT18X18D_Inputs-SRIA17 inputs))) ; (bitvector 1)
  (let ((n679 (concat SRIA17 n677))) ; (bitvector 18)
  (let ((SOURCEA (MULT18X18D_Inputs-SOURCEA inputs))) ; (bitvector 1)
  (let (($0_a_sig_s_1_17_0_ (if (bitvector->bool SOURCEA) n679 n644))) ; (bitvector 18)
  (let (($auto$rtlil.cc_2918_Not$2707 (bvnot (bv #b0 1)))) ; (bitvector 1)
  (let
    ((a_sig_s_1
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2707)
        $0_a_sig_s_1_17_0_
        $auto$clk2fflogic.cc_117_mux$2712$_Y))) ; (bitvector 18)
  (let ((n684 (apply bvor (bitvector->bits REG_INPUTA_CLK)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1001$142$_Y
      (bvnot n684))) ; (bitvector 1)
  (let
    ((a_sig_gen
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1001$142$_Y)
        a_sig_s_1
        a_sig_reg_sync))) ; (bitvector 18)
  (let
    (($procmux$279$_Y
      (if (bitvector->bool input_a_ce_sig) a_sig_gen a_sig_gen1_sync))) ; (bitvector 18)
  (let
    (($0_a_sig_gen1_sync_17_0_
      (if
        (bitvector->bool input_a_rst_sig)
        (bv #b000000000000000000 18)
        $procmux$279$_Y))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2727$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2727 state))) ; (bitvector 36)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2729$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2729 state))) ; (bitvector 36)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_pipeline_clk_sig_sampled$2730
      (MULT18X18D_State-$auto$clk2fflogic.cc_86_sample_control_edge$2731 state))) ; (bitvector 1)
  (let
    ((n693
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_pipeline_clk_sig_sampled$2730
        pipeline_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$2732$_Y
      (bool->bitvector (bveq n693 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((p_sig_o_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$2732$_Y)
        $auto$clk2fflogic.cc_102_sample_data$2729$_Q
        $auto$clk2fflogic.cc_102_sample_data$2727$_Q))) ; (bitvector 36)
  (let ((n696 (extract 17 17 a_sig_gen))) ; (bitvector 1)
  (let ((n697 (concat n696 n696))) ; (bitvector 2)
  (let ((n698 (concat n696 n697))) ; (bitvector 3)
  (let ((n699 (concat n696 n698))) ; (bitvector 4)
  (let ((n700 (concat n696 n699))) ; (bitvector 5)
  (let ((n701 (concat n696 n700))) ; (bitvector 6)
  (let ((n702 (concat n696 n701))) ; (bitvector 7)
  (let ((n703 (concat n696 n702))) ; (bitvector 8)
  (let ((n704 (concat n696 n703))) ; (bitvector 9)
  (let ((n705 (concat n696 n704))) ; (bitvector 10)
  (let ((n706 (concat n696 n705))) ; (bitvector 11)
  (let ((n707 (concat n696 n706))) ; (bitvector 12)
  (let ((n708 (concat n696 n707))) ; (bitvector 13)
  (let ((n709 (concat n696 n708))) ; (bitvector 14)
  (let ((n710 (concat n696 n709))) ; (bitvector 15)
  (let ((n711 (concat n696 n710))) ; (bitvector 16)
  (let ((n712 (concat n696 n711))) ; (bitvector 17)
  (let ((n713 (concat n696 n712))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2797$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2797 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2799$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2799 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_input_a_clk_sig_sampled$2800
      (MULT18X18D_State-$auto$clk2fflogic.cc_86_sample_control_edge$2801 state))) ; (bitvector 1)
  (let
    ((n717
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_input_a_clk_sig_sampled$2800
        input_a_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$2802$_Y
      (bool->bitvector (bveq n717 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((signeda_reg1_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$2802$_Y)
        $auto$clk2fflogic.cc_102_sample_data$2799$_Q
        $auto$clk2fflogic.cc_102_sample_data$2797$_Q))) ; (bitvector 1)
  (let ((SIGNEDA (MULT18X18D_Inputs-SIGNEDA inputs))) ; (bitvector 1)
  (let
    ((signeda_p1
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1001$142$_Y)
        SIGNEDA
        signeda_reg1_sync))) ; (bitvector 1)
  (let
    (($procmux$222$_Y
      (if (bitvector->bool signeda_p1) n713 (bv #b000000000000000000 18)))) ; (bitvector 18)
  (let ((a_sig_m (concat $procmux$222$_Y a_sig_gen))) ; (bitvector 36)
  (let ((n724 (extract 35 18 a_sig_m))) ; (bitvector 18)
  (let ((n725 (concat n724 a_sig_gen))) ; (bitvector 36)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2757$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2757 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2759$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2759 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_input_b_clk_sig_sampled$2760
      (MULT18X18D_State-$auto$clk2fflogic.cc_86_sample_control_edge$2761 state))) ; (bitvector 1)
  (let
    ((n729
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_input_b_clk_sig_sampled$2760
        input_b_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$2762$_Y
      (bool->bitvector (bveq n729 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((b_sig_reg_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$2762$_Y)
        $auto$clk2fflogic.cc_102_sample_data$2759$_Q
        $auto$clk2fflogic.cc_102_sample_data$2757$_Q))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_b_sig_s_1_sampled$2692
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2693 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_b_sig_s_1_17_0__sampled$2698
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2699 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2695_sampled$2696
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2697 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2700$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2695_sampled$2696)
        $auto$clk2fflogic.cc_95_sample_data$$0_b_sig_s_1_17_0__sampled$2698
        $auto$clk2fflogic.cc_95_sample_data$_b_sig_s_1_sampled$2692))) ; (bitvector 18)
  (let ((SRIB0 (MULT18X18D_Inputs-SRIB0 inputs))) ; (bitvector 1)
  (let ((SRIB1 (MULT18X18D_Inputs-SRIB1 inputs))) ; (bitvector 1)
  (let ((n738 (concat SRIB1 SRIB0))) ; (bitvector 2)
  (let ((SRIB2 (MULT18X18D_Inputs-SRIB2 inputs))) ; (bitvector 1)
  (let ((n740 (concat SRIB2 n738))) ; (bitvector 3)
  (let ((SRIB3 (MULT18X18D_Inputs-SRIB3 inputs))) ; (bitvector 1)
  (let ((n742 (concat SRIB3 n740))) ; (bitvector 4)
  (let ((SRIB4 (MULT18X18D_Inputs-SRIB4 inputs))) ; (bitvector 1)
  (let ((n744 (concat SRIB4 n742))) ; (bitvector 5)
  (let ((SRIB5 (MULT18X18D_Inputs-SRIB5 inputs))) ; (bitvector 1)
  (let ((n746 (concat SRIB5 n744))) ; (bitvector 6)
  (let ((SRIB6 (MULT18X18D_Inputs-SRIB6 inputs))) ; (bitvector 1)
  (let ((n748 (concat SRIB6 n746))) ; (bitvector 7)
  (let ((SRIB7 (MULT18X18D_Inputs-SRIB7 inputs))) ; (bitvector 1)
  (let ((n750 (concat SRIB7 n748))) ; (bitvector 8)
  (let ((SRIB8 (MULT18X18D_Inputs-SRIB8 inputs))) ; (bitvector 1)
  (let ((n752 (concat SRIB8 n750))) ; (bitvector 9)
  (let ((SRIB9 (MULT18X18D_Inputs-SRIB9 inputs))) ; (bitvector 1)
  (let ((n754 (concat SRIB9 n752))) ; (bitvector 10)
  (let ((SRIB10 (MULT18X18D_Inputs-SRIB10 inputs))) ; (bitvector 1)
  (let ((n756 (concat SRIB10 n754))) ; (bitvector 11)
  (let ((SRIB11 (MULT18X18D_Inputs-SRIB11 inputs))) ; (bitvector 1)
  (let ((n758 (concat SRIB11 n756))) ; (bitvector 12)
  (let ((SRIB12 (MULT18X18D_Inputs-SRIB12 inputs))) ; (bitvector 1)
  (let ((n760 (concat SRIB12 n758))) ; (bitvector 13)
  (let ((SRIB13 (MULT18X18D_Inputs-SRIB13 inputs))) ; (bitvector 1)
  (let ((n762 (concat SRIB13 n760))) ; (bitvector 14)
  (let ((SRIB14 (MULT18X18D_Inputs-SRIB14 inputs))) ; (bitvector 1)
  (let ((n764 (concat SRIB14 n762))) ; (bitvector 15)
  (let ((SRIB15 (MULT18X18D_Inputs-SRIB15 inputs))) ; (bitvector 1)
  (let ((n766 (concat SRIB15 n764))) ; (bitvector 16)
  (let ((SRIB16 (MULT18X18D_Inputs-SRIB16 inputs))) ; (bitvector 1)
  (let ((n768 (concat SRIB16 n766))) ; (bitvector 17)
  (let ((SRIB17 (MULT18X18D_Inputs-SRIB17 inputs))) ; (bitvector 1)
  (let ((n770 (concat SRIB17 n768))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2747$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2747 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2749$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2749 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_input_c_clk_sig_sampled$2750
      (MULT18X18D_State-$auto$clk2fflogic.cc_86_sample_control_edge$2751 state))) ; (bitvector 1)
  (let
    ((n774
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_input_c_clk_sig_sampled$2750
        input_c_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$2752$_Y
      (bool->bitvector (bveq n774 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((c_sig_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$2752$_Y)
        $auto$clk2fflogic.cc_102_sample_data$2749$_Q
        $auto$clk2fflogic.cc_102_sample_data$2747$_Q))) ; (bitvector 18)
  (let ((C0 (MULT18X18D_Inputs-C0 inputs))) ; (bitvector 1)
  (let ((C1 (MULT18X18D_Inputs-C1 inputs))) ; (bitvector 1)
  (let ((n779 (concat C1 C0))) ; (bitvector 2)
  (let ((C2 (MULT18X18D_Inputs-C2 inputs))) ; (bitvector 1)
  (let ((n781 (concat C2 n779))) ; (bitvector 3)
  (let ((C3 (MULT18X18D_Inputs-C3 inputs))) ; (bitvector 1)
  (let ((n783 (concat C3 n781))) ; (bitvector 4)
  (let ((C4 (MULT18X18D_Inputs-C4 inputs))) ; (bitvector 1)
  (let ((n785 (concat C4 n783))) ; (bitvector 5)
  (let ((C5 (MULT18X18D_Inputs-C5 inputs))) ; (bitvector 1)
  (let ((n787 (concat C5 n785))) ; (bitvector 6)
  (let ((C6 (MULT18X18D_Inputs-C6 inputs))) ; (bitvector 1)
  (let ((n789 (concat C6 n787))) ; (bitvector 7)
  (let ((C7 (MULT18X18D_Inputs-C7 inputs))) ; (bitvector 1)
  (let ((n791 (concat C7 n789))) ; (bitvector 8)
  (let ((C8 (MULT18X18D_Inputs-C8 inputs))) ; (bitvector 1)
  (let ((n793 (concat C8 n791))) ; (bitvector 9)
  (let ((C9 (MULT18X18D_Inputs-C9 inputs))) ; (bitvector 1)
  (let ((n795 (concat C9 n793))) ; (bitvector 10)
  (let ((C10 (MULT18X18D_Inputs-C10 inputs))) ; (bitvector 1)
  (let ((n797 (concat C10 n795))) ; (bitvector 11)
  (let ((C11 (MULT18X18D_Inputs-C11 inputs))) ; (bitvector 1)
  (let ((n799 (concat C11 n797))) ; (bitvector 12)
  (let ((C12 (MULT18X18D_Inputs-C12 inputs))) ; (bitvector 1)
  (let ((n801 (concat C12 n799))) ; (bitvector 13)
  (let ((C13 (MULT18X18D_Inputs-C13 inputs))) ; (bitvector 1)
  (let ((n803 (concat C13 n801))) ; (bitvector 14)
  (let ((C14 (MULT18X18D_Inputs-C14 inputs))) ; (bitvector 1)
  (let ((n805 (concat C14 n803))) ; (bitvector 15)
  (let ((C15 (MULT18X18D_Inputs-C15 inputs))) ; (bitvector 1)
  (let ((n807 (concat C15 n805))) ; (bitvector 16)
  (let ((C16 (MULT18X18D_Inputs-C16 inputs))) ; (bitvector 1)
  (let ((n809 (concat C16 n807))) ; (bitvector 17)
  (let ((C17 (MULT18X18D_Inputs-C17 inputs))) ; (bitvector 1)
  (let ((n811 (concat C17 n809))) ; (bitvector 18)
  (let ((n812 (apply bvor (bitvector->bits REG_INPUTC_CLK)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1039$151$_Y
      (bvnot n812))) ; (bitvector 1)
  (let
    (($procmux$227$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1039$151$_Y)
        n811
        c_sig_sync))) ; (bitvector 18)
  (let
    (($procmux$298$_Y (if (bitvector->bool div2_clk2) $procmux$227$_Y n770))) ; (bitvector 18)
  (let ((SOURCEB (MULT18X18D_Inputs-SOURCEB inputs))) ; (bitvector 1)
  (let (($procmux$306$_Y (if (bitvector->bool SOURCEB) $procmux$227$_Y n770))) ; (bitvector 18)
  (let ((SOURCEB_MODE (MULT18X18D_Inputs-SOURCEB_MODE inputs))) ; (bitvector 5)
  (let ((n820 (zero-extend (bv #b1001 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_867$116_Y
      (bool->bitvector (bveq SOURCEB_MODE n820)))) ; (bitvector 1)
  (let
    (($procmux$308$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_867$116_Y)
        $procmux$306$_Y
        $procmux$298$_Y))) ; (bitvector 18)
  (let (($procmux$314$_Y (if (bitvector->bool SOURCEB) n770 $procmux$227$_Y))) ; (bitvector 18)
  (let ((n825 (zero-extend (bv #b1000 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_861$113_Y
      (bool->bitvector (bveq SOURCEB_MODE n825)))) ; (bitvector 1)
  (let
    (($procmux$316$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_861$113_Y)
        $procmux$314$_Y
        $procmux$308$_Y))) ; (bitvector 18)
  (let ((B0 (MULT18X18D_Inputs-B0 inputs))) ; (bitvector 1)
  (let ((B1 (MULT18X18D_Inputs-B1 inputs))) ; (bitvector 1)
  (let ((n830 (concat B1 B0))) ; (bitvector 2)
  (let ((B2 (MULT18X18D_Inputs-B2 inputs))) ; (bitvector 1)
  (let ((n832 (concat B2 n830))) ; (bitvector 3)
  (let ((B3 (MULT18X18D_Inputs-B3 inputs))) ; (bitvector 1)
  (let ((n834 (concat B3 n832))) ; (bitvector 4)
  (let ((B4 (MULT18X18D_Inputs-B4 inputs))) ; (bitvector 1)
  (let ((n836 (concat B4 n834))) ; (bitvector 5)
  (let ((B5 (MULT18X18D_Inputs-B5 inputs))) ; (bitvector 1)
  (let ((n838 (concat B5 n836))) ; (bitvector 6)
  (let ((B6 (MULT18X18D_Inputs-B6 inputs))) ; (bitvector 1)
  (let ((n840 (concat B6 n838))) ; (bitvector 7)
  (let ((B7 (MULT18X18D_Inputs-B7 inputs))) ; (bitvector 1)
  (let ((n842 (concat B7 n840))) ; (bitvector 8)
  (let ((B8 (MULT18X18D_Inputs-B8 inputs))) ; (bitvector 1)
  (let ((n844 (concat B8 n842))) ; (bitvector 9)
  (let ((B9 (MULT18X18D_Inputs-B9 inputs))) ; (bitvector 1)
  (let ((n846 (concat B9 n844))) ; (bitvector 10)
  (let ((B10 (MULT18X18D_Inputs-B10 inputs))) ; (bitvector 1)
  (let ((n848 (concat B10 n846))) ; (bitvector 11)
  (let ((B11 (MULT18X18D_Inputs-B11 inputs))) ; (bitvector 1)
  (let ((n850 (concat B11 n848))) ; (bitvector 12)
  (let ((B12 (MULT18X18D_Inputs-B12 inputs))) ; (bitvector 1)
  (let ((n852 (concat B12 n850))) ; (bitvector 13)
  (let ((B13 (MULT18X18D_Inputs-B13 inputs))) ; (bitvector 1)
  (let ((n854 (concat B13 n852))) ; (bitvector 14)
  (let ((B14 (MULT18X18D_Inputs-B14 inputs))) ; (bitvector 1)
  (let ((n856 (concat B14 n854))) ; (bitvector 15)
  (let ((B15 (MULT18X18D_Inputs-B15 inputs))) ; (bitvector 1)
  (let ((n858 (concat B15 n856))) ; (bitvector 16)
  (let ((B16 (MULT18X18D_Inputs-B16 inputs))) ; (bitvector 1)
  (let ((n860 (concat B16 n858))) ; (bitvector 17)
  (let ((B17 (MULT18X18D_Inputs-B17 inputs))) ; (bitvector 1)
  (let ((n862 (concat B17 n860))) ; (bitvector 18)
  (let (($procmux$322$_Y (if (bitvector->bool SOURCEB) n770 n862))) ; (bitvector 18)
  (let ((n865 (zero-extend (bv #b111 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_855$110_Y
      (bool->bitvector (bveq SOURCEB_MODE n865)))) ; (bitvector 1)
  (let
    (($0_b_sig_s_1_17_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_855$110_Y)
        $procmux$322$_Y
        $procmux$316$_Y))) ; (bitvector 18)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$872$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_855$110_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$874$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_861$113_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$876$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_867$116_Y))) ; (bitvector 1)
  (let ((n872 (zero-extend (bv #b1010 4) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_873$119_Y
      (bool->bitvector (bveq SOURCEB_MODE n872)))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$878$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_873$119_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$908$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$876$_Y
        $auto$proc_dlatch.cc_249_make_hold$878$_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$934$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$874$_Y
        $auto$proc_dlatch.cc_262_make_hold$908$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2922_ReduceOr$983
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$872$_Y
        $auto$proc_dlatch.cc_262_make_hold$934$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$2695 (bvnot $auto$rtlil.cc_2922_ReduceOr$983))) ; (bitvector 1)
  (let
    ((b_sig_s_1
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2695)
        $0_b_sig_s_1_17_0_
        $auto$clk2fflogic.cc_117_mux$2700$_Y))) ; (bitvector 18)
  (let ((n880 (apply bvor (bitvector->bits REG_INPUTB_CLK)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1027$149$_Y
      (bvnot n880))) ; (bitvector 1)
  (let
    ((b_sig_gen
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1027$149$_Y)
        b_sig_s_1
        b_sig_reg_sync))) ; (bitvector 18)
  (let ((n883 (extract 17 17 b_sig_gen))) ; (bitvector 1)
  (let ((n884 (concat n883 n883))) ; (bitvector 2)
  (let ((n885 (concat n883 n884))) ; (bitvector 3)
  (let ((n886 (concat n883 n885))) ; (bitvector 4)
  (let ((n887 (concat n883 n886))) ; (bitvector 5)
  (let ((n888 (concat n883 n887))) ; (bitvector 6)
  (let ((n889 (concat n883 n888))) ; (bitvector 7)
  (let ((n890 (concat n883 n889))) ; (bitvector 8)
  (let ((n891 (concat n883 n890))) ; (bitvector 9)
  (let ((n892 (concat n883 n891))) ; (bitvector 10)
  (let ((n893 (concat n883 n892))) ; (bitvector 11)
  (let ((n894 (concat n883 n893))) ; (bitvector 12)
  (let ((n895 (concat n883 n894))) ; (bitvector 13)
  (let ((n896 (concat n883 n895))) ; (bitvector 14)
  (let ((n897 (concat n883 n896))) ; (bitvector 15)
  (let ((n898 (concat n883 n897))) ; (bitvector 16)
  (let ((n899 (concat n883 n898))) ; (bitvector 17)
  (let ((n900 (concat n883 n899))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2767$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2767 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2769$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2769 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_input_b_clk_sig_sampled$2770
      (MULT18X18D_State-$auto$clk2fflogic.cc_86_sample_control_edge$2771 state))) ; (bitvector 1)
  (let
    ((n904
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_input_b_clk_sig_sampled$2770
        input_b_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$2772$_Y
      (bool->bitvector (bveq n904 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((signedb_reg1_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$2772$_Y)
        $auto$clk2fflogic.cc_102_sample_data$2769$_Q
        $auto$clk2fflogic.cc_102_sample_data$2767$_Q))) ; (bitvector 1)
  (let ((SIGNEDB (MULT18X18D_Inputs-SIGNEDB inputs))) ; (bitvector 1)
  (let
    ((signedb_p1
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1027$149$_Y)
        SIGNEDB
        signedb_reg1_sync))) ; (bitvector 1)
  (let
    (($procmux$217$_Y
      (if (bitvector->bool signedb_p1) n900 (bv #b000000000000000000 18)))) ; (bitvector 18)
  (let ((b_sig_m (concat $procmux$217$_Y b_sig_gen))) ; (bitvector 36)
  (let ((n911 (extract 35 18 b_sig_m))) ; (bitvector 18)
  (let ((n912 (concat n911 b_sig_gen))) ; (bitvector 36)
  (let
    (($mul$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1106$159$_Y
      (bvmul n725 n912))) ; (bitvector 36)
  (let ((n915 (apply bvor (bitvector->bits n725)))) ; (bitvector 1)
  (let
    (($logic_not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1106$156$_Y
      (bvnot n915))) ; (bitvector 1)
  (let ((n917 (apply bvor (bitvector->bits n912)))) ; (bitvector 1)
  (let
    (($logic_not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1106$157$_Y
      (bvnot n917))) ; (bitvector 1)
  (let
    (($logic_or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1106$158$_Y
      (bvor
        $logic_not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1106$156$_Y
        $logic_not$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1106$157$_Y))) ; (bitvector 1)
  (let
    ((p_sig_i
      (if
        (bitvector->bool
          $logic_or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1106$158$_Y)
        (bv #b000000000000000000000000000000000000 36)
        $mul$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1106$159$_Y))) ; (bitvector 36)
  (let
    (($procmux$207$_Y
      (if (bitvector->bool pipeline_ce_sig) p_sig_i p_sig_o_sync))) ; (bitvector 36)
  (let
    (($0_p_sig_o_sync_35_0_
      (if
        (bitvector->bool pipeline_rst_sig)
        (bv #b000000000000000000000000000000000000 36)
        $procmux$207$_Y))) ; (bitvector 36)
  (let
    (($procmux$260$_Y
      (if (bitvector->bool input_b_ce_sig) SIGNEDB signedb_reg1_sync))) ; (bitvector 1)
  (let
    (($0_signedb_reg1_sync_0_0_
      (if (bitvector->bool input_b_rst_sig) (bv #b0 1) $procmux$260$_Y))) ; (bitvector 1)
  (let
    (($procmux$274$_Y
      (if (bitvector->bool input_a_ce_sig) SIGNEDA signeda_reg1_sync))) ; (bitvector 1)
  (let
    (($0_signeda_reg1_sync_0_0_
      (if (bitvector->bool input_a_rst_sig) (bv #b0 1) $procmux$274$_Y))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2717$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2717 state))) ; (bitvector 36)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2719$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2719 state))) ; (bitvector 36)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_output_clk_sig_sampled$2720
      (MULT18X18D_State-$auto$clk2fflogic.cc_86_sample_control_edge$2721 state))) ; (bitvector 1)
  (let
    ((n930
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_output_clk_sig_sampled$2720
        output_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$2722$_Y
      (bool->bitvector (bveq n930 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((p_sig_o1_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$2722$_Y)
        $auto$clk2fflogic.cc_102_sample_data$2719$_Q
        $auto$clk2fflogic.cc_102_sample_data$2717$_Q))) ; (bitvector 36)
  (let ((n933 (apply bvor (bitvector->bits REG_PIPELINE_CLK)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1131$170$_Y
      (bvnot n933))) ; (bitvector 1)
  (let
    ((p_sig_ps
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1131$170$_Y)
        p_sig_i
        p_sig_o_sync))) ; (bitvector 36)
  (let
    (($procmux$189$_Y
      (if (bitvector->bool output_ce_sig) p_sig_ps p_sig_o1_sync))) ; (bitvector 36)
  (let
    (($0_p_sig_o1_sync_35_0_
      (if
        (bitvector->bool output_rst_sig)
        (bv #b000000000000000000000000000000000000 36)
        $procmux$189$_Y))) ; (bitvector 36)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$_a_sig_gen3_sampled$2680
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2681 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_95_sample_data$$0_a_sig_gen3_17_0__sampled$2686
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2687 state))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2683_sampled$2684
      (MULT18X18D_State-$auto$clk2fflogic.cc_74_sample_control$2685 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_117_mux$2688$_Y
      (if
        (bitvector->bool
          $auto$clk2fflogic.cc_69_sample_control$$auto$rtlil.cc_2918_Not$2683_sampled$2684)
        $auto$clk2fflogic.cc_95_sample_data$$0_a_sig_gen3_17_0__sampled$2686
        $auto$clk2fflogic.cc_95_sample_data$_a_sig_gen3_sampled$2680))) ; (bitvector 18)
  (let
    ((a_sig_gen2
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1001$142$_Y)
        a_sig_gen
        a_sig_gen1_sync))) ; (bitvector 18)
  (let ((CAS_MATCH_REG (MULT18X18D_Inputs-CAS_MATCH_REG inputs))) ; (bitvector 5)
  (let ((n945 (zero-extend (bv #b100 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1019$146_Y
      (bool->bitvector (bveq CAS_MATCH_REG n945)))) ; (bitvector 1)
  (let
    (($0_a_sig_gen3_17_0_
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1019$146_Y)
        a_sig_gen
        a_sig_gen2))) ; (bitvector 18)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$845$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1019$146_Y))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1020$147_Y
      (bool->bitvector (bveq CAS_MATCH_REG (bv #b10110 5))))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_249_make_hold$849$_Y
      (bvnot
        $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1020$147_Y))) ; (bitvector 1)
  (let
    (($auto$proc_dlatch.cc_262_make_hold$859$_Y
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$845$_Y
        $auto$proc_dlatch.cc_249_make_hold$849$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2922_ReduceOr$868
      (bvand
        $auto$proc_dlatch.cc_249_make_hold$845$_Y
        $auto$proc_dlatch.cc_262_make_hold$859$_Y))) ; (bitvector 1)
  (let
    (($auto$rtlil.cc_2918_Not$2683 (bvnot $auto$rtlil.cc_2922_ReduceOr$868))) ; (bitvector 1)
  (let
    ((a_sig_gen3
      (if
        (bitvector->bool $auto$rtlil.cc_2918_Not$2683)
        $0_a_sig_gen3_17_0_
        $auto$clk2fflogic.cc_117_mux$2688$_Y))) ; (bitvector 18)
  (let
    (($procmux$253$_Y (if (bitvector->bool input_c_ce_sig) n811 c_sig_sync))) ; (bitvector 18)
  (let
    (($0_c_sig_sync_17_0_
      (if
        (bitvector->bool input_c_rst_sig)
        (bv #b000000000000000000 18)
        $procmux$253$_Y))) ; (bitvector 18)
  (let
    (($procmux$265$_Y
      (if (bitvector->bool input_b_ce_sig) b_sig_s_1 b_sig_reg_sync))) ; (bitvector 18)
  (let
    (($0_b_sig_reg_sync_17_0_
      (if
        (bitvector->bool input_b_rst_sig)
        (bv #b000000000000000000 18)
        $procmux$265$_Y))) ; (bitvector 18)
  (let
    (($procmux$284$_Y
      (if (bitvector->bool input_a_ce_sig) a_sig_s_1 a_sig_reg_sync))) ; (bitvector 18)
  (let
    (($0_a_sig_reg_sync_17_0_
      (if
        (bitvector->bool input_a_rst_sig)
        (bv #b000000000000000000 18)
        $procmux$284$_Y))) ; (bitvector 18)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2737$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2737 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_102_sample_data$2739$_Q
      (MULT18X18D_State-$auto$clk2fflogic.cc_102_sample_data$2739 state))) ; (bitvector 1)
  (let
    (($auto$clk2fflogic.cc_81_sample_control_edge$_pipeline_clk_sig_sampled$2740
      (MULT18X18D_State-$auto$clk2fflogic.cc_86_sample_control_edge$2741 state))) ; (bitvector 1)
  (let
    ((n965
      (concat
        $auto$clk2fflogic.cc_81_sample_control_edge$_pipeline_clk_sig_sampled$2740
        pipeline_clk_sig))) ; (bitvector 2)
  (let
    (($auto$clk2fflogic.cc_87_sample_control_edge$2742$_Y
      (bool->bitvector (bveq n965 (bv #b01 2))))) ; (bitvector 1)
  (let
    ((signedab_sig_sync
      (if
        (bitvector->bool $auto$clk2fflogic.cc_87_sample_control_edge$2742$_Y)
        $auto$clk2fflogic.cc_102_sample_data$2739$_Q
        $auto$clk2fflogic.cc_102_sample_data$2737$_Q))) ; (bitvector 1)
  (let
    (($or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1108$162$_Y
      (bvor signeda_p1 signedb_p1))) ; (bitvector 1)
  (let
    (($procmux$202$_Y
      (if
        (bitvector->bool pipeline_ce_sig)
        $or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1108$162$_Y
        signedab_sig_sync))) ; (bitvector 1)
  (let
    (($0_signedab_sig_sync_0_0_
      (if (bitvector->bool pipeline_rst_sig) (bv #b0 1) $procmux$202$_Y))) ; (bitvector 1)
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
  (let ((SROA9 (extract 9 9 a_sig_gen3))) ; (bitvector 1)
  (let ((SROA8 (extract 8 8 a_sig_gen3))) ; (bitvector 1)
  (let ((SROA7 (extract 7 7 a_sig_gen3))) ; (bitvector 1)
  (let ((SROA6 (extract 6 6 a_sig_gen3))) ; (bitvector 1)
  (let ((SROA5 (extract 5 5 a_sig_gen3))) ; (bitvector 1)
  (let ((SROA4 (extract 4 4 a_sig_gen3))) ; (bitvector 1)
  (let ((SROA3 (extract 3 3 a_sig_gen3))) ; (bitvector 1)
  (let ((SROA2 (extract 2 2 a_sig_gen3))) ; (bitvector 1)
  (let ((SROA17 (extract 17 17 a_sig_gen3))) ; (bitvector 1)
  (let ((SROA16 (extract 16 16 a_sig_gen3))) ; (bitvector 1)
  (let ((SROA15 (extract 15 15 a_sig_gen3))) ; (bitvector 1)
  (let ((SROA14 (extract 14 14 a_sig_gen3))) ; (bitvector 1)
  (let ((SROA13 (extract 13 13 a_sig_gen3))) ; (bitvector 1)
  (let ((SROA12 (extract 12 12 a_sig_gen3))) ; (bitvector 1)
  (let ((SROA11 (extract 11 11 a_sig_gen3))) ; (bitvector 1)
  (let ((SROA10 (extract 10 10 a_sig_gen3))) ; (bitvector 1)
  (let ((SROA1 (extract 1 1 a_sig_gen3))) ; (bitvector 1)
  (let ((SROA0 (extract 0 0 a_sig_gen3))) ; (bitvector 1)
  (let
    ((SIGNEDP
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1131$170$_Y)
        $or$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1108$162$_Y
        signedab_sig_sync))) ; (bitvector 1)
  (let ((ROC9 (extract 9 9 $procmux$227$_Y))) ; (bitvector 1)
  (let ((ROC8 (extract 8 8 $procmux$227$_Y))) ; (bitvector 1)
  (let ((ROC7 (extract 7 7 $procmux$227$_Y))) ; (bitvector 1)
  (let ((ROC6 (extract 6 6 $procmux$227$_Y))) ; (bitvector 1)
  (let ((ROC5 (extract 5 5 $procmux$227$_Y))) ; (bitvector 1)
  (let ((ROC4 (extract 4 4 $procmux$227$_Y))) ; (bitvector 1)
  (let ((ROC3 (extract 3 3 $procmux$227$_Y))) ; (bitvector 1)
  (let ((ROC2 (extract 2 2 $procmux$227$_Y))) ; (bitvector 1)
  (let ((ROC17 (extract 17 17 $procmux$227$_Y))) ; (bitvector 1)
  (let ((ROC16 (extract 16 16 $procmux$227$_Y))) ; (bitvector 1)
  (let ((ROC15 (extract 15 15 $procmux$227$_Y))) ; (bitvector 1)
  (let ((ROC14 (extract 14 14 $procmux$227$_Y))) ; (bitvector 1)
  (let ((ROC13 (extract 13 13 $procmux$227$_Y))) ; (bitvector 1)
  (let ((ROC12 (extract 12 12 $procmux$227$_Y))) ; (bitvector 1)
  (let ((ROC11 (extract 11 11 $procmux$227$_Y))) ; (bitvector 1)
  (let ((ROC10 (extract 10 10 $procmux$227$_Y))) ; (bitvector 1)
  (let ((ROC1 (extract 1 1 $procmux$227$_Y))) ; (bitvector 1)
  (let ((ROC0 (extract 0 0 $procmux$227$_Y))) ; (bitvector 1)
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
  (let ((n1044 (apply bvor (bitvector->bits REG_OUTPUT_CLK)))) ; (bitvector 1)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1151$178$_Y
      (bvnot n1044))) ; (bitvector 1)
  (let
    ((p_sig_out
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1151$178$_Y)
        p_sig_ps
        p_sig_o1_sync))) ; (bitvector 36)
  (let ((MULT_BYPASS (MULT18X18D_Inputs-MULT_BYPASS inputs))) ; (bitvector 5)
  (let ((n1048 (zero-extend (bv #b101 3) (bitvector 5)))) ; (bitvector 5)
  (let
    (($eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1156$180$_Y
      (bool->bitvector (bveq MULT_BYPASS n1048)))) ; (bitvector 1)
  (let
    (($procmux$184$_Y
      (if
        (bitvector->bool
          $eq$_Users_gussmith_lakeroad_lakeroad_private_lattice_ecp5_MULT18X18D_modified_for_racket_import.v_1156$180$_Y)
        p_sig_out
        (bv #b000000000000000000000000000000000000 36)))) ; (bitvector 36)
  (let ((P9 (extract 9 9 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P8 (extract 8 8 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P7 (extract 7 7 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P6 (extract 6 6 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P5 (extract 5 5 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P4 (extract 4 4 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P35 (extract 35 35 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P34 (extract 34 34 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P33 (extract 33 33 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P32 (extract 32 32 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P31 (extract 31 31 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P30 (extract 30 30 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P3 (extract 3 3 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P29 (extract 29 29 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P28 (extract 28 28 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P27 (extract 27 27 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P26 (extract 26 26 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P25 (extract 25 25 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P24 (extract 24 24 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P23 (extract 23 23 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P22 (extract 22 22 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P21 (extract 21 21 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P20 (extract 20 20 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P2 (extract 2 2 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P19 (extract 19 19 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P18 (extract 18 18 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P17 (extract 17 17 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P16 (extract 16 16 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P15 (extract 15 15 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P14 (extract 14 14 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P13 (extract 13 13 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P12 (extract 12 12 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P11 (extract 11 11 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P10 (extract 10 10 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P1 (extract 1 1 $procmux$184$_Y))) ; (bitvector 1)
  (let ((P0 (extract 0 0 $procmux$184$_Y))) ; (bitvector 1)
  (cons
    (MULT18X18D_Outputs
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
      ROC9 ; ROC9
      ROC8 ; ROC8
      ROC7 ; ROC7
      ROC6 ; ROC6
      ROC5 ; ROC5
      ROC4 ; ROC4
      ROC3 ; ROC3
      ROC2 ; ROC2
      ROC17 ; ROC17
      ROC16 ; ROC16
      ROC15 ; ROC15
      ROC14 ; ROC14
      ROC13 ; ROC13
      ROC12 ; ROC12
      ROC11 ; ROC11
      ROC10 ; ROC10
      ROC1 ; ROC1
      ROC0 ; ROC0
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
    (MULT18X18D_State
      CLK2 ; $auto$clk2fflogic.cc:86:sample_control_edge$2821
      CLK3 ; $auto$clk2fflogic.cc:86:sample_control_edge$2811
      CLK1 ; $auto$clk2fflogic.cc:86:sample_control_edge$2831
      CLK0 ; $auto$clk2fflogic.cc:86:sample_control_edge$2841
      CLK2_div ; $auto$clk2fflogic.cc:102:sample_data$2817
      $0_CLK2_div_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2819
      CLK3_div ; $auto$clk2fflogic.cc:102:sample_data$2807
      $0_CLK3_div_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2809
      CLK1_div ; $auto$clk2fflogic.cc:102:sample_data$2827
      $0_CLK1_div_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2829
      CLK2b ; $auto$clk2fflogic.cc:102:sample_data$2645
      $0_CLK2b_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2651
      $auto$rtlil.cc_2918_Not$2647 ; $auto$clk2fflogic.cc:74:sample_control$2649
      CLK3b ; $auto$clk2fflogic.cc:102:sample_data$2633
      $0_CLK3b_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2639
      $auto$rtlil.cc_2918_Not$2635 ; $auto$clk2fflogic.cc:74:sample_control$2637
      CLK0_div ; $auto$clk2fflogic.cc:102:sample_data$2837
      $0_CLK0_div_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2839
      CLK1b ; $auto$clk2fflogic.cc:102:sample_data$2657
      $0_CLK1b_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2663
      $auto$rtlil.cc_2918_Not$2659 ; $auto$clk2fflogic.cc:74:sample_control$2661
      div2_clk2 ; $auto$clk2fflogic.cc:102:sample_data$2441
      $0_div2_clk2_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2447
      $auto$rtlil.cc_2918_Not$2443 ; $auto$clk2fflogic.cc:74:sample_control$2445
      output_ce_sig ; $auto$clk2fflogic.cc:102:sample_data$2513
      $0_output_ce_sig_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2519
      $auto$rtlil.cc_2918_Not$2515 ; $auto$clk2fflogic.cc:74:sample_control$2517
      CLK0b ; $auto$clk2fflogic.cc:102:sample_data$2669
      $0_CLK0b_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2675
      $auto$rtlil.cc_2918_Not$2671 ; $auto$clk2fflogic.cc:74:sample_control$2673
      output_rst_sig ; $auto$clk2fflogic.cc:102:sample_data$2453
      $0_output_rst_sig_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2459
      $auto$rtlil.cc_2918_Not$2455 ; $auto$clk2fflogic.cc:74:sample_control$2457
      input_c_ce_sig ; $auto$clk2fflogic.cc:102:sample_data$2537
      $0_input_c_ce_sig_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2543
      $auto$rtlil.cc_2918_Not$2539 ; $auto$clk2fflogic.cc:74:sample_control$2541
      input_b_ce_sig ; $auto$clk2fflogic.cc:102:sample_data$2549
      $0_input_b_ce_sig_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2555
      $auto$rtlil.cc_2918_Not$2551 ; $auto$clk2fflogic.cc:74:sample_control$2553
      input_a_ce_sig ; $auto$clk2fflogic.cc:102:sample_data$2561
      $0_input_a_ce_sig_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2567
      $auto$rtlil.cc_2918_Not$2563 ; $auto$clk2fflogic.cc:74:sample_control$2565
      pipeline_ce_sig ; $auto$clk2fflogic.cc:102:sample_data$2525
      $0_pipeline_ce_sig_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2531
      $auto$rtlil.cc_2918_Not$2527 ; $auto$clk2fflogic.cc:74:sample_control$2529
      output_clk_sig ; $auto$clk2fflogic.cc:102:sample_data$2573
      $0_output_clk_sig_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2579
      $auto$rtlil.cc_2918_Not$2575 ; $auto$clk2fflogic.cc:74:sample_control$2577
      input_a_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$2791
      input_c_rst_sig ; $auto$clk2fflogic.cc:102:sample_data$2477
      $0_input_c_rst_sig_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2483
      $auto$rtlil.cc_2918_Not$2479 ; $auto$clk2fflogic.cc:74:sample_control$2481
      input_b_rst_sig ; $auto$clk2fflogic.cc:102:sample_data$2489
      $0_input_b_rst_sig_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2495
      $auto$rtlil.cc_2918_Not$2491 ; $auto$clk2fflogic.cc:74:sample_control$2493
      input_a_rst_sig ; $auto$clk2fflogic.cc:102:sample_data$2501
      $0_input_a_rst_sig_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2507
      $auto$rtlil.cc_2918_Not$2503 ; $auto$clk2fflogic.cc:74:sample_control$2505
      pipeline_rst_sig ; $auto$clk2fflogic.cc:102:sample_data$2465
      $0_pipeline_rst_sig_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2471
      $auto$rtlil.cc_2918_Not$2467 ; $auto$clk2fflogic.cc:74:sample_control$2469
      pipeline_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$2731
      input_c_clk_sig ; $auto$clk2fflogic.cc:102:sample_data$2597
      $0_input_c_clk_sig_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2603
      $auto$rtlil.cc_2918_Not$2599 ; $auto$clk2fflogic.cc:74:sample_control$2601
      input_b_clk_sig ; $auto$clk2fflogic.cc:102:sample_data$2609
      $0_input_b_clk_sig_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2615
      $auto$rtlil.cc_2918_Not$2611 ; $auto$clk2fflogic.cc:74:sample_control$2613
      input_a_clk_sig ; $auto$clk2fflogic.cc:102:sample_data$2621
      $0_input_a_clk_sig_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2627
      $auto$rtlil.cc_2918_Not$2623 ; $auto$clk2fflogic.cc:74:sample_control$2625
      input_b_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$2771
      input_a_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$2801
      pipeline_clk_sig ; $auto$clk2fflogic.cc:102:sample_data$2585
      $0_pipeline_clk_sig_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2591
      $auto$rtlil.cc_2918_Not$2587 ; $auto$clk2fflogic.cc:74:sample_control$2589
      a_sig_gen1_sync ; $auto$clk2fflogic.cc:102:sample_data$2787
      $0_a_sig_gen1_sync_17_0_ ; $auto$clk2fflogic.cc:102:sample_data$2789
      output_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$2721
      p_sig_o_sync ; $auto$clk2fflogic.cc:102:sample_data$2727
      $0_p_sig_o_sync_35_0_ ; $auto$clk2fflogic.cc:102:sample_data$2729
      signedb_reg1_sync ; $auto$clk2fflogic.cc:102:sample_data$2767
      $0_signedb_reg1_sync_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2769
      signeda_reg1_sync ; $auto$clk2fflogic.cc:102:sample_data$2797
      $0_signeda_reg1_sync_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2799
      input_c_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$2751
      input_b_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$2761
      input_a_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$2781
      pipeline_clk_sig ; $auto$clk2fflogic.cc:86:sample_control_edge$2741
      b_sig_s_1 ; $auto$clk2fflogic.cc:102:sample_data$2693
      $0_b_sig_s_1_17_0_ ; $auto$clk2fflogic.cc:102:sample_data$2699
      $auto$rtlil.cc_2918_Not$2695 ; $auto$clk2fflogic.cc:74:sample_control$2697
      a_sig_s_1 ; $auto$clk2fflogic.cc:102:sample_data$2705
      $0_a_sig_s_1_17_0_ ; $auto$clk2fflogic.cc:102:sample_data$2711
      $auto$rtlil.cc_2918_Not$2707 ; $auto$clk2fflogic.cc:74:sample_control$2709
      p_sig_o1_sync ; $auto$clk2fflogic.cc:102:sample_data$2717
      $0_p_sig_o1_sync_35_0_ ; $auto$clk2fflogic.cc:102:sample_data$2719
      a_sig_gen3 ; $auto$clk2fflogic.cc:102:sample_data$2681
      $0_a_sig_gen3_17_0_ ; $auto$clk2fflogic.cc:102:sample_data$2687
      $auto$rtlil.cc_2918_Not$2683 ; $auto$clk2fflogic.cc:74:sample_control$2685
      c_sig_sync ; $auto$clk2fflogic.cc:102:sample_data$2747
      $0_c_sig_sync_17_0_ ; $auto$clk2fflogic.cc:102:sample_data$2749
      b_sig_reg_sync ; $auto$clk2fflogic.cc:102:sample_data$2757
      $0_b_sig_reg_sync_17_0_ ; $auto$clk2fflogic.cc:102:sample_data$2759
      a_sig_reg_sync ; $auto$clk2fflogic.cc:102:sample_data$2777
      $0_a_sig_reg_sync_17_0_ ; $auto$clk2fflogic.cc:102:sample_data$2779
      signedab_sig_sync ; $auto$clk2fflogic.cc:102:sample_data$2737
      $0_signedab_sig_sync_0_0_ ; $auto$clk2fflogic.cc:102:sample_data$2739
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
  ))))))))))))))))))))))))))))))))))))))))))))))))))))))
(define MULT18X18D_initial
  (MULT18X18D_State
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000 18)
    (bv #b1 1)
    (bv #b000000000000000000000000000000000000 36)
    (bv #b000000000000000000000000000000000000 36)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b0 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b1 1)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000 18)
    (bv #b0 1)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000 18)
    (bv #b0 1)
    (bv #b000000000000000000000000000000000000 36)
    (bv #b000000000000000000000000000000000000 36)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000 18)
    (bv #b0 1)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000 18)
    (bv #b000000000000000000 18)
    (bv #b0 1)
    (bv #b0 1)))
