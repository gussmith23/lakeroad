// RUN: outfile=$(mktemp)
// RUN: (racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver cvc5 \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal out:18 \
// RUN:  --initiation-interval 3 \
// RUN:  --clock-name clk \
// RUN:  --module-name test_module \
// RUN:  --input-signal a:18 \
// RUN:  --input-signal b:18 \
// RUN:  --input-signal c:18 \
// RUN:  --timeout 90 \
// RUN:  --extra-cycles 2 \
// RUN:  || true) \
// RUN:  > $outfile \
// RUN:  2>&1
// RUN: FileCheck %s < $outfile
// if [ -z ${LAKEROAD_PRIVATE_DIR+x} ]; then \
//   echo "Warning: LAKEROAD_PRIVATE_DIR is not set. Skipping simulation."; \
//   exit 0; \
// else \
//   python3 $LAKEROAD_DIR/bin/simulate_with_verilator.py \
//    --test_module_name test_module \
//    --ground_truth_module_name top \
//    --max_num_tests=10000 \
//    --verilog_filepath $outfile \
//    --verilog_filepath %s \
//    --clock_name clk \
//    --initiation_interval 3 \
//    --output_signal out:18 \
//    --input_signal a:18 \
//    --input_signal b:18 \
//    --input_signal c:18 \
//    --verilator_include_dir "$LAKEROAD_PRIVATE_DIR/DSP48E2/" \
//    --verilator_extra_arg='-DXIL_XECLIB' \
//    --verilator_extra_arg='-Wno-UNOPTFLAT' \
//    --verilator_extra_arg='-Wno-LATCH' \
//    --verilator_extra_arg='-Wno-WIDTH' \
//    --verilator_extra_arg='-Wno-STMTDLY' \
//    --verilator_extra_arg='-Wno-CASEX' \
//    --verilator_extra_arg='-Wno-TIMESCALEMOD' \
//    --verilator_extra_arg='-Wno-PINMISSING'; \
// fi

(* use_dsp = "yes" *) module top(
    input signed [17:0] a,
    input signed [17:0] b,
    input signed [17:0] c,
    output [17:0] out,
    input clk
);

  logic signed [35:0] stage0;
  logic signed [35:0] stage1;
  logic signed [35:0] stage2;

  always @(posedge clk) begin
    stage0 <= (a * b) + c;
    stage1 <= stage0;
    stage2 <= stage1;
  end

  assign out = stage2;
endmodule

// CHECK: Synthesis Timeout
