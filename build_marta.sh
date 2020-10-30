#!/bin/bash

DIR=$(dirname $0)

docker build "$@" --file $DIR/DockerfileBase --tag esa-prl/rock-base:20 $DIR && \
docker build "$@" --file $DIR/DockerfileRover --tag esa-prl/rock-rover:20 $DIR && \
docker build "$@" --file $DIR/DockerfileMarta --tag esa-prl/rock-marta:20 $DIR
