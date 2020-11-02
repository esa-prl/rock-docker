#!/bin/bash

DIR=$(dirname $0)

docker build "$@" --file $DIR/base.dockerfile --tag esa-prl/rock-base $DIR && \
docker build "$@" --file $DIR/rover.dockerfile --tag esa-prl/rock-rover $DIR && \
docker build "$@" --file $DIR/marta.dockerfile --tag esa-prl/rock-marta $DIR
