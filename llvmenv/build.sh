#!/bin/bash

set -ex

time nice docker build . -t pt9999/llvmenv:12.0.1-jammy --progress plain 2>&1 | tee build.log

