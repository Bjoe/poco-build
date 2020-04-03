#!/bin/sh

SRC_DIR=/src/poco
BUILD_DIR=$HOME/poco-docker

set -x

cmake -H$SRC_DIR -B$BUILD_DIR -GNinja -DENABLE_PDF=OFF -DENABLE_TESTS=ON && cmake --build $BUILD_DIR --target all

/bin/bash