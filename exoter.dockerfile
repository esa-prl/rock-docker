from esa-prl/rock-rover

# prevent 'modprobe pcan' in drivers.autobuild from being run
env RUNNING_IN_DOCKER 'true'

env AUTOPROJ_BOOTSTRAP_IGNORE_NONEMPTY_DIR 1

# install linux headers needed during pcan installation
run sudo apt-get update &&\
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y linux-headers-$(uname -r) &&\
    sudo apt-get autoremove

run bash -c "sed -i 's/# - github: esa-prl\/exoter/- github: esa-prl\/exoter/g' autoproj/manifest" &&\
    bash -c "sed -i 's/# - exoter/- exoter/g' autoproj/manifest"

# compile all packages
run bash -c ". env.sh && aup && amake"
