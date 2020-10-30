#!/bin/bash

DIR=$(dirname $0)

docker build "$@" --file $DIR/DockerfileBase --tag esa-prl/rock-base:20 $DIR && \
docker build "$@" --file $DIR/DockerfileRover --tag esa-prl/rock-rover:20 $DIR && \
docker build "$@" --file $DIR/DockerfileExoter --tag esa-prl/rock-exoter:20 $DIR
