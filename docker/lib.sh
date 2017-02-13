# common code for the docker/*/build scripts
set -euo pipefail

# constants
NAME="$(basename "$HERE")"
TOP="$(dirname "$(dirname "$HERE")")"
IMAGE=dont.push.me/idea-factory/"$NAME":"$USER"

# functions
build() {
    exec docker build \
        --tag "$IMAGE" \
        --build-arg UID=$(id -u) \
        --build-arg GID=$(id -g) \
        .
}

# state
set -x
cd "$HERE"
