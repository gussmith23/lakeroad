// RUN: outfile=$(mktemp)
// RUN: yosys -m "$LAKEROAD_DIR/yosys-plugin/lakeroad.so" -p " \
// RUN:  read_verilog %s; \
// RUN:  hierarchy -top in_module; \
// RUN:  lakeroad in_module; \
// RUN:  rename in_module out_module; \
// RUN:  write_verilog $outfile"
// RUN: FileCheck %s < $outfile
// RUN: if [ -z ${LAKEROAD_PRIVATE_DIR+x} ]; then \
// RUN:   echo "Warning: LAKEROAD_PRIVATE_DIR is not set. Skipping simulation."; \
// RUN:   exit 0; \
// RUN: else \
// RUN:   python3 $LAKEROAD_DIR/bin/simulate_with_verilator.py \
// RUN:    --test_module_name out_module \
// RUN:    --ground_truth_module_name in_module \
// RUN:    --max_num_tests=10000 \
// RUN:    --verilog_filepath $outfile \
// RUN:    --verilog_filepath %s \
// RUN:    --pipeline_depth 0 \
// RUN:    --output_signal out:8 \
// RUN:    --input_signal a:8 \
// RUN:    --input_signal b:8 \
// RUN:    --input_signal c:8 \
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

(* template = "dsp" *) 
(* architecture = "xilinx-ultrascale-plus" *) 
(* pipeline_depth = 0 *)
module in_module(
	(* data *)
	input signed [7:0] a,
	(* data *)
	input signed [7:0] b,
	(* data *)
	input signed [7:0] c,
	(* out *)
	output [7:0] out);

	assign out = (a * b) + c;
endmodule

// CHECK: module out_module(a, b, c, out);
// CHECK:   DSP48E2 #(
// CHECK: endmodule
