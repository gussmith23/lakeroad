#!/usr/bin/env bash

set -e
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
raco fmt -i "$SCRIPT_DIR"/racket/*.rkt
raco fmt -i "$SCRIPT_DIR"/bin/*.rkt
cargo fmt --manifest-path "$SCRIPT_DIR"/rust/Cargo.toml
