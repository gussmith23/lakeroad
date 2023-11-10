// RUN: logfile=$(mktemp)
// RUN: python3 $LAKEROAD_DIR/bin/simulate_with_verilator.py \
// RUN:   --verilog_filepath %s \
// RUN:   --input_signal a:2 \
// RUN:   --input_signal b:2 \
// RUN:   --clock_name clk \
// RUN:   --initiation_interval 1 \
// RUN:   --output_signal c:2 \
// RUN:   --output_signal d:2 \
// RUN:   --test_module_name test_module \
// RUN:   --ground_truth_module_name ground_truth_module \
// RUN:   --verilator_extra_arg="-Wno-MULTITOP" \
// RUN:   --testbench_stdout_log_filepath $logfile
// RUN: FileCheck %s < $logfile

module test_module(input clk, input [1:0] a, input [1:0] b, output [1:0] c, output [1:0] d);
  logic [1:0] r0_0, r0_1;
  always @ (posedge clk) begin
    r0_0 <= a & b;
    r0_1 <= a | b;
  end
  assign c = r0_0;
  assign d = r0_1;
endmodule

module ground_truth_module(input clk, input [1:0] a, input [1:0] b, output [1:0] c, output [1:0] d);
  logic [1:0] r0_0, r0_1;
  always @ (posedge clk) begin
    r0_0 <= ~(~a | ~b);
    r0_1 <= ~(~a & ~b);
  end
  assign c = r0_0;
  assign d = r0_1;
endmodule

// CHECK: num_inputs =           2, num_test_cases =          16
// CHECK: Inputs: a=0, b=0
// CHECK: Expected outputs: c_ground_truth=0, d_ground_truth=0
// CHECK:   Actual outputs: c_test        =0, d_test        =0
// CHECK: Inputs: a=0, b=1
// CHECK: Expected outputs: c_ground_truth=0, d_ground_truth=1
// CHECK:   Actual outputs: c_test        =0, d_test        =1
// CHECK: Inputs: a=0, b=2
// CHECK: Expected outputs: c_ground_truth=0, d_ground_truth=2
// CHECK:   Actual outputs: c_test        =0, d_test        =2
// CHECK: Inputs: a=0, b=3
// CHECK: Expected outputs: c_ground_truth=0, d_ground_truth=3
// CHECK:   Actual outputs: c_test        =0, d_test        =3
// CHECK: Inputs: a=1, b=0
// CHECK: Expected outputs: c_ground_truth=0, d_ground_truth=1
// CHECK:   Actual outputs: c_test        =0, d_test        =1
// CHECK: Inputs: a=1, b=1
// CHECK: Expected outputs: c_ground_truth=1, d_ground_truth=1
// CHECK:   Actual outputs: c_test        =1, d_test        =1
// CHECK: Inputs: a=1, b=2
// CHECK: Expected outputs: c_ground_truth=0, d_ground_truth=3
// CHECK:   Actual outputs: c_test        =0, d_test        =3
// CHECK: Inputs: a=1, b=3
// CHECK: Expected outputs: c_ground_truth=1, d_ground_truth=3
// CHECK:   Actual outputs: c_test        =1, d_test        =3
// CHECK: Inputs: a=2, b=0
// CHECK: Expected outputs: c_ground_truth=0, d_ground_truth=2
// CHECK:   Actual outputs: c_test        =0, d_test        =2
// CHECK: Inputs: a=2, b=1
// CHECK: Expected outputs: c_ground_truth=0, d_ground_truth=3
// CHECK:   Actual outputs: c_test        =0, d_test        =3
// CHECK: Inputs: a=2, b=2
// CHECK: Expected outputs: c_ground_truth=2, d_ground_truth=2
// CHECK:   Actual outputs: c_test        =2, d_test        =2
// CHECK: Inputs: a=2, b=3
// CHECK: Expected outputs: c_ground_truth=2, d_ground_truth=3
// CHECK:   Actual outputs: c_test        =2, d_test        =3
// CHECK: Inputs: a=3, b=0
// CHECK: Expected outputs: c_ground_truth=0, d_ground_truth=3
// CHECK:   Actual outputs: c_test        =0, d_test        =3
// CHECK: Inputs: a=3, b=1
// CHECK: Expected outputs: c_ground_truth=1, d_ground_truth=3
// CHECK:   Actual outputs: c_test        =1, d_test        =3
// CHECK: Inputs: a=3, b=2
// CHECK: Expected outputs: c_ground_truth=2, d_ground_truth=3
// CHECK:   Actual outputs: c_test        =2, d_test        =3
// CHECK: Inputs: a=3, b=3
// CHECK: Expected outputs: c_ground_truth=3, d_ground_truth=3
// CHECK:   Actual outputs: c_test        =3, d_test        =3