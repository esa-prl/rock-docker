#!/bin/bash

DIR=$(dirname $0)

docker build "$@" --file $DIR/DockerfileBase --tag esa-prl/rock-base:20 $DIR && \
docker build "$@" --file $DIR/DockerfileCore --tag esa-prl/rock-core:20 $DIR
