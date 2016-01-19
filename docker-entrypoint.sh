#!/bin/bash
set -e

header() {
  echo "================================================================================"
  echo $@ | sed  -e :a -e 's/^.\{1,77\}$/ & /;ta'
  echo "================================================================================"

}
header "Starting up..."

header "Resolving the configuration..."
# TODO: Here we should resolve the configuration from the config service
export RANNUM_PORT=9090

header "Running the application"
#Start the application
./poc/randnum-svc