// RUN: $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver cvc5 \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --verilog-module-filepath %s \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal out:47 \
// RUN:  --input-signal 'a:(extract 46 18 (port a 47)):29' \
// RUN:  --assume '(bvule (port a 47) (bv 140737488355327 47))' \
// RUN:  --input-signal 'b:(extract 17 0 (port a 47)):18' \
// RUN:  --input-signal 'c:(extract 31 0 (port b 47)):47' \
// RUN:  --assume '(bvule (port b 47) (bv 4294967295 47))' \
// RUN:  --template dsp \
// RUN:  --pipeline-depth 0 \
// RUN:  --out-format verilog \
// RUN:  --timeout 120 \
// RUN: | FileCheck %s
    module top(
      
      input [47-1:0] a,
      input [47-1:0] b,
      
      output [47-1:0] out,
    );
      assign out = wire_Expr_47;
      logic [47-1:0] wire_Expr_47 = (wire_Expr_39+wire_Expr_46);
      logic [47-1:0] wire_Expr_46 = b;
      logic [47-1:0] wire_Expr_39 = a;
      
    
    
    endmodule

// CHECK: module top(a, b, out);
// CHECK:   DSP48E2 #(
// CHECK: endmodule