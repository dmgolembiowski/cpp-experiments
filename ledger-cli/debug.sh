#!/bin/bash

BUILD_TYPE="debug"
REL_ROOT="$(pwd)"

mkdir -p ./target/{debug,release}/

INSTALL_DIR="$REL_ROOT/target/$BUILD_TYPE"

mkdir build
pushd build

ctest -C Release &
wait $!

cmake .. -DCMAKE_INSTALL_PREFIX="$INSTALL_DIR"
cmake --build . --target install
