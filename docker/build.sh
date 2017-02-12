#!/bin/bash
set -euo pipefail

# constants
HERE="$(dirname "$(readlink -f "$0")")"
TOP="$(dirname "$HERE")"
IMAGE=dont.push.me/idea-factory/build:"$USER"

set -x
cd "$HERE"
docker build -t "$IMAGE" ./build/
docker run -v $TOP:/code "$IMAGE" yarn add milligram
