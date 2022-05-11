set -e

cargo test --manifest-path rust/Cargo.toml -- --nocapture
bash -c 'raco test racket/*.rkt'
pytest --rootdir python/
