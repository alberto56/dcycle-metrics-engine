set -e

./dcycle-metrics-engine.sh metrics --source=tests/sample-code/sample-001 --destination=tmp/test-metrics

cat tmp/test-metrics/metrics/raw/pdepend/summary-xml.xml |grep lloc
cat tmp/test-metrics/metrics/raw/phpcpd/phpcpd.xml |grep duplication
