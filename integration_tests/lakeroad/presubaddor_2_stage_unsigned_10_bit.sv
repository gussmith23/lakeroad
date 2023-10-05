// RUN: outfile=$(mktemp)
// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name presubaddor_2_stage_unsigned_10_bit \
// RUN:  --verilog-module-out-signal out:10 \
// RUN:  --initiation-interval 2 \
// RUN:  --clock-name clk \
// RUN:  --module-name presubaddor_2_stage_unsigned_10_bit \
// RUN:  --extra-cycles 3 \
// RUN:  --timeout 120 \
// RUN:  --input-signal a:10 \
// RUN:  --input-signal b:10 \
// RUN:  --input-signal c:10 \
// RUN:  --input-signal d:10 > $outfile
// RUN: FileCheck %s < $outfile
// Ideally, we let people run these tests even without access to
// lakeroad-private. Here, they can run the tests, but they will still pass even
// if simulation doesn't happen. It's not a great solution, but it's what works
// with CI.
// RUN: if [ -z ${LAKEROAD_PRIVATE_DIR+x} ]; then \
// RUN:   echo "Warning: LAKEROAD_PRIVATE_DIR is not set. Skipping simulation."; \
// RUN:   exit 0; \
// RUN: else \
// RUN:   python3 $LAKEROAD_DIR/bin/simulate_with_verilator.py \
// RUN:    --use_random_intermediate_inputs \
// RUN:    --seed=23 \
// RUN:    --max_num_tests=10000 \
// RUN:    --test_module_filepath $outfile \
// RUN:    --ground_truth_module_filepath %s \
// RUN:    --clock_name clk \
// RUN:    --initiation_interval 2 \
// RUN:    --output_signal_name out \
// RUN:    --input_signal a:10 \
// RUN:    --input_signal b:10 \
// RUN:    --input_signal c:10 \
// RUN:    --input_signal d:10 \
// RUN:    --verilator_include_dir "$LAKEROAD_PRIVATE_DIR/DSP48E2/" \
// RUN:    --verilator_extra_arg='-DXIL_XECLIB' \
// RUN:    --verilator_extra_arg='-Wno-UNOPTFLAT' \
// RUN:    --verilator_extra_arg='-Wno-LATCH' \
// RUN:    --verilator_extra_arg='-Wno-WIDTH' \
// RUN:    --verilator_extra_arg='-Wno-STMTDLY' \
// RUN:    --verilator_extra_arg='-Wno-CASEX' \
// RUN:    --verilator_extra_arg='-Wno-TIMESCALEMOD' \
// RUN:    --verilator_extra_arg='-Wno-PINMISSING'; \
// RUN: fi

module presubaddor_2_stage_unsigned_10_bit(
	input  [9:0] a,
	input  [9:0] b,
	input  [9:0] c,
	input  [9:0] d,
	output [9:0] out,
	input clk);

	logic  [9:0] stage0;
	logic  [9:0] stage1;

	always @(posedge clk) begin
	stage0 <= ((d - a) * b) | c;
	stage1 <= stage0;
	end

	assign out = stage1;
endmodule

// CHECK: module presubaddor_2_stage_unsigned_10_bit(a, b, c, clk, d, out);
// CHECK:   DSP48E2 #(
// CHECK: endmodule
