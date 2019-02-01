from ubuntu:16.04

env DEBIAN_FRONTEND=noninteractive

# prevent 'modprobe pcan' in drivers.autobuild from being run
env RUNNING_IN_DOCKER='true'

# TODO: something similar to
#env AUTOPROJ_BOOTSTRAP_IGNORE_NONEMPTY_DIR=1

# apt-get: proxy settings, update, upgrade, install dependencies
run echo "Acquire::http::Pipeline-Depth '0';\nAcquire::http::No-Cache=True;\nAcquire::BrokenProxy=true;" > /etc/apt/apt.conf.d/99fixbadproxy
run apt-get clean && apt-get update --fix-missing &&\
    apt-get install -y \
    apt-utils \
    ruby \
    ruby-dev \
    wget \
    sudo \
    build-essential \
    git \
    libapr1-dev \
    autoconf \
    libtool \
    libssl-dev \
    libpopt-dev \
    libpng++-dev \
    linux-headers-$(uname -r) \
    vim &&\
    apt-get autoremove
# libapr1-dev, autoconf, and libtool are necessary for activeMQ
# libpopt-dev is necessary for libpcan (pcan_pcie_mini)
# linux headers provide ..linux/version.h needed during pcan installation

# create and switch to non-root user in sudoers group
run adduser --disabled-password --gecos '' user &&\
    adduser user sudo &&\
    echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
user user
run mkdir -p /home/user/rock
workdir /home/user/rock

# apply dummy git config, needed during bootstrap
run git config --global user.name "a b" && git config --global user.email "a@b.c"

# download and run bootstrap
copy bootstrap.sh config.yml /home/user/rock/
run yes yes | sh ./bootstrap.sh

# compile all packages
run bash -c ". env.sh && amake"
