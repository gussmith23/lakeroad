set -e
set -u

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

lit -v $SCRIPT_DIR/lakeroad/xilinx-virtex
