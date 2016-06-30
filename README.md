Dcycle Metrics Engine
=====

Generates code metrics from these providers:

 * [Pdepend](https://pdepend.org)
 * [PHP copy-paste detector](https://github.com/sebastianbergmann/phpcpd)
 * [PhpMD](https://phpmd.org)
 * [ShellCheck](https://github.com/koalaman/shellcheck)

And outputs metrics in these formats:

 * raw output from each provider

Dependencies
-----

 * Docker

Usage
-----

    cd ./dcycle-metrics-engine
    ./dcycle-metrics-engine.sh metrics --source=tests/sample-code/sample-001 --destination=tmp/test-metrics
    cat /path/to/metrics/metrics/raw/*/*xml

Testing
-----

    ./dcycle-metrics-engine.sh self-test

Continuous integration
-----

Travis CI is used for automated tests. Build status is:

[![Build Status](https://travis-ci.org/alberto56/dcycle-metrics-engine.svg?branch=master)](https://travis-ci.org/alberto56/dcycle-metrics-engine)
