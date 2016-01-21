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
curl --silent http://configs/frontend-${ENVIRONMENT}.properties > $TMP
if [ $? -ne 0 ]; then
  echo "Couldn't fetch the config.
  exit 1
fi
echo "Environment: "
while read LINE; do
    VAR=`echo $LINE | cut -d ':' -f 1`
    VAL=`echo $LINE | cut -d ' ' -f 2`
    export $VAR=$VAL
    echo "$VAR=$VAL"
done < $TMP
echo "-----"

rm -fr $TMP

header "Running the application"
#Start the application
./poc/randnum-svc
