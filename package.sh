#!/bin/sh
set -e 

PACKAGED_DIR="$HOME/.raptiformica.d/var/packaged/docker_32bit"
mkdir -p "$PACKAGED_DIR/images"
cd "$PACKAGED_DIR"

# make sure there is a checkout of the packaging code
if [ ! -d raptiformica-docker-32bit ]; then
    git clone --recursive https://github.com/vdloo/raptiformica-docker-32bit
else
    cd raptiformica-docker-32bit
    git clean -xfd
    git reset --hard origin/master
    git pull origin master
    cd ..
fi

LOG_FILE="/tmp/$(uuidgen)"

# Provision the box
PYTHONPATH=/usr/etc/raptiformica /usr/etc/raptiformica/bin/raptiformica_spawn.py --compute-type docker_32bit --no-assimilate | tee $LOG_FILE

MACHINE_UUID=$(grep .raptiformica.d/var/machines/docker_32bbit/headless/ $LOG_FILE  | head -n 1 | rev | cut -d '/' -f1 | rev)

# Change dir to the new check out
cd $HOME/.raptiformica.d/var/machines/docker_32bit/headless/$MACHINE_UUID/

# Do not save an IP address in the packaged box
sudo docker exec $(cat container_id) rm -f /etc/cjdroute.conf

# Update the saved base image
sudo docker commit $(cat container_id) raptiformica-baseimage

# Clean up
cd "$PACKAGED_DIR"
PYTHONPATH=raptiformica raptiformica/bin/raptiformica_prune.py

