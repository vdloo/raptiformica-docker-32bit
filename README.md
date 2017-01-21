raptiformica-docker-32bit
========================

Plugin for [raptiformica](https://github.com/vdloo/raptiformica) to add a new compute type for booting 32 bit docker instances. 

The default raptiformica docker compute type uses [baseimage-docker](https://github.com/phusion/baseimage-docker) to start a fat container. But since it is 64 bit only, it will not work on 32 bit machines like those with a i386 or i686 processor. This plugin builds [this 32 bit fork](https://github.com/vdloo/baseimage-docker-32bit) of the baseimage-docker image and uses that as the base image.

## Installation

To install the module
```
raptiformica modprobe vdloo/raptiformica-docker-32bit
```

Example:
```
[vdloo@i686host ~]$ raptiformica spawn --help
You need to have at least one available type configured for compute. 
Do you have the required dependencies installed? Check your config file
[vdloo@i686host ~]$ raptiformica modprobe vdloo/raptiformica-docker-32bit
Checking out vdloo/raptiformica-docker-32bit
Cloning https://github.com/vdloo/raptiformica-docker-32bit to /home/vdloo/.raptiformica.d/modules/raptiformica-docker-32bit
[vdloo@i686host ~]$ raptiformica spawn --help
...
  --compute-type {docker_32bit}
                        Specify a compute type. Default is docker_32bit
...
```
