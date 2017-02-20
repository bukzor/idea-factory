#!/bin/bash
# to be sourced by */run scripts
set -euo pipefail

set -x
# constants
THIS="$(readlink -f "${BASH_SOURCE[0]}")"
TOP="$(dirname "$(dirname "$THIS")")"


docker-build() {
    CONTEXT="$1"
    NAME="$(basename "$CONTEXT")"
    IMAGE=dont.push.me/idea-factory/"$NAME":"$USER"

    # state
    set -x
    cd "$CONTEXT"

    ./Dockerfile.sh > Dockerfile
    docker build --tag "$IMAGE" .
    rm Dockerfile
}

docker-run() {
    docker run -it \
        -e SSH_AUTH_SOCK \
        -v "$SSH_AUTH_SOCK:$SSH_AUTH_SOCK" \
        -v "$HOME:/home/coder" \
        -v "$TOP:/opt/code" \
        "$@"
}


set -x
