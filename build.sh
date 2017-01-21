#!/bin/sh
set -e 

# Clone the 32 bit baseimage fork
BUILD_DIR="/tmp/$(uuidgen)"
mkdir -p $BUILD_DIR
cd $BUILD_DIR
git clone https://github.com/vdloo/baseimage-docker-32bit
cd baseimage-docker-32bit/image

# Build the 32 bit Ubuntu base image
sudo docker build -t vdloo/i386-baseimage .
