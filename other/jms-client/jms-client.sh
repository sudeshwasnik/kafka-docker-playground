#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
source ${DIR}/../../scripts/utils.sh

${DIR}/../../environment/plaintext/start.sh "${PWD}/docker-compose.plaintext.yml" -a -b


log "Sending messages to topic test-queue using JMS client"
docker exec -e BOOTSTRAP_SERVERS="broker:9092" -e ZOOKEEPER_CONNECT="zookeeper:2181" jms-client bash -c "java -jar jms-client-1.0.0-jar-with-dependencies.jar"