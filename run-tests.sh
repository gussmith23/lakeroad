set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

LAKEROAD_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
declare -rx LAKEROAD_DIR

if [ -z ${LLVM_CONFIG+x} ]; then
    echo "LLVM_CONFIG is unset"
    exit 1
fi

pushd "$LAKEROAD_DIR" >/dev/null

# New Lakeroad egglog tests.
cargo test --manifest-path $SCRIPT_DIR/lakeroad-egglog/Cargo.toml -- --nocapture

# Old Lakeroad egg tests.
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

# Import Verilog to Racket and ensure that nothing changed. This is a somewhat
# hacky way to ensure that the bitvector semantics used by Lakeroad are true to
# the semantics produced by the current version of bin/verilog_to_racket.py,
# while also not having to have tests tests that duplicate the contents of the
# files in racket/generated/.
./import_all_primitives.sh
[ -z "$(git status --porcelain)" ] || {
    echo >&2 "Error: files differ after re-importing Verilog to Racket:"
    git status >&2
    exit 1
}
