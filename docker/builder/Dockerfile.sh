#!/bin/sh
cat <<EOF
# our environment in which we build our files

FROM dont.push.me/idea-factory/base:$USER

# the very basics
RUN docker-apt-install \
    curl \
    ca-certificates \
    apt-transport-https \

# any non-default deb repositories:
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN sudo apt-get update

# the build tools we'll use directly
RUN docker-apt-install \
    make \
    nodejs \
    yarn
EOF
