// RUN: logfile=$(mktemp)
// RUN: if python3 $LAKEROAD_DIR/bin/simulate_with_verilator.py \
// RUN:   --verilog_filepath %s \
// RUN:   --input_signal a:1 \
// RUN:   --input_signal b:1 \
// RUN:   --clock_name clk \
// RUN:   --initiation_interval 2 \
// RUN:   --output_signal c:1 \
// RUN:   --test_module_name test_module \
// RUN:   --ground_truth_module_name ground_truth_module \
// RUN:   --verilator_extra_arg="-Wno-MULTITOP" \
// RUN:   --testbench_stdout_log_filepath $logfile ; then \
// RUN:   echo "Simulation succeeded unexpectedly" ; exit 1 ; fi
// RUN: FileCheck %s < $logfile

module test_module(input clk, input a, input b, output c);
  logic r0, r1;
  always @ (posedge clk) begin
    r0 <= a & b & 0;
    r1 <= r0;
  end
  assign c = r1;
endmodule

module ground_truth_module(input clk, input a, input b, output c);
  logic r0, r1;
  always @ (posedge clk) begin
    r0 <= ~(~a | ~b) & 0;
    r1 <= r0;
  end
  assign c = r1;
endmodule

// CHECK: Aborting...