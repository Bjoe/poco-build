#!/bin/sh -x

SRC_DIR=/src
BUILD_DIR=/build/poco-docker-android
#ANDROID_HOME=/opt/androidSdk

#sudo chmod 755 $ANDROID_HOME/tools/bin/avdmanager
#echo no | $ANDROID_HOME/tools/bin/avdmanager create avd -n test -k "system-images;android-24;default;armeabi-v7a"
$ANDROID_HOME/emulator/emulator -avd android-24-test -no-audio -no-window -dns-server 8.8.8.8 &

$ANDROID_HOME/cmake/3.6.4111459/bin/cmake -H$SRC_DIR -B$BUILD_DIR -G'Android Gradle - Ninja' -DANDROID_ABI=armeabi-v7a -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=$ANDROID_HOME/ndk-bundle/build/cmake/android.toolchain.cmake -DANDROID_PLATFORM=android-19 -DCMAKE_MAKE_PROGRAM=$ANDROID_HOME/cmake/3.6.4111459/bin/ninja -DANDROID_STL="c++_static" -DANDROID_CPP_FEATURES="exceptions rtti" -DPOCO_ENABLE_TESTS=ON -DPOCO_ENABLE_LONG_RUNNING_TESTS=OFF -DPOCO_OLD_REDIS_VERSION=ON && \
#/usr/local/android-sdk/cmake/3.6.4111459/bin/cmake --build . --target all && travis_wait 30 /usr/local/android-sdk/cmake/3.6.4111459/bin/ctest --output-on-failure
#cmake -H$SRC_DIR -B$BUILD_DIR -GNinja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_VERBOSE_MAKEFILE=true -DCMAKE_C_COMPILER=clang-6.0 -DCMAKE_CXX_COMPILER=clang++-6.0 -DENABLE_PDF=OFF -DENABLE_TESTS=ON -DENABLE_SAMPLES=OFF -DPOCO_ENABLE_PDF=OFF -DPOCO_ENABLE_TESTS=ON -DPOCO_ENABLE_SAMPLES=OFF && \
#cmake -H$SRC_DIR -B$BUILD_DIR -GNinja -DCMAKE_C_COMPILER=gcc-5 -DCMAKE_CXX_COMPILER=g++-5 -DCMAKE_VERBOSE_MAKEFILE=true -DENABLE_PDF=OFF -DENABLE_TESTS=ON -DENABLE_SAMPLES=ON -DPOCO_ENABLE_PDF=OFF -DPOCO_ENABLE_TESTS=ON -DPOCO_ENABLE_SAMPLES=ON && \
#cmake -H$SRC_DIR -B$BUILD_DIR -GNinja -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_VERBOSE_MAKEFILE=true -DCMAKE_BUILD_TYPE=Debug -DENABLE_PDF=OFF -DENABLE_TESTS=ON -DENABLE_SAMPLES=ON -DPOCO_ENABLE_PDF=OFF -DPOCO_ENABLE_TESTS=ON -DPOCO_ENABLE_SAMPLES=ON --trace-expand && \
cmake --build $BUILD_DIR --target all && \
cd $BUILD_DIR && POCO_BASE=$SRC_DIR ctest --output-on-failure || \
/bin/bash
