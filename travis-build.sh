#!/bin/bash
EXIT_STATUS=0

./gradlew --stop


./gradlew test -no-daemon -x grails2-plugin:test -x gorm-neo4j-spring-boot:test  || EXIT_STATUS=$?
if [[ $EXIT_STATUS -eq 0 ]]; then
    ./gradlew grails2-plugin:test -no-daemon || EXIT_STATUS=$?
fi
if [[ $EXIT_STATUS -eq 0 ]]; then 
    ./gradlew gorm-neo4j-spring-boot:test -no-daemon || EXIT_STATUS=$?
fi

./gradlew --stop

if [[ $EXIT_STATUS -eq 0 ]]; then
    ./travis-publish.sh || EXIT_STATUS=$?
fi

exit $EXIT_STATUS



