// Synthesis causing a merge failure, from Churchroad. I realized this was
// actually a Churchroad bug, but it was worth keeping the test.
//
// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver cvc5 \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --verilog-module-filepath %s \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal out:32 \
// RUN:  --input-signal 'a:(extract 16 0 (port a 34)):17' \
// RUN:  --assume '(bvule (port a 34) (bv 131071 34))' \
// RUN:  --input-signal 'b:(extract 16 0 (port b 34)):17' \
// RUN:  --assume '(bvule (port b 34) (bv 131071 34))' \
// RUN:  --template dsp \
// RUN:  --pipeline-depth 0 \
// RUN:  --out-format verilog \
// RUN:  --timeout 120 \
// RUN:  --input-signal 'c:(extract 31 0 (port c 32)):32' \
// RUN:  --assume '(bvule (port c 32) (bv 4294967295 32))' \
// RUN: | FileCheck %s

    module top(
      
      input [32-1:0] c,
      input [34-1:0] a,
      input [34-1:0] b,
      
      output [32-1:0] out,
    );
      assign out = wire_Expr_88;
      logic [32-1:0] wire_Expr_88 = (wire_Expr_78+wire_Expr_87);
      logic [32-1:0] wire_Expr_87 = 32'($signed(wire_Expr_86));
      logic [17-1:0] wire_Expr_86 = wire_Expr_85[16:0];
      logic [34-1:0] wire_Expr_85 = wire_Expr_82 >>> wire_Expr_84;
      localparam [34-1:0] wire_Expr_84 = 34'd17;
      logic [34-1:0] wire_Expr_78 = (wire_Expr_75*wire_Expr_77);
      logic [34-1:0] wire_Expr_77 = b;
      logic [34-1:0] wire_Expr_75 = a;
      logic [32-1:0] wire_Expr_82 = c;
endmodule

// CHECK: module top(a, b, c, out);
// CHECK:   DSP48E2 #(