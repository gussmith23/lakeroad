;;; Generated with:
;;; $LAKEROAD_DIR/bin/verilog_to_racket.py \
;;;   --infile $LAKEROAD_DIR/modules_for_importing/xilinx_ultrascale_plus/LUT6_2.v \
;;;   --top LUT6_2 \
;;;   --function-name xilinx-ultrascale-plus-lut6-2

#lang racket/base
(provide xilinx-ultrascale-plus-lut6-2)
(require "../signal.rkt")
(require rosette)
(require racket/hash)
(define xilinx-ultrascale-plus-lut6-2
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
      #:unnamed-input-168
      (unnamed-input-168
       (bv->signal (constant (list 'unnamed-input-168 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-176
      (unnamed-input-176
       (bv->signal (constant (list 'unnamed-input-176 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-184
      (unnamed-input-184
       (bv->signal (constant (list 'unnamed-input-184 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-280
      (unnamed-input-280
       (bv->signal (constant (list 'unnamed-input-280 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-282
      (unnamed-input-282
       (bv->signal (constant (list 'unnamed-input-282 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-284
      (unnamed-input-284
       (bv->signal (constant (list 'unnamed-input-284 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-380
      (unnamed-input-380
       (bv->signal (constant (list 'unnamed-input-380 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-382
      (unnamed-input-382
       (bv->signal (constant (list 'unnamed-input-382 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-384
      (unnamed-input-384
       (bv->signal (constant (list 'unnamed-input-384 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-480
      (unnamed-input-480
       (bv->signal (constant (list 'unnamed-input-480 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-482
      (unnamed-input-482
       (bv->signal (constant (list 'unnamed-input-482 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-539
      (unnamed-input-539
       (bv->signal (constant (list 'unnamed-input-539 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-540
      (unnamed-input-540
       (bv->signal (constant (list 'unnamed-input-540 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-546
      (unnamed-input-546
       (bv->signal (constant (list 'unnamed-input-546 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-552
      (unnamed-input-552
       (bv->signal (constant (list 'unnamed-input-552 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-554
      (unnamed-input-554
       (bv->signal (constant (list 'unnamed-input-554 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-556
      (unnamed-input-556
       (bv->signal (constant (list 'unnamed-input-556 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-558
      (unnamed-input-558
       (bv->signal (constant (list 'unnamed-input-558 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-560
      (unnamed-input-560
       (bv->signal (constant (list 'unnamed-input-560 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-562
      (unnamed-input-562
       (bv->signal (constant (list 'unnamed-input-562 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-564
      (unnamed-input-564
       (bv->signal (constant (list 'unnamed-input-564 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-660
      (unnamed-input-660
       (bv->signal (constant (list 'unnamed-input-660 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-662
      (unnamed-input-662
       (bv->signal (constant (list 'unnamed-input-662 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-664
      (unnamed-input-664
       (bv->signal (constant (list 'unnamed-input-664 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-760
      (unnamed-input-760
       (bv->signal (constant (list 'unnamed-input-760 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-762
      (unnamed-input-762
       (bv->signal (constant (list 'unnamed-input-762 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-764
      (unnamed-input-764
       (bv->signal (constant (list 'unnamed-input-764 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-860
      (unnamed-input-860
       (bv->signal (constant (list 'unnamed-input-860 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-862
      (unnamed-input-862
       (bv->signal (constant (list 'unnamed-input-862 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-864
      (unnamed-input-864
       (bv->signal (constant (list 'unnamed-input-864 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-960
      (unnamed-input-960
       (bv->signal (constant (list 'unnamed-input-960 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-962
      (unnamed-input-962
       (bv->signal (constant (list 'unnamed-input-962 'symbolic-constant) (bitvector 1))))
      #:unnamed-input-1117
      (unnamed-input-1117
       (bv->signal (constant (list 'unnamed-input-1117 'symbolic-constant) (bitvector 4))))
      #:unnamed-input-1119
      (unnamed-input-1119
       (bv->signal (constant (list 'unnamed-input-1119 'symbolic-constant) (bitvector 2))))
      #:unnamed-input-1121
      (unnamed-input-1121
       (bv->signal (constant (list 'unnamed-input-1121 'symbolic-constant) (bitvector 8))))
      #:unnamed-input-1123
      (unnamed-input-1123
       (bv->signal (constant (list 'unnamed-input-1123 'symbolic-constant) (bitvector 3))))
      #:unnamed-input-1125
      (unnamed-input-1125
       (bv->signal (constant (list 'unnamed-input-1125 'symbolic-constant) (bitvector 8))))
      #:unnamed-input-1127
      (unnamed-input-1127
       (bv->signal (constant (list 'unnamed-input-1127 'symbolic-constant) (bitvector 3))))
      #:unnamed-input-1129
      (unnamed-input-1129
       (bv->signal (constant (list 'unnamed-input-1129 'symbolic-constant) (bitvector 8))))
      #:unnamed-input-1131
      (unnamed-input-1131
       (bv->signal (constant (list 'unnamed-input-1131 'symbolic-constant) (bitvector 3))))
      #:unnamed-input-1133
      (unnamed-input-1133
       (bv->signal (constant (list 'unnamed-input-1133 'symbolic-constant) (bitvector 8))))
      #:unnamed-input-1135
      (unnamed-input-1135
       (bv->signal (constant (list 'unnamed-input-1135 'symbolic-constant) (bitvector 3))))
      #:unnamed-input-1137
      (unnamed-input-1137
       (bv->signal (constant (list 'unnamed-input-1137 'symbolic-constant) (bitvector 8))))
      #:unnamed-input-1139
      (unnamed-input-1139
       (bv->signal (constant (list 'unnamed-input-1139 'symbolic-constant) (bitvector 3))))
      #:unnamed-input-1141
      (unnamed-input-1141
       (bv->signal (constant (list 'unnamed-input-1141 'symbolic-constant) (bitvector 8))))
      #:unnamed-input-1143
      (unnamed-input-1143
       (bv->signal (constant (list 'unnamed-input-1143 'symbolic-constant) (bitvector 3))))
      #:unnamed-input-1145
      (unnamed-input-1145
       (bv->signal (constant (list 'unnamed-input-1145 'symbolic-constant) (bitvector 8))))
      #:unnamed-input-1147
      (unnamed-input-1147
       (bv->signal (constant (list 'unnamed-input-1147 'symbolic-constant) (bitvector 3))))
      #:unnamed-input-1149
      (unnamed-input-1149
       (bv->signal (constant (list 'unnamed-input-1149 'symbolic-constant) (bitvector 8))))
      #:unnamed-input-1151
      (unnamed-input-1151
       (bv->signal (constant (list 'unnamed-input-1151 'symbolic-constant) (bitvector 3))))
      #:unnamed-input-1153
      (unnamed-input-1153
       (bv->signal (constant (list 'unnamed-input-1153 'symbolic-constant) (bitvector 8))))
      #:unnamed-input-1155
      (unnamed-input-1155
       (bv->signal (constant (list 'unnamed-input-1155 'symbolic-constant) (bitvector 3))))
      #:unnamed-input-1157
      (unnamed-input-1157
       (bv->signal (constant (list 'unnamed-input-1157 'symbolic-constant) (bitvector 8))))
      #:unnamed-input-1159
      (unnamed-input-1159
       (bv->signal (constant (list 'unnamed-input-1159 'symbolic-constant) (bitvector 3))))
      #:unnamed-input-1161
      (unnamed-input-1161
       (bv->signal (constant (list 'unnamed-input-1161 'symbolic-constant) (bitvector 8))))
      #:unnamed-input-1163
      (unnamed-input-1163
       (bv->signal (constant (list 'unnamed-input-1163 'symbolic-constant) (bitvector 3))))
      #:unnamed-input-1165
      (unnamed-input-1165
       (bv->signal (constant (list 'unnamed-input-1165 'symbolic-constant) (bitvector 8))))
      #:unnamed-input-1167
      (unnamed-input-1167
       (bv->signal (constant (list 'unnamed-input-1167 'symbolic-constant) (bitvector 3))))
      #:unnamed-input-1169
      (unnamed-input-1169
       (bv->signal (constant (list 'unnamed-input-1169 'symbolic-constant) (bitvector 8))))
      #:unnamed-input-1171
      (unnamed-input-1171
       (bv->signal (constant (list 'unnamed-input-1171 'symbolic-constant) (bitvector 3)))))
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
           [btor11 (bitvector 4)]
           [btor12 unnamed-input-12]
           [btor13 (bitvector 8)]
           [btor14 (signal (extract 7 0 (signal-value btor9)) (signal-state btor9))]
           [btor15 (bitvector 2)]
           [btor16 (bv->signal (bv 0 (bitvector 2)))]
           [btor17 (bitvector 3)]
           [btor18 (signal (concat (signal-value btor4) (signal-value btor16))
                           (merge-state (list btor4 btor16)))]
           [btor19 (bv->signal (zero-extend (signal-value btor18) (bitvector 8)) btor18)]
           [btor20 (signal (bvlshr (signal-value btor14) (signal-value btor19))
                           (merge-state (list btor14 btor19)))]
           [btor21 (signal (extract 0 0 (signal-value btor20)) (signal-state btor20))]
           [btor22 (bv->signal (bv 1 (bitvector 1)))]
           [btor23 (signal (bool->bitvector (bveq (signal-value btor4) (signal-value btor22)))
                           (merge-state (list btor4 btor22)))]
           [btor24 (bv->signal (bv 0 (bitvector 1)))]
           [btor25 (signal (bool->bitvector (bveq (signal-value btor4) (signal-value btor24)))
                           (merge-state (list btor4 btor24)))]
           [btor26 (signal (bvor (signal-value btor23) (signal-value btor25))
                           (merge-state (list btor23 btor25)))]
           [btor27 (bv->signal (bv 1 (bitvector 2)))]
           [btor28 (signal (concat (signal-value btor4) (signal-value btor27))
                           (merge-state (list btor4 btor27)))]
           [btor29 (bv->signal (zero-extend (signal-value btor28) (bitvector 8)) btor28)]
           [btor30 (signal (bvlshr (signal-value btor14) (signal-value btor29))
                           (merge-state (list btor14 btor29)))]
           [btor31 (signal (extract 0 0 (signal-value btor30)) (signal-state btor30))]
           [btor32 (signal (bool->bitvector (bveq (signal-value btor21) (signal-value btor31)))
                           (merge-state (list btor21 btor31)))]
           [btor33 (signal (bvand (signal-value btor26) (signal-value btor32))
                           (merge-state (list btor26 btor32)))]
           [btor34 (bv->signal (bv 2 (bitvector 2)))]
           [btor35 (signal (concat (signal-value btor4) (signal-value btor34))
                           (merge-state (list btor4 btor34)))]
           [btor36 (bv->signal (zero-extend (signal-value btor35) (bitvector 8)) btor35)]
           [btor37 (signal (bvlshr (signal-value btor14) (signal-value btor36))
                           (merge-state (list btor14 btor36)))]
           [btor38 (signal (extract 0 0 (signal-value btor37)) (signal-state btor37))]
           [btor39 (signal (bool->bitvector (bveq (signal-value btor21) (signal-value btor38)))
                           (merge-state (list btor21 btor38)))]
           [btor40 (signal (bvand (signal-value btor33) (signal-value btor39))
                           (merge-state (list btor33 btor39)))]
           [btor41 (bv->signal (bv 3 (bitvector 2)))]
           [btor42 (signal (concat (signal-value btor4) (signal-value btor41))
                           (merge-state (list btor4 btor41)))]
           [btor43 (bv->signal (zero-extend (signal-value btor42) (bitvector 8)) btor42)]
           [btor44 (signal (bvlshr (signal-value btor14) (signal-value btor43))
                           (merge-state (list btor14 btor43)))]
           [btor45 (signal (extract 0 0 (signal-value btor44)) (signal-state btor44))]
           [btor46 (signal (bool->bitvector (bveq (signal-value btor21) (signal-value btor45)))
                           (merge-state (list btor21 btor45)))]
           [btor47 (signal (bvand (signal-value btor40) (signal-value btor46))
                           (merge-state (list btor40 btor46)))]
           [btor48 (if (bitvector->bool (signal-value btor47)) btor21 btor12)]
           [btor49 (signal (concat (signal-value btor3) (signal-value btor24))
                           (merge-state (list btor3 btor24)))]
           [btor50 (bv->signal (zero-extend (signal-value btor49) (bitvector 8)) btor49)]
           [btor51 (signal (bvlshr (signal-value btor14) (signal-value btor50))
                           (merge-state (list btor14 btor50)))]
           [btor52 (signal (extract 0 0 (signal-value btor51)) (signal-state btor51))]
           [btor53 (signal (bool->bitvector (bveq (signal-value btor3) (signal-value btor22)))
                           (merge-state (list btor3 btor22)))]
           [btor54 (signal (bool->bitvector (bveq (signal-value btor3) (signal-value btor24)))
                           (merge-state (list btor3 btor24)))]
           [btor55 (signal (bvor (signal-value btor53) (signal-value btor54))
                           (merge-state (list btor53 btor54)))]
           [btor56 (signal (concat (signal-value btor3) (signal-value btor22))
                           (merge-state (list btor3 btor22)))]
           [btor57 (bv->signal (zero-extend (signal-value btor56) (bitvector 8)) btor56)]
           [btor58 (signal (bvlshr (signal-value btor14) (signal-value btor57))
                           (merge-state (list btor14 btor57)))]
           [btor59 (signal (extract 0 0 (signal-value btor58)) (signal-state btor58))]
           [btor60 (signal (bool->bitvector (bveq (signal-value btor52) (signal-value btor59)))
                           (merge-state (list btor52 btor59)))]
           [btor61 (signal (bvand (signal-value btor55) (signal-value btor60))
                           (merge-state (list btor55 btor60)))]
           [btor62 (signal (concat (signal-value btor3) (signal-value btor24))
                           (merge-state (list btor3 btor24)))]
           [btor63 (signal (concat (signal-value btor22) (signal-value btor62))
                           (merge-state (list btor22 btor62)))]
           [btor64 (bv->signal (zero-extend (signal-value btor63) (bitvector 8)) btor63)]
           [btor65 (signal (bvlshr (signal-value btor14) (signal-value btor64))
                           (merge-state (list btor14 btor64)))]
           [btor66 (signal (extract 0 0 (signal-value btor65)) (signal-state btor65))]
           [btor67 (signal (bool->bitvector (bveq (signal-value btor52) (signal-value btor66)))
                           (merge-state (list btor52 btor66)))]
           [btor68 (signal (bvand (signal-value btor61) (signal-value btor67))
                           (merge-state (list btor61 btor67)))]
           [btor69 (signal (concat (signal-value btor3) (signal-value btor22))
                           (merge-state (list btor3 btor22)))]
           [btor70 (signal (concat (signal-value btor22) (signal-value btor69))
                           (merge-state (list btor22 btor69)))]
           [btor71 (bv->signal (zero-extend (signal-value btor70) (bitvector 8)) btor70)]
           [btor72 (signal (bvlshr (signal-value btor14) (signal-value btor71))
                           (merge-state (list btor14 btor71)))]
           [btor73 (signal (extract 0 0 (signal-value btor72)) (signal-state btor72))]
           [btor74 (signal (bool->bitvector (bveq (signal-value btor52) (signal-value btor73)))
                           (merge-state (list btor52 btor73)))]
           [btor75 (signal (bvand (signal-value btor68) (signal-value btor74))
                           (merge-state (list btor68 btor74)))]
           [btor76 (if (bitvector->bool (signal-value btor75)) btor52 btor48)]
           [btor77 (bv->signal (zero-extend (signal-value btor2) (bitvector 8)) btor2)]
           [btor78 (signal (bvlshr (signal-value btor14) (signal-value btor77))
                           (merge-state (list btor14 btor77)))]
           [btor79 (signal (extract 0 0 (signal-value btor78)) (signal-state btor78))]
           [btor80 (signal (bool->bitvector (bveq (signal-value btor2) (signal-value btor22)))
                           (merge-state (list btor2 btor22)))]
           [btor81 (signal (bool->bitvector (bveq (signal-value btor2) (signal-value btor24)))
                           (merge-state (list btor2 btor24)))]
           [btor82 (signal (bvor (signal-value btor80) (signal-value btor81))
                           (merge-state (list btor80 btor81)))]
           [btor83 (signal (concat (signal-value btor22) (signal-value btor2))
                           (merge-state (list btor22 btor2)))]
           [btor84 (bv->signal (zero-extend (signal-value btor83) (bitvector 8)) btor83)]
           [btor85 (signal (bvlshr (signal-value btor14) (signal-value btor84))
                           (merge-state (list btor14 btor84)))]
           [btor86 (signal (extract 0 0 (signal-value btor85)) (signal-state btor85))]
           [btor87 (signal (bool->bitvector (bveq (signal-value btor79) (signal-value btor86)))
                           (merge-state (list btor79 btor86)))]
           [btor88 (signal (bvand (signal-value btor82) (signal-value btor87))
                           (merge-state (list btor82 btor87)))]
           [btor89 (signal (concat (signal-value btor34) (signal-value btor2))
                           (merge-state (list btor34 btor2)))]
           [btor90 (bv->signal (zero-extend (signal-value btor89) (bitvector 8)) btor89)]
           [btor91 (signal (bvlshr (signal-value btor14) (signal-value btor90))
                           (merge-state (list btor14 btor90)))]
           [btor92 (signal (extract 0 0 (signal-value btor91)) (signal-state btor91))]
           [btor93 (signal (bool->bitvector (bveq (signal-value btor79) (signal-value btor92)))
                           (merge-state (list btor79 btor92)))]
           [btor94 (signal (bvand (signal-value btor88) (signal-value btor93))
                           (merge-state (list btor88 btor93)))]
           [btor95 (signal (concat (signal-value btor41) (signal-value btor2))
                           (merge-state (list btor41 btor2)))]
           [btor96 (bv->signal (zero-extend (signal-value btor95) (bitvector 8)) btor95)]
           [btor97 (signal (bvlshr (signal-value btor14) (signal-value btor96))
                           (merge-state (list btor14 btor96)))]
           [btor98 (signal (extract 0 0 (signal-value btor97)) (signal-state btor97))]
           [btor99 (signal (bool->bitvector (bveq (signal-value btor79) (signal-value btor98)))
                           (merge-state (list btor79 btor98)))]
           [btor100 (signal (bvand (signal-value btor94) (signal-value btor99))
                            (merge-state (list btor94 btor99)))]
           [btor101 (if (bitvector->bool (signal-value btor100)) btor79 btor76)]
           [btor102 (signal (concat (signal-value btor3) (signal-value btor24))
                            (merge-state (list btor3 btor24)))]
           [btor103 (signal (concat (signal-value btor4) (signal-value btor102))
                            (merge-state (list btor4 btor102)))]
           [btor104 (bv->signal (zero-extend (signal-value btor103) (bitvector 8)) btor103)]
           [btor105 (signal (bvlshr (signal-value btor14) (signal-value btor104))
                            (merge-state (list btor14 btor104)))]
           [btor106 (signal (extract 0 0 (signal-value btor105)) (signal-state btor105))]
           [btor107 (signal (bvxor (signal-value btor4) (signal-value btor3))
                            (merge-state (list btor4 btor3)))]
           [btor108 (signal (bool->bitvector (bveq (signal-value btor107) (signal-value btor22)))
                            (merge-state (list btor107 btor22)))]
           [btor109 (signal (bool->bitvector (bveq (signal-value btor107) (signal-value btor24)))
                            (merge-state (list btor107 btor24)))]
           [btor110 (signal (bvor (signal-value btor108) (signal-value btor109))
                            (merge-state (list btor108 btor109)))]
           [btor111 (signal (concat (signal-value btor3) (signal-value btor22))
                            (merge-state (list btor3 btor22)))]
           [btor112 (signal (concat (signal-value btor4) (signal-value btor111))
                            (merge-state (list btor4 btor111)))]
           [btor113 (bv->signal (zero-extend (signal-value btor112) (bitvector 8)) btor112)]
           [btor114 (signal (bvlshr (signal-value btor14) (signal-value btor113))
                            (merge-state (list btor14 btor113)))]
           [btor115 (signal (extract 0 0 (signal-value btor114)) (signal-state btor114))]
           [btor116 (signal (bool->bitvector (bveq (signal-value btor106) (signal-value btor115)))
                            (merge-state (list btor106 btor115)))]
           [btor117 (signal (bvand (signal-value btor110) (signal-value btor116))
                            (merge-state (list btor110 btor116)))]
           [btor118 (if (bitvector->bool (signal-value btor117)) btor106 btor101)]
           [btor119 (signal (concat (signal-value btor24) (signal-value btor2))
                            (merge-state (list btor24 btor2)))]
           [btor120 (signal (concat (signal-value btor4) (signal-value btor119))
                            (merge-state (list btor4 btor119)))]
           [btor121 (bv->signal (zero-extend (signal-value btor120) (bitvector 8)) btor120)]
           [btor122 (signal (bvlshr (signal-value btor14) (signal-value btor121))
                            (merge-state (list btor14 btor121)))]
           [btor123 (signal (extract 0 0 (signal-value btor122)) (signal-state btor122))]
           [btor124 (signal (bvxor (signal-value btor4) (signal-value btor2))
                            (merge-state (list btor4 btor2)))]
           [btor125 (signal (bool->bitvector (bveq (signal-value btor124) (signal-value btor22)))
                            (merge-state (list btor124 btor22)))]
           [btor126 (signal (bool->bitvector (bveq (signal-value btor124) (signal-value btor24)))
                            (merge-state (list btor124 btor24)))]
           [btor127 (signal (bvor (signal-value btor125) (signal-value btor126))
                            (merge-state (list btor125 btor126)))]
           [btor128 (signal (concat (signal-value btor22) (signal-value btor2))
                            (merge-state (list btor22 btor2)))]
           [btor129 (signal (concat (signal-value btor4) (signal-value btor128))
                            (merge-state (list btor4 btor128)))]
           [btor130 (bv->signal (zero-extend (signal-value btor129) (bitvector 8)) btor129)]
           [btor131 (signal (bvlshr (signal-value btor14) (signal-value btor130))
                            (merge-state (list btor14 btor130)))]
           [btor132 (signal (extract 0 0 (signal-value btor131)) (signal-state btor131))]
           [btor133 (signal (bool->bitvector (bveq (signal-value btor123) (signal-value btor132)))
                            (merge-state (list btor123 btor132)))]
           [btor134 (signal (bvand (signal-value btor127) (signal-value btor133))
                            (merge-state (list btor127 btor133)))]
           [btor135 (if (bitvector->bool (signal-value btor134)) btor123 btor118)]
           [btor136 (signal (concat (signal-value btor3) (signal-value btor2))
                            (merge-state (list btor3 btor2)))]
           [btor137 (bv->signal (zero-extend (signal-value btor136) (bitvector 8)) btor136)]
           [btor138 (signal (bvlshr (signal-value btor14) (signal-value btor137))
                            (merge-state (list btor14 btor137)))]
           [btor139 (signal (extract 0 0 (signal-value btor138)) (signal-state btor138))]
           [btor140 (signal (bvxor (signal-value btor3) (signal-value btor2))
                            (merge-state (list btor3 btor2)))]
           [btor141 (signal (bool->bitvector (bveq (signal-value btor140) (signal-value btor22)))
                            (merge-state (list btor140 btor22)))]
           [btor142 (signal (bool->bitvector (bveq (signal-value btor140) (signal-value btor24)))
                            (merge-state (list btor140 btor24)))]
           [btor143 (signal (bvor (signal-value btor141) (signal-value btor142))
                            (merge-state (list btor141 btor142)))]
           [btor144 (signal (concat (signal-value btor3) (signal-value btor2))
                            (merge-state (list btor3 btor2)))]
           [btor145 (signal (concat (signal-value btor22) (signal-value btor144))
                            (merge-state (list btor22 btor144)))]
           [btor146 (bv->signal (zero-extend (signal-value btor145) (bitvector 8)) btor145)]
           [btor147 (signal (bvlshr (signal-value btor14) (signal-value btor146))
                            (merge-state (list btor14 btor146)))]
           [btor148 (signal (extract 0 0 (signal-value btor147)) (signal-state btor147))]
           [btor149 (signal (bool->bitvector (bveq (signal-value btor139) (signal-value btor148)))
                            (merge-state (list btor139 btor148)))]
           [btor150 (signal (bvand (signal-value btor143) (signal-value btor149))
                            (merge-state (list btor143 btor149)))]
           [btor151 (if (bitvector->bool (signal-value btor150)) btor139 btor135)]
           [btor152 (signal (extract 0 0 (signal-value btor9)) (signal-state btor9))]
           [btor153 (signal (apply bvor (bitvector->bits (signal-value btor14)))
                            (signal-state btor14))]
           [btor154 (signal (bvnot (signal-value btor153)) (merge-state (list btor153)))]
           [btor155 (signal (apply bvand (bitvector->bits (signal-value btor14)))
                            (signal-state btor14))]
           [btor156 (signal (bvor (signal-value btor154) (signal-value btor155))
                            (merge-state (list btor154 btor155)))]
           [btor157 (if (bitvector->bool (signal-value btor156)) btor152 btor151)]
           [btor158 (signal (concat (signal-value btor3) (signal-value btor2))
                            (merge-state (list btor3 btor2)))]
           [btor159 (signal (concat (signal-value btor4) (signal-value btor158))
                            (merge-state (list btor4 btor158)))]
           [btor160 (bv->signal (zero-extend (signal-value btor159) (bitvector 8)) btor159)]
           [btor161 (signal (bvlshr (signal-value btor14) (signal-value btor160))
                            (merge-state (list btor14 btor160)))]
           [btor162 (signal (extract 0 0 (signal-value btor161)) (signal-state btor161))]
           [btor163 (signal (bvxor (signal-value btor107) (signal-value btor2))
                            (merge-state (list btor107 btor2)))]
           [btor164 (signal (bool->bitvector (bveq (signal-value btor163) (signal-value btor22)))
                            (merge-state (list btor163 btor22)))]
           [btor165 (signal (bool->bitvector (bveq (signal-value btor163) (signal-value btor24)))
                            (merge-state (list btor163 btor24)))]
           [btor166 (signal (bvor (signal-value btor164) (signal-value btor165))
                            (merge-state (list btor164 btor165)))]
           [btor167 (if (bitvector->bool (signal-value btor166)) btor162 btor157)]
           [btor168 unnamed-input-168]
           [btor169 (bitvector 32)]
           [btor170 (signal (extract 31 0 (signal-value btor9)) (signal-state btor9))]
           [btor171 (signal (apply bvor (bitvector->bits (signal-value btor170)))
                            (signal-state btor170))]
           [btor172 (signal (bvnot (signal-value btor171)) (merge-state (list btor171)))]
           [btor173 (signal (apply bvand (bitvector->bits (signal-value btor170)))
                            (signal-state btor170))]
           [btor174 (signal (bvor (signal-value btor172) (signal-value btor173))
                            (merge-state (list btor172 btor173)))]
           [btor175 (if (bitvector->bool (signal-value btor174)) btor168 btor167)]
           [btor176 unnamed-input-176]
           [btor177 (signal (bvxor (signal-value btor140) (signal-value btor4))
                            (merge-state (list btor140 btor4)))]
           [btor178 (signal (bvxor (signal-value btor177) (signal-value btor5))
                            (merge-state (list btor177 btor5)))]
           [btor179 (signal (bvxor (signal-value btor178) (signal-value btor6))
                            (merge-state (list btor178 btor6)))]
           [btor180 (signal (bool->bitvector (bveq (signal-value btor179) (signal-value btor24)))
                            (merge-state (list btor179 btor24)))]
           [btor181 (signal (bool->bitvector (bveq (signal-value btor179) (signal-value btor22)))
                            (merge-state (list btor179 btor22)))]
           [btor182 (signal (bvor (signal-value btor180) (signal-value btor181))
                            (merge-state (list btor180 btor181)))]
           [btor183 (if (bitvector->bool (signal-value btor182)) btor176 btor175)]
           [btor184 unnamed-input-184]
           [btor185 (signal (extract 15 8 (signal-value btor9)) (signal-state btor9))]
           [btor186 (bv->signal (zero-extend (signal-value btor18) (bitvector 8)) btor18)]
           [btor187 (signal (bvlshr (signal-value btor185) (signal-value btor186))
                            (merge-state (list btor185 btor186)))]
           [btor188 (signal (extract 0 0 (signal-value btor187)) (signal-state btor187))]
           [btor189 (bv->signal (zero-extend (signal-value btor28) (bitvector 8)) btor28)]
           [btor190 (signal (bvlshr (signal-value btor185) (signal-value btor189))
                            (merge-state (list btor185 btor189)))]
           [btor191 (signal (extract 0 0 (signal-value btor190)) (signal-state btor190))]
           [btor192 (signal (bool->bitvector (bveq (signal-value btor188) (signal-value btor191)))
                            (merge-state (list btor188 btor191)))]
           [btor193 (signal (bvand (signal-value btor26) (signal-value btor192))
                            (merge-state (list btor26 btor192)))]
           [btor194 (bv->signal (zero-extend (signal-value btor35) (bitvector 8)) btor35)]
           [btor195 (signal (bvlshr (signal-value btor185) (signal-value btor194))
                            (merge-state (list btor185 btor194)))]
           [btor196 (signal (extract 0 0 (signal-value btor195)) (signal-state btor195))]
           [btor197 (signal (bool->bitvector (bveq (signal-value btor188) (signal-value btor196)))
                            (merge-state (list btor188 btor196)))]
           [btor198 (signal (bvand (signal-value btor193) (signal-value btor197))
                            (merge-state (list btor193 btor197)))]
           [btor199 (bv->signal (zero-extend (signal-value btor42) (bitvector 8)) btor42)]
           [btor200 (signal (bvlshr (signal-value btor185) (signal-value btor199))
                            (merge-state (list btor185 btor199)))]
           [btor201 (signal (extract 0 0 (signal-value btor200)) (signal-state btor200))]
           [btor202 (signal (bool->bitvector (bveq (signal-value btor188) (signal-value btor201)))
                            (merge-state (list btor188 btor201)))]
           [btor203 (signal (bvand (signal-value btor198) (signal-value btor202))
                            (merge-state (list btor198 btor202)))]
           [btor204 (if (bitvector->bool (signal-value btor203)) btor188 btor184)]
           [btor205 (bv->signal (zero-extend (signal-value btor49) (bitvector 8)) btor49)]
           [btor206 (signal (bvlshr (signal-value btor185) (signal-value btor205))
                            (merge-state (list btor185 btor205)))]
           [btor207 (signal (extract 0 0 (signal-value btor206)) (signal-state btor206))]
           [btor208 (bv->signal (zero-extend (signal-value btor56) (bitvector 8)) btor56)]
           [btor209 (signal (bvlshr (signal-value btor185) (signal-value btor208))
                            (merge-state (list btor185 btor208)))]
           [btor210 (signal (extract 0 0 (signal-value btor209)) (signal-state btor209))]
           [btor211 (signal (bool->bitvector (bveq (signal-value btor207) (signal-value btor210)))
                            (merge-state (list btor207 btor210)))]
           [btor212 (signal (bvand (signal-value btor55) (signal-value btor211))
                            (merge-state (list btor55 btor211)))]
           [btor213 (bv->signal (zero-extend (signal-value btor63) (bitvector 8)) btor63)]
           [btor214 (signal (bvlshr (signal-value btor185) (signal-value btor213))
                            (merge-state (list btor185 btor213)))]
           [btor215 (signal (extract 0 0 (signal-value btor214)) (signal-state btor214))]
           [btor216 (signal (bool->bitvector (bveq (signal-value btor207) (signal-value btor215)))
                            (merge-state (list btor207 btor215)))]
           [btor217 (signal (bvand (signal-value btor212) (signal-value btor216))
                            (merge-state (list btor212 btor216)))]
           [btor218 (bv->signal (zero-extend (signal-value btor70) (bitvector 8)) btor70)]
           [btor219 (signal (bvlshr (signal-value btor185) (signal-value btor218))
                            (merge-state (list btor185 btor218)))]
           [btor220 (signal (extract 0 0 (signal-value btor219)) (signal-state btor219))]
           [btor221 (signal (bool->bitvector (bveq (signal-value btor207) (signal-value btor220)))
                            (merge-state (list btor207 btor220)))]
           [btor222 (signal (bvand (signal-value btor217) (signal-value btor221))
                            (merge-state (list btor217 btor221)))]
           [btor223 (if (bitvector->bool (signal-value btor222)) btor207 btor204)]
           [btor224 (bv->signal (zero-extend (signal-value btor2) (bitvector 8)) btor2)]
           [btor225 (signal (bvlshr (signal-value btor185) (signal-value btor224))
                            (merge-state (list btor185 btor224)))]
           [btor226 (signal (extract 0 0 (signal-value btor225)) (signal-state btor225))]
           [btor227 (bv->signal (zero-extend (signal-value btor83) (bitvector 8)) btor83)]
           [btor228 (signal (bvlshr (signal-value btor185) (signal-value btor227))
                            (merge-state (list btor185 btor227)))]
           [btor229 (signal (extract 0 0 (signal-value btor228)) (signal-state btor228))]
           [btor230 (signal (bool->bitvector (bveq (signal-value btor226) (signal-value btor229)))
                            (merge-state (list btor226 btor229)))]
           [btor231 (signal (bvand (signal-value btor82) (signal-value btor230))
                            (merge-state (list btor82 btor230)))]
           [btor232 (bv->signal (zero-extend (signal-value btor89) (bitvector 8)) btor89)]
           [btor233 (signal (bvlshr (signal-value btor185) (signal-value btor232))
                            (merge-state (list btor185 btor232)))]
           [btor234 (signal (extract 0 0 (signal-value btor233)) (signal-state btor233))]
           [btor235 (signal (bool->bitvector (bveq (signal-value btor226) (signal-value btor234)))
                            (merge-state (list btor226 btor234)))]
           [btor236 (signal (bvand (signal-value btor231) (signal-value btor235))
                            (merge-state (list btor231 btor235)))]
           [btor237 (bv->signal (zero-extend (signal-value btor95) (bitvector 8)) btor95)]
           [btor238 (signal (bvlshr (signal-value btor185) (signal-value btor237))
                            (merge-state (list btor185 btor237)))]
           [btor239 (signal (extract 0 0 (signal-value btor238)) (signal-state btor238))]
           [btor240 (signal (bool->bitvector (bveq (signal-value btor226) (signal-value btor239)))
                            (merge-state (list btor226 btor239)))]
           [btor241 (signal (bvand (signal-value btor236) (signal-value btor240))
                            (merge-state (list btor236 btor240)))]
           [btor242 (if (bitvector->bool (signal-value btor241)) btor226 btor223)]
           [btor243 (bv->signal (zero-extend (signal-value btor103) (bitvector 8)) btor103)]
           [btor244 (signal (bvlshr (signal-value btor185) (signal-value btor243))
                            (merge-state (list btor185 btor243)))]
           [btor245 (signal (extract 0 0 (signal-value btor244)) (signal-state btor244))]
           [btor246 (bv->signal (zero-extend (signal-value btor112) (bitvector 8)) btor112)]
           [btor247 (signal (bvlshr (signal-value btor185) (signal-value btor246))
                            (merge-state (list btor185 btor246)))]
           [btor248 (signal (extract 0 0 (signal-value btor247)) (signal-state btor247))]
           [btor249 (signal (bool->bitvector (bveq (signal-value btor245) (signal-value btor248)))
                            (merge-state (list btor245 btor248)))]
           [btor250 (signal (bvand (signal-value btor110) (signal-value btor249))
                            (merge-state (list btor110 btor249)))]
           [btor251 (if (bitvector->bool (signal-value btor250)) btor245 btor242)]
           [btor252 (bv->signal (zero-extend (signal-value btor120) (bitvector 8)) btor120)]
           [btor253 (signal (bvlshr (signal-value btor185) (signal-value btor252))
                            (merge-state (list btor185 btor252)))]
           [btor254 (signal (extract 0 0 (signal-value btor253)) (signal-state btor253))]
           [btor255 (bv->signal (zero-extend (signal-value btor129) (bitvector 8)) btor129)]
           [btor256 (signal (bvlshr (signal-value btor185) (signal-value btor255))
                            (merge-state (list btor185 btor255)))]
           [btor257 (signal (extract 0 0 (signal-value btor256)) (signal-state btor256))]
           [btor258 (signal (bool->bitvector (bveq (signal-value btor254) (signal-value btor257)))
                            (merge-state (list btor254 btor257)))]
           [btor259 (signal (bvand (signal-value btor127) (signal-value btor258))
                            (merge-state (list btor127 btor258)))]
           [btor260 (if (bitvector->bool (signal-value btor259)) btor254 btor251)]
           [btor261 (bv->signal (zero-extend (signal-value btor136) (bitvector 8)) btor136)]
           [btor262 (signal (bvlshr (signal-value btor185) (signal-value btor261))
                            (merge-state (list btor185 btor261)))]
           [btor263 (signal (extract 0 0 (signal-value btor262)) (signal-state btor262))]
           [btor264 (bv->signal (zero-extend (signal-value btor145) (bitvector 8)) btor145)]
           [btor265 (signal (bvlshr (signal-value btor185) (signal-value btor264))
                            (merge-state (list btor185 btor264)))]
           [btor266 (signal (extract 0 0 (signal-value btor265)) (signal-state btor265))]
           [btor267 (signal (bool->bitvector (bveq (signal-value btor263) (signal-value btor266)))
                            (merge-state (list btor263 btor266)))]
           [btor268 (signal (bvand (signal-value btor143) (signal-value btor267))
                            (merge-state (list btor143 btor267)))]
           [btor269 (if (bitvector->bool (signal-value btor268)) btor263 btor260)]
           [btor270 (signal (extract 8 8 (signal-value btor9)) (signal-state btor9))]
           [btor271 (signal (apply bvor (bitvector->bits (signal-value btor185)))
                            (signal-state btor185))]
           [btor272 (signal (bvnot (signal-value btor271)) (merge-state (list btor271)))]
           [btor273 (signal (apply bvand (bitvector->bits (signal-value btor185)))
                            (signal-state btor185))]
           [btor274 (signal (bvor (signal-value btor272) (signal-value btor273))
                            (merge-state (list btor272 btor273)))]
           [btor275 (if (bitvector->bool (signal-value btor274)) btor270 btor269)]
           [btor276 (bv->signal (zero-extend (signal-value btor159) (bitvector 8)) btor159)]
           [btor277 (signal (bvlshr (signal-value btor185) (signal-value btor276))
                            (merge-state (list btor185 btor276)))]
           [btor278 (signal (extract 0 0 (signal-value btor277)) (signal-state btor277))]
           [btor279 (if (bitvector->bool (signal-value btor166)) btor278 btor275)]
           [btor280 unnamed-input-280]
           [btor281 (if (bitvector->bool (signal-value btor174)) btor280 btor279)]
           [btor282 unnamed-input-282]
           [btor283 (if (bitvector->bool (signal-value btor182)) btor282 btor281)]
           [btor284 unnamed-input-284]
           [btor285 (signal (extract 23 16 (signal-value btor9)) (signal-state btor9))]
           [btor286 (bv->signal (zero-extend (signal-value btor18) (bitvector 8)) btor18)]
           [btor287 (signal (bvlshr (signal-value btor285) (signal-value btor286))
                            (merge-state (list btor285 btor286)))]
           [btor288 (signal (extract 0 0 (signal-value btor287)) (signal-state btor287))]
           [btor289 (bv->signal (zero-extend (signal-value btor28) (bitvector 8)) btor28)]
           [btor290 (signal (bvlshr (signal-value btor285) (signal-value btor289))
                            (merge-state (list btor285 btor289)))]
           [btor291 (signal (extract 0 0 (signal-value btor290)) (signal-state btor290))]
           [btor292 (signal (bool->bitvector (bveq (signal-value btor288) (signal-value btor291)))
                            (merge-state (list btor288 btor291)))]
           [btor293 (signal (bvand (signal-value btor26) (signal-value btor292))
                            (merge-state (list btor26 btor292)))]
           [btor294 (bv->signal (zero-extend (signal-value btor35) (bitvector 8)) btor35)]
           [btor295 (signal (bvlshr (signal-value btor285) (signal-value btor294))
                            (merge-state (list btor285 btor294)))]
           [btor296 (signal (extract 0 0 (signal-value btor295)) (signal-state btor295))]
           [btor297 (signal (bool->bitvector (bveq (signal-value btor288) (signal-value btor296)))
                            (merge-state (list btor288 btor296)))]
           [btor298 (signal (bvand (signal-value btor293) (signal-value btor297))
                            (merge-state (list btor293 btor297)))]
           [btor299 (bv->signal (zero-extend (signal-value btor42) (bitvector 8)) btor42)]
           [btor300 (signal (bvlshr (signal-value btor285) (signal-value btor299))
                            (merge-state (list btor285 btor299)))]
           [btor301 (signal (extract 0 0 (signal-value btor300)) (signal-state btor300))]
           [btor302 (signal (bool->bitvector (bveq (signal-value btor288) (signal-value btor301)))
                            (merge-state (list btor288 btor301)))]
           [btor303 (signal (bvand (signal-value btor298) (signal-value btor302))
                            (merge-state (list btor298 btor302)))]
           [btor304 (if (bitvector->bool (signal-value btor303)) btor288 btor284)]
           [btor305 (bv->signal (zero-extend (signal-value btor49) (bitvector 8)) btor49)]
           [btor306 (signal (bvlshr (signal-value btor285) (signal-value btor305))
                            (merge-state (list btor285 btor305)))]
           [btor307 (signal (extract 0 0 (signal-value btor306)) (signal-state btor306))]
           [btor308 (bv->signal (zero-extend (signal-value btor56) (bitvector 8)) btor56)]
           [btor309 (signal (bvlshr (signal-value btor285) (signal-value btor308))
                            (merge-state (list btor285 btor308)))]
           [btor310 (signal (extract 0 0 (signal-value btor309)) (signal-state btor309))]
           [btor311 (signal (bool->bitvector (bveq (signal-value btor307) (signal-value btor310)))
                            (merge-state (list btor307 btor310)))]
           [btor312 (signal (bvand (signal-value btor55) (signal-value btor311))
                            (merge-state (list btor55 btor311)))]
           [btor313 (bv->signal (zero-extend (signal-value btor63) (bitvector 8)) btor63)]
           [btor314 (signal (bvlshr (signal-value btor285) (signal-value btor313))
                            (merge-state (list btor285 btor313)))]
           [btor315 (signal (extract 0 0 (signal-value btor314)) (signal-state btor314))]
           [btor316 (signal (bool->bitvector (bveq (signal-value btor307) (signal-value btor315)))
                            (merge-state (list btor307 btor315)))]
           [btor317 (signal (bvand (signal-value btor312) (signal-value btor316))
                            (merge-state (list btor312 btor316)))]
           [btor318 (bv->signal (zero-extend (signal-value btor70) (bitvector 8)) btor70)]
           [btor319 (signal (bvlshr (signal-value btor285) (signal-value btor318))
                            (merge-state (list btor285 btor318)))]
           [btor320 (signal (extract 0 0 (signal-value btor319)) (signal-state btor319))]
           [btor321 (signal (bool->bitvector (bveq (signal-value btor307) (signal-value btor320)))
                            (merge-state (list btor307 btor320)))]
           [btor322 (signal (bvand (signal-value btor317) (signal-value btor321))
                            (merge-state (list btor317 btor321)))]
           [btor323 (if (bitvector->bool (signal-value btor322)) btor307 btor304)]
           [btor324 (bv->signal (zero-extend (signal-value btor2) (bitvector 8)) btor2)]
           [btor325 (signal (bvlshr (signal-value btor285) (signal-value btor324))
                            (merge-state (list btor285 btor324)))]
           [btor326 (signal (extract 0 0 (signal-value btor325)) (signal-state btor325))]
           [btor327 (bv->signal (zero-extend (signal-value btor83) (bitvector 8)) btor83)]
           [btor328 (signal (bvlshr (signal-value btor285) (signal-value btor327))
                            (merge-state (list btor285 btor327)))]
           [btor329 (signal (extract 0 0 (signal-value btor328)) (signal-state btor328))]
           [btor330 (signal (bool->bitvector (bveq (signal-value btor326) (signal-value btor329)))
                            (merge-state (list btor326 btor329)))]
           [btor331 (signal (bvand (signal-value btor82) (signal-value btor330))
                            (merge-state (list btor82 btor330)))]
           [btor332 (bv->signal (zero-extend (signal-value btor89) (bitvector 8)) btor89)]
           [btor333 (signal (bvlshr (signal-value btor285) (signal-value btor332))
                            (merge-state (list btor285 btor332)))]
           [btor334 (signal (extract 0 0 (signal-value btor333)) (signal-state btor333))]
           [btor335 (signal (bool->bitvector (bveq (signal-value btor326) (signal-value btor334)))
                            (merge-state (list btor326 btor334)))]
           [btor336 (signal (bvand (signal-value btor331) (signal-value btor335))
                            (merge-state (list btor331 btor335)))]
           [btor337 (bv->signal (zero-extend (signal-value btor95) (bitvector 8)) btor95)]
           [btor338 (signal (bvlshr (signal-value btor285) (signal-value btor337))
                            (merge-state (list btor285 btor337)))]
           [btor339 (signal (extract 0 0 (signal-value btor338)) (signal-state btor338))]
           [btor340 (signal (bool->bitvector (bveq (signal-value btor326) (signal-value btor339)))
                            (merge-state (list btor326 btor339)))]
           [btor341 (signal (bvand (signal-value btor336) (signal-value btor340))
                            (merge-state (list btor336 btor340)))]
           [btor342 (if (bitvector->bool (signal-value btor341)) btor326 btor323)]
           [btor343 (bv->signal (zero-extend (signal-value btor103) (bitvector 8)) btor103)]
           [btor344 (signal (bvlshr (signal-value btor285) (signal-value btor343))
                            (merge-state (list btor285 btor343)))]
           [btor345 (signal (extract 0 0 (signal-value btor344)) (signal-state btor344))]
           [btor346 (bv->signal (zero-extend (signal-value btor112) (bitvector 8)) btor112)]
           [btor347 (signal (bvlshr (signal-value btor285) (signal-value btor346))
                            (merge-state (list btor285 btor346)))]
           [btor348 (signal (extract 0 0 (signal-value btor347)) (signal-state btor347))]
           [btor349 (signal (bool->bitvector (bveq (signal-value btor345) (signal-value btor348)))
                            (merge-state (list btor345 btor348)))]
           [btor350 (signal (bvand (signal-value btor110) (signal-value btor349))
                            (merge-state (list btor110 btor349)))]
           [btor351 (if (bitvector->bool (signal-value btor350)) btor345 btor342)]
           [btor352 (bv->signal (zero-extend (signal-value btor120) (bitvector 8)) btor120)]
           [btor353 (signal (bvlshr (signal-value btor285) (signal-value btor352))
                            (merge-state (list btor285 btor352)))]
           [btor354 (signal (extract 0 0 (signal-value btor353)) (signal-state btor353))]
           [btor355 (bv->signal (zero-extend (signal-value btor129) (bitvector 8)) btor129)]
           [btor356 (signal (bvlshr (signal-value btor285) (signal-value btor355))
                            (merge-state (list btor285 btor355)))]
           [btor357 (signal (extract 0 0 (signal-value btor356)) (signal-state btor356))]
           [btor358 (signal (bool->bitvector (bveq (signal-value btor354) (signal-value btor357)))
                            (merge-state (list btor354 btor357)))]
           [btor359 (signal (bvand (signal-value btor127) (signal-value btor358))
                            (merge-state (list btor127 btor358)))]
           [btor360 (if (bitvector->bool (signal-value btor359)) btor354 btor351)]
           [btor361 (bv->signal (zero-extend (signal-value btor136) (bitvector 8)) btor136)]
           [btor362 (signal (bvlshr (signal-value btor285) (signal-value btor361))
                            (merge-state (list btor285 btor361)))]
           [btor363 (signal (extract 0 0 (signal-value btor362)) (signal-state btor362))]
           [btor364 (bv->signal (zero-extend (signal-value btor145) (bitvector 8)) btor145)]
           [btor365 (signal (bvlshr (signal-value btor285) (signal-value btor364))
                            (merge-state (list btor285 btor364)))]
           [btor366 (signal (extract 0 0 (signal-value btor365)) (signal-state btor365))]
           [btor367 (signal (bool->bitvector (bveq (signal-value btor363) (signal-value btor366)))
                            (merge-state (list btor363 btor366)))]
           [btor368 (signal (bvand (signal-value btor143) (signal-value btor367))
                            (merge-state (list btor143 btor367)))]
           [btor369 (if (bitvector->bool (signal-value btor368)) btor363 btor360)]
           [btor370 (signal (extract 16 16 (signal-value btor9)) (signal-state btor9))]
           [btor371 (signal (apply bvor (bitvector->bits (signal-value btor285)))
                            (signal-state btor285))]
           [btor372 (signal (bvnot (signal-value btor371)) (merge-state (list btor371)))]
           [btor373 (signal (apply bvand (bitvector->bits (signal-value btor285)))
                            (signal-state btor285))]
           [btor374 (signal (bvor (signal-value btor372) (signal-value btor373))
                            (merge-state (list btor372 btor373)))]
           [btor375 (if (bitvector->bool (signal-value btor374)) btor370 btor369)]
           [btor376 (bv->signal (zero-extend (signal-value btor159) (bitvector 8)) btor159)]
           [btor377 (signal (bvlshr (signal-value btor285) (signal-value btor376))
                            (merge-state (list btor285 btor376)))]
           [btor378 (signal (extract 0 0 (signal-value btor377)) (signal-state btor377))]
           [btor379 (if (bitvector->bool (signal-value btor166)) btor378 btor375)]
           [btor380 unnamed-input-380]
           [btor381 (if (bitvector->bool (signal-value btor174)) btor380 btor379)]
           [btor382 unnamed-input-382]
           [btor383 (if (bitvector->bool (signal-value btor182)) btor382 btor381)]
           [btor384 unnamed-input-384]
           [btor385 (signal (extract 31 24 (signal-value btor9)) (signal-state btor9))]
           [btor386 (bv->signal (zero-extend (signal-value btor18) (bitvector 8)) btor18)]
           [btor387 (signal (bvlshr (signal-value btor385) (signal-value btor386))
                            (merge-state (list btor385 btor386)))]
           [btor388 (signal (extract 0 0 (signal-value btor387)) (signal-state btor387))]
           [btor389 (bv->signal (zero-extend (signal-value btor28) (bitvector 8)) btor28)]
           [btor390 (signal (bvlshr (signal-value btor385) (signal-value btor389))
                            (merge-state (list btor385 btor389)))]
           [btor391 (signal (extract 0 0 (signal-value btor390)) (signal-state btor390))]
           [btor392 (signal (bool->bitvector (bveq (signal-value btor388) (signal-value btor391)))
                            (merge-state (list btor388 btor391)))]
           [btor393 (signal (bvand (signal-value btor26) (signal-value btor392))
                            (merge-state (list btor26 btor392)))]
           [btor394 (bv->signal (zero-extend (signal-value btor35) (bitvector 8)) btor35)]
           [btor395 (signal (bvlshr (signal-value btor385) (signal-value btor394))
                            (merge-state (list btor385 btor394)))]
           [btor396 (signal (extract 0 0 (signal-value btor395)) (signal-state btor395))]
           [btor397 (signal (bool->bitvector (bveq (signal-value btor388) (signal-value btor396)))
                            (merge-state (list btor388 btor396)))]
           [btor398 (signal (bvand (signal-value btor393) (signal-value btor397))
                            (merge-state (list btor393 btor397)))]
           [btor399 (bv->signal (zero-extend (signal-value btor42) (bitvector 8)) btor42)]
           [btor400 (signal (bvlshr (signal-value btor385) (signal-value btor399))
                            (merge-state (list btor385 btor399)))]
           [btor401 (signal (extract 0 0 (signal-value btor400)) (signal-state btor400))]
           [btor402 (signal (bool->bitvector (bveq (signal-value btor388) (signal-value btor401)))
                            (merge-state (list btor388 btor401)))]
           [btor403 (signal (bvand (signal-value btor398) (signal-value btor402))
                            (merge-state (list btor398 btor402)))]
           [btor404 (if (bitvector->bool (signal-value btor403)) btor388 btor384)]
           [btor405 (bv->signal (zero-extend (signal-value btor49) (bitvector 8)) btor49)]
           [btor406 (signal (bvlshr (signal-value btor385) (signal-value btor405))
                            (merge-state (list btor385 btor405)))]
           [btor407 (signal (extract 0 0 (signal-value btor406)) (signal-state btor406))]
           [btor408 (bv->signal (zero-extend (signal-value btor56) (bitvector 8)) btor56)]
           [btor409 (signal (bvlshr (signal-value btor385) (signal-value btor408))
                            (merge-state (list btor385 btor408)))]
           [btor410 (signal (extract 0 0 (signal-value btor409)) (signal-state btor409))]
           [btor411 (signal (bool->bitvector (bveq (signal-value btor407) (signal-value btor410)))
                            (merge-state (list btor407 btor410)))]
           [btor412 (signal (bvand (signal-value btor55) (signal-value btor411))
                            (merge-state (list btor55 btor411)))]
           [btor413 (bv->signal (zero-extend (signal-value btor63) (bitvector 8)) btor63)]
           [btor414 (signal (bvlshr (signal-value btor385) (signal-value btor413))
                            (merge-state (list btor385 btor413)))]
           [btor415 (signal (extract 0 0 (signal-value btor414)) (signal-state btor414))]
           [btor416 (signal (bool->bitvector (bveq (signal-value btor407) (signal-value btor415)))
                            (merge-state (list btor407 btor415)))]
           [btor417 (signal (bvand (signal-value btor412) (signal-value btor416))
                            (merge-state (list btor412 btor416)))]
           [btor418 (bv->signal (zero-extend (signal-value btor70) (bitvector 8)) btor70)]
           [btor419 (signal (bvlshr (signal-value btor385) (signal-value btor418))
                            (merge-state (list btor385 btor418)))]
           [btor420 (signal (extract 0 0 (signal-value btor419)) (signal-state btor419))]
           [btor421 (signal (bool->bitvector (bveq (signal-value btor407) (signal-value btor420)))
                            (merge-state (list btor407 btor420)))]
           [btor422 (signal (bvand (signal-value btor417) (signal-value btor421))
                            (merge-state (list btor417 btor421)))]
           [btor423 (if (bitvector->bool (signal-value btor422)) btor407 btor404)]
           [btor424 (bv->signal (zero-extend (signal-value btor2) (bitvector 8)) btor2)]
           [btor425 (signal (bvlshr (signal-value btor385) (signal-value btor424))
                            (merge-state (list btor385 btor424)))]
           [btor426 (signal (extract 0 0 (signal-value btor425)) (signal-state btor425))]
           [btor427 (bv->signal (zero-extend (signal-value btor83) (bitvector 8)) btor83)]
           [btor428 (signal (bvlshr (signal-value btor385) (signal-value btor427))
                            (merge-state (list btor385 btor427)))]
           [btor429 (signal (extract 0 0 (signal-value btor428)) (signal-state btor428))]
           [btor430 (signal (bool->bitvector (bveq (signal-value btor426) (signal-value btor429)))
                            (merge-state (list btor426 btor429)))]
           [btor431 (signal (bvand (signal-value btor82) (signal-value btor430))
                            (merge-state (list btor82 btor430)))]
           [btor432 (bv->signal (zero-extend (signal-value btor89) (bitvector 8)) btor89)]
           [btor433 (signal (bvlshr (signal-value btor385) (signal-value btor432))
                            (merge-state (list btor385 btor432)))]
           [btor434 (signal (extract 0 0 (signal-value btor433)) (signal-state btor433))]
           [btor435 (signal (bool->bitvector (bveq (signal-value btor426) (signal-value btor434)))
                            (merge-state (list btor426 btor434)))]
           [btor436 (signal (bvand (signal-value btor431) (signal-value btor435))
                            (merge-state (list btor431 btor435)))]
           [btor437 (bv->signal (zero-extend (signal-value btor95) (bitvector 8)) btor95)]
           [btor438 (signal (bvlshr (signal-value btor385) (signal-value btor437))
                            (merge-state (list btor385 btor437)))]
           [btor439 (signal (extract 0 0 (signal-value btor438)) (signal-state btor438))]
           [btor440 (signal (bool->bitvector (bveq (signal-value btor426) (signal-value btor439)))
                            (merge-state (list btor426 btor439)))]
           [btor441 (signal (bvand (signal-value btor436) (signal-value btor440))
                            (merge-state (list btor436 btor440)))]
           [btor442 (if (bitvector->bool (signal-value btor441)) btor426 btor423)]
           [btor443 (bv->signal (zero-extend (signal-value btor103) (bitvector 8)) btor103)]
           [btor444 (signal (bvlshr (signal-value btor385) (signal-value btor443))
                            (merge-state (list btor385 btor443)))]
           [btor445 (signal (extract 0 0 (signal-value btor444)) (signal-state btor444))]
           [btor446 (bv->signal (zero-extend (signal-value btor112) (bitvector 8)) btor112)]
           [btor447 (signal (bvlshr (signal-value btor385) (signal-value btor446))
                            (merge-state (list btor385 btor446)))]
           [btor448 (signal (extract 0 0 (signal-value btor447)) (signal-state btor447))]
           [btor449 (signal (bool->bitvector (bveq (signal-value btor445) (signal-value btor448)))
                            (merge-state (list btor445 btor448)))]
           [btor450 (signal (bvand (signal-value btor110) (signal-value btor449))
                            (merge-state (list btor110 btor449)))]
           [btor451 (if (bitvector->bool (signal-value btor450)) btor445 btor442)]
           [btor452 (bv->signal (zero-extend (signal-value btor120) (bitvector 8)) btor120)]
           [btor453 (signal (bvlshr (signal-value btor385) (signal-value btor452))
                            (merge-state (list btor385 btor452)))]
           [btor454 (signal (extract 0 0 (signal-value btor453)) (signal-state btor453))]
           [btor455 (bv->signal (zero-extend (signal-value btor129) (bitvector 8)) btor129)]
           [btor456 (signal (bvlshr (signal-value btor385) (signal-value btor455))
                            (merge-state (list btor385 btor455)))]
           [btor457 (signal (extract 0 0 (signal-value btor456)) (signal-state btor456))]
           [btor458 (signal (bool->bitvector (bveq (signal-value btor454) (signal-value btor457)))
                            (merge-state (list btor454 btor457)))]
           [btor459 (signal (bvand (signal-value btor127) (signal-value btor458))
                            (merge-state (list btor127 btor458)))]
           [btor460 (if (bitvector->bool (signal-value btor459)) btor454 btor451)]
           [btor461 (bv->signal (zero-extend (signal-value btor136) (bitvector 8)) btor136)]
           [btor462 (signal (bvlshr (signal-value btor385) (signal-value btor461))
                            (merge-state (list btor385 btor461)))]
           [btor463 (signal (extract 0 0 (signal-value btor462)) (signal-state btor462))]
           [btor464 (bv->signal (zero-extend (signal-value btor145) (bitvector 8)) btor145)]
           [btor465 (signal (bvlshr (signal-value btor385) (signal-value btor464))
                            (merge-state (list btor385 btor464)))]
           [btor466 (signal (extract 0 0 (signal-value btor465)) (signal-state btor465))]
           [btor467 (signal (bool->bitvector (bveq (signal-value btor463) (signal-value btor466)))
                            (merge-state (list btor463 btor466)))]
           [btor468 (signal (bvand (signal-value btor143) (signal-value btor467))
                            (merge-state (list btor143 btor467)))]
           [btor469 (if (bitvector->bool (signal-value btor468)) btor463 btor460)]
           [btor470 (signal (extract 24 24 (signal-value btor9)) (signal-state btor9))]
           [btor471 (signal (apply bvor (bitvector->bits (signal-value btor385)))
                            (signal-state btor385))]
           [btor472 (signal (bvnot (signal-value btor471)) (merge-state (list btor471)))]
           [btor473 (signal (apply bvand (bitvector->bits (signal-value btor385)))
                            (signal-state btor385))]
           [btor474 (signal (bvor (signal-value btor472) (signal-value btor473))
                            (merge-state (list btor472 btor473)))]
           [btor475 (if (bitvector->bool (signal-value btor474)) btor470 btor469)]
           [btor476 (bv->signal (zero-extend (signal-value btor159) (bitvector 8)) btor159)]
           [btor477 (signal (bvlshr (signal-value btor385) (signal-value btor476))
                            (merge-state (list btor385 btor476)))]
           [btor478 (signal (extract 0 0 (signal-value btor477)) (signal-state btor477))]
           [btor479 (if (bitvector->bool (signal-value btor166)) btor478 btor475)]
           [btor480 unnamed-input-480]
           [btor481 (if (bitvector->bool (signal-value btor174)) btor480 btor479)]
           [btor482 unnamed-input-482]
           [btor483 (if (bitvector->bool (signal-value btor182)) btor482 btor481)]
           [btor484 (signal (concat (signal-value btor283) (signal-value btor183))
                            (merge-state (list btor283 btor183)))]
           [btor485 (signal (concat (signal-value btor383) (signal-value btor484))
                            (merge-state (list btor383 btor484)))]
           [btor486 (signal (concat (signal-value btor483) (signal-value btor485))
                            (merge-state (list btor483 btor485)))]
           [btor487 (signal (concat (signal-value btor6) (signal-value btor24))
                            (merge-state (list btor6 btor24)))]
           [btor488 (bv->signal (zero-extend (signal-value btor487) (bitvector 4)) btor487)]
           [btor489 (signal (bvlshr (signal-value btor486) (signal-value btor488))
                            (merge-state (list btor486 btor488)))]
           [btor490 (signal (extract 0 0 (signal-value btor489)) (signal-state btor489))]
           [btor491 (signal (bool->bitvector (bveq (signal-value btor6) (signal-value btor22)))
                            (merge-state (list btor6 btor22)))]
           [btor492 (signal (bool->bitvector (bveq (signal-value btor6) (signal-value btor24)))
                            (merge-state (list btor6 btor24)))]
           [btor493 (signal (bvor (signal-value btor491) (signal-value btor492))
                            (merge-state (list btor491 btor492)))]
           [btor494 (signal (concat (signal-value btor6) (signal-value btor22))
                            (merge-state (list btor6 btor22)))]
           [btor495 (bv->signal (zero-extend (signal-value btor494) (bitvector 4)) btor494)]
           [btor496 (signal (bvlshr (signal-value btor486) (signal-value btor495))
                            (merge-state (list btor486 btor495)))]
           [btor497 (signal (extract 0 0 (signal-value btor496)) (signal-state btor496))]
           [btor498 (signal (bool->bitvector (bveq (signal-value btor490) (signal-value btor497)))
                            (merge-state (list btor490 btor497)))]
           [btor499 (signal (bvand (signal-value btor493) (signal-value btor498))
                            (merge-state (list btor493 btor498)))]
           [btor500 (if (bitvector->bool (signal-value btor499)) btor490 btor10)]
           [btor501 (bv->signal (zero-extend (signal-value btor5) (bitvector 4)) btor5)]
           [btor502 (signal (bvlshr (signal-value btor486) (signal-value btor501))
                            (merge-state (list btor486 btor501)))]
           [btor503 (signal (extract 0 0 (signal-value btor502)) (signal-state btor502))]
           [btor504 (signal (bool->bitvector (bveq (signal-value btor5) (signal-value btor22)))
                            (merge-state (list btor5 btor22)))]
           [btor505 (signal (bool->bitvector (bveq (signal-value btor5) (signal-value btor24)))
                            (merge-state (list btor5 btor24)))]
           [btor506 (signal (bvor (signal-value btor504) (signal-value btor505))
                            (merge-state (list btor504 btor505)))]
           [btor507 (signal (concat (signal-value btor22) (signal-value btor5))
                            (merge-state (list btor22 btor5)))]
           [btor508 (bv->signal (zero-extend (signal-value btor507) (bitvector 4)) btor507)]
           [btor509 (signal (bvlshr (signal-value btor486) (signal-value btor508))
                            (merge-state (list btor486 btor508)))]
           [btor510 (signal (extract 0 0 (signal-value btor509)) (signal-state btor509))]
           [btor511 (signal (bool->bitvector (bveq (signal-value btor503) (signal-value btor510)))
                            (merge-state (list btor503 btor510)))]
           [btor512 (signal (bvand (signal-value btor506) (signal-value btor511))
                            (merge-state (list btor506 btor511)))]
           [btor513 (if (bitvector->bool (signal-value btor512)) btor503 btor500)]
           [btor514 (signal (apply bvor (bitvector->bits (signal-value btor486)))
                            (signal-state btor486))]
           [btor515 (signal (bvnot (signal-value btor514)) (merge-state (list btor514)))]
           [btor516 (signal (apply bvand (bitvector->bits (signal-value btor486)))
                            (signal-state btor486))]
           [btor517 (signal (bvor (signal-value btor515) (signal-value btor516))
                            (merge-state (list btor515 btor516)))]
           [btor518 (if (bitvector->bool (signal-value btor517)) btor183 btor513)]
           [btor519 (signal (concat (signal-value btor6) (signal-value btor5))
                            (merge-state (list btor6 btor5)))]
           [btor520 (bv->signal (zero-extend (signal-value btor519) (bitvector 4)) btor519)]
           [btor521 (signal (bvlshr (signal-value btor486) (signal-value btor520))
                            (merge-state (list btor486 btor520)))]
           [btor522 (signal (extract 0 0 (signal-value btor521)) (signal-state btor521))]
           [btor523 (signal (bvxor (signal-value btor6) (signal-value btor5))
                            (merge-state (list btor6 btor5)))]
           [btor524 (signal (bool->bitvector (bveq (signal-value btor523) (signal-value btor22)))
                            (merge-state (list btor523 btor22)))]
           [btor525 (signal (bool->bitvector (bveq (signal-value btor523) (signal-value btor24)))
                            (merge-state (list btor523 btor24)))]
           [btor526 (signal (bvor (signal-value btor524) (signal-value btor525))
                            (merge-state (list btor524 btor525)))]
           [btor527 (if (bitvector->bool (signal-value btor526)) btor522 btor518)]
           [btor528 (if (bitvector->bool (signal-value btor174)) btor152 btor527)]
           [btor529 (signal (concat (signal-value btor3) (signal-value btor2))
                            (merge-state (list btor3 btor2)))]
           [btor530 (signal (concat (signal-value btor4) (signal-value btor529))
                            (merge-state (list btor4 btor529)))]
           [btor531 (signal (concat (signal-value btor5) (signal-value btor530))
                            (merge-state (list btor5 btor530)))]
           [btor532 (bitvector 5)]
           [btor533 (signal (concat (signal-value btor6) (signal-value btor531))
                            (merge-state (list btor6 btor531)))]
           [btor534 (bv->signal (zero-extend (signal-value btor533) (bitvector 64)) btor533)]
           [btor535 (signal (bvlshr (signal-value btor9) (signal-value btor534))
                            (merge-state (list btor9 btor534)))]
           [btor536 (signal (extract 0 0 (signal-value btor535)) (signal-state btor535))]
           [btor537 (if (bitvector->bool (signal-value btor182)) btor536 btor528)]
           [btor539 unnamed-input-539]
           [btor540 unnamed-input-540]
           [btor541 (signal (apply bvor (bitvector->bits (signal-value btor9))) (signal-state btor9))]
           [btor542 (signal (bvnot (signal-value btor541)) (merge-state (list btor541)))]
           [btor543 (signal (apply bvand (bitvector->bits (signal-value btor9)))
                            (signal-state btor9))]
           [btor544 (signal (bvor (signal-value btor542) (signal-value btor543))
                            (merge-state (list btor542 btor543)))]
           [btor545 (if (bitvector->bool (signal-value btor544)) btor540 btor167)]
           [btor546 unnamed-input-546]
           [btor547 (signal (bvxor (signal-value btor179) (signal-value btor7))
                            (merge-state (list btor179 btor7)))]
           [btor548 (signal (bool->bitvector (bveq (signal-value btor547) (signal-value btor24)))
                            (merge-state (list btor547 btor24)))]
           [btor549 (signal (bool->bitvector (bveq (signal-value btor547) (signal-value btor22)))
                            (merge-state (list btor547 btor22)))]
           [btor550 (signal (bvor (signal-value btor548) (signal-value btor549))
                            (merge-state (list btor548 btor549)))]
           [btor551 (if (bitvector->bool (signal-value btor550)) btor546 btor545)]
           [btor552 unnamed-input-552]
           [btor553 (if (bitvector->bool (signal-value btor544)) btor552 btor279)]
           [btor554 unnamed-input-554]
           [btor555 (if (bitvector->bool (signal-value btor550)) btor554 btor553)]
           [btor556 unnamed-input-556]
           [btor557 (if (bitvector->bool (signal-value btor544)) btor556 btor379)]
           [btor558 unnamed-input-558]
           [btor559 (if (bitvector->bool (signal-value btor550)) btor558 btor557)]
           [btor560 unnamed-input-560]
           [btor561 (if (bitvector->bool (signal-value btor544)) btor560 btor479)]
           [btor562 unnamed-input-562]
           [btor563 (if (bitvector->bool (signal-value btor550)) btor562 btor561)]
           [btor564 unnamed-input-564]
           [btor565 (signal (extract 39 32 (signal-value btor9)) (signal-state btor9))]
           [btor566 (bv->signal (zero-extend (signal-value btor18) (bitvector 8)) btor18)]
           [btor567 (signal (bvlshr (signal-value btor565) (signal-value btor566))
                            (merge-state (list btor565 btor566)))]
           [btor568 (signal (extract 0 0 (signal-value btor567)) (signal-state btor567))]
           [btor569 (bv->signal (zero-extend (signal-value btor28) (bitvector 8)) btor28)]
           [btor570 (signal (bvlshr (signal-value btor565) (signal-value btor569))
                            (merge-state (list btor565 btor569)))]
           [btor571 (signal (extract 0 0 (signal-value btor570)) (signal-state btor570))]
           [btor572 (signal (bool->bitvector (bveq (signal-value btor568) (signal-value btor571)))
                            (merge-state (list btor568 btor571)))]
           [btor573 (signal (bvand (signal-value btor26) (signal-value btor572))
                            (merge-state (list btor26 btor572)))]
           [btor574 (bv->signal (zero-extend (signal-value btor35) (bitvector 8)) btor35)]
           [btor575 (signal (bvlshr (signal-value btor565) (signal-value btor574))
                            (merge-state (list btor565 btor574)))]
           [btor576 (signal (extract 0 0 (signal-value btor575)) (signal-state btor575))]
           [btor577 (signal (bool->bitvector (bveq (signal-value btor568) (signal-value btor576)))
                            (merge-state (list btor568 btor576)))]
           [btor578 (signal (bvand (signal-value btor573) (signal-value btor577))
                            (merge-state (list btor573 btor577)))]
           [btor579 (bv->signal (zero-extend (signal-value btor42) (bitvector 8)) btor42)]
           [btor580 (signal (bvlshr (signal-value btor565) (signal-value btor579))
                            (merge-state (list btor565 btor579)))]
           [btor581 (signal (extract 0 0 (signal-value btor580)) (signal-state btor580))]
           [btor582 (signal (bool->bitvector (bveq (signal-value btor568) (signal-value btor581)))
                            (merge-state (list btor568 btor581)))]
           [btor583 (signal (bvand (signal-value btor578) (signal-value btor582))
                            (merge-state (list btor578 btor582)))]
           [btor584 (if (bitvector->bool (signal-value btor583)) btor568 btor564)]
           [btor585 (bv->signal (zero-extend (signal-value btor49) (bitvector 8)) btor49)]
           [btor586 (signal (bvlshr (signal-value btor565) (signal-value btor585))
                            (merge-state (list btor565 btor585)))]
           [btor587 (signal (extract 0 0 (signal-value btor586)) (signal-state btor586))]
           [btor588 (bv->signal (zero-extend (signal-value btor56) (bitvector 8)) btor56)]
           [btor589 (signal (bvlshr (signal-value btor565) (signal-value btor588))
                            (merge-state (list btor565 btor588)))]
           [btor590 (signal (extract 0 0 (signal-value btor589)) (signal-state btor589))]
           [btor591 (signal (bool->bitvector (bveq (signal-value btor587) (signal-value btor590)))
                            (merge-state (list btor587 btor590)))]
           [btor592 (signal (bvand (signal-value btor55) (signal-value btor591))
                            (merge-state (list btor55 btor591)))]
           [btor593 (bv->signal (zero-extend (signal-value btor63) (bitvector 8)) btor63)]
           [btor594 (signal (bvlshr (signal-value btor565) (signal-value btor593))
                            (merge-state (list btor565 btor593)))]
           [btor595 (signal (extract 0 0 (signal-value btor594)) (signal-state btor594))]
           [btor596 (signal (bool->bitvector (bveq (signal-value btor587) (signal-value btor595)))
                            (merge-state (list btor587 btor595)))]
           [btor597 (signal (bvand (signal-value btor592) (signal-value btor596))
                            (merge-state (list btor592 btor596)))]
           [btor598 (bv->signal (zero-extend (signal-value btor70) (bitvector 8)) btor70)]
           [btor599 (signal (bvlshr (signal-value btor565) (signal-value btor598))
                            (merge-state (list btor565 btor598)))]
           [btor600 (signal (extract 0 0 (signal-value btor599)) (signal-state btor599))]
           [btor601 (signal (bool->bitvector (bveq (signal-value btor587) (signal-value btor600)))
                            (merge-state (list btor587 btor600)))]
           [btor602 (signal (bvand (signal-value btor597) (signal-value btor601))
                            (merge-state (list btor597 btor601)))]
           [btor603 (if (bitvector->bool (signal-value btor602)) btor587 btor584)]
           [btor604 (bv->signal (zero-extend (signal-value btor2) (bitvector 8)) btor2)]
           [btor605 (signal (bvlshr (signal-value btor565) (signal-value btor604))
                            (merge-state (list btor565 btor604)))]
           [btor606 (signal (extract 0 0 (signal-value btor605)) (signal-state btor605))]
           [btor607 (bv->signal (zero-extend (signal-value btor83) (bitvector 8)) btor83)]
           [btor608 (signal (bvlshr (signal-value btor565) (signal-value btor607))
                            (merge-state (list btor565 btor607)))]
           [btor609 (signal (extract 0 0 (signal-value btor608)) (signal-state btor608))]
           [btor610 (signal (bool->bitvector (bveq (signal-value btor606) (signal-value btor609)))
                            (merge-state (list btor606 btor609)))]
           [btor611 (signal (bvand (signal-value btor82) (signal-value btor610))
                            (merge-state (list btor82 btor610)))]
           [btor612 (bv->signal (zero-extend (signal-value btor89) (bitvector 8)) btor89)]
           [btor613 (signal (bvlshr (signal-value btor565) (signal-value btor612))
                            (merge-state (list btor565 btor612)))]
           [btor614 (signal (extract 0 0 (signal-value btor613)) (signal-state btor613))]
           [btor615 (signal (bool->bitvector (bveq (signal-value btor606) (signal-value btor614)))
                            (merge-state (list btor606 btor614)))]
           [btor616 (signal (bvand (signal-value btor611) (signal-value btor615))
                            (merge-state (list btor611 btor615)))]
           [btor617 (bv->signal (zero-extend (signal-value btor95) (bitvector 8)) btor95)]
           [btor618 (signal (bvlshr (signal-value btor565) (signal-value btor617))
                            (merge-state (list btor565 btor617)))]
           [btor619 (signal (extract 0 0 (signal-value btor618)) (signal-state btor618))]
           [btor620 (signal (bool->bitvector (bveq (signal-value btor606) (signal-value btor619)))
                            (merge-state (list btor606 btor619)))]
           [btor621 (signal (bvand (signal-value btor616) (signal-value btor620))
                            (merge-state (list btor616 btor620)))]
           [btor622 (if (bitvector->bool (signal-value btor621)) btor606 btor603)]
           [btor623 (bv->signal (zero-extend (signal-value btor103) (bitvector 8)) btor103)]
           [btor624 (signal (bvlshr (signal-value btor565) (signal-value btor623))
                            (merge-state (list btor565 btor623)))]
           [btor625 (signal (extract 0 0 (signal-value btor624)) (signal-state btor624))]
           [btor626 (bv->signal (zero-extend (signal-value btor112) (bitvector 8)) btor112)]
           [btor627 (signal (bvlshr (signal-value btor565) (signal-value btor626))
                            (merge-state (list btor565 btor626)))]
           [btor628 (signal (extract 0 0 (signal-value btor627)) (signal-state btor627))]
           [btor629 (signal (bool->bitvector (bveq (signal-value btor625) (signal-value btor628)))
                            (merge-state (list btor625 btor628)))]
           [btor630 (signal (bvand (signal-value btor110) (signal-value btor629))
                            (merge-state (list btor110 btor629)))]
           [btor631 (if (bitvector->bool (signal-value btor630)) btor625 btor622)]
           [btor632 (bv->signal (zero-extend (signal-value btor120) (bitvector 8)) btor120)]
           [btor633 (signal (bvlshr (signal-value btor565) (signal-value btor632))
                            (merge-state (list btor565 btor632)))]
           [btor634 (signal (extract 0 0 (signal-value btor633)) (signal-state btor633))]
           [btor635 (bv->signal (zero-extend (signal-value btor129) (bitvector 8)) btor129)]
           [btor636 (signal (bvlshr (signal-value btor565) (signal-value btor635))
                            (merge-state (list btor565 btor635)))]
           [btor637 (signal (extract 0 0 (signal-value btor636)) (signal-state btor636))]
           [btor638 (signal (bool->bitvector (bveq (signal-value btor634) (signal-value btor637)))
                            (merge-state (list btor634 btor637)))]
           [btor639 (signal (bvand (signal-value btor127) (signal-value btor638))
                            (merge-state (list btor127 btor638)))]
           [btor640 (if (bitvector->bool (signal-value btor639)) btor634 btor631)]
           [btor641 (bv->signal (zero-extend (signal-value btor136) (bitvector 8)) btor136)]
           [btor642 (signal (bvlshr (signal-value btor565) (signal-value btor641))
                            (merge-state (list btor565 btor641)))]
           [btor643 (signal (extract 0 0 (signal-value btor642)) (signal-state btor642))]
           [btor644 (bv->signal (zero-extend (signal-value btor145) (bitvector 8)) btor145)]
           [btor645 (signal (bvlshr (signal-value btor565) (signal-value btor644))
                            (merge-state (list btor565 btor644)))]
           [btor646 (signal (extract 0 0 (signal-value btor645)) (signal-state btor645))]
           [btor647 (signal (bool->bitvector (bveq (signal-value btor643) (signal-value btor646)))
                            (merge-state (list btor643 btor646)))]
           [btor648 (signal (bvand (signal-value btor143) (signal-value btor647))
                            (merge-state (list btor143 btor647)))]
           [btor649 (if (bitvector->bool (signal-value btor648)) btor643 btor640)]
           [btor650 (signal (extract 32 32 (signal-value btor9)) (signal-state btor9))]
           [btor651 (signal (apply bvor (bitvector->bits (signal-value btor565)))
                            (signal-state btor565))]
           [btor652 (signal (bvnot (signal-value btor651)) (merge-state (list btor651)))]
           [btor653 (signal (apply bvand (bitvector->bits (signal-value btor565)))
                            (signal-state btor565))]
           [btor654 (signal (bvor (signal-value btor652) (signal-value btor653))
                            (merge-state (list btor652 btor653)))]
           [btor655 (if (bitvector->bool (signal-value btor654)) btor650 btor649)]
           [btor656 (bv->signal (zero-extend (signal-value btor159) (bitvector 8)) btor159)]
           [btor657 (signal (bvlshr (signal-value btor565) (signal-value btor656))
                            (merge-state (list btor565 btor656)))]
           [btor658 (signal (extract 0 0 (signal-value btor657)) (signal-state btor657))]
           [btor659 (if (bitvector->bool (signal-value btor166)) btor658 btor655)]
           [btor660 unnamed-input-660]
           [btor661 (if (bitvector->bool (signal-value btor544)) btor660 btor659)]
           [btor662 unnamed-input-662]
           [btor663 (if (bitvector->bool (signal-value btor550)) btor662 btor661)]
           [btor664 unnamed-input-664]
           [btor665 (signal (extract 47 40 (signal-value btor9)) (signal-state btor9))]
           [btor666 (bv->signal (zero-extend (signal-value btor18) (bitvector 8)) btor18)]
           [btor667 (signal (bvlshr (signal-value btor665) (signal-value btor666))
                            (merge-state (list btor665 btor666)))]
           [btor668 (signal (extract 0 0 (signal-value btor667)) (signal-state btor667))]
           [btor669 (bv->signal (zero-extend (signal-value btor28) (bitvector 8)) btor28)]
           [btor670 (signal (bvlshr (signal-value btor665) (signal-value btor669))
                            (merge-state (list btor665 btor669)))]
           [btor671 (signal (extract 0 0 (signal-value btor670)) (signal-state btor670))]
           [btor672 (signal (bool->bitvector (bveq (signal-value btor668) (signal-value btor671)))
                            (merge-state (list btor668 btor671)))]
           [btor673 (signal (bvand (signal-value btor26) (signal-value btor672))
                            (merge-state (list btor26 btor672)))]
           [btor674 (bv->signal (zero-extend (signal-value btor35) (bitvector 8)) btor35)]
           [btor675 (signal (bvlshr (signal-value btor665) (signal-value btor674))
                            (merge-state (list btor665 btor674)))]
           [btor676 (signal (extract 0 0 (signal-value btor675)) (signal-state btor675))]
           [btor677 (signal (bool->bitvector (bveq (signal-value btor668) (signal-value btor676)))
                            (merge-state (list btor668 btor676)))]
           [btor678 (signal (bvand (signal-value btor673) (signal-value btor677))
                            (merge-state (list btor673 btor677)))]
           [btor679 (bv->signal (zero-extend (signal-value btor42) (bitvector 8)) btor42)]
           [btor680 (signal (bvlshr (signal-value btor665) (signal-value btor679))
                            (merge-state (list btor665 btor679)))]
           [btor681 (signal (extract 0 0 (signal-value btor680)) (signal-state btor680))]
           [btor682 (signal (bool->bitvector (bveq (signal-value btor668) (signal-value btor681)))
                            (merge-state (list btor668 btor681)))]
           [btor683 (signal (bvand (signal-value btor678) (signal-value btor682))
                            (merge-state (list btor678 btor682)))]
           [btor684 (if (bitvector->bool (signal-value btor683)) btor668 btor664)]
           [btor685 (bv->signal (zero-extend (signal-value btor49) (bitvector 8)) btor49)]
           [btor686 (signal (bvlshr (signal-value btor665) (signal-value btor685))
                            (merge-state (list btor665 btor685)))]
           [btor687 (signal (extract 0 0 (signal-value btor686)) (signal-state btor686))]
           [btor688 (bv->signal (zero-extend (signal-value btor56) (bitvector 8)) btor56)]
           [btor689 (signal (bvlshr (signal-value btor665) (signal-value btor688))
                            (merge-state (list btor665 btor688)))]
           [btor690 (signal (extract 0 0 (signal-value btor689)) (signal-state btor689))]
           [btor691 (signal (bool->bitvector (bveq (signal-value btor687) (signal-value btor690)))
                            (merge-state (list btor687 btor690)))]
           [btor692 (signal (bvand (signal-value btor55) (signal-value btor691))
                            (merge-state (list btor55 btor691)))]
           [btor693 (bv->signal (zero-extend (signal-value btor63) (bitvector 8)) btor63)]
           [btor694 (signal (bvlshr (signal-value btor665) (signal-value btor693))
                            (merge-state (list btor665 btor693)))]
           [btor695 (signal (extract 0 0 (signal-value btor694)) (signal-state btor694))]
           [btor696 (signal (bool->bitvector (bveq (signal-value btor687) (signal-value btor695)))
                            (merge-state (list btor687 btor695)))]
           [btor697 (signal (bvand (signal-value btor692) (signal-value btor696))
                            (merge-state (list btor692 btor696)))]
           [btor698 (bv->signal (zero-extend (signal-value btor70) (bitvector 8)) btor70)]
           [btor699 (signal (bvlshr (signal-value btor665) (signal-value btor698))
                            (merge-state (list btor665 btor698)))]
           [btor700 (signal (extract 0 0 (signal-value btor699)) (signal-state btor699))]
           [btor701 (signal (bool->bitvector (bveq (signal-value btor687) (signal-value btor700)))
                            (merge-state (list btor687 btor700)))]
           [btor702 (signal (bvand (signal-value btor697) (signal-value btor701))
                            (merge-state (list btor697 btor701)))]
           [btor703 (if (bitvector->bool (signal-value btor702)) btor687 btor684)]
           [btor704 (bv->signal (zero-extend (signal-value btor2) (bitvector 8)) btor2)]
           [btor705 (signal (bvlshr (signal-value btor665) (signal-value btor704))
                            (merge-state (list btor665 btor704)))]
           [btor706 (signal (extract 0 0 (signal-value btor705)) (signal-state btor705))]
           [btor707 (bv->signal (zero-extend (signal-value btor83) (bitvector 8)) btor83)]
           [btor708 (signal (bvlshr (signal-value btor665) (signal-value btor707))
                            (merge-state (list btor665 btor707)))]
           [btor709 (signal (extract 0 0 (signal-value btor708)) (signal-state btor708))]
           [btor710 (signal (bool->bitvector (bveq (signal-value btor706) (signal-value btor709)))
                            (merge-state (list btor706 btor709)))]
           [btor711 (signal (bvand (signal-value btor82) (signal-value btor710))
                            (merge-state (list btor82 btor710)))]
           [btor712 (bv->signal (zero-extend (signal-value btor89) (bitvector 8)) btor89)]
           [btor713 (signal (bvlshr (signal-value btor665) (signal-value btor712))
                            (merge-state (list btor665 btor712)))]
           [btor714 (signal (extract 0 0 (signal-value btor713)) (signal-state btor713))]
           [btor715 (signal (bool->bitvector (bveq (signal-value btor706) (signal-value btor714)))
                            (merge-state (list btor706 btor714)))]
           [btor716 (signal (bvand (signal-value btor711) (signal-value btor715))
                            (merge-state (list btor711 btor715)))]
           [btor717 (bv->signal (zero-extend (signal-value btor95) (bitvector 8)) btor95)]
           [btor718 (signal (bvlshr (signal-value btor665) (signal-value btor717))
                            (merge-state (list btor665 btor717)))]
           [btor719 (signal (extract 0 0 (signal-value btor718)) (signal-state btor718))]
           [btor720 (signal (bool->bitvector (bveq (signal-value btor706) (signal-value btor719)))
                            (merge-state (list btor706 btor719)))]
           [btor721 (signal (bvand (signal-value btor716) (signal-value btor720))
                            (merge-state (list btor716 btor720)))]
           [btor722 (if (bitvector->bool (signal-value btor721)) btor706 btor703)]
           [btor723 (bv->signal (zero-extend (signal-value btor103) (bitvector 8)) btor103)]
           [btor724 (signal (bvlshr (signal-value btor665) (signal-value btor723))
                            (merge-state (list btor665 btor723)))]
           [btor725 (signal (extract 0 0 (signal-value btor724)) (signal-state btor724))]
           [btor726 (bv->signal (zero-extend (signal-value btor112) (bitvector 8)) btor112)]
           [btor727 (signal (bvlshr (signal-value btor665) (signal-value btor726))
                            (merge-state (list btor665 btor726)))]
           [btor728 (signal (extract 0 0 (signal-value btor727)) (signal-state btor727))]
           [btor729 (signal (bool->bitvector (bveq (signal-value btor725) (signal-value btor728)))
                            (merge-state (list btor725 btor728)))]
           [btor730 (signal (bvand (signal-value btor110) (signal-value btor729))
                            (merge-state (list btor110 btor729)))]
           [btor731 (if (bitvector->bool (signal-value btor730)) btor725 btor722)]
           [btor732 (bv->signal (zero-extend (signal-value btor120) (bitvector 8)) btor120)]
           [btor733 (signal (bvlshr (signal-value btor665) (signal-value btor732))
                            (merge-state (list btor665 btor732)))]
           [btor734 (signal (extract 0 0 (signal-value btor733)) (signal-state btor733))]
           [btor735 (bv->signal (zero-extend (signal-value btor129) (bitvector 8)) btor129)]
           [btor736 (signal (bvlshr (signal-value btor665) (signal-value btor735))
                            (merge-state (list btor665 btor735)))]
           [btor737 (signal (extract 0 0 (signal-value btor736)) (signal-state btor736))]
           [btor738 (signal (bool->bitvector (bveq (signal-value btor734) (signal-value btor737)))
                            (merge-state (list btor734 btor737)))]
           [btor739 (signal (bvand (signal-value btor127) (signal-value btor738))
                            (merge-state (list btor127 btor738)))]
           [btor740 (if (bitvector->bool (signal-value btor739)) btor734 btor731)]
           [btor741 (bv->signal (zero-extend (signal-value btor136) (bitvector 8)) btor136)]
           [btor742 (signal (bvlshr (signal-value btor665) (signal-value btor741))
                            (merge-state (list btor665 btor741)))]
           [btor743 (signal (extract 0 0 (signal-value btor742)) (signal-state btor742))]
           [btor744 (bv->signal (zero-extend (signal-value btor145) (bitvector 8)) btor145)]
           [btor745 (signal (bvlshr (signal-value btor665) (signal-value btor744))
                            (merge-state (list btor665 btor744)))]
           [btor746 (signal (extract 0 0 (signal-value btor745)) (signal-state btor745))]
           [btor747 (signal (bool->bitvector (bveq (signal-value btor743) (signal-value btor746)))
                            (merge-state (list btor743 btor746)))]
           [btor748 (signal (bvand (signal-value btor143) (signal-value btor747))
                            (merge-state (list btor143 btor747)))]
           [btor749 (if (bitvector->bool (signal-value btor748)) btor743 btor740)]
           [btor750 (signal (extract 40 40 (signal-value btor9)) (signal-state btor9))]
           [btor751 (signal (apply bvor (bitvector->bits (signal-value btor665)))
                            (signal-state btor665))]
           [btor752 (signal (bvnot (signal-value btor751)) (merge-state (list btor751)))]
           [btor753 (signal (apply bvand (bitvector->bits (signal-value btor665)))
                            (signal-state btor665))]
           [btor754 (signal (bvor (signal-value btor752) (signal-value btor753))
                            (merge-state (list btor752 btor753)))]
           [btor755 (if (bitvector->bool (signal-value btor754)) btor750 btor749)]
           [btor756 (bv->signal (zero-extend (signal-value btor159) (bitvector 8)) btor159)]
           [btor757 (signal (bvlshr (signal-value btor665) (signal-value btor756))
                            (merge-state (list btor665 btor756)))]
           [btor758 (signal (extract 0 0 (signal-value btor757)) (signal-state btor757))]
           [btor759 (if (bitvector->bool (signal-value btor166)) btor758 btor755)]
           [btor760 unnamed-input-760]
           [btor761 (if (bitvector->bool (signal-value btor544)) btor760 btor759)]
           [btor762 unnamed-input-762]
           [btor763 (if (bitvector->bool (signal-value btor550)) btor762 btor761)]
           [btor764 unnamed-input-764]
           [btor765 (signal (extract 55 48 (signal-value btor9)) (signal-state btor9))]
           [btor766 (bv->signal (zero-extend (signal-value btor18) (bitvector 8)) btor18)]
           [btor767 (signal (bvlshr (signal-value btor765) (signal-value btor766))
                            (merge-state (list btor765 btor766)))]
           [btor768 (signal (extract 0 0 (signal-value btor767)) (signal-state btor767))]
           [btor769 (bv->signal (zero-extend (signal-value btor28) (bitvector 8)) btor28)]
           [btor770 (signal (bvlshr (signal-value btor765) (signal-value btor769))
                            (merge-state (list btor765 btor769)))]
           [btor771 (signal (extract 0 0 (signal-value btor770)) (signal-state btor770))]
           [btor772 (signal (bool->bitvector (bveq (signal-value btor768) (signal-value btor771)))
                            (merge-state (list btor768 btor771)))]
           [btor773 (signal (bvand (signal-value btor26) (signal-value btor772))
                            (merge-state (list btor26 btor772)))]
           [btor774 (bv->signal (zero-extend (signal-value btor35) (bitvector 8)) btor35)]
           [btor775 (signal (bvlshr (signal-value btor765) (signal-value btor774))
                            (merge-state (list btor765 btor774)))]
           [btor776 (signal (extract 0 0 (signal-value btor775)) (signal-state btor775))]
           [btor777 (signal (bool->bitvector (bveq (signal-value btor768) (signal-value btor776)))
                            (merge-state (list btor768 btor776)))]
           [btor778 (signal (bvand (signal-value btor773) (signal-value btor777))
                            (merge-state (list btor773 btor777)))]
           [btor779 (bv->signal (zero-extend (signal-value btor42) (bitvector 8)) btor42)]
           [btor780 (signal (bvlshr (signal-value btor765) (signal-value btor779))
                            (merge-state (list btor765 btor779)))]
           [btor781 (signal (extract 0 0 (signal-value btor780)) (signal-state btor780))]
           [btor782 (signal (bool->bitvector (bveq (signal-value btor768) (signal-value btor781)))
                            (merge-state (list btor768 btor781)))]
           [btor783 (signal (bvand (signal-value btor778) (signal-value btor782))
                            (merge-state (list btor778 btor782)))]
           [btor784 (if (bitvector->bool (signal-value btor783)) btor768 btor764)]
           [btor785 (bv->signal (zero-extend (signal-value btor49) (bitvector 8)) btor49)]
           [btor786 (signal (bvlshr (signal-value btor765) (signal-value btor785))
                            (merge-state (list btor765 btor785)))]
           [btor787 (signal (extract 0 0 (signal-value btor786)) (signal-state btor786))]
           [btor788 (bv->signal (zero-extend (signal-value btor56) (bitvector 8)) btor56)]
           [btor789 (signal (bvlshr (signal-value btor765) (signal-value btor788))
                            (merge-state (list btor765 btor788)))]
           [btor790 (signal (extract 0 0 (signal-value btor789)) (signal-state btor789))]
           [btor791 (signal (bool->bitvector (bveq (signal-value btor787) (signal-value btor790)))
                            (merge-state (list btor787 btor790)))]
           [btor792 (signal (bvand (signal-value btor55) (signal-value btor791))
                            (merge-state (list btor55 btor791)))]
           [btor793 (bv->signal (zero-extend (signal-value btor63) (bitvector 8)) btor63)]
           [btor794 (signal (bvlshr (signal-value btor765) (signal-value btor793))
                            (merge-state (list btor765 btor793)))]
           [btor795 (signal (extract 0 0 (signal-value btor794)) (signal-state btor794))]
           [btor796 (signal (bool->bitvector (bveq (signal-value btor787) (signal-value btor795)))
                            (merge-state (list btor787 btor795)))]
           [btor797 (signal (bvand (signal-value btor792) (signal-value btor796))
                            (merge-state (list btor792 btor796)))]
           [btor798 (bv->signal (zero-extend (signal-value btor70) (bitvector 8)) btor70)]
           [btor799 (signal (bvlshr (signal-value btor765) (signal-value btor798))
                            (merge-state (list btor765 btor798)))]
           [btor800 (signal (extract 0 0 (signal-value btor799)) (signal-state btor799))]
           [btor801 (signal (bool->bitvector (bveq (signal-value btor787) (signal-value btor800)))
                            (merge-state (list btor787 btor800)))]
           [btor802 (signal (bvand (signal-value btor797) (signal-value btor801))
                            (merge-state (list btor797 btor801)))]
           [btor803 (if (bitvector->bool (signal-value btor802)) btor787 btor784)]
           [btor804 (bv->signal (zero-extend (signal-value btor2) (bitvector 8)) btor2)]
           [btor805 (signal (bvlshr (signal-value btor765) (signal-value btor804))
                            (merge-state (list btor765 btor804)))]
           [btor806 (signal (extract 0 0 (signal-value btor805)) (signal-state btor805))]
           [btor807 (bv->signal (zero-extend (signal-value btor83) (bitvector 8)) btor83)]
           [btor808 (signal (bvlshr (signal-value btor765) (signal-value btor807))
                            (merge-state (list btor765 btor807)))]
           [btor809 (signal (extract 0 0 (signal-value btor808)) (signal-state btor808))]
           [btor810 (signal (bool->bitvector (bveq (signal-value btor806) (signal-value btor809)))
                            (merge-state (list btor806 btor809)))]
           [btor811 (signal (bvand (signal-value btor82) (signal-value btor810))
                            (merge-state (list btor82 btor810)))]
           [btor812 (bv->signal (zero-extend (signal-value btor89) (bitvector 8)) btor89)]
           [btor813 (signal (bvlshr (signal-value btor765) (signal-value btor812))
                            (merge-state (list btor765 btor812)))]
           [btor814 (signal (extract 0 0 (signal-value btor813)) (signal-state btor813))]
           [btor815 (signal (bool->bitvector (bveq (signal-value btor806) (signal-value btor814)))
                            (merge-state (list btor806 btor814)))]
           [btor816 (signal (bvand (signal-value btor811) (signal-value btor815))
                            (merge-state (list btor811 btor815)))]
           [btor817 (bv->signal (zero-extend (signal-value btor95) (bitvector 8)) btor95)]
           [btor818 (signal (bvlshr (signal-value btor765) (signal-value btor817))
                            (merge-state (list btor765 btor817)))]
           [btor819 (signal (extract 0 0 (signal-value btor818)) (signal-state btor818))]
           [btor820 (signal (bool->bitvector (bveq (signal-value btor806) (signal-value btor819)))
                            (merge-state (list btor806 btor819)))]
           [btor821 (signal (bvand (signal-value btor816) (signal-value btor820))
                            (merge-state (list btor816 btor820)))]
           [btor822 (if (bitvector->bool (signal-value btor821)) btor806 btor803)]
           [btor823 (bv->signal (zero-extend (signal-value btor103) (bitvector 8)) btor103)]
           [btor824 (signal (bvlshr (signal-value btor765) (signal-value btor823))
                            (merge-state (list btor765 btor823)))]
           [btor825 (signal (extract 0 0 (signal-value btor824)) (signal-state btor824))]
           [btor826 (bv->signal (zero-extend (signal-value btor112) (bitvector 8)) btor112)]
           [btor827 (signal (bvlshr (signal-value btor765) (signal-value btor826))
                            (merge-state (list btor765 btor826)))]
           [btor828 (signal (extract 0 0 (signal-value btor827)) (signal-state btor827))]
           [btor829 (signal (bool->bitvector (bveq (signal-value btor825) (signal-value btor828)))
                            (merge-state (list btor825 btor828)))]
           [btor830 (signal (bvand (signal-value btor110) (signal-value btor829))
                            (merge-state (list btor110 btor829)))]
           [btor831 (if (bitvector->bool (signal-value btor830)) btor825 btor822)]
           [btor832 (bv->signal (zero-extend (signal-value btor120) (bitvector 8)) btor120)]
           [btor833 (signal (bvlshr (signal-value btor765) (signal-value btor832))
                            (merge-state (list btor765 btor832)))]
           [btor834 (signal (extract 0 0 (signal-value btor833)) (signal-state btor833))]
           [btor835 (bv->signal (zero-extend (signal-value btor129) (bitvector 8)) btor129)]
           [btor836 (signal (bvlshr (signal-value btor765) (signal-value btor835))
                            (merge-state (list btor765 btor835)))]
           [btor837 (signal (extract 0 0 (signal-value btor836)) (signal-state btor836))]
           [btor838 (signal (bool->bitvector (bveq (signal-value btor834) (signal-value btor837)))
                            (merge-state (list btor834 btor837)))]
           [btor839 (signal (bvand (signal-value btor127) (signal-value btor838))
                            (merge-state (list btor127 btor838)))]
           [btor840 (if (bitvector->bool (signal-value btor839)) btor834 btor831)]
           [btor841 (bv->signal (zero-extend (signal-value btor136) (bitvector 8)) btor136)]
           [btor842 (signal (bvlshr (signal-value btor765) (signal-value btor841))
                            (merge-state (list btor765 btor841)))]
           [btor843 (signal (extract 0 0 (signal-value btor842)) (signal-state btor842))]
           [btor844 (bv->signal (zero-extend (signal-value btor145) (bitvector 8)) btor145)]
           [btor845 (signal (bvlshr (signal-value btor765) (signal-value btor844))
                            (merge-state (list btor765 btor844)))]
           [btor846 (signal (extract 0 0 (signal-value btor845)) (signal-state btor845))]
           [btor847 (signal (bool->bitvector (bveq (signal-value btor843) (signal-value btor846)))
                            (merge-state (list btor843 btor846)))]
           [btor848 (signal (bvand (signal-value btor143) (signal-value btor847))
                            (merge-state (list btor143 btor847)))]
           [btor849 (if (bitvector->bool (signal-value btor848)) btor843 btor840)]
           [btor850 (signal (extract 48 48 (signal-value btor9)) (signal-state btor9))]
           [btor851 (signal (apply bvor (bitvector->bits (signal-value btor765)))
                            (signal-state btor765))]
           [btor852 (signal (bvnot (signal-value btor851)) (merge-state (list btor851)))]
           [btor853 (signal (apply bvand (bitvector->bits (signal-value btor765)))
                            (signal-state btor765))]
           [btor854 (signal (bvor (signal-value btor852) (signal-value btor853))
                            (merge-state (list btor852 btor853)))]
           [btor855 (if (bitvector->bool (signal-value btor854)) btor850 btor849)]
           [btor856 (bv->signal (zero-extend (signal-value btor159) (bitvector 8)) btor159)]
           [btor857 (signal (bvlshr (signal-value btor765) (signal-value btor856))
                            (merge-state (list btor765 btor856)))]
           [btor858 (signal (extract 0 0 (signal-value btor857)) (signal-state btor857))]
           [btor859 (if (bitvector->bool (signal-value btor166)) btor858 btor855)]
           [btor860 unnamed-input-860]
           [btor861 (if (bitvector->bool (signal-value btor544)) btor860 btor859)]
           [btor862 unnamed-input-862]
           [btor863 (if (bitvector->bool (signal-value btor550)) btor862 btor861)]
           [btor864 unnamed-input-864]
           [btor865 (signal (extract 63 56 (signal-value btor9)) (signal-state btor9))]
           [btor866 (bv->signal (zero-extend (signal-value btor18) (bitvector 8)) btor18)]
           [btor867 (signal (bvlshr (signal-value btor865) (signal-value btor866))
                            (merge-state (list btor865 btor866)))]
           [btor868 (signal (extract 0 0 (signal-value btor867)) (signal-state btor867))]
           [btor869 (bv->signal (zero-extend (signal-value btor28) (bitvector 8)) btor28)]
           [btor870 (signal (bvlshr (signal-value btor865) (signal-value btor869))
                            (merge-state (list btor865 btor869)))]
           [btor871 (signal (extract 0 0 (signal-value btor870)) (signal-state btor870))]
           [btor872 (signal (bool->bitvector (bveq (signal-value btor868) (signal-value btor871)))
                            (merge-state (list btor868 btor871)))]
           [btor873 (signal (bvand (signal-value btor26) (signal-value btor872))
                            (merge-state (list btor26 btor872)))]
           [btor874 (bv->signal (zero-extend (signal-value btor35) (bitvector 8)) btor35)]
           [btor875 (signal (bvlshr (signal-value btor865) (signal-value btor874))
                            (merge-state (list btor865 btor874)))]
           [btor876 (signal (extract 0 0 (signal-value btor875)) (signal-state btor875))]
           [btor877 (signal (bool->bitvector (bveq (signal-value btor868) (signal-value btor876)))
                            (merge-state (list btor868 btor876)))]
           [btor878 (signal (bvand (signal-value btor873) (signal-value btor877))
                            (merge-state (list btor873 btor877)))]
           [btor879 (bv->signal (zero-extend (signal-value btor42) (bitvector 8)) btor42)]
           [btor880 (signal (bvlshr (signal-value btor865) (signal-value btor879))
                            (merge-state (list btor865 btor879)))]
           [btor881 (signal (extract 0 0 (signal-value btor880)) (signal-state btor880))]
           [btor882 (signal (bool->bitvector (bveq (signal-value btor868) (signal-value btor881)))
                            (merge-state (list btor868 btor881)))]
           [btor883 (signal (bvand (signal-value btor878) (signal-value btor882))
                            (merge-state (list btor878 btor882)))]
           [btor884 (if (bitvector->bool (signal-value btor883)) btor868 btor864)]
           [btor885 (bv->signal (zero-extend (signal-value btor49) (bitvector 8)) btor49)]
           [btor886 (signal (bvlshr (signal-value btor865) (signal-value btor885))
                            (merge-state (list btor865 btor885)))]
           [btor887 (signal (extract 0 0 (signal-value btor886)) (signal-state btor886))]
           [btor888 (bv->signal (zero-extend (signal-value btor56) (bitvector 8)) btor56)]
           [btor889 (signal (bvlshr (signal-value btor865) (signal-value btor888))
                            (merge-state (list btor865 btor888)))]
           [btor890 (signal (extract 0 0 (signal-value btor889)) (signal-state btor889))]
           [btor891 (signal (bool->bitvector (bveq (signal-value btor887) (signal-value btor890)))
                            (merge-state (list btor887 btor890)))]
           [btor892 (signal (bvand (signal-value btor55) (signal-value btor891))
                            (merge-state (list btor55 btor891)))]
           [btor893 (bv->signal (zero-extend (signal-value btor63) (bitvector 8)) btor63)]
           [btor894 (signal (bvlshr (signal-value btor865) (signal-value btor893))
                            (merge-state (list btor865 btor893)))]
           [btor895 (signal (extract 0 0 (signal-value btor894)) (signal-state btor894))]
           [btor896 (signal (bool->bitvector (bveq (signal-value btor887) (signal-value btor895)))
                            (merge-state (list btor887 btor895)))]
           [btor897 (signal (bvand (signal-value btor892) (signal-value btor896))
                            (merge-state (list btor892 btor896)))]
           [btor898 (bv->signal (zero-extend (signal-value btor70) (bitvector 8)) btor70)]
           [btor899 (signal (bvlshr (signal-value btor865) (signal-value btor898))
                            (merge-state (list btor865 btor898)))]
           [btor900 (signal (extract 0 0 (signal-value btor899)) (signal-state btor899))]
           [btor901 (signal (bool->bitvector (bveq (signal-value btor887) (signal-value btor900)))
                            (merge-state (list btor887 btor900)))]
           [btor902 (signal (bvand (signal-value btor897) (signal-value btor901))
                            (merge-state (list btor897 btor901)))]
           [btor903 (if (bitvector->bool (signal-value btor902)) btor887 btor884)]
           [btor904 (bv->signal (zero-extend (signal-value btor2) (bitvector 8)) btor2)]
           [btor905 (signal (bvlshr (signal-value btor865) (signal-value btor904))
                            (merge-state (list btor865 btor904)))]
           [btor906 (signal (extract 0 0 (signal-value btor905)) (signal-state btor905))]
           [btor907 (bv->signal (zero-extend (signal-value btor83) (bitvector 8)) btor83)]
           [btor908 (signal (bvlshr (signal-value btor865) (signal-value btor907))
                            (merge-state (list btor865 btor907)))]
           [btor909 (signal (extract 0 0 (signal-value btor908)) (signal-state btor908))]
           [btor910 (signal (bool->bitvector (bveq (signal-value btor906) (signal-value btor909)))
                            (merge-state (list btor906 btor909)))]
           [btor911 (signal (bvand (signal-value btor82) (signal-value btor910))
                            (merge-state (list btor82 btor910)))]
           [btor912 (bv->signal (zero-extend (signal-value btor89) (bitvector 8)) btor89)]
           [btor913 (signal (bvlshr (signal-value btor865) (signal-value btor912))
                            (merge-state (list btor865 btor912)))]
           [btor914 (signal (extract 0 0 (signal-value btor913)) (signal-state btor913))]
           [btor915 (signal (bool->bitvector (bveq (signal-value btor906) (signal-value btor914)))
                            (merge-state (list btor906 btor914)))]
           [btor916 (signal (bvand (signal-value btor911) (signal-value btor915))
                            (merge-state (list btor911 btor915)))]
           [btor917 (bv->signal (zero-extend (signal-value btor95) (bitvector 8)) btor95)]
           [btor918 (signal (bvlshr (signal-value btor865) (signal-value btor917))
                            (merge-state (list btor865 btor917)))]
           [btor919 (signal (extract 0 0 (signal-value btor918)) (signal-state btor918))]
           [btor920 (signal (bool->bitvector (bveq (signal-value btor906) (signal-value btor919)))
                            (merge-state (list btor906 btor919)))]
           [btor921 (signal (bvand (signal-value btor916) (signal-value btor920))
                            (merge-state (list btor916 btor920)))]
           [btor922 (if (bitvector->bool (signal-value btor921)) btor906 btor903)]
           [btor923 (bv->signal (zero-extend (signal-value btor103) (bitvector 8)) btor103)]
           [btor924 (signal (bvlshr (signal-value btor865) (signal-value btor923))
                            (merge-state (list btor865 btor923)))]
           [btor925 (signal (extract 0 0 (signal-value btor924)) (signal-state btor924))]
           [btor926 (bv->signal (zero-extend (signal-value btor112) (bitvector 8)) btor112)]
           [btor927 (signal (bvlshr (signal-value btor865) (signal-value btor926))
                            (merge-state (list btor865 btor926)))]
           [btor928 (signal (extract 0 0 (signal-value btor927)) (signal-state btor927))]
           [btor929 (signal (bool->bitvector (bveq (signal-value btor925) (signal-value btor928)))
                            (merge-state (list btor925 btor928)))]
           [btor930 (signal (bvand (signal-value btor110) (signal-value btor929))
                            (merge-state (list btor110 btor929)))]
           [btor931 (if (bitvector->bool (signal-value btor930)) btor925 btor922)]
           [btor932 (bv->signal (zero-extend (signal-value btor120) (bitvector 8)) btor120)]
           [btor933 (signal (bvlshr (signal-value btor865) (signal-value btor932))
                            (merge-state (list btor865 btor932)))]
           [btor934 (signal (extract 0 0 (signal-value btor933)) (signal-state btor933))]
           [btor935 (bv->signal (zero-extend (signal-value btor129) (bitvector 8)) btor129)]
           [btor936 (signal (bvlshr (signal-value btor865) (signal-value btor935))
                            (merge-state (list btor865 btor935)))]
           [btor937 (signal (extract 0 0 (signal-value btor936)) (signal-state btor936))]
           [btor938 (signal (bool->bitvector (bveq (signal-value btor934) (signal-value btor937)))
                            (merge-state (list btor934 btor937)))]
           [btor939 (signal (bvand (signal-value btor127) (signal-value btor938))
                            (merge-state (list btor127 btor938)))]
           [btor940 (if (bitvector->bool (signal-value btor939)) btor934 btor931)]
           [btor941 (bv->signal (zero-extend (signal-value btor136) (bitvector 8)) btor136)]
           [btor942 (signal (bvlshr (signal-value btor865) (signal-value btor941))
                            (merge-state (list btor865 btor941)))]
           [btor943 (signal (extract 0 0 (signal-value btor942)) (signal-state btor942))]
           [btor944 (bv->signal (zero-extend (signal-value btor145) (bitvector 8)) btor145)]
           [btor945 (signal (bvlshr (signal-value btor865) (signal-value btor944))
                            (merge-state (list btor865 btor944)))]
           [btor946 (signal (extract 0 0 (signal-value btor945)) (signal-state btor945))]
           [btor947 (signal (bool->bitvector (bveq (signal-value btor943) (signal-value btor946)))
                            (merge-state (list btor943 btor946)))]
           [btor948 (signal (bvand (signal-value btor143) (signal-value btor947))
                            (merge-state (list btor143 btor947)))]
           [btor949 (if (bitvector->bool (signal-value btor948)) btor943 btor940)]
           [btor950 (signal (extract 56 56 (signal-value btor9)) (signal-state btor9))]
           [btor951 (signal (apply bvor (bitvector->bits (signal-value btor865)))
                            (signal-state btor865))]
           [btor952 (signal (bvnot (signal-value btor951)) (merge-state (list btor951)))]
           [btor953 (signal (apply bvand (bitvector->bits (signal-value btor865)))
                            (signal-state btor865))]
           [btor954 (signal (bvor (signal-value btor952) (signal-value btor953))
                            (merge-state (list btor952 btor953)))]
           [btor955 (if (bitvector->bool (signal-value btor954)) btor950 btor949)]
           [btor956 (bv->signal (zero-extend (signal-value btor159) (bitvector 8)) btor159)]
           [btor957 (signal (bvlshr (signal-value btor865) (signal-value btor956))
                            (merge-state (list btor865 btor956)))]
           [btor958 (signal (extract 0 0 (signal-value btor957)) (signal-state btor957))]
           [btor959 (if (bitvector->bool (signal-value btor166)) btor958 btor955)]
           [btor960 unnamed-input-960]
           [btor961 (if (bitvector->bool (signal-value btor544)) btor960 btor959)]
           [btor962 unnamed-input-962]
           [btor963 (if (bitvector->bool (signal-value btor550)) btor962 btor961)]
           [btor964 (signal (concat (signal-value btor555) (signal-value btor551))
                            (merge-state (list btor555 btor551)))]
           [btor965 (signal (concat (signal-value btor559) (signal-value btor964))
                            (merge-state (list btor559 btor964)))]
           [btor966 (signal (concat (signal-value btor563) (signal-value btor965))
                            (merge-state (list btor563 btor965)))]
           [btor967 (signal (concat (signal-value btor663) (signal-value btor966))
                            (merge-state (list btor663 btor966)))]
           [btor968 (bitvector 6)]
           [btor969 (signal (concat (signal-value btor763) (signal-value btor967))
                            (merge-state (list btor763 btor967)))]
           [btor970 (bitvector 7)]
           [btor971 (signal (concat (signal-value btor863) (signal-value btor969))
                            (merge-state (list btor863 btor969)))]
           [btor972 (signal (concat (signal-value btor963) (signal-value btor971))
                            (merge-state (list btor963 btor971)))]
           [btor973 (signal (concat (signal-value btor7) (signal-value btor16))
                            (merge-state (list btor7 btor16)))]
           [btor974 (bv->signal (zero-extend (signal-value btor973) (bitvector 8)) btor973)]
           [btor975 (signal (bvlshr (signal-value btor972) (signal-value btor974))
                            (merge-state (list btor972 btor974)))]
           [btor976 (signal (extract 0 0 (signal-value btor975)) (signal-state btor975))]
           [btor977 (signal (bool->bitvector (bveq (signal-value btor7) (signal-value btor22)))
                            (merge-state (list btor7 btor22)))]
           [btor978 (signal (bool->bitvector (bveq (signal-value btor7) (signal-value btor24)))
                            (merge-state (list btor7 btor24)))]
           [btor979 (signal (bvor (signal-value btor977) (signal-value btor978))
                            (merge-state (list btor977 btor978)))]
           [btor980 (signal (concat (signal-value btor7) (signal-value btor27))
                            (merge-state (list btor7 btor27)))]
           [btor981 (bv->signal (zero-extend (signal-value btor980) (bitvector 8)) btor980)]
           [btor982 (signal (bvlshr (signal-value btor972) (signal-value btor981))
                            (merge-state (list btor972 btor981)))]
           [btor983 (signal (extract 0 0 (signal-value btor982)) (signal-state btor982))]
           [btor984 (signal (bool->bitvector (bveq (signal-value btor976) (signal-value btor983)))
                            (merge-state (list btor976 btor983)))]
           [btor985 (signal (bvand (signal-value btor979) (signal-value btor984))
                            (merge-state (list btor979 btor984)))]
           [btor986 (signal (concat (signal-value btor7) (signal-value btor34))
                            (merge-state (list btor7 btor34)))]
           [btor987 (bv->signal (zero-extend (signal-value btor986) (bitvector 8)) btor986)]
           [btor988 (signal (bvlshr (signal-value btor972) (signal-value btor987))
                            (merge-state (list btor972 btor987)))]
           [btor989 (signal (extract 0 0 (signal-value btor988)) (signal-state btor988))]
           [btor990 (signal (bool->bitvector (bveq (signal-value btor976) (signal-value btor989)))
                            (merge-state (list btor976 btor989)))]
           [btor991 (signal (bvand (signal-value btor985) (signal-value btor990))
                            (merge-state (list btor985 btor990)))]
           [btor992 (signal (concat (signal-value btor7) (signal-value btor41))
                            (merge-state (list btor7 btor41)))]
           [btor993 (bv->signal (zero-extend (signal-value btor992) (bitvector 8)) btor992)]
           [btor994 (signal (bvlshr (signal-value btor972) (signal-value btor993))
                            (merge-state (list btor972 btor993)))]
           [btor995 (signal (extract 0 0 (signal-value btor994)) (signal-state btor994))]
           [btor996 (signal (bool->bitvector (bveq (signal-value btor976) (signal-value btor995)))
                            (merge-state (list btor976 btor995)))]
           [btor997 (signal (bvand (signal-value btor991) (signal-value btor996))
                            (merge-state (list btor991 btor996)))]
           [btor998 (if (bitvector->bool (signal-value btor997)) btor976 btor539)]
           [btor999 (bv->signal (zero-extend (signal-value btor487) (bitvector 8)) btor487)]
           [btor1000 (signal (bvlshr (signal-value btor972) (signal-value btor999))
                             (merge-state (list btor972 btor999)))]
           [btor1001 (signal (extract 0 0 (signal-value btor1000)) (signal-state btor1000))]
           [btor1002 (bv->signal (zero-extend (signal-value btor494) (bitvector 8)) btor494)]
           [btor1003 (signal (bvlshr (signal-value btor972) (signal-value btor1002))
                             (merge-state (list btor972 btor1002)))]
           [btor1004 (signal (extract 0 0 (signal-value btor1003)) (signal-state btor1003))]
           [btor1005 (signal (bool->bitvector (bveq (signal-value btor1001) (signal-value btor1004)))
                             (merge-state (list btor1001 btor1004)))]
           [btor1006 (signal (bvand (signal-value btor493) (signal-value btor1005))
                             (merge-state (list btor493 btor1005)))]
           [btor1007 (signal (concat (signal-value btor6) (signal-value btor24))
                             (merge-state (list btor6 btor24)))]
           [btor1008 (signal (concat (signal-value btor22) (signal-value btor1007))
                             (merge-state (list btor22 btor1007)))]
           [btor1009 (bv->signal (zero-extend (signal-value btor1008) (bitvector 8)) btor1008)]
           [btor1010 (signal (bvlshr (signal-value btor972) (signal-value btor1009))
                             (merge-state (list btor972 btor1009)))]
           [btor1011 (signal (extract 0 0 (signal-value btor1010)) (signal-state btor1010))]
           [btor1012 (signal (bool->bitvector (bveq (signal-value btor1001) (signal-value btor1011)))
                             (merge-state (list btor1001 btor1011)))]
           [btor1013 (signal (bvand (signal-value btor1006) (signal-value btor1012))
                             (merge-state (list btor1006 btor1012)))]
           [btor1014 (signal (concat (signal-value btor6) (signal-value btor22))
                             (merge-state (list btor6 btor22)))]
           [btor1015 (signal (concat (signal-value btor22) (signal-value btor1014))
                             (merge-state (list btor22 btor1014)))]
           [btor1016 (bv->signal (zero-extend (signal-value btor1015) (bitvector 8)) btor1015)]
           [btor1017 (signal (bvlshr (signal-value btor972) (signal-value btor1016))
                             (merge-state (list btor972 btor1016)))]
           [btor1018 (signal (extract 0 0 (signal-value btor1017)) (signal-state btor1017))]
           [btor1019 (signal (bool->bitvector (bveq (signal-value btor1001) (signal-value btor1018)))
                             (merge-state (list btor1001 btor1018)))]
           [btor1020 (signal (bvand (signal-value btor1013) (signal-value btor1019))
                             (merge-state (list btor1013 btor1019)))]
           [btor1021 (if (bitvector->bool (signal-value btor1020)) btor1001 btor998)]
           [btor1022 (bv->signal (zero-extend (signal-value btor5) (bitvector 8)) btor5)]
           [btor1023 (signal (bvlshr (signal-value btor972) (signal-value btor1022))
                             (merge-state (list btor972 btor1022)))]
           [btor1024 (signal (extract 0 0 (signal-value btor1023)) (signal-state btor1023))]
           [btor1025 (bv->signal (zero-extend (signal-value btor507) (bitvector 8)) btor507)]
           [btor1026 (signal (bvlshr (signal-value btor972) (signal-value btor1025))
                             (merge-state (list btor972 btor1025)))]
           [btor1027 (signal (extract 0 0 (signal-value btor1026)) (signal-state btor1026))]
           [btor1028 (signal (bool->bitvector (bveq (signal-value btor1024) (signal-value btor1027)))
                             (merge-state (list btor1024 btor1027)))]
           [btor1029 (signal (bvand (signal-value btor506) (signal-value btor1028))
                             (merge-state (list btor506 btor1028)))]
           [btor1030 (signal (concat (signal-value btor34) (signal-value btor5))
                             (merge-state (list btor34 btor5)))]
           [btor1031 (bv->signal (zero-extend (signal-value btor1030) (bitvector 8)) btor1030)]
           [btor1032 (signal (bvlshr (signal-value btor972) (signal-value btor1031))
                             (merge-state (list btor972 btor1031)))]
           [btor1033 (signal (extract 0 0 (signal-value btor1032)) (signal-state btor1032))]
           [btor1034 (signal (bool->bitvector (bveq (signal-value btor1024) (signal-value btor1033)))
                             (merge-state (list btor1024 btor1033)))]
           [btor1035 (signal (bvand (signal-value btor1029) (signal-value btor1034))
                             (merge-state (list btor1029 btor1034)))]
           [btor1036 (signal (concat (signal-value btor41) (signal-value btor5))
                             (merge-state (list btor41 btor5)))]
           [btor1037 (bv->signal (zero-extend (signal-value btor1036) (bitvector 8)) btor1036)]
           [btor1038 (signal (bvlshr (signal-value btor972) (signal-value btor1037))
                             (merge-state (list btor972 btor1037)))]
           [btor1039 (signal (extract 0 0 (signal-value btor1038)) (signal-state btor1038))]
           [btor1040 (signal (bool->bitvector (bveq (signal-value btor1024) (signal-value btor1039)))
                             (merge-state (list btor1024 btor1039)))]
           [btor1041 (signal (bvand (signal-value btor1035) (signal-value btor1040))
                             (merge-state (list btor1035 btor1040)))]
           [btor1042 (if (bitvector->bool (signal-value btor1041)) btor1024 btor1021)]
           [btor1043 (signal (concat (signal-value btor6) (signal-value btor24))
                             (merge-state (list btor6 btor24)))]
           [btor1044 (signal (concat (signal-value btor7) (signal-value btor1043))
                             (merge-state (list btor7 btor1043)))]
           [btor1045 (bv->signal (zero-extend (signal-value btor1044) (bitvector 8)) btor1044)]
           [btor1046 (signal (bvlshr (signal-value btor972) (signal-value btor1045))
                             (merge-state (list btor972 btor1045)))]
           [btor1047 (signal (extract 0 0 (signal-value btor1046)) (signal-state btor1046))]
           [btor1048 (signal (bvxor (signal-value btor7) (signal-value btor6))
                             (merge-state (list btor7 btor6)))]
           [btor1049 (signal (bool->bitvector (bveq (signal-value btor1048) (signal-value btor22)))
                             (merge-state (list btor1048 btor22)))]
           [btor1050 (signal (bool->bitvector (bveq (signal-value btor1048) (signal-value btor24)))
                             (merge-state (list btor1048 btor24)))]
           [btor1051 (signal (bvor (signal-value btor1049) (signal-value btor1050))
                             (merge-state (list btor1049 btor1050)))]
           [btor1052 (signal (concat (signal-value btor6) (signal-value btor22))
                             (merge-state (list btor6 btor22)))]
           [btor1053 (signal (concat (signal-value btor7) (signal-value btor1052))
                             (merge-state (list btor7 btor1052)))]
           [btor1054 (bv->signal (zero-extend (signal-value btor1053) (bitvector 8)) btor1053)]
           [btor1055 (signal (bvlshr (signal-value btor972) (signal-value btor1054))
                             (merge-state (list btor972 btor1054)))]
           [btor1056 (signal (extract 0 0 (signal-value btor1055)) (signal-state btor1055))]
           [btor1057 (signal (bool->bitvector (bveq (signal-value btor1047) (signal-value btor1056)))
                             (merge-state (list btor1047 btor1056)))]
           [btor1058 (signal (bvand (signal-value btor1051) (signal-value btor1057))
                             (merge-state (list btor1051 btor1057)))]
           [btor1059 (if (bitvector->bool (signal-value btor1058)) btor1047 btor1042)]
           [btor1060 (signal (concat (signal-value btor24) (signal-value btor5))
                             (merge-state (list btor24 btor5)))]
           [btor1061 (signal (concat (signal-value btor7) (signal-value btor1060))
                             (merge-state (list btor7 btor1060)))]
           [btor1062 (bv->signal (zero-extend (signal-value btor1061) (bitvector 8)) btor1061)]
           [btor1063 (signal (bvlshr (signal-value btor972) (signal-value btor1062))
                             (merge-state (list btor972 btor1062)))]
           [btor1064 (signal (extract 0 0 (signal-value btor1063)) (signal-state btor1063))]
           [btor1065 (signal (bvxor (signal-value btor7) (signal-value btor5))
                             (merge-state (list btor7 btor5)))]
           [btor1066 (signal (bool->bitvector (bveq (signal-value btor1065) (signal-value btor22)))
                             (merge-state (list btor1065 btor22)))]
           [btor1067 (signal (bool->bitvector (bveq (signal-value btor1065) (signal-value btor24)))
                             (merge-state (list btor1065 btor24)))]
           [btor1068 (signal (bvor (signal-value btor1066) (signal-value btor1067))
                             (merge-state (list btor1066 btor1067)))]
           [btor1069 (signal (concat (signal-value btor22) (signal-value btor5))
                             (merge-state (list btor22 btor5)))]
           [btor1070 (signal (concat (signal-value btor7) (signal-value btor1069))
                             (merge-state (list btor7 btor1069)))]
           [btor1071 (bv->signal (zero-extend (signal-value btor1070) (bitvector 8)) btor1070)]
           [btor1072 (signal (bvlshr (signal-value btor972) (signal-value btor1071))
                             (merge-state (list btor972 btor1071)))]
           [btor1073 (signal (extract 0 0 (signal-value btor1072)) (signal-state btor1072))]
           [btor1074 (signal (bool->bitvector (bveq (signal-value btor1064) (signal-value btor1073)))
                             (merge-state (list btor1064 btor1073)))]
           [btor1075 (signal (bvand (signal-value btor1068) (signal-value btor1074))
                             (merge-state (list btor1068 btor1074)))]
           [btor1076 (if (bitvector->bool (signal-value btor1075)) btor1064 btor1059)]
           [btor1077 (bv->signal (zero-extend (signal-value btor519) (bitvector 8)) btor519)]
           [btor1078 (signal (bvlshr (signal-value btor972) (signal-value btor1077))
                             (merge-state (list btor972 btor1077)))]
           [btor1079 (signal (extract 0 0 (signal-value btor1078)) (signal-state btor1078))]
           [btor1080 (signal (concat (signal-value btor6) (signal-value btor5))
                             (merge-state (list btor6 btor5)))]
           [btor1081 (signal (concat (signal-value btor22) (signal-value btor1080))
                             (merge-state (list btor22 btor1080)))]
           [btor1082 (bv->signal (zero-extend (signal-value btor1081) (bitvector 8)) btor1081)]
           [btor1083 (signal (bvlshr (signal-value btor972) (signal-value btor1082))
                             (merge-state (list btor972 btor1082)))]
           [btor1084 (signal (extract 0 0 (signal-value btor1083)) (signal-state btor1083))]
           [btor1085 (signal (bool->bitvector (bveq (signal-value btor1079) (signal-value btor1084)))
                             (merge-state (list btor1079 btor1084)))]
           [btor1086 (signal (bvand (signal-value btor526) (signal-value btor1085))
                             (merge-state (list btor526 btor1085)))]
           [btor1087 (if (bitvector->bool (signal-value btor1086)) btor1079 btor1076)]
           [btor1088 (signal (apply bvor (bitvector->bits (signal-value btor972)))
                             (signal-state btor972))]
           [btor1089 (signal (bvnot (signal-value btor1088)) (merge-state (list btor1088)))]
           [btor1090 (signal (apply bvand (bitvector->bits (signal-value btor972)))
                             (signal-state btor972))]
           [btor1091 (signal (bvor (signal-value btor1089) (signal-value btor1090))
                             (merge-state (list btor1089 btor1090)))]
           [btor1092 (if (bitvector->bool (signal-value btor1091)) btor551 btor1087)]
           [btor1093 (signal (concat (signal-value btor6) (signal-value btor5))
                             (merge-state (list btor6 btor5)))]
           [btor1094 (signal (concat (signal-value btor7) (signal-value btor1093))
                             (merge-state (list btor7 btor1093)))]
           [btor1095 (bv->signal (zero-extend (signal-value btor1094) (bitvector 8)) btor1094)]
           [btor1096 (signal (bvlshr (signal-value btor972) (signal-value btor1095))
                             (merge-state (list btor972 btor1095)))]
           [btor1097 (signal (extract 0 0 (signal-value btor1096)) (signal-state btor1096))]
           [btor1098 (signal (bvxor (signal-value btor1048) (signal-value btor5))
                             (merge-state (list btor1048 btor5)))]
           [btor1099 (signal (bool->bitvector (bveq (signal-value btor1098) (signal-value btor22)))
                             (merge-state (list btor1098 btor22)))]
           [btor1100 (signal (bool->bitvector (bveq (signal-value btor1098) (signal-value btor24)))
                             (merge-state (list btor1098 btor24)))]
           [btor1101 (signal (bvor (signal-value btor1099) (signal-value btor1100))
                             (merge-state (list btor1099 btor1100)))]
           [btor1102 (if (bitvector->bool (signal-value btor1101)) btor1097 btor1092)]
           [btor1103 (if (bitvector->bool (signal-value btor544)) btor152 btor1102)]
           [btor1104 (signal (concat (signal-value btor3) (signal-value btor2))
                             (merge-state (list btor3 btor2)))]
           [btor1105 (signal (concat (signal-value btor4) (signal-value btor1104))
                             (merge-state (list btor4 btor1104)))]
           [btor1106 (signal (concat (signal-value btor5) (signal-value btor1105))
                             (merge-state (list btor5 btor1105)))]
           [btor1107 (signal (concat (signal-value btor6) (signal-value btor1106))
                             (merge-state (list btor6 btor1106)))]
           [btor1108 (signal (concat (signal-value btor7) (signal-value btor1107))
                             (merge-state (list btor7 btor1107)))]
           [btor1109 (bv->signal (zero-extend (signal-value btor1108) (bitvector 64)) btor1108)]
           [btor1110 (signal (bvlshr (signal-value btor9) (signal-value btor1109))
                             (merge-state (list btor9 btor1109)))]
           [btor1111 (signal (extract 0 0 (signal-value btor1110)) (signal-state btor1110))]
           [btor1112 (if (bitvector->bool (signal-value btor550)) btor1111 btor1103)]
           [btor1114 (bv->signal (zero-extend (signal-value btor9) (bitvector 64)) btor9)]
           [btor1115 (bv->signal (zero-extend (signal-value btor537) (bitvector 1)) btor537)]
           [btor1116 (bv->signal (zero-extend (signal-value btor1112) (bitvector 1)) btor1112)]
           [btor1117 unnamed-input-1117]
           [btor1118 (bv->signal (zero-extend (signal-value btor1117) (bitvector 4)) btor1117)]
           [btor1119 unnamed-input-1119]
           [btor1120 (bv->signal (zero-extend (signal-value btor1119) (bitvector 2)) btor1119)]
           [btor1121 unnamed-input-1121]
           [btor1122 (bv->signal (zero-extend (signal-value btor1121) (bitvector 8)) btor1121)]
           [btor1123 unnamed-input-1123]
           [btor1124 (bv->signal (zero-extend (signal-value btor1123) (bitvector 3)) btor1123)]
           [btor1125 unnamed-input-1125]
           [btor1126 (bv->signal (zero-extend (signal-value btor1125) (bitvector 8)) btor1125)]
           [btor1127 unnamed-input-1127]
           [btor1128 (bv->signal (zero-extend (signal-value btor1127) (bitvector 3)) btor1127)]
           [btor1129 unnamed-input-1129]
           [btor1130 (bv->signal (zero-extend (signal-value btor1129) (bitvector 8)) btor1129)]
           [btor1131 unnamed-input-1131]
           [btor1132 (bv->signal (zero-extend (signal-value btor1131) (bitvector 3)) btor1131)]
           [btor1133 unnamed-input-1133]
           [btor1134 (bv->signal (zero-extend (signal-value btor1133) (bitvector 8)) btor1133)]
           [btor1135 unnamed-input-1135]
           [btor1136 (bv->signal (zero-extend (signal-value btor1135) (bitvector 3)) btor1135)]
           [btor1137 unnamed-input-1137]
           [btor1138 (bv->signal (zero-extend (signal-value btor1137) (bitvector 8)) btor1137)]
           [btor1139 unnamed-input-1139]
           [btor1140 (bv->signal (zero-extend (signal-value btor1139) (bitvector 3)) btor1139)]
           [btor1141 unnamed-input-1141]
           [btor1142 (bv->signal (zero-extend (signal-value btor1141) (bitvector 8)) btor1141)]
           [btor1143 unnamed-input-1143]
           [btor1144 (bv->signal (zero-extend (signal-value btor1143) (bitvector 3)) btor1143)]
           [btor1145 unnamed-input-1145]
           [btor1146 (bv->signal (zero-extend (signal-value btor1145) (bitvector 8)) btor1145)]
           [btor1147 unnamed-input-1147]
           [btor1148 (bv->signal (zero-extend (signal-value btor1147) (bitvector 3)) btor1147)]
           [btor1149 unnamed-input-1149]
           [btor1150 (bv->signal (zero-extend (signal-value btor1149) (bitvector 8)) btor1149)]
           [btor1151 unnamed-input-1151]
           [btor1152 (bv->signal (zero-extend (signal-value btor1151) (bitvector 3)) btor1151)]
           [btor1153 unnamed-input-1153]
           [btor1154 (bv->signal (zero-extend (signal-value btor1153) (bitvector 8)) btor1153)]
           [btor1155 unnamed-input-1155]
           [btor1156 (bv->signal (zero-extend (signal-value btor1155) (bitvector 3)) btor1155)]
           [btor1157 unnamed-input-1157]
           [btor1158 (bv->signal (zero-extend (signal-value btor1157) (bitvector 8)) btor1157)]
           [btor1159 unnamed-input-1159]
           [btor1160 (bv->signal (zero-extend (signal-value btor1159) (bitvector 3)) btor1159)]
           [btor1161 unnamed-input-1161]
           [btor1162 (bv->signal (zero-extend (signal-value btor1161) (bitvector 8)) btor1161)]
           [btor1163 unnamed-input-1163]
           [btor1164 (bv->signal (zero-extend (signal-value btor1163) (bitvector 3)) btor1163)]
           [btor1165 unnamed-input-1165]
           [btor1166 (bv->signal (zero-extend (signal-value btor1165) (bitvector 8)) btor1165)]
           [btor1167 unnamed-input-1167]
           [btor1168 (bv->signal (zero-extend (signal-value btor1167) (bitvector 3)) btor1167)]
           [btor1169 unnamed-input-1169]
           [btor1170 (bv->signal (zero-extend (signal-value btor1169) (bitvector 8)) btor1169)]
           [btor1171 unnamed-input-1171]
           [btor1172 (bv->signal (zero-extend (signal-value btor1171) (bitvector 3)) btor1171)]
           [btor1173 (bv->signal (zero-extend (signal-value btor24) (bitvector 1)) btor24)])
      (make-immutable-hash (list (cons 'O5 (signal (signal-value btor537) (hash)))
                                 (cons 'O6 (signal (signal-value btor1112) (hash))))))))
