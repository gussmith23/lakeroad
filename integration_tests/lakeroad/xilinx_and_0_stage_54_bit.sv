// RUN: outfile=$(mktemp)
// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver bitwuzla \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template parallel-dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal out:54 \
// RUN:  --initiation-interval 1 \
// RUN:  --clock-name clk \
// RUN:  --module-name top \
// RUN:  --input-signal "a:(port a 54):54" \
// RUN:  --input-signal "c:(port b 54):54" \
// RUN:  --timeout 90 \
// RUN:  --port a:54 \
// RUN:  --port b:54 \
// RUN:  > $outfile
// RUN: FileCheck %s < $outfile
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
// RUN:    --initiation_interval 1 \
// RUN:    --output_signal_name out \
// RUN:    --input_signal a:a:54 \
// RUN:    --input_signal c:b:54 \
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

(* use_dsp = "yes" *) module top(
	input signed [53:0] a,
	input signed [53:0] b,
	output [53:0] out,
	input clk);

	logic signed [53:0] stage0;

	always @(posedge clk) begin
	stage0 <= a & b;

	end

	assign out = stage0;
endmodule

// CHECK: module top(a, b, clk, out); 
