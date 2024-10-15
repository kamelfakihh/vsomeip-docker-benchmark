#!/usr/bin/env bash
set -ev

rm -rf build
mkdir build
cd build
# cmake -DCMAKE_TOOLCHAIN_FILE=aarch64-linux-gnu-gcc-opi5b.cmake ..
cmake ..
make -j`nproc`