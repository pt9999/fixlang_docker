#!/bin/bash

set -ex

time docker build . -t pt9999/fixlang --progress plain 2>&1 | tee build.log

