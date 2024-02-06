#!/bin/bash

set -ex

time docker build . -t pt9999/llvmenv --progress plain 2>&1 | tee ,log

