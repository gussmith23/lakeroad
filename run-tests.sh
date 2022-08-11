set -e

cargo test --manifest-path rust/Cargo.toml -- --nocapture
bash -c 'raco test -j `nproc` racket/*.rkt'
source utils/tests/run-tests.sh
