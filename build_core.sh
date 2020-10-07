#!/bin/bash

DIR=$(dirname $0)

docker build "$@" --file $DIR/DockerfileBase --tag esa-prl/rock-base $DIR && \
docker build "$@" --file $DIR/DockerfileCore --tag esa-prl/rock-core $DIR
