#!/bin/sh
set -e

. /Users/admin/Desktop/Projekte/_helpers/toolchains/use-gcc10.sh

VCGLIB="vendor/vcglib"

mkdir -p build

g++ -std=c++17 $LEOPARD_GCC10_STATIC_FLAGS \
    -DEIGEN_DONT_VECTORIZE \
    -DEIGEN_DONT_ALIGN_STATICALLY \
    -DEIGEN_MAX_ALIGN_BYTES=0 \
    -I"$VCGLIB" \
    -I"$VCGLIB/eigenlib" \
    src/vcg_minimal_probe.cpp \
    -o build/vcg_minimal_probe

echo "Built build/vcg_minimal_probe"
./build/vcg_minimal_probe
otool -L build/vcg_minimal_probe
