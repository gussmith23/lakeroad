#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Check whether the Lakeroad binary is available. If not, set the PATH to
# include the bin directory.
if ! command -v lakeroad &> /dev/null ; then
  >&2 echo "Lakeroad binary not on the path. Updating PATH to include the bin directory. Ensure you put Lakeroad on your PATH before trying to use it."
  PATH="$SCRIPT_DIR/../bin:$PATH"
  >&2 echo "Updated PATH: $PATH"
  >&2 echo
fi

>&2 echo "Running Lakeroad directly from the command line..."
>&2 echo

lakeroad \
 --bitwuzla --stp --yices --cvc5 \
 --verilog-module-filepath "$SCRIPT_DIR/verilog/xilinx_ultrascale_1stage_addmuladd_signed_11bit.sv" \
 --architecture xilinx-ultrascale-plus \
 --template dsp \
 --out-format verilog \
 --top-module-name top \
 --verilog-module-out-signal out:11 \
 --pipeline-depth 1 \
 --clock-name clk \
 --module-name out \
 --input-signal 'a:(port a 11):11' \
 --input-signal 'b:(port b 11):11' \
 --input-signal 'c:(port c 11):11' \
 --input-signal 'd:(port d 11):11' \
 --extra-cycles 3 \
 --timeout 120

>&2 echo

# If Yosys is present and the plugin is built, also run synthesis using Yosys.
if command -v yosys &> /dev/null && [ -f "$SCRIPT_DIR/../yosys-plugin/lakeroad.so" ]; then
  >&2 echo "Running Yosys synthesis with Lakeroad plugin..."
  yosys -m "$SCRIPT_DIR/../yosys-plugin/lakeroad.so" -p "
    read_verilog -sv "$SCRIPT_DIR/verilog/xilinx_ultrascale_1stage_addmuladd_signed_11bit_yosys_annotations.sv";
    hierarchy -top top;
    lakeroad top;
    write_verilog"
else 
  >&2 echo "Yosys or Lakeroad plugin not found, skipping synthesis with Yosys. See README.md for instructions on how to build the plugin."
fi