# Vidcutter Dockerized
Running vidcutter inside a docker container.

This implementation uses nvidias docker runtime for hw accel.
so get this stuff working.

- [Nvidia Docker] (https://github.com/NVIDIA/nvidia-docker/).
- [Nvidia Docker howto] (https://github.com/NVIDIA/nvidia-docker/wiki/Frequently-Asked-Questions#which-docker-packages-are-supported).
- [Upstream docker engine] (https://docs.docker.com/engine/install/debian/).


## Just run it
Going to put it on dockerhub.

`docker pull justinhop/vidcutter`

then continue, the docker run command is pretty long so check out `run.sh`.

## Notes
I have only tested on Ubuntu 20.04.

You should probably update the username and home paths.

TODO: strip container down to size.

