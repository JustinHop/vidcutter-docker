#!/bin/bash

#   Accepts a file or dir as arg
#

set -x

# \/ be aware of this \/
xhost +

TD="/opt"
USER_UID=$(id -u)
USER_HOME=/home/justin
IMAGE=justinhop/vidcutter

AARG=""

if [ -f "$1" ]; then
    WD="$(readlink -f $(dirname $1))"
    WF="$(basename $(readlink -f $1))"
    AARG="-v $WD:$TD --workdir=$TD"
    AAARG="$TD/$WF"
else
    AARG="-v $PWD:$TD --workdir=$TD"
fi

#DISPLAY=unix:0.0

docker run -it --rm \
    --runtime=nvidia \
    --gpus=all \
    -e NVIDIA_VISIBLE_DEVICES=all \
    -e NVIDIA_DRIVER_CAPABILITIES=all \
    --volume=$USER_HOME/.config/vidcutter:/opt/.config/vidcutter \
    --volume=/run/user/${USER_UID}/pulse:/run/user/${USER_UID}/pulse \
    --volume=/tmp/.X11-unix:/tmp/.X11-unix:rw \
    -e DISPLAY=$DISPLAY $AARG \
    $TAG:latest $WF
