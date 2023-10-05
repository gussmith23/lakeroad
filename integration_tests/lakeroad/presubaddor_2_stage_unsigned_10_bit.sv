// RUN: outfile=$(mktemp)
// RUN: (racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name presubaddor_2_stage_unsigned_10_bit \
// RUN:  --verilog-module-out-signal out:10 \
// RUN:  --initiation-interval 2 \
// RUN:  --clock-name clk \
// RUN:  --module-name test_module \
// RUN:  --extra-cycles 3 \
// RUN:  --timeout 120 \
// RUN:  --input-signal a:10 \
// RUN:  --input-signal b:10 \
// RUN:  --input-signal c:10 \
// RUN:  --input-signal d:10 \
// RUN:  || true) \
// RUN: > $outfile \
// RUN: 2>&1
// RUN: FileCheck %s < $outfile
// Ideally, we let people run these tests even without access to
// lakeroad-private. Here, they can run the tests, but they will still pass even
// if simulation doesn't happen. It's not a great solution, but it's what works
// with CI.
// if [ -z ${LAKEROAD_PRIVATE_DIR+x} ]; then \
//   echo "Warning: LAKEROAD_PRIVATE_DIR is not set. Skipping simulation."; \
//   exit 0; \
// else \
//   python3 $LAKEROAD_DIR/bin/simulate_with_verilator.py \
//    --test_module_name test_module \
//    --ground_truth_module_name presubaddor_2_stage_unsigned_10_bit \
//    --max_num_tests=10000 \
//    --verilog_filepath $outfile \
//    --verilog_filepath %s \
//    --clock_name clk \
//    --initiation_interval 2 \
//    --output_signal out:10 \
//    --input_signal a:10 \
//    --input_signal b:10 \
//    --input_signal c:10 \
//    --input_signal d:10 \
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

module presubaddor_2_stage_unsigned_10_bit(
    input [9:0] a,
    input [9:0] b,
    input [9:0] c,
    input [9:0] d,
    output [9:0] out,
    input clk
);

  logic [9:0] stage0;
  logic [9:0] stage1;

  always @(posedge clk) begin
    stage0 <= ((d - a) * b) | c;
    stage1 <= stage0;
  end

  assign out = stage1;
endmodule

// CHECK: Synthesis Timeout
