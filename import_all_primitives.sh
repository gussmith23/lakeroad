#!/bin/bash
#
# Helper script which imports all primitives and writes their corresponding
# Racket to racket/generated/.


if [[ -z "${LAKEROAD_DIR}" ]]; then 
  echo "LAKEROAD_DIR is not set"
  exit 1
fi

# We save into $out and then echo $out into a file because just using > causes
# the .rkt file to be emptied out, which then causes Lakeroad's Racket files not
# to load. It's probably due to some incorrect chain of dependencies.

out=$($LAKEROAD_DIR/bin/verilog_to_racket.py \
  --infile $LAKEROAD_DIR/modules_for_importing/lattice_ecp5/CCU2C.v \
  --top CCU2C \
  --function-name lattice-ecp5-ccu2c \
  | sed 's#(require (file.*#(require "../signal.rkt\")#' )
echo "$out" > $LAKEROAD_DIR/racket/generated/lattice-ecp5-ccu2c.rkt

out=$($LAKEROAD_DIR/bin/verilog_to_racket.py \
  --infile $LAKEROAD_DIR/modules_for_importing/lattice_ecp5/LUT2.v \
  --top LUT2 \
  --function-name lattice-ecp5-lut2 \
  | sed 's#(require (file.*#(require "../signal.rkt\")#' )
echo "$out" > $LAKEROAD_DIR/racket/generated/lattice-ecp5-lut2.rkt

out=$($LAKEROAD_DIR/bin/verilog_to_racket.py \
  --infile $LAKEROAD_DIR/modules_for_importing/lattice_ecp5/LUT4.v \
  --top LUT4 \
  --function-name lattice-ecp5-lut4 \
  | sed 's#(require (file.*#(require "../signal.rkt\")#' )
echo "$out" > $LAKEROAD_DIR/racket/generated/lattice-ecp5-lut4.rkt
  
out=$($LAKEROAD_DIR/bin/verilog_to_racket.py \
  --infile $LAKEROAD_DIR/modules_for_importing/SOFA/frac_lut4.v \
  --top frac_lut4 \
  --function-name sofa-frac-lut4 \
  --include $LAKEROAD_DIR/SOFA_modules/ \
  --include $LAKEROAD_DIR/skywater-pdk-libs-sky130_fd_sc_hd/cells/mux2 \
  --include $LAKEROAD_DIR/skywater-pdk-libs-sky130_fd_sc_hd/cells/or2 \
  --include $LAKEROAD_DIR/skywater-pdk-libs-sky130_fd_sc_hd/models/udp_mux_2to1 \
  --include $LAKEROAD_DIR/skywater-pdk-libs-sky130_fd_sc_hd/cells/buf \
  --include $LAKEROAD_DIR/skywater-pdk-libs-sky130_fd_sc_hd/cells/inv \
  --define SKY130_FD_SC_HD__UDP_MUX_2TO1_LAKEROAD_HACK \
  --define NO_PRIMITIVES \
  --define FUNCTIONAL \
  | sed 's#(require (file.*#(require "../signal.rkt\")#' )
echo "$out" > $LAKEROAD_DIR/racket/generated/sofa-frac-lut4.rkt

out=$($LAKEROAD_DIR/bin/verilog_to_racket.py \
  --infile $LAKEROAD_DIR/modules_for_importing/xilinx_ultrascale_plus/CARRY8.v \
  --top CARRY8 \
  --function-name xilinx-ultrascale-plus-carry8 \
  | sed 's#(require (file.*#(require "../signal.rkt\")#' )
echo "$out" > $LAKEROAD_DIR/racket/generated/xilinx-ultrascale-plus-carry8.rkt

out=$($LAKEROAD_DIR/bin/verilog_to_racket.py \
  --infile $LAKEROAD_DIR/modules_for_importing/xilinx_ultrascale_plus/DSP48E2.v \
  --top DSP48E2 \
  --define XIL_XECLIB \
  --function-name xilinx-ultrascale-plus-dsp48e2 \
  | sed 's#(require (file.*#(require "../signal.rkt\")#' )
echo "$out" > $LAKEROAD_DIR/racket/generated/xilinx-ultrascale-plus-dsp48e2.rkt

out=$($LAKEROAD_DIR/bin/verilog_to_racket.py \
  --infile $LAKEROAD_DIR/modules_for_importing/xilinx_ultrascale_plus/LUT6_2.v \
  --top LUT6_2 \
  --function-name xilinx-ultrascale-plus-lut6-2 \
  | sed 's#(require (file.*#(require "../signal.rkt\")#' )
echo "$out" > $LAKEROAD_DIR/racket/generated/xilinx-ultrascale-plus-lut6-2.rkt

out=$($LAKEROAD_DIR/bin/verilog_to_racket.py \
  --infile $LAKEROAD_DIR/modules_for_importing/xilinx_ultrascale_plus/LUT6.v \
  --top LUT6 \
  --function-name xilinx-ultrascale-plus-lut6 \
  | sed 's#(require (file.*#(require "../signal.rkt\")#' )
echo "$out" > $LAKEROAD_DIR/racket/generated/xilinx-ultrascale-plus-lut6.rkt

if [ -z ${LAKEROAD_PRIVATE_DIR+x} ]; then 
  echo "not importing module as LAKEROAD_PRIVATE_DIR is not set"
else 
  out=$("$LAKEROAD_DIR"/bin/verilog_to_racket.py \
    --infile "$LAKEROAD_PRIVATE_DIR"/lattice_ecp5/modified_ALU54B.v \
    --top ALU54B \
    --function-name lattice-ecp5-alu54b \
    | sed 's#(require (file.*#(require "../signal.rkt\")#' )
  echo "$out" > "$LAKEROAD_DIR"/racket/generated/lattice-ecp5-alu54b.rkt
fi

if [ -z ${LAKEROAD_PRIVATE_DIR+x} ]; then 
  echo "not importing module as LAKEROAD_PRIVATE_DIR is not set"
else 
  out=$("$LAKEROAD_DIR"/bin/verilog_to_racket.py \
    --infile "$LAKEROAD_PRIVATE_DIR"/lattice_ecp5/ALU54A_modified_for_racket_import.v \
    --top ALU54A \
    --function-name lattice-ecp5-alu54a \
    | sed 's#(require (file.*#(require "../signal.rkt\")#' )
  echo "$out" > "$LAKEROAD_DIR"/racket/generated/lattice-ecp5-alu54a.rkt
fi
