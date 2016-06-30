set -e

./dcycle-metrics-engine.sh metrics --source=tests/sample-code/sample-001 --destination=tmp/test-metrics

grep lloc < ./tmp/test-metrics/metrics/raw/pdepend/summary-xml.xml
grep duplication < ./tmp/test-metrics/metrics/raw/phpcpd/phpcpd.xml
