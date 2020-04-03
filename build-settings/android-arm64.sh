#!/bin/sh -x

SRC_DIR=/source/poco
BUILD_DIR=~/poco-docker-android

rm -fr $BUILD_DIR

chmod 755 $ANDROID_HOME/tools/bin/sdkmanager
$ANDROID_HOME/tools/bin/sdkmanager --list
$ANDROID_HOME/emulator/emulator -list-avds
$ANDROID_HOME/emulator/emulator -avd android-arm64-24-test -no-audio -no-window -dns-server 8.8.8.8 &

cmake -H$SRC_DIR -B$BUILD_DIR -G'Ninja' \
  -DANDROID_ABI=arm64-v8a \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_TOOLCHAIN_FILE=$ANDROID_HOME/ndk/19.2.5345600/build/cmake/android.toolchain.cmake \
  -DANDROID_PLATFORM=android-24 \
  -DANDROID_STL="c++_static" \
  -DANDROID_CPP_FEATURES="exceptions rtti" \
  -DENABLE_TESTS=ON \
  -DENABLE_LONG_RUNNING_TESTS=OFF \
  -DOLD_REDIS_VERSION=ON && \
cmake --build $BUILD_DIR --target all && cd $BUILD_DIR && POCO_BASE=$SRC_DIR ctest -E Foundation --output-on-failure
