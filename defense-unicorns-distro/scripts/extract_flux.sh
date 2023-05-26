#!/bin/bash

# Check if the runtime environment is Darwin (Mac OS X), Linux, or Windows
if [[ "$OSTYPE" == "darwin"* ]]; then
  ARCH_NAME=darwin
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  ARCH_NAME=linux
elif [[ "$OSTYPE" == "msys" ]]; then
  ARCH_NAME=windows
elif [[ "$OSTYPE" == "cygwin" ]]; then
  ARCH_NAME=windows
else
  echo "The OS is not supported"
  exit 1
fi

# Check the processor architecture
if [[ $(uname -m) == "x86_64" ]]; then
  ARCH_PROC=amd64
elif [[ $(uname -m) == "i686" || $(uname -m) == "i386" ]]; then
  echo "The processor architecture is 32-bit and not supported"
  exit 1
elif [[ $(uname -m) == "arm64" ]]; then
  ARCH_PROC=arm64
else
  # Default to amd64
  ARCH_PROC=amd64
fi

# Extract the correct Flux binary
mkdir -p run/flux
if [[ $ARCH_NAME == "windows" ]]; then
  # Windows Flux artifacts are zip files
  unzip -o -q tmp/flux_${1}_${ARCH_NAME}_${ARCH_PROC}.zip -d run/flux
else
  tar -zxf tmp/flux_${1}_${ARCH_NAME}_${ARCH_PROC}.tar.gz -C run/flux
fi
