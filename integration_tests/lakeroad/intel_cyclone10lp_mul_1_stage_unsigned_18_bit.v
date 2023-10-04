// RUN: outfile=$(mktemp)
// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver cvc5 \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture intel-cyclone10lp \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal p:18 \
// RUN:  --module-name test_module \
// RUN:  --input-signal a:18 \
// RUN:  --input-signal b:18 \
// RUN:  --initiation-interval 1 \
// RUN:  --clock-name clk \
// RUN:  --timeout 60 \
// RUN:  --extra-cycles 3 \
// RUN:  > $outfile
// RUN: FileCheck %s < $outfile
// RUN: if [ -z ${LAKEROAD_PRIVATE_DIR+x} ]; then \
// RUN:   echo "Warning: LAKEROAD_PRIVATE_DIR is not set. Skipping simulation."; \
// RUN:   exit 0; \
// RUN: else \
// RUN:   python3 $LAKEROAD_DIR/bin/simulate_with_verilator.py \
// RUN:    --max_num_tests=10000 \
// RUN:    --verilog_filepath $outfile \
// RUN:    --verilog_filepath %s \
// RUN:    --test_module_name test_module \
// RUN:    --ground_truth_module_name top \
// RUN:    --clock_name clk \
// RUN:    --initiation_interval 1 \
// RUN:    --output_signal p:18 \
// RUN:    --input_signal a:18 \
// RUN:    --input_signal b:18 \
// RUN:    --verilator_include_dir "$LAKEROAD_PRIVATE_DIR/intel_cyclone10lp/" \
// RUN:    --verilator_extra_arg='-Wno-LATCH' \
// RUN:    --verilator_extra_arg='-Wno-INITIALDLY' \
// RUN:    --verilator_extra_arg='-Wno-COMBDLY' \
// RUN:    --verilator_extra_arg='-Wno-TIMESCALEMOD' \
// RUN:    --verilator_extra_arg='-Wno-WIDTH'; \
// RUN: fi
 

module top(input clk, input [17:0] a, b, output [17:0] p);

  logic [17:0] r0;

  always @ (posedge clk) begin
    r0 <= a * b;
  end

  assign p = r0;

endmodule

// CHECK: module test_module(a, b, clk, p);
// CHECK:   cyclone10lp_mac_mult #(
// CHECK: endmodule
