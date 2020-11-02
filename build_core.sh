#!/bin/bash

DIR=$(dirname $0)

docker build "$@" --file $DIR/base.dockerfile --tag esa-prl/rock-base $DIR && \
docker build "$@" --file $DIR/core.dockerfile --tag esa-prl/rock-core $DIR
