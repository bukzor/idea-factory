#!/bin/sh
cat <<EOF
# our environment in which we build our files

FROM dont.push.me/idea-factory/base:$USER

# the very basics
RUN DEBIAN_FRONTEND=noninteractive sudo apt-get install -y --no-install-recommends \
    tmux \
    vim \
    man \
    less \
    git \
&& true

CMD tmux
EOF
