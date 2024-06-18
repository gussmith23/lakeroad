#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

"$SCRIPT_DIR/../bin/lakeroad" \
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
 --input-signal a:11 \
 --input-signal b:11 \
 --input-signal c:11 \
 --input-signal d:11 \
 --extra-cycles 3 \
 --timeout 120
