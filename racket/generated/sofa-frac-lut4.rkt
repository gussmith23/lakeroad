#lang racket/base
(provide sofa-frac-lut4)
(require "../signal.rkt")
(require rosette)
(define sofa-frac-lut4
  (λ (#:in
      (in (bv->signal (constant 'in (bitvector 4))))
      #:mode
      (mode (bv->signal (constant 'mode (bitvector 1))))
      #:mode_inv
      (mode_inv (bv->signal (constant 'mode_inv (bitvector 1))))
      #:sram
      (sram (bv->signal (constant 'sram (bitvector 16))))
      #:sram_inv
      (sram_inv (bv->signal (constant 'sram_inv (bitvector 16))))
      #:name
      (name ""))
    (let* ((merged-input-state-hash (list))
           (init-hash (list))
           (btor1 (bitvector 4))
           (btor2 in)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state in)))
           (btor3 (bitvector 1))
           (btor4 mode)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state mode)))
           (btor5 mode_inv)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state mode_inv)))
           (btor6 (bitvector 16))
           (btor7 sram)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state sram)))
           (btor8 sram_inv)
           (merged-input-state-hash
            (merge-states merged-input-state-hash (signal-state sram_inv)))
           (btor9
            (signal (extract 0 0 (signal-value btor7)) (signal-state btor7)))
           (btor10
            (signal (extract 1 1 (signal-value btor7)) (signal-state btor7)))
           (btor11
            (signal (extract 3 3 (signal-value btor2)) (signal-state btor2)))
           (btor12 (if (bitvector->bool (signal-value btor11)) btor10 btor9))
           (btor13
            (signal (extract 2 2 (signal-value btor7)) (signal-state btor7)))
           (btor14
            (signal (extract 3 3 (signal-value btor7)) (signal-state btor7)))
           (btor15 (if (bitvector->bool (signal-value btor11)) btor14 btor13))
           (btor16
            (signal (extract 2 2 (signal-value btor2)) (signal-state btor2)))
           (btor17 (if (bitvector->bool (signal-value btor16)) btor15 btor12))
           (btor18
            (signal (extract 4 4 (signal-value btor7)) (signal-state btor7)))
           (btor19
            (signal (extract 5 5 (signal-value btor7)) (signal-state btor7)))
           (btor20 (if (bitvector->bool (signal-value btor11)) btor19 btor18))
           (btor21
            (signal (extract 6 6 (signal-value btor7)) (signal-state btor7)))
           (btor22
            (signal (extract 7 7 (signal-value btor7)) (signal-state btor7)))
           (btor23 (if (bitvector->bool (signal-value btor11)) btor22 btor21))
           (btor24 (if (bitvector->bool (signal-value btor16)) btor23 btor20))
           (btor25 (bitvector 2))
           (btor26
            (signal
             (concat (signal-value btor24) (signal-value btor17))
             (list)))
           (btor28
            (signal (extract 1 1 (signal-value btor2)) (signal-state btor2)))
           (btor29 (if (bitvector->bool (signal-value btor28)) btor24 btor17))
           (btor30
            (signal (extract 8 8 (signal-value btor7)) (signal-state btor7)))
           (btor31
            (signal (extract 9 9 (signal-value btor7)) (signal-state btor7)))
           (btor32 (if (bitvector->bool (signal-value btor11)) btor31 btor30))
           (btor33
            (signal (extract 10 10 (signal-value btor7)) (signal-state btor7)))
           (btor34
            (signal (extract 11 11 (signal-value btor7)) (signal-state btor7)))
           (btor35 (if (bitvector->bool (signal-value btor11)) btor34 btor33))
           (btor36 (if (bitvector->bool (signal-value btor16)) btor35 btor32))
           (btor37
            (signal (extract 12 12 (signal-value btor7)) (signal-state btor7)))
           (btor38
            (signal (extract 13 13 (signal-value btor7)) (signal-state btor7)))
           (btor39 (if (bitvector->bool (signal-value btor11)) btor38 btor37))
           (btor40
            (signal (extract 14 14 (signal-value btor7)) (signal-state btor7)))
           (btor41
            (signal (extract 15 15 (signal-value btor7)) (signal-state btor7)))
           (btor42 (if (bitvector->bool (signal-value btor11)) btor41 btor40))
           (btor43 (if (bitvector->bool (signal-value btor16)) btor42 btor39))
           (btor44 (if (bitvector->bool (signal-value btor28)) btor43 btor36))
           (btor45
            (signal
             (concat (signal-value btor44) (signal-value btor29))
             (list)))
           (btor47
            (signal (extract 0 0 (signal-value btor2)) (signal-state btor2)))
           (btor48
            (signal (bvor (signal-value btor47) (signal-value btor4)) (list)))
           (btor49 (if (bitvector->bool (signal-value btor48)) btor44 btor29))
           (btor51
            (bv->signal
             (zero-extend (signal-value btor7) (bitvector 16))
             btor7))
           (btor52
            (bv->signal
             (zero-extend (signal-value btor26) (bitvector 2))
             btor26))
           (btor53
            (bv->signal
             (zero-extend (signal-value btor45) (bitvector 2))
             btor45))
           (btor54
            (bv->signal
             (zero-extend (signal-value btor49) (bitvector 1))
             btor49))
           (btor55
            (bv->signal
             (zero-extend (signal-value btor40) (bitvector 1))
             btor40))
           (btor56
            (bv->signal
             (zero-extend (signal-value btor41) (bitvector 1))
             btor41))
           (btor57
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor58 (bv->signal (bv 0 (bitvector 1))))
           (btor59
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor60
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor61 (bv->signal (bv 1 (bitvector 1))))
           (btor62
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor63
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor64
            (bv->signal
             (zero-extend (signal-value btor42) (bitvector 1))
             btor42))
           (btor65
            (bv->signal
             (zero-extend (signal-value btor40) (bitvector 1))
             btor40))
           (btor66
            (bv->signal
             (zero-extend (signal-value btor41) (bitvector 1))
             btor41))
           (btor67
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor68
            (bv->signal
             (zero-extend (signal-value btor42) (bitvector 1))
             btor42))
           (btor69
            (bv->signal
             (zero-extend (signal-value btor40) (bitvector 1))
             btor40))
           (btor70
            (bv->signal
             (zero-extend (signal-value btor41) (bitvector 1))
             btor41))
           (btor71
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor72
            (bv->signal
             (zero-extend (signal-value btor42) (bitvector 1))
             btor42))
           (btor73
            (bv->signal
             (zero-extend (signal-value btor42) (bitvector 1))
             btor42))
           (btor74
            (bv->signal
             (zero-extend (signal-value btor37) (bitvector 1))
             btor37))
           (btor75
            (bv->signal
             (zero-extend (signal-value btor38) (bitvector 1))
             btor38))
           (btor76
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor77
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor78
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor79
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor80
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor81
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 1))
             btor39))
           (btor82
            (bv->signal
             (zero-extend (signal-value btor37) (bitvector 1))
             btor37))
           (btor83
            (bv->signal
             (zero-extend (signal-value btor38) (bitvector 1))
             btor38))
           (btor84
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor85
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 1))
             btor39))
           (btor86
            (bv->signal
             (zero-extend (signal-value btor37) (bitvector 1))
             btor37))
           (btor87
            (bv->signal
             (zero-extend (signal-value btor38) (bitvector 1))
             btor38))
           (btor88
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor89
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 1))
             btor39))
           (btor90
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 1))
             btor39))
           (btor91
            (bv->signal
             (zero-extend (signal-value btor33) (bitvector 1))
             btor33))
           (btor92
            (bv->signal
             (zero-extend (signal-value btor34) (bitvector 1))
             btor34))
           (btor93
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor94
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor95
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor96
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor97
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor98
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor99
            (bv->signal
             (zero-extend (signal-value btor33) (bitvector 1))
             btor33))
           (btor100
            (bv->signal
             (zero-extend (signal-value btor34) (bitvector 1))
             btor34))
           (btor101
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor102
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor103
            (bv->signal
             (zero-extend (signal-value btor33) (bitvector 1))
             btor33))
           (btor104
            (bv->signal
             (zero-extend (signal-value btor34) (bitvector 1))
             btor34))
           (btor105
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor106
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor107
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor108
            (bv->signal
             (zero-extend (signal-value btor30) (bitvector 1))
             btor30))
           (btor109
            (bv->signal
             (zero-extend (signal-value btor31) (bitvector 1))
             btor31))
           (btor110
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor111
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor112
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor113
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor114
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor115
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 1))
             btor32))
           (btor116
            (bv->signal
             (zero-extend (signal-value btor30) (bitvector 1))
             btor30))
           (btor117
            (bv->signal
             (zero-extend (signal-value btor31) (bitvector 1))
             btor31))
           (btor118
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor119
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 1))
             btor32))
           (btor120
            (bv->signal
             (zero-extend (signal-value btor30) (bitvector 1))
             btor30))
           (btor121
            (bv->signal
             (zero-extend (signal-value btor31) (bitvector 1))
             btor31))
           (btor122
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor123
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 1))
             btor32))
           (btor124
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 1))
             btor32))
           (btor125
            (bv->signal
             (zero-extend (signal-value btor21) (bitvector 1))
             btor21))
           (btor126
            (bv->signal
             (zero-extend (signal-value btor22) (bitvector 1))
             btor22))
           (btor127
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor128
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor129
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor130
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor131
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor132
            (bv->signal
             (zero-extend (signal-value btor23) (bitvector 1))
             btor23))
           (btor133
            (bv->signal
             (zero-extend (signal-value btor21) (bitvector 1))
             btor21))
           (btor134
            (bv->signal
             (zero-extend (signal-value btor22) (bitvector 1))
             btor22))
           (btor135
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor136
            (bv->signal
             (zero-extend (signal-value btor23) (bitvector 1))
             btor23))
           (btor137
            (bv->signal
             (zero-extend (signal-value btor21) (bitvector 1))
             btor21))
           (btor138
            (bv->signal
             (zero-extend (signal-value btor22) (bitvector 1))
             btor22))
           (btor139
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor140
            (bv->signal
             (zero-extend (signal-value btor23) (bitvector 1))
             btor23))
           (btor141
            (bv->signal
             (zero-extend (signal-value btor23) (bitvector 1))
             btor23))
           (btor142
            (bv->signal
             (zero-extend (signal-value btor18) (bitvector 1))
             btor18))
           (btor143
            (bv->signal
             (zero-extend (signal-value btor19) (bitvector 1))
             btor19))
           (btor144
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor145
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor146
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor147
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor148
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor149
            (bv->signal
             (zero-extend (signal-value btor20) (bitvector 1))
             btor20))
           (btor150
            (bv->signal
             (zero-extend (signal-value btor18) (bitvector 1))
             btor18))
           (btor151
            (bv->signal
             (zero-extend (signal-value btor19) (bitvector 1))
             btor19))
           (btor152
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor153
            (bv->signal
             (zero-extend (signal-value btor20) (bitvector 1))
             btor20))
           (btor154
            (bv->signal
             (zero-extend (signal-value btor18) (bitvector 1))
             btor18))
           (btor155
            (bv->signal
             (zero-extend (signal-value btor19) (bitvector 1))
             btor19))
           (btor156
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor157
            (bv->signal
             (zero-extend (signal-value btor20) (bitvector 1))
             btor20))
           (btor158
            (bv->signal
             (zero-extend (signal-value btor20) (bitvector 1))
             btor20))
           (btor159
            (bv->signal
             (zero-extend (signal-value btor13) (bitvector 1))
             btor13))
           (btor160
            (bv->signal
             (zero-extend (signal-value btor14) (bitvector 1))
             btor14))
           (btor161
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor162
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor163
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor164
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor165
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor166
            (bv->signal
             (zero-extend (signal-value btor15) (bitvector 1))
             btor15))
           (btor167
            (bv->signal
             (zero-extend (signal-value btor13) (bitvector 1))
             btor13))
           (btor168
            (bv->signal
             (zero-extend (signal-value btor14) (bitvector 1))
             btor14))
           (btor169
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor170
            (bv->signal
             (zero-extend (signal-value btor15) (bitvector 1))
             btor15))
           (btor171
            (bv->signal
             (zero-extend (signal-value btor13) (bitvector 1))
             btor13))
           (btor172
            (bv->signal
             (zero-extend (signal-value btor14) (bitvector 1))
             btor14))
           (btor173
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor174
            (bv->signal
             (zero-extend (signal-value btor15) (bitvector 1))
             btor15))
           (btor175
            (bv->signal
             (zero-extend (signal-value btor15) (bitvector 1))
             btor15))
           (btor176
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor177
            (bv->signal
             (zero-extend (signal-value btor10) (bitvector 1))
             btor10))
           (btor178
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor179
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor180
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor181
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor182
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor183
            (bv->signal
             (zero-extend (signal-value btor12) (bitvector 1))
             btor12))
           (btor184
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor185
            (bv->signal
             (zero-extend (signal-value btor10) (bitvector 1))
             btor10))
           (btor186
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor187
            (bv->signal
             (zero-extend (signal-value btor12) (bitvector 1))
             btor12))
           (btor188
            (bv->signal
             (zero-extend (signal-value btor9) (bitvector 1))
             btor9))
           (btor189
            (bv->signal
             (zero-extend (signal-value btor10) (bitvector 1))
             btor10))
           (btor190
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor191
            (bv->signal
             (zero-extend (signal-value btor12) (bitvector 1))
             btor12))
           (btor192
            (bv->signal
             (zero-extend (signal-value btor12) (bitvector 1))
             btor12))
           (btor193
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 1))
             btor39))
           (btor194
            (bv->signal
             (zero-extend (signal-value btor42) (bitvector 1))
             btor42))
           (btor195
            (bv->signal
             (zero-extend (signal-value btor16) (bitvector 1))
             btor16))
           (btor196
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor197
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor198
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor199
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor200
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor201
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 1))
             btor39))
           (btor202
            (bv->signal
             (zero-extend (signal-value btor42) (bitvector 1))
             btor42))
           (btor203
            (bv->signal
             (zero-extend (signal-value btor16) (bitvector 1))
             btor16))
           (btor204
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor205
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 1))
             btor39))
           (btor206
            (bv->signal
             (zero-extend (signal-value btor42) (bitvector 1))
             btor42))
           (btor207
            (bv->signal
             (zero-extend (signal-value btor16) (bitvector 1))
             btor16))
           (btor208
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor209
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor210
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 1))
             btor32))
           (btor211
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor212
            (bv->signal
             (zero-extend (signal-value btor16) (bitvector 1))
             btor16))
           (btor213
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor214
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor215
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor216
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor217
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor218
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 1))
             btor32))
           (btor219
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor220
            (bv->signal
             (zero-extend (signal-value btor16) (bitvector 1))
             btor16))
           (btor221
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor222
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 1))
             btor32))
           (btor223
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor224
            (bv->signal
             (zero-extend (signal-value btor16) (bitvector 1))
             btor16))
           (btor225
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor226
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor227
            (bv->signal
             (zero-extend (signal-value btor20) (bitvector 1))
             btor20))
           (btor228
            (bv->signal
             (zero-extend (signal-value btor23) (bitvector 1))
             btor23))
           (btor229
            (bv->signal
             (zero-extend (signal-value btor16) (bitvector 1))
             btor16))
           (btor230
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor231
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor232
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor233
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor234
            (bv->signal
             (zero-extend (signal-value btor24) (bitvector 1))
             btor24))
           (btor235
            (bv->signal
             (zero-extend (signal-value btor20) (bitvector 1))
             btor20))
           (btor236
            (bv->signal
             (zero-extend (signal-value btor23) (bitvector 1))
             btor23))
           (btor237
            (bv->signal
             (zero-extend (signal-value btor16) (bitvector 1))
             btor16))
           (btor238
            (bv->signal
             (zero-extend (signal-value btor24) (bitvector 1))
             btor24))
           (btor239
            (bv->signal
             (zero-extend (signal-value btor20) (bitvector 1))
             btor20))
           (btor240
            (bv->signal
             (zero-extend (signal-value btor23) (bitvector 1))
             btor23))
           (btor241
            (bv->signal
             (zero-extend (signal-value btor16) (bitvector 1))
             btor16))
           (btor242
            (bv->signal
             (zero-extend (signal-value btor24) (bitvector 1))
             btor24))
           (btor243
            (bv->signal
             (zero-extend (signal-value btor24) (bitvector 1))
             btor24))
           (btor244
            (bv->signal
             (zero-extend (signal-value btor12) (bitvector 1))
             btor12))
           (btor245
            (bv->signal
             (zero-extend (signal-value btor15) (bitvector 1))
             btor15))
           (btor246
            (bv->signal
             (zero-extend (signal-value btor16) (bitvector 1))
             btor16))
           (btor247
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor248
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor249
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor250
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor251
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 1))
             btor17))
           (btor252
            (bv->signal
             (zero-extend (signal-value btor12) (bitvector 1))
             btor12))
           (btor253
            (bv->signal
             (zero-extend (signal-value btor15) (bitvector 1))
             btor15))
           (btor254
            (bv->signal
             (zero-extend (signal-value btor16) (bitvector 1))
             btor16))
           (btor255
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 1))
             btor17))
           (btor256
            (bv->signal
             (zero-extend (signal-value btor12) (bitvector 1))
             btor12))
           (btor257
            (bv->signal
             (zero-extend (signal-value btor15) (bitvector 1))
             btor15))
           (btor258
            (bv->signal
             (zero-extend (signal-value btor16) (bitvector 1))
             btor16))
           (btor259
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 1))
             btor17))
           (btor260
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 1))
             btor17))
           (btor261
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor262
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor263
            (bv->signal
             (zero-extend (signal-value btor28) (bitvector 1))
             btor28))
           (btor264
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor265
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor266
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor267
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor268
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 1))
             btor44))
           (btor269
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor270
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor271
            (bv->signal
             (zero-extend (signal-value btor28) (bitvector 1))
             btor28))
           (btor272
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 1))
             btor44))
           (btor273
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor274
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor275
            (bv->signal
             (zero-extend (signal-value btor28) (bitvector 1))
             btor28))
           (btor276
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 1))
             btor44))
           (btor277
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 1))
             btor44))
           (btor278
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 1))
             btor17))
           (btor279
            (bv->signal
             (zero-extend (signal-value btor24) (bitvector 1))
             btor24))
           (btor280
            (bv->signal
             (zero-extend (signal-value btor28) (bitvector 1))
             btor28))
           (btor281
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor282
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor283
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor284
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor285
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor286
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 1))
             btor17))
           (btor287
            (bv->signal
             (zero-extend (signal-value btor24) (bitvector 1))
             btor24))
           (btor288
            (bv->signal
             (zero-extend (signal-value btor28) (bitvector 1))
             btor28))
           (btor289
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor290
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 1))
             btor17))
           (btor291
            (bv->signal
             (zero-extend (signal-value btor24) (bitvector 1))
             btor24))
           (btor292
            (bv->signal
             (zero-extend (signal-value btor28) (bitvector 1))
             btor28))
           (btor293
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor294
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor295
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor296
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 1))
             btor44))
           (btor297
            (bv->signal
             (zero-extend (signal-value btor48) (bitvector 1))
             btor48))
           (btor298
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor299
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor300
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor301
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor302
            (bv->signal
             (zero-extend (signal-value btor49) (bitvector 1))
             btor49))
           (btor303
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor304
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 1))
             btor44))
           (btor305
            (bv->signal
             (zero-extend (signal-value btor48) (bitvector 1))
             btor48))
           (btor306
            (bv->signal
             (zero-extend (signal-value btor49) (bitvector 1))
             btor49))
           (btor307
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor308
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 1))
             btor44))
           (btor309
            (bv->signal
             (zero-extend (signal-value btor48) (bitvector 1))
             btor48))
           (btor310
            (bv->signal
             (zero-extend (signal-value btor49) (bitvector 1))
             btor49))
           (btor311
            (bv->signal
             (zero-extend (signal-value btor49) (bitvector 1))
             btor49))
           (btor312
            (bv->signal
             (zero-extend (signal-value btor24) (bitvector 1))
             btor24))
           (btor313
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor314
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor315
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor316
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor317
            (bv->signal
             (zero-extend (signal-value btor24) (bitvector 1))
             btor24))
           (btor318
            (bv->signal
             (zero-extend (signal-value btor24) (bitvector 1))
             btor24))
           (btor319
            (bv->signal
             (zero-extend (signal-value btor24) (bitvector 1))
             btor24))
           (btor320
            (bv->signal
             (zero-extend (signal-value btor24) (bitvector 1))
             btor24))
           (btor321
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 1))
             btor17))
           (btor322
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor323
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor324
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor325
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor326
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 1))
             btor17))
           (btor327
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 1))
             btor17))
           (btor328
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 1))
             btor17))
           (btor329
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 1))
             btor17))
           (btor330
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 1))
             btor44))
           (btor331
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor332
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor333
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor334
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor335
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 1))
             btor44))
           (btor336
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 1))
             btor44))
           (btor337
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 1))
             btor44))
           (btor338
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 1))
             btor44))
           (btor339
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor340
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor341
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor342
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor343
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor344
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor345
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor346
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor347
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor348
            (bv->signal
             (zero-extend (signal-value btor49) (bitvector 1))
             btor49))
           (btor349
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor350
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor351
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor352
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor353
            (bv->signal
             (zero-extend (signal-value btor49) (bitvector 1))
             btor49))
           (btor354
            (bv->signal
             (zero-extend (signal-value btor49) (bitvector 1))
             btor49))
           (btor355
            (bv->signal
             (zero-extend (signal-value btor49) (bitvector 1))
             btor49))
           (btor356
            (bv->signal
             (zero-extend (signal-value btor49) (bitvector 1))
             btor49))
           (btor357
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor358
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor359
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor360
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor361
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor362
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor363
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor364
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor365
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor366
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor367
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor368
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor369
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor370
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor371
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor372
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor373
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor374
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor375
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor376
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor377
            (bv->signal
             (zero-extend (signal-value btor42) (bitvector 1))
             btor42))
           (btor378
            (bv->signal
             (zero-extend (signal-value btor24) (bitvector 1))
             btor24))
           (btor379
            (bv->signal
             (zero-extend (signal-value btor17) (bitvector 1))
             btor17))
           (btor380
            (bv->signal
             (zero-extend (signal-value btor44) (bitvector 1))
             btor44))
           (btor381
            (bv->signal
             (zero-extend (signal-value btor29) (bitvector 1))
             btor29))
           (btor382
            (bv->signal
             (zero-extend (signal-value btor49) (bitvector 1))
             btor49))
           (btor383
            (bv->signal
             (zero-extend (signal-value btor39) (bitvector 1))
             btor39))
           (btor384
            (bv->signal
             (zero-extend (signal-value btor35) (bitvector 1))
             btor35))
           (btor385
            (bv->signal
             (zero-extend (signal-value btor32) (bitvector 1))
             btor32))
           (btor386
            (bv->signal
             (zero-extend (signal-value btor23) (bitvector 1))
             btor23))
           (btor387
            (bv->signal
             (zero-extend (signal-value btor20) (bitvector 1))
             btor20))
           (btor388
            (bv->signal
             (zero-extend (signal-value btor15) (bitvector 1))
             btor15))
           (btor389
            (bv->signal
             (zero-extend (signal-value btor12) (bitvector 1))
             btor12))
           (btor390
            (bv->signal
             (zero-extend (signal-value btor43) (bitvector 1))
             btor43))
           (btor391
            (bv->signal
             (zero-extend (signal-value btor36) (bitvector 1))
             btor36))
           (btor392 (bitvector 3))
           (btor393
            (signal (extract 3 1 (signal-value btor2)) (signal-state btor2)))
           (btor394
            (signal
             (concat (signal-value btor393) (signal-value btor48))
             (list)))
           (btor395
            (bv->signal
             (zero-extend (signal-value btor394) (bitvector 4))
             btor394))
           (btor396
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor397
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor398
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor399
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor400
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor401
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor402
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor403
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor404
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor405
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor406
            (bv->signal
             (zero-extend (signal-value btor16) (bitvector 1))
             btor16))
           (btor407
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor408
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor409
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor410
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor411
            (bv->signal
             (zero-extend (signal-value btor16) (bitvector 1))
             btor16))
           (btor412
            (bv->signal
             (zero-extend (signal-value btor16) (bitvector 1))
             btor16))
           (btor413
            (bv->signal
             (zero-extend (signal-value btor16) (bitvector 1))
             btor16))
           (btor414
            (bv->signal
             (zero-extend (signal-value btor16) (bitvector 1))
             btor16))
           (btor415
            (bv->signal
             (zero-extend (signal-value btor16) (bitvector 1))
             btor16))
           (btor416
            (bv->signal
             (zero-extend (signal-value btor28) (bitvector 1))
             btor28))
           (btor417
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor418
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor419
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor420
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor421
            (bv->signal
             (zero-extend (signal-value btor28) (bitvector 1))
             btor28))
           (btor422
            (bv->signal
             (zero-extend (signal-value btor28) (bitvector 1))
             btor28))
           (btor423
            (bv->signal
             (zero-extend (signal-value btor28) (bitvector 1))
             btor28))
           (btor424
            (bv->signal
             (zero-extend (signal-value btor28) (bitvector 1))
             btor28))
           (btor425
            (bv->signal
             (zero-extend (signal-value btor28) (bitvector 1))
             btor28))
           (btor426
            (bv->signal
             (zero-extend (signal-value btor48) (bitvector 1))
             btor48))
           (btor427
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor428
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor429
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor430
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor431
            (bv->signal
             (zero-extend (signal-value btor48) (bitvector 1))
             btor48))
           (btor432
            (bv->signal
             (zero-extend (signal-value btor48) (bitvector 1))
             btor48))
           (btor433
            (bv->signal
             (zero-extend (signal-value btor48) (bitvector 1))
             btor48))
           (btor434
            (bv->signal
             (zero-extend (signal-value btor48) (bitvector 1))
             btor48))
           (btor435
            (bv->signal
             (zero-extend (signal-value btor48) (bitvector 1))
             btor48))
           (btor436
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor437
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor438
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor439
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor440
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor441
            (bv->signal
             (zero-extend (signal-value btor11) (bitvector 1))
             btor11))
           (btor442
            (bv->signal
             (zero-extend (signal-value btor16) (bitvector 1))
             btor16))
           (btor443
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor444
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor445
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor446
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor447
            (bv->signal
             (zero-extend (signal-value btor16) (bitvector 1))
             btor16))
           (btor448
            (bv->signal
             (zero-extend (signal-value btor28) (bitvector 1))
             btor28))
           (btor449
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor450
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor451
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor452
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor453
            (bv->signal
             (zero-extend (signal-value btor28) (bitvector 1))
             btor28))
           (btor454
            (bv->signal
             (zero-extend (signal-value btor48) (bitvector 1))
             btor48))
           (btor455
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor456
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor457
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor458
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor459
            (bv->signal
             (zero-extend (signal-value btor48) (bitvector 1))
             btor48))
           (btor460
            (bv->signal
             (zero-extend (signal-value btor4) (bitvector 1))
             btor4))
           (btor461
            (bv->signal
             (zero-extend (signal-value btor47) (bitvector 1))
             btor47))
           (btor462
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor463
            (bv->signal
             (zero-extend (signal-value btor58) (bitvector 1))
             btor58))
           (btor464
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor465
            (bv->signal
             (zero-extend (signal-value btor61) (bitvector 1))
             btor61))
           (btor466
            (bv->signal
             (zero-extend (signal-value btor48) (bitvector 1))
             btor48))
           (btor467
            (bv->signal
             (zero-extend (signal-value btor4) (bitvector 1))
             btor4))
           (btor468
            (bv->signal
             (zero-extend (signal-value btor47) (bitvector 1))
             btor47))
           (btor469
            (bv->signal
             (zero-extend (signal-value btor48) (bitvector 1))
             btor48))
           (btor470
            (bv->signal
             (zero-extend (signal-value btor48) (bitvector 1))
             btor48))
           (btor471
            (bv->signal
             (zero-extend (signal-value btor48) (bitvector 1))
             btor48))
           (output-state
            (remove-duplicates
             (append (list) merged-input-state-hash)
             equal?
             #:key
             car)))
      (list
       (cons 'lut3_out (signal (signal-value btor45) output-state))
       (cons 'lut4_out (signal (signal-value btor49) output-state))
       (cons 'lut2_out (signal (signal-value btor26) output-state))))))
