#!/bin/bash
# to be sourced by */run scripts
set -euo pipefail

# constants
TOP="$(dirname "$(dirname "$CONTEXT")")"
NAME="$(basename "$CONTEXT")"
IMAGE=dont.push.me/idea-factory/"$NAME":"$USER"

# state
set -x
cd "$CONTEXT"

./Dockerfile.sh > Dockerfile
docker build --tag "$IMAGE" .
rm Dockerfile
