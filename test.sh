set -e

# Figure out where this script resides and its name.
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P)"

echo -e "[info] removing $SCRIPTDIR/tmp/test-data directory"
rm -rf "$SCRIPTDIR"/tmp/test-*
echo -e '[info] linting'
source "$SCRIPTDIR"/tests/lint.source.sh
echo -e "[info] making fresh $SCRIPTDIR/tmp/test-data directory"
mkdir -p "$SCRIPTDIR"/tmp/test-data

echo -e "[info] copying sample php code"
cp "$SCRIPTDIR"/sample-code/sample-001/* "$SCRIPTDIR"/tmp/test-data

echo -e "[info] running metrics on sample code"
"$SCRIPTDIR"/dcycle-metrics-engine.sh "$SCRIPTDIR"/tmp/test-data "$SCRIPTDIR"/tmp/test-metrics

echo -e "[info] $SCRIPTDIR/tmp/test-metrics/metrics/raw-xml should now contain metrics"
cat "$SCRIPTDIR"/tmp/test-metrics/metrics/raw-xml/*xml
grep "Else is never necessary" < "$SCRIPTDIR"/tmp/test-metrics/metrics/raw-xml/cleancode.xml
cat "$SCRIPTDIR"/tmp/test-metrics/metrics/raw-xml/codesize.xml
grep "The class whatever is not named in CamelCase" < "$SCRIPTDIR"/tmp/test-metrics/metrics/raw-xml/controversial.xml
cat "$SCRIPTDIR"/tmp/test-metrics/metrics/raw-xml/design.xml
grep "Configured minimum length is 3" < "$SCRIPTDIR"/tmp/test-metrics/metrics/raw-xml/naming.xml
cat "$SCRIPTDIR"/tmp/test-metrics/metrics/raw-xml/unusedcode.xml

echo -e "[info] cleaning up"
rm -rf "$SCRIPTDIR"/tmp/test-*
