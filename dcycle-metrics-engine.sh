#!/bin/bash
# we are purposefully not propagating errors, because we want to intercept the
# error code and perform cleanup regardless of the error code.

# Figure out where this script resides and its name.
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P)"
RUNID=$("$SCRIPTDIR/lib/uuid.sh")
mkdir "$SCRIPTDIR/tmp/$RUNID"
"$SCRIPTDIR/dcycle-metrics-engine-main.sh" "$1" "$2" "$RUNID"
EXITCODE=$?

rm -rf "$SCRIPTDIR/tmp/$RUNID"
docker kill "$RUNID" > /dev/null 2> /dev/null || true
docker rm "$RUNID" > /dev/null 2> /dev/null || true

exit "$EXITCODE"
