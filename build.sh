#!/bin/bash

set -euo pipefail

DATE=$(date +%F)
TAG=justinhop/vidcutter

docker build -t $TAG:latest -t $TAG:$DATE .
