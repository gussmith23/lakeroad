#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Run all examples in ./examples
for example in "$SCRIPT_DIR/examples"/*; do
  echo "Running example $example"
  "$example"
done