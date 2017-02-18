#!/bin/sh
cat <<EOF
# our environment in which we build our files

FROM dont.push.me/idea-factory/base:$USER

# the very basics
RUN sudo apt-get update
RUN DEBIAN_FRONTEND=noninteractive sudo apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    apt-transport-https \
&& true

# any non-default deb repositories:
RUN wget -O- https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    sudo apt-get update \
&& true

# the stuff we'll use directly
RUN DEBIAN_FRONTEND=noninteractive sudo apt-get install -y --no-install-recommends \
    make \
    nodejs \
    yarn \
&& true

WORKDIR /opt/code
EOF
