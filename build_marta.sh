#!/bin/bash

DIR=$(dirname $0)

docker build "$@" --file $DIR/DockerfileBase --tag esa-prl/rock-base $DIR && \
docker build "$@" --file $DIR/DockerfileRover --tag esa-prl/rock-rover $DIR && \
docker build "$@" --file $DIR/DockerfileMarta --tag esa-prl/rock-marta $DIR
