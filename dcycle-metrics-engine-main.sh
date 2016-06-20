#!/bin/bash

set -e

# Figure out where this script resides and its name.
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P)"
CODE="$1"
METRICS="$2"
RUNID="$3"

if [ ! -d "$SCRIPTDIR/tmp/$RUNID" ]; then
  echo '[error] Please do not call ./dcycle-metrics-engine-main.sh directly; rather, call ./dcycle-metrics-engine.sh'
  exit 1;
fi

WORKING="$SCRIPTDIR/tmp/$RUNID/code"
cp -r "$CODE" "$WORKING"
cp "$SCRIPTDIR/Dockerfile-phpmd" "$WORKING/Dockerfile-phpmd"
LOCALMETRICS="tmp/$RUNID/metrics"
LOCALMETRICSFULL="$WORKING/$LOCALMETRICS"
mkdir -p "$LOCALMETRICSFULL"

cd "$WORKING" && docker build -f Dockerfile-phpmd -t "$RUNID" .
cd "$WORKING" && docker run --name "$RUNID" "$RUNID"

cd "$WORKING" && docker cp "$RUNID":/metrics "$LOCALMETRICSFULL"

echo -e "[info] $LOCALMETRICSFULL/metrics/raw-xml should now contain xml files."
echo -e "[info] They will be converted to CSV files."

cp -r "$LOCALMETRICSFULL" "$METRICS"
