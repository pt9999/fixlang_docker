#!/bin/bash

set -ex

(cd llvmenv && ./build.sh)
(cd fixlang && ./build.sh)
(cd fixlang_minilib && ./build.sh)

