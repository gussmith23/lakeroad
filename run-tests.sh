set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

LAKEROAD_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
declare -rx LAKEROAD_DIR

if [ -z ${LLVM_CONFIG+x}]; then
    echo "LLVM_CONFIG is unset"
    exit 1
fi

pushd "$LAKEROAD_DIR" >/dev/null

if [ -z ${VERILATOR_INCLUDE_DIR+x} ]; then
    verilator --version >/dev/null 2>&1 || {
        echo >&2 "VERILATOR_INCLUDE_DIR not set.  Aborting."
        exit 1
    }
    VERILATOR_INCLUDE_DIR="$(realpath "$(dirname "$(which verilator)")"/../share/verilator/include)"
    [ -d "$VERILATOR_INCLUDE_DIR" ] || {
        echo >&2 "VERILATOR_INCLUDE_DIR not a directory.  Aborting."
        exit 1
    }
    declare -rx VERILATOR_INCLUDE_DIR
fi

# Rust tests.
cargo test --manifest-path $SCRIPT_DIR/rust/Cargo.toml -- --nocapture

# Racket tests.
#
# We could use the -j flag of raco test to run tests in parallel, but instead,
# we expect every test to parallelize itself if needed. We get more value out of
# parallelizing individual tests (like how we use make to parallelize Verilation
# in end-to-end builds), and multiple levels of parallelization would probably
# cause some thrashing.
#
# We also time the tests, as the Racket tests are the slowest part of the testing process.
for f in $SCRIPT_DIR/racket/*.rkt; do time raco test $f; done

# Integration tests.
source $SCRIPT_DIR/integration_tests/run.sh
