raptiformica-docker-32bit
========================

Plugin for [raptiformica](https://github.com/vdloo/raptiformica) to add a new compute type for booting 32 bit docker instances. 

The default raptiformica docker compute type uses [baseimage-docker](https://github.com/phusion/baseimage-docker) to start a fat container. But since it is 64 bit only, it will not work on 32 bit machines like those with a i386 or i686 processor. This plugin builds [this 32 bit fork](https://github.com/vdloo/baseimage-docker-32bit) of the baseimage-docker image and uses that as the base image.

## Installation

To install the module
```
raptiformica modprobe vdloo/raptiformica-docker-32bit
```

