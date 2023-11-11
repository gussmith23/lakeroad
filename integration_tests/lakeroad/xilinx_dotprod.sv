// RUN: outfile=$(mktemp)
// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver boolector \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture xilinx-ultrascale-plus \
// RUN:  --template dotprod \
// RUN:  --out-format verilog \
// RUN:  --top-module-name DotProduct \
// RUN:  --verilog-module-out-signal result:4 \
// RUN:  --initiation-interval 0 \
// RUN:  --module-name DotProduct \
// RUN:  --input-signal x0:2 \
// RUN:  --input-signal x1:2 \
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
// RUN:    --initiation_interval 0 \
// RUN:    --output_signal_name result \
// RUN:    --input_signal x0:2 \
// RUN:    --input_signal x1:2 \
// RUN:    --verilator_include_dir "$LAKEROAD_PRIVATE_DIR/CFGLUT5/" \
// RUN:    --verilator_include_dir "$LAKEROAD_DIR/verilog/simulation/xilinx-ultrascale-plus/" \
// RUN:    --verilator_extra_arg='-DXIL_XECLIB' \
// RUN:    --verilator_extra_arg='-Wno-UNOPTFLAT' \
// RUN:    --verilator_extra_arg='-Wno-LATCH' \
// RUN:    --verilator_extra_arg='-Wno-WIDTH' \
// RUN:    --verilator_extra_arg='-Wno-STMTDLY' \
// RUN:    --verilator_extra_arg='-Wno-CASEX' \
// RUN:    --verilator_extra_arg='-Wno-TIMESCALEMOD' \
// RUN:    --verilator_extra_arg='-Wno-PINMISSING'; \
// RUN: fi

module DotProduct(
    input signed [1:0] x0,
    input signed [1:0] x1,
    output signed [3:0] result
);
    logic signed [1:0] c0 = -2;
    logic signed [1:0] c1 = 1;
    assign result = c0 * x0 + c1 * x1;


endmodule

// CHECK: module DotProduct(result, x0, x1);
// CHECK:   CFGLUT5 #(
// CHECK: endmodule
