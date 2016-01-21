#!/bin/bash
set -e

header() {
  echo "================================================================================"
  echo $@ | sed  -e :a -e 's/^.\{1,77\}$/ & /;ta'
  echo "================================================================================"

}
header "Starting up..."

header "Resolving the configuration..."

# Resolving the configuration from the config service
TMP=`tempfile`
curl --silent http://configs:8888/frontend-${ENVIRONMENT}.properties > $TMP
while read LINE; do
    VAR=`echo $LINE | cut -d ':' -f 1`
    VAL=`echo $LINE | cut -d ' ' -f 2`
    export $VAR=$VAL
done < $TMP
rm -fr $TMP

header "Running the application"
#Start the application
./poc/randnum-svc
