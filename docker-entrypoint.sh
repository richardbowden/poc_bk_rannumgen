#!/bin/bash
set -e

header() {
  echo "================================================================================"
  echo $@ | sed  -e :a -e 's/^.\{1,77\}$/ & /;ta'
  echo "================================================================================"

}

# TODO: Here we should resolve the configuration
export RANNUM_PORT=9090
#Start the application
./poc/randnum-svc