#!/bin/sh

SRC_DIR=poco
BUILD_DIR=/home/jboehme/Build

rm -rf $BUILD_DIR/poco-docker-android && mkdir $BUILD_DIR/poco-docker-android && docker run --rm -i -t -v $SRC_DIR:/src -v $BUILD_DIR:/build ubuntu-build-android:1.0 /src/build-poco-android.sh 2>&1 | tee $BUILD_DIR/poco-docker-android/build.log
