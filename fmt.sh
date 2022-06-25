set -e
raco fmt -i racket/*.rkt
cargo fmt --manifest-path rust/Cargo.toml
