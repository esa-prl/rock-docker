from ubuntu:18.04

arg DEBIAN_FRONTEND=noninteractive

env AUTOPROJ_BOOTSTRAP_IGNORE_NONEMPTY_DIR=1

# install necessary packages
run apt-get update --fix-missing &&\
    apt-get install -y \
    ruby-dev \
    wget \
    sudo \
    build-essential \
    git \
    vim &&\
    apt-get autoremove

# create and switch to non-root user in sudoers group
run adduser --disabled-password --gecos '' user &&\
    adduser user sudo &&\
    echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
user user

arg ROCK_DIR=/home/user/rock/

run mkdir -p /home/user/rock
workdir /home/user/rock

# apply dummy git config, needed during bootstrap
run git config --global user.name "a b" && git config --global user.email "a@b.c"
