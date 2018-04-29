#!/bin/sh

SRC_DIR=/home/joerg/Development/C-Cpp-Src/poco
BUILD_DIR=/home/data/Build

rm -rf $BUILD_DIR/poco-docker-hunter && mkdir $BUILD_DIR/poco-docker-hunter && docker run --rm -i -t -v $SRC_DIR:/src -v $BUILD_DIR:/build ubuntu-build:1.0 /src/build-poco-hunter.sh 2>&1 | tee $BUILD_DIR/poco-docker-hunter/build.log
