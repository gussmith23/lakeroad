// RUN: outfile=$(mktemp)
// RUN: racket $LAKEROAD_DIR/bin/main.rkt \
// RUN:  --solver yices \
// RUN:  --verilog-module-filepath %s \
// RUN:  --architecture intel-cyclone10lp \
// RUN:  --template dsp \
// RUN:  --out-format verilog \
// RUN:  --top-module-name top \
// RUN:  --verilog-module-out-signal p:18 \
// RUN:  --module-name test_module \
// RUN:  --input-signal a:18 \
// RUN:  --input-signal b:18 \
// RUN:  --timeout 120 \
// RUN:  --simulate-with-verilator \
// RUN:  > $outfile
// RUN: FileCheck %s < $outfile
// RUN: if [ -z ${LAKEROAD_PRIVATE_DIR+x} ]; then \
// RUN:   echo "Warning: LAKEROAD_PRIVATE_DIR is not set. Skipping simulation."; \
// RUN:   exit 0; \
// RUN: else \
// RUN:   python3 $LAKEROAD_DIR/bin/simulate_with_verilator.py \
// RUN:    --test_module_name test_module \  handled
// RUN:    --ground_truth_module_name top \  handled
// RUN:    --output_signal p:18 \             handled
// RUN:    --max_num_tests=10000 \          not handled
// RUN:    --verilog_filepath $outfile \        handled
// RUN:    --verilog_filepath %s \              handled
// RUN:    --initiation_interval 0 \           handled
// RUN:    --input_signal a:18 \             handled
// RUN:    --input_signal b:18 \              handled
// RUN:    --verilator_include_dir "$LAKEROAD_PRIVATE_DIR/intel_cyclone10lp/" \       everything below not handled
// RUN:    --verilator_extra_arg='-Wno-LATCH' \
// RUN:    --verilator_extra_arg='-Wno-INITIALDLY' \
// RUN:    --verilator_extra_arg='-Wno-COMBDLY' \
// RUN:    --verilator_extra_arg='-Wno-TIMESCALEMOD' \
// RUN:    --verilator_extra_arg='-Wno-WIDTH'; \
// RUN: fi
 

module top(input [17:0] a, b, output [17:0] p);

  assign p = a * b;

endmodule

// CHECK: module test_module(a, b, p);
// CHECK:   cyclone10lp_mac_mult #(
// CHECK: endmodule
