#!/bin/sh -x

SRC_DIR=/src/poco
BUILD_DIR=~/poco-docker

#cd $BUILD_DIR/bin && POCO_BASE=$SRC_DIR ./Foundation-testrunner SharedLibraryTestSuite

cmake -H$SRC_DIR -B$BUILD_DIR-debug-clang -GNinja -DCMAKE_C_COMPILER=clang-6.0 -DCMAKE_CXX_COMPILER=clang++-6.0 -DCMAKE_BUILD_TYPE=Debug -DPOCO_ENABLE_PDF=OFF -DPOCO_ENABLE_TESTS=ON -DPOCO_ENABLE_SAMPLES=ON && \
cmake --build $BUILD_DIR-debug-clang --target all && \
#
cmake -H$SRC_DIR -B$BUILD_DIR-debug-gcc -GNinja -DCMAKE_BUILD_TYPE=Debug -DPOCO_ENABLE_PDF=OFF -DPOCO_ENABLE_TESTS=ON -DPOCO_ENABLE_SAMPLES=ON && \
cmake --build $BUILD_DIR-debug-gcc --target all && \
#
cmake -H$SRC_DIR -B$BUILD_DIR-release-clang -GNinja -DCMAKE_C_COMPILER=clang-6.0 -DCMAKE_CXX_COMPILER=clang++-6.0 -DCMAKE_BUILD_TYPE=Release -DPOCO_ENABLE_PDF=OFF -DPOCO_ENABLE_TESTS=ON -DPOCO_ENABLE_SAMPLES=ON && \
cmake --build $BUILD_DIR-release-clang --target all && \
#
cmake -H$SRC_DIR -B$BUILD_DIR-release-gcc -GNinja -DCMAKE_BUILD_TYPE=Release -DPOCO_ENABLE_PDF=OFF -DPOCO_ENABLE_TESTS=ON -DPOCO_ENABLE_SAMPLES=ON && \
cmake --build $BUILD_DIR-release-gcc --target all && \
cd $BUILD_DIR-debug-clang && (POCO_BASE=$SRC_DIR ctest --output-on-failure || /bin/bash) && \
cd $BUILD_DIR-debug-gcc && (POCO_BASE=$SRC_DIR ctest --output-on-failure || /bin/bash) && \
cd $BUILD_DIR-release-clang && (POCO_BASE=$SRC_DIR ctest --output-on-failure || /bin/bash) && \
cd $BUILD_DIR-release-gcc && (POCO_BASE=$SRC_DIR ctest --output-on-failure || /bin/bash)
