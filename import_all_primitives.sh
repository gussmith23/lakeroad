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