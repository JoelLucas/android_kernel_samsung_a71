#!/bin/bash

DEFCONFIG=$1
JOB=$2

# Declare your CLANG n GCC Location HERE!
CLANG_PATH=~/android/clang/linux-x86/clang-r353983c
GCC_PATH=~/android/gcc/aarch64-linux-android-4.9

export ANDROID_MAJOR_VERSION=q

/usr/bin/ccache make O=out ARCH=arm64 $DEFCONFIG

PATH="$CLANG_PATH/bin:$GCC_PATH/bin:${PATH}" \
                      /usr/bin/ccache make -j$2 O=out \
                      ARCH=arm64 \
                      CC=clang \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE=aarch64-linux-android-
