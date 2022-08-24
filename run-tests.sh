set -e

cargo test --manifest-path rust/Cargo.toml -- --nocapture
# We could use the -j flag of raco test to run tests in parallel, but instead,
# we expect every test to parallelize itself if needed. We get more value out of
# parallelizing individual tests (like how we use make to parallelize Verilation
# in end-to-end builds), and multiple levels of parallelization would probably
# cause some thrashing.
bash -c 'raco test racket/*.rkt'
source utils/tests/run-tests.sh
pytest python/