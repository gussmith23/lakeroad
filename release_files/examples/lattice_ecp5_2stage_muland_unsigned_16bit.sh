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
 --verilog-module-filepath "$SCRIPT_DIR/verilog/lattice_ecp5_2stage_muland_unsigned_16bit.sv" \
 --architecture lattice-ecp5 \
 --template dsp \
 --out-format verilog \
 --top-module-name top \
 --verilog-module-out-signal p:16 \
 --pipeline-depth 2 \
 --clock-name clk \
 --module-name test_module \
 --input-signal 'a:(port a 16):16' \
 --input-signal 'b:(port b 16):16' \
 --input-signal 'c:(port c 16):16' \
 --timeout 90 \
 --extra-cycles 3

>&2 echo

# If Yosys is present and the plugin is built, also run synthesis using Yosys.
if command -v yosys &> /dev/null && [ -f "$SCRIPT_DIR/../yosys-plugin/lakeroad.so" ]; then
  >&2 echo "Running Yosys synthesis with Lakeroad plugin..."
  yosys -m "$SCRIPT_DIR/../yosys-plugin/lakeroad.so" -p "
    read_verilog -sv "$SCRIPT_DIR/verilog/lattice_ecp5_2stage_muland_unsigned_16bit_yosys_annotations.sv";
    hierarchy -top top;
    lakeroad top;
    write_verilog"
else 
  >&2 echo "Yosys or Lakeroad plugin not found, skipping synthesis with Yosys. See README.md for instructions on how to build the plugin."
fi