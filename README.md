Dcycle Metrics Engine
=====

Generates code metrics in these formats:

 * XML

Dependencies
-----

 * Docker

Usage
-----

    cd ./dcycle-metrics-engine
    ./dcycle-metrics-engine.sh /path/to/repo /path/to/metrics
    cat /path/to/metrics/metrics/raw-xml/*xml

Testing
-----

    ./test.sh

Continuous integration
-----

Travis CI is used for automated tests. Build status is:

[![Build Status](https://travis-ci.org/alberto56/dcycle-metrics-engine.svg?branch=master)](https://travis-ci.org/alberto56/dcycle-metrics-engine)
