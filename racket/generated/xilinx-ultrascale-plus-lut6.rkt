;;; Generated with:
;;; $LAKEROAD_DIR/bin/verilog_to_racket.py \
;;;   --infile $LAKEROAD_DIR/modules_for_importing/xilinx_ultrascale_plus/LUT6.v \
;;;   --top LUT6 \
;;;   --function-name xilinx-ultrascale-plus-lut6

#lang racket/base
(provide xilinx-ultrascale-plus-lut6)
(require "../signal.rkt")
(require rosette)
(require racket/hash)
(define xilinx-ultrascale-plus-lut6
  (λ (#:I0 (I0 (bv->signal (constant (list 'I0 'symbolic-constant) (bitvector 1))))
      #:I1 (I1 (bv->signal (constant (list 'I1 'symbolic-constant) (bitvector 1))))
      #:I2 (I2 (bv->signal (constant (list 'I2 'symbolic-constant) (bitvector 1))))
      #:I3 (I3 (bv->signal (constant (list 'I3 'symbolic-constant) (bitvector 1))))
      #:I4 (I4 (bv->signal (constant (list 'I4 'symbolic-constant) (bitvector 1))))
      #:I5 (I5 (bv->signal (constant (list 'I5 'symbolic-constant) (bitvector 1))))
      #:INIT (INIT (bv->signal (constant (list 'INIT 'symbolic-constant) (bitvector 64))))
      #:unnamed-input-10
      (unnamed-input-10 (bv->signal (constant (list 'unnamed-input-10 'symbolic-constant)
                                              (bitvector 1))))
      #:unnamed-input-12
      (unnamed-input-12 (bv->signal (constant (list 'unnamed-input-12 'symbolic-constant)
                                              (bitvector 1))))
      #:unnamed-input-167
      (unnamed-input-167
       (bv->signal (constant (list 'unnamed-input-167 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-173
      (unnamed-input-173
       (bv->signal (constant (list 'unnamed-input-173 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-182
      (unnamed-input-182
       (bv->signal (constant (list 'unnamed-input-182 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-278
      (unnamed-input-278
       (bv->signal (constant (list 'unnamed-input-278 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-280
      (unnamed-input-280
       (bv->signal (constant (list 'unnamed-input-280 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-282
      (unnamed-input-282
       (bv->signal (constant (list 'unnamed-input-282 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-378
      (unnamed-input-378
       (bv->signal (constant (list 'unnamed-input-378 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-380
      (unnamed-input-380
       (bv->signal (constant (list 'unnamed-input-380 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-382
      (unnamed-input-382
       (bv->signal (constant (list 'unnamed-input-382 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-478
      (unnamed-input-478
       (bv->signal (constant (list 'unnamed-input-478 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-480
      (unnamed-input-480
       (bv->signal (constant (list 'unnamed-input-480 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-482
      (unnamed-input-482
       (bv->signal (constant (list 'unnamed-input-482 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-578
      (unnamed-input-578
       (bv->signal (constant (list 'unnamed-input-578 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-580
      (unnamed-input-580
       (bv->signal (constant (list 'unnamed-input-580 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-582
      (unnamed-input-582
       (bv->signal (constant (list 'unnamed-input-582 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-678
      (unnamed-input-678
       (bv->signal (constant (list 'unnamed-input-678 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-680
      (unnamed-input-680
       (bv->signal (constant (list 'unnamed-input-680 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-682
      (unnamed-input-682
       (bv->signal (constant (list 'unnamed-input-682 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-778
      (unnamed-input-778
       (bv->signal (constant (list 'unnamed-input-778 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-780
      (unnamed-input-780
       (bv->signal (constant (list 'unnamed-input-780 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-782
      (unnamed-input-782
       (bv->signal (constant (list 'unnamed-input-782 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-878
      (unnamed-input-878
       (bv->signal (constant (list 'unnamed-input-878 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-880
      (unnamed-input-880
       (bv->signal (constant (list 'unnamed-input-880 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-1050
      (unnamed-input-1050
       (bv->signal (constant (list 'unnamed-input-1050 'symbolic-constant) (bitvector 8))))
      #:unnamed-input-1052
      (unnamed-input-1052
       (bv->signal (constant (list 'unnamed-input-1052 'symbolic-constant) (bitvector 3))))
      #:unnamed-input-1054
      (unnamed-input-1054
       (bv->signal (constant (list 'unnamed-input-1054 'symbolic-constant) (bitvector 8))))
      #:unnamed-input-1056
      (unnamed-input-1056
       (bv->signal (constant (list 'unnamed-input-1056 'symbolic-constant) (bitvector 3))))
      #:unnamed-input-1058
      (unnamed-input-1058
       (bv->signal (constant (list 'unnamed-input-1058 'symbolic-constant) (bitvector 8))))
      #:unnamed-input-1060
      (unnamed-input-1060
       (bv->signal (constant (list 'unnamed-input-1060 'symbolic-constant) (bitvector 3))))
      #:unnamed-input-1062
      (unnamed-input-1062
       (bv->signal (constant (list 'unnamed-input-1062 'symbolic-constant) (bitvector 8))))
      #:unnamed-input-1064
      (unnamed-input-1064
       (bv->signal (constant (list 'unnamed-input-1064 'symbolic-constant) (bitvector 3))))
      #:unnamed-input-1066
      (unnamed-input-1066
       (bv->signal (constant (list 'unnamed-input-1066 'symbolic-constant) (bitvector 8))))
      #:unnamed-input-1068
      (unnamed-input-1068
       (bv->signal (constant (list 'unnamed-input-1068 'symbolic-constant) (bitvector 3))))
      #:unnamed-input-1070
      (unnamed-input-1070
       (bv->signal (constant (list 'unnamed-input-1070 'symbolic-constant) (bitvector 8))))
      #:unnamed-input-1072
      (unnamed-input-1072
       (bv->signal (constant (list 'unnamed-input-1072 'symbolic-constant) (bitvector 3))))
      #:unnamed-input-1074
      (unnamed-input-1074
       (bv->signal (constant (list 'unnamed-input-1074 'symbolic-constant) (bitvector 8))))
      #:unnamed-input-1076
      (unnamed-input-1076
       (bv->signal (constant (list 'unnamed-input-1076 'symbolic-constant) (bitvector 3))))
      #:unnamed-input-1078
      (unnamed-input-1078
       (bv->signal (constant (list 'unnamed-input-1078 'symbolic-constant) (bitvector 8))))
      #:unnamed-input-1080
      (unnamed-input-1080
       (bv->signal (constant (list 'unnamed-input-1080 'symbolic-constant) (bitvector 3))))
      #:unnamed-input-1082
      (unnamed-input-1082
       (bv->signal (constant (list 'unnamed-input-1082 'symbolic-constant) (bitvector 8))))
      #:unnamed-input-1084
      (unnamed-input-1084
       (bv->signal (constant (list 'unnamed-input-1084 'symbolic-constant) (bitvector 3)))))
    (let* ([merged-input-state-hash (hash)]
           [init-hash (hash)]
           [btor1 (bitvector 1)]
           [btor2 I0]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state I0))]
           [btor3 I1]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state I1))]
           [btor4 I2]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state I2))]
           [btor5 I3]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state I3))]
           [btor6 I4]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state I4))]
           [btor7 I5]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state I5))]
           [btor8 (bitvector 64)]
           [btor9 INIT]
           [merged-input-state-hash (hash-union merged-input-state-hash (signal-state INIT))]
           [btor10 unnamed-input-10]
           [btor11 (bitvector 8)]
           [btor12 unnamed-input-12]
           [btor13 (signal (extract 7 0 (signal-value btor9)) (signal-state btor9))]
           [btor14 (bitvector 2)]
           [btor15 (bv->signal (bv 0 (bitvector 2)))]
           [btor16 (bitvector 3)]
           [btor17 (signal (concat (signal-value btor4) (signal-value btor15))
                           (merge-state (list btor4 btor15)))]
           [btor18 (bv->signal (zero-extend (signal-value btor17) (bitvector 8)) btor17)]
           [btor19 (signal (bvlshr (signal-value btor13) (signal-value btor18))
                           (merge-state (list btor13 btor18)))]
           [btor20 (signal (extract 0 0 (signal-value btor19)) (signal-state btor19))]
           [btor21 (bv->signal (bv 1 (bitvector 1)))]
           [btor22 (signal (bool->bitvector (bveq (signal-value btor4) (signal-value btor21)))
                           (merge-state (list btor4 btor21)))]
           [btor23 (bv->signal (bv 0 (bitvector 1)))]
           [btor24 (signal (bool->bitvector (bveq (signal-value btor4) (signal-value btor23)))
                           (merge-state (list btor4 btor23)))]
           [btor25 (signal (bvor (signal-value btor22) (signal-value btor24))
                           (merge-state (list btor22 btor24)))]
           [btor26 (bv->signal (bv 1 (bitvector 2)))]
           [btor27 (signal (concat (signal-value btor4) (signal-value btor26))
                           (merge-state (list btor4 btor26)))]
           [btor28 (bv->signal (zero-extend (signal-value btor27) (bitvector 8)) btor27)]
           [btor29 (signal (bvlshr (signal-value btor13) (signal-value btor28))
                           (merge-state (list btor13 btor28)))]
           [btor30 (signal (extract 0 0 (signal-value btor29)) (signal-state btor29))]
           [btor31 (signal (bool->bitvector (bveq (signal-value btor20) (signal-value btor30)))
                           (merge-state (list btor20 btor30)))]
           [btor32 (signal (bvand (signal-value btor25) (signal-value btor31))
                           (merge-state (list btor25 btor31)))]
           [btor33 (bv->signal (bv 2 (bitvector 2)))]
           [btor34 (signal (concat (signal-value btor4) (signal-value btor33))
                           (merge-state (list btor4 btor33)))]
           [btor35 (bv->signal (zero-extend (signal-value btor34) (bitvector 8)) btor34)]
           [btor36 (signal (bvlshr (signal-value btor13) (signal-value btor35))
                           (merge-state (list btor13 btor35)))]
           [btor37 (signal (extract 0 0 (signal-value btor36)) (signal-state btor36))]
           [btor38 (signal (bool->bitvector (bveq (signal-value btor20) (signal-value btor37)))
                           (merge-state (list btor20 btor37)))]
           [btor39 (signal (bvand (signal-value btor32) (signal-value btor38))
                           (merge-state (list btor32 btor38)))]
           [btor40 (bv->signal (bv 3 (bitvector 2)))]
           [btor41 (signal (concat (signal-value btor4) (signal-value btor40))
                           (merge-state (list btor4 btor40)))]
           [btor42 (bv->signal (zero-extend (signal-value btor41) (bitvector 8)) btor41)]
           [btor43 (signal (bvlshr (signal-value btor13) (signal-value btor42))
                           (merge-state (list btor13 btor42)))]
           [btor44 (signal (extract 0 0 (signal-value btor43)) (signal-state btor43))]
           [btor45 (signal (bool->bitvector (bveq (signal-value btor20) (signal-value btor44)))
                           (merge-state (list btor20 btor44)))]
           [btor46 (signal (bvand (signal-value btor39) (signal-value btor45))
                           (merge-state (list btor39 btor45)))]
           [btor47 (if (bitvector->bool (signal-value btor46)) btor20 btor12)]
           [btor48 (signal (concat (signal-value btor3) (signal-value btor23))
                           (merge-state (list btor3 btor23)))]
           [btor49 (bv->signal (zero-extend (signal-value btor48) (bitvector 8)) btor48)]
           [btor50 (signal (bvlshr (signal-value btor13) (signal-value btor49))
                           (merge-state (list btor13 btor49)))]
           [btor51 (signal (extract 0 0 (signal-value btor50)) (signal-state btor50))]
           [btor52 (signal (bool->bitvector (bveq (signal-value btor3) (signal-value btor21)))
                           (merge-state (list btor3 btor21)))]
           [btor53 (signal (bool->bitvector (bveq (signal-value btor3) (signal-value btor23)))
                           (merge-state (list btor3 btor23)))]
           [btor54 (signal (bvor (signal-value btor52) (signal-value btor53))
                           (merge-state (list btor52 btor53)))]
           [btor55 (signal (concat (signal-value btor3) (signal-value btor21))
                           (merge-state (list btor3 btor21)))]
           [btor56 (bv->signal (zero-extend (signal-value btor55) (bitvector 8)) btor55)]
           [btor57 (signal (bvlshr (signal-value btor13) (signal-value btor56))
                           (merge-state (list btor13 btor56)))]
           [btor58 (signal (extract 0 0 (signal-value btor57)) (signal-state btor57))]
           [btor59 (signal (bool->bitvector (bveq (signal-value btor51) (signal-value btor58)))
                           (merge-state (list btor51 btor58)))]
           [btor60 (signal (bvand (signal-value btor54) (signal-value btor59))
                           (merge-state (list btor54 btor59)))]
           [btor61 (signal (concat (signal-value btor3) (signal-value btor23))
                           (merge-state (list btor3 btor23)))]
           [btor62 (signal (concat (signal-value btor21) (signal-value btor61))
                           (merge-state (list btor21 btor61)))]
           [btor63 (bv->signal (zero-extend (signal-value btor62) (bitvector 8)) btor62)]
           [btor64 (signal (bvlshr (signal-value btor13) (signal-value btor63))
                           (merge-state (list btor13 btor63)))]
           [btor65 (signal (extract 0 0 (signal-value btor64)) (signal-state btor64))]
           [btor66 (signal (bool->bitvector (bveq (signal-value btor51) (signal-value btor65)))
                           (merge-state (list btor51 btor65)))]
           [btor67 (signal (bvand (signal-value btor60) (signal-value btor66))
                           (merge-state (list btor60 btor66)))]
           [btor68 (signal (concat (signal-value btor3) (signal-value btor21))
                           (merge-state (list btor3 btor21)))]
           [btor69 (signal (concat (signal-value btor21) (signal-value btor68))
                           (merge-state (list btor21 btor68)))]
           [btor70 (bv->signal (zero-extend (signal-value btor69) (bitvector 8)) btor69)]
           [btor71 (signal (bvlshr (signal-value btor13) (signal-value btor70))
                           (merge-state (list btor13 btor70)))]
           [btor72 (signal (extract 0 0 (signal-value btor71)) (signal-state btor71))]
           [btor73 (signal (bool->bitvector (bveq (signal-value btor51) (signal-value btor72)))
                           (merge-state (list btor51 btor72)))]
           [btor74 (signal (bvand (signal-value btor67) (signal-value btor73))
                           (merge-state (list btor67 btor73)))]
           [btor75 (if (bitvector->bool (signal-value btor74)) btor51 btor47)]
           [btor76 (bv->signal (zero-extend (signal-value btor2) (bitvector 8)) btor2)]
           [btor77 (signal (bvlshr (signal-value btor13) (signal-value btor76))
                           (merge-state (list btor13 btor76)))]
           [btor78 (signal (extract 0 0 (signal-value btor77)) (signal-state btor77))]
           [btor79 (signal (bool->bitvector (bveq (signal-value btor2) (signal-value btor21)))
                           (merge-state (list btor2 btor21)))]
           [btor80 (signal (bool->bitvector (bveq (signal-value btor2) (signal-value btor23)))
                           (merge-state (list btor2 btor23)))]
           [btor81 (signal (bvor (signal-value btor79) (signal-value btor80))
                           (merge-state (list btor79 btor80)))]
           [btor82 (signal (concat (signal-value btor21) (signal-value btor2))
                           (merge-state (list btor21 btor2)))]
           [btor83 (bv->signal (zero-extend (signal-value btor82) (bitvector 8)) btor82)]
           [btor84 (signal (bvlshr (signal-value btor13) (signal-value btor83))
                           (merge-state (list btor13 btor83)))]
           [btor85 (signal (extract 0 0 (signal-value btor84)) (signal-state btor84))]
           [btor86 (signal (bool->bitvector (bveq (signal-value btor78) (signal-value btor85)))
                           (merge-state (list btor78 btor85)))]
           [btor87 (signal (bvand (signal-value btor81) (signal-value btor86))
                           (merge-state (list btor81 btor86)))]
           [btor88 (signal (concat (signal-value btor33) (signal-value btor2))
                           (merge-state (list btor33 btor2)))]
           [btor89 (bv->signal (zero-extend (signal-value btor88) (bitvector 8)) btor88)]
           [btor90 (signal (bvlshr (signal-value btor13) (signal-value btor89))
                           (merge-state (list btor13 btor89)))]
           [btor91 (signal (extract 0 0 (signal-value btor90)) (signal-state btor90))]
           [btor92 (signal (bool->bitvector (bveq (signal-value btor78) (signal-value btor91)))
                           (merge-state (list btor78 btor91)))]
           [btor93 (signal (bvand (signal-value btor87) (signal-value btor92))
                           (merge-state (list btor87 btor92)))]
           [btor94 (signal (concat (signal-value btor40) (signal-value btor2))
                           (merge-state (list btor40 btor2)))]
           [btor95 (bv->signal (zero-extend (signal-value btor94) (bitvector 8)) btor94)]
           [btor96 (signal (bvlshr (signal-value btor13) (signal-value btor95))
                           (merge-state (list btor13 btor95)))]
           [btor97 (signal (extract 0 0 (signal-value btor96)) (signal-state btor96))]
           [btor98 (signal (bool->bitvector (bveq (signal-value btor78) (signal-value btor97)))
                           (merge-state (list btor78 btor97)))]
           [btor99 (signal (bvand (signal-value btor93) (signal-value btor98))
                           (merge-state (list btor93 btor98)))]
           [btor100 (if (bitvector->bool (signal-value btor99)) btor78 btor75)]
           [btor101 (signal (concat (signal-value btor3) (signal-value btor23))
                            (merge-state (list btor3 btor23)))]
           [btor102 (signal (concat (signal-value btor4) (signal-value btor101))
                            (merge-state (list btor4 btor101)))]
           [btor103 (bv->signal (zero-extend (signal-value btor102) (bitvector 8)) btor102)]
           [btor104 (signal (bvlshr (signal-value btor13) (signal-value btor103))
                            (merge-state (list btor13 btor103)))]
           [btor105 (signal (extract 0 0 (signal-value btor104)) (signal-state btor104))]
           [btor106 (signal (bvxor (signal-value btor4) (signal-value btor3))
                            (merge-state (list btor4 btor3)))]
           [btor107 (signal (bool->bitvector (bveq (signal-value btor106) (signal-value btor21)))
                            (merge-state (list btor106 btor21)))]
           [btor108 (signal (bool->bitvector (bveq (signal-value btor106) (signal-value btor23)))
                            (merge-state (list btor106 btor23)))]
           [btor109 (signal (bvor (signal-value btor107) (signal-value btor108))
                            (merge-state (list btor107 btor108)))]
           [btor110 (signal (concat (signal-value btor3) (signal-value btor21))
                            (merge-state (list btor3 btor21)))]
           [btor111 (signal (concat (signal-value btor4) (signal-value btor110))
                            (merge-state (list btor4 btor110)))]
           [btor112 (bv->signal (zero-extend (signal-value btor111) (bitvector 8)) btor111)]
           [btor113 (signal (bvlshr (signal-value btor13) (signal-value btor112))
                            (merge-state (list btor13 btor112)))]
           [btor114 (signal (extract 0 0 (signal-value btor113)) (signal-state btor113))]
           [btor115 (signal (bool->bitvector (bveq (signal-value btor105) (signal-value btor114)))
                            (merge-state (list btor105 btor114)))]
           [btor116 (signal (bvand (signal-value btor109) (signal-value btor115))
                            (merge-state (list btor109 btor115)))]
           [btor117 (if (bitvector->bool (signal-value btor116)) btor105 btor100)]
           [btor118 (signal (concat (signal-value btor23) (signal-value btor2))
                            (merge-state (list btor23 btor2)))]
           [btor119 (signal (concat (signal-value btor4) (signal-value btor118))
                            (merge-state (list btor4 btor118)))]
           [btor120 (bv->signal (zero-extend (signal-value btor119) (bitvector 8)) btor119)]
           [btor121 (signal (bvlshr (signal-value btor13) (signal-value btor120))
                            (merge-state (list btor13 btor120)))]
           [btor122 (signal (extract 0 0 (signal-value btor121)) (signal-state btor121))]
           [btor123 (signal (bvxor (signal-value btor4) (signal-value btor2))
                            (merge-state (list btor4 btor2)))]
           [btor124 (signal (bool->bitvector (bveq (signal-value btor123) (signal-value btor21)))
                            (merge-state (list btor123 btor21)))]
           [btor125 (signal (bool->bitvector (bveq (signal-value btor123) (signal-value btor23)))
                            (merge-state (list btor123 btor23)))]
           [btor126 (signal (bvor (signal-value btor124) (signal-value btor125))
                            (merge-state (list btor124 btor125)))]
           [btor127 (signal (concat (signal-value btor21) (signal-value btor2))
                            (merge-state (list btor21 btor2)))]
           [btor128 (signal (concat (signal-value btor4) (signal-value btor127))
                            (merge-state (list btor4 btor127)))]
           [btor129 (bv->signal (zero-extend (signal-value btor128) (bitvector 8)) btor128)]
           [btor130 (signal (bvlshr (signal-value btor13) (signal-value btor129))
                            (merge-state (list btor13 btor129)))]
           [btor131 (signal (extract 0 0 (signal-value btor130)) (signal-state btor130))]
           [btor132 (signal (bool->bitvector (bveq (signal-value btor122) (signal-value btor131)))
                            (merge-state (list btor122 btor131)))]
           [btor133 (signal (bvand (signal-value btor126) (signal-value btor132))
                            (merge-state (list btor126 btor132)))]
           [btor134 (if (bitvector->bool (signal-value btor133)) btor122 btor117)]
           [btor135 (signal (concat (signal-value btor3) (signal-value btor2))
                            (merge-state (list btor3 btor2)))]
           [btor136 (bv->signal (zero-extend (signal-value btor135) (bitvector 8)) btor135)]
           [btor137 (signal (bvlshr (signal-value btor13) (signal-value btor136))
                            (merge-state (list btor13 btor136)))]
           [btor138 (signal (extract 0 0 (signal-value btor137)) (signal-state btor137))]
           [btor139 (signal (bvxor (signal-value btor2) (signal-value btor3))
                            (merge-state (list btor2 btor3)))]
           [btor140 (signal (bool->bitvector (bveq (signal-value btor139) (signal-value btor21)))
                            (merge-state (list btor139 btor21)))]
           [btor141 (signal (bool->bitvector (bveq (signal-value btor139) (signal-value btor23)))
                            (merge-state (list btor139 btor23)))]
           [btor142 (signal (bvor (signal-value btor140) (signal-value btor141))
                            (merge-state (list btor140 btor141)))]
           [btor143 (signal (concat (signal-value btor3) (signal-value btor2))
                            (merge-state (list btor3 btor2)))]
           [btor144 (signal (concat (signal-value btor21) (signal-value btor143))
                            (merge-state (list btor21 btor143)))]
           [btor145 (bv->signal (zero-extend (signal-value btor144) (bitvector 8)) btor144)]
           [btor146 (signal (bvlshr (signal-value btor13) (signal-value btor145))
                            (merge-state (list btor13 btor145)))]
           [btor147 (signal (extract 0 0 (signal-value btor146)) (signal-state btor146))]
           [btor148 (signal (bool->bitvector (bveq (signal-value btor138) (signal-value btor147)))
                            (merge-state (list btor138 btor147)))]
           [btor149 (signal (bvand (signal-value btor142) (signal-value btor148))
                            (merge-state (list btor142 btor148)))]
           [btor150 (if (bitvector->bool (signal-value btor149)) btor138 btor134)]
           [btor151 (signal (extract 0 0 (signal-value btor9)) (signal-state btor9))]
           [btor152 (signal (apply bvor (bitvector->bits (signal-value btor13)))
                            (signal-state btor13))]
           [btor153 (signal (bvnot (signal-value btor152)) (merge-state (list btor152)))]
           [btor154 (signal (apply bvand (bitvector->bits (signal-value btor13)))
                            (signal-state btor13))]
           [btor155 (signal (bvor (signal-value btor153) (signal-value btor154))
                            (merge-state (list btor153 btor154)))]
           [btor156 (if (bitvector->bool (signal-value btor155)) btor151 btor150)]
           [btor157 (signal (concat (signal-value btor3) (signal-value btor2))
                            (merge-state (list btor3 btor2)))]
           [btor158 (signal (concat (signal-value btor4) (signal-value btor157))
                            (merge-state (list btor4 btor157)))]
           [btor159 (bv->signal (zero-extend (signal-value btor158) (bitvector 8)) btor158)]
           [btor160 (signal (bvlshr (signal-value btor13) (signal-value btor159))
                            (merge-state (list btor13 btor159)))]
           [btor161 (signal (extract 0 0 (signal-value btor160)) (signal-state btor160))]
           [btor162 (signal (bvxor (signal-value btor106) (signal-value btor2))
                            (merge-state (list btor106 btor2)))]
           [btor163 (signal (bool->bitvector (bveq (signal-value btor162) (signal-value btor21)))
                            (merge-state (list btor162 btor21)))]
           [btor164 (signal (bool->bitvector (bveq (signal-value btor162) (signal-value btor23)))
                            (merge-state (list btor162 btor23)))]
           [btor165 (signal (bvor (signal-value btor163) (signal-value btor164))
                            (merge-state (list btor163 btor164)))]
           [btor166 (if (bitvector->bool (signal-value btor165)) btor161 btor156)]
           [btor167 unnamed-input-167]
           [btor168 (signal (apply bvor (bitvector->bits (signal-value btor9))) (signal-state btor9))]
           [btor169 (signal (bvnot (signal-value btor168)) (merge-state (list btor168)))]
           [btor170 (signal (apply bvand (bitvector->bits (signal-value btor9)))
                            (signal-state btor9))]
           [btor171 (signal (bvor (signal-value btor169) (signal-value btor170))
                            (merge-state (list btor169 btor170)))]
           [btor172 (if (bitvector->bool (signal-value btor171)) btor167 btor166)]
           [btor173 unnamed-input-173]
           [btor174 (signal (bvxor (signal-value btor139) (signal-value btor4))
                            (merge-state (list btor139 btor4)))]
           [btor175 (signal (bvxor (signal-value btor174) (signal-value btor5))
                            (merge-state (list btor174 btor5)))]
           [btor176 (signal (bvxor (signal-value btor175) (signal-value btor6))
                            (merge-state (list btor175 btor6)))]
           [btor177 (signal (bvxor (signal-value btor176) (signal-value btor7))
                            (merge-state (list btor176 btor7)))]
           [btor178 (signal (bool->bitvector (bveq (signal-value btor177) (signal-value btor23)))
                            (merge-state (list btor177 btor23)))]
           [btor179 (signal (bool->bitvector (bveq (signal-value btor177) (signal-value btor21)))
                            (merge-state (list btor177 btor21)))]
           [btor180 (signal (bvor (signal-value btor178) (signal-value btor179))
                            (merge-state (list btor178 btor179)))]
           [btor181 (if (bitvector->bool (signal-value btor180)) btor173 btor172)]
           [btor182 unnamed-input-182]
           [btor183 (signal (extract 15 8 (signal-value btor9)) (signal-state btor9))]
           [btor184 (bv->signal (zero-extend (signal-value btor17) (bitvector 8)) btor17)]
           [btor185 (signal (bvlshr (signal-value btor183) (signal-value btor184))
                            (merge-state (list btor183 btor184)))]
           [btor186 (signal (extract 0 0 (signal-value btor185)) (signal-state btor185))]
           [btor187 (bv->signal (zero-extend (signal-value btor27) (bitvector 8)) btor27)]
           [btor188 (signal (bvlshr (signal-value btor183) (signal-value btor187))
                            (merge-state (list btor183 btor187)))]
           [btor189 (signal (extract 0 0 (signal-value btor188)) (signal-state btor188))]
           [btor190 (signal (bool->bitvector (bveq (signal-value btor186) (signal-value btor189)))
                            (merge-state (list btor186 btor189)))]
           [btor191 (signal (bvand (signal-value btor25) (signal-value btor190))
                            (merge-state (list btor25 btor190)))]
           [btor192 (bv->signal (zero-extend (signal-value btor34) (bitvector 8)) btor34)]
           [btor193 (signal (bvlshr (signal-value btor183) (signal-value btor192))
                            (merge-state (list btor183 btor192)))]
           [btor194 (signal (extract 0 0 (signal-value btor193)) (signal-state btor193))]
           [btor195 (signal (bool->bitvector (bveq (signal-value btor186) (signal-value btor194)))
                            (merge-state (list btor186 btor194)))]
           [btor196 (signal (bvand (signal-value btor191) (signal-value btor195))
                            (merge-state (list btor191 btor195)))]
           [btor197 (bv->signal (zero-extend (signal-value btor41) (bitvector 8)) btor41)]
           [btor198 (signal (bvlshr (signal-value btor183) (signal-value btor197))
                            (merge-state (list btor183 btor197)))]
           [btor199 (signal (extract 0 0 (signal-value btor198)) (signal-state btor198))]
           [btor200 (signal (bool->bitvector (bveq (signal-value btor186) (signal-value btor199)))
                            (merge-state (list btor186 btor199)))]
           [btor201 (signal (bvand (signal-value btor196) (signal-value btor200))
                            (merge-state (list btor196 btor200)))]
           [btor202 (if (bitvector->bool (signal-value btor201)) btor186 btor182)]
           [btor203 (bv->signal (zero-extend (signal-value btor48) (bitvector 8)) btor48)]
           [btor204 (signal (bvlshr (signal-value btor183) (signal-value btor203))
                            (merge-state (list btor183 btor203)))]
           [btor205 (signal (extract 0 0 (signal-value btor204)) (signal-state btor204))]
           [btor206 (bv->signal (zero-extend (signal-value btor55) (bitvector 8)) btor55)]
           [btor207 (signal (bvlshr (signal-value btor183) (signal-value btor206))
                            (merge-state (list btor183 btor206)))]
           [btor208 (signal (extract 0 0 (signal-value btor207)) (signal-state btor207))]
           [btor209 (signal (bool->bitvector (bveq (signal-value btor205) (signal-value btor208)))
                            (merge-state (list btor205 btor208)))]
           [btor210 (signal (bvand (signal-value btor54) (signal-value btor209))
                            (merge-state (list btor54 btor209)))]
           [btor211 (bv->signal (zero-extend (signal-value btor62) (bitvector 8)) btor62)]
           [btor212 (signal (bvlshr (signal-value btor183) (signal-value btor211))
                            (merge-state (list btor183 btor211)))]
           [btor213 (signal (extract 0 0 (signal-value btor212)) (signal-state btor212))]
           [btor214 (signal (bool->bitvector (bveq (signal-value btor205) (signal-value btor213)))
                            (merge-state (list btor205 btor213)))]
           [btor215 (signal (bvand (signal-value btor210) (signal-value btor214))
                            (merge-state (list btor210 btor214)))]
           [btor216 (bv->signal (zero-extend (signal-value btor69) (bitvector 8)) btor69)]
           [btor217 (signal (bvlshr (signal-value btor183) (signal-value btor216))
                            (merge-state (list btor183 btor216)))]
           [btor218 (signal (extract 0 0 (signal-value btor217)) (signal-state btor217))]
           [btor219 (signal (bool->bitvector (bveq (signal-value btor205) (signal-value btor218)))
                            (merge-state (list btor205 btor218)))]
           [btor220 (signal (bvand (signal-value btor215) (signal-value btor219))
                            (merge-state (list btor215 btor219)))]
           [btor221 (if (bitvector->bool (signal-value btor220)) btor205 btor202)]
           [btor222 (bv->signal (zero-extend (signal-value btor2) (bitvector 8)) btor2)]
           [btor223 (signal (bvlshr (signal-value btor183) (signal-value btor222))
                            (merge-state (list btor183 btor222)))]
           [btor224 (signal (extract 0 0 (signal-value btor223)) (signal-state btor223))]
           [btor225 (bv->signal (zero-extend (signal-value btor82) (bitvector 8)) btor82)]
           [btor226 (signal (bvlshr (signal-value btor183) (signal-value btor225))
                            (merge-state (list btor183 btor225)))]
           [btor227 (signal (extract 0 0 (signal-value btor226)) (signal-state btor226))]
           [btor228 (signal (bool->bitvector (bveq (signal-value btor224) (signal-value btor227)))
                            (merge-state (list btor224 btor227)))]
           [btor229 (signal (bvand (signal-value btor81) (signal-value btor228))
                            (merge-state (list btor81 btor228)))]
           [btor230 (bv->signal (zero-extend (signal-value btor88) (bitvector 8)) btor88)]
           [btor231 (signal (bvlshr (signal-value btor183) (signal-value btor230))
                            (merge-state (list btor183 btor230)))]
           [btor232 (signal (extract 0 0 (signal-value btor231)) (signal-state btor231))]
           [btor233 (signal (bool->bitvector (bveq (signal-value btor224) (signal-value btor232)))
                            (merge-state (list btor224 btor232)))]
           [btor234 (signal (bvand (signal-value btor229) (signal-value btor233))
                            (merge-state (list btor229 btor233)))]
           [btor235 (bv->signal (zero-extend (signal-value btor94) (bitvector 8)) btor94)]
           [btor236 (signal (bvlshr (signal-value btor183) (signal-value btor235))
                            (merge-state (list btor183 btor235)))]
           [btor237 (signal (extract 0 0 (signal-value btor236)) (signal-state btor236))]
           [btor238 (signal (bool->bitvector (bveq (signal-value btor224) (signal-value btor237)))
                            (merge-state (list btor224 btor237)))]
           [btor239 (signal (bvand (signal-value btor234) (signal-value btor238))
                            (merge-state (list btor234 btor238)))]
           [btor240 (if (bitvector->bool (signal-value btor239)) btor224 btor221)]
           [btor241 (bv->signal (zero-extend (signal-value btor102) (bitvector 8)) btor102)]
           [btor242 (signal (bvlshr (signal-value btor183) (signal-value btor241))
                            (merge-state (list btor183 btor241)))]
           [btor243 (signal (extract 0 0 (signal-value btor242)) (signal-state btor242))]
           [btor244 (bv->signal (zero-extend (signal-value btor111) (bitvector 8)) btor111)]
           [btor245 (signal (bvlshr (signal-value btor183) (signal-value btor244))
                            (merge-state (list btor183 btor244)))]
           [btor246 (signal (extract 0 0 (signal-value btor245)) (signal-state btor245))]
           [btor247 (signal (bool->bitvector (bveq (signal-value btor243) (signal-value btor246)))
                            (merge-state (list btor243 btor246)))]
           [btor248 (signal (bvand (signal-value btor109) (signal-value btor247))
                            (merge-state (list btor109 btor247)))]
           [btor249 (if (bitvector->bool (signal-value btor248)) btor243 btor240)]
           [btor250 (bv->signal (zero-extend (signal-value btor119) (bitvector 8)) btor119)]
           [btor251 (signal (bvlshr (signal-value btor183) (signal-value btor250))
                            (merge-state (list btor183 btor250)))]
           [btor252 (signal (extract 0 0 (signal-value btor251)) (signal-state btor251))]
           [btor253 (bv->signal (zero-extend (signal-value btor128) (bitvector 8)) btor128)]
           [btor254 (signal (bvlshr (signal-value btor183) (signal-value btor253))
                            (merge-state (list btor183 btor253)))]
           [btor255 (signal (extract 0 0 (signal-value btor254)) (signal-state btor254))]
           [btor256 (signal (bool->bitvector (bveq (signal-value btor252) (signal-value btor255)))
                            (merge-state (list btor252 btor255)))]
           [btor257 (signal (bvand (signal-value btor126) (signal-value btor256))
                            (merge-state (list btor126 btor256)))]
           [btor258 (if (bitvector->bool (signal-value btor257)) btor252 btor249)]
           [btor259 (bv->signal (zero-extend (signal-value btor135) (bitvector 8)) btor135)]
           [btor260 (signal (bvlshr (signal-value btor183) (signal-value btor259))
                            (merge-state (list btor183 btor259)))]
           [btor261 (signal (extract 0 0 (signal-value btor260)) (signal-state btor260))]
           [btor262 (bv->signal (zero-extend (signal-value btor144) (bitvector 8)) btor144)]
           [btor263 (signal (bvlshr (signal-value btor183) (signal-value btor262))
                            (merge-state (list btor183 btor262)))]
           [btor264 (signal (extract 0 0 (signal-value btor263)) (signal-state btor263))]
           [btor265 (signal (bool->bitvector (bveq (signal-value btor261) (signal-value btor264)))
                            (merge-state (list btor261 btor264)))]
           [btor266 (signal (bvand (signal-value btor142) (signal-value btor265))
                            (merge-state (list btor142 btor265)))]
           [btor267 (if (bitvector->bool (signal-value btor266)) btor261 btor258)]
           [btor268 (signal (extract 8 8 (signal-value btor9)) (signal-state btor9))]
           [btor269 (signal (apply bvor (bitvector->bits (signal-value btor183)))
                            (signal-state btor183))]
           [btor270 (signal (bvnot (signal-value btor269)) (merge-state (list btor269)))]
           [btor271 (signal (apply bvand (bitvector->bits (signal-value btor183)))
                            (signal-state btor183))]
           [btor272 (signal (bvor (signal-value btor270) (signal-value btor271))
                            (merge-state (list btor270 btor271)))]
           [btor273 (if (bitvector->bool (signal-value btor272)) btor268 btor267)]
           [btor274 (bv->signal (zero-extend (signal-value btor158) (bitvector 8)) btor158)]
           [btor275 (signal (bvlshr (signal-value btor183) (signal-value btor274))
                            (merge-state (list btor183 btor274)))]
           [btor276 (signal (extract 0 0 (signal-value btor275)) (signal-state btor275))]
           [btor277 (if (bitvector->bool (signal-value btor165)) btor276 btor273)]
           [btor278 unnamed-input-278]
           [btor279 (if (bitvector->bool (signal-value btor171)) btor278 btor277)]
           [btor280 unnamed-input-280]
           [btor281 (if (bitvector->bool (signal-value btor180)) btor280 btor279)]
           [btor282 unnamed-input-282]
           [btor283 (signal (extract 23 16 (signal-value btor9)) (signal-state btor9))]
           [btor284 (bv->signal (zero-extend (signal-value btor17) (bitvector 8)) btor17)]
           [btor285 (signal (bvlshr (signal-value btor283) (signal-value btor284))
                            (merge-state (list btor283 btor284)))]
           [btor286 (signal (extract 0 0 (signal-value btor285)) (signal-state btor285))]
           [btor287 (bv->signal (zero-extend (signal-value btor27) (bitvector 8)) btor27)]
           [btor288 (signal (bvlshr (signal-value btor283) (signal-value btor287))
                            (merge-state (list btor283 btor287)))]
           [btor289 (signal (extract 0 0 (signal-value btor288)) (signal-state btor288))]
           [btor290 (signal (bool->bitvector (bveq (signal-value btor286) (signal-value btor289)))
                            (merge-state (list btor286 btor289)))]
           [btor291 (signal (bvand (signal-value btor25) (signal-value btor290))
                            (merge-state (list btor25 btor290)))]
           [btor292 (bv->signal (zero-extend (signal-value btor34) (bitvector 8)) btor34)]
           [btor293 (signal (bvlshr (signal-value btor283) (signal-value btor292))
                            (merge-state (list btor283 btor292)))]
           [btor294 (signal (extract 0 0 (signal-value btor293)) (signal-state btor293))]
           [btor295 (signal (bool->bitvector (bveq (signal-value btor286) (signal-value btor294)))
                            (merge-state (list btor286 btor294)))]
           [btor296 (signal (bvand (signal-value btor291) (signal-value btor295))
                            (merge-state (list btor291 btor295)))]
           [btor297 (bv->signal (zero-extend (signal-value btor41) (bitvector 8)) btor41)]
           [btor298 (signal (bvlshr (signal-value btor283) (signal-value btor297))
                            (merge-state (list btor283 btor297)))]
           [btor299 (signal (extract 0 0 (signal-value btor298)) (signal-state btor298))]
           [btor300 (signal (bool->bitvector (bveq (signal-value btor286) (signal-value btor299)))
                            (merge-state (list btor286 btor299)))]
           [btor301 (signal (bvand (signal-value btor296) (signal-value btor300))
                            (merge-state (list btor296 btor300)))]
           [btor302 (if (bitvector->bool (signal-value btor301)) btor286 btor282)]
           [btor303 (bv->signal (zero-extend (signal-value btor48) (bitvector 8)) btor48)]
           [btor304 (signal (bvlshr (signal-value btor283) (signal-value btor303))
                            (merge-state (list btor283 btor303)))]
           [btor305 (signal (extract 0 0 (signal-value btor304)) (signal-state btor304))]
           [btor306 (bv->signal (zero-extend (signal-value btor55) (bitvector 8)) btor55)]
           [btor307 (signal (bvlshr (signal-value btor283) (signal-value btor306))
                            (merge-state (list btor283 btor306)))]
           [btor308 (signal (extract 0 0 (signal-value btor307)) (signal-state btor307))]
           [btor309 (signal (bool->bitvector (bveq (signal-value btor305) (signal-value btor308)))
                            (merge-state (list btor305 btor308)))]
           [btor310 (signal (bvand (signal-value btor54) (signal-value btor309))
                            (merge-state (list btor54 btor309)))]
           [btor311 (bv->signal (zero-extend (signal-value btor62) (bitvector 8)) btor62)]
           [btor312 (signal (bvlshr (signal-value btor283) (signal-value btor311))
                            (merge-state (list btor283 btor311)))]
           [btor313 (signal (extract 0 0 (signal-value btor312)) (signal-state btor312))]
           [btor314 (signal (bool->bitvector (bveq (signal-value btor305) (signal-value btor313)))
                            (merge-state (list btor305 btor313)))]
           [btor315 (signal (bvand (signal-value btor310) (signal-value btor314))
                            (merge-state (list btor310 btor314)))]
           [btor316 (bv->signal (zero-extend (signal-value btor69) (bitvector 8)) btor69)]
           [btor317 (signal (bvlshr (signal-value btor283) (signal-value btor316))
                            (merge-state (list btor283 btor316)))]
           [btor318 (signal (extract 0 0 (signal-value btor317)) (signal-state btor317))]
           [btor319 (signal (bool->bitvector (bveq (signal-value btor305) (signal-value btor318)))
                            (merge-state (list btor305 btor318)))]
           [btor320 (signal (bvand (signal-value btor315) (signal-value btor319))
                            (merge-state (list btor315 btor319)))]
           [btor321 (if (bitvector->bool (signal-value btor320)) btor305 btor302)]
           [btor322 (bv->signal (zero-extend (signal-value btor2) (bitvector 8)) btor2)]
           [btor323 (signal (bvlshr (signal-value btor283) (signal-value btor322))
                            (merge-state (list btor283 btor322)))]
           [btor324 (signal (extract 0 0 (signal-value btor323)) (signal-state btor323))]
           [btor325 (bv->signal (zero-extend (signal-value btor82) (bitvector 8)) btor82)]
           [btor326 (signal (bvlshr (signal-value btor283) (signal-value btor325))
                            (merge-state (list btor283 btor325)))]
           [btor327 (signal (extract 0 0 (signal-value btor326)) (signal-state btor326))]
           [btor328 (signal (bool->bitvector (bveq (signal-value btor324) (signal-value btor327)))
                            (merge-state (list btor324 btor327)))]
           [btor329 (signal (bvand (signal-value btor81) (signal-value btor328))
                            (merge-state (list btor81 btor328)))]
           [btor330 (bv->signal (zero-extend (signal-value btor88) (bitvector 8)) btor88)]
           [btor331 (signal (bvlshr (signal-value btor283) (signal-value btor330))
                            (merge-state (list btor283 btor330)))]
           [btor332 (signal (extract 0 0 (signal-value btor331)) (signal-state btor331))]
           [btor333 (signal (bool->bitvector (bveq (signal-value btor324) (signal-value btor332)))
                            (merge-state (list btor324 btor332)))]
           [btor334 (signal (bvand (signal-value btor329) (signal-value btor333))
                            (merge-state (list btor329 btor333)))]
           [btor335 (bv->signal (zero-extend (signal-value btor94) (bitvector 8)) btor94)]
           [btor336 (signal (bvlshr (signal-value btor283) (signal-value btor335))
                            (merge-state (list btor283 btor335)))]
           [btor337 (signal (extract 0 0 (signal-value btor336)) (signal-state btor336))]
           [btor338 (signal (bool->bitvector (bveq (signal-value btor324) (signal-value btor337)))
                            (merge-state (list btor324 btor337)))]
           [btor339 (signal (bvand (signal-value btor334) (signal-value btor338))
                            (merge-state (list btor334 btor338)))]
           [btor340 (if (bitvector->bool (signal-value btor339)) btor324 btor321)]
           [btor341 (bv->signal (zero-extend (signal-value btor102) (bitvector 8)) btor102)]
           [btor342 (signal (bvlshr (signal-value btor283) (signal-value btor341))
                            (merge-state (list btor283 btor341)))]
           [btor343 (signal (extract 0 0 (signal-value btor342)) (signal-state btor342))]
           [btor344 (bv->signal (zero-extend (signal-value btor111) (bitvector 8)) btor111)]
           [btor345 (signal (bvlshr (signal-value btor283) (signal-value btor344))
                            (merge-state (list btor283 btor344)))]
           [btor346 (signal (extract 0 0 (signal-value btor345)) (signal-state btor345))]
           [btor347 (signal (bool->bitvector (bveq (signal-value btor343) (signal-value btor346)))
                            (merge-state (list btor343 btor346)))]
           [btor348 (signal (bvand (signal-value btor109) (signal-value btor347))
                            (merge-state (list btor109 btor347)))]
           [btor349 (if (bitvector->bool (signal-value btor348)) btor343 btor340)]
           [btor350 (bv->signal (zero-extend (signal-value btor119) (bitvector 8)) btor119)]
           [btor351 (signal (bvlshr (signal-value btor283) (signal-value btor350))
                            (merge-state (list btor283 btor350)))]
           [btor352 (signal (extract 0 0 (signal-value btor351)) (signal-state btor351))]
           [btor353 (bv->signal (zero-extend (signal-value btor128) (bitvector 8)) btor128)]
           [btor354 (signal (bvlshr (signal-value btor283) (signal-value btor353))
                            (merge-state (list btor283 btor353)))]
           [btor355 (signal (extract 0 0 (signal-value btor354)) (signal-state btor354))]
           [btor356 (signal (bool->bitvector (bveq (signal-value btor352) (signal-value btor355)))
                            (merge-state (list btor352 btor355)))]
           [btor357 (signal (bvand (signal-value btor126) (signal-value btor356))
                            (merge-state (list btor126 btor356)))]
           [btor358 (if (bitvector->bool (signal-value btor357)) btor352 btor349)]
           [btor359 (bv->signal (zero-extend (signal-value btor135) (bitvector 8)) btor135)]
           [btor360 (signal (bvlshr (signal-value btor283) (signal-value btor359))
                            (merge-state (list btor283 btor359)))]
           [btor361 (signal (extract 0 0 (signal-value btor360)) (signal-state btor360))]
           [btor362 (bv->signal (zero-extend (signal-value btor144) (bitvector 8)) btor144)]
           [btor363 (signal (bvlshr (signal-value btor283) (signal-value btor362))
                            (merge-state (list btor283 btor362)))]
           [btor364 (signal (extract 0 0 (signal-value btor363)) (signal-state btor363))]
           [btor365 (signal (bool->bitvector (bveq (signal-value btor361) (signal-value btor364)))
                            (merge-state (list btor361 btor364)))]
           [btor366 (signal (bvand (signal-value btor142) (signal-value btor365))
                            (merge-state (list btor142 btor365)))]
           [btor367 (if (bitvector->bool (signal-value btor366)) btor361 btor358)]
           [btor368 (signal (extract 16 16 (signal-value btor9)) (signal-state btor9))]
           [btor369 (signal (apply bvor (bitvector->bits (signal-value btor283)))
                            (signal-state btor283))]
           [btor370 (signal (bvnot (signal-value btor369)) (merge-state (list btor369)))]
           [btor371 (signal (apply bvand (bitvector->bits (signal-value btor283)))
                            (signal-state btor283))]
           [btor372 (signal (bvor (signal-value btor370) (signal-value btor371))
                            (merge-state (list btor370 btor371)))]
           [btor373 (if (bitvector->bool (signal-value btor372)) btor368 btor367)]
           [btor374 (bv->signal (zero-extend (signal-value btor158) (bitvector 8)) btor158)]
           [btor375 (signal (bvlshr (signal-value btor283) (signal-value btor374))
                            (merge-state (list btor283 btor374)))]
           [btor376 (signal (extract 0 0 (signal-value btor375)) (signal-state btor375))]
           [btor377 (if (bitvector->bool (signal-value btor165)) btor376 btor373)]
           [btor378 unnamed-input-378]
           [btor379 (if (bitvector->bool (signal-value btor171)) btor378 btor377)]
           [btor380 unnamed-input-380]
           [btor381 (if (bitvector->bool (signal-value btor180)) btor380 btor379)]
           [btor382 unnamed-input-382]
           [btor383 (signal (extract 31 24 (signal-value btor9)) (signal-state btor9))]
           [btor384 (bv->signal (zero-extend (signal-value btor17) (bitvector 8)) btor17)]
           [btor385 (signal (bvlshr (signal-value btor383) (signal-value btor384))
                            (merge-state (list btor383 btor384)))]
           [btor386 (signal (extract 0 0 (signal-value btor385)) (signal-state btor385))]
           [btor387 (bv->signal (zero-extend (signal-value btor27) (bitvector 8)) btor27)]
           [btor388 (signal (bvlshr (signal-value btor383) (signal-value btor387))
                            (merge-state (list btor383 btor387)))]
           [btor389 (signal (extract 0 0 (signal-value btor388)) (signal-state btor388))]
           [btor390 (signal (bool->bitvector (bveq (signal-value btor386) (signal-value btor389)))
                            (merge-state (list btor386 btor389)))]
           [btor391 (signal (bvand (signal-value btor25) (signal-value btor390))
                            (merge-state (list btor25 btor390)))]
           [btor392 (bv->signal (zero-extend (signal-value btor34) (bitvector 8)) btor34)]
           [btor393 (signal (bvlshr (signal-value btor383) (signal-value btor392))
                            (merge-state (list btor383 btor392)))]
           [btor394 (signal (extract 0 0 (signal-value btor393)) (signal-state btor393))]
           [btor395 (signal (bool->bitvector (bveq (signal-value btor386) (signal-value btor394)))
                            (merge-state (list btor386 btor394)))]
           [btor396 (signal (bvand (signal-value btor391) (signal-value btor395))
                            (merge-state (list btor391 btor395)))]
           [btor397 (bv->signal (zero-extend (signal-value btor41) (bitvector 8)) btor41)]
           [btor398 (signal (bvlshr (signal-value btor383) (signal-value btor397))
                            (merge-state (list btor383 btor397)))]
           [btor399 (signal (extract 0 0 (signal-value btor398)) (signal-state btor398))]
           [btor400 (signal (bool->bitvector (bveq (signal-value btor386) (signal-value btor399)))
                            (merge-state (list btor386 btor399)))]
           [btor401 (signal (bvand (signal-value btor396) (signal-value btor400))
                            (merge-state (list btor396 btor400)))]
           [btor402 (if (bitvector->bool (signal-value btor401)) btor386 btor382)]
           [btor403 (bv->signal (zero-extend (signal-value btor48) (bitvector 8)) btor48)]
           [btor404 (signal (bvlshr (signal-value btor383) (signal-value btor403))
                            (merge-state (list btor383 btor403)))]
           [btor405 (signal (extract 0 0 (signal-value btor404)) (signal-state btor404))]
           [btor406 (bv->signal (zero-extend (signal-value btor55) (bitvector 8)) btor55)]
           [btor407 (signal (bvlshr (signal-value btor383) (signal-value btor406))
                            (merge-state (list btor383 btor406)))]
           [btor408 (signal (extract 0 0 (signal-value btor407)) (signal-state btor407))]
           [btor409 (signal (bool->bitvector (bveq (signal-value btor405) (signal-value btor408)))
                            (merge-state (list btor405 btor408)))]
           [btor410 (signal (bvand (signal-value btor54) (signal-value btor409))
                            (merge-state (list btor54 btor409)))]
           [btor411 (bv->signal (zero-extend (signal-value btor62) (bitvector 8)) btor62)]
           [btor412 (signal (bvlshr (signal-value btor383) (signal-value btor411))
                            (merge-state (list btor383 btor411)))]
           [btor413 (signal (extract 0 0 (signal-value btor412)) (signal-state btor412))]
           [btor414 (signal (bool->bitvector (bveq (signal-value btor405) (signal-value btor413)))
                            (merge-state (list btor405 btor413)))]
           [btor415 (signal (bvand (signal-value btor410) (signal-value btor414))
                            (merge-state (list btor410 btor414)))]
           [btor416 (bv->signal (zero-extend (signal-value btor69) (bitvector 8)) btor69)]
           [btor417 (signal (bvlshr (signal-value btor383) (signal-value btor416))
                            (merge-state (list btor383 btor416)))]
           [btor418 (signal (extract 0 0 (signal-value btor417)) (signal-state btor417))]
           [btor419 (signal (bool->bitvector (bveq (signal-value btor405) (signal-value btor418)))
                            (merge-state (list btor405 btor418)))]
           [btor420 (signal (bvand (signal-value btor415) (signal-value btor419))
                            (merge-state (list btor415 btor419)))]
           [btor421 (if (bitvector->bool (signal-value btor420)) btor405 btor402)]
           [btor422 (bv->signal (zero-extend (signal-value btor2) (bitvector 8)) btor2)]
           [btor423 (signal (bvlshr (signal-value btor383) (signal-value btor422))
                            (merge-state (list btor383 btor422)))]
           [btor424 (signal (extract 0 0 (signal-value btor423)) (signal-state btor423))]
           [btor425 (bv->signal (zero-extend (signal-value btor82) (bitvector 8)) btor82)]
           [btor426 (signal (bvlshr (signal-value btor383) (signal-value btor425))
                            (merge-state (list btor383 btor425)))]
           [btor427 (signal (extract 0 0 (signal-value btor426)) (signal-state btor426))]
           [btor428 (signal (bool->bitvector (bveq (signal-value btor424) (signal-value btor427)))
                            (merge-state (list btor424 btor427)))]
           [btor429 (signal (bvand (signal-value btor81) (signal-value btor428))
                            (merge-state (list btor81 btor428)))]
           [btor430 (bv->signal (zero-extend (signal-value btor88) (bitvector 8)) btor88)]
           [btor431 (signal (bvlshr (signal-value btor383) (signal-value btor430))
                            (merge-state (list btor383 btor430)))]
           [btor432 (signal (extract 0 0 (signal-value btor431)) (signal-state btor431))]
           [btor433 (signal (bool->bitvector (bveq (signal-value btor424) (signal-value btor432)))
                            (merge-state (list btor424 btor432)))]
           [btor434 (signal (bvand (signal-value btor429) (signal-value btor433))
                            (merge-state (list btor429 btor433)))]
           [btor435 (bv->signal (zero-extend (signal-value btor94) (bitvector 8)) btor94)]
           [btor436 (signal (bvlshr (signal-value btor383) (signal-value btor435))
                            (merge-state (list btor383 btor435)))]
           [btor437 (signal (extract 0 0 (signal-value btor436)) (signal-state btor436))]
           [btor438 (signal (bool->bitvector (bveq (signal-value btor424) (signal-value btor437)))
                            (merge-state (list btor424 btor437)))]
           [btor439 (signal (bvand (signal-value btor434) (signal-value btor438))
                            (merge-state (list btor434 btor438)))]
           [btor440 (if (bitvector->bool (signal-value btor439)) btor424 btor421)]
           [btor441 (bv->signal (zero-extend (signal-value btor102) (bitvector 8)) btor102)]
           [btor442 (signal (bvlshr (signal-value btor383) (signal-value btor441))
                            (merge-state (list btor383 btor441)))]
           [btor443 (signal (extract 0 0 (signal-value btor442)) (signal-state btor442))]
           [btor444 (bv->signal (zero-extend (signal-value btor111) (bitvector 8)) btor111)]
           [btor445 (signal (bvlshr (signal-value btor383) (signal-value btor444))
                            (merge-state (list btor383 btor444)))]
           [btor446 (signal (extract 0 0 (signal-value btor445)) (signal-state btor445))]
           [btor447 (signal (bool->bitvector (bveq (signal-value btor443) (signal-value btor446)))
                            (merge-state (list btor443 btor446)))]
           [btor448 (signal (bvand (signal-value btor109) (signal-value btor447))
                            (merge-state (list btor109 btor447)))]
           [btor449 (if (bitvector->bool (signal-value btor448)) btor443 btor440)]
           [btor450 (bv->signal (zero-extend (signal-value btor119) (bitvector 8)) btor119)]
           [btor451 (signal (bvlshr (signal-value btor383) (signal-value btor450))
                            (merge-state (list btor383 btor450)))]
           [btor452 (signal (extract 0 0 (signal-value btor451)) (signal-state btor451))]
           [btor453 (bv->signal (zero-extend (signal-value btor128) (bitvector 8)) btor128)]
           [btor454 (signal (bvlshr (signal-value btor383) (signal-value btor453))
                            (merge-state (list btor383 btor453)))]
           [btor455 (signal (extract 0 0 (signal-value btor454)) (signal-state btor454))]
           [btor456 (signal (bool->bitvector (bveq (signal-value btor452) (signal-value btor455)))
                            (merge-state (list btor452 btor455)))]
           [btor457 (signal (bvand (signal-value btor126) (signal-value btor456))
                            (merge-state (list btor126 btor456)))]
           [btor458 (if (bitvector->bool (signal-value btor457)) btor452 btor449)]
           [btor459 (bv->signal (zero-extend (signal-value btor135) (bitvector 8)) btor135)]
           [btor460 (signal (bvlshr (signal-value btor383) (signal-value btor459))
                            (merge-state (list btor383 btor459)))]
           [btor461 (signal (extract 0 0 (signal-value btor460)) (signal-state btor460))]
           [btor462 (bv->signal (zero-extend (signal-value btor144) (bitvector 8)) btor144)]
           [btor463 (signal (bvlshr (signal-value btor383) (signal-value btor462))
                            (merge-state (list btor383 btor462)))]
           [btor464 (signal (extract 0 0 (signal-value btor463)) (signal-state btor463))]
           [btor465 (signal (bool->bitvector (bveq (signal-value btor461) (signal-value btor464)))
                            (merge-state (list btor461 btor464)))]
           [btor466 (signal (bvand (signal-value btor142) (signal-value btor465))
                            (merge-state (list btor142 btor465)))]
           [btor467 (if (bitvector->bool (signal-value btor466)) btor461 btor458)]
           [btor468 (signal (extract 24 24 (signal-value btor9)) (signal-state btor9))]
           [btor469 (signal (apply bvor (bitvector->bits (signal-value btor383)))
                            (signal-state btor383))]
           [btor470 (signal (bvnot (signal-value btor469)) (merge-state (list btor469)))]
           [btor471 (signal (apply bvand (bitvector->bits (signal-value btor383)))
                            (signal-state btor383))]
           [btor472 (signal (bvor (signal-value btor470) (signal-value btor471))
                            (merge-state (list btor470 btor471)))]
           [btor473 (if (bitvector->bool (signal-value btor472)) btor468 btor467)]
           [btor474 (bv->signal (zero-extend (signal-value btor158) (bitvector 8)) btor158)]
           [btor475 (signal (bvlshr (signal-value btor383) (signal-value btor474))
                            (merge-state (list btor383 btor474)))]
           [btor476 (signal (extract 0 0 (signal-value btor475)) (signal-state btor475))]
           [btor477 (if (bitvector->bool (signal-value btor165)) btor476 btor473)]
           [btor478 unnamed-input-478]
           [btor479 (if (bitvector->bool (signal-value btor171)) btor478 btor477)]
           [btor480 unnamed-input-480]
           [btor481 (if (bitvector->bool (signal-value btor180)) btor480 btor479)]
           [btor482 unnamed-input-482]
           [btor483 (signal (extract 39 32 (signal-value btor9)) (signal-state btor9))]
           [btor484 (bv->signal (zero-extend (signal-value btor17) (bitvector 8)) btor17)]
           [btor485 (signal (bvlshr (signal-value btor483) (signal-value btor484))
                            (merge-state (list btor483 btor484)))]
           [btor486 (signal (extract 0 0 (signal-value btor485)) (signal-state btor485))]
           [btor487 (bv->signal (zero-extend (signal-value btor27) (bitvector 8)) btor27)]
           [btor488 (signal (bvlshr (signal-value btor483) (signal-value btor487))
                            (merge-state (list btor483 btor487)))]
           [btor489 (signal (extract 0 0 (signal-value btor488)) (signal-state btor488))]
           [btor490 (signal (bool->bitvector (bveq (signal-value btor486) (signal-value btor489)))
                            (merge-state (list btor486 btor489)))]
           [btor491 (signal (bvand (signal-value btor25) (signal-value btor490))
                            (merge-state (list btor25 btor490)))]
           [btor492 (bv->signal (zero-extend (signal-value btor34) (bitvector 8)) btor34)]
           [btor493 (signal (bvlshr (signal-value btor483) (signal-value btor492))
                            (merge-state (list btor483 btor492)))]
           [btor494 (signal (extract 0 0 (signal-value btor493)) (signal-state btor493))]
           [btor495 (signal (bool->bitvector (bveq (signal-value btor486) (signal-value btor494)))
                            (merge-state (list btor486 btor494)))]
           [btor496 (signal (bvand (signal-value btor491) (signal-value btor495))
                            (merge-state (list btor491 btor495)))]
           [btor497 (bv->signal (zero-extend (signal-value btor41) (bitvector 8)) btor41)]
           [btor498 (signal (bvlshr (signal-value btor483) (signal-value btor497))
                            (merge-state (list btor483 btor497)))]
           [btor499 (signal (extract 0 0 (signal-value btor498)) (signal-state btor498))]
           [btor500 (signal (bool->bitvector (bveq (signal-value btor486) (signal-value btor499)))
                            (merge-state (list btor486 btor499)))]
           [btor501 (signal (bvand (signal-value btor496) (signal-value btor500))
                            (merge-state (list btor496 btor500)))]
           [btor502 (if (bitvector->bool (signal-value btor501)) btor486 btor482)]
           [btor503 (bv->signal (zero-extend (signal-value btor48) (bitvector 8)) btor48)]
           [btor504 (signal (bvlshr (signal-value btor483) (signal-value btor503))
                            (merge-state (list btor483 btor503)))]
           [btor505 (signal (extract 0 0 (signal-value btor504)) (signal-state btor504))]
           [btor506 (bv->signal (zero-extend (signal-value btor55) (bitvector 8)) btor55)]
           [btor507 (signal (bvlshr (signal-value btor483) (signal-value btor506))
                            (merge-state (list btor483 btor506)))]
           [btor508 (signal (extract 0 0 (signal-value btor507)) (signal-state btor507))]
           [btor509 (signal (bool->bitvector (bveq (signal-value btor505) (signal-value btor508)))
                            (merge-state (list btor505 btor508)))]
           [btor510 (signal (bvand (signal-value btor54) (signal-value btor509))
                            (merge-state (list btor54 btor509)))]
           [btor511 (bv->signal (zero-extend (signal-value btor62) (bitvector 8)) btor62)]
           [btor512 (signal (bvlshr (signal-value btor483) (signal-value btor511))
                            (merge-state (list btor483 btor511)))]
           [btor513 (signal (extract 0 0 (signal-value btor512)) (signal-state btor512))]
           [btor514 (signal (bool->bitvector (bveq (signal-value btor505) (signal-value btor513)))
                            (merge-state (list btor505 btor513)))]
           [btor515 (signal (bvand (signal-value btor510) (signal-value btor514))
                            (merge-state (list btor510 btor514)))]
           [btor516 (bv->signal (zero-extend (signal-value btor69) (bitvector 8)) btor69)]
           [btor517 (signal (bvlshr (signal-value btor483) (signal-value btor516))
                            (merge-state (list btor483 btor516)))]
           [btor518 (signal (extract 0 0 (signal-value btor517)) (signal-state btor517))]
           [btor519 (signal (bool->bitvector (bveq (signal-value btor505) (signal-value btor518)))
                            (merge-state (list btor505 btor518)))]
           [btor520 (signal (bvand (signal-value btor515) (signal-value btor519))
                            (merge-state (list btor515 btor519)))]
           [btor521 (if (bitvector->bool (signal-value btor520)) btor505 btor502)]
           [btor522 (bv->signal (zero-extend (signal-value btor2) (bitvector 8)) btor2)]
           [btor523 (signal (bvlshr (signal-value btor483) (signal-value btor522))
                            (merge-state (list btor483 btor522)))]
           [btor524 (signal (extract 0 0 (signal-value btor523)) (signal-state btor523))]
           [btor525 (bv->signal (zero-extend (signal-value btor82) (bitvector 8)) btor82)]
           [btor526 (signal (bvlshr (signal-value btor483) (signal-value btor525))
                            (merge-state (list btor483 btor525)))]
           [btor527 (signal (extract 0 0 (signal-value btor526)) (signal-state btor526))]
           [btor528 (signal (bool->bitvector (bveq (signal-value btor524) (signal-value btor527)))
                            (merge-state (list btor524 btor527)))]
           [btor529 (signal (bvand (signal-value btor81) (signal-value btor528))
                            (merge-state (list btor81 btor528)))]
           [btor530 (bv->signal (zero-extend (signal-value btor88) (bitvector 8)) btor88)]
           [btor531 (signal (bvlshr (signal-value btor483) (signal-value btor530))
                            (merge-state (list btor483 btor530)))]
           [btor532 (signal (extract 0 0 (signal-value btor531)) (signal-state btor531))]
           [btor533 (signal (bool->bitvector (bveq (signal-value btor524) (signal-value btor532)))
                            (merge-state (list btor524 btor532)))]
           [btor534 (signal (bvand (signal-value btor529) (signal-value btor533))
                            (merge-state (list btor529 btor533)))]
           [btor535 (bv->signal (zero-extend (signal-value btor94) (bitvector 8)) btor94)]
           [btor536 (signal (bvlshr (signal-value btor483) (signal-value btor535))
                            (merge-state (list btor483 btor535)))]
           [btor537 (signal (extract 0 0 (signal-value btor536)) (signal-state btor536))]
           [btor538 (signal (bool->bitvector (bveq (signal-value btor524) (signal-value btor537)))
                            (merge-state (list btor524 btor537)))]
           [btor539 (signal (bvand (signal-value btor534) (signal-value btor538))
                            (merge-state (list btor534 btor538)))]
           [btor540 (if (bitvector->bool (signal-value btor539)) btor524 btor521)]
           [btor541 (bv->signal (zero-extend (signal-value btor102) (bitvector 8)) btor102)]
           [btor542 (signal (bvlshr (signal-value btor483) (signal-value btor541))
                            (merge-state (list btor483 btor541)))]
           [btor543 (signal (extract 0 0 (signal-value btor542)) (signal-state btor542))]
           [btor544 (bv->signal (zero-extend (signal-value btor111) (bitvector 8)) btor111)]
           [btor545 (signal (bvlshr (signal-value btor483) (signal-value btor544))
                            (merge-state (list btor483 btor544)))]
           [btor546 (signal (extract 0 0 (signal-value btor545)) (signal-state btor545))]
           [btor547 (signal (bool->bitvector (bveq (signal-value btor543) (signal-value btor546)))
                            (merge-state (list btor543 btor546)))]
           [btor548 (signal (bvand (signal-value btor109) (signal-value btor547))
                            (merge-state (list btor109 btor547)))]
           [btor549 (if (bitvector->bool (signal-value btor548)) btor543 btor540)]
           [btor550 (bv->signal (zero-extend (signal-value btor119) (bitvector 8)) btor119)]
           [btor551 (signal (bvlshr (signal-value btor483) (signal-value btor550))
                            (merge-state (list btor483 btor550)))]
           [btor552 (signal (extract 0 0 (signal-value btor551)) (signal-state btor551))]
           [btor553 (bv->signal (zero-extend (signal-value btor128) (bitvector 8)) btor128)]
           [btor554 (signal (bvlshr (signal-value btor483) (signal-value btor553))
                            (merge-state (list btor483 btor553)))]
           [btor555 (signal (extract 0 0 (signal-value btor554)) (signal-state btor554))]
           [btor556 (signal (bool->bitvector (bveq (signal-value btor552) (signal-value btor555)))
                            (merge-state (list btor552 btor555)))]
           [btor557 (signal (bvand (signal-value btor126) (signal-value btor556))
                            (merge-state (list btor126 btor556)))]
           [btor558 (if (bitvector->bool (signal-value btor557)) btor552 btor549)]
           [btor559 (bv->signal (zero-extend (signal-value btor135) (bitvector 8)) btor135)]
           [btor560 (signal (bvlshr (signal-value btor483) (signal-value btor559))
                            (merge-state (list btor483 btor559)))]
           [btor561 (signal (extract 0 0 (signal-value btor560)) (signal-state btor560))]
           [btor562 (bv->signal (zero-extend (signal-value btor144) (bitvector 8)) btor144)]
           [btor563 (signal (bvlshr (signal-value btor483) (signal-value btor562))
                            (merge-state (list btor483 btor562)))]
           [btor564 (signal (extract 0 0 (signal-value btor563)) (signal-state btor563))]
           [btor565 (signal (bool->bitvector (bveq (signal-value btor561) (signal-value btor564)))
                            (merge-state (list btor561 btor564)))]
           [btor566 (signal (bvand (signal-value btor142) (signal-value btor565))
                            (merge-state (list btor142 btor565)))]
           [btor567 (if (bitvector->bool (signal-value btor566)) btor561 btor558)]
           [btor568 (signal (extract 32 32 (signal-value btor9)) (signal-state btor9))]
           [btor569 (signal (apply bvor (bitvector->bits (signal-value btor483)))
                            (signal-state btor483))]
           [btor570 (signal (bvnot (signal-value btor569)) (merge-state (list btor569)))]
           [btor571 (signal (apply bvand (bitvector->bits (signal-value btor483)))
                            (signal-state btor483))]
           [btor572 (signal (bvor (signal-value btor570) (signal-value btor571))
                            (merge-state (list btor570 btor571)))]
           [btor573 (if (bitvector->bool (signal-value btor572)) btor568 btor567)]
           [btor574 (bv->signal (zero-extend (signal-value btor158) (bitvector 8)) btor158)]
           [btor575 (signal (bvlshr (signal-value btor483) (signal-value btor574))
                            (merge-state (list btor483 btor574)))]
           [btor576 (signal (extract 0 0 (signal-value btor575)) (signal-state btor575))]
           [btor577 (if (bitvector->bool (signal-value btor165)) btor576 btor573)]
           [btor578 unnamed-input-578]
           [btor579 (if (bitvector->bool (signal-value btor171)) btor578 btor577)]
           [btor580 unnamed-input-580]
           [btor581 (if (bitvector->bool (signal-value btor180)) btor580 btor579)]
           [btor582 unnamed-input-582]
           [btor583 (signal (extract 47 40 (signal-value btor9)) (signal-state btor9))]
           [btor584 (bv->signal (zero-extend (signal-value btor17) (bitvector 8)) btor17)]
           [btor585 (signal (bvlshr (signal-value btor583) (signal-value btor584))
                            (merge-state (list btor583 btor584)))]
           [btor586 (signal (extract 0 0 (signal-value btor585)) (signal-state btor585))]
           [btor587 (bv->signal (zero-extend (signal-value btor27) (bitvector 8)) btor27)]
           [btor588 (signal (bvlshr (signal-value btor583) (signal-value btor587))
                            (merge-state (list btor583 btor587)))]
           [btor589 (signal (extract 0 0 (signal-value btor588)) (signal-state btor588))]
           [btor590 (signal (bool->bitvector (bveq (signal-value btor586) (signal-value btor589)))
                            (merge-state (list btor586 btor589)))]
           [btor591 (signal (bvand (signal-value btor25) (signal-value btor590))
                            (merge-state (list btor25 btor590)))]
           [btor592 (bv->signal (zero-extend (signal-value btor34) (bitvector 8)) btor34)]
           [btor593 (signal (bvlshr (signal-value btor583) (signal-value btor592))
                            (merge-state (list btor583 btor592)))]
           [btor594 (signal (extract 0 0 (signal-value btor593)) (signal-state btor593))]
           [btor595 (signal (bool->bitvector (bveq (signal-value btor586) (signal-value btor594)))
                            (merge-state (list btor586 btor594)))]
           [btor596 (signal (bvand (signal-value btor591) (signal-value btor595))
                            (merge-state (list btor591 btor595)))]
           [btor597 (bv->signal (zero-extend (signal-value btor41) (bitvector 8)) btor41)]
           [btor598 (signal (bvlshr (signal-value btor583) (signal-value btor597))
                            (merge-state (list btor583 btor597)))]
           [btor599 (signal (extract 0 0 (signal-value btor598)) (signal-state btor598))]
           [btor600 (signal (bool->bitvector (bveq (signal-value btor586) (signal-value btor599)))
                            (merge-state (list btor586 btor599)))]
           [btor601 (signal (bvand (signal-value btor596) (signal-value btor600))
                            (merge-state (list btor596 btor600)))]
           [btor602 (if (bitvector->bool (signal-value btor601)) btor586 btor582)]
           [btor603 (bv->signal (zero-extend (signal-value btor48) (bitvector 8)) btor48)]
           [btor604 (signal (bvlshr (signal-value btor583) (signal-value btor603))
                            (merge-state (list btor583 btor603)))]
           [btor605 (signal (extract 0 0 (signal-value btor604)) (signal-state btor604))]
           [btor606 (bv->signal (zero-extend (signal-value btor55) (bitvector 8)) btor55)]
           [btor607 (signal (bvlshr (signal-value btor583) (signal-value btor606))
                            (merge-state (list btor583 btor606)))]
           [btor608 (signal (extract 0 0 (signal-value btor607)) (signal-state btor607))]
           [btor609 (signal (bool->bitvector (bveq (signal-value btor605) (signal-value btor608)))
                            (merge-state (list btor605 btor608)))]
           [btor610 (signal (bvand (signal-value btor54) (signal-value btor609))
                            (merge-state (list btor54 btor609)))]
           [btor611 (bv->signal (zero-extend (signal-value btor62) (bitvector 8)) btor62)]
           [btor612 (signal (bvlshr (signal-value btor583) (signal-value btor611))
                            (merge-state (list btor583 btor611)))]
           [btor613 (signal (extract 0 0 (signal-value btor612)) (signal-state btor612))]
           [btor614 (signal (bool->bitvector (bveq (signal-value btor605) (signal-value btor613)))
                            (merge-state (list btor605 btor613)))]
           [btor615 (signal (bvand (signal-value btor610) (signal-value btor614))
                            (merge-state (list btor610 btor614)))]
           [btor616 (bv->signal (zero-extend (signal-value btor69) (bitvector 8)) btor69)]
           [btor617 (signal (bvlshr (signal-value btor583) (signal-value btor616))
                            (merge-state (list btor583 btor616)))]
           [btor618 (signal (extract 0 0 (signal-value btor617)) (signal-state btor617))]
           [btor619 (signal (bool->bitvector (bveq (signal-value btor605) (signal-value btor618)))
                            (merge-state (list btor605 btor618)))]
           [btor620 (signal (bvand (signal-value btor615) (signal-value btor619))
                            (merge-state (list btor615 btor619)))]
           [btor621 (if (bitvector->bool (signal-value btor620)) btor605 btor602)]
           [btor622 (bv->signal (zero-extend (signal-value btor2) (bitvector 8)) btor2)]
           [btor623 (signal (bvlshr (signal-value btor583) (signal-value btor622))
                            (merge-state (list btor583 btor622)))]
           [btor624 (signal (extract 0 0 (signal-value btor623)) (signal-state btor623))]
           [btor625 (bv->signal (zero-extend (signal-value btor82) (bitvector 8)) btor82)]
           [btor626 (signal (bvlshr (signal-value btor583) (signal-value btor625))
                            (merge-state (list btor583 btor625)))]
           [btor627 (signal (extract 0 0 (signal-value btor626)) (signal-state btor626))]
           [btor628 (signal (bool->bitvector (bveq (signal-value btor624) (signal-value btor627)))
                            (merge-state (list btor624 btor627)))]
           [btor629 (signal (bvand (signal-value btor81) (signal-value btor628))
                            (merge-state (list btor81 btor628)))]
           [btor630 (bv->signal (zero-extend (signal-value btor88) (bitvector 8)) btor88)]
           [btor631 (signal (bvlshr (signal-value btor583) (signal-value btor630))
                            (merge-state (list btor583 btor630)))]
           [btor632 (signal (extract 0 0 (signal-value btor631)) (signal-state btor631))]
           [btor633 (signal (bool->bitvector (bveq (signal-value btor624) (signal-value btor632)))
                            (merge-state (list btor624 btor632)))]
           [btor634 (signal (bvand (signal-value btor629) (signal-value btor633))
                            (merge-state (list btor629 btor633)))]
           [btor635 (bv->signal (zero-extend (signal-value btor94) (bitvector 8)) btor94)]
           [btor636 (signal (bvlshr (signal-value btor583) (signal-value btor635))
                            (merge-state (list btor583 btor635)))]
           [btor637 (signal (extract 0 0 (signal-value btor636)) (signal-state btor636))]
           [btor638 (signal (bool->bitvector (bveq (signal-value btor624) (signal-value btor637)))
                            (merge-state (list btor624 btor637)))]
           [btor639 (signal (bvand (signal-value btor634) (signal-value btor638))
                            (merge-state (list btor634 btor638)))]
           [btor640 (if (bitvector->bool (signal-value btor639)) btor624 btor621)]
           [btor641 (bv->signal (zero-extend (signal-value btor102) (bitvector 8)) btor102)]
           [btor642 (signal (bvlshr (signal-value btor583) (signal-value btor641))
                            (merge-state (list btor583 btor641)))]
           [btor643 (signal (extract 0 0 (signal-value btor642)) (signal-state btor642))]
           [btor644 (bv->signal (zero-extend (signal-value btor111) (bitvector 8)) btor111)]
           [btor645 (signal (bvlshr (signal-value btor583) (signal-value btor644))
                            (merge-state (list btor583 btor644)))]
           [btor646 (signal (extract 0 0 (signal-value btor645)) (signal-state btor645))]
           [btor647 (signal (bool->bitvector (bveq (signal-value btor643) (signal-value btor646)))
                            (merge-state (list btor643 btor646)))]
           [btor648 (signal (bvand (signal-value btor109) (signal-value btor647))
                            (merge-state (list btor109 btor647)))]
           [btor649 (if (bitvector->bool (signal-value btor648)) btor643 btor640)]
           [btor650 (bv->signal (zero-extend (signal-value btor119) (bitvector 8)) btor119)]
           [btor651 (signal (bvlshr (signal-value btor583) (signal-value btor650))
                            (merge-state (list btor583 btor650)))]
           [btor652 (signal (extract 0 0 (signal-value btor651)) (signal-state btor651))]
           [btor653 (bv->signal (zero-extend (signal-value btor128) (bitvector 8)) btor128)]
           [btor654 (signal (bvlshr (signal-value btor583) (signal-value btor653))
                            (merge-state (list btor583 btor653)))]
           [btor655 (signal (extract 0 0 (signal-value btor654)) (signal-state btor654))]
           [btor656 (signal (bool->bitvector (bveq (signal-value btor652) (signal-value btor655)))
                            (merge-state (list btor652 btor655)))]
           [btor657 (signal (bvand (signal-value btor126) (signal-value btor656))
                            (merge-state (list btor126 btor656)))]
           [btor658 (if (bitvector->bool (signal-value btor657)) btor652 btor649)]
           [btor659 (bv->signal (zero-extend (signal-value btor135) (bitvector 8)) btor135)]
           [btor660 (signal (bvlshr (signal-value btor583) (signal-value btor659))
                            (merge-state (list btor583 btor659)))]
           [btor661 (signal (extract 0 0 (signal-value btor660)) (signal-state btor660))]
           [btor662 (bv->signal (zero-extend (signal-value btor144) (bitvector 8)) btor144)]
           [btor663 (signal (bvlshr (signal-value btor583) (signal-value btor662))
                            (merge-state (list btor583 btor662)))]
           [btor664 (signal (extract 0 0 (signal-value btor663)) (signal-state btor663))]
           [btor665 (signal (bool->bitvector (bveq (signal-value btor661) (signal-value btor664)))
                            (merge-state (list btor661 btor664)))]
           [btor666 (signal (bvand (signal-value btor142) (signal-value btor665))
                            (merge-state (list btor142 btor665)))]
           [btor667 (if (bitvector->bool (signal-value btor666)) btor661 btor658)]
           [btor668 (signal (extract 40 40 (signal-value btor9)) (signal-state btor9))]
           [btor669 (signal (apply bvor (bitvector->bits (signal-value btor583)))
                            (signal-state btor583))]
           [btor670 (signal (bvnot (signal-value btor669)) (merge-state (list btor669)))]
           [btor671 (signal (apply bvand (bitvector->bits (signal-value btor583)))
                            (signal-state btor583))]
           [btor672 (signal (bvor (signal-value btor670) (signal-value btor671))
                            (merge-state (list btor670 btor671)))]
           [btor673 (if (bitvector->bool (signal-value btor672)) btor668 btor667)]
           [btor674 (bv->signal (zero-extend (signal-value btor158) (bitvector 8)) btor158)]
           [btor675 (signal (bvlshr (signal-value btor583) (signal-value btor674))
                            (merge-state (list btor583 btor674)))]
           [btor676 (signal (extract 0 0 (signal-value btor675)) (signal-state btor675))]
           [btor677 (if (bitvector->bool (signal-value btor165)) btor676 btor673)]
           [btor678 unnamed-input-678]
           [btor679 (if (bitvector->bool (signal-value btor171)) btor678 btor677)]
           [btor680 unnamed-input-680]
           [btor681 (if (bitvector->bool (signal-value btor180)) btor680 btor679)]
           [btor682 unnamed-input-682]
           [btor683 (signal (extract 55 48 (signal-value btor9)) (signal-state btor9))]
           [btor684 (bv->signal (zero-extend (signal-value btor17) (bitvector 8)) btor17)]
           [btor685 (signal (bvlshr (signal-value btor683) (signal-value btor684))
                            (merge-state (list btor683 btor684)))]
           [btor686 (signal (extract 0 0 (signal-value btor685)) (signal-state btor685))]
           [btor687 (bv->signal (zero-extend (signal-value btor27) (bitvector 8)) btor27)]
           [btor688 (signal (bvlshr (signal-value btor683) (signal-value btor687))
                            (merge-state (list btor683 btor687)))]
           [btor689 (signal (extract 0 0 (signal-value btor688)) (signal-state btor688))]
           [btor690 (signal (bool->bitvector (bveq (signal-value btor686) (signal-value btor689)))
                            (merge-state (list btor686 btor689)))]
           [btor691 (signal (bvand (signal-value btor25) (signal-value btor690))
                            (merge-state (list btor25 btor690)))]
           [btor692 (bv->signal (zero-extend (signal-value btor34) (bitvector 8)) btor34)]
           [btor693 (signal (bvlshr (signal-value btor683) (signal-value btor692))
                            (merge-state (list btor683 btor692)))]
           [btor694 (signal (extract 0 0 (signal-value btor693)) (signal-state btor693))]
           [btor695 (signal (bool->bitvector (bveq (signal-value btor686) (signal-value btor694)))
                            (merge-state (list btor686 btor694)))]
           [btor696 (signal (bvand (signal-value btor691) (signal-value btor695))
                            (merge-state (list btor691 btor695)))]
           [btor697 (bv->signal (zero-extend (signal-value btor41) (bitvector 8)) btor41)]
           [btor698 (signal (bvlshr (signal-value btor683) (signal-value btor697))
                            (merge-state (list btor683 btor697)))]
           [btor699 (signal (extract 0 0 (signal-value btor698)) (signal-state btor698))]
           [btor700 (signal (bool->bitvector (bveq (signal-value btor686) (signal-value btor699)))
                            (merge-state (list btor686 btor699)))]
           [btor701 (signal (bvand (signal-value btor696) (signal-value btor700))
                            (merge-state (list btor696 btor700)))]
           [btor702 (if (bitvector->bool (signal-value btor701)) btor686 btor682)]
           [btor703 (bv->signal (zero-extend (signal-value btor48) (bitvector 8)) btor48)]
           [btor704 (signal (bvlshr (signal-value btor683) (signal-value btor703))
                            (merge-state (list btor683 btor703)))]
           [btor705 (signal (extract 0 0 (signal-value btor704)) (signal-state btor704))]
           [btor706 (bv->signal (zero-extend (signal-value btor55) (bitvector 8)) btor55)]
           [btor707 (signal (bvlshr (signal-value btor683) (signal-value btor706))
                            (merge-state (list btor683 btor706)))]
           [btor708 (signal (extract 0 0 (signal-value btor707)) (signal-state btor707))]
           [btor709 (signal (bool->bitvector (bveq (signal-value btor705) (signal-value btor708)))
                            (merge-state (list btor705 btor708)))]
           [btor710 (signal (bvand (signal-value btor54) (signal-value btor709))
                            (merge-state (list btor54 btor709)))]
           [btor711 (bv->signal (zero-extend (signal-value btor62) (bitvector 8)) btor62)]
           [btor712 (signal (bvlshr (signal-value btor683) (signal-value btor711))
                            (merge-state (list btor683 btor711)))]
           [btor713 (signal (extract 0 0 (signal-value btor712)) (signal-state btor712))]
           [btor714 (signal (bool->bitvector (bveq (signal-value btor705) (signal-value btor713)))
                            (merge-state (list btor705 btor713)))]
           [btor715 (signal (bvand (signal-value btor710) (signal-value btor714))
                            (merge-state (list btor710 btor714)))]
           [btor716 (bv->signal (zero-extend (signal-value btor69) (bitvector 8)) btor69)]
           [btor717 (signal (bvlshr (signal-value btor683) (signal-value btor716))
                            (merge-state (list btor683 btor716)))]
           [btor718 (signal (extract 0 0 (signal-value btor717)) (signal-state btor717))]
           [btor719 (signal (bool->bitvector (bveq (signal-value btor705) (signal-value btor718)))
                            (merge-state (list btor705 btor718)))]
           [btor720 (signal (bvand (signal-value btor715) (signal-value btor719))
                            (merge-state (list btor715 btor719)))]
           [btor721 (if (bitvector->bool (signal-value btor720)) btor705 btor702)]
           [btor722 (bv->signal (zero-extend (signal-value btor2) (bitvector 8)) btor2)]
           [btor723 (signal (bvlshr (signal-value btor683) (signal-value btor722))
                            (merge-state (list btor683 btor722)))]
           [btor724 (signal (extract 0 0 (signal-value btor723)) (signal-state btor723))]
           [btor725 (bv->signal (zero-extend (signal-value btor82) (bitvector 8)) btor82)]
           [btor726 (signal (bvlshr (signal-value btor683) (signal-value btor725))
                            (merge-state (list btor683 btor725)))]
           [btor727 (signal (extract 0 0 (signal-value btor726)) (signal-state btor726))]
           [btor728 (signal (bool->bitvector (bveq (signal-value btor724) (signal-value btor727)))
                            (merge-state (list btor724 btor727)))]
           [btor729 (signal (bvand (signal-value btor81) (signal-value btor728))
                            (merge-state (list btor81 btor728)))]
           [btor730 (bv->signal (zero-extend (signal-value btor88) (bitvector 8)) btor88)]
           [btor731 (signal (bvlshr (signal-value btor683) (signal-value btor730))
                            (merge-state (list btor683 btor730)))]
           [btor732 (signal (extract 0 0 (signal-value btor731)) (signal-state btor731))]
           [btor733 (signal (bool->bitvector (bveq (signal-value btor724) (signal-value btor732)))
                            (merge-state (list btor724 btor732)))]
           [btor734 (signal (bvand (signal-value btor729) (signal-value btor733))
                            (merge-state (list btor729 btor733)))]
           [btor735 (bv->signal (zero-extend (signal-value btor94) (bitvector 8)) btor94)]
           [btor736 (signal (bvlshr (signal-value btor683) (signal-value btor735))
                            (merge-state (list btor683 btor735)))]
           [btor737 (signal (extract 0 0 (signal-value btor736)) (signal-state btor736))]
           [btor738 (signal (bool->bitvector (bveq (signal-value btor724) (signal-value btor737)))
                            (merge-state (list btor724 btor737)))]
           [btor739 (signal (bvand (signal-value btor734) (signal-value btor738))
                            (merge-state (list btor734 btor738)))]
           [btor740 (if (bitvector->bool (signal-value btor739)) btor724 btor721)]
           [btor741 (bv->signal (zero-extend (signal-value btor102) (bitvector 8)) btor102)]
           [btor742 (signal (bvlshr (signal-value btor683) (signal-value btor741))
                            (merge-state (list btor683 btor741)))]
           [btor743 (signal (extract 0 0 (signal-value btor742)) (signal-state btor742))]
           [btor744 (bv->signal (zero-extend (signal-value btor111) (bitvector 8)) btor111)]
           [btor745 (signal (bvlshr (signal-value btor683) (signal-value btor744))
                            (merge-state (list btor683 btor744)))]
           [btor746 (signal (extract 0 0 (signal-value btor745)) (signal-state btor745))]
           [btor747 (signal (bool->bitvector (bveq (signal-value btor743) (signal-value btor746)))
                            (merge-state (list btor743 btor746)))]
           [btor748 (signal (bvand (signal-value btor109) (signal-value btor747))
                            (merge-state (list btor109 btor747)))]
           [btor749 (if (bitvector->bool (signal-value btor748)) btor743 btor740)]
           [btor750 (bv->signal (zero-extend (signal-value btor119) (bitvector 8)) btor119)]
           [btor751 (signal (bvlshr (signal-value btor683) (signal-value btor750))
                            (merge-state (list btor683 btor750)))]
           [btor752 (signal (extract 0 0 (signal-value btor751)) (signal-state btor751))]
           [btor753 (bv->signal (zero-extend (signal-value btor128) (bitvector 8)) btor128)]
           [btor754 (signal (bvlshr (signal-value btor683) (signal-value btor753))
                            (merge-state (list btor683 btor753)))]
           [btor755 (signal (extract 0 0 (signal-value btor754)) (signal-state btor754))]
           [btor756 (signal (bool->bitvector (bveq (signal-value btor752) (signal-value btor755)))
                            (merge-state (list btor752 btor755)))]
           [btor757 (signal (bvand (signal-value btor126) (signal-value btor756))
                            (merge-state (list btor126 btor756)))]
           [btor758 (if (bitvector->bool (signal-value btor757)) btor752 btor749)]
           [btor759 (bv->signal (zero-extend (signal-value btor135) (bitvector 8)) btor135)]
           [btor760 (signal (bvlshr (signal-value btor683) (signal-value btor759))
                            (merge-state (list btor683 btor759)))]
           [btor761 (signal (extract 0 0 (signal-value btor760)) (signal-state btor760))]
           [btor762 (bv->signal (zero-extend (signal-value btor144) (bitvector 8)) btor144)]
           [btor763 (signal (bvlshr (signal-value btor683) (signal-value btor762))
                            (merge-state (list btor683 btor762)))]
           [btor764 (signal (extract 0 0 (signal-value btor763)) (signal-state btor763))]
           [btor765 (signal (bool->bitvector (bveq (signal-value btor761) (signal-value btor764)))
                            (merge-state (list btor761 btor764)))]
           [btor766 (signal (bvand (signal-value btor142) (signal-value btor765))
                            (merge-state (list btor142 btor765)))]
           [btor767 (if (bitvector->bool (signal-value btor766)) btor761 btor758)]
           [btor768 (signal (extract 48 48 (signal-value btor9)) (signal-state btor9))]
           [btor769 (signal (apply bvor (bitvector->bits (signal-value btor683)))
                            (signal-state btor683))]
           [btor770 (signal (bvnot (signal-value btor769)) (merge-state (list btor769)))]
           [btor771 (signal (apply bvand (bitvector->bits (signal-value btor683)))
                            (signal-state btor683))]
           [btor772 (signal (bvor (signal-value btor770) (signal-value btor771))
                            (merge-state (list btor770 btor771)))]
           [btor773 (if (bitvector->bool (signal-value btor772)) btor768 btor767)]
           [btor774 (bv->signal (zero-extend (signal-value btor158) (bitvector 8)) btor158)]
           [btor775 (signal (bvlshr (signal-value btor683) (signal-value btor774))
                            (merge-state (list btor683 btor774)))]
           [btor776 (signal (extract 0 0 (signal-value btor775)) (signal-state btor775))]
           [btor777 (if (bitvector->bool (signal-value btor165)) btor776 btor773)]
           [btor778 unnamed-input-778]
           [btor779 (if (bitvector->bool (signal-value btor171)) btor778 btor777)]
           [btor780 unnamed-input-780]
           [btor781 (if (bitvector->bool (signal-value btor180)) btor780 btor779)]
           [btor782 unnamed-input-782]
           [btor783 (signal (extract 63 56 (signal-value btor9)) (signal-state btor9))]
           [btor784 (bv->signal (zero-extend (signal-value btor17) (bitvector 8)) btor17)]
           [btor785 (signal (bvlshr (signal-value btor783) (signal-value btor784))
                            (merge-state (list btor783 btor784)))]
           [btor786 (signal (extract 0 0 (signal-value btor785)) (signal-state btor785))]
           [btor787 (bv->signal (zero-extend (signal-value btor27) (bitvector 8)) btor27)]
           [btor788 (signal (bvlshr (signal-value btor783) (signal-value btor787))
                            (merge-state (list btor783 btor787)))]
           [btor789 (signal (extract 0 0 (signal-value btor788)) (signal-state btor788))]
           [btor790 (signal (bool->bitvector (bveq (signal-value btor786) (signal-value btor789)))
                            (merge-state (list btor786 btor789)))]
           [btor791 (signal (bvand (signal-value btor25) (signal-value btor790))
                            (merge-state (list btor25 btor790)))]
           [btor792 (bv->signal (zero-extend (signal-value btor34) (bitvector 8)) btor34)]
           [btor793 (signal (bvlshr (signal-value btor783) (signal-value btor792))
                            (merge-state (list btor783 btor792)))]
           [btor794 (signal (extract 0 0 (signal-value btor793)) (signal-state btor793))]
           [btor795 (signal (bool->bitvector (bveq (signal-value btor786) (signal-value btor794)))
                            (merge-state (list btor786 btor794)))]
           [btor796 (signal (bvand (signal-value btor791) (signal-value btor795))
                            (merge-state (list btor791 btor795)))]
           [btor797 (bv->signal (zero-extend (signal-value btor41) (bitvector 8)) btor41)]
           [btor798 (signal (bvlshr (signal-value btor783) (signal-value btor797))
                            (merge-state (list btor783 btor797)))]
           [btor799 (signal (extract 0 0 (signal-value btor798)) (signal-state btor798))]
           [btor800 (signal (bool->bitvector (bveq (signal-value btor786) (signal-value btor799)))
                            (merge-state (list btor786 btor799)))]
           [btor801 (signal (bvand (signal-value btor796) (signal-value btor800))
                            (merge-state (list btor796 btor800)))]
           [btor802 (if (bitvector->bool (signal-value btor801)) btor786 btor782)]
           [btor803 (bv->signal (zero-extend (signal-value btor48) (bitvector 8)) btor48)]
           [btor804 (signal (bvlshr (signal-value btor783) (signal-value btor803))
                            (merge-state (list btor783 btor803)))]
           [btor805 (signal (extract 0 0 (signal-value btor804)) (signal-state btor804))]
           [btor806 (bv->signal (zero-extend (signal-value btor55) (bitvector 8)) btor55)]
           [btor807 (signal (bvlshr (signal-value btor783) (signal-value btor806))
                            (merge-state (list btor783 btor806)))]
           [btor808 (signal (extract 0 0 (signal-value btor807)) (signal-state btor807))]
           [btor809 (signal (bool->bitvector (bveq (signal-value btor805) (signal-value btor808)))
                            (merge-state (list btor805 btor808)))]
           [btor810 (signal (bvand (signal-value btor54) (signal-value btor809))
                            (merge-state (list btor54 btor809)))]
           [btor811 (bv->signal (zero-extend (signal-value btor62) (bitvector 8)) btor62)]
           [btor812 (signal (bvlshr (signal-value btor783) (signal-value btor811))
                            (merge-state (list btor783 btor811)))]
           [btor813 (signal (extract 0 0 (signal-value btor812)) (signal-state btor812))]
           [btor814 (signal (bool->bitvector (bveq (signal-value btor805) (signal-value btor813)))
                            (merge-state (list btor805 btor813)))]
           [btor815 (signal (bvand (signal-value btor810) (signal-value btor814))
                            (merge-state (list btor810 btor814)))]
           [btor816 (bv->signal (zero-extend (signal-value btor69) (bitvector 8)) btor69)]
           [btor817 (signal (bvlshr (signal-value btor783) (signal-value btor816))
                            (merge-state (list btor783 btor816)))]
           [btor818 (signal (extract 0 0 (signal-value btor817)) (signal-state btor817))]
           [btor819 (signal (bool->bitvector (bveq (signal-value btor805) (signal-value btor818)))
                            (merge-state (list btor805 btor818)))]
           [btor820 (signal (bvand (signal-value btor815) (signal-value btor819))
                            (merge-state (list btor815 btor819)))]
           [btor821 (if (bitvector->bool (signal-value btor820)) btor805 btor802)]
           [btor822 (bv->signal (zero-extend (signal-value btor2) (bitvector 8)) btor2)]
           [btor823 (signal (bvlshr (signal-value btor783) (signal-value btor822))
                            (merge-state (list btor783 btor822)))]
           [btor824 (signal (extract 0 0 (signal-value btor823)) (signal-state btor823))]
           [btor825 (bv->signal (zero-extend (signal-value btor82) (bitvector 8)) btor82)]
           [btor826 (signal (bvlshr (signal-value btor783) (signal-value btor825))
                            (merge-state (list btor783 btor825)))]
           [btor827 (signal (extract 0 0 (signal-value btor826)) (signal-state btor826))]
           [btor828 (signal (bool->bitvector (bveq (signal-value btor824) (signal-value btor827)))
                            (merge-state (list btor824 btor827)))]
           [btor829 (signal (bvand (signal-value btor81) (signal-value btor828))
                            (merge-state (list btor81 btor828)))]
           [btor830 (bv->signal (zero-extend (signal-value btor88) (bitvector 8)) btor88)]
           [btor831 (signal (bvlshr (signal-value btor783) (signal-value btor830))
                            (merge-state (list btor783 btor830)))]
           [btor832 (signal (extract 0 0 (signal-value btor831)) (signal-state btor831))]
           [btor833 (signal (bool->bitvector (bveq (signal-value btor824) (signal-value btor832)))
                            (merge-state (list btor824 btor832)))]
           [btor834 (signal (bvand (signal-value btor829) (signal-value btor833))
                            (merge-state (list btor829 btor833)))]
           [btor835 (bv->signal (zero-extend (signal-value btor94) (bitvector 8)) btor94)]
           [btor836 (signal (bvlshr (signal-value btor783) (signal-value btor835))
                            (merge-state (list btor783 btor835)))]
           [btor837 (signal (extract 0 0 (signal-value btor836)) (signal-state btor836))]
           [btor838 (signal (bool->bitvector (bveq (signal-value btor824) (signal-value btor837)))
                            (merge-state (list btor824 btor837)))]
           [btor839 (signal (bvand (signal-value btor834) (signal-value btor838))
                            (merge-state (list btor834 btor838)))]
           [btor840 (if (bitvector->bool (signal-value btor839)) btor824 btor821)]
           [btor841 (bv->signal (zero-extend (signal-value btor102) (bitvector 8)) btor102)]
           [btor842 (signal (bvlshr (signal-value btor783) (signal-value btor841))
                            (merge-state (list btor783 btor841)))]
           [btor843 (signal (extract 0 0 (signal-value btor842)) (signal-state btor842))]
           [btor844 (bv->signal (zero-extend (signal-value btor111) (bitvector 8)) btor111)]
           [btor845 (signal (bvlshr (signal-value btor783) (signal-value btor844))
                            (merge-state (list btor783 btor844)))]
           [btor846 (signal (extract 0 0 (signal-value btor845)) (signal-state btor845))]
           [btor847 (signal (bool->bitvector (bveq (signal-value btor843) (signal-value btor846)))
                            (merge-state (list btor843 btor846)))]
           [btor848 (signal (bvand (signal-value btor109) (signal-value btor847))
                            (merge-state (list btor109 btor847)))]
           [btor849 (if (bitvector->bool (signal-value btor848)) btor843 btor840)]
           [btor850 (bv->signal (zero-extend (signal-value btor119) (bitvector 8)) btor119)]
           [btor851 (signal (bvlshr (signal-value btor783) (signal-value btor850))
                            (merge-state (list btor783 btor850)))]
           [btor852 (signal (extract 0 0 (signal-value btor851)) (signal-state btor851))]
           [btor853 (bv->signal (zero-extend (signal-value btor128) (bitvector 8)) btor128)]
           [btor854 (signal (bvlshr (signal-value btor783) (signal-value btor853))
                            (merge-state (list btor783 btor853)))]
           [btor855 (signal (extract 0 0 (signal-value btor854)) (signal-state btor854))]
           [btor856 (signal (bool->bitvector (bveq (signal-value btor852) (signal-value btor855)))
                            (merge-state (list btor852 btor855)))]
           [btor857 (signal (bvand (signal-value btor126) (signal-value btor856))
                            (merge-state (list btor126 btor856)))]
           [btor858 (if (bitvector->bool (signal-value btor857)) btor852 btor849)]
           [btor859 (bv->signal (zero-extend (signal-value btor135) (bitvector 8)) btor135)]
           [btor860 (signal (bvlshr (signal-value btor783) (signal-value btor859))
                            (merge-state (list btor783 btor859)))]
           [btor861 (signal (extract 0 0 (signal-value btor860)) (signal-state btor860))]
           [btor862 (bv->signal (zero-extend (signal-value btor144) (bitvector 8)) btor144)]
           [btor863 (signal (bvlshr (signal-value btor783) (signal-value btor862))
                            (merge-state (list btor783 btor862)))]
           [btor864 (signal (extract 0 0 (signal-value btor863)) (signal-state btor863))]
           [btor865 (signal (bool->bitvector (bveq (signal-value btor861) (signal-value btor864)))
                            (merge-state (list btor861 btor864)))]
           [btor866 (signal (bvand (signal-value btor142) (signal-value btor865))
                            (merge-state (list btor142 btor865)))]
           [btor867 (if (bitvector->bool (signal-value btor866)) btor861 btor858)]
           [btor868 (signal (extract 56 56 (signal-value btor9)) (signal-state btor9))]
           [btor869 (signal (apply bvor (bitvector->bits (signal-value btor783)))
                            (signal-state btor783))]
           [btor870 (signal (bvnot (signal-value btor869)) (merge-state (list btor869)))]
           [btor871 (signal (apply bvand (bitvector->bits (signal-value btor783)))
                            (signal-state btor783))]
           [btor872 (signal (bvor (signal-value btor870) (signal-value btor871))
                            (merge-state (list btor870 btor871)))]
           [btor873 (if (bitvector->bool (signal-value btor872)) btor868 btor867)]
           [btor874 (bv->signal (zero-extend (signal-value btor158) (bitvector 8)) btor158)]
           [btor875 (signal (bvlshr (signal-value btor783) (signal-value btor874))
                            (merge-state (list btor783 btor874)))]
           [btor876 (signal (extract 0 0 (signal-value btor875)) (signal-state btor875))]
           [btor877 (if (bitvector->bool (signal-value btor165)) btor876 btor873)]
           [btor878 unnamed-input-878]
           [btor879 (if (bitvector->bool (signal-value btor171)) btor878 btor877)]
           [btor880 unnamed-input-880]
           [btor881 (if (bitvector->bool (signal-value btor180)) btor880 btor879)]
           [btor882 (signal (concat (signal-value btor281) (signal-value btor181))
                            (merge-state (list btor281 btor181)))]
           [btor883 (signal (concat (signal-value btor381) (signal-value btor882))
                            (merge-state (list btor381 btor882)))]
           [btor884 (bitvector 4)]
           [btor885 (signal (concat (signal-value btor481) (signal-value btor883))
                            (merge-state (list btor481 btor883)))]
           [btor886 (bitvector 5)]
           [btor887 (signal (concat (signal-value btor581) (signal-value btor885))
                            (merge-state (list btor581 btor885)))]
           [btor888 (bitvector 6)]
           [btor889 (signal (concat (signal-value btor681) (signal-value btor887))
                            (merge-state (list btor681 btor887)))]
           [btor890 (bitvector 7)]
           [btor891 (signal (concat (signal-value btor781) (signal-value btor889))
                            (merge-state (list btor781 btor889)))]
           [btor892 (signal (concat (signal-value btor881) (signal-value btor891))
                            (merge-state (list btor881 btor891)))]
           [btor893 (signal (concat (signal-value btor7) (signal-value btor15))
                            (merge-state (list btor7 btor15)))]
           [btor894 (bv->signal (zero-extend (signal-value btor893) (bitvector 8)) btor893)]
           [btor895 (signal (bvlshr (signal-value btor892) (signal-value btor894))
                            (merge-state (list btor892 btor894)))]
           [btor896 (signal (extract 0 0 (signal-value btor895)) (signal-state btor895))]
           [btor897 (signal (bool->bitvector (bveq (signal-value btor7) (signal-value btor21)))
                            (merge-state (list btor7 btor21)))]
           [btor898 (signal (bool->bitvector (bveq (signal-value btor7) (signal-value btor23)))
                            (merge-state (list btor7 btor23)))]
           [btor899 (signal (bvor (signal-value btor897) (signal-value btor898))
                            (merge-state (list btor897 btor898)))]
           [btor900 (signal (concat (signal-value btor7) (signal-value btor26))
                            (merge-state (list btor7 btor26)))]
           [btor901 (bv->signal (zero-extend (signal-value btor900) (bitvector 8)) btor900)]
           [btor902 (signal (bvlshr (signal-value btor892) (signal-value btor901))
                            (merge-state (list btor892 btor901)))]
           [btor903 (signal (extract 0 0 (signal-value btor902)) (signal-state btor902))]
           [btor904 (signal (bool->bitvector (bveq (signal-value btor896) (signal-value btor903)))
                            (merge-state (list btor896 btor903)))]
           [btor905 (signal (bvand (signal-value btor899) (signal-value btor904))
                            (merge-state (list btor899 btor904)))]
           [btor906 (signal (concat (signal-value btor7) (signal-value btor33))
                            (merge-state (list btor7 btor33)))]
           [btor907 (bv->signal (zero-extend (signal-value btor906) (bitvector 8)) btor906)]
           [btor908 (signal (bvlshr (signal-value btor892) (signal-value btor907))
                            (merge-state (list btor892 btor907)))]
           [btor909 (signal (extract 0 0 (signal-value btor908)) (signal-state btor908))]
           [btor910 (signal (bool->bitvector (bveq (signal-value btor896) (signal-value btor909)))
                            (merge-state (list btor896 btor909)))]
           [btor911 (signal (bvand (signal-value btor905) (signal-value btor910))
                            (merge-state (list btor905 btor910)))]
           [btor912 (signal (concat (signal-value btor7) (signal-value btor40))
                            (merge-state (list btor7 btor40)))]
           [btor913 (bv->signal (zero-extend (signal-value btor912) (bitvector 8)) btor912)]
           [btor914 (signal (bvlshr (signal-value btor892) (signal-value btor913))
                            (merge-state (list btor892 btor913)))]
           [btor915 (signal (extract 0 0 (signal-value btor914)) (signal-state btor914))]
           [btor916 (signal (bool->bitvector (bveq (signal-value btor896) (signal-value btor915)))
                            (merge-state (list btor896 btor915)))]
           [btor917 (signal (bvand (signal-value btor911) (signal-value btor916))
                            (merge-state (list btor911 btor916)))]
           [btor918 (if (bitvector->bool (signal-value btor917)) btor896 btor10)]
           [btor919 (signal (concat (signal-value btor6) (signal-value btor23))
                            (merge-state (list btor6 btor23)))]
           [btor920 (bv->signal (zero-extend (signal-value btor919) (bitvector 8)) btor919)]
           [btor921 (signal (bvlshr (signal-value btor892) (signal-value btor920))
                            (merge-state (list btor892 btor920)))]
           [btor922 (signal (extract 0 0 (signal-value btor921)) (signal-state btor921))]
           [btor923 (signal (bool->bitvector (bveq (signal-value btor6) (signal-value btor21)))
                            (merge-state (list btor6 btor21)))]
           [btor924 (signal (bool->bitvector (bveq (signal-value btor6) (signal-value btor23)))
                            (merge-state (list btor6 btor23)))]
           [btor925 (signal (bvor (signal-value btor923) (signal-value btor924))
                            (merge-state (list btor923 btor924)))]
           [btor926 (signal (concat (signal-value btor6) (signal-value btor21))
                            (merge-state (list btor6 btor21)))]
           [btor927 (bv->signal (zero-extend (signal-value btor926) (bitvector 8)) btor926)]
           [btor928 (signal (bvlshr (signal-value btor892) (signal-value btor927))
                            (merge-state (list btor892 btor927)))]
           [btor929 (signal (extract 0 0 (signal-value btor928)) (signal-state btor928))]
           [btor930 (signal (bool->bitvector (bveq (signal-value btor922) (signal-value btor929)))
                            (merge-state (list btor922 btor929)))]
           [btor931 (signal (bvand (signal-value btor925) (signal-value btor930))
                            (merge-state (list btor925 btor930)))]
           [btor932 (signal (concat (signal-value btor6) (signal-value btor23))
                            (merge-state (list btor6 btor23)))]
           [btor933 (signal (concat (signal-value btor21) (signal-value btor932))
                            (merge-state (list btor21 btor932)))]
           [btor934 (bv->signal (zero-extend (signal-value btor933) (bitvector 8)) btor933)]
           [btor935 (signal (bvlshr (signal-value btor892) (signal-value btor934))
                            (merge-state (list btor892 btor934)))]
           [btor936 (signal (extract 0 0 (signal-value btor935)) (signal-state btor935))]
           [btor937 (signal (bool->bitvector (bveq (signal-value btor922) (signal-value btor936)))
                            (merge-state (list btor922 btor936)))]
           [btor938 (signal (bvand (signal-value btor931) (signal-value btor937))
                            (merge-state (list btor931 btor937)))]
           [btor939 (signal (concat (signal-value btor6) (signal-value btor21))
                            (merge-state (list btor6 btor21)))]
           [btor940 (signal (concat (signal-value btor21) (signal-value btor939))
                            (merge-state (list btor21 btor939)))]
           [btor941 (bv->signal (zero-extend (signal-value btor940) (bitvector 8)) btor940)]
           [btor942 (signal (bvlshr (signal-value btor892) (signal-value btor941))
                            (merge-state (list btor892 btor941)))]
           [btor943 (signal (extract 0 0 (signal-value btor942)) (signal-state btor942))]
           [btor944 (signal (bool->bitvector (bveq (signal-value btor922) (signal-value btor943)))
                            (merge-state (list btor922 btor943)))]
           [btor945 (signal (bvand (signal-value btor938) (signal-value btor944))
                            (merge-state (list btor938 btor944)))]
           [btor946 (if (bitvector->bool (signal-value btor945)) btor922 btor918)]
           [btor947 (bv->signal (zero-extend (signal-value btor5) (bitvector 8)) btor5)]
           [btor948 (signal (bvlshr (signal-value btor892) (signal-value btor947))
                            (merge-state (list btor892 btor947)))]
           [btor949 (signal (extract 0 0 (signal-value btor948)) (signal-state btor948))]
           [btor950 (signal (bool->bitvector (bveq (signal-value btor5) (signal-value btor21)))
                            (merge-state (list btor5 btor21)))]
           [btor951 (signal (bool->bitvector (bveq (signal-value btor5) (signal-value btor23)))
                            (merge-state (list btor5 btor23)))]
           [btor952 (signal (bvor (signal-value btor950) (signal-value btor951))
                            (merge-state (list btor950 btor951)))]
           [btor953 (signal (concat (signal-value btor21) (signal-value btor5))
                            (merge-state (list btor21 btor5)))]
           [btor954 (bv->signal (zero-extend (signal-value btor953) (bitvector 8)) btor953)]
           [btor955 (signal (bvlshr (signal-value btor892) (signal-value btor954))
                            (merge-state (list btor892 btor954)))]
           [btor956 (signal (extract 0 0 (signal-value btor955)) (signal-state btor955))]
           [btor957 (signal (bool->bitvector (bveq (signal-value btor949) (signal-value btor956)))
                            (merge-state (list btor949 btor956)))]
           [btor958 (signal (bvand (signal-value btor952) (signal-value btor957))
                            (merge-state (list btor952 btor957)))]
           [btor959 (signal (concat (signal-value btor33) (signal-value btor5))
                            (merge-state (list btor33 btor5)))]
           [btor960 (bv->signal (zero-extend (signal-value btor959) (bitvector 8)) btor959)]
           [btor961 (signal (bvlshr (signal-value btor892) (signal-value btor960))
                            (merge-state (list btor892 btor960)))]
           [btor962 (signal (extract 0 0 (signal-value btor961)) (signal-state btor961))]
           [btor963 (signal (bool->bitvector (bveq (signal-value btor949) (signal-value btor962)))
                            (merge-state (list btor949 btor962)))]
           [btor964 (signal (bvand (signal-value btor958) (signal-value btor963))
                            (merge-state (list btor958 btor963)))]
           [btor965 (signal (concat (signal-value btor40) (signal-value btor5))
                            (merge-state (list btor40 btor5)))]
           [btor966 (bv->signal (zero-extend (signal-value btor965) (bitvector 8)) btor965)]
           [btor967 (signal (bvlshr (signal-value btor892) (signal-value btor966))
                            (merge-state (list btor892 btor966)))]
           [btor968 (signal (extract 0 0 (signal-value btor967)) (signal-state btor967))]
           [btor969 (signal (bool->bitvector (bveq (signal-value btor949) (signal-value btor968)))
                            (merge-state (list btor949 btor968)))]
           [btor970 (signal (bvand (signal-value btor964) (signal-value btor969))
                            (merge-state (list btor964 btor969)))]
           [btor971 (if (bitvector->bool (signal-value btor970)) btor949 btor946)]
           [btor972 (signal (concat (signal-value btor6) (signal-value btor23))
                            (merge-state (list btor6 btor23)))]
           [btor973 (signal (concat (signal-value btor7) (signal-value btor972))
                            (merge-state (list btor7 btor972)))]
           [btor974 (bv->signal (zero-extend (signal-value btor973) (bitvector 8)) btor973)]
           [btor975 (signal (bvlshr (signal-value btor892) (signal-value btor974))
                            (merge-state (list btor892 btor974)))]
           [btor976 (signal (extract 0 0 (signal-value btor975)) (signal-state btor975))]
           [btor977 (signal (bvxor (signal-value btor7) (signal-value btor6))
                            (merge-state (list btor7 btor6)))]
           [btor978 (signal (bool->bitvector (bveq (signal-value btor977) (signal-value btor21)))
                            (merge-state (list btor977 btor21)))]
           [btor979 (signal (bool->bitvector (bveq (signal-value btor977) (signal-value btor23)))
                            (merge-state (list btor977 btor23)))]
           [btor980 (signal (bvor (signal-value btor978) (signal-value btor979))
                            (merge-state (list btor978 btor979)))]
           [btor981 (signal (concat (signal-value btor6) (signal-value btor21))
                            (merge-state (list btor6 btor21)))]
           [btor982 (signal (concat (signal-value btor7) (signal-value btor981))
                            (merge-state (list btor7 btor981)))]
           [btor983 (bv->signal (zero-extend (signal-value btor982) (bitvector 8)) btor982)]
           [btor984 (signal (bvlshr (signal-value btor892) (signal-value btor983))
                            (merge-state (list btor892 btor983)))]
           [btor985 (signal (extract 0 0 (signal-value btor984)) (signal-state btor984))]
           [btor986 (signal (bool->bitvector (bveq (signal-value btor976) (signal-value btor985)))
                            (merge-state (list btor976 btor985)))]
           [btor987 (signal (bvand (signal-value btor980) (signal-value btor986))
                            (merge-state (list btor980 btor986)))]
           [btor988 (if (bitvector->bool (signal-value btor987)) btor976 btor971)]
           [btor989 (signal (concat (signal-value btor23) (signal-value btor5))
                            (merge-state (list btor23 btor5)))]
           [btor990 (signal (concat (signal-value btor7) (signal-value btor989))
                            (merge-state (list btor7 btor989)))]
           [btor991 (bv->signal (zero-extend (signal-value btor990) (bitvector 8)) btor990)]
           [btor992 (signal (bvlshr (signal-value btor892) (signal-value btor991))
                            (merge-state (list btor892 btor991)))]
           [btor993 (signal (extract 0 0 (signal-value btor992)) (signal-state btor992))]
           [btor994 (signal (bvxor (signal-value btor7) (signal-value btor5))
                            (merge-state (list btor7 btor5)))]
           [btor995 (signal (bool->bitvector (bveq (signal-value btor994) (signal-value btor21)))
                            (merge-state (list btor994 btor21)))]
           [btor996 (signal (bool->bitvector (bveq (signal-value btor994) (signal-value btor23)))
                            (merge-state (list btor994 btor23)))]
           [btor997 (signal (bvor (signal-value btor995) (signal-value btor996))
                            (merge-state (list btor995 btor996)))]
           [btor998 (signal (concat (signal-value btor21) (signal-value btor5))
                            (merge-state (list btor21 btor5)))]
           [btor999 (signal (concat (signal-value btor7) (signal-value btor998))
                            (merge-state (list btor7 btor998)))]
           [btor1000 (bv->signal (zero-extend (signal-value btor999) (bitvector 8)) btor999)]
           [btor1001 (signal (bvlshr (signal-value btor892) (signal-value btor1000))
                             (merge-state (list btor892 btor1000)))]
           [btor1002 (signal (extract 0 0 (signal-value btor1001)) (signal-state btor1001))]
           [btor1003 (signal (bool->bitvector (bveq (signal-value btor993) (signal-value btor1002)))
                             (merge-state (list btor993 btor1002)))]
           [btor1004 (signal (bvand (signal-value btor997) (signal-value btor1003))
                             (merge-state (list btor997 btor1003)))]
           [btor1005 (if (bitvector->bool (signal-value btor1004)) btor993 btor988)]
           [btor1006 (signal (concat (signal-value btor6) (signal-value btor5))
                             (merge-state (list btor6 btor5)))]
           [btor1007 (bv->signal (zero-extend (signal-value btor1006) (bitvector 8)) btor1006)]
           [btor1008 (signal (bvlshr (signal-value btor892) (signal-value btor1007))
                             (merge-state (list btor892 btor1007)))]
           [btor1009 (signal (extract 0 0 (signal-value btor1008)) (signal-state btor1008))]
           [btor1010 (signal (bvxor (signal-value btor6) (signal-value btor5))
                             (merge-state (list btor6 btor5)))]
           [btor1011 (signal (bool->bitvector (bveq (signal-value btor1010) (signal-value btor21)))
                             (merge-state (list btor1010 btor21)))]
           [btor1012 (signal (bool->bitvector (bveq (signal-value btor1010) (signal-value btor23)))
                             (merge-state (list btor1010 btor23)))]
           [btor1013 (signal (bvor (signal-value btor1011) (signal-value btor1012))
                             (merge-state (list btor1011 btor1012)))]
           [btor1014 (signal (concat (signal-value btor6) (signal-value btor5))
                             (merge-state (list btor6 btor5)))]
           [btor1015 (signal (concat (signal-value btor21) (signal-value btor1014))
                             (merge-state (list btor21 btor1014)))]
           [btor1016 (bv->signal (zero-extend (signal-value btor1015) (bitvector 8)) btor1015)]
           [btor1017 (signal (bvlshr (signal-value btor892) (signal-value btor1016))
                             (merge-state (list btor892 btor1016)))]
           [btor1018 (signal (extract 0 0 (signal-value btor1017)) (signal-state btor1017))]
           [btor1019 (signal (bool->bitvector (bveq (signal-value btor1009) (signal-value btor1018)))
                             (merge-state (list btor1009 btor1018)))]
           [btor1020 (signal (bvand (signal-value btor1013) (signal-value btor1019))
                             (merge-state (list btor1013 btor1019)))]
           [btor1021 (if (bitvector->bool (signal-value btor1020)) btor1009 btor1005)]
           [btor1022 (signal (apply bvor (bitvector->bits (signal-value btor892)))
                             (signal-state btor892))]
           [btor1023 (signal (bvnot (signal-value btor1022)) (merge-state (list btor1022)))]
           [btor1024 (signal (apply bvand (bitvector->bits (signal-value btor892)))
                             (signal-state btor892))]
           [btor1025 (signal (bvor (signal-value btor1023) (signal-value btor1024))
                             (merge-state (list btor1023 btor1024)))]
           [btor1026 (if (bitvector->bool (signal-value btor1025)) btor181 btor1021)]
           [btor1027 (signal (concat (signal-value btor6) (signal-value btor5))
                             (merge-state (list btor6 btor5)))]
           [btor1028 (signal (concat (signal-value btor7) (signal-value btor1027))
                             (merge-state (list btor7 btor1027)))]
           [btor1029 (bv->signal (zero-extend (signal-value btor1028) (bitvector 8)) btor1028)]
           [btor1030 (signal (bvlshr (signal-value btor892) (signal-value btor1029))
                             (merge-state (list btor892 btor1029)))]
           [btor1031 (signal (extract 0 0 (signal-value btor1030)) (signal-state btor1030))]
           [btor1032 (signal (bvxor (signal-value btor977) (signal-value btor5))
                             (merge-state (list btor977 btor5)))]
           [btor1033 (signal (bool->bitvector (bveq (signal-value btor1032) (signal-value btor21)))
                             (merge-state (list btor1032 btor21)))]
           [btor1034 (signal (bool->bitvector (bveq (signal-value btor1032) (signal-value btor23)))
                             (merge-state (list btor1032 btor23)))]
           [btor1035 (signal (bvor (signal-value btor1033) (signal-value btor1034))
                             (merge-state (list btor1033 btor1034)))]
           [btor1036 (if (bitvector->bool (signal-value btor1035)) btor1031 btor1026)]
           [btor1037 (if (bitvector->bool (signal-value btor171)) btor151 btor1036)]
           [btor1038 (signal (concat (signal-value btor3) (signal-value btor2))
                             (merge-state (list btor3 btor2)))]
           [btor1039 (signal (concat (signal-value btor4) (signal-value btor1038))
                             (merge-state (list btor4 btor1038)))]
           [btor1040 (signal (concat (signal-value btor5) (signal-value btor1039))
                             (merge-state (list btor5 btor1039)))]
           [btor1041 (signal (concat (signal-value btor6) (signal-value btor1040))
                             (merge-state (list btor6 btor1040)))]
           [btor1042 (signal (concat (signal-value btor7) (signal-value btor1041))
                             (merge-state (list btor7 btor1041)))]
           [btor1043 (bv->signal (zero-extend (signal-value btor1042) (bitvector 64)) btor1042)]
           [btor1044 (signal (bvlshr (signal-value btor9) (signal-value btor1043))
                             (merge-state (list btor9 btor1043)))]
           [btor1045 (signal (extract 0 0 (signal-value btor1044)) (signal-state btor1044))]
           [btor1046 (if (bitvector->bool (signal-value btor180)) btor1045 btor1037)]
           [btor1048 (bv->signal (zero-extend (signal-value btor9) (bitvector 64)) btor9)]
           [btor1049 (bv->signal (zero-extend (signal-value btor1046) (bitvector 1)) btor1046)]
           [btor1050 unnamed-input-1050]
           [btor1051 (bv->signal (zero-extend (signal-value btor1050) (bitvector 8)) btor1050)]
           [btor1052 unnamed-input-1052]
           [btor1053 (bv->signal (zero-extend (signal-value btor1052) (bitvector 3)) btor1052)]
           [btor1054 unnamed-input-1054]
           [btor1055 (bv->signal (zero-extend (signal-value btor1054) (bitvector 8)) btor1054)]
           [btor1056 unnamed-input-1056]
           [btor1057 (bv->signal (zero-extend (signal-value btor1056) (bitvector 3)) btor1056)]
           [btor1058 unnamed-input-1058]
           [btor1059 (bv->signal (zero-extend (signal-value btor1058) (bitvector 8)) btor1058)]
           [btor1060 unnamed-input-1060]
           [btor1061 (bv->signal (zero-extend (signal-value btor1060) (bitvector 3)) btor1060)]
           [btor1062 unnamed-input-1062]
           [btor1063 (bv->signal (zero-extend (signal-value btor1062) (bitvector 8)) btor1062)]
           [btor1064 unnamed-input-1064]
           [btor1065 (bv->signal (zero-extend (signal-value btor1064) (bitvector 3)) btor1064)]
           [btor1066 unnamed-input-1066]
           [btor1067 (bv->signal (zero-extend (signal-value btor1066) (bitvector 8)) btor1066)]
           [btor1068 unnamed-input-1068]
           [btor1069 (bv->signal (zero-extend (signal-value btor1068) (bitvector 3)) btor1068)]
           [btor1070 unnamed-input-1070]
           [btor1071 (bv->signal (zero-extend (signal-value btor1070) (bitvector 8)) btor1070)]
           [btor1072 unnamed-input-1072]
           [btor1073 (bv->signal (zero-extend (signal-value btor1072) (bitvector 3)) btor1072)]
           [btor1074 unnamed-input-1074]
           [btor1075 (bv->signal (zero-extend (signal-value btor1074) (bitvector 8)) btor1074)]
           [btor1076 unnamed-input-1076]
           [btor1077 (bv->signal (zero-extend (signal-value btor1076) (bitvector 3)) btor1076)]
           [btor1078 unnamed-input-1078]
           [btor1079 (bv->signal (zero-extend (signal-value btor1078) (bitvector 8)) btor1078)]
           [btor1080 unnamed-input-1080]
           [btor1081 (bv->signal (zero-extend (signal-value btor1080) (bitvector 3)) btor1080)]
           [btor1082 unnamed-input-1082]
           [btor1083 (bv->signal (zero-extend (signal-value btor1082) (bitvector 8)) btor1082)]
           [btor1084 unnamed-input-1084]
           [btor1085 (bv->signal (zero-extend (signal-value btor1084) (bitvector 3)) btor1084)]
           [btor1086 (bv->signal (zero-extend (signal-value btor23) (bitvector 1)) btor23)])
      (make-immutable-hash (list (cons 'O (signal (signal-value btor1046) (hash))))))))
