// RUN: outfile=$(mktemp)
// RUN: (racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template experimental-two-dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name mul \
// RUN:  --verilog-module-out-signal out:32 \
// RUN:  --pipeline-depth 0 \
// RUN:  --module-name top \
// RUN:  --input-signal 'a:(port b 32):32' \
// RUN:  --input-signal 'b:(port a 16):16' \
// RUN:  --timeout 90 \
// RUN:  --extra-cycles 3 \
// RUN:  || true) \
// RUN:  > $outfile \
// RUN:  2>&1
// RUN: FileCheck %s < $outfile

module mul(input [15:0] a, input [31:0] b, output [31:0] out);
  assign out = a * b;
endmodule

// CHECK: Synthesis Timeout