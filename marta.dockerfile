from esa-prl/rock-rover

# prevent 'modprobe pcan' in drivers.autobuild from being run
env RUNNING_IN_DOCKER 'true'

env AUTOPROJ_BOOTSTRAP_IGNORE_NONEMPTY_DIR 1

# update package index
run sudo apt-get update

run bash -c "sed -i 's/# - github: esa-prl\/marta/- github: esa-prl\/marta/g' autoproj/manifest" &&\
    bash -c "sed -i 's/# - marta/- marta/g' autoproj/manifest"

# compile all packages
run bash -c ". env.sh && aup && amake"
