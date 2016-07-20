#!/bin/bash
EXIT_STATUS=0

./gradlew --stop


./gradlew check --refresh-dependencies -no-daemon -i || EXIT_STATUS=$?

./gradlew --stop

if [[ $EXIT_STATUS -eq 0 ]]; then
    ./travis-publish.sh || EXIT_STATUS=$?
fi

exit $EXIT_STATUS



