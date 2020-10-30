#!/bin/bash

DIR=$(dirname $0)

docker build "$@" --file $DIR/DockerfileBase --tag esa-prl/rock-base:20 $DIR && \
docker build "$@" --file $DIR/DockerfileRover --tag esa-prl/rock-rover:20 $DIR && \
docker build "$@" --file $DIR/DockerfileHdpr --tag esa-prl/rock-hdpr:20 $DIR
