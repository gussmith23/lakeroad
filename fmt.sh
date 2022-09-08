#!/usr/bin/env bash

set -e
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
raco fmt -i $(find "$SCRIPT_DIR"/racket -name "*.rkt")
cargo fmt --manifest-path "$SCRIPT_DIR"/rust/Cargo.toml
