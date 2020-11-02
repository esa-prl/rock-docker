from esa-prl/rock-base

env SHELL /bin/bash

# update package index
run sudo apt-get update

# download and run bootstrap
run wget -q https://raw.githubusercontent.com/esa-prl/buildconf/master/bootstrap.sh && \
    wget -q https://raw.githubusercontent.com/esa-prl/buildconf/master/config.yml
run yes "" | sh ./bootstrap.sh

# enable rover package set
run bash -c "sed -i 's/# - github: esa-prl\/rover/- github: esa-prl\/rover/g' autoproj/manifest" && \
    bash -c "sed -i 's/# - rover/- rover/g' autoproj/manifest"

# compile all packages
run bash -c ". env.sh && aup && amake"
